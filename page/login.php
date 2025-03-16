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
      include '../templates\blocks/login.html'; 
      require_once('../scripts/db.php');
      if (isset($_POST['login']) && isset($_POST['password'])) {
        $login = $_POST['login'];
        $password = $_POST['password'];

        if(empty($login) || empty($password)){
          echo('Поля не заполнены');
        } else {
          $sql = "SELECT * FROM `users` WHERE login = '$login' AND pass = '$password'";
          $result = $conn->query($sql);

          if($result -> num_rows > 0){
            while($row = $result->fetch_assoc()){
              header('Location: ../index.php');
            }
          }else{
            echo 'Пользователя не существует';
          }
        }
      }
    ?>
  </body>
</html>
