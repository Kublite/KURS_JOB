<!DOCTYPE html>
<html lang="ru">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Вход</title>
    <link rel="icon" href="../img\favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="../styles/styles.css" />
  </head>
  <body>
    <?php 
      session_start();
      include '../templates\blocks/login.html'; 
      require_once('../scripts/db.php');
      if (isset($_POST['UserName']) && isset($_POST['password'])) {
        $UserName = $_POST['UserName'];
        $password = $_POST['password'];

        if(empty($UserName) || empty($password)){
          echo('Поля не заполнены');
        } else {
          $sql = "SELECT * FROM `users` WHERE UserName = '$UserName' AND pass = '$password'";
          $result = $conn->query($sql);

          if($result -> num_rows > 0){
            while($row = $result->fetch_assoc()){
              $_SESSION['user_role'] = $row['role'];
              /* $_SESSION['user_id'] = $row['id']; */
              header('Location: ../index.php');
              exit();
            }
          }else{
            echo 'Пользователя не существует';
          }
        }
      }
    ?>
  </body>
</html>
