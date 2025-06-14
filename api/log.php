<?php
function logAction($conn, $user_id, $action, $details) {
    $stmt = $conn->prepare("INSERT INTO logs (user_id, action, details, timestamp) VALUES (?, ?, ?, NOW())");
    if (!$stmt) {
        error_log("Ошибка prepare: " . $conn->error);
        return;
    }

    if (!$stmt->bind_param("iss", $user_id, $action, $details)) {
        error_log("Ошибка bind_param: " . $stmt->error);
        return;
    }

    if (!$stmt->execute()) {
        error_log("Ошибка execute: " . $stmt->error);
    }

    $stmt->close();
}

?>