<?php
require_once('./db.php');
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Credentials: true");
header("Content-Type: application/json");

$sql = "SELECT offer_id, COUNT(DISTINCT user_id) AS views FROM views GROUP BY offer_id";

$result = $conn->query($sql);

$views = [];
while($row = $result->fetch_assoc()) {
    $views[$row['offer_id']] = $row['views'];
}

echo json_encode([
    'status' => 'true',
    'views' => $views
]);