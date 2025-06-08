import React from "react";
import { Link } from 'react-router-dom';
import Logout from '../../scripts/Logout'

export default function HeaderAdmin(){
    return(
        <>
            <ul className="header__menu-list">
                <li className="header__menu-item">
                    <Link to='/' className="header__menu-link">Редактировать</Link>
                </li>

                <li className="header__menu-item">
                    <Link to='/TableMessage' className="header__menu-link">Письма</Link>
                </li>
                <li className="header__menu-item">
                    <Link to='/Registration' className="header__menu-link">Пользователи</Link>
                </li>
                <li className="header__menu-item">
                    < Logout />
                </li>
            </ul>
            <ul className="mobile-overlay__list">
                <li className="mobile-overlay__item">
                    <Link to='/' className="header__menu-link">Редактировать</Link>
                </li>
                <li className="mobile-overlay__item">
                    <Link to='/TableMessage' className="header__menu-link">Письма</Link>
                </li>
                <li className="mobile-overlay__item">
                    <Link to='/users' className="header__menu-link">Пользователи</Link>
                </li>
                <li className="mobile-overlay__item">
                    < Logout />
                </li>
            </ul>
        </>
    )
}