<?php
require_once('./db.php');
require_once('./log.php');

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Credentials: true");
header("Content-Type: application/json; charset=utf-8");

session_start();

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $UserName = $_POST['UserName'] ?? null;
    $password = $_POST['password'] ?? null;
    $email = $_POST['email'] ?? null;
    $role = $_POST['role'] ?? null;

    if (empty($UserName) || empty($password) || empty($email) || empty($role)) {
        echo json_encode(['status' => 'error', 'message' => 'Заполнены не все поля']);
        exit;
    }

    $check_sql = "SELECT * FROM `users` WHERE UserName = '$UserName' OR email = '$email'";
    $result = $conn->query($check_sql);

    if ($result->num_rows > 0) {
        echo json_encode(['status' => 'error', 'message' => 'Пользователь с таким именем или email уже существует']);
        exit;
    }

    $sql = "INSERT INTO `users` (UserName, pass, email, role) VALUES ('$UserName', '$password', '$email', '$role')";
    if ($conn->query($sql) === TRUE) {
        logAction($conn, $_SESSION['user_id'] ?? null, 'register', "Зарегистрирован пользователь: $UserName");
        echo json_encode(['status' => 'success', 'message' => 'Пользователь зарегистрирован']);
    } else {
        logAction($conn, $_SESSION['user_id'] ?? null, 'register', "Ошибка регистрации");
        echo json_encode(['status' => 'error', 'message' => 'Ошибка при регистрации']);
    }
} else {
    echo json_encode(['status' => 'error', 'message' => 'Invalid request method']);
}