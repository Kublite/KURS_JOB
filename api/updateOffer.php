<?php

require_once('./db.php');
require_once('./log.php');
header("Access-Control-Allow-Origin: http://localhost:5173");
header("Access-Control-Allow-Credentials: true");
session_start();
// Проверяем, был ли запрос методом POST
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Получаем данные из POST
    $id = $_POST['id'] ?? null;
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
        $sql = "UPDATE `offers` SET 
    title = '" . $conn->real_escape_string($title) . "',
    description = '" . $conn->real_escape_string($description) . "',
    requirements = '" . $conn->real_escape_string($requirements) . "',
    speciality = '" . $conn->real_escape_string($speciality) . "',
    city = '" . $conn->real_escape_string($city) . "',
    format = '" . $conn->real_escape_string($format) . "',
    employment = '" . $conn->real_escape_string($employment) . "',
    salary = " . ($salary !== null ? "'" . $conn->real_escape_string($salary) . "'" : "NULL") . "
    WHERE id = " . (int)$id;
        if ($conn->query($sql) === TRUE) {
            echo json_encode(['status' => 'success', 'message' => 'Вакансия обновлена']);
            logAction($conn, $_SESSION['user_id'], 'updateOffer', "Обновлена вакансия: $id");
        } else {
            echo json_encode(['status' => 'error', 'message' => 'Ошибка обновления вакансии']);
            logAction($conn, $_SESSION['user_id'], 'updateOffer', "Ошибка обновления вакансии: $id");
        }
    }
} else {
    echo json_encode(['status' => 'error', 'message' => 'Invalid request method', 'method'=>$_SERVER['REQUEST_METHOD']]);
}
?>