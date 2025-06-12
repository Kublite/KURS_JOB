<?php
require_once('./db.php');
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Credentials: true");
header("Content-Type: application/json");
session_start();

$user_id = $_SESSION['user_id'];

$sql = "SELECT offer_id FROM favorites WHERE user_id = '$user_id'";

$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $favorites = [];

    while ($row = $result->fetch_assoc()) {
        $favorites[] = $row;
    }

    echo json_encode([
        'status' => 'true',
        'favorites' => $favorites
    ]);
} else {
    echo json_encode([
        'status' => 'error',
        'favorites' => []
    ]);
}