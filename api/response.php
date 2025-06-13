<?php
require_once('./db.php');
require_once('./log.php');
header("Access-Control-Allow-Origin: http://localhost:5173");
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

    $sql = "INSERT INTO `applications` (user_id, offer_id, status) VALUES ('$user_id', $offer_id, 'expectation')";
    if ($conn->query($sql) === TRUE) {
        echo json_encode(['status' => 'success', 'message' => 'Ваше резюме отправленно']);
        logAction($conn, $user_id, 'responce', "Отклик отправлен");
    } else {
        echo json_encode(['status' => 'error', 'message' => 'Ошибка отправки отклика']);
        logAction($conn, $user_id, 'responce', "Ошибка отправки отклика");
    }
}
else {
    echo json_encode(['status' => 'error', 'message' => 'Invalid request method', 'method'=>$_SERVER['REQUEST_METHOD']]);
}