<?php
require_once('./db.php');
header("Access-Control-Allow-Origin: http://localhost:5173");
header("Access-Control-Allow-Credentials: true");
session_start();
$user_id = $_SESSION['user_id'];
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $title = $_POST['title'] ?? null;
    $employment = $_POST['employment'] ?? null;
    $format = $_POST['format'] ?? null;
    $description = $_POST['description'] ?? null;
    $requirements = $_POST['requirements'] ?? null;
    $speciality = $_POST['speciality'] ?? null;
    $salary = isset($_POST['salary']) && $_POST['salary'] !== '' ? $_POST['salary'] : null;
    $city = $_POST['city'] ?? null;

    if (empty($title) || empty($employment) || empty($format) || empty($description) || empty($requirements) || empty($speciality) || empty($city)) {
        echo json_encode(['status' => 'error', 'message' => 'Fields are not filled']);
    } else {
        $sql = "INSERT INTO `offers` (title, description, requirements, speciality, city, user_id, format, employment, salary) VALUES ('$title', '$description', '$requirements', '$speciality', '$city', '$user_id', '$format', '$employment', " . ($salary !== null ? "'$salary'" : "NULL") . ")";
        if ($conn->query($sql) === TRUE) {
            echo json_encode(['status' => 'success', 'message' => 'Вакансия создана']);
        } else {
            echo json_encode(['status' => 'error', 'message' => 'Ошибка создания вакансий']);
        }
    }
} else {
    echo json_encode(['status' => 'error', 'message' => 'Invalid request method', 'method'=>$_SERVER['REQUEST_METHOD']]);
}
?>