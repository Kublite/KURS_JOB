import React from "react";
import { Link } from 'react-router-dom';
import DropdownItem from '../../scripts/DropdownItem';

export default function HeaderNone(){
    return(<>
    <ul className="header__menu-list">
        <DropdownItem title="Инфо">
        <ul className="dropdown-menu__list">
        <li className="dropdown-menu__item">
            <Link to='/' className="dropdown-menu__link">О центре</Link>
        </li>
        <li className="dropdown-menu__item">
            <Link to='/News' className="dropdown-menu__link">Новости</Link>
        </li>
        <li className="dropdown-menu__item">
            <Link to='/Rabotodatelyam' className="dropdown-menu__link">Работодателям</Link>
        </li>
        <li className="dropdown-menu__item">
            <Link to='/Praktika' className="dropdown-menu__link">О практке</Link>
        </li>
        </ul>
        </DropdownItem>
        <li className="dropdown-menu__item">
            <Link to='/Login' className="dropdown-menu__link">Вход</Link>
        </li>
    </ul>
    <ul className="mobile-overlay__list">
    <li className="dropdown-menu__item">
            <Link to='/' className="dropdown-menu__link">О центре</Link>
        </li>
        <li className="dropdown-menu__item">
            <Link to='/News' className="dropdown-menu__link">Новости</Link>
        </li>
        <li className="dropdown-menu__item">
            <Link to='/Rabotodatelyam' className="dropdown-menu__link">Работодателям</Link>
        </li>
        <li className="dropdown-menu__item">
            <Link to='/Praktika' className="dropdown-menu__link">О практке</Link>
        </li>
        <li className="dropdown-menu__item">
            <Link to='/Login' className="dropdown-menu__link">Вход</Link>
        </li>
    </ul>
    </>)}