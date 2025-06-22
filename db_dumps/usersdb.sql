-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Июн 22 2025 г., 15:07
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
(39, 3, 19, 'approved', '2025-06-15 01:18:30');

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

--
-- Дамп данных таблицы `favorites`
--

INSERT INTO `favorites` (`id`, `user_id`, `offer_id`, `added_at`) VALUES
(8, 3, 21, '2025-06-13 04:10:50');

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

--
-- Дамп данных таблицы `logs`
--

INSERT INTO `logs` (`id`, `user_id`, `action`, `details`, `timestamp`) VALUES
(11, 3, 'changeFavorites', 'удаление вакансии из избранного: 18', '2025-06-13 19:49:13'),
(12, 3, 'changeFavorites', 'добавление вакансии в избранное: 18', '2025-06-13 19:49:14'),
(13, 3, 'logout', 'выход из системы', '2025-06-13 19:49:22'),
(14, 2, 'login', 'Успешная авторизация', '2025-06-13 19:49:27'),
(15, 2, 'createOffer', 'Создана вакансия', '2025-06-13 19:49:53'),
(16, 2, 'deleteOffer', 'Успещное удаление вакансии: 22', '2025-06-13 19:50:06'),
(17, 2, 'logout', 'выход из системы', '2025-06-13 19:53:11'),
(18, 3, 'login', 'Успешная авторизация', '2025-06-13 19:53:17'),
(19, 3, 'updateResume', 'Обновление резюме', '2025-06-13 19:53:26'),
(20, 3, 'logout', 'выход из системы', '2025-06-13 19:56:53'),
(21, 1, 'login', 'Успешная авторизация', '2025-06-13 19:57:01'),
(23, NULL, 'register', 'Зарегистрирован пользователь: \'1111', '2025-06-13 19:58:42'),
(24, NULL, 'register', 'Зарегистрирован пользователь: \'1111', '2025-06-13 20:00:22'),
(25, NULL, 'register', 'Зарегистрирован пользователь: \'1111', '2025-06-13 20:00:23'),
(26, 3, 'login', 'Успешная авторизация', '2025-06-14 01:04:27'),
(27, 3, 'logout', 'выход из системы', '2025-06-14 01:04:36'),
(28, 3, 'login', 'Успешная авторизация', '2025-06-14 01:04:40'),
(29, 3, 'logout', 'выход из системы', '2025-06-14 01:05:13'),
(30, 3, 'login', 'Успешная авторизация', '2025-06-14 01:05:18'),
(31, 3, 'logout', 'выход из системы', '2025-06-14 01:05:49'),
(32, 3, 'login', 'Успешная авторизация', '2025-06-14 01:05:54'),
(33, 3, 'updateResume', 'Обновление резюме', '2025-06-14 01:08:16'),
(34, 3, 'logout', 'выход из системы', '2025-06-14 01:10:15'),
(35, 3, 'login', 'Успешная авторизация', '2025-06-14 01:10:19'),
(36, 3, 'logout', 'выход из системы', '2025-06-14 02:40:55'),
(37, 3, 'login', 'Успешная авторизация', '2025-06-14 02:40:59'),
(38, 3, 'responce', 'Отклик отправлен', '2025-06-14 02:43:03'),
(39, 3, 'updateResume', 'Обновление резюме', '2025-06-14 02:43:39'),
(40, 3, 'logout', 'выход из системы', '2025-06-14 03:19:33'),
(41, 1, 'login', 'Успешная авторизация', '2025-06-14 03:19:39'),
(42, NULL, 'register', 'Зарегистрирован пользователь: \'1111', '2025-06-14 03:20:13'),
(43, NULL, 'register', 'Зарегистрирован пользователь: \'1111', '2025-06-14 03:21:05'),
(44, NULL, 'register', 'Зарегистрирован пользователь: \'1111', '2025-06-14 03:25:24'),
(45, NULL, 'register', 'Зарегистрирован пользователь: \'student', '2025-06-14 03:25:42'),
(46, NULL, 'register', 'Зарегистрирован пользователь: \'student', '2025-06-14 03:26:05'),
(47, NULL, 'register', 'Зарегистрирован пользователь: \'student', '2025-06-14 03:29:03'),
(48, NULL, 'register', 'Зарегистрирован пользователь: \'student', '2025-06-14 03:29:41'),
(49, NULL, 'register', 'Зарегистрирован пользователь: \'student', '2025-06-14 03:30:12'),
(50, NULL, 'register', 'Зарегистрирован пользователь: \'1111', '2025-06-14 03:39:00'),
(51, 1, 'register', 'Зарегистрирован пользователь: 1111', '2025-06-14 03:44:54'),
(52, 1, 'updatePage', 'Обновление страницы: CareerCenter', '2025-06-14 03:49:13'),
(53, 1, 'updatePage', 'Обновление страницы: CareerCenter', '2025-06-14 03:50:54'),
(54, 1, 'logout', 'выход из системы', '2025-06-14 03:51:29'),
(55, 3, 'login', 'Успешная авторизация', '2025-06-14 03:51:34'),
(56, 3, 'responce', 'Повторный отклик', '2025-06-14 03:55:00'),
(57, 3, 'updateResume', 'Обновление резюме', '2025-06-14 03:57:53'),
(58, 3, 'sendMessage', 'Сообщение отправлено', '2025-06-14 04:08:40'),
(59, 3, 'sendMessage', 'Сообщение отправлено', '2025-06-14 04:09:03'),
(60, 3, 'sendMessage', 'Сообщение отправлено', '2025-06-14 04:09:26'),
(61, 3, 'sendMessage', 'Сообщение отправлено', '2025-06-14 04:09:57'),
(62, 3, 'sendMessage', 'Сообщение отправлено', '2025-06-14 04:11:18'),
(63, 3, 'sendMessage', 'Сообщение отправлено', '2025-06-14 04:11:43'),
(64, 3, 'sendMessage', 'Сообщение отправлено', '2025-06-14 04:16:59'),
(65, 3, 'logout', 'выход из системы', '2025-06-14 04:17:17'),
(66, 2, 'login', 'Успешная авторизация', '2025-06-14 04:17:23'),
(67, 2, 'deleteOffer', 'Успещное удаление вакансии: 23', '2025-06-14 04:19:25'),
(68, 2, 'updateOffer', 'Обновлена вакансия: 18', '2025-06-14 04:22:41'),
(69, 2, 'deleteOffer', 'Успещное удаление вакансии: 24', '2025-06-14 04:24:44'),
(70, 2, 'deleteOffer', 'Успещное удаление вакансии: 25', '2025-06-14 04:25:53'),
(71, 2, 'updateApplications', 'Обновил статус отклика ID=9 на \"approved\"', '2025-06-14 15:05:50'),
(72, 2, 'updateApplications', 'Обновил статус отклика ID=10 на \"approved\"', '2025-06-14 15:07:48'),
(73, 2, 'updateApplications', 'Обновил статус отклика ID=10 на \"rejected\"', '2025-06-14 15:07:51'),
(74, 2, 'logout', 'выход из системы', '2025-06-14 15:07:55'),
(75, 3, 'login', 'Успешная авторизация', '2025-06-14 15:08:00'),
(76, 3, 'logout', 'выход из системы', '2025-06-14 15:08:09'),
(77, 2, 'login', 'Успешная авторизация', '2025-06-14 15:08:13'),
(78, 2, 'logout', 'выход из системы', '2025-06-14 15:15:48'),
(79, 3, 'login', 'Успешная авторизация', '2025-06-14 15:15:52'),
(80, 3, 'responce', 'Отклик отправлен', '2025-06-14 15:15:59'),
(81, 3, 'responce', 'Повторный отклик', '2025-06-14 15:16:58'),
(82, 3, 'responce', 'Отклик отправлен', '2025-06-14 15:17:04'),
(83, 3, 'logout', 'выход из системы', '2025-06-14 15:18:42'),
(84, 2, 'login', 'Успешная авторизация', '2025-06-14 15:18:50'),
(85, 2, 'updateApplications', 'Обновил статус отклика ID=11 на \"approved\"', '2025-06-14 15:18:57'),
(86, 2, 'updateApplications', 'Обновил статус отклика ID=12 на \"rejected\"', '2025-06-14 15:19:02'),
(87, 2, 'logout', 'выход из системы', '2025-06-14 15:19:07'),
(88, 3, 'login', 'Успешная авторизация', '2025-06-14 15:19:10'),
(89, 3, 'responce', 'Отклик отправлен', '2025-06-14 20:51:24'),
(90, 3, 'logout', 'выход из системы', '2025-06-14 20:51:31'),
(91, 2, 'login', 'Успешная авторизация', '2025-06-14 20:51:36'),
(92, 2, 'updateApplications', 'Обновил статус отклика: 13', '2025-06-14 20:52:24'),
(93, 2, 'logout', 'выход из системы', '2025-06-14 20:53:15'),
(94, 3, 'login', 'Успешная авторизация', '2025-06-14 20:53:19'),
(95, 3, 'responce', 'Отклик отправлен', '2025-06-14 20:53:25'),
(96, 3, 'responce', 'Повторный отклик', '2025-06-14 20:53:28'),
(97, 3, 'logout', 'выход из системы', '2025-06-14 20:53:30'),
(98, 2, 'login', 'Успешная авторизация', '2025-06-14 20:53:35'),
(99, 2, 'updateApplications', 'Обновил статус отклика: 14', '2025-06-14 20:54:32'),
(100, 2, 'updateApplications', 'Обновил статус отклика: 14', '2025-06-14 20:54:33'),
(101, 2, 'updateApplications', 'Обновил статус отклика: 14', '2025-06-14 20:54:33'),
(102, 2, 'updateApplications', 'Обновил статус отклика: 14', '2025-06-14 20:54:33'),
(103, 2, 'updateApplications', 'Обновил статус отклика: 14', '2025-06-14 20:54:33'),
(104, 2, 'updateApplications', 'Обновил статус отклика: 14', '2025-06-14 20:54:33'),
(105, 2, 'updateApplications', 'Обновил статус отклика: 14', '2025-06-14 20:54:34'),
(106, 2, 'updateApplications', 'Обновил статус отклика: 14', '2025-06-14 20:54:34'),
(107, 2, 'updateApplications', 'Обновил статус отклика: 14', '2025-06-14 20:54:34'),
(108, 2, 'updateApplications', 'Обновил статус отклика: 14', '2025-06-14 20:54:34'),
(109, 2, 'updateApplications', 'Обновил статус отклика: 14', '2025-06-14 20:59:13'),
(110, 2, 'logout', 'выход из системы', '2025-06-14 20:59:17'),
(111, 3, 'login', 'Успешная авторизация', '2025-06-14 20:59:27'),
(112, 3, 'responce', 'Отклик отправлен', '2025-06-14 20:59:34'),
(113, 3, 'logout', 'выход из системы', '2025-06-14 20:59:37'),
(114, 2, 'login', 'Успешная авторизация', '2025-06-14 20:59:41'),
(115, 2, 'updateApplications', 'Обновил статус отклика: 15', '2025-06-14 20:59:49'),
(116, 2, 'logout', 'выход из системы', '2025-06-14 21:03:18'),
(117, 3, 'login', 'Успешная авторизация', '2025-06-14 21:03:22'),
(118, 3, 'responce', 'Отклик отправлен', '2025-06-14 21:03:27'),
(119, 3, 'responce', 'Отклик отправлен', '2025-06-14 21:03:31'),
(120, 3, 'responce', 'Отклик отправлен', '2025-06-14 21:03:35'),
(121, 3, 'logout', 'выход из системы', '2025-06-14 21:03:37'),
(122, 2, 'login', 'Успешная авторизация', '2025-06-14 21:03:42'),
(123, 2, 'updateApplications', 'Обновил статус отклика: 18', '2025-06-14 21:03:50'),
(124, 2, 'updateApplications', 'Обновил статус отклика: 17', '2025-06-14 21:05:04'),
(125, 2, 'updateApplications', 'Обновил статус отклика: 16', '2025-06-14 21:05:07'),
(126, 2, 'logout', 'выход из системы', '2025-06-14 21:05:25'),
(127, 3, 'login', 'Успешная авторизация', '2025-06-14 21:05:29'),
(128, 3, 'responce', 'Отклик отправлен', '2025-06-14 21:05:33'),
(129, 3, 'responce', 'Отклик отправлен', '2025-06-14 21:05:37'),
(130, 3, 'responce', 'Отклик отправлен', '2025-06-14 21:05:41'),
(131, 3, 'logout', 'выход из системы', '2025-06-14 21:05:46'),
(132, 2, 'login', 'Успешная авторизация', '2025-06-14 21:05:50'),
(133, 2, 'updateApplications', 'Обновил статус отклика: 20', '2025-06-14 21:06:31'),
(134, 2, 'updateApplications', 'Обновил статус отклика: 19', '2025-06-14 21:09:13'),
(135, 2, 'updateApplications', 'Обновил статус отклика: 21', '2025-06-14 21:22:44'),
(136, 2, 'logout', 'выход из системы', '2025-06-14 21:24:35'),
(137, 3, 'login', 'Успешная авторизация', '2025-06-14 21:24:40'),
(138, 3, 'logout', 'выход из системы', '2025-06-14 21:26:21'),
(139, 2, 'login', 'Успешная авторизация', '2025-06-14 21:26:26'),
(140, 2, 'logout', 'выход из системы', '2025-06-14 21:26:37'),
(141, 3, 'login', 'Успешная авторизация', '2025-06-14 21:26:41'),
(142, 3, 'responce', 'Отклик отправлен', '2025-06-14 21:26:46'),
(143, 3, 'responce', 'Отклик отправлен', '2025-06-14 21:26:48'),
(144, 3, 'responce', 'Отклик отправлен', '2025-06-14 21:26:51'),
(145, 3, 'logout', 'выход из системы', '2025-06-14 21:27:04'),
(146, 2, 'login', 'Успешная авторизация', '2025-06-14 21:27:08'),
(147, 2, 'updateApplications', 'Обновил статус отклика: 24', '2025-06-14 21:27:18'),
(148, 2, 'updateApplications', 'Обновил статус отклика: 24', '2025-06-14 21:28:46'),
(149, 2, 'updateApplications', 'Обновил статус отклика: 23', '2025-06-14 21:34:19'),
(150, 2, 'logout', 'выход из системы', '2025-06-14 22:10:28'),
(151, 3, 'login', 'Успешная авторизация', '2025-06-14 22:10:33'),
(152, 3, 'responce', 'Повторный отклик', '2025-06-14 22:10:42'),
(153, 3, 'responce', 'Повторный отклик', '2025-06-14 22:11:18'),
(154, 3, 'responce', 'Отклик отправлен', '2025-06-14 22:15:02'),
(155, 3, 'responce', 'Отклик отправлен', '2025-06-14 22:15:05'),
(156, 3, 'responce', 'Отклик отправлен', '2025-06-14 22:15:09'),
(157, 3, 'logout', 'выход из системы', '2025-06-14 22:15:19'),
(158, 2, 'login', 'Успешная авторизация', '2025-06-14 22:15:24'),
(159, 2, 'updateApplications', 'Обновил статус отклика: 25', '2025-06-14 22:22:26'),
(160, 2, 'updateApplications', 'Обновил статус отклика: 26', '2025-06-14 22:22:29'),
(161, 2, 'logout', 'выход из системы', '2025-06-14 22:23:29'),
(162, 3, 'login', 'Успешная авторизация', '2025-06-14 22:23:33'),
(163, 3, 'responce', 'Отклик отправлен', '2025-06-14 22:23:38'),
(164, 3, 'responce', 'Отклик отправлен', '2025-06-14 22:23:41'),
(165, 3, 'responce', 'Отклик отправлен', '2025-06-14 22:23:45'),
(166, 3, 'logout', 'выход из системы', '2025-06-14 22:23:47'),
(167, 2, 'login', 'Успешная авторизация', '2025-06-14 22:23:51'),
(168, 2, 'updateApplications', 'Обновил статус отклика: 30', '2025-06-14 22:25:05'),
(169, 2, 'updateApplications', 'Обновил статус отклика: 28', '2025-06-14 22:25:07'),
(170, 2, 'updateApplications', 'Обновил статус отклика: 29', '2025-06-14 22:25:11'),
(171, 2, 'logout', 'выход из системы', '2025-06-14 22:34:42'),
(172, 3, 'login', 'Успешная авторизация', '2025-06-14 22:34:51'),
(173, 3, 'logout', 'выход из системы', '2025-06-14 22:35:25'),
(174, 2, 'login', 'Успешная авторизация', '2025-06-14 22:35:29'),
(175, 2, 'logout', 'выход из системы', '2025-06-14 22:35:33'),
(176, 3, 'login', 'Успешная авторизация', '2025-06-14 22:35:37'),
(177, 3, 'responce', 'Отклик отправлен', '2025-06-14 22:35:42'),
(178, 3, 'responce', 'Отклик отправлен', '2025-06-14 22:35:48'),
(179, 3, 'logout', 'выход из системы', '2025-06-14 22:35:51'),
(180, 2, 'login', 'Успешная авторизация', '2025-06-14 22:35:56'),
(181, 2, 'updateApplications', 'Обновил статус отклика: 32', '2025-06-14 22:36:00'),
(182, 2, 'updateApplications', 'Обновил статус отклика: 31', '2025-06-14 22:36:07'),
(183, 2, 'logout', 'выход из системы', '2025-06-14 22:36:14'),
(184, 3, 'login', 'Успешная авторизация', '2025-06-14 22:38:55'),
(185, 3, 'responce', 'Отклик отправлен', '2025-06-14 22:39:00'),
(186, 3, 'responce', 'Отклик отправлен', '2025-06-14 22:39:02'),
(187, 3, 'responce', 'Отклик отправлен', '2025-06-14 22:39:05'),
(188, 3, 'responce', 'Повторный отклик', '2025-06-14 22:39:05'),
(189, 3, 'logout', 'выход из системы', '2025-06-14 22:39:08'),
(190, 2, 'login', 'Успешная авторизация', '2025-06-14 22:39:12'),
(191, 2, 'updateApplications', 'Обновил статус отклика: 35', '2025-06-14 22:39:17'),
(192, 2, 'updateApplications', 'Обновил статус отклика: 33', '2025-06-14 22:40:03'),
(193, 2, 'updateApplications', 'Обновил статус отклика: 34', '2025-06-14 22:40:06'),
(194, 2, 'logout', 'выход из системы', '2025-06-14 22:42:32'),
(195, 3, 'login', 'Успешная авторизация', '2025-06-14 22:42:47'),
(196, 3, 'responce', 'Отклик отправлен', '2025-06-14 22:42:52'),
(197, 3, 'responce', 'Отклик отправлен', '2025-06-14 22:42:57'),
(198, 3, 'responce', 'Отклик отправлен', '2025-06-14 22:43:00'),
(199, 3, 'logout', 'выход из системы', '2025-06-14 22:43:06'),
(200, 2, 'login', 'Успешная авторизация', '2025-06-14 22:43:10'),
(201, 2, 'updateApplications', 'Обновил статус отклика: 38', '2025-06-14 22:43:22'),
(202, 2, 'updateApplications', 'Обновил статус отклика: 38', '2025-06-14 22:44:09'),
(203, 2, 'updateApplications', 'Обновил статус отклика: 36', '2025-06-14 22:48:08'),
(204, 2, 'updateApplications', 'Обновил статус отклика: 38', '2025-06-14 22:49:12'),
(205, 2, 'updateApplications', 'Обновил статус отклика: 38', '2025-06-14 22:50:04'),
(206, 2, 'updateApplications', 'Обновил статус отклика: 36', '2025-06-14 22:50:19'),
(207, 2, 'updateApplications', 'Обновил статус отклика: 37', '2025-06-14 22:58:40'),
(208, 2, 'updateApplications', 'Обновил статус отклика: 38', '2025-06-14 22:59:20'),
(209, 2, 'updateApplications', 'Обновил статус отклика: 36', '2025-06-14 23:00:22'),
(210, 2, 'updateApplications', 'Обновил статус отклика: 38', '2025-06-14 23:01:30'),
(211, 2, 'updateApplications', 'Обновил статус отклика: 36', '2025-06-14 23:02:37'),
(212, 2, 'updateApplications', 'Обновил статус отклика: 37', '2025-06-14 23:02:53'),
(213, 2, 'logout', 'выход из системы', '2025-06-14 23:03:01'),
(214, 3, 'login', 'Успешная авторизация', '2025-06-14 23:12:59'),
(215, 3, 'logout', 'выход из системы', '2025-06-14 23:13:02'),
(216, 2, 'login', 'Успешная авторизация', '2025-06-14 23:13:08'),
(217, 2, 'updateApplications', 'Обновил статус отклика: 38', '2025-06-14 23:13:13'),
(218, 2, 'updateApplications', 'Обновил статус отклика: 36', '2025-06-14 23:13:14'),
(219, 2, 'logout', 'выход из системы', '2025-06-14 23:13:21'),
(220, 3, 'login', 'Успешная авторизация', '2025-06-14 23:13:25'),
(221, 3, 'logout', 'выход из системы', '2025-06-15 00:58:55'),
(222, 2, 'login', 'Успешная авторизация', '2025-06-15 00:59:00'),
(223, 2, 'sendMessage', 'Сообщение отправлено', '2025-06-15 01:04:11'),
(224, 2, 'logout', 'выход из системы', '2025-06-15 01:04:13'),
(225, 1, 'login', 'Успешная авторизация', '2025-06-15 01:04:17'),
(226, 1, 'logout', 'выход из системы', '2025-06-15 01:12:08'),
(227, 2, 'login', 'Успешная авторизация', '2025-06-15 01:12:13'),
(228, 2, 'logout', 'выход из системы', '2025-06-15 01:18:11'),
(229, 3, 'login', 'Успешная авторизация', '2025-06-15 01:18:16'),
(230, 3, 'responce', 'Отклик отправлен', '2025-06-15 01:18:31'),
(231, 3, 'logout', 'выход из системы', '2025-06-15 01:18:34'),
(232, 2, 'login', 'Успешная авторизация', '2025-06-15 01:18:39'),
(233, 2, 'updateApplications', 'Обновил статус отклика: 39', '2025-06-15 01:42:35'),
(234, 2, 'logout', 'выход из системы', '2025-06-15 01:42:38'),
(235, 2, 'login', 'Успешная авторизация', '2025-06-15 01:47:04'),
(236, 2, 'logout', 'выход из системы', '2025-06-15 01:47:10'),
(237, 3, 'login', 'Успешная авторизация', '2025-06-15 01:47:14'),
(238, 3, 'logout', 'выход из системы', '2025-06-15 01:49:26'),
(239, 3, 'login', 'Успешная авторизация', '2025-06-15 02:03:07'),
(240, 3, 'login', 'Успешная авторизация', '2025-06-19 15:42:11'),
(241, 3, 'login', 'Успешная авторизация', '2025-06-19 16:11:23'),
(242, 3, 'updateResume', 'Обновление резюме', '2025-06-19 19:53:41'),
(243, 3, 'updateResume', 'Обновление резюме', '2025-06-19 19:54:28'),
(244, 3, 'updateResume', 'Обновление резюме', '2025-06-19 20:01:05'),
(245, 3, 'updateResume', 'Обновление резюме', '2025-06-19 21:20:31'),
(246, 3, 'updateResume', 'Обновление резюме', '2025-06-19 21:22:26'),
(247, 3, 'updateResume', 'Обновление резюме', '2025-06-19 21:23:22'),
(248, 3, 'updateResume', 'Обновление резюме', '2025-06-19 21:28:09'),
(249, 3, 'updateResume', 'Обновление резюме', '2025-06-19 21:28:45'),
(250, 3, 'logout', 'выход из системы', '2025-06-19 21:29:33'),
(251, 2, 'login', 'Успешная авторизация', '2025-06-19 21:29:43'),
(252, 2, 'logout', 'выход из системы', '2025-06-19 21:29:56'),
(253, 3, 'login', 'Успешная авторизация', '2025-06-19 21:29:58'),
(254, 3, 'logout', 'выход из системы', '2025-06-19 21:33:47'),
(255, 2, 'login', 'Успешная авторизация', '2025-06-19 21:33:56'),
(256, 2, 'updateOffer', 'Обновлена вакансия: 19', '2025-06-19 21:37:31'),
(257, 2, 'logout', 'выход из системы', '2025-06-19 21:39:19'),
(258, 3, 'login', 'Успешная авторизация', '2025-06-19 21:39:21'),
(259, 3, 'logout', 'выход из системы', '2025-06-19 21:39:33'),
(260, 2, 'login', 'Успешная авторизация', '2025-06-19 21:39:42'),
(261, 2, 'updateOffer', 'Обновлена вакансия: 18', '2025-06-19 21:41:40'),
(262, 2, 'logout', 'выход из системы', '2025-06-19 21:41:57'),
(263, 3, 'login', 'Успешная авторизация', '2025-06-19 21:42:00'),
(264, 3, 'logout', 'выход из системы', '2025-06-19 21:42:15'),
(265, 2, 'login', 'Успешная авторизация', '2025-06-19 21:42:22'),
(266, 2, 'updateOffer', 'Обновлена вакансия: 21', '2025-06-19 21:50:20'),
(267, 2, 'logout', 'выход из системы', '2025-06-19 21:50:29'),
(268, 3, 'login', 'Успешная авторизация', '2025-06-19 21:50:31'),
(269, 3, 'logout', 'выход из системы', '2025-06-19 21:53:50'),
(270, 2, 'login', 'Успешная авторизация', '2025-06-19 21:53:55'),
(271, 2, 'logout', 'выход из системы', '2025-06-19 22:22:32'),
(272, 3, 'login', 'Успешная авторизация', '2025-06-19 22:22:37'),
(273, 3, 'updateResume', 'Обновление резюме', '2025-06-19 22:29:13'),
(274, 3, 'updateResume', 'Обновление резюме', '2025-06-19 22:29:20'),
(275, 3, 'login', 'Успешная авторизация', '2025-06-20 13:22:11'),
(276, 3, 'updateResume', 'Обновление резюме', '2025-06-20 15:10:33'),
(277, 3, 'updateResume', 'Обновление резюме', '2025-06-20 17:01:30'),
(278, 3, 'updateResume', 'Обновление резюме', '2025-06-20 17:02:34'),
(279, 3, 'updateResume', 'Обновление резюме', '2025-06-20 17:03:44'),
(280, 3, 'updateResume', 'Обновление резюме', '2025-06-20 17:09:00'),
(281, 3, 'updateResume', 'Обновление резюме', '2025-06-20 17:11:22'),
(282, 3, 'updateResume', 'Обновление резюме', '2025-06-20 17:20:37'),
(283, 3, 'updateResume', 'Обновление резюме', '2025-06-20 17:23:46'),
(284, 3, 'updateResume', 'Обновление резюме', '2025-06-20 17:24:52'),
(285, 3, 'updateResume', 'Обновление резюме', '2025-06-20 17:26:14'),
(286, 3, 'updateResume', 'Обновление резюме', '2025-06-20 17:27:27'),
(287, 3, 'updateResume', 'Обновление резюме', '2025-06-20 17:29:34'),
(288, 3, 'login', 'Успешная авторизация', '2025-06-20 22:23:36'),
(289, 3, 'logout', 'выход из системы', '2025-06-20 23:26:29'),
(290, 3, 'login', 'Успешная авторизация', '2025-06-21 01:18:24'),
(291, 3, 'changeFavorites', 'добавление вакансии в избранное: 19', '2025-06-21 01:18:35'),
(292, 3, 'changeFavorites', 'удаление вакансии из избранного: 19', '2025-06-21 01:18:39'),
(293, 3, 'changeFavorites', 'удаление вакансии из избранного: 18', '2025-06-21 01:18:39'),
(294, 3, 'updateResume', 'Обновление резюме', '2025-06-21 01:30:09'),
(295, 3, 'updateResume', 'Обновление резюме', '2025-06-21 01:34:52'),
(296, 3, 'updateResume', 'Обновление резюме', '2025-06-21 01:43:37'),
(297, 3, 'updateResume', 'Обновление резюме', '2025-06-21 01:43:49'),
(298, 3, 'updateResume', 'Обновление резюме', '2025-06-21 01:56:59'),
(299, 3, 'updateResume', 'Обновление резюме', '2025-06-21 01:57:07'),
(300, 3, 'updateResume', 'Обновление резюме', '2025-06-21 02:03:40'),
(301, 3, 'updateResume', 'Обновление резюме', '2025-06-21 02:04:33'),
(302, 3, 'updateResume', 'Обновление резюме', '2025-06-21 02:12:05'),
(303, 3, 'updateResume', 'Обновление резюме', '2025-06-21 02:12:40'),
(304, 3, 'updateResume', 'Обновление резюме', '2025-06-21 02:20:51'),
(305, 3, 'logout', 'выход из системы', '2025-06-21 02:22:43'),
(306, 1, 'login', 'Успешная авторизация', '2025-06-21 02:23:10'),
(307, 1, 'logout', 'выход из системы', '2025-06-21 02:50:15'),
(308, 3, 'login', 'Успешная авторизация', '2025-06-21 02:50:26'),
(309, 3, 'logout', 'выход из системы', '2025-06-21 02:50:33'),
(310, 3, 'login', 'Успешная авторизация', '2025-06-21 02:50:39'),
(311, 3, 'logout', 'выход из системы', '2025-06-21 02:50:45'),
(312, 1, 'login', 'Успешная авторизация', '2025-06-21 02:50:50'),
(313, 1, 'login', 'Успешная авторизация', '2025-06-21 23:46:01'),
(314, 1, 'login', 'Успешная авторизация', '2025-06-22 00:42:05'),
(315, 1, 'updateOffer', 'Обновлен пользователь: 2222', '2025-06-22 01:18:33');

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
(10, 'цысфы', 'сыфысф', 'фысфыс', 'фысфыс', '2025-06-15 01:04:10');

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

