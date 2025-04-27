import React from "react";
import { Link } from 'react-router-dom';

export default function HeaderAdmin(){
    return(
        <>
            <ul className="header__menu-list">
                <li className="header__menu-item">
                    <a href="/" className="header__menu-link">Редактировать</a>
                </li>

                <li className="header__menu-item">
                    <a href="/" className="header__menu-link">Письма</a>
                </li>
                <li className="header__menu-item">
                    <Link to='/users' className="header__menu-link">Пользователи</Link>
                </li>
                <li className="header__menu-item">
                    <a href="../scripts/logout.php" className="header__menu-link">Выход</a>
                </li>
            </ul>
            <ul className="mobile-overlay__list">
                <li className="mobile-overlay__item">
                    <a href="" className="mobile-overlay__link">Редактировать</a>
                </li>
                <li className="mobile-overlay__item">
                    <a href="" className="mobile-overlay__link">Письма</a>
                </li>
                <li className="mobile-overlay__item">
                    <Link to='/users' className="header__menu-link">Пользователи</Link>
                </li>
                <li className="mobile-overlay__item">
                    <a href="../scripts/logout.php" className="mobile-overlay__link">Выйти</a>
                </li>
            </ul>
        </>
    )
}