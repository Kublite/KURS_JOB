import React, {useState} from "react";
import Toast from "../components/Toast";

export default function CreateMessage(){
    const [toast, setToast] = useState(null);

    function SendMessage(event){
        event.preventDefault();

        const form = event.target.closest('form'); // получаем форму
        const messageData = new FormData(form);

        fetch("/api/sendMessage.php", {
            method: "POST",
            credentials: "include",
            body: messageData,
          })
          .then((response) => response.json()) // 👈 ОБЯЗАТЕЛЬНО!
          .then((data) => {
            if (data.status === 'success') {
              setToast({ message: "Сообщение отправлено", type: "success" });
            } else {
              setToast({ message: data.message || "Ошибка отправки", type: "error" });
            }
          })
          .catch((err) => {
            console.error("Ошибка отправки", err);
            setToast({ message: err.message, type: "error" });
          });
    }


    return(
        <main className="createMessage">
            <div className="createMessage__inner container">
                <form action="" className="createMessage__form" method="post" onSubmit={SendMessage}>
                    <h1 className="createMessage__form-name">Создать заявку</h1>
                    <div className="createMessage__form-block">
                        <input
                        className="createMessage__form-block-input"
                        type="text"
                        placeholder="Тема"
                        name="subject"
                        />
                    </div>
                    <div className="createMessage__form-block">
                        <input
                        className="createMessage__form-block-input"
                        type="text"
                        placeholder="ФИО"
                        name="full_name"
                        />
                    </div>
                    <div className="createMessage__form-block">
                        <input
                        className="createMessage__form-block-input"
                        type="text"
                        placeholder="Контакт для связи"
                        name="contact_info"
                        />
                    </div>
                    <div className="createMessage__form-block">
                        <textarea
                        className="createMessage__form-block-input"
                        placeholder="Текст"
                        name="message"
                        />
                    </div>
                    <div className="createMessage__form-button">
                        <button className="createMessage__form-button-submit" type="submit">Отправить</button>
                    </div>
                </form>
                {toast && (
                        <Toast
                          message={toast.message}
                          type={toast.type}
                          onClose={() => setToast(null)}
                        />
                      )}
            </div>
        </main>
    )
}