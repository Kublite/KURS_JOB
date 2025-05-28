<?php 
header("Access-Control-Allow-Origin: http://localhost:5173");
header("Access-Control-Allow-Credentials: true");
session_start(); 
require_once('./db.php');
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
  $UserName = $_POST['UserName'] ?? null; // Используем ?? для избежания ошибок
  $password = $_POST['password'] ?? null;

  if(empty($UserName)|| empty($password)){
    echo json_encode(['status' => 'error', 'message' => 'Fields are not filled']);
  } else {
    $sql = "SELECT * FROM `users` WHERE UserName = '$UserName' AND pass = '$password'";
    $result = $conn->query($sql);}
    if($result -> num_rows > 0){
      while($row = $result->fetch_assoc()){
        $_SESSION['user_id'] = $row['id'];
        $_SESSION['user_role'] = $row['role'];
        echo json_encode(['success' => true, 'role' => $row['role']]);
        exit();
      }
    }else{
      echo json_encode(['status' => 'error', 'message' => 'Invalid request method', 'method'=>$_SERVER['REQUEST_METHOD']]);
    }
}

?>