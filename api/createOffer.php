<?php
require_once('../scripts/db.php');
header("Access-Control-Allow-Origin: http://localhost:5173");
header("Access-Control-Allow-Credentials: true");
session_start();
$user_id = $_SESSION['user_id'];
// Проверяем, был ли запрос методом POST
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Получаем данные из POST
    $title = $_POST['title'] ?? null; // Используем ?? для избежания ошибок
    $employment = $_POST['employment'] ?? null;
    $format = $_POST['format'] ?? null;
    $description = $_POST['description'] ?? null;
    $requirements = $_POST['requirements'] ?? null; // Используем ?? для избежания ошибок
    $speciality = $_POST['speciality'] ?? null;
    $salary = isset($_POST['salary']) && $_POST['salary'] !== '' ? $_POST['salary'] : null;
    $city = $_POST['city'] ?? null;

    // Проверяем, заполнены ли поля
    if (empty($title) || empty($employment) || empty($format) || empty($description) || empty($requirements) || empty($speciality) || empty($city)) {
        echo json_encode(['status' => 'error', 'message' => 'Fields are not filled']);
    } else {
        // Выполняем SQL-запрос
        $sql = "INSERT INTO `offers` (title, description, requirements, speciality, city, user_id, format, employment, salary) VALUES ('$title', '$description', '$requirements', '$speciality', '$city', '$user_id', '$format', '$employment', " . ($salary !== null ? "'$salary'" : "NULL") . ")";
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