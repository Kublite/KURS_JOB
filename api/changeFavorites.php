<?php
require_once('./db.php');
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");
session_start();

$user_id = $_SESSION['user_id'] ?? null;
$offer_id = $_POST['offer_id'] ?? null;

if (!$user_id || !$offer_id) {
    echo json_encode(["status" => "error", "message" => "Missing data"]);
    exit;
}

$check = $conn->query("SELECT * FROM favorites WHERE user_id = '$user_id' AND offer_id = '$offer_id'");

if ($check->num_rows > 0) {
    $conn->query("DELETE FROM favorites WHERE user_id = '$user_id' AND offer_id = '$offer_id'");
    echo json_encode(["status" => "removed"]);
} else {
    $conn->query("INSERT INTO favorites (user_id, offer_id) VALUES ('$user_id', '$offer_id')");
    echo json_encode(["status" => "added"]);
}