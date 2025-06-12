import React, { useEffect, useState } from "react";
import { Link } from 'react-router-dom';
import { useNavigate } from 'react-router-dom';
import OfferCard from "../components/OfferCard";

export default function TableOffers() {
  const [offers, setOffers] = useState([]);
  const navigate = useNavigate();
  const [viewsCount, setViewsCount] = useState([]);
  const paramOffer = 'my';

  useEffect(() => {
    fetch("/api/tableOffers.php", {
      method: "POST",
      credentials: 'include',
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: new URLSearchParams({ paramOffer })
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
  
    fetch('/api/deleteOffer.php', {
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
      .catch((error) => {
        console.error('Ошибка удаления:', error); 
      });
  }

  useEffect(() => {
      fetch("/api/getViewsCount.php", {
        method: "Get",
        credentials: 'include',
      })
        .then((response) => response.json())
        .then((data) => {
          if (data.status === 'true') {
            setViewsCount(data.views);
            console.log(data.views);
          }
        })
        .catch((error) => {
          console.error("Ошибка:", error);
        });
    }, []);

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
                {offers.map((offer) => (
                  <li key={offer.id} className="offer-card__item">
                      <div className="offer-card__body">
                        <div className="offer-card__created_at">{offer.created_at}</div>
                        <div>
                          <button className="offer-card__button-del" onClick={() => handleDelete(offer.id)}>
                            <img src="/img/garbage.svg" alt="garbage"/>
                          </button>
                          <button onClick={() => navigate(`/TableOffers/EditOffers/${offer.id}`)} className="offer-card__button-edit">
                            <img src="/img/edit.svg" alt="edit"/>
                          </button> 
                        </div>
                      </div>

                       <OfferCard offer={offer} viewsCount={viewsCount} />
                  </li>
                ))}
            </ul>
      )}
        </div>
    </main>
  );
}