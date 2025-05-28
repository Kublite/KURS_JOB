-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Май 28 2025 г., 11:44
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
-- Структура таблицы `applications`
--

CREATE TABLE `applications` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `offer_id` int DEFAULT NULL,
  `status` varchar(50) COLLATE utf8mb4_general_ci DEFAULT 'pending',
  `applied_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `applications`
--

INSERT INTO `applications` (`id`, `user_id`, `offer_id`, `status`, `applied_at`) VALUES
(4, 3, 2, 'approved', '2025-05-18 00:59:40'),
(5, 19, 3, 'expectation', '2025-05-18 01:30:04'),
(6, 3, 1, 'rejected', '2025-05-20 17:18:12'),
(7, 3, 6, 'expectation', '2025-05-20 17:18:17'),
(8, 3, 15, 'expectation', '2025-05-25 13:16:48');

-- --------------------------------------------------------

--
-- Структура таблицы `favorites`
--

CREATE TABLE `favorites` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `offer_id` int DEFAULT NULL,
  `added_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `logs`
--

CREATE TABLE `logs` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `action` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_general_ci,
  `timestamp` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `messages`
--

CREATE TABLE `messages` (
  `id` int NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `contact_info` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `message` text COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `messages`
--

INSERT INTO `messages` (`id`, `subject`, `full_name`, `contact_info`, `message`, `created_at`) VALUES
(1, 'dfbd', 'dfbdfb', 'dfbdfb', 'jbdf,vm dfkdfnvd sdfkbvnsdm dsfknvsdf sre;lrtytm ashvc gbrfmjroihs scdhsvgrlkmv ', '2025-05-22 22:09:50'),
(2, '`11111', '1111111', '11111111', '111111111111', '2025-05-22 22:42:30');

-- --------------------------------------------------------

--
-- Структура таблицы `notifications`
--

CREATE TABLE `notifications` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `message` text COLLATE utf8mb4_general_ci,
  `is_read` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(15, 'test', '**ваив**\r\n*ваиваи*\r\n\r\n- \r\n- ваи\r\n- ваи\r\n- ваи', 'test', 'Педагог', NULL, 'Рязань', 2, '2025-05-06 20:44:06', 'Разъездной', 'Работа'),
(16, 'test', '# 👋 Добро пожаловать на платформу HH-Clone\r\n\r\n---\r\n\r\n## 🌐 О нас\r\n\r\n> Мы создаём удобные сервисы для поиска работы и подбора сотрудников.  \r\n> Наша цель — **соединить лучших специалистов и компании**.\r\n\r\n---\r\n\r\n## 💼 Актуальные вакансии\r\n\r\n| Вакансия               | Зарплата   | Город             | Опыт     |\r\n|------------------------|------------|-------------------|----------|\r\n| Frontend-разработчик   | 120 000 ₽  | Москва            | от 1 года|\r\n| HR-менеджер            | 90 000 ₽   | Казань            | от 2 лет |\r\n| Юрист                  | 100 000 ₽  | Санкт-Петербург   | от 3 лет |\r\n\r\n---\r\n\r\n## 🛠 Что вы можете:\r\n\r\n- 🔍 Найти вакансию\r\n- 📝 Создать резюме\r\n- 📥 Получить отклики\r\n- 📊 Следить за статистикой\r\n\r\n---\r\n\r\n## 🧭 Как начать?\r\n\r\n1. Зарегистрируйтесь\r\n2. Заполните профиль\r\n3. Добавьте резюме или вакансию\r\n4. Получите результат!\r\n\r\n---\r\n\r\n## 🖼 Пример интерфейса\r\n\r\n![Пример интерфейса](https://placehold.co/600x200/EEE/31343C?text=Интерфейс+сайта)\r\n\r\n---\r\n\r\n## 📬 Контакты\r\n\r\nsupport@hh-clone.ru\r\n+7 (999) 000-00-00\r\nг. Москва, ул. Примерная, д. 1\r\n\r\nyaml\r\nКопировать\r\nРедактировать\r\n\r\n---\r\n\r\n© 2025 HH-Clone. Все права защищены.', 'test', 'ИТ', NULL, 'Москва', 2, '2025-05-26 10:55:00', 'test', 'test');

-- --------------------------------------------------------

--
-- Структура таблицы `resumes`
--

CREATE TABLE `resumes` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `full_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `desired_position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `telegram` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `git` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `speciality` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `photo_path` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `description` text COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `resumes`
--

INSERT INTO `resumes` (`id`, `user_id`, `full_name`, `desired_position`, `city`, `phone`, `email`, `telegram`, `git`, `speciality`, `photo_path`, `created_at`, `description`) VALUES
(7, 3, 'Степан Кубышкин', '', 'Москва', '89267633808', 'Stepanida525@gmail.com', '', '', '', 'uploads/1746746553_unknown.png', '2025-05-08 23:22:25', 'ваиваиваиврпрьпртп ваиваиногр амиваиваивааи');

-- --------------------------------------------------------

--
-- Структура таблицы `site_content`
--

CREATE TABLE `site_content` (
  `id` int NOT NULL,
  `page` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `section` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `uploads`
--

CREATE TABLE `uploads` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `file_path` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `uploaded_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(20, '1111', '1111', 'HR', 'dfbd@dfb.com'),
(23, '222222222222', '222222222222222222', 'admin', '222222222222@gmail.com');

-- --------------------------------------------------------

--
-- Структура таблицы `views`
--

CREATE TABLE `views` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `offer_id` int DEFAULT NULL,
  `resume_id` int DEFAULT NULL,
  `viewed_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `views`
--

INSERT INTO `views` (`id`, `user_id`, `offer_id`, `resume_id`, `viewed_at`) VALUES
(1, 3, 1, NULL, '2025-05-24 01:39:42'),
(2, 3, 2, NULL, '2025-05-24 01:39:47'),
(3, 1, 1, NULL, '2025-05-24 01:40:22'),
(4, 3, 15, NULL, '2025-05-25 13:16:47'),
(5, 2, 15, NULL, '2025-05-25 13:17:19'),
(6, 3, 16, NULL, '2025-05-26 13:55:20');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `applications`
--
ALTER TABLE `applications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `offer_id` (`offer_id`);

--
-- Индексы таблицы `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `offer_id` (`offer_id`);

--
-- Индексы таблицы `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user` (`user_id`);

--
-- Индексы таблицы `resumes`
--
ALTER TABLE `resumes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `site_content`
--
ALTER TABLE `site_content`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `uploads`
--
ALTER TABLE `uploads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `views`
--
ALTER TABLE `views`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `offer_id` (`offer_id`),
  ADD KEY `resume_id` (`resume_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `applications`
--
ALTER TABLE `applications`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `offers`
--
ALTER TABLE `offers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT для таблицы `resumes`
--
ALTER TABLE `resumes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `site_content`
--
ALTER TABLE `site_content`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `uploads`
--
ALTER TABLE `uploads`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT для таблицы `views`
--
ALTER TABLE `views`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `applications`
--
ALTER TABLE `applications`
  ADD CONSTRAINT `applications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `applications_ibfk_2` FOREIGN KEY (`offer_id`) REFERENCES `offers` (`id`);

--
-- Ограничения внешнего ключа таблицы `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `favorites_ibfk_2` FOREIGN KEY (`offer_id`) REFERENCES `offers` (`id`);

--
-- Ограничения внешнего ключа таблицы `logs`
--
ALTER TABLE `logs`
  ADD CONSTRAINT `logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ограничения внешнего ключа таблицы `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ограничения внешнего ключа таблицы `offers`
--
ALTER TABLE `offers`
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `resumes`
--
ALTER TABLE `resumes`
  ADD CONSTRAINT `resumes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `uploads`
--
ALTER TABLE `uploads`
  ADD CONSTRAINT `uploads_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ограничения внешнего ключа таблицы `views`
--
ALTER TABLE `views`
  ADD CONSTRAINT `views_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `views_ibfk_2` FOREIGN KEY (`offer_id`) REFERENCES `offers` (`id`),
  ADD CONSTRAINT `views_ibfk_3` FOREIGN KEY (`resume_id`) REFERENCES `resumes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
