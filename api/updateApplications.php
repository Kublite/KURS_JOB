<?php
require_once('../scripts/db.php');
header('Access-Control-Allow-Origin: http://localhost:5173');
header("Access-Control-Allow-Credentials: true");
session_start();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $application_id = $_POST['application_id'] ?? null;
    $status = $_POST['status'] ?? null;

    if (!$application_id || !$status) {
        echo json_encode(['status' => 'error', 'message' => 'Missing data']);
        exit;
    }

    $sql = "UPDATE applications SET status = '$status' WHERE id = $application_id";

    if ($conn->query($sql) === TRUE) {
        echo json_encode(['status' => 'success']);
    } else {
        echo json_encode(['status' => 'error', 'message' => 'Failed to update status']);
    }
} else {
    echo json_encode(['status' => 'error', 'message' => 'Invalid request method']);
}