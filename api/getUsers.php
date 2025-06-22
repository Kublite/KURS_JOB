<?php
require_once('./db.php');
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Credentials: true");
header("Content-Type: application/json");

$sql = "SELECT * FROM users";

$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $user = [];

    while ($row = $result->fetch_assoc()) {
        $user[] = $row;
    }

    echo json_encode([
        'status' => 'true',
        'user' => $user
    ]);
}