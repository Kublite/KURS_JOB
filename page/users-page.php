<!DOCTYPE html>
<html lang="ru">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Ползователь</title>
    <link rel="icon" href="../img\favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="../styles/styles.css" />
  </head>
  <body>
  <?php 
    session_start();
    include '..\templates\admin-header.html'; 

    if (!isset($_SESSION['user_role'])) {
    header('Location: /page/login.php');
    exit();
    }

    if($_SESSION['user_role']=='admin'){
    include "../templates/blocks/registration.html";
    }

    include '..\templates\footer.html';
    ?>
  </body>
</html>