<?php
require_once('./db.php');
header("Access-Control-Allow-Origin: http://localhost:5173");
header("Access-Control-Allow-Credentials: true");
header("Content-Type: application/json");
session_start();

$user_id = $_SESSION['user_id'] ?? null;
$id = $_POST['id'] ?? null;

if (!$user_id || !$id) {
  echo json_encode(['status' => 'error', 'message' => 'Unauthorized or no ID']);
  exit;
}

$sql = "DELETE FROM offers WHERE id = $id AND user_id = $user_id";

if ($conn->query($sql)) {
  echo json_encode(['status' => 'success']);
} else {
  echo json_encode(['status' => 'error', 'message' => $conn->error]);
}
?>