<?php
require_once '../config.php';
require_once '../includes/db.php';
require_once '../includes/functions.php';

requireLogin();

$date = isset($_GET['date']) ? $_GET['date'] : '';
$type = isset($_GET['type']) ? $_GET['type'] : '';

if (empty($date) || !in_array($type, ['morning', 'evening'])) {
    header("Location: calendar.php");
    exit();
}

// Get current entry
$stmt = $pdo->prepare("SELECT morning_photo, evening_photo FROM journal_entries WHERE user_id = ? AND entry_date = ?");
$stmt->execute([$_SESSION['user_id'], $date]);
$entry = $stmt->fetch();

if ($entry) {
    $photo_field = $type . '_photo';
    $photo_filename = $entry[$photo_field];
    
    if ($photo_filename) {
        // Delete file from filesystem
        $file_path = __DIR__ . '/../assets/images/uploads/' . $photo_filename;
        if (file_exists($file_path)) {
            unlink($file_path);
        }
        
        // Update database to remove photo reference
        $update_query = "UPDATE journal_entries SET {$photo_field} = NULL WHERE user_id = ? AND entry_date = ?";
        $stmt = $pdo->prepare($update_query);
        $stmt->execute([$_SESSION['user_id'], $date]);

        setFlashMessage('Photo deleted successfully', 'success');
    }
}

header("Location: add-entry.php?date=" . $date);
exit();
?>