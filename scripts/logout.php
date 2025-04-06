<?php 
session_start();
      
if (!isset($_SESSION['user_role'])) {
    header('Location: /page/login.php');
    exit();
  }
session_destroy();
header("Refresh:0");