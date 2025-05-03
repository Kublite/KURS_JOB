<?php
require_once('../scripts/db.php');
header("Access-Control-Allow-Origin: http://localhost:5173");
header("Access-Control-Allow-Credentials: true");
header("Content-Type: application/json");

$offer_id = $_POST['offer_id'] ?? null;

if (!$offer_id) {
  echo json_encode(['status' => 'error', 'message' => 'no ID']);
  exit;
}

$sql = "SELECT * FROM offers where id = '$offer_id'";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $offers = [];

    while ($row = $result->fetch_assoc()) {
        $offers[] = $row;
    }

    echo json_encode([
        'status' => 'true',
        'offers' => $offers
    ]);
} else {
    echo json_encode([
        'status' => 'error',
        'offers' => []
    ]);
}