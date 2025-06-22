<?php

require_once('./db.php');
require_once('./log.php');
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Credentials: true");
session_start();
// Проверяем, был ли запрос методом POST
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Получаем данные из POST
    $id = $_POST['id'] ?? null;
    $UserName = $_POST['UserName'] ?? null; // Используем ?? для избежания ошибок
    $pass = $_POST['pass'] ?? null;
    $role = $_POST['role'] ?? null;
    $email = $_POST['email'] ?? null;

    if (empty($UserName) || empty($pass) || empty($role) || empty($email)) {
        echo json_encode(['status' => 'error', 'message' => 'Fields are not filled']);
    } else {
        // Выполняем SQL-запрос
        $sql = "UPDATE `users` SET 
    UserName = '" . $conn->real_escape_string($UserName) . "',
    pass = '" . $conn->real_escape_string($pass) . "',
    role = '" . $conn->real_escape_string($role) . "',
    email = '" . $conn->real_escape_string($email) . "'
    WHERE id = " . (int)$id;
        if ($conn->query($sql) === TRUE) {
            echo json_encode(['status' => 'success', 'message' => 'Пользователь обновлен']);
            logAction($conn, $_SESSION['user_id'], 'updateOffer', "Обновлен пользователь: $UserName");
        } else {
            echo json_encode(['status' => 'error', 'message' => 'Ошибка обновления пользователя']);
            logAction($conn, $_SESSION['user_id'], 'updateOffer', "Ошибка обновления пользователя: $UserName");
        }
    }
} else {
    echo json_encode(['status' => 'error', 'message' => 'Invalid request method', 'method'=>$_SERVER['REQUEST_METHOD']]);
}
?>