<?php
require_once('./db.php');
header('Access-Control-Allow-Origin: http://localhost:5173');
header("Access-Control-Allow-Credentials: true");

session_start();

$user_id = $_SESSION['user_id'];

$sql = "
SELECT 
    a.id,
    a.status,
    a.applied_at,
    a.user_id,
    a.offer_id,
    o.title
FROM applications a
JOIN offers o ON a.offer_id = o.id
WHERE a.user_id = $user_id
ORDER BY a.applied_at DESC
";

$result = $conn->query($sql);

if ($result && $result->num_rows > 0) {
    $applications = [];

    while ($row = $result->fetch_assoc()) {
        $applications[] = $row;
    }

    echo json_encode([
        'status' => 'true',
        'applications' => $applications
    ]);
} else {
    echo json_encode([
        'status' => 'error',
        'applications' => []
    ]);
}