--
-- Дамп данных таблицы `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `message`, `is_read`, `created_at`) VALUES
(15, 3, 'Статус отклика изменён', 1, '2025-06-14 23:13:13'),
(16, 3, 'Статус отклика изменён', 1, '2025-06-14 23:13:14'),
(17, 1, 'Вам пришло письмо', 1, '2025-06-15 01:04:11'),
(18, 2, 'Новый отклик на вашу вакансию', 1, '2025-06-15 01:18:31'),
(19, 3, 'Статус вашего отклика изменён', 1, '2025-06-15 01:42:35'),
(20, 3, 'Вы успешно обновили резюме', 1, '2025-06-19 19:53:41'),
(21, 3, 'Вы успешно обновили резюме', 1, '2025-06-19 19:54:28'),
(22, 3, 'Вы успешно обновили резюме', 1, '2025-06-19 20:01:05'),
(23, 3, 'Вы успешно обновили резюме', 1, '2025-06-19 21:20:31'),
(24, 3, 'Вы успешно обновили резюме', 1, '2025-06-19 21:22:26'),
(25, 3, 'Вы успешно обновили резюме', 1, '2025-06-19 21:23:22'),
(26, 3, 'Вы успешно обновили резюме', 1, '2025-06-19 21:28:09'),
(27, 3, 'Вы успешно обновили резюме', 1, '2025-06-19 21:28:45'),
(28, 3, 'Вы успешно обновили резюме', 1, '2025-06-19 22:29:13'),
(29, 3, 'Вы успешно обновили резюме', 0, '2025-06-19 22:29:20'),
(30, 3, 'Вы успешно обновили резюме', 0, '2025-06-20 15:10:33'),
(31, 3, 'Вы успешно обновили резюме', 0, '2025-06-20 17:01:30'),
(32, 3, 'Вы успешно обновили резюме', 0, '2025-06-20 17:02:34'),
(33, 3, 'Вы успешно обновили резюме', 0, '2025-06-20 17:03:44'),
(34, 3, 'Вы успешно обновили резюме', 0, '2025-06-20 17:09:00'),
(35, 3, 'Вы успешно обновили резюме', 0, '2025-06-20 17:11:23'),
(36, 3, 'Вы успешно обновили резюме', 0, '2025-06-20 17:20:37'),
(37, 3, 'Вы успешно обновили резюме', 1, '2025-06-20 17:23:46'),
(38, 3, 'Вы успешно обновили резюме', 1, '2025-06-20 17:24:52'),
(39, 3, 'Вы успешно обновили резюме', 1, '2025-06-20 17:26:14'),
(40, 3, 'Вы успешно обновили резюме', 1, '2025-06-20 17:27:27'),
(41, 3, 'Вы успешно обновили резюме', 1, '2025-06-20 17:29:34'),
(42, 3, 'Вы успешно обновили резюме', 1, '2025-06-21 01:30:09'),
(43, 3, 'Вы успешно обновили резюме', 1, '2025-06-21 01:34:52'),
(44, 3, 'Вы успешно обновили резюме', 1, '2025-06-21 01:43:37'),
(45, 3, 'Вы успешно обновили резюме', 1, '2025-06-21 01:43:49'),
(46, 3, 'Вы успешно обновили резюме', 1, '2025-06-21 01:57:00'),
(47, 3, 'Вы успешно обновили резюме', 1, '2025-06-21 01:57:08'),
(48, 3, 'Вы успешно обновили резюме', 1, '2025-06-21 02:03:40'),
(49, 3, 'Вы успешно обновили резюме', 1, '2025-06-21 02:04:33'),
(50, 3, 'Вы успешно обновили резюме', 1, '2025-06-21 02:12:05'),
(51, 3, 'Вы успешно обновили резюме', 1, '2025-06-21 02:12:40'),
(52, 3, 'Вы успешно обновили резюме', 1, '2025-06-21 02:20:51');

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
(18, 'Разработка веб-приложений с использованием современных технологий', '# <span style=\"color: var(--color-accent); font-family: \'Arial\', sans-serif; font-size: 2em; text-transform: uppercase; letter-spacing: 2px; display: block; text-align: center; margin-bottom: 5px; text-shadow: 2px 2px 4px rgba(0,0,0,0.1);\">Frontend Developer Trainee</span>\r\n\r\n<div style=\"background: linear-gradient(90deg, var(--color-dark) 0%, var(--color-accent) 70%, var(--color-dark) 100%); height: 6px; margin: 0 auto 25px auto; width: 80%; border-radius: 3px; box-shadow: 0 2px 4px rgba(0,0,0,0.1);\"></div>\r\n\r\n<div style=\"text-align: center; margin-bottom: 30px;\">\r\n  <span style=\"display: inline-block; color: white; background-color: var(--color-dark); padding: 8px 25px; border-radius: 20px; font-weight: bold; box-shadow: 0 4px 8px rgba(26,56,86,0.3);\">Стажер в веб-разработке</span>\r\n</div>\r\n\r\n---\r\n\r\n## <span style=\"color: var(--color-dark); font-size: 1.5em; display: block; padding-bottom: 8px; border-bottom: 3px double var(--color-accent); margin: 30px 0 20px 0;\">Технические навыки</span>\r\n\r\n<div style=\"display: grid; grid-template-columns: repeat(3, 1fr); gap: 15px; margin-bottom: 30px;\">\r\n\r\n<div style=\"background-color: #fff; padding: 15px; border-radius: 8px; box-shadow: 0 2px 8px rgba(26,56,86,0.1); border-top: 3px solid var(--color-dark);\">\r\n  <h4 style=\"color: var(--color-accent); margin-top: 0; display: flex; align-items: center;\">\r\n    <span style=\"display: inline-block; width: 8px; height: 8px; background-color: var(--color-accent); margin-right: 8px; border-radius: 50%;\"></span>\r\n    Языки\r\n  </h4>\r\n  <ul style=\"padding-left: 20px; margin-bottom: 0;\">\r\n    <li>JavaScript (ES6+)</li>\r\n    <li>Python (Basic)</li>\r\n    <li>HTML5/CSS3</li>\r\n    <li>TypeScript</li>\r\n  </ul>\r\n</div>\r\n\r\n<div style=\"background-color: #fff; padding: 15px; border-radius: 8px; box-shadow: 0 2px 8px rgba(26,56,86,0.1); border-top: 3px solid var(--color-accent);\">\r\n  <h4 style=\"color: var(--color-dark); margin-top: 0; display: flex; align-items: center;\">\r\n    <span style=\"display: inline-block; width: 8px; height: 8px; background-color: var(--color-dark); margin-right: 8px; border-radius: 50%;\"></span>\r\n    Фреймворки\r\n  </h4>\r\n  <ul style=\"padding-left: 20px; margin-bottom: 0;\">\r\n    <li>React.js</li>\r\n    <li>Next.js</li>\r\n    <li>Express</li>\r\n    <li>Django</li>\r\n  </ul>\r\n</div>\r\n\r\n<div style=\"background-color: #fff; padding: 15px; border-radius: 8px; box-shadow: 0 2px 8px rgba(26,56,86,0.1); border-top: 3px solid var(--color-dark);\">\r\n  <h4 style=\"color: var(--color-accent); margin-top: 0; display: flex; align-items: center;\">\r\n    <span style=\"display: inline-block; width: 8px; height: 8px; background-color: var(--color-accent); margin-right: 8px; border-radius: 50%;\"></span>\r\n    Инструменты\r\n  </h4>\r\n  <ul style=\"padding-left: 20px; margin-bottom: 0;\">\r\n    <li>Git/GitHub</li>\r\n    <li>Webpack</li>\r\n    <li>Docker</li>\r\n    <li>Postman</li>\r\n  </ul>\r\n</div>\r\n\r\n</div>\r\n\r\n---\r\n\r\n## <span style=\"color: var(--color-dark); font-size: 1.5em; display: block; padding-bottom: 8px; border-bottom: 3px double var(--color-accent); margin: 30px 0 20px 0;\">Проектный опыт</span>\r\n\r\n<div style=\"background-color: #f8f9fa; padding: 25px; border-radius: 12px; margin-bottom: 25px; box-shadow: 0 4px 12px rgba(0,0,0,0.05); border-left: 5px solid var(--color-accent);\">\r\n  <h3 style=\"color: var(--color-dark); margin-top: 0; display: flex; justify-content: space-between;\">\r\n    <span>Социальная сеть для разработчиков</span>\r\n    <span style=\"color: var(--color-accent); font-weight: normal;\">React | Node.js | MongoDB</span>\r\n  </h3>\r\n  <ul style=\"padding-left: 25px;\">\r\n    <li>Реализовал JWT-аутентификацию</li>\r\n    <li>Создал систему постов и комментариев</li>\r\n    <li>Оптимизировал производительность (уменьшил время загрузки на 35%)</li>\r\n    <li>Настроил CI/CD pipeline</li>\r\n  </ul>\r\n</div>\r\n\r\n<div style=\"background-color: #f8f9fa; padding: 25px; border-radius: 12px; margin-bottom: 25px; box-shadow: 0 4px 12px rgba(0,0,0,0.05); border-left: 5px solid var(--color-dark);\">\r\n  <h3 style=\"color: var(--color-accent); margin-top: 0; display: flex; justify-content: space-between;\">\r\n    <span>Аналитический dashboard</span>\r\n    <span style=\"color: var(--color-dark); font-weight: normal;\">Python | Django | Chart.js</span>\r\n  </h3>\r\n  <ul style=\"padding-left: 25px;\">\r\n    <li>Разработал REST API для обработки данных</li>\r\n    <li>Реализовал интерактивные графики</li>\r\n    <li>Создал систему фильтрации данных</li>\r\n    <li>Автоматизировал отчеты в PDF</li>\r\n  </ul>\r\n</div>\r\n\r\n---\r\n\r\n## <span style=\"color: var(--color-dark); font-size: 1.5em; display: block; padding-bottom: 8px; border-bottom: 3px double var(--color-accent); margin: 30px 0 20px 0;\">Соответствие вакансии</span>\r\n\r\n<div style=\"display: grid; grid-template-columns: 1fr 1fr; gap: 20px; margin-bottom: 30px;\">\r\n\r\n<div style=\"background-color: #fff; padding: 20px; border-radius: 10px; box-shadow: 0 3px 8px rgba(0,0,0,0.08); border: 1px solid var(--color-accent);\">\r\n  <h4 style=\"color: var(--color-dark); margin-top: 0; text-align: center;\">Требования вакансии</h4>\r\n  <ul style=\"padding-left: 20px;\">\r\n    <li>JavaScript/Python</li>\r\n    <li>ООП и алгоритмы</li>\r\n    <li>Работа с Git</li>\r\n    <li>Английский Pre-Intermediate+</li>\r\n    <li>Гибридный формат</li>\r\n  </ul>\r\n</div>\r\n\r\n<div style=\"background-color: #fff; padding: 20px; border-radius: 10px; box-shadow: 0 3px 8px rgba(0,0,0,0.08); border: 1px solid var(--color-dark);\">\r\n  <h4 style=\"color: var(--color-accent); margin-top: 0; text-align: center;\">Мои компетенции</h4>\r\n  <ul style=\"padding-left: 20px;\">\r\n    <li>2 года опыта с JS/Python</li>\r\n    <li>Курсы по алгоритмам (LeetCode)</li>\r\n    <li>15+ репозиториев на GitHub</li>\r\n    <li>Английский B2 (чтение документации)</li>\r\n    <li>Готов к гибридной работе</li>\r\n  </ul>\r\n</div>\r\n\r\n</div>\r\n\r\n---\r\n\r\n<div style=\"background: linear-gradient(90deg, var(--color-dark) 0%, var(--color-accent) 70%, var(--color-dark) 100%); height: 6px; margin: 40px auto 0 auto; width: 80%; border-radius: 3px; box-shadow: 0 2px 4px rgba(0,0,0,0.1);\"></div>\r\n\r\n<div style=\"text-align: center; margin-top: 30px; font-style: italic; color: var(--color-dark); font-size: 0.9em;\">\r\n  \"Код — это поэзия логики, а веб-приложения — ее визуальное воплощение.\"  \r\n  <div style=\"color: var(--color-accent); font-weight: bold; margin-top: 5px;\">— Будущий стажер</div>\r\n</div>\r\n\r\n<style>\r\n  :root {\r\n    --color-dark: #1A3856;\r\n    --color-accent: #C21631;\r\n  }\r\n  ul {\r\n    margin-top: 5px;\r\n  }\r\n  h4 {\r\n    margin-bottom: 10px;\r\n  }\r\n</style>', 'Базовые знания JavaScript/Python\r\nПонимание ООП и алгоритмов\r\nОпыт работы с Git\r\nАнглийский язык (Pre-Intermediate+)', 'ИТ', NULL, 'Москва', 2, '2025-06-09 10:49:32', 'Гибридный', 'Стажировка'),
(19, 'Веб-разработчик', '# <span style=\"color: var(--color-accent); font-family: \'Arial\', sans-serif; font-size: 2em; text-transform: uppercase; letter-spacing: 2px; display: block; text-align: center; margin-bottom: 5px; text-shadow: 2px 2px 4px rgba(0,0,0,0.1);\">Веб-разработчик / Аналитик данных</span>\r\n\r\n<div style=\"background: linear-gradient(90deg, var(--color-dark) 0%, var(--color-accent) 70%, var(--color-dark) 100%); height: 6px; margin: 0 auto 25px auto; width: 80%; border-radius: 3px; box-shadow: 0 2px 4px rgba(0,0,0,0.1);\"></div>\r\n\r\n<div style=\"text-align: center; margin-bottom: 30px;\">\r\n  <span style=\"display: inline-block; color: white; background-color: var(--color-dark); padding: 8px 25px; border-radius: 20px; font-weight: bold; box-shadow: 0 4px 8px rgba(26,56,86,0.3);\">Стажер в МУИВ</span>\r\n</div>\r\n\r\n---\r\n\r\n## <span style=\"color: var(--color-dark); font-size: 1.5em; display: block; padding-bottom: 8px; border-bottom: 3px double var(--color-accent); margin: 30px 0 20px 0;\">Ключевые квалификации</span>\r\n\r\n<div style=\"display: grid; grid-template-columns: repeat(2, 1fr); gap: 20px; margin-bottom: 30px;\">\r\n\r\n<div style=\"background-color: #fff; padding: 20px; border-radius: 8px; box-shadow: 0 2px 10px rgba(26,56,86,0.1); border-left: 4px solid var(--color-dark);\">\r\n  <h4 style=\"color: var(--color-accent); margin-top: 0; display: flex; align-items: center;\">\r\n    <span style=\"display: inline-block; width: 10px; height: 10px; background-color: var(--color-accent); margin-right: 10px; border-radius: 50%;\"></span>\r\n    Технические навыки\r\n  </h4>\r\n  <ul style=\"padding-left: 20px;\">\r\n    <li><strong>Веб-разработка:</strong> HTML5, CSS3, JavaScript</li>\r\n    <li><strong>Анализ данных:</strong> Excel (сводные таблицы, формулы)</li>\r\n    <li><strong>Базы данных:</strong> Базовый SQL (SELECT, JOIN, GROUP BY)</li>\r\n    <li><strong>Инструменты:</strong> Git, VS Code, Figma</li>\r\n  </ul>\r\n</div>\r\n\r\n<div style=\"background-color: #fff; padding: 20px; border-radius: 8px; box-shadow: 0 2px 10px rgba(26,56,86,0.1); border-left: 4px solid var(--color-accent);\">\r\n  <h4 style=\"color: var(--color-dark); margin-top: 0; display: flex; align-items: center;\">\r\n    <span style=\"display: inline-block; width: 10px; height: 10px; background-color: var(--color-dark); margin-right: 10px; border-radius: 50%;\"></span>\r\n    Академические знания\r\n  </h4>\r\n  <ul style=\"padding-left: 20px;\">\r\n    <li><strong>Статистика:</strong> Основные методы анализа</li>\r\n    <li><strong>Математика:</strong> Дискретная математика, Логика</li>\r\n    <li><strong>Программирование:</strong> Алгоритмы и структуры данных</li>\r\n    <li><strong>Информационные системы:</strong> Принципы проектирования</li>\r\n  </ul>\r\n</div>\r\n\r\n</div>\r\n\r\n---\r\n\r\n## <span style=\"color: var(--color-dark); font-size: 1.5em; display: block; padding-bottom: 8px; border-bottom: 3px double var(--color-accent); margin: 30px 0 20px 0;\">Образование</span>\r\n\r\n<div style=\"background-color: #f8f9fa; padding: 25px; border-radius: 12px; margin-bottom: 30px; box-shadow: 0 4px 12px rgba(0,0,0,0.05); border-top: 5px solid var(--color-dark);\">\r\n  <h3 style=\"color: var(--color-accent); margin-top: 0; display: flex; justify-content: space-between;\">\r\n    <span>Московский Университет Информационных Технологий (МУИВ)</span>\r\n    <span style=\"color: var(--color-dark); font-weight: normal;\">2021 - 2025</span>\r\n  </h3>\r\n  <p><strong>Факультет:</strong> Информационных технологий</p>\r\n  <p><strong>Специальность:</strong> \"Веб-разработка\"</p>\r\n  <p><strong>Средний балл:</strong> 4.7</p>\r\n  \r\n  <div style=\"margin-top: 15px; background-color: #e9ecef; padding: 10px; border-radius: 6px;\">\r\n    <strong>Ключевые курсы:</strong> Веб-программирование, Базы данных, Статистические методы, Анализ данных\r\n  </div>\r\n</div>\r\n\r\n---\r\n\r\n## <span style=\"color: var(--color-dark); font-size: 1.5em; display: block; padding-bottom: 8px; border-bottom: 3px double var(--color-accent); margin: 30px 0 20px 0;\">Практический опыт</span>\r\n\r\n<div style=\"display: grid; grid-template-columns: 1fr 1fr; gap: 20px; margin-bottom: 30px;\">\r\n\r\n<div style=\"background-color: #fff; padding: 20px; border-radius: 10px; box-shadow: 0 3px 8px rgba(0,0,0,0.08); border-top: 4px solid var(--color-dark);\">\r\n  <h4 style=\"color: var(--color-accent); margin-top: 0;\">Учебный проект: Анализ данных</h4>\r\n  <p><strong>Технологии:</strong> Excel, SQL</p>\r\n  <ul style=\"padding-left: 20px;\">\r\n    <li>Обработка датасета с 5,000+ записей</li>\r\n    <li>Создание интерактивных отчетов</li>\r\n    <li>Визуализация статистических данных</li>\r\n    <li>Формулирование выводов</li>\r\n  </ul>\r\n</div>\r\n\r\n<div style=\"background-color: #fff; padding: 20px; border-radius: 10px; box-shadow: 0 3px 8px rgba(0,0,0,0.08); border-top: 4px solid var(--color-accent);\">\r\n  <h4 style=\"color: var(--color-dark); margin-top: 0;\">Учебный проект: Веб-приложение</h4>\r\n  <p><strong>Технологии:</strong> HTML, CSS, JavaScript</p>\r\n  <ul style=\"padding-left: 20px;\">\r\n    <li>Разработка интерфейса для работы с данными</li>\r\n    <li>Реализация фильтрации и сортировки</li>\r\n    <li>Адаптивная верстка</li>\r\n    <li>Интеграция с REST API</li>\r\n  </ul>\r\n</div>\r\n\r\n</div>\r\n\r\n---\r\n\r\n## <span style=\"color: var(--color-dark); font-size: 1.5em; display: block; padding-bottom: 8px; border-bottom: 3px double var(--color-accent); margin: 30px 0 20px 0;\">Почему я подхожу на эту позицию</span>\r\n\r\n<div style=\"background-color: #f8f9fa; padding: 20px; border-radius: 10px; margin-bottom: 30px; border-left: 5px solid var(--color-accent);\">\r\n  <h4 style=\"color: var(--color-dark); margin-top: 0;\">1. Соответствие требованиям</h4>\r\n  <p>Мои навыки веб-разработки в сочетании с академическими знаниями статистики и опытом работы с Excel/SQL полностью соответствуют требованиям вакансии.</p>\r\n</div>\r\n\r\n<div style=\"background-color: #f8f9fa; padding: 20px; border-radius: 10px; margin-bottom: 30px; border-left: 5px solid var(--color-dark);\">\r\n  <h4 style=\"color: var(--color-accent); margin-top: 0;\">2. Академическая база МУИВ</h4>\r\n  <p>Как студент МУИВ, я уже знаком с внутренними процессами и стандартами университета, что ускорит мою адаптацию.</p>\r\n</div>\r\n\r\n<div style=\"background-color: #f8f9fa; padding: 20px; border-radius: 10px; margin-bottom: 30px; border-left: 5px solid var(--color-accent);\">\r\n  <h4 style=\"color: var(--color-dark); margin-top: 0;\">3. Готовность развиваться</h4>\r\n  <p>Имею сильную мотивацию для профессионального роста в области веб-разработки и анализа данных.</p>\r\n</div>\r\n\r\n---\r\n\r\n<div style=\"background: linear-gradient(90deg, var(--color-dark) 0%, var(--color-accent) 70%, var(--color-dark) 100%); height: 6px; margin: 40px auto 0 auto; width: 80%; border-radius: 3px; box-shadow: 0 2px 4px rgba(0,0,0,0.1);\"></div>\r\n\r\n<div style=\"text-align: center; margin-top: 30px; font-style: italic; color: var(--color-dark); font-size: 0.9em;\">\r\n  \"Готов превращать данные в решения, а идеи - в работающие веб-приложения.\"  \r\n  <div style=\"color: var(--color-accent); font-weight: bold; margin-top: 5px;\">— Студент МУИВ</div>\r\n</div>\r\n</div>', 'Знание основ статистики\r\nОпыт работы с Excel\r\nПонимание SQL на базовом уровне\r\nАналитический склад ума', 'ИТ', 25000, 'Москва', 2, '2025-06-09 11:03:57', 'Гибридный', 'Стажировка'),
(21, 'Юридическая практика', '# <span style=\"color: #1A3856; font-family: \'Georgia\', serif; font-size: 2.2em; letter-spacing: 1px; display: block; text-align: center; margin-bottom: 5px; border-bottom: 2px solid #C21631; padding-bottom: 10px; width: 80%; margin-left: auto; margin-right: auto;\">Юридическая практика</span>\r\n\r\n<div style=\"text-align: center; margin-bottom: 30px;\">\r\n  <span style=\"display: inline-block; color: white; background: linear-gradient(90deg, #1A3856, #C21631); padding: 8px 30px; border-radius: 4px; font-weight: bold; letter-spacing: 1px; text-transform: uppercase; font-size: 0.9em;\">МУИВ • Юриспруденция • Ростов-на-Дону</span>\r\n</div>\r\n\r\n---\r\n\r\n## <span style=\"color: #1A3856; font-size: 1.4em; display: block; padding-bottom: 8px; margin: 30px 0 20px 0; position: relative;\">\r\n  <span style=\"background: white; padding-right: 15px; position: relative; z-index: 1;\">Ключевые компетенции</span>\r\n  <span style=\"position: absolute; bottom: 0; left: 0; width: 100%; height: 1px; background: linear-gradient(90deg, transparent, #C21631, transparent); z-index: 0;\"></span>\r\n</span>\r\n\r\n<div style=\"display: grid; grid-template-columns: repeat(2, 1fr); gap: 25px; margin-bottom: 30px;\">\r\n\r\n<div style=\"border: 1px solid #e0e0e0; padding: 20px; border-radius: 4px; position: relative; overflow: hidden;\">\r\n  <div style=\"position: absolute; top: 0; left: 0; width: 4px; height: 100%; background-color: #1A3856;\"></div>\r\n  <h4 style=\"color: #C21631; margin-top: 0; margin-bottom: 15px; font-weight: 600; display: flex; align-items: center;\">\r\n    <svg width=\"16\" height=\"16\" viewBox=\"0 0 24 24\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\" style=\"margin-right: 8px;\">\r\n      <path d=\"M12 2C6.48 2 2 6.48 2 12C2 17.52 6.48 22 12 22C17.52 22 22 17.52 22 12C22 6.48 17.52 2 12 2ZM10 17L5 12L6.41 10.59L10 14.17L17.59 6.58L19 8L10 17Z\" fill=\"#1A3856\"/>\r\n    </svg>\r\n    Профессиональные навыки\r\n  </h4>\r\n  <ul style=\"padding-left: 5px; list-style: none;\">\r\n    <li style=\"margin-bottom: 8px; display: flex;\">\r\n      <span style=\"color: #C21631; margin-right: 8px;\">•</span> \r\n      <span>Базовые знания в выбранной отрасли права</span>\r\n    </li>\r\n    <li style=\"margin-bottom: 8px; display: flex;\">\r\n      <span style=\"color: #C21631; margin-right: 8px;\">•</span> \r\n      <span>Анализ нормативно-правовых актов</span>\r\n    </li>\r\n    <li style=\"margin-bottom: 8px; display: flex;\">\r\n      <span style=\"color: #C21631; margin-right: 8px;\">•</span> \r\n      <span>Составление юридических документов</span>\r\n    </li>\r\n    <li style=\"display: flex;\">\r\n      <span style=\"color: #C21631; margin-right: 8px;\">•</span> \r\n      <span>Правовая экспертиза договоров</span>\r\n    </li>\r\n  </ul>\r\n</div>\r\n\r\n<div style=\"border: 1px solid #e0e0e0; padding: 20px; border-radius: 4px; position: relative; overflow: hidden;\">\r\n  <div style=\"position: absolute; top: 0; left: 0; width: 4px; height: 100%; background-color: #C21631;\"></div>\r\n  <h4 style=\"color: #1A3856; margin-top: 0; margin-bottom: 15px; font-weight: 600; display: flex; align-items: center;\">\r\n    <svg width=\"16\" height=\"16\" viewBox=\"0 0 24 24\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\" style=\"margin-right: 8px;\">\r\n      <path d=\"M12 2C6.48 2 2 6.48 2 12C2 17.52 6.48 22 12 22C17.52 22 22 17.52 22 12C22 6.48 17.52 2 12 2ZM10 17L5 12L6.41 10.59L10 14.17L17.59 6.58L19 8L10 17Z\" fill=\"#C21631\"/>\r\n    </svg>\r\n    Личные качества\r\n  </h4>\r\n  <ul style=\"padding-left: 5px; list-style: none;\">\r\n    <li style=\"margin-bottom: 8px; display: flex;\">\r\n      <span style=\"color: #1A3856; margin-right: 8px;\">•</span> \r\n      <span>Внимательность к деталям</span>\r\n    </li>\r\n    <li style=\"margin-bottom: 8px; display: flex;\">\r\n      <span style=\"color: #1A3856; margin-right: 8px;\">•</span> \r\n      <span>Грамотная письменная и устная речь</span>\r\n    </li>\r\n    <li style=\"margin-bottom: 8px; display: flex;\">\r\n      <span style=\"color: #1A3856; margin-right: 8px;\">•</span> \r\n      <span>Аналитическое мышление</span>\r\n    </li>\r\n    <li style=\"display: flex;\">\r\n      <span style=\"color: #1A3856; margin-right: 8px;\">•</span> \r\n      <span>Ответственность и исполнительность</span>\r\n    </li>\r\n  </ul>\r\n</div>\r\n\r\n</div>\r\n\r\n---\r\n\r\n## <span style=\"color: #1A3856; font-size: 1.4em; display: block; padding-bottom: 8px; margin: 30px 0 20px 0; position: relative;\">\r\n  <span style=\"background: white; padding-right: 15px; position: relative; z-index: 1;\">Опыт работы</span>\r\n  <span style=\"position: absolute; bottom: 0; left: 0; width: 100%; height: 1px; background: linear-gradient(90deg, transparent, #C21631, transparent); z-index: 0;\"></span>\r\n</span>\r\n\r\n<div style=\"background-color: #f9f9f9; padding: 25px; border-radius: 4px; margin-bottom: 30px; border-left: 4px solid #1A3856; position: relative;\">\r\n  <div style=\"position: absolute; top: 25px; right: 25px; background-color: #C21631; color: white; padding: 3px 10px; border-radius: 12px; font-size: 0.8em; font-weight: bold;\">2023-2024</div>\r\n  <h3 style=\"color: #1A3856; margin-top: 0; margin-bottom: 10px;\">Юридическая клиника МУИВ</h3>\r\n  <h4 style=\"color: #C21631; margin-top: 0; margin-bottom: 15px; font-weight: normal; font-size: 1em;\">Студент-консультант</h4>\r\n  \r\n  <div style=\"display: grid; grid-template-columns: 30px 1fr; gap: 10px; margin-bottom: 15px;\">\r\n    <div style=\"color: #C21631; font-weight: bold; text-align: center;\">▸</div>\r\n    <div>Консультирование граждан по правовым вопросам</div>\r\n  </div>\r\n  <div style=\"display: grid; grid-template-columns: 30px 1fr; gap: 10px; margin-bottom: 15px;\">\r\n    <div style=\"color: #C21631; font-weight: bold; text-align: center;\">▸</div>\r\n    <div>Составление исковых заявлений и процессуальных документов</div>\r\n  </div>\r\n  <div style=\"display: grid; grid-template-columns: 30px 1fr; gap: 10px;\">\r\n    <div style=\"color: #C21631; font-weight: bold; text-align: center;\">▸</div>\r\n    <div>Анализ судебной практики по гражданским делам</div>\r\n  </div>\r\n</div>\r\n\r\n---\r\n\r\n## <span style=\"color: #1A3856; font-size: 1.4em; display: block; padding-bottom: 8px; margin: 30px 0 20px 0; position: relative;\">\r\n  <span style=\"background: white; padding-right: 15px; position: relative; z-index: 1;\">Образование</span>\r\n  <span style=\"position: absolute; bottom: 0; left: 0; width: 100%; height: 1px; background: linear-gradient(90deg, transparent, #C21631, transparent); z-index: 0;\"></span>\r\n</span>\r\n\r\n<div style=\"display: grid; grid-template-columns: 1fr 1fr; gap: 25px; margin-bottom: 30px;\">\r\n\r\n<div style=\"border: 1px solid #e0e0e0; padding: 20px; border-radius: 4px; position: relative;\">\r\n  <div style=\"position: absolute; top: 20px; right: 20px; width: 40px; height: 40px; background-color: #f0f0f0; border-radius: 50%; display: flex; align-items: center; justify-content: center;\">\r\n    <svg width=\"20\" height=\"20\" viewBox=\"0 0 24 24\" fill=\"#1A3856\" xmlns=\"http://www.w3.org/2000/svg\">\r\n      <path d=\"M12 3L1 9L12 15L21 10.09V17H23V9M5 13.18V17L12 21L19 17V13.18L12 17L5 13.18Z\"/>\r\n    </svg>\r\n  </div>\r\n  <h4 style=\"color: #C21631; margin-top: 0; margin-bottom: 10px;\">Московский Университет имени Витте</h4>\r\n  <p style=\"margin: 5px 0; color: #555;\">Факультет юриспруденции</p>\r\n  <p style=\"margin: 5px 0; color: #555;\">Специализация: Гражданское право</p>\r\n  <p style=\"margin: 5px 0; color: #555;\">2021-2025 | Средний балл: 4.7</p>\r\n</div>\r\n\r\n<div style=\"border: 1px solid #e0e0e0; padding: 20px; border-radius: 4px; position: relative;\">\r\n  <div style=\"position: absolute; top: 20px; right: 20px; width: 40px; height: 40px; background-color: #f0f0f0; border-radius: 50%; display: flex; align-items: center; justify-content: center;\">\r\n    <svg width=\"20\" height=\"20\" viewBox=\"0 0 24 24\" fill=\"#C21631\" xmlns=\"http://www.w3.org/2000/svg\">\r\n      <path d=\"M17 13H13V17H11V13H7V11H11V7H13V11H17M12 2C6.48 2 2 6.48 2 12C2 17.52 6.48 22 12 22C17.52 22 22 17.52 22 12C22 6.48 17.52 2 12 2Z\"/>\r\n    </svg>\r\n  </div>\r\n  <h4 style=\"color: #1A3856; margin-top: 0; margin-bottom: 10px;\">Дополнительное образование</h4>\r\n  <ul style=\"padding-left: 20px; color: #555;\">\r\n    <li style=\"margin-bottom: 5px;\">Курс \"Юридическое письмо\"</li>\r\n    <li style=\"margin-bottom: 5px;\">Семинар по гражданскому процессу</li>\r\n    <li>Участие в научных конференциях</li>\r\n  </ul>\r\n</div>\r\n\r\n</div>\r\n\r\n<div style=\"text-align: center; margin-top: 40px; padding-top: 20px; border-top: 1px solid #e0e0e0;\">\r\n  <p style=\"color: #1A3856; font-style: italic; margin-bottom: 5px;\">\"Право должно быть справедливым, а справедливость — правовой.\"</p>\r\n  <p style=\"color: #C21631; font-weight: bold; margin-top: 0;\">Рудольф фон Иеринг</p>\r\n</div>', '- Базовые знания в выбранной отрасли права\r\n- Внимательность к деталям\r\n- Грамотная письменная и устная речь\r\n- Способность анализировать большие объемы информации\r\n- Ответственность и исполнительность', 'Юриспруденция', NULL, 'Ростов-на-Дону', 2, '2025-06-09 11:16:58', 'Гибридный', 'Практика');

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
(7, 3, 'Кубышкин Степан Семенович', '', 'Москва', '89267633808', 'Stepanida525@gmail.com', '', '', '', 'uploads/1749666438_Ni9nCwgdDV8.jpg', '2025-05-08 23:22:25', '\r\n\r\n## <span style=\"color: #1A3856; font-size: 1.5em; display: block; padding-bottom: 8px; border-bottom: 3px double #C21631; margin: 30px 0 20px 0;\">Личная информация</span>\r\n\r\n<div style=\"display: grid; grid-template-columns: 1fr 1fr; gap: 30px; margin-bottom: 30px;\">\r\n\r\n<div style=\"background-color: #f8f9fa; padding: 20px; border-radius: 10px; box-shadow: 0 3px 6px rgba(0,0,0,0.08); border-top: 5px solid #1A3856;\">\r\n  <h3 style=\"color: #C21631; margin-top: 0; border-bottom: 1px dotted #C21631; padding-bottom: 5px;\">Общие данные</h3>\r\n  <p><strong>Дата рождения:</strong> 15.03.2002</p>\r\n  <p><strong>Город:</strong> Москва</p>\r\n  <p><strong>Гражданство:</strong> Российская Федерация</p>\r\n  <p><strong>Языки:</strong> Русский (родной), English (B2)</p>\r\n</div>\r\n\r\n<div style=\"background-color: #f8f9fa; padding: 20px; border-radius: 10px; box-shadow: 0 3px 6px rgba(0,0,0,0.08); border-top: 5px solid #C21631;\">\r\n  <h3 style=\"color: #1A3856; margin-top: 0; border-bottom: 1px dotted #1A3856; padding-bottom: 5px;\">Образование</h3>\r\n  <p><strong>Университет:</strong> МУИВ</p>\r\n  <p><strong>Факультет:</strong> Информационных технологий</p>\r\n  <p><strong>Специальность:</strong> \"Веб-разработка\"</p>\r\n  <p><strong>Годы обучения:</strong> 2021 - 2025</p>\r\n  <p><strong>Средний балл:</strong> 4.8</p>\r\n</div>\r\n\r\n</div>\r\n\r\n---\r\n<div>\r\n\r\n## <span style=\"color: #1A3856; font-size: 1.5em; display: block; padding-bottom: 8px; border-bottom: 3px double #C21631; margin: 30px 0 20px 0;\">Технические навыки</span>\r\n\r\n<div style=\"display: grid; grid-template-columns: repeat(3, 1fr); gap: 20px; margin-bottom: 30px;\">\r\n\r\n<div style=\"background-color: #fff; padding: 15px; border-radius: 8px; box-shadow: 0 2px 10px rgba(26,56,86,0.1); border-left: 4px solid #1A3856;\">\r\n  <h4 style=\"color: #C21631; margin-top: 0; display: flex; align-items: center;\">\r\n    <span style=\"display: inline-block; width: 10px; height: 10px; background-color: #C21631; margin-right: 10px; border-radius: 50%;\"></span>\r\n    Frontend\r\n  </h4>\r\n  <ul style=\"padding-left: 20px;\">\r\n    <li>React.js (Hooks, Context API, Router)</li>\r\n    <li>TypeScript / JavaScript (ES6+)</li>\r\n    <li>HTML5 / CSS3 (SASS, BEM, CSS Modules)</li>\r\n    <li>Redux (Toolkit, Thunk, Persist)</li>\r\n    <li>Next.js (SSR, SSG, ISR)</li>\r\n    <li>Responsive/Adaptive design</li>\r\n  </ul>\r\n</div>\r\n\r\n<div style=\"background-color: #fff; padding: 15px; border-radius: 8px; box-shadow: 0 2px 10px rgba(26,56,86,0.1); border-left: 4px solid #C21631;\">\r\n  <h4 style=\"color: #1A3856; margin-top: 0; display: flex; align-items: center;\">\r\n    <span style=\"display: inline-block; width: 10px; height: 10px; background-color: #1A3856; margin-right: 10px; border-radius: 50%;\"></span>\r\n    Инструменты\r\n  </h4>\r\n  <ul style=\"padding-left: 20px;\">\r\n    <li>Git / GitHub / GitLab</li>\r\n    <li>Webpack / Vite / Rollup</li>\r\n    <li>Jest / React Testing Library</li>\r\n    <li>ESLint / Prettier / Stylelint</li>\r\n    <li>Figma / Adobe XD / Photoshop</li>\r\n    <li>Postman / Swagger</li>\r\n  </ul>\r\n</div>\r\n\r\n<div style=\"background-color: #fff; padding: 15px; border-radius: 8px; box-shadow: 0 2px 10px rgba(26,56,86,0.1); border-left: 4px solid #1A3856;\">\r\n  <h4 style=\"color: #C21631; margin-top: 0; display: flex; align-items: center;\">\r\n    <span style=\"display: inline-block; width: 10px; height: 10px; background-color: #C21631; margin-right: 10px; border-radius: 50%;\"></span>\r\n    Дополнительно\r\n  </h4>\r\n  <ul style=\"padding-left: 20px;\">\r\n    <li>Basic Node.js / Express</li>\r\n    <li>REST API / GraphQL</li>\r\n    <li>MongoDB / Firebase</li>\r\n    <li>Docker basics</li>\r\n    <li>Scrum / Agile методологии</li>\r\n    <li>Technical Writing</li>\r\n  </ul>\r\n</div>\r\n\r\n</div>\r\n\r\n---\r\n</div>\r\n<div>\r\n\r\n## <span style=\"color: #1A3856; font-size: 1.5em; display: block; padding-bottom: 8px; border-bottom: 3px double #C21631; margin: 30px 0 20px 0;\">Профессиональный опыт</span>\r\n\r\n<div style=\"background-color: #f8f9fa; padding: 25px; border-radius: 12px; margin-bottom: 25px; box-shadow: 0 4px 12px rgba(0,0,0,0.05); border: 1px solid #e0e0e0;\">\r\n  <h3 style=\"color: #1A3856; margin-top: 0; display: flex; justify-content: space-between;\">\r\n    <span>Frontend Developer (стажёр)</span>\r\n    <span style=\"color: #C21631; font-weight: normal;\">ООО \"ТехноСистемы\" | Сен 2023 - Янв 2024</span>\r\n  </h3>\r\n  <div style=\"background-color: #e9ecef; padding: 10px; border-radius: 6px; margin: 10px 0;\">\r\n    <strong>Технологический стек:</strong> React 18, TypeScript, Redux Toolkit, Material UI, WebSocket\r\n  </div>\r\n  <h4 style=\"color: #C21631; margin-bottom: 5px;\">Основные обязанности и достижения:</h4>\r\n  <ul style=\"padding-left: 25px;\">\r\n    <li>Разработал 5+ интерактивных интерфейсов для CRM-системы</li>\r\n    <li>Реализовал систему real-time уведомлений с использованием WebSocket</li>\r\n    <li>Оптимизировал производительность приложения (сократил время загрузки на 40%)</li>\r\n    <li>Создал библиотеку UI-компонентов для внутреннего использования</li>\r\n    <li>Участвовал в code review и планировании спринтов</li>\r\n    <li>Написал 30+ unit-тестов (Jest + RTL)</li>\r\n  </ul>\r\n</div>\r\n\r\n<div style=\"background-color: #f8f9fa; padding: 25px; border-radius: 12px; margin-bottom: 25px; box-shadow: 0 4px 12px rgba(0,0,0,0.05); border: 1px solid #e0e0e0;\">\r\n  <h3 style=\"color: #1A3856; margin-top: 0; display: flex; justify-content: space-between;\">\r\n    <span>Фриланс-проекты</span>\r\n    <span style=\"color: #C21631; font-weight: normal;\">2022 - настоящее время</span>\r\n  </h3>\r\n  <div style=\"background-color: #e9ecef; padding: 10px; border-radius: 6px; margin: 10px 0;\">\r\n    <strong>Технологический стек:</strong> React, Next.js, Firebase, Tailwind CSS\r\n  </div>\r\n  <h4 style=\"color: #C21631; margin-bottom: 5px;\">Ключевые проекты:</h4>\r\n  <ul style=\"padding-left: 25px;\">\r\n    <li><strong>Интернет-магазин мебели:</strong> Полный цикл разработки (от дизайна до деплоя)</li>\r\n    <li><strong>Лендинг для образовательного центра:</strong> Анимации на GSAP, адаптивная верстка</li>\r\n    <li><strong>Админ-панель для стартапа:</strong> Интеграция с API, JWT-аутентификация</li>\r\n    <li><strong>Персональный блог на Next.js:</strong> SSG, Markdown-контент, SEO-оптимизация</li>\r\n  </ul>\r\n</div>\r\n</div>\r\n\r\n<div>\r\n\r\n## <span style=\"color: #1A3856; font-size: 1.5em; display: block; padding-bottom: 8px; border-bottom: 3px double #C21631; margin: 30px 0 20px 0;\">Учебные проекты</span>\r\n\r\n<div style=\"display: grid; grid-template-columns: 1fr 1fr; gap: 20px; margin-bottom: 30px;\">\r\n\r\n<div style=\"background-color: #fff; padding: 20px; border-radius: 10px; box-shadow: 0 3px 8px rgba(0,0,0,0.08); border-top: 4px solid #1A3856;\">\r\n  <h4 style=\"color: #C21631; margin-top: 0;\">Социальная сеть для университета</h4>\r\n  <p><strong>Стек:</strong> React, Firebase, SCSS</p>\r\n  <p><strong>Функционал:</strong></p>\r\n  <ul style=\"padding-left: 20px;\">\r\n    <li>Авторизация через Google/Firebase</li>\r\n    <li>Лента новостей с комментариями</li>\r\n    <li>Чат между студентами</li>\r\n    <li>Календарь академических событий</li>\r\n  </ul>\r\n</div>\r\n\r\n<div style=\"background-color: #fff; padding: 20px; border-radius: 10px; box-shadow: 0 3px 8px rgba(0,0,0,0.08); border-top: 4px solid #C21631;\">\r\n  <h4 style=\"color: #1A3856; margin-top: 0;\">Трекер задач с аналитикой</h4>\r\n  <p><strong>Стек:</strong> React, Redux Toolkit, Chart.js</p>\r\n  <p><strong>Функционал:</strong></p>\r\n  <ul style=\"padding-left: 20px;\">\r\n    <li>Drag-and-drop доска задач</li>\r\n    <li>Визуализация статистики</li>\r\n    <li>Экспорт данных в PDF</li>\r\n    <li>Темная/светлая темы</li>\r\n  </ul>\r\n</div>\r\n\r\n</div>\r\n\r\n---\r\n<div>\r\n\r\n## <span style=\"color: #1A3856; font-size: 1.5em; display: block; padding-bottom: 8px; border-bottom: 3px double #C21631; margin: 30px 0 20px 0;\">Дополнительная информация</span>\r\n\r\n<div style=\"display: grid; grid-template-columns: 1fr 1fr; gap: 30px; margin-bottom: 30px;\">\r\n\r\n<div style=\"background-color: #f8f9fa; padding: 20px; border-radius: 10px; box-shadow: 0 3px 6px rgba(0,0,0,0.05);\">\r\n  <h4 style=\"color: #C21631; margin-top: 0; border-bottom: 1px solid #ddd; padding-bottom: 8px;\">Курсы и сертификаты</h4>\r\n  <ul style=\"padding-left: 20px;\">\r\n    <li>\"Advanced React\" (Stepik, 2023)</li>\r\n    <li>\"TypeScript для React-разработчиков\" (Udemy, 2023)</li>\r\n    <li>\"Web Performance Optimization\" (Coursera, 2022)</li>\r\n    <li>\"UI/UX Design Basics\" (GeekBrains, 2022)</li>\r\n  </ul>\r\n</div>\r\n\r\n<div style=\"background-color: #f8f9fa; padding: 20px; border-radius: 10px; box-shadow: 0 3px 6px rgba(0,0,0,0.05);\">\r\n  <h4 style=\"color: #1A3856; margin-top: 0; border-bottom: 1px solid #ddd; padding-bottom: 8px;\">Хобби и интересы</h4>\r\n  <ul style=\"padding-left: 20px;\">\r\n    <li>Участие в хакатонах и CTF-соревнованиях</li>\r\n    <li>Изучение новых frontend-фреймворков</li>\r\n    <li>Технический блоггинг (Medium, Habr)</li>\r\n    <li>Фотография и обработка изображений</li>\r\n  </ul>\r\n</div>\r\n\r\n</div>\r\n\r\n<div style=\"background: linear-gradient(90deg, #1A3856 0%, #C21631 70%, #1A3856 100%); height: 6px; margin: 40px auto 0 auto; width: 80%; border-radius: 3px; box-shadow: 0 2px 4px rgba(0,0,0,0.1);\"></div>\r\n<div style=\"text-align: center; margin-top: 30px; font-style: italic; color: #1A3856; font-size: 0.9em;\">\r\n  \"Код — это не просто инструкции для компьютера, это искусство выражения мысли.\"  \r\n  <div style=\"color: #C21631; font-weight: bold; margin-top: 5px;\">— С.С. Кубышкин</div>\r\n</div>');

-- --------------------------------------------------------

--
-- Структура таблицы `site_content`
--

CREATE TABLE `site_content` (
  `id` int NOT NULL,
  `page` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `site_content`
--

INSERT INTO `site_content` (`id`, `page`, `content`) VALUES
(1, 'CareerCenter', '<div style=\"font-family: \'Segoe UI\', Roboto, \'Helvetica Neue\', Arial, sans-serif; color: #333; max-width: 800px; margin: 0 auto; padding: 20px;\">\r\n\r\n<div style=\"background: linear-gradient(135deg, #1A3856 0%, #0D1F36 100%); color: white; padding: 30px; border-radius: 12px; margin-bottom: 30px; box-shadow: 0 4px 12px rgba(0,0,0,0.1);\">\r\n<h1 style=\"color: white; margin: 0; font-size: 2.2em; font-weight: 600;\">Центр карьеры, практики и трудоустройства</h1>\r\n<p style=\"font-size: 1.1em; opacity: 0.9; margin-bottom: 0;\">Структурное подразделение Московского университета имени С.Ю. Витте</p>\r\n</div>\r\n\r\n<div style=\"display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 20px; margin: 30px 0;\">\r\n<div style=\"background-color: white; border-radius: 10px; padding: 20px; box-shadow: 0 2px 8px rgba(0,0,0,0.08);\">\r\n<h3 style=\"color: #C21631; margin-top: 0;\">🔍 Вакансии</h3>\r\n<p>Актуальные предложения от работодателей-партнеров</p>\r\n</div>\r\n\r\n<div style=\"background-color: white; border-radius: 10px; padding: 20px; box-shadow: 0 2px 8px rgba(0,0,0,0.08);\">\r\n<h3 style=\"color: #C21631; margin-top: 0;\">💼 Карьера</h3>\r\n<p>Профориентация и помощь в трудоустройстве</p>\r\n</div>\r\n\r\n<div style=\"background-color: white; border-radius: 10px; padding: 20px; box-shadow: 0 2px 8px rgba(0,0,0,0.08);\">\r\n<h3 style=\"color: #C21631; margin-top: 0;\">📄 Документы</h3>\r\n<p>Помощь в составлении резюме и сопроводительных писем</p>\r\n</div>\r\n</div>\r\n\r\n<h2 style=\"color: #1A3856; border-bottom: 2px solid #C21631; padding-bottom: 8px; margin-top: 40px;\">Наши услуги</h2>\r\n\r\n<div style=\"background-color: #F8F9FA; border-radius: 10px; padding: 25px; margin: 20px 0; position: relative;\">\r\n<div style=\"position: absolute; left: -15px; top: 20px; width: 4px; height: 60%; background: #C21631; border-radius: 2px;\"></div>\r\n<h3 style=\"margin-top: 0; color: #1A3856;\">Трудоустройство студентов и выпускников</h3>\r\n<ul style=\"padding-left: 20px;\">\r\n<li style=\"margin-bottom: 8px;\">Персональный подбор вакансий</li>\r\n<li style=\"margin-bottom: 8px;\">Подготовка к собеседованиям</li>\r\n<li>Карьерное консультирование</li>\r\n</ul>\r\n</div>\r\n\r\n<div style=\"background-color: #F8F9FA; border-radius: 10px; padding: 25px; margin: 20px 0; position: relative;\">\r\n<div style=\"position: absolute; left: -15px; top: 20px; width: 4px; height: 60%; background: #C21631; border-radius: 2px;\"></div>\r\n<h3 style=\"margin-top: 0; color: #1A3856;\">Организация практики</h3>\r\n<ul style=\"padding-left: 20px;\">\r\n<li style=\"margin-bottom: 8px;\">Подбор мест практики по специальности</li>\r\n<li style=\"margin-bottom: 8px;\">Сопровождение процесса</li>\r\n<li>Помощь в оформлении документов</li>\r\n</ul>\r\n</div>\r\n\r\n<div style=\"background-color: #1A3856; color: white; padding: 30px; border-radius: 10px; margin: 40px 0; text-align: center;\">\r\n<h2 style=\"color: white; margin-top: 0;\">Мы помогли 85% выпускников найти работу в первый год после окончания</h2>\r\n<p style=\"font-size: 1.1em;\">Присоединяйтесь к нашему сообществу успешных специалистов</p>\r\n</div>\r\n\r\n<h2 style=\"color: #1A3856; border-bottom: 2px solid #C21631; padding-bottom: 8px;\">Контакты</h2>\r\n\r\n<div style=\"display: grid; grid-template-columns: 1fr 1fr; gap: 20px; margin: 30px 0;\">\r\n<div>\r\n<h3 style=\"color: #1A3856; margin-top: 0;\">📍 Адрес</h3>\r\n<p style=\"background-color: white; padding: 15px; border-radius: 8px; box-shadow: 0 2px 6px rgba(0,0,0,0.05);\">\r\nг. Москва, 2-й Кожуховский проезд, д.12, стр.1<br>\r\nГлавный корпус, 1 этаж, кабинет №111\r\n</p>\r\n</div>\r\n\r\n<div>\r\n<h3 style=\"color: #1A3856; margin-top: 0;\">🕒 Часы работы</h3>\r\n<div style=\"background-color: white; padding: 15px; border-radius: 8px; box-shadow: 0 2px 6px rgba(0,0,0,0.05);\">\r\n<p style=\"margin: 5px 0;\"><strong>Пн-Чт:</strong> 09:00–17:00</p>\r\n<p style=\"margin: 5px 0;\"><strong>Пт:</strong> 09:00–16:00</p>\r\n</div>\r\n</div>\r\n</div>\r\n\r\n<div style=\"text-align: center; margin-top: 40px; padding: 20px; background-color: #F3F5F7; border-radius: 10px;\">\r\n<h3 style=\"color: #1A3856; margin-top: 0;\">📞 Свяжитесь с нами</h3>\r\n<a href=\"tel:+74957836848\" style=\"display: inline-block; background-color: #C21631; color: white; text-decoration: none; padding: 12px 25px; border-radius: 30px; font-weight: bold; margin-top: 10px; transition: all 0.3s ease;\">+7 (495) 783-68-48, доб. 5119</a>\r\n</div>\r\n\r\n</div>'),
(2, 'News', '<div style=\"max-width: 700px; margin: 0 auto; font-family: Arial, sans-serif; color: #333;\">\r\n\r\n<!-- Заголовок -->\r\n<div style=\"text-align: center; margin-bottom: 30px;\">\r\n<h1 style=\"color: #1A3856; display: inline-block; border-bottom: 2px solid #C21631; padding-bottom: 5px;\">Мероприятия</h1>\r\n</div>\r\n\r\n<!-- Текущее мероприятие -->\r\n<div style=\"background: #F8F9FA; padding: 20px; border-radius: 8px; margin-bottom: 25px; border-left: 4px solid #C21631;\">\r\n<h2 style=\"margin-top: 0; color: #1A3856;\">Мастер-класс на юридическом факультете</h2>\r\n<p style=\"margin-bottom: 5px;\"><strong>Тема:</strong> Правовая экспертиза договора: заключение, расторжение, способы защиты</p>\r\n<p style=\"color: #C21631; font-weight: bold;\">Дата: 15.04.2024</p>\r\n</div>\r\n\r\n<!-- Список мероприятий -->\r\n<div style=\"display: grid; grid-template-columns: 1fr; gap: 15px;\">\r\n\r\n<!-- Мероприятие 1 -->\r\n<div style=\"padding: 15px; border-bottom: 1px solid #eee;\">\r\n<h3 style=\"margin: 0 0 5px 0; color: #1A3856;\">Посещение Дома прав человека</h3>\r\n<p style=\"margin: 0; color: #666;\">Дата: 03.10.2023</p>\r\n<p style=\"margin: 5px 0 0 0;\">Участники: Студенты Московского университета им. С.Ю. Витте</p>\r\n<p style=\"margin: 5px 0 0 0; font-style: italic;\">Студенты посетили Дом прав человека!</p>\r\n</div>\r\n\r\n<!-- Мероприятие 2 -->\r\n<div style=\"padding: 15px; border-bottom: 1px solid #eee;\">\r\n<h3 style=\"margin: 0 0 5px 0; color: #1A3856;\">Резюме как способ найти работу мечты</h3>\r\n<p style=\"margin: 0; color: #666;\">Дата: 12.04.2022</p>\r\n<p style=\"margin: 5px 0 0 0; font-style: italic;\">Резюме, как способ найти работу мечты</p>\r\n</div>\r\n\r\n<!-- Мероприятие 3 -->\r\n<div style=\"padding: 15px; border-bottom: 1px solid #eee;\">\r\n<h3 style=\"margin: 0 0 5px 0; color: #1A3856;\">Новые возможности для студентов Юридического факультета</h3>\r\n<p style=\"margin: 0; color: #666;\">Дата: 07.04.2022</p>\r\n<p style=\"margin: 5px 0 0 0; font-style: italic;\">Новые возможности для студентов Юридического факультета</p>\r\n</div>\r\n\r\n<!-- Мероприятие 4 -->\r\n<div style=\"padding: 15px; border-bottom: 1px solid #eee;\">\r\n<h3 style=\"margin: 0 0 5px 0; color: #1A3856;\">Кафедральный круглый стол</h3>\r\n<p style=\"margin: 0; color: #666;\">Дата: 06.04.2022</p>\r\n<p style=\"margin: 5px 0 0 0; font-style: italic;\">Кафедральный круглый стол</p>\r\n</div>\r\n\r\n<!-- Мероприятие 5 -->\r\n<div style=\"padding: 15px; border-bottom: 1px solid #eee;\">\r\n<h3 style=\"margin: 0 0 5px 0; color: #1A3856;\">Ярмарка вакансий</h3>\r\n<p style=\"margin: 0; color: #666;\">Дата: 22.03.2022</p>\r\n<p style=\"margin: 5px 0 0 0; font-style: italic;\">Ярмарка вакансий</p>\r\n</div>\r\n\r\n<!-- Остальные мероприятия аналогично -->\r\n\r\n</div>\r\n\r\n</div>'),
(3, 'Rabotodatelyam', '<div style=\"font-family: \'Segoe UI\', Arial, sans-serif; max-width: 800px; margin: 0 auto; color: #1A3856; line-height: 1.6;\">\r\n\r\n<h1 style=\"color: #1A3856; text-align: center; border-bottom: 2px solid #C21631; padding-bottom: 10px; margin-bottom: 25px;\">Приглашение к сотрудничеству</h1>\r\n\r\n<div style=\"background-color: #f8f9fa; padding: 20px; border-radius: 8px; margin-bottom: 25px; border-left: 4px solid #C21631;\">\r\n  <p style=\"font-size: 18px; margin: 0;\">Уважаемые руководители компаний и служб персонала!</p>\r\n</div>\r\n\r\n<!-- Основной текст приглашения -->\r\n<div style=\"margin-bottom: 30px; padding: 15px; background-color: #f0f3f7; border-radius: 6px;\">\r\n  <p><span style=\"font-weight: 600;\">Центр карьеры, практики и трудоустройства</span> <span style=\"color: #C21631; font-weight: 600;\">Московского Университета имени С.Ю. Витте</span> приглашает к сотрудничеству компании для подбора студентов и выпускников по следующим направлениям:</p>\r\n</div>\r\n\r\n<h2 style=\"color: #1A3856; border-bottom: 1px solid #e0e3e6; padding-bottom: 8px; margin-top: 30px;\">Направления подготовки</h2>\r\n\r\n<!-- Юриспруденция -->\r\n<div style=\"background-color: #fff; padding: 20px; border-radius: 6px; box-shadow: 0 1px 3px rgba(0,0,0,0.08); margin-bottom: 20px; border-top: 3px solid #C21631;\">\r\n  <h3 style=\"margin-top: 0; color: #1A3856;\">Юриспруденция</h3>\r\n  <p style=\"margin-bottom: 5px;\">Специализации:</p>\r\n  <ul style=\"padding-left: 20px; margin-top: 0;\">\r\n    <li>Гражданское право</li>\r\n    <li>Уголовное право</li>\r\n    <li>Обеспечение прав личности в уголовном судопроизводстве</li>\r\n    <li>Правовое обеспечение деятельности корпоративного юриста</li>\r\n    <li>Конституционное право, муниципальное право. Юрист публичного права</li>\r\n  </ul>\r\n</div>\r\n\r\n<!-- Экономика -->\r\n<div style=\"background-color: #fff; padding: 20px; border-radius: 6px; box-shadow: 0 1px 3px rgba(0,0,0,0.08); margin-bottom: 20px; border-top: 3px solid #C21631;\">\r\n  <h3 style=\"margin-top: 0; color: #1A3856;\">Экономика</h3>\r\n  <p style=\"margin-bottom: 5px;\">Специализации:</p>\r\n  <ul style=\"padding-left: 20px; margin-top: 0;\">\r\n    <li>Бухгалтерский учёт, анализ и аудит</li>\r\n    <li>Экономика организаций</li>\r\n    <li>Финансы и кредит</li>\r\n    <li>Аудит и анализ в коммерческих организациях</li>\r\n    <li>Экономика фирмы</li>\r\n    <li>Финансовая аналитика и финансовые решения</li>\r\n    <li>Бизнес-аналитика и управление изменениями</li>\r\n  </ul>\r\n</div>\r\n\r\n<!-- Финансы и кредит -->\r\n<div style=\"background-color: #fff; padding: 20px; border-radius: 6px; box-shadow: 0 1px 3px rgba(0,0,0,0.08); margin-bottom: 20px; border-top: 3px solid #C21631;\">\r\n  <h3 style=\"margin-top: 0; color: #1A3856;\">Финансы и кредит</h3>\r\n  <p style=\"margin-bottom: 5px;\">Специализация:</p>\r\n  <ul style=\"padding-left: 20px; margin-top: 0;\">\r\n    <li>Корпоративные финансы и управление стоимостью бизнеса</li>\r\n  </ul>\r\n</div>\r\n\r\n<!-- Реклама и связи с общественностью -->\r\n<div style=\"background-color: #fff; padding: 20px; border-radius: 6px; box-shadow: 0 1px 3px rgba(0,0,0,0.08); margin-bottom: 20px; border-top: 3px solid #C21631;\">\r\n  <h3 style=\"margin-top: 0; color: #1A3856;\">Реклама и связи с общественностью</h3>\r\n  <p style=\"margin-bottom: 5px;\">Специализация:</p>\r\n  <ul style=\"padding-left: 20px; margin-top: 0;\">\r\n    <li>Реклама и связи с общественностью в коммерческой сфере</li>\r\n  </ul>\r\n</div>\r\n\r\n<!-- Менеджмент -->\r\n<div style=\"background-color: #fff; padding: 20px; border-radius: 6px; box-shadow: 0 1px 3px rgba(0,0,0,0.08); margin-bottom: 20px; border-top: 3px solid #C21631;\">\r\n  <h3 style=\"margin-top: 0; color: #1A3856;\">Менеджмент</h3>\r\n  <p style=\"margin-bottom: 5px;\">Специализации:</p>\r\n  <ul style=\"padding-left: 20px; margin-top: 0;\">\r\n    <li>Маркетинг в отраслях и сферах деятельности</li>\r\n    <li>Логистика</li>\r\n    <li>Управление проектами</li>\r\n    <li>Управление устойчивым развитием систем</li>\r\n    <li>Управление малым и средним бизнесом</li>\r\n  </ul>\r\n</div>\r\n\r\n<!-- Управление персоналом -->\r\n<div style=\"background-color: #fff; padding: 20px; border-radius: 6px; box-shadow: 0 1px 3px rgba(0,0,0,0.08); margin-bottom: 20px; border-top: 3px solid #C21631;\">\r\n  <h3 style=\"margin-top: 0; color: #1A3856;\">Управление персоналом</h3>\r\n  <p style=\"margin-bottom: 5px;\">Специализации:</p>\r\n  <ul style=\"padding-left: 20px; margin-top: 0;\">\r\n    <li>Кадровый консалтинг</li>\r\n    <li>Управление человеческими ресурсами</li>\r\n  </ul>\r\n</div>\r\n\r\n<!-- Таможенное дело -->\r\n<div style=\"background-color: #fff; padding: 20px; border-radius: 6px; box-shadow: 0 1px 3px rgba(0,0,0,0.08); margin-bottom: 20px; border-top: 3px solid #C21631;\">\r\n  <h3 style=\"margin-top: 0; color: #1A3856;\">Таможенное дело</h3>\r\n  <p style=\"margin-bottom: 5px;\">Специализация:</p>\r\n  <ul style=\"padding-left: 20px; margin-top: 0;\">\r\n    <li>Таможенные платежи и валютный контроль</li>\r\n  </ul>\r\n</div>\r\n\r\n<!-- Туризм -->\r\n<div style=\"background-color: #fff; padding: 20px; border-radius: 6px; box-shadow: 0 1px 3px rgba(0,0,0,0.08); margin-bottom: 20px; border-top: 3px solid #C21631;\">\r\n  <h3 style=\"margin-top: 0; color: #1A3856;\">Туризм</h3>\r\n  <p style=\"margin-bottom: 5px;\">Специализация:</p>\r\n  <ul style=\"padding-left: 20px; margin-top: 0;\">\r\n    <li>Технология и организация туроператорских и туристских услуг</li>\r\n  </ul>\r\n</div>\r\n\r\n<!-- Психолого-педагогическое образование -->\r\n<div style=\"background-color: #fff; padding: 20px; border-radius: 6px; box-shadow: 0 1px 3px rgba(0,0,0,0.08); margin-bottom: 20px; border-top: 3px solid #C21631;\">\r\n  <h3 style=\"margin-top: 0; color: #1A3856;\">Психолого-педагогическое образование</h3>\r\n  <p style=\"margin-bottom: 5px;\">Специализация:</p>\r\n  <ul style=\"padding-left: 20px; margin-top: 0;\">\r\n    <li>Психология и социальная педагогика</li>\r\n  </ul>\r\n</div>\r\n\r\n<!-- Прикладная информатика -->\r\n<div style=\"background-color: #fff; padding: 20px; border-radius: 6px; box-shadow: 0 1px 3px rgba(0,0,0,0.08); margin-bottom: 20px; border-top: 3px solid #C21631;\">\r\n  <h3 style=\"margin-top: 0; color: #1A3856;\">Прикладная информатика</h3>\r\n  <p style=\"margin-bottom: 5px;\">Специализации:</p>\r\n  <ul style=\"padding-left: 20px; margin-top: 0;\">\r\n    <li>Искусственный интеллект и анализ данных</li>\r\n    <li>Прикладная информатика в экономике</li>\r\n    <li>Корпоративные информационные системы</li>\r\n  </ul>\r\n</div>\r\n\r\n<!-- Бизнес информатика -->\r\n<div style=\"background-color: #fff; padding: 20px; border-radius: 6px; box-shadow: 0 1px 3px rgba(0,0,0,0.08); margin-bottom: 20px; border-top: 3px solid #C21631;\">\r\n  <h3 style=\"margin-top: 0; color: #1A3856;\">Бизнес информатика</h3>\r\n  <p style=\"margin-bottom: 5px;\">Специализации:</p>\r\n  <ul style=\"padding-left: 20px; margin-top: 0;\">\r\n    <li>Цифровая экономика</li>\r\n    <li>Электронный бизнес</li>\r\n  </ul>\r\n</div>\r\n\r\n<!-- Государственное и муниципальное управление -->\r\n<div style=\"background-color: #fff; padding: 20px; border-radius: 6px; box-shadow: 0 1px 3px rgba(0,0,0,0.08); margin-bottom: 20px; border-top: 3px solid #C21631;\">\r\n  <h3 style=\"margin-top: 0; color: #1A3856;\">Государственное и муниципальное управление</h3>\r\n  <p style=\"margin-bottom: 5px;\">Специализации:</p>\r\n  <ul style=\"padding-left: 20px; margin-top: 0;\">\r\n    <li>Государственное и муниципальное управление</li>\r\n    <li>Государственная и муниципальная служба</li>\r\n  </ul>\r\n</div>\r\n\r\n<h2 style=\"color: #1A3856; border-bottom: 1px solid #e0e3e6; padding-bottom: 8px;\">Формы сотрудничества</h2>\r\n\r\n<div style=\"background-color: #f8f9fa; padding: 20px; border-radius: 8px; margin: 25px 0;\">\r\n  <ul style=\"padding-left: 20px; margin-bottom: 0;\">\r\n    <li style=\"margin-bottom: 8px;\"><span style=\"font-weight: 600; color: #1A3856;\">Ярмарки вакансий</span> — презентация компаний</li>\r\n    <li style=\"margin-bottom: 8px;\"><span style=\"font-weight: 600; color: #1A3856;\">Практики студентов</span> (ознакомительные, производственные, преддипломные)</li>\r\n    <li><span style=\"font-weight: 600; color: #1A3856;\">Временная занятость</span> студентов</li>\r\n  </ul>\r\n</div>\r\n\r\n<div style=\"text-align: center; background-color: #f0f3f7; padding: 20px; border-radius: 8px; margin-top: 35px; border: 1px solid #d0d3d6;\">\r\n  <p style=\"margin: 0 0 10px; font-size: 17px; color: #1A3856;\">Направляйте заявки на адрес:</p>\r\n  <p style=\"margin: 0; font-size: 18px; font-weight: 600; color: #C21631;\">VEvdokimova@muiv.ru</p>\r\n</div>\r\n\r\n</div>'),
(4, 'Praktika', '# <div style=\"color:#1A3856; font-size:28px; font-weight:600; border-bottom:2px solid #C21631; padding-bottom:8px;\">Практическая подготовка студентов</div>\r\n\r\n<div style=\"background-color:#f5f9fc; padding:16px; border-left:4px solid #C21631; margin:16px 0; color:#1A3856;\">\r\nФорма организации образовательной деятельности при освоении образовательной программы в условиях выполнения обучающимися определённых видов работ, связанных с будущей профессиональной деятельностью и направленных на формирование, закрепление, развитие практических навыков и компетенций.\r\n</div>\r\n\r\n<div style=\"color:#1A3856; font-size:20px; font-weight:600; margin:24px 0 12px 0;\">Практика обучающихся в университете является видом учебной деятельности, направленным на:</div>\r\n\r\n<div style=\"display:grid; grid-template-columns:repeat(2, 1fr); gap:12px; margin-bottom:24px;\">\r\n  <div style=\"background-color:#f0f4f9; padding:12px; border-radius:6px; border-top:3px solid #C21631;\">\r\n    <div style=\"color:#C21631; font-weight:600; margin-bottom:6px;\">• Ознакомление с профессиональной средой</div>\r\n  </div>\r\n  <div style=\"background-color:#f0f4f9; padding:12px; border-radius:6px; border-top:3px solid #C21631;\">\r\n    <div style=\"color:#C21631; font-weight:600; margin-bottom:6px;\">• Формирование практических навыков</div>\r\n  </div>\r\n  <div style=\"background-color:#f0f4f9; padding:12px; border-radius:6px; border-top:3px solid #C21631;\">\r\n    <div style=\"color:#C21631; font-weight:600; margin-bottom:6px;\">• Закрепление теоретических знаний</div>\r\n  </div>\r\n  <div style=\"background-color:#f0f4f9; padding:12px; border-radius:6px; border-top:3px solid #C21631;\">\r\n    <div style=\"color:#C21631; font-weight:600; margin-bottom:6px;\">• Развитие профессиональных компетенций</div>\r\n  </div>\r\n</div>\r\n\r\n## <div style=\"color:#1A3856; font-size:24px; font-weight:600; margin:28px 0 16px 0; padding-bottom:6px; border-bottom:2px dashed #C21631;\">Этапы прохождения практики</div>\r\n\r\n### <div style=\"color:#1A3856; background-color:#f0f4f9; padding:8px 12px; border-radius:4px; font-size:18px; font-weight:600; display:inline-block; margin:16px 0 12px 0;\">За 1 месяц до начала</div>\r\n<div style=\"background-color:#f8fafc; padding:12px; border-radius:6px; margin-bottom:16px; border-left:3px solid #1A3856;\">\r\n  <div style=\"display:flex; align-items:baseline; margin-bottom:6px;\">\r\n    <div style=\"color:#C21631; font-weight:600; margin-right:8px;\">•</div>\r\n    <div>Направление заявления с указанием места практики в Центр карьеры</div>\r\n  </div>\r\n  <div style=\"display:flex; align-items:baseline;\">\r\n    <div style=\"color:#C21631; font-weight:600; margin-right:8px;\">•</div>\r\n    <div>Предоставление оригинала Договора о практической подготовке</div>\r\n  </div>\r\n</div>\r\n\r\n### <div style=\"color:#1A3856; background-color:#f0f4f9; padding:8px 12px; border-radius:4px; font-size:18px; font-weight:600; display:inline-block; margin:16px 0 12px 0;\">За 5 дней до начала</div>\r\n<div style=\"background-color:#f8fafc; padding:12px; border-radius:6px; margin-bottom:16px; border-left:3px solid #1A3856;\">\r\n  <div style=\"display:flex; align-items:baseline; margin-bottom:6px;\">\r\n    <div style=\"color:#C21631; font-weight:600; margin-right:8px;\">•</div>\r\n    <div>Проведение установочных конференций (в т.ч. вебинаров)</div>\r\n  </div>\r\n  <div style=\"display:flex; align-items:baseline;\">\r\n    <div style=\"color:#C21631; font-weight:600; margin-right:8px;\">•</div>\r\n    <div>Назначение руководителей практики:</div>\r\n  </div>\r\n  <div style=\"margin-left:24px; margin-top:6px;\">\r\n    <div style=\"display:flex; align-items:baseline;\">\r\n      <div style=\"color:#1A3856; font-weight:600; margin-right:8px;\">-</div>\r\n      <div>От университета</div>\r\n    </div>\r\n    <div style=\"display:flex; align-items:baseline;\">\r\n      <div style=\"color:#1A3856; font-weight:600; margin-right:8px;\">-</div>\r\n      <div>От организации (для внешней практики)</div>\r\n    </div>\r\n  </div>\r\n</div>\r\n\r\n<div style=\"background-color:#f5f9fc; padding:16px; border-radius:8px; margin:24px 0; border:1px solid #e1e8f0;\">\r\n  <div style=\"color:#1A3856; font-size:20px; font-weight:600; margin-bottom:12px;\">Аттестация</div>\r\n  <div style=\"display:flex; align-items:baseline; margin-bottom:6px;\">\r\n    <div style=\"color:#C21631; font-weight:600; margin-right:8px;\">•</div>\r\n    <div>Перевод оценки в 4-балльную систему</div>\r\n  </div>\r\n  <div style=\"display:flex; align-items:baseline; margin-bottom:6px;\">\r\n    <div style=\"color:#C21631; font-weight:600; margin-right:8px;\">•</div>\r\n    <div>Зачёт как форма аттестации</div>\r\n  </div>\r\n  <div style=\"display:flex; align-items:baseline;\">\r\n    <div style=\"color:#C21631; font-weight:600; margin-right:8px;\">•</div>\r\n    <div>Защита отчётов согласно расписанию</div>\r\n  </div>\r\n</div>\r\n\r\n<div style=\"text-align:center; margin:32px 0; padding:16px; background:linear-gradient(90deg, #f8fafc 0%, #f0f4f9 50%, #f8fafc 100%); border-radius:8px;\">\r\n  <div style=\"color:#C21631; font-size:20px; font-weight:600; text-transform:uppercase; letter-spacing:1px;\">Желаем успешного прохождения практики!</div>\r\n</div>');

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
(36, '2222', '1111', 'admin', 'Stepanida525@gmail.com'),
(37, '1111', '1111', 'admin', 'Stepanida525@gmail.com');

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
(17, 3, 18, NULL, '2025-06-09 14:55:46'),
(18, 2, 18, NULL, '2025-06-09 14:56:18'),
(19, 3, 19, NULL, '2025-06-11 11:47:53'),
(20, 3, 21, NULL, '2025-06-12 20:49:33');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `applications`
--
ALTER TABLE `applications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `applications_ibfk_2` (`offer_id`),
  ADD KEY `applications_ibfk_1` (`user_id`);

