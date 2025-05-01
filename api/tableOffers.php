<?php
header('Access-Control-Allow-Origin: http://localhost:5173');
header('Access-Control-Allow-Credentials: true');
require_once('../scripts/db.php');
session_start();
$user_id = $_SESSION['user_id'];

$sql = "SELECT title, speciality, salary, city, created_at, format, description, employment FROM offers where user_id = '$user_id'";
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