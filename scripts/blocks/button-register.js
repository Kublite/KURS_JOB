let registerForm = document
  .getElementById("register-form")
  .addEventListener("submit", function (register) {
    register.preventDefault();
    const registerData = new FormData(this);

    fetch("../scripts/blocks/register.php", {
      method: "POST",
      body: registerData,
    })
      .then((response) => {
        // Обрабатываем ответ от сервера
        console.log("yes", response);
        const formDataObject = Object.fromEntries(registerData.entries());
        console.log("Form Data:", formDataObject);
        return response.json();
      })
      .then((data) => {
        console.log(data); // Обрабатываем данные, полученные от сервера
      })
      .catch((error) => {
        // Обрабатываем ошибку
        console.error("no", error);
      });
  });
