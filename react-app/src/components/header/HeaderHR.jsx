import React from "react";
import DropdownItem from '../../scripts/DropdownItem';
import { Link } from 'react-router-dom';
import Logout from '../../scripts/Logout'

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
              <a href="" className="dropdown-menu__link">О практке</a>
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
              <Link to='/ResponseUsers' className="dropdown-menu__link">Отклики</Link>
            </li>
          </ul>
        </DropdownItem>

        <li className="header__menu-item">
          <Link to='/CreateMessage' className="header__menu-link">Помощь</Link>
        </li>
        <li className="header__menu-item">
        < Logout />
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
          <a href="" className="dropdown-menu__link">О практке</a>
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
          <Link to='/ResponseUsers' className="dropdown-menu__link">Отклики</Link>
        </li>
      </DropdownItem>


      <li className="mobile-overlay__item">
        <a href="" className="mobile-overlay__link">Помощь</a>
      </li>
      <li className="mobile-overlay__item">
      < Logout />
      </li>
    </ul>
        </>
    )
}