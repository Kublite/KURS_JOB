<?php
require_once('../db.php');
header("Access-Control-Allow-Origin: http://localhost:5173");
header("Access-Control-Allow-Credentials: true");
// Проверяем, был ли запрос методом POST
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Получаем данные из POST
    $UserName = $_POST['UserName'] ?? null; // Используем ?? для избежания ошибок
    $password = $_POST['password'] ?? null;
    $email = $_POST['email'] ?? null;
    $role = $_POST['role'] ?? null;

    // Проверяем, заполнены ли поля
    if (empty($UserName) || empty($password) || empty($email) || empty($role)) {
        echo json_encode(['status' => 'error', 'message' => 'Fields are not filled']);
    } else {
        // Выполняем SQL-запрос
        $sql = "INSERT INTO `users` (UserName, pass, email, role) VALUES ('$UserName', '$password', '$email', '$role')";
        if ($conn->query($sql) === TRUE) {
            echo json_encode(['status' => 'success', 'message' => 'User is registered']);
        } else {
            echo json_encode(['status' => 'error', 'message' => 'Error during registration']);
        }
    }
} else {
    echo json_encode(['status' => 'error', 'message' => 'Invalid request method', 'method'=>$_SERVER['REQUEST_METHOD']]);
}
?>