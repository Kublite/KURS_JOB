<?php
require_once('./db.php');
header('Access-Control-Allow-Origin: http://localhost:5173');
header("Access-Control-Allow-Credentials: true");

session_start();

if ($_SERVER['REQUEST_METHOD'] == 'POST'){
    $message_id = $_POST['message_id'] ?? null; 

    $sql = "SELECT * FROM messages WHERE id = '$message_id'";
}else{
    $sql = "SELECT * FROM messages";
}

$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $messages = [];

    while ($row = $result->fetch_assoc()) {
        $messages[] = $row;
    }

    echo json_encode([
        'status' => 'true',
        'messages' => $messages
    ]);
}