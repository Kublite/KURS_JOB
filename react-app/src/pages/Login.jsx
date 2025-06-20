import React, {useState} from "react";
import Toast from "../components/Toast";

export default function Login(){
  const [toast, setToast] = useState(null);
  const[role, setRole]=useState('');
  const [error, setError] = useState('');

  function sendAuth(event){
    event.preventDefault();

    const form = event.target.closest('form'); // получаем форму
    const formData = new FormData(form);


    fetch('/api/login.php',{
      credentials: 'include',
      method: "POST",
      body: formData})
      .then(response=>response.json())
      .then(data=>{
        if(data.role){setRole(data.role);  window.location.href = '/';}
        else{setToast({ message: 'Неверный логин или пароль', type: "error" });}
      })
      .catch(error=>{console.error(error);
        setToast({ message: 'Ошибка', type: "error" });
      })
  }
    return(
        <main className="login">
  <div className="login__inner">
    <form className="login__form" method="post" onSubmit={sendAuth}>
      <div className="login__form-title">Вход в МУИВ JOB</div>
      <div className="login__form-userName">
        <input
          className="login__form-userName-input"
          type="text"
          placeholder="Логин"
          name="UserName"
        />
      </div>
      <div className="login__form-password">
        <input
          className="login__form-password-input"
          type="password"
          placeholder="Пароль"
          name="password"
        />
      </div>
      {error && <p  style={{
      fontSize: '16px',
      color: '#691911',
      backgroundColor: '#f4d6d2',
      borderColor: '#f0c5c1',
      borderRadius: '0.5rem',
      borderStyle: 'solid',
      padding: '0.5rem 1rem',
      margin: '1rem'
    }}>{error}</p>}
      <div className="login__form-button">
        <button className="login__form-button-submit" type="submit">Вход</button>
      </div>
    </form>
  </div>
  {toast && (
                <Toast
                  message={toast.message}
                  type={toast.type}
                  onClose={() => setToast(null)}
                />
              )}
</main>

    )
}