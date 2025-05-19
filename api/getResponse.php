<?php
require_once('../scripts/db.php');
header('Access-Control-Allow-Origin: http://localhost:5173');
header("Access-Control-Allow-Credentials: true");

session_start();

$user_id = $_SESSION['user_id'];
$status = 'expectation';

$sql = "
SELECT 
    a.id AS application_id,
    r.full_name,
    r.desired_position,
    r.city,
    r.phone,
    r.email,
    r.telegram,
    r.git,
    r.speciality,
    r.photo_path,
    r.description,
    a.status,
    a.applied_at,
    o.title
FROM applications a
JOIN offers o ON a.offer_id = o.id
JOIN resumes r ON a.user_id = r.user_id
WHERE o.user_id = $user_id AND a.status='$status'
ORDER BY o.title DESC
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