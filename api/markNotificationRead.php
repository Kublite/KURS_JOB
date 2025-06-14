<?php
require_once('./db.php');
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Credentials: true");
header("Content-Type: application/json; charset=UTF-8");
session_start();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $user_id = $_SESSION['user_id'] ?? null;
    $notif_id = $_POST['id'] ?? null;

    if (!$user_id || !$notif_id) {
        echo json_encode(['status' => 'error', 'message' => 'Недостаточно данных']);
        exit;
    }

    $sql = "UPDATE notifications SET is_read = 1 WHERE id = ? AND user_id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ii", $notif_id, $user_id);

    if ($stmt->execute()) {
        echo json_encode(['status' => 'success']);
    } else {
        echo json_encode(['status' => 'error', 'message' => 'Ошибка при обновлении']);
    }
} else {
    echo json_encode(['status' => 'error', 'message' => 'Неверный метод']);
}