import React from "react";

export default function OfferFilters({filters, setFilters}){

    return(<div className="offers-filters">
        <form action="" className="offers-filters__form">
            <div className="offers-filters__title">Фильтры</div>
            <div className="offers-filters__form-block">
            <p className="offers-filters__name">Тип работы</p>
              <select value={filters.employment} onChange={(e) => setFilters({ ...filters, employment: e.target.value })} name="employment" className="offers-filters__form-block-select">
                <option value="">Тип работы</option>
                <option value="Стажировка">Стажировка</option>
                <option value="Практика">Практика</option>
                <option value="Волонтерство">Волонтерство</option>
                <option value="Работа">Работа</option>
              </select>
            </div>
            <div className="offers-filters__form-block">
            <p className="offers-filters__name">Формат работы</p>
              <select value={filters.format} onChange={(e) => setFilters({ ...filters, format: e.target.value })} name="format" className="offers-filters__form-block-select">
                <option value="">Формат работы</option>
                <option value="В офисе">В офисе</option>
                <option value="Удаленный">Удаленный</option>
                <option value="Гибридный">Гибридный</option>
                <option value="Разъездной">Разъездной</option>
              </select>
            </div>
            <div className="offers-filters__form-block">
            <p className="offers-filters__name">Специальность</p>
              <select value={filters.speciality} onChange={(e) => setFilters({ ...filters, speciality: e.target.value })} name="speciality" className="offers-filters__form-block-select">
                <option value="">Специальность</option>
                <option value="ИТ">ИТ</option>
                <option value="Экономика">Экономика</option>
                <option value="Юриспруденция">Юриспруденция</option>
                <option value="Педагог">Педагог</option>
              </select>
            </div>
            <div className="offers-filters__form-block">
            <p className="offers-filters__name">Формат работы</p>
              <select value={filters.city} onChange={(e) => setFilters({ ...filters, city: e.target.value })} name="city" className="createOffers__form-block-input">
                <option value="">Город</option>
                <option value="Москва">Москва и МО</option>
                <option value="Пенза">Пенза</option>
                <option value="Нижний Новгород">Нижний Новгород</option>
                <option value="Сергиев Посад">Сергиев Посад</option>
                <option value="Ростов-на-Дону">Ростов-на-Дону</option>
                <option value="Рязань">Рязань</option>
              </select>
            </div>
            <div className="offers-filters__form-button">
              <button className="offers-filters__form-button-back" >Сбросить</button>
            </div>
        </form>
      </div>)
}