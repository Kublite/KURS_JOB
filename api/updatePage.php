<?php
require_once('./db.php');
require_once('./log.php');
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Credentials: true");
header("Content-Type: application/json");
session_start();

$page = $_POST['page'] ?? '';
$content = $_POST['content'] ?? '';

if ($page === '' || $content === '') {
  echo json_encode(['status' => 'error', 'message' => 'Недостаточно данных']);
  exit;
}

$sql = "UPDATE site_content SET content = ? WHERE page = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("ss", $content, $page);

if ($stmt->execute()) {
  echo json_encode(['status' => 'success']);
  logAction($conn, $_SESSION['user_id'], 'updatePage', "Обновление страницы: $page");
} else {
  echo json_encode(['status' => 'error', 'message' => 'Ошибка при сохранении']);
  logAction($conn, $_SESSION['user_id'], 'updatePage', "Обновление страницы:$page");
}