<?php
header('Access-Control-Allow-Origin: http://localhost:5173');
header('Access-Control-Allow-Credentials: true');
require_once('./db.php');
session_start();
$user_id = $_SESSION['user_id'];

$paramOffer = $_POST['paramOffer'] ?? null;

if ($paramOffer === 'my') {
    $sql = "SELECT * FROM offers WHERE user_id = '$user_id'";
} else {
    $sql = "SELECT * FROM offers";
}
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