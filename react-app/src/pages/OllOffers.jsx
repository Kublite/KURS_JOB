import React, { useEffect, useState } from "react";
import OfferFilters from '../components/OfferFilters';

export default function TableOffers() {
  const [isFilterOpen, setIsFilterOpen] = useState(false);
  const [offers, setOffers] = useState([]);
  const[filters, setFilters]=useState({
          employment:'',
          format:'',
          speciality:'',
          city:'',
      })

  useEffect(() => {
    fetch("http://localhost/api/tableOffers.php", {
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

  return (
    <main className="TableOffers">
        <div className="TableOffers__inner container">
        <header className="TableOffers__header">
            <h1>Список вакансий</h1>
            <div className="TableOffers__info">
              <div className="TableOffers__lenght">{offers.length} вакансий</div>
              <button className="TableOffers__open-filter" onClick={() => setIsFilterOpen(prev => !prev)}>
                <img src="../../public/img/filter.svg" alt="filter" width="24"
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
                    <li key={offer.id} className="offer-card__item">
                      <div className="offer-card__body">
                        <div className="offer-card__created_at">{offer.created_at}</div>
                      </div>
                        <h3 className="offer-card__title">
                            {offer.title}
                        </h3>
                        <div className="offer-card__employment">{offer.employment}</div>
                        <div className="offer-card__requirements">{offer.requirements}</div>
                        <div className="offer-card__footer">
                          <div className="offer-card__footer-speciality">{offer.speciality}</div>
                          <div className="offer-card__footer-city">{offer.city}</div>
                          <div className="offer-card__footer-format">{offer.format}</div>
                          <div className="offer-card__footer-salary">{offer.salary ? `${offer.salary}₽` : "сдельная"}</div>
                        </div>
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