<?php
require_once 'config.php';
require_once 'includes/db.php';
require_once 'includes/functions.php';

requireLogin();
$page_title = 'Product Insights';

// Get highest rated products
$stmt = $pdo->prepare("
    SELECT product_name, brand, rating, category,
        DATEDIFF(COALESCE(end_date, CURDATE()), start_date) as days_used
    FROM user_products
    WHERE user_id = ? AND rating IS NOT NULL
    ORDER BY rating DESC, days_used DESC
    LIMIT 5
");
$stmt->execute([$_SESSION['user_id']]);
$top_products = $stmt->fetchAll();
.
?>