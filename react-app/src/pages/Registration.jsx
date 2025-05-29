import React from 'react';
export default function Registration(){
  function registerForm(event){
    event.preventDefault();

    const form = event.target.closest('form'); // получаем форму
    const registerData = new FormData(form);

    fetch("/api/register.php", {
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
  }

    return(
        <main className="registration">
  <div className="registration__inner">
    <form action="" className="registration__form" method="post" id="register-form" onSubmit={registerForm}>
      <div className="registration__form-title">Зарегистрировать пользователя</div>
      <div className="registration__form-userName">
        <input
          className="registration__form-userName-input"
          type="text"
          placeholder="Логин"
          name="UserName"
        />
      </div>
      <div className="registration__form-password">
        <input
          className="registration__form-password-input"
          type="password"
          placeholder="Пароль"
          name="password"
        />
      </div>
      <div className="registration__form-email">
        <input
          className="registration__form-email-input"
          type="email"
          placeholder="Email"
          name="email"
        />
      </div>
      <div className="registration__form-role">
        <select name="role" className="registration__form-role-input">
          <option value="">-- Выберите роль --</option>
          <option value="admin">admin</option>
          <option value="HR">HR</option>
          <option value="student">student</option>
        </select>
      </div>
      <div className="registration__form-button">
        <button className="registration__form-button-submit" type="submit">
          Зарегистрировать
        </button>
      </div>
    </form>
  </div>
</main>
    )
}