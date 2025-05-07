-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Май 07 2025 г., 10:28
-- Версия сервера: 8.0.39
-- Версия PHP: 8.2.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `usersdb`
--

-- --------------------------------------------------------

--
-- Структура таблицы `offers`
--

CREATE TABLE `offers` (
  `id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `description` text COLLATE utf8mb4_general_ci NOT NULL,
  `requirements` text COLLATE utf8mb4_general_ci NOT NULL,
  `speciality` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `salary` int DEFAULT NULL,
  `city` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `format` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `employment` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `offers`
--

INSERT INTO `offers` (`id`, `title`, `description`, `requirements`, `speciality`, `salary`, `city`, `user_id`, `created_at`, `format`, `employment`) VALUES
(1, 'Бухгалтер', 'Описанvsdvssdvsvdsdvvие вакансииsdvsv \r\nsdvs\r\n\r\n- sdv\r\n- sdv\r\n- sdv\r\n- sdv', 'Требования к кандидату', 'Экономика', NULL, 'Пенза', 2, '2025-04-29 16:12:23', 'В офисе', 'Стажировка'),
(2, 'moodle разработчик', 'много работать', 'Высшее образование;\r\nОпыт программирования на PHP;\r\nОпыт разработки API (SOAP, REST);\r\nОпыт работы со сторонними API;\r\nХорошее знание SQL;\r\nОпыт проектирования реляционных БД.\r\nОпыт работы с Postgresql.\r\nОтличное знание git;\r\nУмение писать тесты;\r\nОпыт проектирования реляционных БД.\r\nОпыт работы с Postgresql.\r\nОтличное знание git;\r\nУмение писать тесты;', 'ИТ', NULL, 'Москва', 2, '2025-04-29 22:41:49', 'Удаленный', 'Стажировка'),
(3, '1c', 'много работать', 'аааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааааа', 'IT', 45000, 'Москва', 2, '2025-04-30 19:31:49', 'удаленно', 'Полная'),
(6, 'Системеый администратор', 'много работать', 'аи', 'IT', 45000, 'Москва', 3, '2025-05-01 11:40:22', 'удаленно', 'Полная'),
(7, 'Дваи', 'ваи', 'ива', 'ИТ', 3252, 'Пенза', 2, '2025-05-01 21:15:49', 'ваи', 'ив'),
(11, 'вма', 'sdv', 'мва', 'Экономика', NULL, 'Пенза', 17, '2025-05-02 16:31:07', 'вма', 'ам'),
(12, '11111111', '111111111', '111111111', 'ИТ', NULL, 'Пенза', 17, '2025-05-03 00:30:37', '111111111', '11111111'),
(14, 'bv', 'fbd', 'dfb', 'ИТ', NULL, 'Москва', 2, '2025-05-03 16:13:14', 'dfb', 'dfb'),
(15, 'test', '**ваив**\r\n*ваиваи*\r\n\r\n- \r\n- ваи\r\n- ваи\r\n- ваи', 'test', 'Педагог', NULL, 'Рязань', 2, '2025-05-06 20:44:06', 'Разъездной', 'Работа');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `UserName` varchar(25) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `pass` varchar(25) COLLATE utf8mb4_general_ci NOT NULL,
  `role` varchar(25) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `UserName`, `pass`, `role`, `email`) VALUES
(1, 'admin', 'admin', 'admin', NULL),
(2, 'HR', 'HR', 'HR', NULL),
(3, 'student', 'student', 'student', NULL),
(15, 'Stepanida', 'Streyf', 'admin', 'Stepanida525@gmail.com'),
(17, '1111', '1111', 'HR', 'dfbd@dfb.com'),
(18, 'Stepanida', 'Stepanida525', 'HR', 'Stepanida525@gmail.com'),
(19, 'Stepanida', 'Stepanida525', 'HR', 'Stepanida525@gmail.com'),
(20, '1111', '1111', 'HR', 'dfbd@dfb.com');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user` (`user_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `offers`
--
ALTER TABLE `offers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `offers`
--
ALTER TABLE `offers`
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
