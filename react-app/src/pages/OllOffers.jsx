import React, { useEffect, useState } from "react";
import OfferFilters from '../components/OfferFilters';
import OfferCard from "../components/OfferCard";
import { useNavigate } from 'react-router-dom';

export default function OllOffers() {
  const navigate = useNavigate();
  const [isFilterOpen, setIsFilterOpen] = useState(false);
  const [offers, setOffers] = useState([]);
  const [viewsCount, setViewsCount] = useState([]);
  const [favorites, setFavorites] = useState([]);
  const[filters, setFilters]=useState({
          employment:'',
          format:'',
          speciality:'',
          city:'',
      })

  useEffect(() => {
    fetch("/api/tableOffers.php", {
      method: "Get",
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
  const filteredOffers = offers.filter((offer) => {
    return (
      (!filters.city || offer.city === filters.city) &&
      (!filters.employment || offer.employment === filters.employment) &&
      (!filters.format || offer.format === filters.format)&&
      (!filters.speciality || offer.speciality === filters.speciality)
    );
  });

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

  useEffect(() => {
    fetch("/api/getFavorites.php", {
      method: "Get",
      credentials: 'include',
    })
      .then((response) => response.json())
      .then((data) => {
        if (data.status === 'true') {
          setFavorites(data.favorites);
          console.log(data.favorites);
        }
      })
      .catch((error) => {
        console.error("Ошибка:", error);
      });
  }, []);

  const isFavorite = (offerId) => {
    return favorites.some((fav) => fav.offer_id === offerId.toString());
  };

  return (
    
    <main className="TableOffers">
        <div className="TableOffers__inner container">
        <header className="TableOffers__header">
            <h1>Список вакансий</h1>
            <div className="TableOffers__info">
              <div className="TableOffers__lenght">{offers.length} вакансий</div>
              <button className="TableOffers__open-filter" onClick={() => setIsFilterOpen(prev => !prev)}>
                <img src="/img/filter.svg" alt="filter" width="24"
                  height="24"/>
                
              </button>
            </div>
        </header>
        {offers.length === 0 ? (
        <p>Вакансий пока нет</p>
      ) : (
        <>
        {isFilterOpen && (
              <div className="offers-filters__mobile">
                <OfferFilters filters={filters} setFilters={setFilters}/>
              </div>
            )}
          <div className="TableOffers__content">
            <ul className="TableOffers__list">
                {filteredOffers.map((offer) => (
                    <li key={offer.id} className="offer-card__item" onClick={() => navigate(`/OllOffers/PageOffer/${offer.id}`)}> 
                      <div className="offer-card__body">
                        <div className="offer-card__created_at">
                          {offer.created_at}
                          </div>
                        <div>
                          <button className="offer-card__favorites" >
                            {isFavorite(offer.id) ? (
                              <img width="30px" src="/img/favoritesON.svg" alt="favorites" />
                            ) : (
                              <img width="30px" src="/img/favoritesOFF.svg" alt="favorites" />
                            )}
                          </button>
                        </div>
                      </div>
                      <OfferCard offer={offer} viewsCount={viewsCount} />
                    </li>
                ))}
            </ul>
            <div className="offers-filters__desktop"><OfferFilters filters={filters} setFilters={setFilters}/></div>
          </div>
          </>
      )}
        </div>
    </main>
  );
}