<?php
require_once('../scripts/db.php');
header("Access-Control-Allow-Origin: http://localhost:5173");
header("Access-Control-Allow-Credentials: true");
session_start();

$user_id = $_SESSION['user_id'] ?? null;
$offer_id = $_POST['offer_id'] ?? null;

if (!$user_id || !$offer_id) {
    http_response_code(400);
    exit;
}

// Проверяем, был ли уже просмотр этим пользователем этой вакансии
$checkSql = "SELECT * FROM views WHERE user_id = ? AND offer_id = ?";
$stmt = $conn->prepare($checkSql);
$stmt->bind_param("ii", $user_id, $offer_id);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows === 0) {
    $insertSql = "INSERT INTO views (user_id, offer_id) VALUES (?, ?)";
    $stmt = $conn->prepare($insertSql);
    $stmt->bind_param("ii", $user_id, $offer_id);
    $stmt->execute();
}

echo json_encode(['status' => 'success']);