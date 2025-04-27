<?php
header('Access-Control-Allow-Origin: http://localhost:5173');
header('Access-Control-Allow-Credentials: true');
session_start();
header('Content-Type: application/json');

if (!isset($_SESSION['user_role'])) {
  echo json_encode([
    "authenticated" => false
  ]);
  exit;
}

echo json_encode([
  "authenticated" => true,
  "role" => $_SESSION['user_role']
]);