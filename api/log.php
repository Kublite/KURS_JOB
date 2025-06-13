<?php
function logAction($conn, $user_id, $action, $details) {
    $stmt = $conn->prepare("INSERT INTO logs (user_id, action, details, timestamp) VALUES (?, ?, ?, NOW())");
    $stmt->bind_param("iss", $user_id, $action, $details);
    $stmt->execute();
    $stmt->close();
}
?>