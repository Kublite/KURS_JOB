import React from "react";
import DropdownItem from '../../scripts/DropdownItem';
import { Link } from 'react-router-dom';

export default function HeaderHR(){
    return(
        <>
            <ul className="header__menu-list">
        <DropdownItem title="Инфо">
          <ul className="dropdown-menu__list">
            <li className="dropdown-menu__item">
              <a href="" className="dropdown-menu__link">О центре</a>
            </li>
            <li className="dropdown-menu__item">
              <a href="" className="dropdown-menu__link">Новости</a>
            </li>
            <li className="dropdown-menu__item">
              <a href="" className="dropdown-menu__link">Работодателям</a>
            </li>
            <li className="dropdown-menu__item">
              <a href="" className="dropdown-menu__link">Партнеры</a>
            </li>
          </ul>
          </DropdownItem>

        <DropdownItem title="HR">
          <ul className="dropdown-menu__list">
            <li className="dropdown-menu__item">
              <Link to='/TableOffers' className="dropdown-menu__link">Вакансии</Link>
            </li>
            <li className="dropdown-menu__item">
              <a href="" className="dropdown-menu__link">Резюме</a>
            </li>
            <li className="dropdown-menu__item">
              <a href="" className="dropdown-menu__link">Отклики</a>
            </li>
          </ul>
        </DropdownItem>

        <li className="header__menu-item">
          <a href="/" className="header__menu-link">Помощь</a>
        </li>
        <li className="header__menu-item">
          <a href="../scripts/logout.php" className="header__menu-link">Профиль</a>
        </li>
      </ul>
      <ul className="mobile-overlay__list">
      <DropdownItem title="Инфо">
        <li className="dropdown-menu__item">
          <a href="" className="dropdown-menu__link">О центре</a>
        </li>
        <li className="dropdown-menu__item">
          <a href="" className="dropdown-menu__link">Новости</a>
        </li>
        <li className="dropdown-menu__item">
          <a href="" className="dropdown-menu__link">Работодателям</a>
        </li>
        <li className="dropdown-menu__item">
          <a href="" className="dropdown-menu__link">Партнеры</a>
        </li>
      </DropdownItem>

      <DropdownItem title="HR">
        <li className="dropdown-menu__item">
          <Link to='/TableOffers' className="dropdown-menu__link">Вакансии</Link>
        </li>
        <li className="dropdown-menu__item">
          <a href="" className="dropdown-menu__link">Резюме</a>
        </li>
        <li className="dropdown-menu__item">
          <a href="" className="dropdown-menu__link">Отклики</a>
        </li>
      </DropdownItem>


      <li className="mobile-overlay__item">
        <a href="" className="mobile-overlay__link">Помощь</a>
      </li>
      <li className="mobile-overlay__item">
        <a href="../scripts/logout.php" className="mobile-overlay__link">Профиль</a>
      </li>
    </ul>
        </>
    )
}