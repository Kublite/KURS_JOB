import React from 'react';

export default function Footer(){
    return(
<footer className="footer">
  <div className="footer__inner container">
    <div className="footer__body">
      <nav className="footer__menu">
        <div className="footer__menu-column">
          <span className="footer__menu-main-name">Где нас найти</span>
          <ul className="footer__menu-list">
            <li className="footer__menu-item">
              <a href="/" className="footer__menu-link"
                >г. Москва, 2-й Кожуховский пр-д, 12, стр.1 Главный корпус, 1
                этаж, кабинет №111</a>
            </li>
          </ul>
        </div>
        <div className="footer__menu-column">
          <span className="footer__menu-main-name">Время работы</span>
          <ul className="footer__menu-list">
            <li className="footer__menu-item">
              <a href="/" className="footer__menu-link">Пн.-чт.: 09.00-17.00</a>
            </li>
            <li className="footer__menu-item">
              <a href="/" className="footer__menu-link">Пт.: 09.00-16.00</a>
            </li>
          </ul>
        </div>
        <div className="footer__menu-column">
          <span className="footer__menu-main-name">Телефон центра</span>
          <ul className="footer__menu-list">
            <li className="footer__menu-item">
              <a href="tel:+74957836848" className="footer__menu-link"
                >+7 (495) 783-68-48, доб.5119
                </a>
            </li>
          </ul>
        </div>
        <div className="footer__menu-column">
          <span className="footer__menu-main-name">Ссылки</span>
          <ul className="footer__menu-list">
            <li className="footer__menu-item">
              <a href="/" className="footer__menu-link">Карта сайта</a>
            </li>
            <li className="footer__menu-item">
              <a href="/" className="footer__menu-link"
                ><img src="../img\VK.svg" alt=""
              /></a>
            </li>
            <li className="footer__menu-item">
              <a href="/" className="footer__menu-link"
                ><img src="../img/TG.svg" alt=""
              /></a>
            </li>
            <li className="footer__menu-item">
              <a href="/" className="footer__menu-link"
                ><img src="../img\YT.svg" alt=""
              /></a>
            </li>
          </ul>
        </div>
      </nav>
      <p>Кубышкин Степан Семенович</p>
    </div>
  </div>
</footer>
    )
}