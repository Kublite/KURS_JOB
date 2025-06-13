<?php
require_once('./db.php');
require_once('./log.php');
session_start();
logAction($conn, $_SESSION['user_id'], 'logout', "выход из системы");
session_destroy();

echo json_encode(['success' => true]);
?>