
<div class="product-card <?php echo $product['status'] != 'active' ? 'past-product' : ''; ?>">
    <div class="product-header">
        <div class="product-category-badge"><?php echo ucfirst($product['category']); ?></div>
        <?php if ($product['status'] != 'active'): ?>
            <div class="product-status-badge"><?php echo ucfirst($product['status']); ?></div>
        <?php endif; ?>
    </div>
    
    <h3 class="product-name"><?php echo htmlspecialchars($product['product_name']); ?></h3>
    <?php if ($product['brand']): ?>
        <p class="product-brand"><?php echo htmlspecialchars($product['brand']); ?></p>
    <?php endif; ?>
    
    <div class="product-info">
        <div class="info-item">
            <span class="info-label">Using since:</span>
            <span><?php echo date('M d, Y', strtotime($product['start_date'])); ?></span>
        </div>
        
        <?php if ($product['status'] != 'active' && $product['end_date']): ?>
            <div class="info-item">
                <span class="info-label">Stopped:</span>
                <span><?php echo date('M d, Y', strtotime($product['end_date'])); ?></span>
            </div>
        <?php endif; ?>
        
        <?php if ($product['notes']): ?>
            <div class="product-notes"><?php echo htmlspecialchars($product['notes']); ?></div>
        <?php endif; ?>
    </div>
    
    <!-- Rating -->
    <div class="product-rating">
        <form method="POST" action="" class="rating-form">
            <input type="hidden" name="action" value="rate">
            <input type="hidden" name="product_id" value="<?php echo $product['id']; ?>">
            <?php for ($i = 1; $i <= 5; $i++): ?>
                <button type="submit" name="rating" value="<?php echo $i; ?>" class="star-btn <?php echo ($product['rating'] && $i <= $product['rating']) ? 'active' : ''; ?>">
                    ★
                </button>
            <?php endfor; ?>
        </form>
    </div>
    
    <?php if ($product['status'] == 'active'): ?>
    <div class="product-actions">
        <form method="POST" action="" style="display: inline;">
            <input type="hidden" name="action" value="update_status">
            <input type="hidden" name="product_id" value="<?php echo $product['id']; ?>">
            <select name="status" onchange="this.form.submit()" class="status-select">
                <option value="active">Active</option>
                <option value="finished">Finished</option>
                <option value="discontinued">Discontinued</option>
            </select>
        </form>
    </div>
    <?php endif; ?>
</div>

<style>
.product-card {
    background: var(--white);
    border-radius: 15px;
    padding: 1.5rem;
    box-shadow: 0 5px 20px var(--shadow);
    transition: transform 0.3s;
}

.product-card:hover {
    transform: translateY(-3px);
}

.product-card.past-product {
    opacity: 0.7;
}

.product-header {
    display: flex;
    justify-content: space-between;
    margin-bottom: 1rem;
}

.product-category-badge {
    background: var(--baby-pink);
    color: var(--deep-pink);
    padding: 0.25rem 0.75rem;
    border-radius: 15px;
    font-size: 0.85rem;
    font-weight: 600;
}

.product-status-badge {
    background: var(--text-light);
    color: white;
    padding: 0.25rem 0.75rem;
    border-radius: 15px;
    font-size: 0.85rem;
}

.product-name {
    color: var(--deep-pink);
    font-size: 1.2rem;
    margin-bottom: 0.25rem;
}

.product-brand {
    color: var(--text-light);
    font-size: 0.9rem;
    margin-bottom: 1rem;
}

.product-info {
    margin: 1rem 0;
}

.info-item {
    display: flex;
    justify-content: space-between;
    margin-bottom: 0.5rem;
    font-size: 0.9rem;
}

.info-label {
    color: var(--text-light);
}

.product-notes {
    background: var(--light-pink);
    padding: 0.75rem;
    border-radius: 8px;
    font-size: 0.9rem;
    margin-top: 0.75rem;
    color: var(--text-dark);
}

.product-rating {
    text-align: center;
    margin: 1rem 0;
}

.rating-form {
    display: inline-flex;
    gap: 0.25rem;
}

.star-btn {
    background: none;
    border: none;
    font-size: 1.5rem;
    color: #ddd;
    cursor: pointer;
    transition: color 0.2s;
}

.star-btn:hover,
.star-btn.active {
    color: #FFD700;
}

.product-actions {
    margin-top: 1rem;
}

.status-select {
    width: 100%;
    padding: 0.5rem;
    border: 2px solid var(--border-color);
    border-radius: 8px;
    font-size: 0.9rem;
    cursor: pointer;
}
</style>