import React from "react";

export default function CreateMessage(){

    function SendMessage(event){
        event.preventDefault();

        const form = event.target.closest('form'); // получаем форму
        const messageData = new FormData(form);

        fetch("http://localhost/api/sendMessage.php",{
            method: "POST",
            credentials: "include",
            body: messageData,
        })
        .then(() => {
            alert("Сообщение отправлено!");
          })
        .catch((err) => {
            console.error("Ошибка отправки", err);
            alert("Произошла ошибка при отправке.");
        })
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
            </div>
        </main>
    )
}