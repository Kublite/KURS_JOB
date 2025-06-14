import React, { useState } from 'react';
import { Link } from 'react-router-dom';
import MDEditor from "@uiw/react-md-editor";
import { useNavigate } from 'react-router-dom';
import Toast from "../components/Toast";

export default function CreateOffers(){
    const [description, setDescription] = useState("");
    const navigate = useNavigate();
    const [toast, setToast] = useState(null);


  function offersForm(event){
    event.preventDefault();

    const form = event.target.closest('form'); // получаем форму
    const offerData = new FormData(form);

    offerData.append("description", description);

    fetch("/api/createOffer.php", {
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
            setToast({ message: "Вакансия успешно создана", type: "success" });
          } else {
            setToast({ message: 'Ошибка: ' + data.message, type: "error" });
          }
      })
      .catch((error) => {
        // Обрабатываем ошибку
        console.error("no", error);
        setToast({ message: 'Ошибка', type: "error" });
      });

    
  }

    return(
        <main className="createOffers">
            <div className="createOffers__inner">
                <form action="" className="createOffers__form" method="post" onSubmit={offersForm}>
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
                        <select name="employment" className="createOffers__form-block-input">
                            <option value="">--Тип работы--</option>
                            <option value="Стажировка">Стажировка</option>
                            <option value="Практика">Практика</option>
                            <option value="Волонтерство">Волонтерство</option>
                            <option value="Работа">Работа</option>
                        </select>
                    </div>
                    <div className="createOffers__form-block">
                        <select name="format" className="createOffers__form-block-input">
                            <option value="">--Формат работы--</option>
                            <option value="В офисе">В офисе</option>
                            <option value="Удаленный">Удаленный</option>
                            <option value="Гибридный">Гибридный</option>
                            <option value="Разъездной">Разъездной</option>
                        </select>
                    </div>
                    <div className="createOffers__form-block">
                        <label htmlFor="description">Описание</label>
                        <div data-color-mode="light">
                            <MDEditor value={description} onChange={setDescription} />
                        </div>
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
                        <button className="createOffers__form-button-submit" type="submit" onClick={() => navigate(`/TableOffers/`)}>Создать</button>
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