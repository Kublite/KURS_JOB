import React, {useState, useEffect} from 'react';
import { Link } from 'react-router-dom';
import { useParams } from 'react-router-dom';


export default function EditOffers(){
    const [offer, setOffer] = useState([]);
    const { id } = useParams();

/*     useEffect(() => { */
        fetch("http://localhost/api/editOffer.php", {
            method: 'POST',
            credentials: 'include',
            headers: {'Content-Type': 'application/x-www-form-urlencoded'},
            body: `offer_id=${id}`,
        })
        .then((response) => response.json())
        .then((data) => {
            if (data.status === 'true') {
            setOffer(data.offers);
            console.log(data.offers);
            }
        })
        .catch((error) => {
            console.error("Ошибка редактирования:", error);
        });
/*     }, []); */


  function UpdateOffers(event){
    event.preventDefault();

    const form = event.target.closest('form'); // получаем форму
    const offerData = new FormData(form);
    offerData.append('id', id);

    fetch("http://localhost/api/updateOffer.php", {
      method: "POST",
      body: offerData,
      credentials: 'include',
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
            alert('Вакансия успешно изменена');
          } else {
            alert('Ошибка: ' + data.message);
          }
      })
      .catch((error) => {
        console.error("no", error);
        alert('Ошибка');
      });
  }

    return(
        <main className="createOffers">
            <div className="createOffers__inner">
            {offer.map((offer) => (
                <form action="" className="createOffers__form" method="post" id="register-form" onSubmit={UpdateOffers}>
                    <h1 className="createOffers__form-name">Создать вакансию</h1>
                    <div className="createOffers__form-block">
                        <input
                        className="createOffers__form-block-input"
                        type="text"
                        placeholder="Название должности"
                        name="title"
                        defaultValue={offer.title}
                        />
                    </div>
                    <div className="createOffers__form-block">
                        <select name="employment" className="createOffers__form-block-input" defaultValue={offer.employment}>
                            <option value="">--Тип работы--</option>
                            <option value="Стажировка">Стажировка</option>
                            <option value="Практика">Практика</option>
                            <option value="Волонтерство">Волонтерство</option>
                            <option value="Работа">Работа</option>
                        </select>
                    </div>
                    <div className="createOffers__form-block">
                        <select name="format" className="createOffers__form-block-input" defaultValue={offer.format}>
                            <option value="">--Формат работы--</option>
                            <option value="В офисе">В офисе</option>
                            <option value="Удаленный">Удаленный</option>
                            <option value="Гибридный">Гибридный</option>
                            <option value="Разъездной">Разъездной</option>
                        </select>
                    </div>
                    <div className="createOffers__form-block">
                        <textarea
                        className="createOffers__form-block-input"
                        placeholder="Описание"
                        name="description"
                        defaultValue={offer.description}
                        />
                    </div>
                    <div className="createOffers__form-block">
                        <textarea
                        className="createOffers__form-block-input"
                        placeholder="Требования"
                        name="requirements"
                        defaultValue={offer.requirements}
                        />
                    </div>
                    <div className="createOffers__form-block">
                        <select name="speciality" className="createOffers__form-block-input" defaultValue={offer.speciality}>
                            <option value="">--Специальность студента --</option>
                            <option value="ИТ">ИТ</option>
                            <option value="Экономика">Экономика</option>
                            <option value="Юриспруденция">Юриспруденция</option>
                            <option value="Педагог">Педагог</option>
                        </select>
                    </div>
                    <div className="createOffers__form-block">
                        <select name="city" className="createOffers__form-block-input" defaultValue={offer.city}>
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
                        defaultValue={offer.salary}
                        />
                    </div>
                    <div className="createOffers__form-button">
                        <Link to="/TableOffers" className="createOffers-back">Назад</Link>
                        <button className="createOffers__form-button-submit" type="submit">Сохранить</button>
                    </div>
                </form>
                ))}
            </div>
        </main>
    )
}