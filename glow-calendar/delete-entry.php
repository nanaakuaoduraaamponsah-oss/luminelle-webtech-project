<?php
require_once '../config.php';
require_once '../includes/db.php';
require_once '../includes/functions.php';

requireLogin();

$date = isset($_GET['date']) ? $_GET['date'] : '';

if (empty($date)) {
    header("Location: calendar.php");
    exit();
}

// Get entry to find photos
$stmt = $pdo->prepare("SELECT morning_photo, evening_photo FROM journal_entries WHERE user_id = ? AND entry_date = ?");
$stmt->execute([$_SESSION['user_id'], $date]);
$entry = $stmt->fetch();

if ($entry) {
    // Delete photos from filesystem
    if ($entry['morning_photo']) {
        $file_path = __DIR__ . '/../assets/images/uploads/' . $entry['morning_photo'];
        if (file_exists($file_path)) {
            unlink($file_path);
        }
    }
    if ($entry['evening_photo']) {
        $file_path = __DIR__ . '/../assets/images/uploads/' . $entry['evening_photo'];
        if (file_exists($file_path)) {
            unlink($file_path);
        }
    }
    
    // Delete entry from database
    $stmt = $pdo->prepare("DELETE FROM journal_entries WHERE user_id = ? AND entry_date = ?");
    $stmt->execute([$_SESSION['user_id'], $date]);
    
    setFlashMessage('Entry deleted successfully', 'success');
} else {
    setFlashMessage('Entry not found', 'error');
}

header("Location: calendar.php");
exit();
?>

