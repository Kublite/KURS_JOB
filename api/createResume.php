<?php
require_once('./db.php');
header("Access-Control-Allow-Origin: http://localhost:5173");
header("Access-Control-Allow-Credentials: true");
session_start();

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

    // Обработка фото
    if (isset($_FILES['photo']) && $_FILES['photo']['error'] === UPLOAD_ERR_OK) {
        $photo_tmp = $_FILES['photo']['tmp_name'];
        $photo_name = basename($_FILES['photo']['name']);
        $upload_dir = '../uploads/';
        $photo_path = $upload_dir . uniqid() . '_' . $photo_name;

        move_uploaded_file($photo_tmp, $photo_path);
    } else {
        $photo_path = null; // если фото не загружено
    }

    // SQL
    $sql = "INSERT INTO `resumes` 
        (user_id, full_name, desired_position, city, phone, email, telegram, git, speciality, photo_path, description) 
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

    $stmt = $conn->prepare($sql);
    $stmt->bind_param(
        "issssssssss",
        $user_id,
        $full_name,
        $desired_position,
        $city,
        $phone,
        $email,
        $telegram,
        $git,
        $speciality,
        $photo_path,
        $description
    );

    if ($stmt->execute()) {
        echo json_encode(['status' => 'success', 'message' => 'Резюме сохранено']);
    } else {
        echo json_encode(['status' => 'error', 'message' => 'Ошибка при сохранении']);
    }
}