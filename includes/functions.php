<?php

// Validate password strength
function isStrongPassword($password) {
    // At least 8 characters
    if (strlen($password) < 8) {
        return false;
    }
    return true;
}

// Check if user is logged in
function isLoggedIn() {
    return isset($_SESSION['user_id']);
}

// Redirect to login if not authenticated
function requireLogin() {
    if (!isLoggedIn()) {
        header("Location: index.php");
        exit();
    }
}

// Sanitize input data
function sanitize($data) {
    return htmlspecialchars(strip_tags(trim($data)));
}

// Validate email
function isValidEmail($email) {
    return filter_var($email, FILTER_VALIDATE_EMAIL);
}

// Get user data by ID - CONVERTED TO PDO
function getUserById($pdo, $user_id) {
    $stmt = $pdo->prepare("SELECT id, first_name, last_name, email, created_at FROM users WHERE id = ?");
    $stmt->execute([$user_id]);
    return $stmt->fetch();
}

// Display flash messages
function setFlashMessage($message, $type = 'success') {
    $_SESSION['flash_message'] = $message;
    $_SESSION['flash_type'] = $type;
}

function displayFlashMessage() {
    if (isset($_SESSION['flash_message'])) {
        $message = $_SESSION['flash_message'];
        $type = $_SESSION['flash_type'];
        echo "<div class='alert alert-{$type}'>{$message}</div>";
        unset($_SESSION['flash_message']);
        unset($_SESSION['flash_type']);
    }
}
?>