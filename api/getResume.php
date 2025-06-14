<?php
require_once('./db.php');
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Credentials: true");
header("Content-Type: application/json");

session_start();

$user_id = $_SESSION['user_id'] ?? null;

if($_SERVER['REQUEST_METHOD'] == 'POST'){
    $user_id = $_POST['user_id'];}

$sql = "SELECT * FROM resumes where user_id = '$user_id'";

$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $resume = [];

    while ($row = $result->fetch_assoc()) {
        $resume[] = $row;
    }

    echo json_encode([
        'status' => 'true',
        'resume' => $resume
    ]);
}