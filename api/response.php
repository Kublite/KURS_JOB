<?php
require_once('./db.php');
require_once('./log.php');
require_once('./notify.php'); // 👈 обязательно!
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Credentials: true");
session_start();

$user_id = $_SESSION['user_id'];

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $offer_id = $_POST['offer_id'] ?? null;

    if (!$offer_id) {
        echo json_encode(['status' => 'error', 'message' => 'no ID']);
        exit;
    }

    // Проверка: был ли уже отклик
    $check = $conn->query("SELECT * FROM applications WHERE user_id = $user_id AND offer_id = $offer_id");
    if ($check && $check->num_rows > 0) {
        echo json_encode(['status' => 'error', 'message' => 'Вы уже откликались на эту вакансию']);
        logAction($conn, $user_id, 'responce', "Повторный отклик");
        exit;
    }

    // Отправляем отклик
    $sql = "INSERT INTO `applications` (user_id, offer_id, status) VALUES ('$user_id', $offer_id, 'expectation')";
    if ($conn->query($sql) === TRUE) {
        logAction($conn, $user_id, 'responce', "Отклик отправлен");

        // --- 🆕 Получаем владельца вакансии (hr_id) ---
        $stmt = $conn->prepare("SELECT user_id FROM offers WHERE id = ?");
        $stmt->bind_param("i", $offer_id);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($row = $result->fetch_assoc()) {
            $hrId = $row['user_id'];
            addNotification($conn, $hrId, "Новый отклик на вашу вакансию"); // 👈 Уведомление HR
        }
        $stmt->close();

        echo json_encode(['status' => 'success', 'message' => 'Ваше резюме отправлено']);
    } else {
        echo json_encode(['status' => 'error', 'message' => 'Ошибка отправки отклика']);
        logAction($conn, $user_id, 'responce', "Ошибка отправки отклика");
    }
} else {
    echo json_encode(['status' => 'error', 'message' => 'Invalid request method', 'method' => $_SERVER['REQUEST_METHOD']]);
}