--
-- Индексы таблицы `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `favorites_ibfk_2` (`offer_id`),
  ADD KEY `favorites_ibfk_1` (`user_id`);

--
-- Индексы таблицы `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `logs_ibfk_1` (`user_id`);

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
  ADD KEY `notifications_ibfk_1` (`user_id`);

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
  ADD KEY `resume_id` (`resume_id`),
  ADD KEY `views_ibfk_2` (`offer_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `applications`
--
ALTER TABLE `applications`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT для таблицы `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=316;

--
-- AUTO_INCREMENT для таблицы `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT для таблицы `offers`
--
ALTER TABLE `offers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT для таблицы `resumes`
--
ALTER TABLE `resumes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `site_content`
--
ALTER TABLE `site_content`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT для таблицы `views`
--
ALTER TABLE `views`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `applications`
--
ALTER TABLE `applications`
  ADD CONSTRAINT `applications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `applications_ibfk_2` FOREIGN KEY (`offer_id`) REFERENCES `offers` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `favorites_ibfk_2` FOREIGN KEY (`offer_id`) REFERENCES `offers` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `logs`
--
ALTER TABLE `logs`
  ADD CONSTRAINT `logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

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
-- Ограничения внешнего ключа таблицы `views`
--
ALTER TABLE `views`
  ADD CONSTRAINT `views_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `views_ibfk_2` FOREIGN KEY (`offer_id`) REFERENCES `offers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `views_ibfk_3` FOREIGN KEY (`resume_id`) REFERENCES `resumes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
