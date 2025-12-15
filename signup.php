<?php
require_once 'config.php';
require_once 'includes/db.php';
require_once 'includes/functions.php';

// Redirect if already logged in
if (isLoggedIn()) {
    header("Location: dashboard.php");
    exit();
}

$error = '';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $first_name = sanitize($_POST['first_name']);
    $last_name = sanitize($_POST['last_name']);
    $email = sanitize($_POST['email']);
    $password = $_POST['password'];
    $confirm_password = $_POST['confirm_password'];

    // Validation
    if (empty($first_name) || empty($last_name) || empty($email) || empty($password)) {
        $error = 'Please fill in all fields';
    } elseif (!isValidEmail($email)) {
        $error = 'Please enter a valid email address';
    } elseif (strlen($password) < 8) {
        $error = 'Password must be at least 8 characters long';
    } elseif ($password !== $confirm_password) {
        $error = 'Passwords do not match';
    } else {
        // Check if email already exists
        $stmt = $pdo->prepare("SELECT id FROM users WHERE email = ?");
        $stmt->execute([$email]);

        if ($stmt->rowCount() > 0) {
            $error = 'Email already registered. <a href="index.php">Login here</a>';
        } else {
            // Hash password and insert user
            $hashed_password = password_hash($password, PASSWORD_DEFAULT);
            $stmt = $pdo->prepare("INSERT INTO users (first_name, last_name, email, password) VALUES (?, ?, ?, ?)");

            if ($stmt->execute([$first_name, $last_name, $email, $hashed_password])) {
                $_SESSION['signup_success'] = true;
                header("Location: index.php");
                exit();
            } else {
                $error = 'Something went wrong. Please try again.';
            }
        }
    }
}

$page_title = 'Sign Up';
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up - LuminElle</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        .password-strength {
            margin-top: 0.5rem;
            height: 4px;
            background: #e0e0e0;
            border-radius: 2px;
            overflow: hidden;
        }
        
        .password-strength-bar {
            height: 100%;
            width: 0%;
            transition: all 0.3s;
        }
        
        .strength-weak { background: #ff4444; width: 33%; }
        .strength-medium { background: #ffaa00; width: 66%; }
        .strength-strong { background: #00c851; width: 100%; }
        
        .password-requirements {
            margin-top: 0.5rem;
            font-size: 0.85rem;
        }
        
        .requirement {
            color: #999;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            margin-bottom: 0.25rem;
        }
        
        .requirement.met {
            color: #00c851;
        }
        
        .requirement .icon {
            font-size: 0.9rem;
        }
    </style>
</head>
<body class="auth-page">
    <div class="auth-container">
        <div class="auth-card">
            <div class="auth-header">
                <h1>✨ LuminElle</h1>
                <p>Join Your Skincare Journey</p>
            </div>
            
            <?php if ($error): ?>
                <div class="alert alert-error"><?php echo $error; ?></div>
            <?php endif; ?>
            
            <form method="POST" action="" class="auth-form" id="signupForm">
                <div class="form-row">
                    <div class="form-group">
                        <label for="first_name">First Name</label>
                        <input type="text" id="first_name" name="first_name" required value="<?php echo isset($_POST['first_name']) ? htmlspecialchars($_POST['first_name']) : ''; ?>" placeholder="First name">
                    </div>
                    
                    <div class="form-group">
                        <label for="last_name">Last Name</label>
                        <input type="text" id="last_name" name="last_name" required value="<?php echo isset($_POST['last_name']) ? htmlspecialchars($_POST['last_name']) : ''; ?>" placeholder="Last name">
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" required value="<?php echo isset($_POST['email']) ? htmlspecialchars($_POST['email']) : ''; ?>" placeholder="your.email@example.com">
                </div>
                
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" required placeholder="Create a strong password">
                    
                    <!-- Password Strength Indicator -->
                    <div class="password-strength">
                        <div class="password-strength-bar" id="strengthBar"></div>
                    </div>
                    
                    <!-- Password Requirements -->
                    <div class="password-requirements">
                        <div class="requirement" id="req-length">
                            <span class="icon">○</span>
                            <span>At least 8 characters</span>
                        </div>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="confirm_password">Confirm Password</label>
                    <input type="password" id="confirm_password" name="confirm_password" required placeholder="Re-enter password">
                    <small id="passwordMatch"></small>
                </div>
                
                <button type="submit" class="btn btn-primary btn-block" id="submitBtn">Create Account</button>
            </form>
            
            <div class="auth-footer">
                <p>Already have an account? <a href="index.php">Login here</a></p>
            </div>
        </div>
    </div>
    
    <script>
        const passwordInput = document.getElementById('password');
        const confirmPasswordInput = document.getElementById('confirm_password');
        const strengthBar = document.getElementById('strengthBar');
        const submitBtn = document.getElementById('submitBtn');
        const passwordMatch = document.getElementById('passwordMatch');
        
        const requirements = {length: { regex: /.{8,}/, element: document.getElementById('req-length') }};
        
        passwordInput.addEventListener('input', function() {
            const password = this.value;
            let metCount = 0;
            
            // Check each requirement
            for (let key in requirements) {
                const req = requirements[key];
                const isMet = req.regex.test(password);
                
                if (isMet) {
                    req.element.classList.add('met');
                    req.element.querySelector('.icon').textContent = '✓';
                    metCount++;
                } else {
                    req.element.classList.remove('met');
                    req.element.querySelector('.icon').textContent = '○';
                }
            }
            
            // Update strength bar
            strengthBar.className = 'password-strength-bar';
            if (password.length < 8) {
        strengthBar.classList.add('strength-weak');
        } else if (password.length < 12) {
        strengthBar.classList.add('strength-medium');
        } else {
        strengthBar.classList.add('strength-strong');
    }
            // Enable/disable submit button
            checkFormValidity();
        });
        
        confirmPasswordInput.addEventListener('input', function() {
            if (this.value === '') {
                passwordMatch.textContent = '';
                passwordMatch.style.color = '';
            } else if (this.value === passwordInput.value) {
                passwordMatch.textContent = '✓ Passwords match';
                passwordMatch.style.color = '#00c851';
            } else {
                passwordMatch.textContent = '✗ Passwords do not match';
                passwordMatch.style.color = '#ff4444';
            }
            checkFormValidity();
        });
        
        function checkFormValidity() {
            let allMet = true;
            for (let key in requirements) {
                if (!requirements[key].regex.test(passwordInput.value)) {
                    allMet = false;
                    break;
                }
            }
            
            const passwordsMatch = passwordInput.value === confirmPasswordInput.value && confirmPasswordInput.value !== '';
            
            submitBtn.disabled = !(allMet && passwordsMatch);
        }
    </script>
</body>
</html>