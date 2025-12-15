<?php
require_once 'config.php';
require_once 'includes/db.php';
require_once 'includes/functions.php';

requireLogin();

$page_title = 'My Products';

// Handle product actions
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    if (isset($_POST['action'])) {
        if ($_POST['action'] == 'add') {
            $product_name = sanitize($_POST['product_name']);
            $brand = sanitize($_POST['brand']);
            $category = $_POST['category'];
            $routine_time = $_POST['routine_time'];
            $start_date = $_POST['start_date'];
            $notes = sanitize($_POST['notes']);
            
            $stmt = $pdo->prepare("INSERT INTO user_products (user_id, product_name, brand, category, routine_time, start_date, notes) VALUES (?, ?, ?, ?, ?, ?, ?)");
            if ($stmt->execute([$_SESSION['user_id'], $product_name, $brand, $category, $routine_time, $start_date, $notes])) {
                setFlashMessage('Product added successfully!', 'success');
            } else {
                setFlashMessage('Failed to add product', 'error');
            }
        } elseif ($_POST['action'] == 'update_status') {
            $product_id = intval($_POST['product_id']);
            $status = $_POST['status'];
            $end_date = ($status != 'active') ? date('Y-m-d') : null;
            
            $stmt = $pdo->prepare("UPDATE user_products SET status = ?, end_date = ? WHERE id = ? AND user_id = ?");
            $stmt->execute([$status, $end_date, $product_id, $_SESSION['user_id']]);
            setFlashMessage('Product status updated!', 'success');
        } elseif ($_POST['action'] == 'rate') {
            $product_id = intval($_POST['product_id']);
            $rating = intval($_POST['rating']);
            
            $stmt = $pdo->prepare("UPDATE user_products SET rating = ? WHERE id = ? AND user_id = ?");
            $stmt->execute([$rating, $product_id, $_SESSION['user_id']]);
            setFlashMessage('Rating saved!', 'success');
        }
        header("Location: my-products.php");
        exit();
    }
}

// Get all active products
$stmt = $pdo->prepare("SELECT * FROM user_products WHERE user_id = ? AND status = 'active' ORDER BY routine_time, category");
$stmt->execute([$_SESSION['user_id']]);
$active_products = $stmt->fetchAll();

// Get finished/discontinued products
$stmt = $pdo->prepare("SELECT * FROM user_products WHERE user_id = ? AND status != 'active' ORDER BY end_date DESC LIMIT 10");
$stmt->execute([$_SESSION['user_id']]);
$past_products = $stmt->fetchAll();

// Get product statistics
$stmt = $pdo->prepare("SELECT category, COUNT(*) as count FROM user_products WHERE user_id = ? AND status = 'active' GROUP BY category");
$stmt->execute([$_SESSION['user_id']]);
$category_stats = $stmt->fetchAll();

include 'includes/header.php';
?>

<div class="products-container">
    <div class="products-header">
        <h1>🧴 My Products</h1>
        <p>Track all the products in your skincare routine</p>
        <button class="btn btn-primary" onclick="openAddModal()">+ Add New Product</button>
    </div>
    
    <!-- Statistics -->
    <div class="stats-grid">
        <div class="stat-card">
            <div class="stat-number"><?php echo count($active_products); ?></div>
            <div class="stat-label">Active Products</div>
        </div>
        <div class="stat-card">
            <div class="stat-number"><?php echo count(array_filter($active_products, fn($p) => $p['routine_time'] == 'morning' || $p['routine_time'] == 'both')); ?></div>
            <div class="stat-label">Morning Routine</div>
        </div>
        <div class="stat-card">
            <div class="stat-number"><?php echo count(array_filter($active_products, fn($p) => $p['routine_time'] == 'evening' || $p['routine_time'] == 'both')); ?></div>
            <div class="stat-label">Evening Routine</div>
        </div>
    </div>
    
    <!-- Active Products by Routine Time -->
    <h2>🌅 Morning Routine</h2>
    <div class="products-grid">
        <?php 
        $morning_products = array_filter($active_products, fn($p) => $p['routine_time'] == 'morning' || $p['routine_time'] == 'both');
        if (empty($morning_products)): 
        ?>
            <p class="empty-message">No morning products added yet</p>
        <?php else: ?>
            <?php foreach ($morning_products as $product): ?>
                <?php include 'includes/product-card.php'; ?>
            <?php endforeach; ?>
        <?php endif; ?>
    </div>
    
    <h2>🌙 Evening Routine</h2>
    <div class="products-grid">
        <?php 
        $evening_products = array_filter($active_products, fn($p) => $p['routine_time'] == 'evening' || $p['routine_time'] == 'both');
        if (empty($evening_products)): 
        ?>
            <p class="empty-message">No evening products added yet</p>
        <?php else: ?>
            <?php foreach ($evening_products as $product): ?>
                <?php include 'includes/product-card.php'; ?>
            <?php endforeach; ?>
        <?php endif; ?>
    </div>
    
    <!-- Past Products -->
    <?php if (!empty($past_products)): ?>
    <h2>📦 Past Products</h2>
    <div class="products-grid">
        <?php foreach ($past_products as $product): ?>
            <?php include 'includes/product-card.php'; ?>
        <?php endforeach; ?>
    </div>
    <?php endif; ?>
