<?php
function addNotification($conn, $user_id, $message) {
    // Добавляем новое уведомление
    $stmt = $conn->prepare("INSERT INTO notifications (user_id, message, is_read, created_at) VALUES (?, ?, 0, NOW())");
    $stmt->bind_param("is", $user_id, $message);
    $stmt->execute();

    // Удаляем все, кроме 5 последних уведомлений пользователя
    $deleteSql = "
        DELETE FROM notifications 
        WHERE id NOT IN (
            SELECT id FROM (
                SELECT id FROM notifications 
                WHERE user_id = ? 
                ORDER BY created_at DESC 
                LIMIT 5
            ) as latest
        ) AND user_id = ?
    ";
    $delStmt = $conn->prepare($deleteSql);
    $delStmt->bind_param("ii", $user_id, $user_id);
    $delStmt->execute();
}
?>