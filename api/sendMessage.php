<?php
require_once('./db.php');
require_once('./log.php');
require_once('./notify.php');
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Credentials: true");
header("Content-Type: application/json; charset=UTF-8");

session_start();

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $subject = $_POST['subject'] ?? null;
    $full_name = $_POST['full_name'] ?? null;
    $contact_info = $_POST['contact_info'] ?? null;
    $message = $_POST['message'] ?? null;

    if ($subject && $full_name && $contact_info && $message) {
        $sql = "INSERT INTO `messages` (subject, full_name, contact_info, message)
                VALUES (?, ?, ?, ?)";

        $stmt = $conn->prepare($sql);
        $stmt->bind_param("ssss", $subject, $full_name, $contact_info, $message);

        if ($stmt->execute()) {
            echo json_encode(['status' => 'success', 'message' => 'Сообщение отправлено']);
            logAction($conn, $_SESSION['user_id'], 'sendMessage', "Сообщение отправлено");
            addNotification($conn, 1, "Вам пришло письмо"); 
        } else {
            echo json_encode(['status' => 'error', 'message' => 'Ошибка при отправке сообщения']);
            logAction($conn, $_SESSION['user_id'], 'sendMessage', "Ошибка при отправке сообщения");
        }
    } else {
        echo json_encode(['status' => 'error', 'message' => 'Заполните все поля']);
    }
} else {
    echo json_encode(['status' => 'error', 'message' => 'Неверный метод запроса']);
}
?>