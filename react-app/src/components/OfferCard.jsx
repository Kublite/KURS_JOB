import React from "react";

export default function OfferCard({ offer, viewsCount }){
    return(
        <>
            <h3 className="offer-card__title">
                {offer.title}
            </h3>
            <div className="offer-card__employment">{offer.employment}</div>
            <div className="offer-card__requirements">{offer.requirements}</div>
            <div className="offer-card__views">
                Просмотров: {viewsCount[offer.id] || 0}
            </div>
            <div className="offer-card__footer">
                <div className="offer-card__footer-speciality">{offer.speciality}</div>
                <div className="offer-card__footer-city">{offer.city}</div>
                <div className="offer-card__footer-format">{offer.format}</div>
                <div className="offer-card__footer-salary">{offer.salary ? `${offer.salary}₽` : "сдельная"}</div>
            </div>
        </>
    )
}