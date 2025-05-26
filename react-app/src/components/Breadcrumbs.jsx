import React from 'react';
import { Link, useLocation } from 'react-router-dom';

const breadcrumbNameMap = {
  "OllOffers": "Все вакансии",
  "PageOffer": "Просмотр вакансии",
  "TableOffers": "Мои вакансии",
  "CreateOffers": "Создать вакансию",
  "EditOffers": "Редактировать вакансию",
  "Resume": "Моё резюме",
  "AnswersHr": "Мои отклики",
  "ResponseUsers": "Отклики",
  "TableMessage": "Письма",
  "CreateMessage": "Обратная связь",
  "Message": "Сообщение",
  "Registration": "Регистрация",
  "login": "Авторизация",
  "ViewingResume": "Просмотр резюме",
  "generate-resume-pdf": "PDF резюме"
};

export default function Breadcrumbs() {
  const location = useLocation();

  const pathnames = location.pathname
    .split('/')
    .filter(x => x && isNaN(x) && !x.match(/^[0-9a-fA-F]{24}$/));

  return (
    <nav className="breadcrumbs container">
      <Link to="/">Главная</Link>
      {pathnames.map((name, index) => {
        const routeTo = '/' + pathnames.slice(0, index + 1).join('/');
        const isLast = index === pathnames.length - 1;
        const translatedName = breadcrumbNameMap[name] || decodeURIComponent(name);

        const isBlocked = name === 'PageOffer';

        return (
          <span key={index}> / {
            (isLast || isBlocked)
              ? <span>{translatedName}</span>
              : <Link to={routeTo}>{translatedName}</Link>
          }</span>
        );
      })}
    </nav>
  );
}