<?php
require_once('./db.php');
require_once('./log.php');
require_once('./notify.php');
header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Credentials: true");
session_start();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $application_id = $_POST['application_id'] ?? null;
    $status = $_POST['status'] ?? null;

    if (!$application_id || !$status) {
        echo json_encode(['status' => 'error', 'message' => 'Missing data']);
        exit;
    }

    $sql = "UPDATE applications SET status = '$status' WHERE id = $application_id";

    if ($conn->query($sql) === TRUE) {
        // Логируем обновление
        logAction($conn, $_SESSION['user_id'], 'updateApplications', "Обновил статус отклика: $application_id");

        // Получаем user_id, которому принадлежит заявка
        $stmt = $conn->prepare("SELECT user_id FROM applications WHERE id = ?");
        $stmt->bind_param("i", $application_id);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($row = $result->fetch_assoc()) {
            $targetUserId = $row['user_id'];
            addNotification($conn, $targetUserId, "Статус вашего отклика изменён"); 
        }
        $stmt->close();

        echo json_encode(['status' => 'success']);
        exit;
    } else {
        echo json_encode(['status' => 'error', 'message' => 'Failed to update status']);
        logAction($conn, $_SESSION['user_id'], 'updateApplications', "Ошибка обновления статуса: $application_id");
    }
} else {
    echo json_encode(['status' => 'error', 'message' => 'Invalid request method']);
}
