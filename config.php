<?php
// Database Configuration
define('DB_HOST', 'localhost');
define('DB_USER', 'akua.amponsah');
define('DB_PASS', 'akua91105');
define('DB_NAME', 'webtech_2025A_akua_amponsah');

// Application Settings
define('SITE_URL', '/~akua.amponsah/luminelle');
define('UPLOAD_PATH', __DIR__ . '/assets/images/uploads/');
define('MAX_FILE_SIZE', 5242880); // 5MB in bytes

// Create PDO connection
try {
    $dsn = "mysql:host=" . DB_HOST . ";dbname=" . DB_NAME . ";charset=utf8mb4";
    $options = [
        PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
        PDO::ATTR_EMULATE_PREPARES   => false,
    ];
    
    $pdo = new PDO($dsn, DB_USER, DB_PASS, $options);
    
} catch (PDOException $e) {
    die("Database connection failed: " . $e->getMessage());
}

// Start session
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}
?>

