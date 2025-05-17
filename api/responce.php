<?php
require_once('../scripts/db.php');
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
        exit;
    }

    $sql = "INSERT INTO `applications` (user_id, offer_id, status) VALUES ('$user_id', $offer_id, 'expectation')";
    if ($conn->query($sql) === TRUE) {
        echo json_encode(['status' => 'success', 'message' => 'Ваше резюме отправленно']);
    } else {
        echo json_encode(['status' => 'error', 'message' => 'Error during registration']);
    }
}
else {
    echo json_encode(['status' => 'error', 'message' => 'Invalid request method', 'method'=>$_SERVER['REQUEST_METHOD']]);
}