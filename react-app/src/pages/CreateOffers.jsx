import React from 'react';
import { Link } from 'react-router-dom';


export default function CreateOffers(){
  function offersForm(event){
    event.preventDefault();

    const form = event.target.closest('form'); // получаем форму
    const offerData = new FormData(form);

    fetch("http://localhost/api/createOffer.php", {
      method: "POST",
      credentials: "include",
      body: offerData,
    })
      .then((response) => {
        // Обрабатываем ответ от сервера
        console.log("yes", response);
        const formDataObject = Object.fromEntries(offerData.entries());
        console.log("Form Data:", formDataObject);
        return response.json();
      })
      .then((data) => {
        if (data.status === 'success') {
            alert('Вакансия успешно создана');
            // или setSuccess(true) и показать блок
          } else {
            alert('Ошибка: ' + data.message);
          }
      })
      .catch((error) => {
        // Обрабатываем ошибку
        console.error("no", error);
        alert('Ошибка');
      });
  }

    return(
        <main className="createOffers">
            <div className="createOffers__inner">
                <form action="" className="createOffers__form" method="post" id="register-form" onSubmit={offersForm}>
                    <h1 className="createOffers__form-name">Создать вакансию</h1>
                    <div className="createOffers__form-block">
                        <input
                        className="createOffers__form-block-input"
                        type="text"
                        placeholder="Название должности"
                        name="title"
                        />
                    </div>
                    <div className="createOffers__form-block">
                        <input
                        className="createOffers__form-block-input"
                        type="text"
                        placeholder="Тип занятости"
                        name="employment"
                        />
                    </div>
                    <div className="createOffers__form-block">
                        <input
                        className="createOffers__form-block-input"
                        type="text"
                        placeholder="Форма занятости"
                        name="format"
                        />
                    </div>
                    <div className="createOffers__form-block">
                        <textarea
                        className="createOffers__form-block-input"
                        placeholder="Описание"
                        name="description"
                        />
                    </div>
                    <div className="createOffers__form-block">
                        <textarea
                        className="createOffers__form-block-input"
                        placeholder="Требования"
                        name="requirements"
                        />
                    </div>
                    <div className="createOffers__form-block">
                        <select name="speciality" className="createOffers__form-block-input">
                            <option value="">--Специальность студента --</option>
                            <option value="ИТ">ИТ</option>
                            <option value="Экономика">Экономика</option>
                            <option value="Юриспруденция">Юриспруденция</option>
                            <option value="Педагог">Педагог</option>
                        </select>
                    </div>
                    <div className="createOffers__form-block">
                        <select name="city" className="createOffers__form-block-input">
                            <option value="">--Город--</option>
                            <option value="Москва">Москва</option>
                            <option value="Пенза">Пенза</option>
                            <option value="Нижний Новгород">Нижний Новгород</option>
                            <option value="Сергиев Посад">Сергиев Посад</option>
                            <option value="Ростов-на-Дону">Ростов-на-Дону</option>
                            <option value="Рязань">Рязань</option>
                        </select>
                    </div>
                    <div className="createOffers__form-block">
                        <p className="createOffers__small-text">*не обязательно</p>
                        <input
                        className="createOffers__form-block-input"
                        type="number"
                        placeholder="Доход"
                        name="salary"
                        />
                    </div>
                    <div className="createOffers__form-button">
                        <Link to="/TableOffers" className="createOffers-back">Назад</Link>
                        <button className="createOffers__form-button-submit" type="submit">Создать</button>
                    </div>
                </form>
            </div>
        </main>
    )
}