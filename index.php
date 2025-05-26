<!DOCTYPE html>
<html lang="ru">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>МУИВ JOB</title>
    <link rel="icon" href="img\favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="./styles/styles.css" />
  </head>
  <body>
    <?php 
    header("Access-Control-Allow-Origin: *");
    header("Access-Control-Allow-Credentials: true");
      session_start();
      
      if (!isset($_SESSION['user_role'])) {
        header('Location: /page/login.php');
        exit();
      }
      
      if($_SESSION['user_role']=='admin'){
        header('Location: /page/admin-panel.php');
      }
      else if($_SESSION['user_role']=='HR'){
        header('Location: /page/hr-home.php');
      }
      else if($_SESSION['user_role']=='student'){
        header('Location: /page/student-home.php');
      }
      else{
        echo $_SESSION['user_role'];
      }
      
      include 'templates\header.html'; 
    ?>
    <main></main>
    <?php  
      include 'templates\footer.html';
    ?>
  </body>
</html>
