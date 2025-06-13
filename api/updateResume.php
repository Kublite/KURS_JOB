<?php
require_once('./log.php');
require_once('./db.php');
header("Access-Control-Allow-Origin: http://localhost:5173");
header("Access-Control-Allow-Credentials: true");
session_start();
// Проверяем, был ли запрос методом POST
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $user_id = $_SESSION['user_id'];

    $full_name = $_POST['fullName'];
    $desired_position = $_POST['desiredPosition'];
    $city = $_POST['city'];
    $phone = $_POST['phone'];
    $email = $_POST['email'];
    $telegram = $_POST['telegram'];
    $git = $_POST['git'];
    $speciality = $_POST['speciality'];
    $description = $_POST['description'];


    if (isset($_FILES['photo']) && $_FILES['photo']['error'] === UPLOAD_ERR_OK) {
        $uploadDir = '../uploads/';
        $fileName = time() . '_' . basename($_FILES['photo']['name']);
        $uploadPath = $uploadDir . $fileName;
    
        if (move_uploaded_file($_FILES['photo']['tmp_name'], $uploadPath)) {
            $photo_path = 'uploads/' . $fileName;
        } else {
            $photo_path = null;
        }
    } else {
        $photo_path = null;
    }
        // Выполняем SQL-запрос
        $sql = "UPDATE `resumes` SET 
    full_name = '" . $conn->real_escape_string($full_name) . "',
    desired_position = '" . $conn->real_escape_string($desired_position) . "',
    city = '" . $conn->real_escape_string($city) . "',
    phone = '" . $conn->real_escape_string($phone) . "',
    email = '" . $conn->real_escape_string($email) . "',
    telegram = '" . $conn->real_escape_string($telegram) . "',
    git = '" . $conn->real_escape_string($git) . "',
    speciality = '" . $conn->real_escape_string($speciality) . "',
    description = '" . $conn->real_escape_string($description) . "'";

if ($photo_path !== null) {
    $sql .= ", photo_path = '" . $conn->real_escape_string($photo_path) . "'";
}

$sql .= " WHERE user_id = " . (int)$user_id;


        if ($conn->query($sql) === TRUE) {
            echo json_encode(['status' => 'success', 'message' => 'User is registered']);
            logAction($conn, $user_id, 'updateResume', "Обновление резюме");
        } else {
            echo json_encode(['status' => 'error', 'message' => 'Error during registration']);
            logAction($conn, $user_id, 'updateResume', "Ошибка обновления резюме");
        }
} else {
    echo json_encode(['status' => 'error', 'message' => 'Invalid request method', 'method'=>$_SERVER['REQUEST_METHOD']]);
}
?>