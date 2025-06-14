<?php
require_once('./db.php');
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Credentials: true");
header("Content-Type: application/json; charset=UTF-8");

session_start();
$user_id = $_SESSION['user_id'] ?? null;

if (!$user_id) {
    echo json_encode(['status' => 'error', 'message' => 'Not authorized']);
    exit;
}

// Получаем последние 5 уведомлений
$sql = "SELECT id, message, is_read FROM notifications WHERE user_id = ? ORDER BY created_at DESC LIMIT 5";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $user_id);
$stmt->execute();
$result = $stmt->get_result();

$notifications = [];
$has_unread = false;

while ($row = $result->fetch_assoc()) {
    if ($row['is_read'] == 0) {
        $has_unread = true;
    }
    $notifications[] = $row;
}

echo json_encode([
    'status' => 'success',
    'notifications' => $notifications,
    'has_unread' => $has_unread
]);