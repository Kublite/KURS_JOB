<?php
$servername = 'localhost';
$username = 'root';
$password = "mysql";
$dbname = 'usersdb';

$conn = mysqli_connect($servername, $username, $password, $dbname);

if(!$conn){
    die('Connection Faled'. mysqli_error());
} else {
    'Успех';
}
mysqli_set_charset($conn, 'utf8mb4');
?>