</div>

<!-- Add Product Modal -->
<div id="addProductModal" class="modal">
    <div class="modal-content">
        <span class="modal-close" onclick="closeAddModal()">&times;</span>
        <h2>Add New Product</h2>
        <form method="POST" action="">
            <input type="hidden" name="action" value="add">
            
            <div class="form-group">
                <label for="product_name">Product Name *</label>
                <input type="text" id="product_name" name="product_name" required placeholder="e.g., Hydrating Face Wash">
            </div>
            
            <div class="form-group">
                <label for="brand">Brand</label>
                <input type="text" id="brand" name="brand" placeholder="e.g., CeraVe">
            </div>
            
            <div class="form-group">
                <label for="category">Category *</label>
                <select id="category" name="category" required>
                    <option value="">Select category</option>
                    <option value="cleanser">Cleanser</option>
                    <option value="toner">Toner</option>
                    <option value="serum">Serum</option>
                    <option value="moisturizer">Moisturizer</option>
                    <option value="sunscreen">Sunscreen</option>
                    <option value="treatment">Treatment</option>
                    <option value="mask">Mask</option>
                    <option value="other">Other</option>
                </select>
            </div>
            
            <div class="form-group">
                <label for="routine_time">When do you use it? *</label>
                <select id="routine_time" name="routine_time" required>
                    <option value="">Select time</option>
                    <option value="morning">Morning only</option>
                    <option value="evening">Evening only</option>
                    <option value="both">Both morning & evening</option>
                </select>
            </div>
            
            <div class="form-group">
                <label for="start_date">Start Date *</label>
                <input type="date" id="start_date" name="start_date" required value="<?php echo date('Y-m-d'); ?>">
            </div>
            
            <div class="form-group">
                <label for="notes">Notes (optional)</label>
                <textarea id="notes" name="notes" rows="3" placeholder="Why you're using this, what you hope to achieve, etc."></textarea>
            </div>
            
            <div class="modal-actions">
                <button type="submit" class="btn btn-primary">Add Product</button>
                <button type="button" class="btn btn-secondary" onclick="closeAddModal()">Cancel</button>
            </div>
        </form>
    </div>
</div>

<style>
.products-container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 2rem 0;
}

.products-header {
    text-align: center;
    margin-bottom: 3rem;
}

.products-header h1 {
    color: var(--bright-pink);
    font-size: 2.5rem;
    margin-bottom: 0.5rem;
}

.stats-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    gap: 1.5rem;
    margin-bottom: 3rem;
}

.stat-card {
    background: var(--white);
    border-radius: 15px;
    padding: 2rem;
    text-align: center;
    box-shadow: 0 5px 20px var(--shadow);
}

.stat-number {
    font-size: 3rem;
    font-weight: bold;
    color: var(--bright-pink);
}

.stat-label {
    color: var(--text-light);
    margin-top: 0.5rem;
}

.products-container h2 {
    color: var(--deep-pink);
    margin: 2rem 0 1rem;
    font-size: 1.5rem;
}

.products-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
    gap: 1.5rem;
    margin-bottom: 2rem;
}

.empty-message {
    color: var(--text-light);
    text-align: center;
    padding: 2rem;
    background: var(--light-pink);
    border-radius: 10px;
}

/* Modal Styles */
.modal {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.5);
    z-index: 1000;
    align-items: center;
    justify-content: center;
}

.modal.active {
    display: flex;
}

.modal-content {
    background: var(--white);
    border-radius: 20px;
    padding: 2rem;
    max-width: 500px;
    width: 90%;
    max-height: 90vh;
    overflow-y: auto;
    position: relative;
}

.modal-close {
    position: absolute;
    top: 1rem;
    right: 1.5rem;
    font-size: 2rem;
    cursor: pointer;
    color: var(--text-light);
}

.modal-actions {
    display: flex;
    gap: 1rem;
    margin-top: 1.5rem;
}

.modal-actions .btn {
    flex: 1;
}
</style>

<script>
function openAddModal() {
    document.getElementById('addProductModal').classList.add('active');
}

function closeAddModal() {
    document.getElementById('addProductModal').classList.remove('active');
}

// Close modal when clicking outside
window.onclick = function(event) {
    const modal = document.getElementById('addProductModal');
    if (event.target == modal) {
        closeAddModal();
    }
}
</script>

<?php include 'includes/footer.php'; ?>