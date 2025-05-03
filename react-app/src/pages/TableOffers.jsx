import React, { useEffect, useState } from "react";
import { Link } from 'react-router-dom';
import { useNavigate } from 'react-router-dom';

export default function TableOffers() {
  const [offers, setOffers] = useState([]);
  const navigate = useNavigate();

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

  function handleDelete(id) {
    if (!window.confirm('Удалить эту вакансию?')) return;
  
    fetch('http://localhost/api/deleteOffer.php', {
      method: 'POST',
      credentials: 'include',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: `id=${id}`,
    })
      .then((res) => res.json())
      .then((data) => {
        if (data.status === 'success') {
          // Удаляем из состояния
          setOffers(prev => prev.filter(offer => offer.id !== id));
        } else {
          alert('Ошибка удаления');
        }
      })
      .catch((err) => {
        console.error('Ошибка удаления:', err);
      });
  }

  return (
    <main className="TableOffers">
        <div className="TableOffers__inner container">
        <header className="TableOffers__header">
            <h1>Список вакансий</h1>
            <Link to="/TableOffers/CreateOffers" className="TableOffers__create-offers">Создать</Link>
        </header>
        {offers.length === 0 ? (
        <p>Вакансий пока нет</p>
      ) : (
            <ul className="TableOffers__list">
                {offers.map((offer, index) => (
                    <li key={index} className="offer-card__item">
                      <div className="offer-card__body">
                        <div className="offer-card__created_at">{offer.created_at}</div>
                        <div>
                        <button className="offer-card__button-del" onClick={() => handleDelete(offer.id)}><img src="../../public/img/garbage.svg" alt="garbage"/></button>
                          <button onClick={() => navigate(`/TableOffers/EditOffers/${offer.id}`)} className="offer-card__button-edit"><img src="../../public/img/edit.svg" alt="edit"/></button> 
                        </div>
                        
                      </div>
                        <h3 className="offer-card__title">
                            {offer.title}
                        </h3>
                        <div className="offer-card__employment">{offer.employment}</div>
            
                        <div className="offer-card__footer">
                          <div className="offer-card__footer-speciality">{offer.speciality}</div>
                          <div className="offer-card__footer-city">{offer.city}</div>
                          <div className="offer-card__footer-format">{offer.format}</div>
                          <div className="offer-card__footer-salary">{offer.salary ? `${offer.salary}₽` : "сдельная"}</div>
                        </div>
                    </li>
                ))}
            </ul>
      )}
        </div>
    </main>
  );
}