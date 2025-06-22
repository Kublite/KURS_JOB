import React, { useEffect, useState } from "react";
import Toast from "../components/Toast";

export default function СontrolUsers() {
  const [users, setUsers] = useState([]);
  const [toast, setToast] = useState(null);

  useEffect(() => {
    fetch("/api/getUsers.php", {
      method: "GET",
      credentials: "include",
    })
      .then((response) => response.json())
      .then((data) => {
        if (data.status === "true") {
          setUsers(data.user);
        }
      })
      .catch((err) => {
        console.error("Ошибка при получении пользователей:", err);
      });
  }, []);

  function updateUser(event, id) {
    event.preventDefault();

    const form = event.target;
    const formData = new FormData(form);
    formData.append("id", id);

    fetch("/api/updateUsers.php", {
      method: "POST",
      body: formData,
      credentials: "include",
    })
      .then((response) => response.json())
      .then((data) => {
        if (data.status === "success") {
          setToast({ message: "Пользователь обновлен", type: "success" });
        } else {
          setToast({ message: "Ошибка: " + data.message, type: "error" });
        }
      })
      .catch(async (error) => {
        const text = await error?.response?.text?.();
        console.error("Ошибка:", error);
        console.log("Ответ сервера:", text);
        setToast({ message: "Ошибка сервера", type: "error" });
      });
      
  }

  return (
    <main>
      <div className="OllUsers__inner container">
        {users.length === 0 ? (
          <p>Пользователей пока нет</p>
        ) : (
          <ul className="OllUsers-ul">
            {users.map((u) => (
              <form className="OllUsers-form" key={u.id} onSubmit={(e) => updateUser(e, u.id)}>
                <input
                  className="OllUsers__form-block-input"
                  type="text"
                  placeholder="Логин"
                  name="UserName"
                  defaultValue={u.UserName}
                />
                <input
                  className="OllUsers__form-block-input"
                  type="text"
                  placeholder="Пароль"
                  name="pass"
                  defaultValue={u.pass}
                />
                <select
                  name="role"
                  className="OllUsers__form-block-input"
                  defaultValue={u.role}
                >
                  <option value="admin">Админ</option>
                  <option value="student">Студент</option>
                  <option value="HR">HR</option>
                </select>
                <input
                  className="OllUsers__form-block-input"
                  type="email"
                  placeholder="Почта"
                  name="email"
                  defaultValue={u.email}
                />
                <button className="OllUsers__form-block-button" type="submit">Сохранить</button>
              </form>
            ))}
          </ul>
        )}
        {toast && (
          <Toast
            message={toast.message}
            type={toast.type}
            onClose={() => setToast(null)}
          />
        )}
      </div>
    </main>
  );
}
