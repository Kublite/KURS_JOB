import React, { useEffect, useState } from "react";
import { Link } from 'react-router-dom';

export default function TableOffers() {
  const [offers, setOffers] = useState([]);

  useEffect(() => {
    fetch("http://localhost/api/tableOffers.php", {
      method: "GET",
      credentials: 'include',
    })
      .then((response) => response.json())
      .then((data) => {
        if (data.status === 'true') {
          setOffers(data.offers);
          console.log(data.offers);
        }
      })
      .catch((error) => {
        console.error("Ошибка загрузки вакансий:", error);
      });
  }, []);

  return (
    <main className="TableOffers">
        <div className="TableOffers__inner container">
        <header className="TableOffers__header">
            <h1>Список вакансий</h1>
            <Link to='/TableOffers/CreateOffers' className="TableOffers__create-offers">Создать</Link>
        </header>
        {offers.length === 0 ? (
        <p>Вакансий пока нет</p>
      ) : (
            <ul className="TableOffers__list">
                {offers.map((offer, index) => (
                    <li key={index} className="offer-card__body">
                        <div className="offer-card__created_at">{offer.created_at}</div>
                        <h3 className="offer-card__title">
                            {offer.title}
                        </h3>
                        <div className="offer-card__employment">{offer.employment}</div>
                        <div className="offer-card__footer">
                          <div className="offer-card__footer-speciality">Cпециальность:<br/>{offer.speciality}</div>
                          <div className="offer-card__footer-city">Город:<br/>{offer.city}</div>
                          <div className="offer-card__footer-format">Занятость:<br/>{offer.format}</div>
                          <div className="offer-card__footer-salary">Доход:<br/>{offer.salary ? `${offer.salary}₽` : "сдельная"}</div>
                        </div>
                    </li>
                ))}
            </ul>
      )}
        </div>
      {/* <h1>Список вакансий</h1>
      {offers.length === 0 ? (
        <p>Вакансий пока нет</p>
      ) : (
        <ul>
          {offers.map((offer, index) => (
            <li key={index}>
              <strong>{offer.title}</strong> — {offer.speciality}, {offer.city}, {offer.salary}₽  
              <br />
              <small>Размещено: {offer.created_at}</small>
            </li>
          ))}
        </ul>
      )} */}
    </main>
  );
}