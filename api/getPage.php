<?php
require_once('./db.php');
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Credentials: true");
header("Content-Type: application/json");
session_start();

$page = $_POST['page'] ?? '';

if ($page === '') {
  echo json_encode(['status' => 'error', 'message' => 'Не указана страница']);
  exit;
}

$sql = "SELECT * FROM site_content WHERE page = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $page);
$stmt->execute();
$result = $stmt->get_result();

if ($row = $result->fetch_assoc()) {
  echo json_encode(['status' => 'true', 'page' => $row]);
} else {
  echo json_encode(['status' => 'error', 'message' => 'Страница не найдена']);
}