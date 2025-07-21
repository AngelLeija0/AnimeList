-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-07-2025 a las 03:16:35
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `clini_plas`
--
CREATE DATABASE IF NOT EXISTS `clini_plas` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `clini_plas`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `appointment`
--

CREATE TABLE `appointment` (
  `ApptId` int(11) NOT NULL,
  `EmpleadoId` int(11) NOT NULL,
  `UserId` int(11) NOT NULL,
  `ServiceId` int(11) NOT NULL,
  `AppointmentDate` datetime NOT NULL,
  `Location` varchar(150) DEFAULT NULL,
  `Duration` int(11) DEFAULT NULL,
  `Status` enum('En espera','Postergada','Cancelada','Completada') NOT NULL DEFAULT 'En espera',
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `deletedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `campaign`
--

CREATE TABLE `campaign` (
  `CampaignId` int(11) NOT NULL,
  `CampaignName` varchar(100) NOT NULL,
  `CampaignMessage` text NOT NULL,
  `CreatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `CampaignSended` timestamp NULL DEFAULT NULL,
  `CampaignAudience` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`CampaignAudience`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `campaign`
--

INSERT INTO `campaign` (`CampaignId`, `CampaignName`, `CampaignMessage`, `CreatedAt`, `CampaignSended`, `CampaignAudience`) VALUES
(3, '¡Hola!', '¡Hola 👋!', '2025-03-01 18:10:45.638443', '2025-03-02 18:16:32', NULL),
(4, 'Test', 'test!', '2025-03-01 20:19:18.198385', NULL, NULL),
(5, 'Test 2', 'test 2', '2025-03-01 20:22:23.547793', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `campaign_users`
--

CREATE TABLE `campaign_users` (
  `CampaignId` int(11) NOT NULL,
  `UserId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `campaign_users`
--

INSERT INTO `campaign_users` (`CampaignId`, `UserId`) VALUES
(3, 11),
(4, 11),
(4, 12),
(4, 19),
(4, 23),
(4, 24),
(4, 25),
(4, 26),
(4, 27),
(4, 28),
(4, 29),
(4, 30),
(4, 31),
(4, 32),
(4, 33),
(4, 34),
(5, 11),
(5, 12),
(5, 19);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `document`
--

CREATE TABLE `document` (
  `documentId` int(11) NOT NULL,
  `nameDocument` varchar(255) NOT NULL,
  `dateDocument` date NOT NULL,
  `userUserId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `document`
--

INSERT INTO `document` (`documentId`, `nameDocument`, `dateDocument`, `userUserId`) VALUES
(29, 'pdf-example_20250112204357667_674847205.pdf', '2025-01-12', 12),
(30, 'img3_20250112204358389_722105084.jpg', '2025-01-12', 12),
(32, 'pdf-example_20250201134212856_636406822.pdf', '2025-02-01', 19),
(37, 'Curriculum Profesional_20250222211651712_132992995.pdf', '2025-02-22', 34),
(38, 'PDF-Example_20250414160259945_867677420.pdf', '2025-04-14', 11),
(40, 'Screenshot 2025-04-14 160331_20250414160341670_707588463.png', '2025-04-14', 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `email`
--

CREATE TABLE `email` (
  `EmailId` int(11) NOT NULL,
  `UserId` int(11) NOT NULL,
  `ContentEmail` varchar(255) NOT NULL,
  `StatusEmailSender` varchar(255) NOT NULL,
  `SentDateEmail` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `email`
--

INSERT INTO `email` (`EmailId`, `UserId`, `ContentEmail`, `StatusEmailSender`, `SentDateEmail`) VALUES
(1, 11, 'carlita estrella cruz dominguez - Servicio de venta 88', 'Fallido', '2025-06-30 21:48:22'),
(2, 11, 'carlita estrella cruz dominguez - Pago de venta', 'Fallido', '2025-06-30 21:48:22'),
(3, 11, 'carlita estrella cruz dominguez - Servicio de venta 89', 'Fallido', '2025-06-30 21:53:02'),
(4, 11, 'carlita estrella cruz dominguez - Pago de venta', 'Fallido', '2025-06-30 21:53:02'),
(5, 11, 'carlita estrella cruz dominguez - Servicio de venta 90', 'Fallido', '2025-06-30 21:57:44'),
(6, 11, 'carlita estrella cruz dominguez - Pago de venta', 'Fallido', '2025-06-30 21:57:44'),
(7, 35, 'Angel Leija - Servicio de venta 91', 'Fallido', '2025-06-30 21:59:09'),
(8, 35, 'Angel Leija - Pago de venta', 'Fallido', '2025-06-30 21:59:09'),
(9, 35, 'Angel Leija - Servicio de venta 92', 'Fallido', '2025-06-30 22:00:54'),
(10, 35, 'Angel Leija - Pago de venta', 'Fallido', '2025-06-30 22:00:54'),
(11, 35, 'Angel Leija - Servicio de venta 93', 'Fallido', '2025-06-30 22:04:55'),
(12, 35, 'Angel Leija - Pago de venta', 'Fallido', '2025-06-30 22:04:55'),
(13, 35, 'Angel Leija - Servicio de venta 94', 'Fallido', '2025-06-30 22:07:53'),
(14, 35, 'Angel Leija - Pago de venta', 'Fallido', '2025-06-30 22:07:53'),
(15, 35, 'Angel Leija - Servicio de venta 95', 'Fallido', '2025-06-30 22:11:17'),
(16, 35, 'Angel Leija - Pago de venta', 'Fallido', '2025-06-30 22:11:17'),
(17, 35, 'Angel Leija - Servicio de venta 96', 'Fallido', '2025-06-30 22:14:32'),
(18, 35, 'Angel Leija - Pago de venta', 'Fallido', '2025-06-30 22:14:32'),
(19, 35, 'Angel Leija - Servicio de venta 97', 'Enviado', '2025-06-30 22:16:07'),
(20, 35, 'Angel Leija - Pago de venta', 'Enviado', '2025-06-30 22:16:09'),
(21, 35, 'Angel Leija - Pago de venta', 'Enviado', '2025-06-30 22:16:26'),
(22, 35, 'Angel Leija - Servicio de venta 98', 'Enviado', '2025-06-30 22:22:22'),
(23, 35, 'Angel Leija - Pago de venta', 'Enviado', '2025-06-30 22:22:24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `EmpleadoId` int(11) NOT NULL,
  `EmpleadoName` varchar(50) NOT NULL,
  `EmpleadoLastName` varchar(50) NOT NULL,
  `EmpleadoEmail` varchar(255) NOT NULL,
  `EmpleadoPassword` varchar(255) NOT NULL,
  `EmpleadoImage` varchar(255) DEFAULT NULL,
  `RoleId` int(11) NOT NULL,
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `EmpleadoCode` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`EmpleadoId`, `EmpleadoName`, `EmpleadoLastName`, `EmpleadoEmail`, `EmpleadoPassword`, `EmpleadoImage`, `RoleId`, `createdAt`, `updatedAt`, `EmpleadoCode`) VALUES
(2, 'otrocambio1', 'Menos', 'cambiosd@sque.com', '$2b$10$Rw3OcwmeaYwy08sdVlWzf.ZfQeE9xiM0SY8/F180cRRFmUGwbG73K', 'Captura_de_pantalla_2024-09-02_181211_1735855294475.png', 1, '2024-12-20 21:40:45.657212', '2025-03-09 13:49:48.000000', NULL),
(3, 'otrocambio2', 'Menos2', 'cambios2@sque.com', '$2b$10$Bet52mINPTbPTiTruIs4ZurdA168BqRdCS/vVjsVO67D.18KLJk92', 'Captura_de_pantalla_2024-09-02_181211_1735855749220.png', 3, '2024-12-20 21:40:55.677125', '2025-01-02 16:09:09.000000', NULL),
(6, 'hola4', 'adios4', 'hola_5@gmail.com', '$2b$10$e6Tv1l8dZoVdXiSv44JLnuNvizWJ1OVxS9rT9GIZ./vlFwucMlNbK', '', 3, '2024-12-20 21:42:43.700215', '2024-12-20 21:42:43.700215', NULL),
(8, 'hola7', 'adios7', 'hola_8@gmail.com', '$2b$10$eBSztIkahk7ruz9YZ0aJVu4qMcA3crgt2MP6Py6CT5sQyhYikzVye', '', 3, '2024-12-20 21:43:13.018119', '2024-12-20 21:43:13.018119', NULL),
(14, 'todo', 'bien', 'bien@masterclinic.com', '$2b$10$uMX3d94AnfYp4bo2v57VS..4wFSFjRkp0Vd02Z/E1fOGW5VN8E/bS', '', 3, '2024-12-21 18:39:58.518907', '2024-12-21 18:39:58.518907', NULL),
(23, 'Angel', 'Admin', 'angelleija@gmail.com', '$2b$10$axUQlVoaWCFgG2h1VUfcmud3g2A2yaOI.qyP0TYr.scSx89b5whTS', NULL, 2, '2025-01-08 19:35:43.515111', '2025-02-08 21:19:12.801299', NULL),
(24, 'Angel', 'Leija', 'admin1@gmail.com', '$2b$10$TeAlKC8foGIJ7/rFpN0aZO.zDKHi7iao9naMp063HGCUzuJKlv60m', NULL, 1, '2025-01-12 18:21:21.573696', '2025-02-09 00:24:38.000000', NULL),
(25, 'Empleado', '1', 'empleado1@gmail.com', '$2b$10$TeAlKC8foGIJ7/rFpN0aZO.zDKHi7iao9naMp063HGCUzuJKlv60m', NULL, 2, '2025-01-27 18:56:35.766874', '2025-03-11 18:02:28.438242', NULL),
(26, 'Empleado', '2', 'empleado2@gmail.com', '$2b$10$lNNu9xV9TUHdfXVtXausleFYeR8lsohkUE5gWvvyZG7FK/UQ1F3xq', NULL, 2, '2025-01-27 18:56:53.045891', '2025-01-27 18:56:53.045891', NULL),
(27, 'Empleado', '3', 'empleado3@gmail.com', '$2b$10$mdBAypLuo/wPTafitUF1...buJEDv7BiT/189ByD3xKueAGYjYs9G', NULL, 2, '2025-01-27 18:57:10.360853', '2025-01-27 18:57:10.360853', NULL),
(28, 'Empleado', '4', 'empleado@gmail.com', '$2b$10$9JSe1Ke5Xf5uTLm10gh8YecBCs2YPMYWV09i0oczXmY6Mtt.7jMdW', NULL, 2, '2025-01-27 18:57:31.046178', '2025-01-27 18:57:31.046178', NULL),
(29, 'Empleado', '5', 'empleado5@gmail.com', '$2b$10$xOwM3R/b.S20DcGcRS3wz.UpZkHxbUXluC.7P0AG4.3oxvWDwJGCW', NULL, 2, '2025-01-27 18:57:53.133759', '2025-01-27 18:57:53.133759', NULL),
(30, 'Empleado10', 'Prueba10', 'empleado10@gmail.com', 'hashed_password', NULL, 2, '2025-02-22 23:06:12.806238', '2025-02-22 23:06:12.806238', 'EP010'),
(31, 'Empleado11', 'Prueba10', 'empleado11@gmail.com', 'hashed_password', NULL, 2, '2025-02-22 23:06:12.806238', '2025-02-22 23:06:12.806238', 'EP011'),
(32, 'Empleado12', 'Prueba10', 'empleado12@gmail.com', 'hashed_password', NULL, 2, '2025-02-22 23:06:12.806238', '2025-02-22 23:06:12.806238', 'EP012'),
(33, 'Empleado13', 'Prueba10', 'empleado13@gmail.com', 'hashed_password', NULL, 2, '2025-02-22 23:06:12.806238', '2025-02-22 23:06:12.806238', 'EP013'),
(34, 'Empleado14', 'Prueba10', 'empleado14@gmail.com', 'hashed_password', NULL, 2, '2025-02-22 23:06:12.806238', '2025-02-22 23:06:12.806238', 'EP014'),
(35, 'Empleado15', 'Prueba10', 'empleado15@gmail.com', 'hashed_password', NULL, 2, '2025-02-22 23:06:12.806238', '2025-02-22 23:06:12.806238', 'EP015'),
(36, 'Empleado16', 'Prueba10', 'empleado16@gmail.com', 'hashed_password', NULL, 2, '2025-02-22 23:06:12.806238', '2025-02-22 23:06:12.806238', 'EP016'),
(37, 'Empleado17', 'Prueba10', 'empleado17@gmail.com', 'hashed_password', NULL, 2, '2025-02-22 23:06:12.806238', '2025-02-22 23:06:12.806238', 'EP017'),
(38, 'Empleado18', 'Prueba10', 'empleado18@gmail.com', 'hashed_password', NULL, 2, '2025-02-22 23:06:12.806238', '2025-02-22 23:06:12.806238', 'EP018'),
(39, 'Empleado19', 'Prueba10', 'empleado19@gmail.com', 'hashed_password', NULL, 2, '2025-02-22 23:06:12.806238', '2025-02-22 23:06:12.806238', 'EP019'),
(40, 'Empleado20', 'Prueba10', 'empleado20@gmail.com', 'hashed_password', NULL, 2, '2025-02-22 23:06:12.806238', '2025-02-22 23:06:12.806238', 'EP020'),
(41, 'Empleado21', 'Prueba10', 'empleado21@gmail.com', 'hashed_password', NULL, 2, '2025-02-22 23:06:12.806238', '2025-02-22 23:06:12.806238', 'EP021'),
(42, 'Empleado22', 'Prueba10', 'empleado22@gmail.com', 'hashed_password', NULL, 2, '2025-02-22 23:06:12.806238', '2025-02-22 23:06:12.806238', 'EP022'),
(43, 'Empleado23', 'Prueba10', 'empleado23@gmail.com', 'hashed_password', NULL, 2, '2025-02-22 23:06:12.806238', '2025-02-22 23:06:12.806238', 'EP023'),
(44, 'Empleado24', 'Prueba10', 'empleado24@gmail.com', 'hashed_password', NULL, 2, '2025-02-22 23:06:12.806238', '2025-02-22 23:06:12.806238', 'EP024'),
(45, 'Empleado25', 'Prueba10', 'empleado25@gmail.com', 'hashed_password', NULL, 2, '2025-02-22 23:06:12.806238', '2025-02-22 23:06:12.806238', 'EP025'),
(46, 'Empleado26', 'Prueba10', 'empleado26@gmail.com', 'hashed_password', NULL, 2, '2025-02-22 23:06:12.806238', '2025-02-22 23:06:12.806238', 'EP026'),
(47, 'Empleado27', 'Prueba10', 'empleado27@gmail.com', 'hashed_password', NULL, 2, '2025-02-22 23:06:12.806238', '2025-02-22 23:06:12.806238', 'EP027'),
(48, 'Empleado28', 'Prueba10', 'empleado28@gmail.com', 'hashed_password', NULL, 2, '2025-02-22 23:06:12.806238', '2025-02-22 23:06:12.806238', 'EP028'),
(49, 'Empleado29', 'Prueba10', 'empleado29@gmail.com', 'hashed_password', NULL, 2, '2025-02-22 23:06:12.806238', '2025-02-22 23:06:12.806238', 'EP029'),
(50, 'Empleado30', 'Prueba10', 'empleado30@gmail.com', 'hashed_password', NULL, 2, '2025-02-22 23:06:12.806238', '2025-02-22 23:06:12.806238', 'EP030'),
(51, 'Empleado31', 'Prueba10', 'empleado31@gmail.com', 'hashed_password', NULL, 2, '2025-02-22 23:06:55.398410', '2025-02-22 23:06:55.398410', 'EP031'),
(52, 'Empleado32', 'Prueba10', 'empleado32@gmail.com', 'hashed_password', NULL, 2, '2025-02-22 23:06:55.398410', '2025-02-22 23:06:55.398410', 'EP032'),
(53, 'Empleado33', 'Prueba10', 'empleado33@gmail.com', 'hashed_password', NULL, 2, '2025-02-22 23:06:55.398410', '2025-02-22 23:06:55.398410', 'EP033'),
(54, 'Empleado34', 'Prueba10', 'empleado34@gmail.com', 'hashed_password', NULL, 2, '2025-02-22 23:06:55.398410', '2025-02-22 23:06:55.398410', 'EP034'),
(55, 'Empleado35', 'Prueba10', 'empleado35@gmail.com', 'hashed_password', NULL, 2, '2025-02-22 23:06:55.398410', '2025-02-22 23:06:55.398410', 'EP035'),
(56, 'Empleado36', 'Prueba10', 'empleado36@gmail.com', 'hashed_password', NULL, 2, '2025-02-22 23:06:55.398410', '2025-02-22 23:06:55.398410', 'EP036'),
(57, 'Empleado37', 'Prueba10', 'empleado37@gmail.com', 'hashed_password', NULL, 2, '2025-02-22 23:06:55.398410', '2025-02-22 23:06:55.398410', 'EP037'),
(58, 'Empleado38', 'Prueba10', 'empleado38@gmail.com', 'hashed_password', NULL, 2, '2025-02-22 23:06:55.398410', '2025-02-22 23:06:55.398410', 'EP038'),
(59, 'Empleado39', 'Prueba10', 'empleado39@gmail.com', 'hashed_password', NULL, 2, '2025-02-22 23:06:55.398410', '2025-02-22 23:06:55.398410', 'EP039'),
(60, 'Empleado40', 'Prueba10', 'empleado40@gmail.com', 'hashed_password', NULL, 2, '2025-02-22 23:06:55.398410', '2025-02-22 23:06:55.398410', 'EP040'),
(61, 'Empleado41', 'Prueba10', 'empleado41@gmail.com', 'hashed_password', NULL, 2, '2025-02-22 23:06:55.398410', '2025-02-22 23:06:55.398410', 'EP041'),
(62, 'Empleado42', 'Prueba10', 'empleado42@gmail.com', 'hashed_password', NULL, 2, '2025-02-22 23:06:55.398410', '2025-02-22 23:06:55.398410', 'EP042'),
(63, 'Empleado43', 'Prueba10', 'empleado43@gmail.com', 'hashed_password', NULL, 2, '2025-02-22 23:06:55.398410', '2025-02-22 23:06:55.398410', 'EP043'),
(64, 'Empleado44', 'Prueba10', 'empleado44@gmail.com', 'hashed_password', NULL, 2, '2025-02-22 23:06:55.398410', '2025-02-22 23:06:55.398410', 'EP044'),
(65, 'Empleado45', 'Prueba10', 'empleado45@gmail.com', 'hashed_password', NULL, 2, '2025-02-22 23:06:55.398410', '2025-02-22 23:06:55.398410', 'EP045'),
(66, 'Empleado46', 'Prueba10', 'empleado46@gmail.com', 'hashed_password', NULL, 2, '2025-02-22 23:06:55.398410', '2025-02-22 23:06:55.398410', 'EP046'),
(67, 'Empleado47', 'Prueba10', 'empleado47@gmail.com', 'hashed_password', NULL, 2, '2025-02-22 23:06:55.398410', '2025-02-22 23:06:55.398410', 'EP047'),
(68, 'Empleado48', 'Prueba10', 'empleado48@gmail.com', 'hashed_password', NULL, 2, '2025-02-22 23:06:55.398410', '2025-02-22 23:06:55.398410', 'EP048'),
(69, 'Empleado49', 'Prueba10', 'empleado49@gmail.com', 'hashed_password', NULL, 2, '2025-02-22 23:06:55.398410', '2025-02-22 23:06:55.398410', 'EP049'),
(70, 'Empleado50', 'Prueba10', 'empleado50@gmail.com', 'hashed_password', NULL, 2, '2025-02-22 23:06:55.398410', '2025-02-22 23:06:55.398410', 'EP050'),
(71, 'Empleado51', 'Prueba', 'empleado51@gmail.com', '', NULL, 2, '2025-02-22 23:10:59.665431', '2025-02-22 23:10:59.665431', 'EP51'),
(72, 'Empleado52', 'Prueba', 'empleado52@gmail.com', '', NULL, 2, '2025-02-22 23:10:59.665431', '2025-02-22 23:10:59.665431', 'EP52'),
(73, 'Empleado53', 'Prueba', 'empleado53@gmail.com', '', NULL, 2, '2025-02-22 23:10:59.665431', '2025-02-22 23:10:59.665431', 'EP53'),
(74, 'Empleado54', 'Prueba', 'empleado54@gmail.com', '', NULL, 2, '2025-02-22 23:10:59.665431', '2025-02-22 23:10:59.665431', 'EP54'),
(75, 'Empleado55', 'Prueba', 'empleado55@gmail.com', '', NULL, 2, '2025-02-22 23:10:59.665431', '2025-02-22 23:10:59.665431', 'EP55'),
(76, 'Empleado56', 'Prueba', 'empleado56@gmail.com', '', NULL, 2, '2025-02-22 23:10:59.665431', '2025-02-22 23:10:59.665431', 'EP56'),
(77, 'Empleado57', 'Prueba', 'empleado57@gmail.com', '', NULL, 2, '2025-02-22 23:10:59.665431', '2025-02-22 23:10:59.665431', 'EP57'),
(78, 'Empleado58', 'Prueba', 'empleado58@gmail.com', '', NULL, 2, '2025-02-22 23:10:59.665431', '2025-02-22 23:10:59.665431', 'EP58'),
(79, 'Empleado59', 'Prueba', 'empleado59@gmail.com', '', NULL, 2, '2025-02-22 23:10:59.665431', '2025-02-22 23:10:59.665431', 'EP59'),
(80, 'Empleado60', 'Prueba', 'empleado60@gmail.com', '', NULL, 2, '2025-02-22 23:10:59.665431', '2025-02-22 23:10:59.665431', 'EP60'),
(81, 'Caja ', '1', 'caja1@gmail.com', '$2b$10$acAgxrB/6zbmeOS90VONvOoOWAP2vJTFPvMWSrlRMM1biUn4Fmb6y', NULL, 4, '2025-03-11 18:30:18.942646', '2025-03-11 18:30:18.942646', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `episodios`
--

CREATE TABLE `episodios` (
  `episodioId` int(11) NOT NULL,
  `fecha_episodio` datetime NOT NULL,
  `diagnostico` text DEFAULT NULL,
  `tratamiento` text DEFAULT NULL,
  `notas_episodio` text DEFAULT NULL,
  `userUserId` int(11) DEFAULT NULL,
  `empleadoAutorId` int(11) DEFAULT NULL,
  `empleadoServicioId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `episodios`
--

INSERT INTO `episodios` (`episodioId`, `fecha_episodio`, `diagnostico`, `tratamiento`, `notas_episodio`, `userUserId`, `empleadoAutorId`, `empleadoServicioId`) VALUES
(1, '2025-02-17 15:41:00', 'Diagnostico de ejemplo 1', 'nuevo servicio, botox 1', 'Nota de episodio', 12, 2, 23),
(2, '2025-02-16 15:42:00', 'Diagnostico de ejemplo 2', 'nuevo servicio', 'Ejemplo de notas', 12, 3, 2),
(3, '2025-02-18 15:44:00', 'Diagnostico de ejemplo 3', 'botox 1', 'Ejemplo', 12, 23, 24),
(4, '2025-02-22 21:15:00', 'test', 'botox 1, ejemplo', '', 34, NULL, NULL),
(5, '2025-04-18 13:00:00', 'Diagnóstico de ejemplo', 'Servicio 1, Servicio 2', '', 11, 23, 25);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ficha`
--

CREATE TABLE `ficha` (
  `FichaId` int(11) NOT NULL,
  `FichaName` varchar(255) NOT NULL,
  `UserId` int(11) NOT NULL,
  `AppointmentId` int(11) NOT NULL,
  `Peso` float DEFAULT NULL,
  `Estatura` float DEFAULT NULL,
  `FechaNacimiento` date DEFAULT NULL,
  `Alergias` text DEFAULT NULL,
  `NotasMedicas` text DEFAULT NULL,
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `membership`
--

CREATE TABLE `membership` (
  `MembershipId` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Description` varchar(500) NOT NULL,
  `MaxServices` int(11) NOT NULL,
  `AnualPrice` decimal(10,2) NOT NULL,
  `SemestralPrice` decimal(10,2) NOT NULL,
  `MonthlyPrice` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `membership`
--

INSERT INTO `membership` (`MembershipId`, `Name`, `Description`, `MaxServices`, `AnualPrice`, `SemestralPrice`, `MonthlyPrice`) VALUES
(1, 'Membresía Básica', 'Acceso a consultas médicas generales y exámenes básicos', 12, 4500.00, 2400.00, 450.00),
(2, 'Membresía Wellness', 'Enfoque en bienestar general con servicios preventivos y estéticos básicos', 18, 7200.00, 3800.00, 700.00),
(3, 'Membresía Premium', 'Acceso completo a especialidades médicas y tratamientos avanzados', 24, 12000.00, 6400.00, 1200.00),
(4, 'Membresía Estética', 'Especializada en tratamientos de belleza y rejuvenecimiento', 15, 9600.00, 5100.00, 950.00),
(5, 'Membresía Deportiva', 'Orientada a deportistas con rehabilitación y terapias especializadas', 20, 8400.00, 4500.00, 850.00),
(6, 'Membresía Familiar', 'Cobertura integral para toda la familia con servicios pediátricos', 30, 15000.00, 8000.00, 1500.00),
(7, 'Membresía Senior', 'Diseñada para adultos mayores con servicios geriátricos especializados', 16, 6000.00, 3200.00, 600.00),
(8, 'Membresía Ejecutiva', 'Para profesionales ocupados con horarios flexibles y servicios premium', 20, 18000.00, 9600.00, 1800.00),
(9, 'Membresía Preventiva', 'Enfoque en medicina preventiva y chequeos regulares', 14, 5400.00, 2900.00, 540.00),
(10, 'Membresía VIP', 'Acceso ilimitado a todos los servicios con atención prioritaria', 50, 36000.00, 19200.00, 3600.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `memberships_services`
--

CREATE TABLE `memberships_services` (
  `MembershipId` int(11) NOT NULL,
  `ServiceId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `memberships_services`
--

INSERT INTO `memberships_services` (`MembershipId`, `ServiceId`) VALUES
(1, 2),
(1, 5),
(1, 11),
(1, 12),
(1, 16),
(1, 19),
(1, 32),
(1, 50),
(2, 1),
(2, 2),
(2, 3),
(2, 5),
(2, 6),
(2, 11),
(2, 13),
(2, 16),
(2, 19),
(2, 33),
(2, 50),
(3, 2),
(3, 5),
(3, 6),
(3, 7),
(3, 8),
(3, 9),
(3, 11),
(3, 12),
(3, 13),
(3, 17),
(3, 21),
(3, 24),
(3, 26),
(3, 28),
(3, 37),
(3, 39),
(3, 43),
(3, 46),
(4, 1),
(4, 3),
(4, 4),
(4, 10),
(4, 15),
(4, 17),
(4, 20),
(4, 25),
(4, 29),
(4, 33),
(4, 38),
(4, 47),
(4, 49),
(5, 2),
(5, 5),
(5, 7),
(5, 11),
(5, 12),
(5, 13),
(5, 23),
(5, 24),
(5, 27),
(5, 32),
(5, 36),
(5, 39),
(5, 40),
(5, 41),
(5, 44),
(6, 2),
(6, 5),
(6, 6),
(6, 7),
(6, 8),
(6, 9),
(6, 11),
(6, 12),
(6, 13),
(6, 14),
(6, 16),
(6, 17),
(6, 18),
(6, 19),
(6, 22),
(6, 30),
(6, 35),
(6, 43),
(6, 50),
(7, 2),
(7, 5),
(7, 6),
(7, 7),
(7, 11),
(7, 13),
(7, 24),
(7, 26),
(7, 27),
(7, 28),
(7, 34),
(7, 36),
(7, 43),
(7, 45),
(7, 50),
(8, 1),
(8, 2),
(8, 3),
(8, 5),
(8, 6),
(8, 7),
(8, 8),
(8, 11),
(8, 15),
(8, 17),
(8, 20),
(8, 24),
(8, 26),
(8, 29),
(8, 30),
(8, 33),
(8, 40),
(8, 44),
(9, 2),
(9, 5),
(9, 7),
(9, 8),
(9, 11),
(9, 12),
(9, 16),
(9, 19),
(9, 22),
(9, 27),
(9, 32),
(9, 43),
(9, 50),
(10, 1),
(10, 2),
(10, 3),
(10, 4),
(10, 5),
(10, 6),
(10, 7),
(10, 8),
(10, 9),
(10, 10),
(10, 11),
(10, 12),
(10, 13),
(10, 14),
(10, 15),
(10, 16),
(10, 17),
(10, 18),
(10, 19),
(10, 20),
(10, 21),
(10, 22),
(10, 23),
(10, 24),
(10, 25),
(10, 26),
(10, 27),
(10, 28),
(10, 29),
(10, 30),
(10, 31),
(10, 32),
(10, 33),
(10, 34),
(10, 35),
(10, 36),
(10, 37),
(10, 38),
(10, 39),
(10, 40),
(10, 41),
(10, 42),
(10, 43),
(10, 44),
(10, 45),
(10, 46),
(10, 47),
(10, 48),
(10, 49),
(10, 50);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `id_pago` int(11) NOT NULL,
  `id_cita` int(11) DEFAULT NULL,
  `monto` int(11) NOT NULL,
  `metodo_pago` enum('Tarjeta','Efectivo','Transferencia') DEFAULT NULL,
  `fecha_pago` timestamp NOT NULL DEFAULT current_timestamp(),
  `estado_pago` enum('Pagado','Pendiente','Reembolsado') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payments`
--

CREATE TABLE `payments` (
  `PaymentId` int(11) NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `fecha` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `VentaId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `ProductId` int(11) NOT NULL,
  `ProductName` varchar(255) NOT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `Stock` int(11) NOT NULL DEFAULT 0,
  `Image` varchar(255) DEFAULT NULL,
  `CategoryId` int(11) NOT NULL,
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role`
--

CREATE TABLE `role` (
  `RoleId` int(11) NOT NULL,
  `RoleName` varchar(50) NOT NULL,
  `PrivilegeLevel` int(11) NOT NULL,
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `role`
--

INSERT INTO `role` (`RoleId`, `RoleName`, `PrivilegeLevel`, `createdAt`, `updatedAt`) VALUES
(1, 'Administrador', 4, '2024-12-20 08:56:25.049158', '2025-01-25 15:07:23.356915'),
(2, 'Empleado', 2, '2024-12-20 21:40:02.369115', '2024-12-20 21:40:02.369115'),
(3, 'Cliente', 3, '2024-12-20 21:40:15.868610', '2024-12-20 21:40:15.868610'),
(4, 'Caja', 3, '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `service`
--

CREATE TABLE `service` (
  `ServiceId` int(11) NOT NULL,
  `ServiceName` varchar(100) NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `Description` varchar(500) DEFAULT NULL,
  `Photos` text DEFAULT NULL,
  `AvailableHours` text DEFAULT NULL,
  `MinutesService` int(11) DEFAULT NULL,
  `IsActive` tinyint(4) NOT NULL DEFAULT 1,
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `PAQUETE_PRECIO_MXN` decimal(10,2) DEFAULT NULL,
  `PAQUETE_PRECIO_USD` decimal(10,2) DEFAULT NULL,
  `SERVICIO_INDIVIDUAL_MXN` decimal(10,2) DEFAULT NULL,
  `SERVICIO_INDIVIDUAL_USD` decimal(10,2) DEFAULT NULL,
  `COSTO_MXN` decimal(10,2) DEFAULT NULL,
  `COSTO_USD` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `service`
--

INSERT INTO `service` (`ServiceId`, `ServiceName`, `Price`, `Description`, `Photos`, `AvailableHours`, `MinutesService`, `IsActive`, `createdAt`, `updatedAt`, `PAQUETE_PRECIO_MXN`, `PAQUETE_PRECIO_USD`, `SERVICIO_INDIVIDUAL_MXN`, `SERVICIO_INDIVIDUAL_USD`, `COSTO_MXN`, `COSTO_USD`) VALUES
(1, 'Limpieza Facial', 750.00, 'Limpieza profunda de cutis', '[\"facial.jpg\"]', '{\"Lunes\": \"09:00 - 17:00\", \"Martes\": \"09:00 - 17:00\", \"Miercoles\": \"09:00 - 17:00\", \"Jueves\": \"09:00 - 17:00\", \"Viernes\": \"09:00 - 17:00\", \"Sabado\": \"10:00 - 14:00\", \"Domingo\": \"N/A - N/A\"}', 60, 1, '2025-06-19 00:50:16.000000', '2025-06-19 00:50:16.000000', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'Chequeo General', 500.00, 'Evaluación médica general', '[\"general-checking.jpg\"]', '{\"Lunes\": \"08:00 - 16:00\", \"Martes\": \"08:00 - 16:00\", \"Miercoles\": \"08:00 - 16:00\", \"Jueves\": \"08:00 - 16:00\", \"Viernes\": \"08:00 - 16:00\", \"Sabado\": \"09:00 - 13:00\", \"Domingo\": \"N/A - N/A\"}', 45, 1, '2025-06-19 00:50:16.000000', '2025-06-19 00:50:16.000000', NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'Masaje Relajante', 850.00, 'Masaje terapéutico para aliviar el estrés', '[\"massage.jpg\"]', '{\"Lunes\": \"10:00 - 18:00\", \"Martes\": \"10:00 - 18:00\", \"Miercoles\": \"10:00 - 18:00\", \"Jueves\": \"10:00 - 18:00\", \"Viernes\": \"10:00 - 18:00\", \"Sabado\": \"10:00 - 15:00\", \"Domingo\": \"N/A - N/A\"}', 60, 1, '2025-06-19 00:50:16.000000', '2025-06-19 00:50:16.000000', NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'Depilación Láser', 1200.00, 'Eliminación de vello mediante láser', '[\"laser-hair-removal.jpg\"]', '{\"Lunes\": \"11:00 - 17:00\", \"Martes\": \"11:00 - 17:00\", \"Miercoles\": \"11:00 - 17:00\", \"Jueves\": \"11:00 - 17:00\", \"Viernes\": \"11:00 - 17:00\", \"Sabado\": \"11:00 - 14:00\", \"Domingo\": \"N/A - N/A\"}', 90, 1, '2025-06-19 00:50:16.000000', '2025-06-19 00:50:16.000000', NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'Consulta de Nutrición', 650.00, 'Plan de alimentación personalizado', '[\"nutrition.jpg\"]', '{\"Lunes\": \"08:00 - 14:00\", \"Martes\": \"08:00 - 14:00\", \"Miercoles\": \"08:00 - 14:00\", \"Jueves\": \"08:00 - 14:00\", \"Viernes\": \"08:00 - 14:00\", \"Sabado\": \"09:00 - 12:00\", \"Domingo\": \"N/A - N/A\"}', 50, 1, '2025-06-19 00:50:16.000000', '2025-06-19 00:50:16.000000', NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'Consulta Psicológica', 800.00, 'Sesión de terapia psicológica individual', '[\"psychology.jpg\"]', '{\"Lunes\": \"09:00 - 17:00\", \"Martes\": \"09:00 - 17:00\", \"Miercoles\": \"09:00 - 17:00\", \"Jueves\": \"09:00 - 17:00\", \"Viernes\": \"09:00 - 17:00\", \"Sabado\": \"10:00 - 14:00\", \"Domingo\": \"N/A - N/A\"}', 60, 1, '2025-06-19 00:50:16.000000', '2025-06-19 00:50:16.000000', NULL, NULL, NULL, NULL, NULL, NULL),
(7, 'Electrocardiograma', 350.00, 'Estudio de la actividad eléctrica del corazón', '[\"ecg.jpg\"]', '{\"Lunes\": \"08:00 - 16:00\", \"Martes\": \"08:00 - 16:00\", \"Miercoles\": \"08:00 - 16:00\", \"Jueves\": \"08:00 - 16:00\", \"Viernes\": \"08:00 - 16:00\", \"Sabado\": \"09:00 - 13:00\", \"Domingo\": \"N/A - N/A\"}', 20, 1, '2025-06-19 00:50:16.000000', '2025-06-19 00:50:16.000000', NULL, NULL, NULL, NULL, NULL, NULL),
(8, 'Ultrasonido Abdominal', 900.00, 'Estudio por imágenes del abdomen', '[\"ultrasound.jpg\"]', '{\"Lunes\": \"08:00 - 15:00\", \"Martes\": \"08:00 - 15:00\", \"Miercoles\": \"08:00 - 15:00\", \"Jueves\": \"08:00 - 15:00\", \"Viernes\": \"08:00 - 15:00\", \"Sabado\": \"09:00 - 12:00\", \"Domingo\": \"N/A - N/A\"}', 30, 1, '2025-06-19 00:50:16.000000', '2025-06-19 00:50:16.000000', NULL, NULL, NULL, NULL, NULL, NULL),
(9, 'Consulta Ginecológica', 750.00, 'Revisión ginecológica completa', '[\"gynecology.jpg\"]', '{\"Lunes\": \"09:00 - 16:00\", \"Martes\": \"09:00 - 16:00\", \"Miercoles\": \"09:00 - 16:00\", \"Jueves\": \"09:00 - 16:00\", \"Viernes\": \"09:00 - 16:00\", \"Sabado\": \"09:00 - 13:00\", \"Domingo\": \"N/A - N/A\"}', 45, 1, '2025-06-19 00:50:16.000000', '2025-06-19 00:50:16.000000', NULL, NULL, NULL, NULL, NULL, NULL),
(10, 'Tratamiento de Acné', 950.00, 'Tratamiento especializado para acné', '[\"acne-treatment.jpg\"]', '{\"Lunes\": \"10:00 - 17:00\", \"Martes\": \"10:00 - 17:00\", \"Miercoles\": \"10:00 - 17:00\", \"Jueves\": \"10:00 - 17:00\", \"Viernes\": \"10:00 - 17:00\", \"Sabado\": \"10:00 - 14:00\", \"Domingo\": \"N/A - N/A\"}', 75, 1, '2025-06-19 00:50:16.000000', '2025-06-19 00:50:16.000000', NULL, NULL, NULL, NULL, NULL, NULL),
(11, 'Análisis de Sangre', 400.00, 'Examen de laboratorio básico', '[\"blood-test.jpg\"]', '{\"Lunes\": \"07:00 - 11:00\", \"Martes\": \"07:00 - 11:00\", \"Miercoles\": \"07:00 - 11:00\", \"Jueves\": \"07:00 - 11:00\", \"Viernes\": \"07:00 - 11:00\", \"Sabado\": \"08:00 - 10:00\", \"Domingo\": \"N/A - N/A\"}', 15, 1, '2025-06-19 00:50:16.000000', '2025-06-19 00:50:16.000000', NULL, NULL, NULL, NULL, NULL, NULL),
(12, 'Radiografía', 450.00, 'Estudio radiológico básico', '[\"xray.jpg\"]', '{\"Lunes\": \"08:00 - 16:00\", \"Martes\": \"08:00 - 16:00\", \"Miercoles\": \"08:00 - 16:00\", \"Jueves\": \"08:00 - 16:00\", \"Viernes\": \"08:00 - 16:00\", \"Sabado\": \"09:00 - 13:00\", \"Domingo\": \"N/A - N/A\"}', 25, 1, '2025-06-19 00:50:16.000000', '2025-06-19 00:50:16.000000', NULL, NULL, NULL, NULL, NULL, NULL),
(13, 'Fisioterapia', 600.00, 'Sesión de rehabilitación física', '[\"physiotherapy.jpg\"]', '{\"Lunes\": \"08:00 - 18:00\", \"Martes\": \"08:00 - 18:00\", \"Miercoles\": \"08:00 - 18:00\", \"Jueves\": \"08:00 - 18:00\", \"Viernes\": \"08:00 - 18:00\", \"Sabado\": \"09:00 - 15:00\", \"Domingo\": \"N/A - N/A\"}', 50, 1, '2025-06-19 00:50:16.000000', '2025-06-19 00:50:16.000000', NULL, NULL, NULL, NULL, NULL, NULL),
(14, 'Consulta Pediátrica', 550.00, 'Revisión médica para niños', '[\"pediatrics.jpg\"]', '{\"Lunes\": \"09:00 - 17:00\", \"Martes\": \"09:00 - 17:00\", \"Miercoles\": \"09:00 - 17:00\", \"Jueves\": \"09:00 - 17:00\", \"Viernes\": \"09:00 - 17:00\", \"Sabado\": \"10:00 - 14:00\", \"Domingo\": \"N/A - N/A\"}', 40, 1, '2025-06-19 00:50:16.000000', '2025-06-19 00:50:16.000000', NULL, NULL, NULL, NULL, NULL, NULL),
(15, 'Tratamiento Antienvejecimiento', 1800.00, 'Tratamiento facial rejuvenecedor', '[\"anti-aging.jpg\"]', '{\"Lunes\": \"10:00 - 16:00\", \"Martes\": \"10:00 - 16:00\", \"Miercoles\": \"10:00 - 16:00\", \"Jueves\": \"10:00 - 16:00\", \"Viernes\": \"10:00 - 16:00\", \"Sabado\": \"10:00 - 14:00\", \"Domingo\": \"N/A - N/A\"}', 120, 1, '2025-06-19 00:50:16.000000', '2025-06-19 00:50:16.000000', NULL, NULL, NULL, NULL, NULL, NULL),
(16, 'Vacunación', 300.00, 'Aplicación de vacunas', '[\"vaccination.jpg\"]', '{\"Lunes\": \"08:00 - 16:00\", \"Martes\": \"08:00 - 16:00\", \"Miercoles\": \"08:00 - 16:00\", \"Jueves\": \"08:00 - 16:00\", \"Viernes\": \"08:00 - 16:00\", \"Sabado\": \"09:00 - 13:00\", \"Domingo\": \"N/A - N/A\"}', 10, 1, '2025-06-19 00:50:16.000000', '2025-06-19 00:50:16.000000', NULL, NULL, NULL, NULL, NULL, NULL),
(17, 'Consulta Dermatológica', 700.00, 'Revisión especializada de la piel', '[\"dermatology.jpg\"]', '{\"Lunes\": \"09:00 - 17:00\", \"Martes\": \"09:00 - 17:00\", \"Miercoles\": \"09:00 - 17:00\", \"Jueves\": \"09:00 - 17:00\", \"Viernes\": \"09:00 - 17:00\", \"Sabado\": \"10:00 - 14:00\", \"Domingo\": \"N/A - N/A\"}', 45, 1, '2025-06-19 00:50:16.000000', '2025-06-19 00:50:16.000000', NULL, NULL, NULL, NULL, NULL, NULL),
(18, 'Terapia de Pareja', 1200.00, 'Sesión de terapia psicológica para parejas', '[\"couples-therapy.jpg\"]', '{\"Lunes\": \"16:00 - 20:00\", \"Martes\": \"16:00 - 20:00\", \"Miercoles\": \"16:00 - 20:00\", \"Jueves\": \"16:00 - 20:00\", \"Viernes\": \"16:00 - 20:00\", \"Sabado\": \"10:00 - 16:00\", \"Domingo\": \"N/A - N/A\"}', 80, 1, '2025-06-19 00:50:16.000000', '2025-06-19 00:50:16.000000', NULL, NULL, NULL, NULL, NULL, NULL),
(19, 'Examen de Vista', 400.00, 'Evaluación oftalmológica completa', '[\"eye-exam.jpg\"]', '{\"Lunes\": \"09:00 - 17:00\", \"Martes\": \"09:00 - 17:00\", \"Miercoles\": \"09:00 - 17:00\", \"Jueves\": \"09:00 - 17:00\", \"Viernes\": \"09:00 - 17:00\", \"Sabado\": \"10:00 - 14:00\", \"Domingo\": \"N/A - N/A\"}', 35, 1, '2025-06-19 00:50:16.000000', '2025-06-19 00:50:16.000000', NULL, NULL, NULL, NULL, NULL, NULL),
(20, 'Inyección de Botox', 2500.00, 'Aplicación de toxina botulínica', '[\"botox.jpg\"]', '{\"Lunes\": \"11:00 - 16:00\", \"Martes\": \"11:00 - 16:00\", \"Miercoles\": \"11:00 - 16:00\", \"Jueves\": \"11:00 - 16:00\", \"Viernes\": \"11:00 - 16:00\", \"Sabado\": \"11:00 - 14:00\", \"Domingo\": \"N/A - N/A\"}', 45, 1, '2025-06-19 00:50:16.000000', '2025-06-19 00:50:16.000000', NULL, NULL, NULL, NULL, NULL, NULL),
(21, 'Consulta Urológica', 650.00, 'Revisión especializada del sistema urinario', '[\"urology.jpg\"]', '{\"Lunes\": \"08:00 - 16:00\", \"Martes\": \"08:00 - 16:00\", \"Miercoles\": \"08:00 - 16:00\", \"Jueves\": \"08:00 - 16:00\", \"Viernes\": \"08:00 - 16:00\", \"Sabado\": \"09:00 - 13:00\", \"Domingo\": \"N/A - N/A\"}', 40, 1, '2025-06-19 00:50:16.000000', '2025-06-19 00:50:16.000000', NULL, NULL, NULL, NULL, NULL, NULL),
(22, 'Audiometría', 500.00, 'Evaluación de la capacidad auditiva', '[\"hearing-test.jpg\"]', '{\"Lunes\": \"09:00 - 16:00\", \"Martes\": \"09:00 - 16:00\", \"Miercoles\": \"09:00 - 16:00\", \"Jueves\": \"09:00 - 16:00\", \"Viernes\": \"09:00 - 16:00\", \"Sabado\": \"10:00 - 13:00\", \"Domingo\": \"N/A - N/A\"}', 30, 1, '2025-06-19 00:50:16.000000', '2025-06-19 00:50:16.000000', NULL, NULL, NULL, NULL, NULL, NULL),
(23, 'Masaje Deportivo', 900.00, 'Masaje especializado para deportistas', '[\"sports-massage.jpg\"]', '{\"Lunes\": \"10:00 - 19:00\", \"Martes\": \"10:00 - 19:00\", \"Miercoles\": \"10:00 - 19:00\", \"Jueves\": \"10:00 - 19:00\", \"Viernes\": \"10:00 - 19:00\", \"Sabado\": \"10:00 - 16:00\", \"Domingo\": \"N/A - N/A\"}', 75, 1, '2025-06-19 00:50:16.000000', '2025-06-19 00:50:16.000000', NULL, NULL, NULL, NULL, NULL, NULL),
(24, 'Consulta Cardiológica', 800.00, 'Revisión especializada del corazón', '[\"cardiology.jpg\"]', '{\"Lunes\": \"08:00 - 16:00\", \"Martes\": \"08:00 - 16:00\", \"Miercoles\": \"08:00 - 16:00\", \"Jueves\": \"08:00 - 16:00\", \"Viernes\": \"08:00 - 16:00\", \"Sabado\": \"09:00 - 13:00\", \"Domingo\": \"N/A - N/A\"}', 50, 1, '2025-06-19 00:50:16.000000', '2025-06-19 00:50:16.000000', NULL, NULL, NULL, NULL, NULL, NULL),
(25, 'Peeling Químico', 1100.00, 'Exfoliación química para renovar la piel', '[\"chemical-peel.jpg\"]', '{\"Lunes\": \"10:00 - 17:00\", \"Martes\": \"10:00 - 17:00\", \"Miercoles\": \"10:00 - 17:00\", \"Jueves\": \"10:00 - 17:00\", \"Viernes\": \"10:00 - 17:00\", \"Sabado\": \"10:00 - 14:00\", \"Domingo\": \"N/A - N/A\"}', 90, 1, '2025-06-19 00:50:16.000000', '2025-06-19 00:50:16.000000', NULL, NULL, NULL, NULL, NULL, NULL),
(26, 'Consulta Endocrinológica', 750.00, 'Revisión del sistema endocrino', '[\"endocrinology.jpg\"]', '{\"Lunes\": \"08:00 - 16:00\", \"Martes\": \"08:00 - 16:00\", \"Miercoles\": \"08:00 - 16:00\", \"Jueves\": \"08:00 - 16:00\", \"Viernes\": \"08:00 - 16:00\", \"Sabado\": \"09:00 - 13:00\", \"Domingo\": \"N/A - N/A\"}', 45, 1, '2025-06-19 00:50:16.000000', '2025-06-19 00:50:16.000000', NULL, NULL, NULL, NULL, NULL, NULL),
(27, 'Densitometría Ósea', 850.00, 'Medición de la densidad ósea', '[\"bone-density.jpg\"]', '{\"Lunes\": \"08:00 - 15:00\", \"Martes\": \"08:00 - 15:00\", \"Miercoles\": \"08:00 - 15:00\", \"Jueves\": \"08:00 - 15:00\", \"Viernes\": \"08:00 - 15:00\", \"Sabado\": \"09:00 - 12:00\", \"Domingo\": \"N/A - N/A\"}', 25, 1, '2025-06-19 00:50:16.000000', '2025-06-19 00:50:16.000000', NULL, NULL, NULL, NULL, NULL, NULL),
(28, 'Consulta Neurológica', 900.00, 'Revisión del sistema nervioso', '[\"neurology.jpg\"]', '{\"Lunes\": \"09:00 - 17:00\", \"Martes\": \"09:00 - 17:00\", \"Miercoles\": \"09:00 - 17:00\", \"Jueves\": \"09:00 - 17:00\", \"Viernes\": \"09:00 - 17:00\", \"Sabado\": \"10:00 - 14:00\", \"Domingo\": \"N/A - N/A\"}', 55, 1, '2025-06-19 00:50:16.000000', '2025-06-19 00:50:16.000000', NULL, NULL, NULL, NULL, NULL, NULL),
(29, 'Mesoterapia', 1500.00, 'Tratamiento de rejuvenecimiento con microinyecciones', '[\"mesotherapy.jpg\"]', '{\"Lunes\": \"10:00 - 17:00\", \"Martes\": \"10:00 - 17:00\", \"Miercoles\": \"10:00 - 17:00\", \"Jueves\": \"10:00 - 17:00\", \"Viernes\": \"10:00 - 17:00\", \"Sabado\": \"10:00 - 14:00\", \"Domingo\": \"N/A - N/A\"}', 60, 1, '2025-06-19 00:50:16.000000', '2025-06-19 00:50:16.000000', NULL, NULL, NULL, NULL, NULL, NULL),
(30, 'Consulta Psiquiátrica', 1000.00, 'Evaluación y tratamiento de salud mental', '[\"psychiatry.jpg\"]', '{\"Lunes\": \"09:00 - 17:00\", \"Martes\": \"09:00 - 17:00\", \"Miercoles\": \"09:00 - 17:00\", \"Jueves\": \"09:00 - 17:00\", \"Viernes\": \"09:00 - 17:00\", \"Sabado\": \"10:00 - 14:00\", \"Domingo\": \"N/A - N/A\"}', 60, 1, '2025-06-19 00:50:16.000000', '2025-06-19 00:50:16.000000', NULL, NULL, NULL, NULL, NULL, NULL),
(31, 'Colposcopia', 800.00, 'Examen ginecológico especializado', '[\"colposcopy.jpg\"]', '{\"Lunes\": \"09:00 - 16:00\", \"Martes\": \"09:00 - 16:00\", \"Miercoles\": \"09:00 - 16:00\", \"Jueves\": \"09:00 - 16:00\", \"Viernes\": \"09:00 - 16:00\", \"Sabado\": \"09:00 - 13:00\", \"Domingo\": \"N/A - N/A\"}', 30, 1, '2025-06-19 00:50:16.000000', '2025-06-19 00:50:16.000000', NULL, NULL, NULL, NULL, NULL, NULL),
(32, 'Espirometría', 450.00, 'Evaluación de la función pulmonar', '[\"spirometry.jpg\"]', '{\"Lunes\": \"08:00 - 16:00\", \"Martes\": \"08:00 - 16:00\", \"Miercoles\": \"08:00 - 16:00\", \"Jueves\": \"08:00 - 16:00\", \"Viernes\": \"08:00 - 16:00\", \"Sabado\": \"09:00 - 13:00\", \"Domingo\": \"N/A - N/A\"}', 20, 1, '2025-06-19 00:50:16.000000', '2025-06-19 00:50:16.000000', NULL, NULL, NULL, NULL, NULL, NULL),
(33, 'Hidratación Facial', 650.00, 'Tratamiento hidratante profundo', '[\"facial-hydration.jpg\"]', '{\"Lunes\": \"09:00 - 17:00\", \"Martes\": \"09:00 - 17:00\", \"Miercoles\": \"09:00 - 17:00\", \"Jueves\": \"09:00 - 17:00\", \"Viernes\": \"09:00 - 17:00\", \"Sabado\": \"10:00 - 14:00\", \"Domingo\": \"N/A - N/A\"}', 45, 1, '2025-06-19 00:50:16.000000', '2025-06-19 00:50:16.000000', NULL, NULL, NULL, NULL, NULL, NULL),
(34, 'Consulta Reumatológica', 750.00, 'Revisión de enfermedades reumáticas', '[\"rheumatology.jpg\"]', '{\"Lunes\": \"08:00 - 16:00\", \"Martes\": \"08:00 - 16:00\", \"Miercoles\": \"08:00 - 16:00\", \"Jueves\": \"08:00 - 16:00\", \"Viernes\": \"08:00 - 16:00\", \"Sabado\": \"09:00 - 13:00\", \"Domingo\": \"N/A - N/A\"}', 45, 1, '2025-06-19 00:50:16.000000', '2025-06-19 00:50:16.000000', NULL, NULL, NULL, NULL, NULL, NULL),
(35, 'Ultrasonido Obstétrico', 950.00, 'Monitoreo del embarazo', '[\"obstetric-ultrasound.jpg\"]', '{\"Lunes\": \"08:00 - 16:00\", \"Martes\": \"08:00 - 16:00\", \"Miercoles\": \"08:00 - 16:00\", \"Jueves\": \"08:00 - 16:00\", \"Viernes\": \"08:00 - 16:00\", \"Sabado\": \"09:00 - 13:00\", \"Domingo\": \"N/A - N/A\"}', 35, 1, '2025-06-19 00:50:16.000000', '2025-06-19 00:50:16.000000', NULL, NULL, NULL, NULL, NULL, NULL),
(36, 'Terapia Ocupacional', 700.00, 'Rehabilitación de actividades diarias', '[\"occupational-therapy.jpg\"]', '{\"Lunes\": \"08:00 - 17:00\", \"Martes\": \"08:00 - 17:00\", \"Miercoles\": \"08:00 - 17:00\", \"Jueves\": \"08:00 - 17:00\", \"Viernes\": \"08:00 - 17:00\", \"Sabado\": \"09:00 - 14:00\", \"Domingo\": \"N/A - N/A\"}', 60, 1, '2025-06-19 00:50:16.000000', '2025-06-19 00:50:16.000000', NULL, NULL, NULL, NULL, NULL, NULL),
(37, 'Consulta Gastroenterológica', 800.00, 'Revisión del sistema digestivo', '[\"gastroenterology.jpg\"]', '{\"Lunes\": \"08:00 - 16:00\", \"Martes\": \"08:00 - 16:00\", \"Miercoles\": \"08:00 - 16:00\", \"Jueves\": \"08:00 - 16:00\", \"Viernes\": \"08:00 - 16:00\", \"Sabado\": \"09:00 - 13:00\", \"Domingo\": \"N/A - N/A\"}', 50, 1, '2025-06-19 00:50:16.000000', '2025-06-19 00:50:16.000000', NULL, NULL, NULL, NULL, NULL, NULL),
(38, 'Radiofrecuencia', 1300.00, 'Tratamiento de tensado de piel', '[\"radiofrequency.jpg\"]', '{\"Lunes\": \"10:00 - 17:00\", \"Martes\": \"10:00 - 17:00\", \"Miercoles\": \"10:00 - 17:00\", \"Jueves\": \"10:00 - 17:00\", \"Viernes\": \"10:00 - 17:00\", \"Sabado\": \"10:00 - 14:00\", \"Domingo\": \"N/A - N/A\"}', 90, 1, '2025-06-19 00:50:16.000000', '2025-06-19 00:50:16.000000', NULL, NULL, NULL, NULL, NULL, NULL),
(39, 'Consulta Traumatológica', 700.00, 'Revisión de huesos y articulaciones', '[\"traumatology.jpg\"]', '{\"Lunes\": \"08:00 - 17:00\", \"Martes\": \"08:00 - 17:00\", \"Miercoles\": \"08:00 - 17:00\", \"Jueves\": \"08:00 - 17:00\", \"Viernes\": \"08:00 - 17:00\", \"Sabado\": \"09:00 - 14:00\", \"Domingo\": \"N/A - N/A\"}', 40, 1, '2025-06-19 00:50:16.000000', '2025-06-19 00:50:16.000000', NULL, NULL, NULL, NULL, NULL, NULL),
(40, 'Prueba de Esfuerzo', 1200.00, 'Evaluación cardiaca durante ejercicio', '[\"stress-test.jpg\"]', '{\"Lunes\": \"08:00 - 15:00\", \"Martes\": \"08:00 - 15:00\", \"Miercoles\": \"08:00 - 15:00\", \"Jueves\": \"08:00 - 15:00\", \"Viernes\": \"08:00 - 15:00\", \"Sabado\": \"09:00 - 12:00\", \"Domingo\": \"N/A - N/A\"}', 45, 1, '2025-06-19 00:50:16.000000', '2025-06-19 00:50:16.000000', NULL, NULL, NULL, NULL, NULL, NULL),
(41, 'Crioterapia', 900.00, 'Tratamiento con frío terapéutico', '[\"cryotherapy.jpg\"]', '{\"Lunes\": \"10:00 - 17:00\", \"Martes\": \"10:00 - 17:00\", \"Miercoles\": \"10:00 - 17:00\", \"Jueves\": \"10:00 - 17:00\", \"Viernes\": \"10:00 - 17:00\", \"Sabado\": \"10:00 - 14:00\", \"Domingo\": \"N/A - N/A\"}', 30, 1, '2025-06-19 00:50:16.000000', '2025-06-19 00:50:16.000000', NULL, NULL, NULL, NULL, NULL, NULL),
(42, 'Consulta Oncológica', 1200.00, 'Evaluación y seguimiento oncológico', '[\"oncology.jpg\"]', '{\"Lunes\": \"09:00 - 17:00\", \"Martes\": \"09:00 - 17:00\", \"Miercoles\": \"09:00 - 17:00\", \"Jueves\": \"09:00 - 17:00\", \"Viernes\": \"09:00 - 17:00\", \"Sabado\": \"10:00 - 14:00\", \"Domingo\": \"N/A - N/A\"}', 60, 1, '2025-06-19 00:50:16.000000', '2025-06-19 00:50:16.000000', NULL, NULL, NULL, NULL, NULL, NULL),
(43, 'Mamografía', 800.00, 'Estudio radiológico de mama', '[\"mammography.jpg\"]', '{\"Lunes\": \"08:00 - 16:00\", \"Martes\": \"08:00 - 16:00\", \"Miercoles\": \"08:00 - 16:00\", \"Jueves\": \"08:00 - 16:00\", \"Viernes\": \"08:00 - 16:00\", \"Sabado\": \"09:00 - 13:00\", \"Domingo\": \"N/A - N/A\"}', 20, 1, '2025-06-19 00:50:16.000000', '2025-06-19 00:50:16.000000', NULL, NULL, NULL, NULL, NULL, NULL),
(44, 'Drenaje Linfático', 950.00, 'Masaje especializado para sistema linfático', '[\"lymphatic-drainage.jpg\"]', '{\"Lunes\": \"09:00 - 18:00\", \"Martes\": \"09:00 - 18:00\", \"Miercoles\": \"09:00 - 18:00\", \"Jueves\": \"09:00 - 18:00\", \"Viernes\": \"09:00 - 18:00\", \"Sabado\": \"10:00 - 15:00\", \"Domingo\": \"N/A - N/A\"}', 75, 1, '2025-06-19 00:50:16.000000', '2025-06-19 00:50:16.000000', NULL, NULL, NULL, NULL, NULL, NULL),
(45, 'Consulta Nefrológica', 850.00, 'Revisión especializada de riñones', '[\"nephrology.jpg\"]', '{\"Lunes\": \"08:00 - 16:00\", \"Martes\": \"08:00 - 16:00\", \"Miercoles\": \"08:00 - 16:00\", \"Jueves\": \"08:00 - 16:00\", \"Viernes\": \"08:00 - 16:00\", \"Sabado\": \"09:00 - 13:00\", \"Domingo\": \"N/A - N/A\"}', 45, 1, '2025-06-19 00:50:16.000000', '2025-06-19 00:50:16.000000', NULL, NULL, NULL, NULL, NULL, NULL),
(46, 'Electroencefalograma', 750.00, 'Estudio de la actividad cerebral', '[\"eeg.jpg\"]', '{\"Lunes\": \"08:00 - 16:00\", \"Martes\": \"08:00 - 16:00\", \"Miercoles\": \"08:00 - 16:00\", \"Jueves\": \"08:00 - 16:00\", \"Viernes\": \"08:00 - 16:00\", \"Sabado\": \"09:00 - 13:00\", \"Domingo\": \"N/A - N/A\"}', 40, 1, '2025-06-19 00:50:16.000000', '2025-06-19 00:50:16.000000', NULL, NULL, NULL, NULL, NULL, NULL),
(47, 'Micropigmentación', 2200.00, 'Tatuaje cosmético de cejas o labios', '[\"micropigmentation.jpg\"]', '{\"Lunes\": \"10:00 - 16:00\", \"Martes\": \"10:00 - 16:00\", \"Miercoles\": \"10:00 - 16:00\", \"Jueves\": \"10:00 - 16:00\", \"Viernes\": \"10:00 - 16:00\", \"Sabado\": \"10:00 - 14:00\", \"Domingo\": \"N/A - N/A\"}', 180, 1, '2025-06-19 00:50:16.000000', '2025-06-19 00:50:16.000000', NULL, NULL, NULL, NULL, NULL, NULL),
(48, 'Consulta Hematológica', 900.00, 'Revisión de enfermedades de la sangre', '[\"hematology.jpg\"]', '{\"Lunes\": \"08:00 - 16:00\", \"Martes\": \"08:00 - 16:00\", \"Miercoles\": \"08:00 - 16:00\", \"Jueves\": \"08:00 - 16:00\", \"Viernes\": \"08:00 - 16:00\", \"Sabado\": \"09:00 - 13:00\", \"Domingo\": \"N/A - N/A\"}', 50, 1, '2025-06-19 00:50:16.000000', '2025-06-19 00:50:16.000000', NULL, NULL, NULL, NULL, NULL, NULL),
(49, 'Cavitación', 1100.00, 'Tratamiento de reducción de grasa corporal', '[\"cavitation.jpg\"]', '{\"Lunes\": \"10:00 - 18:00\", \"Martes\": \"10:00 - 18:00\", \"Miercoles\": \"10:00 - 18:00\", \"Jueves\": \"10:00 - 18:00\", \"Viernes\": \"10:00 - 18:00\", \"Sabado\": \"10:00 - 15:00\", \"Domingo\": \"N/A - N/A\"}', 60, 1, '2025-06-19 00:50:16.000000', '2025-06-19 00:50:16.000000', NULL, NULL, NULL, NULL, NULL, NULL),
(50, 'Consulta Geriátrica', 650.00, 'Atención médica especializada para adultos mayores', '[\"geriatrics.jpg\"]', '{\"Lunes\": \"08:00 - 16:00\", \"Martes\": \"08:00 - 16:00\", \"Miercoles\": \"08:00 - 16:00\", \"Jueves\": \"08:00 - 16:00\", \"Viernes\": \"08:00 - 16:00\", \"Sabado\": \"09:00 - 13:00\", \"Domingo\": \"N/A - N/A\"}', 50, 1, '2025-06-19 00:50:16.000000', '2025-06-19 00:50:16.000000', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `UserId` int(11) NOT NULL,
  `UserName` varchar(75) NOT NULL,
  `UserLastName` varchar(70) NOT NULL,
  `UserEmail` varchar(255) DEFAULT NULL,
  `UserPassword` varchar(255) NOT NULL DEFAULT '12345678',
  `UserImage` varchar(255) DEFAULT NULL,
  `UserPhone` varchar(255) DEFAULT NULL,
  `UserBirthDate` date DEFAULT NULL,
  `UserGender` varchar(30) DEFAULT NULL,
  `UserInsuranceCard` varchar(50) DEFAULT NULL,
  `UserPatientStatus` enum('Activo','Inactivo') NOT NULL DEFAULT 'Activo',
  `UserNotes` varchar(255) DEFAULT NULL,
  `UserCode` varchar(50) NOT NULL DEFAULT 'AAAA1111',
  `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`UserId`, `UserName`, `UserLastName`, `UserEmail`, `UserPassword`, `UserImage`, `UserPhone`, `UserBirthDate`, `UserGender`, `UserInsuranceCard`, `UserPatientStatus`, `UserNotes`, `UserCode`, `createdAt`, `updatedAt`) VALUES
(11, 'carlita estrella', 'cruz dominguez', 'carlita@email.com', 'cagada', '', '+528994585918', '2003-10-22', 'Masculino', '', 'Activo', '', 'CECD11', '2025-06-25 21:32:02.535375', '2025-06-25 21:32:02.540393'),
(12, 'Orlando', 'Martinez', 'mod_s@gmail.com', 'hola', '', '+528992362676', '2002-01-31', 'Masculino', '', 'Activo', '', 'AMGF12', '2025-06-25 21:32:02.535375', '2025-06-25 21:32:02.540393'),
(19, 'Angel Josue', 'Martinez', 'ho@gmail.com', '12345678', NULL, '+528993456788', '2003-01-07', 'Masculino', NULL, 'Activo', NULL, 'HS19', '2025-06-25 21:32:02.535375', '2025-06-25 21:32:02.540393'),
(23, 'Cliente', 'Prueba', 'cliente.prueba@gmail.com', '12345678', NULL, '+528994585911', NULL, NULL, NULL, 'Activo', NULL, 'CP23', '2025-06-25 21:32:02.535375', '2025-06-25 21:32:02.540393'),
(24, 'Cliente', 'Uno', 'cliente.uno@gmail.com', '12345678', NULL, '+528991234567', NULL, NULL, NULL, 'Activo', NULL, 'CU24', '2025-06-25 21:32:02.535375', '2025-06-25 21:32:02.540393'),
(25, 'Cliente', 'Dos', 'cliente.dos@gmail.com', '12345678', NULL, '+528991234567', NULL, NULL, NULL, 'Activo', NULL, 'CD25', '2025-06-25 21:32:02.535375', '2025-06-25 21:32:02.540393'),
(26, 'Cliente', 'Tres', 'cliente.tres@gmail.com', '12345678', NULL, '+528991234567', NULL, NULL, NULL, 'Activo', NULL, 'CT26', '2025-06-25 21:32:02.535375', '2025-06-25 21:32:02.540393'),
(27, 'Cliente', 'Cuatro', 'cliente.cuatro@gmail.com', '12345678', NULL, '+528991234567', NULL, NULL, NULL, 'Activo', NULL, 'CC27', '2025-06-25 21:32:02.535375', '2025-06-25 21:32:02.540393'),
(28, 'Cliente ', 'Cinco', 'cliente.cinco@gmail.com', '12345678', NULL, '+528991234567', NULL, NULL, NULL, 'Activo', NULL, 'CC28', '2025-06-25 21:32:02.535375', '2025-06-25 21:32:02.540393'),
(29, 'Cliente ', 'Seis', 'cliente.seis@gmail.com', '12345678', NULL, '+528991234567', NULL, NULL, NULL, 'Activo', NULL, 'CS29', '2025-06-25 21:32:02.535375', '2025-06-25 21:32:02.540393'),
(30, 'Cliente', 'Siete', 'cliente.siete@gmail.com', '12345678', NULL, '+528991234567', NULL, NULL, NULL, 'Activo', NULL, 'CS30', '2025-06-25 21:32:02.535375', '2025-06-25 21:32:02.540393'),
(31, 'Cliente ', 'Ocho', 'cliente.ocho@gmail.com', '12345678', NULL, '+528991234567', NULL, NULL, NULL, 'Activo', NULL, 'CO31', '2025-06-25 21:32:02.535375', '2025-06-25 21:32:02.540393'),
(32, 'Cliente', 'Nueve', 'cliente.nueve@gmail.com', '12345678', NULL, '+528991234567', NULL, NULL, NULL, 'Activo', NULL, 'CN32', '2025-06-25 21:32:02.535375', '2025-06-25 21:32:02.540393'),
(33, 'Cliente', 'Diez', 'cliente.diez@gmail.com', '12345678', NULL, '+528991234567', NULL, NULL, NULL, 'Activo', NULL, 'CD33', '2025-06-25 21:32:02.535375', '2025-06-25 21:32:02.540393'),
(34, 'test', '1', 'test@gmail.com', '12345678', NULL, '+528994121828', NULL, NULL, NULL, 'Activo', NULL, 'T134', '2025-06-25 21:32:02.535375', '2025-06-25 21:32:02.540393'),
(35, 'Angel', 'Leija', 'angelgaelleija2@gmail.com', '12345678', NULL, NULL, NULL, NULL, NULL, 'Activo', NULL, 'AL35', '2025-06-30 21:58:33.146729', '2025-06-30 21:58:33.000000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_memberships`
--

CREATE TABLE `user_memberships` (
  `id` int(11) NOT NULL,
  `expirationDate` date NOT NULL,
  `UserId` int(11) DEFAULT NULL,
  `MembershipId` int(11) DEFAULT NULL,
  `createdAt` date NOT NULL,
  `duration` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_ventas`
--

CREATE TABLE `usuarios_ventas` (
  `UserId` int(11) NOT NULL,
  `VentaId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `VentaId` int(11) NOT NULL,
  `fechaVenta` timestamp NOT NULL DEFAULT current_timestamp(),
  `ingresoNeto` decimal(10,2) NOT NULL,
  `tipoCambio` enum('MXN','USD') NOT NULL DEFAULT 'MXN',
  `estatus` enum('pagado','no pagado','cancelado','pendiente') NOT NULL DEFAULT 'no pagado',
  `totalCobrado` decimal(10,2) NOT NULL,
  `RealizoVenta` varchar(255) DEFAULT NULL,
  `AtendioVenta` varchar(255) DEFAULT NULL,
  `descuento` int(11) NOT NULL DEFAULT 0,
  `fechaProximoAbono` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas_membresias`
--

CREATE TABLE `ventas_membresias` (
  `VentaId` int(11) NOT NULL,
  `MembershipId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas_servicios`
--

CREATE TABLE `ventas_servicios` (
  `VentaId` int(11) NOT NULL,
  `ServiceId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`ApptId`),
  ADD KEY `FK_b6d85cdc70c5d630baa28d48ed8` (`EmpleadoId`),
  ADD KEY `FK_c2bb096decd268587deafbcd60e` (`UserId`),
  ADD KEY `FK_b1c171f270cd6cf07d297d72bf5` (`ServiceId`);

--
-- Indices de la tabla `campaign`
--
ALTER TABLE `campaign`
  ADD PRIMARY KEY (`CampaignId`);

--
-- Indices de la tabla `campaign_users`
--
ALTER TABLE `campaign_users`
  ADD PRIMARY KEY (`CampaignId`,`UserId`),
  ADD KEY `IDX_791c82542ec38b887d954548a4` (`CampaignId`),
  ADD KEY `IDX_15577b32b97f7542ff21767733` (`UserId`);

--
-- Indices de la tabla `document`
--
ALTER TABLE `document`
  ADD PRIMARY KEY (`documentId`),
  ADD KEY `FK_b074357995b05bf49a5e1f63e2e` (`userUserId`);

--
-- Indices de la tabla `email`
--
ALTER TABLE `email`
  ADD PRIMARY KEY (`EmailId`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`EmpleadoId`),
  ADD UNIQUE KEY `IDX_329d387f9b7df7c209906aa8e9` (`EmpleadoEmail`),
  ADD KEY `FK_ac7b43e3341b282252f54ac12cb` (`RoleId`);

--
-- Indices de la tabla `episodios`
--
ALTER TABLE `episodios`
  ADD PRIMARY KEY (`episodioId`),
  ADD KEY `FK_25be8c376dd8cbd32633c2d1658` (`userUserId`),
  ADD KEY `FK_d197e728133429aa098689ab1ff` (`empleadoAutorId`),
  ADD KEY `FK_5f568cfe8fd0bbd5289cbda6a88` (`empleadoServicioId`);

--
-- Indices de la tabla `ficha`
--
ALTER TABLE `ficha`
  ADD PRIMARY KEY (`FichaId`),
  ADD UNIQUE KEY `REL_95302d3e2d697639b68a2d9bcb` (`AppointmentId`),
  ADD KEY `FK_2e4eb33d30e5819c8b6241da8ff` (`UserId`);

--
-- Indices de la tabla `membership`
--
ALTER TABLE `membership`
  ADD PRIMARY KEY (`MembershipId`);

--
-- Indices de la tabla `memberships_services`
--
ALTER TABLE `memberships_services`
  ADD PRIMARY KEY (`MembershipId`,`ServiceId`),
  ADD KEY `IDX_fce1f311d9895a252aad16a198` (`MembershipId`),
  ADD KEY `IDX_1969fe2237d582786c1238ba2e` (`ServiceId`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`id_pago`),
  ADD UNIQUE KEY `REL_df5750864f23bad56eb0f72c5d` (`id_cita`);

--
-- Indices de la tabla `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`PaymentId`),
  ADD KEY `FK_423548cacba72252d92456f98a9` (`VentaId`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`ProductId`);

--
-- Indices de la tabla `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`RoleId`),
  ADD UNIQUE KEY `IDX_bc14e0fc8461a5ebcfd0456ec5` (`RoleName`);

--
-- Indices de la tabla `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`ServiceId`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserId`);

--
-- Indices de la tabla `user_memberships`
--
ALTER TABLE `user_memberships`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_866e94b6f1fe120ad6cc0719e79` (`UserId`),
  ADD KEY `FK_3325a8d7fb6076ca05aa32eaf5d` (`MembershipId`);

--
-- Indices de la tabla `usuarios_ventas`
--
ALTER TABLE `usuarios_ventas`
  ADD PRIMARY KEY (`UserId`,`VentaId`),
  ADD KEY `IDX_9bd788d8f04f258244a85abada` (`UserId`),
  ADD KEY `IDX_8753006ddc0045d91c540c0585` (`VentaId`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`VentaId`);

--
-- Indices de la tabla `ventas_membresias`
--
ALTER TABLE `ventas_membresias`
  ADD PRIMARY KEY (`VentaId`,`MembershipId`),
  ADD KEY `IDX_43063571ddeae8bc01b0bdd2ec` (`VentaId`),
  ADD KEY `IDX_440483dcdfa607a5a914ec1126` (`MembershipId`);

--
-- Indices de la tabla `ventas_servicios`
--
ALTER TABLE `ventas_servicios`
  ADD PRIMARY KEY (`VentaId`,`ServiceId`),
  ADD KEY `IDX_c02d0202663045bdc9e609093e` (`VentaId`),
  ADD KEY `IDX_4bc5d9820ad9967bc46406c7a4` (`ServiceId`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `appointment`
--
ALTER TABLE `appointment`
  MODIFY `ApptId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `campaign`
--
ALTER TABLE `campaign`
  MODIFY `CampaignId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `document`
--
ALTER TABLE `document`
  MODIFY `documentId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de la tabla `email`
--
ALTER TABLE `email`
  MODIFY `EmailId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `EmpleadoId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT de la tabla `episodios`
--
ALTER TABLE `episodios`
  MODIFY `episodioId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `ficha`
--
ALTER TABLE `ficha`
  MODIFY `FichaId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `membership`
--
ALTER TABLE `membership`
  MODIFY `MembershipId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `id_pago` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `payments`
--
ALTER TABLE `payments`
  MODIFY `PaymentId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `ProductId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `role`
--
ALTER TABLE `role`
  MODIFY `RoleId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `service`
--
ALTER TABLE `service`
  MODIFY `ServiceId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `UserId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `user_memberships`
--
ALTER TABLE `user_memberships`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `VentaId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `FK_b1c171f270cd6cf07d297d72bf5` FOREIGN KEY (`ServiceId`) REFERENCES `service` (`ServiceId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_b6d85cdc70c5d630baa28d48ed8` FOREIGN KEY (`EmpleadoId`) REFERENCES `empleado` (`EmpleadoId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_c2bb096decd268587deafbcd60e` FOREIGN KEY (`UserId`) REFERENCES `user` (`UserId`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `campaign_users`
--
ALTER TABLE `campaign_users`
  ADD CONSTRAINT `FK_15577b32b97f7542ff217677330` FOREIGN KEY (`UserId`) REFERENCES `user` (`UserId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_791c82542ec38b887d954548a42` FOREIGN KEY (`CampaignId`) REFERENCES `campaign` (`CampaignId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `document`
--
ALTER TABLE `document`
  ADD CONSTRAINT `FK_b074357995b05bf49a5e1f63e2e` FOREIGN KEY (`userUserId`) REFERENCES `user` (`UserId`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `FK_ac7b43e3341b282252f54ac12cb` FOREIGN KEY (`RoleId`) REFERENCES `role` (`RoleId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `episodios`
--
ALTER TABLE `episodios`
  ADD CONSTRAINT `FK_25be8c376dd8cbd32633c2d1658` FOREIGN KEY (`userUserId`) REFERENCES `user` (`UserId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_5f568cfe8fd0bbd5289cbda6a88` FOREIGN KEY (`empleadoServicioId`) REFERENCES `empleado` (`EmpleadoId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_d197e728133429aa098689ab1ff` FOREIGN KEY (`empleadoAutorId`) REFERENCES `empleado` (`EmpleadoId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ficha`
--
ALTER TABLE `ficha`
  ADD CONSTRAINT `FK_2e4eb33d30e5819c8b6241da8ff` FOREIGN KEY (`UserId`) REFERENCES `user` (`UserId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_95302d3e2d697639b68a2d9bcb3` FOREIGN KEY (`AppointmentId`) REFERENCES `appointment` (`ApptId`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `memberships_services`
--
ALTER TABLE `memberships_services`
  ADD CONSTRAINT `FK_1969fe2237d582786c1238ba2ea` FOREIGN KEY (`ServiceId`) REFERENCES `service` (`ServiceId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_fce1f311d9895a252aad16a1981` FOREIGN KEY (`MembershipId`) REFERENCES `membership` (`MembershipId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `FK_df5750864f23bad56eb0f72c5db` FOREIGN KEY (`id_cita`) REFERENCES `appointment` (`ApptId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `FK_423548cacba72252d92456f98a9` FOREIGN KEY (`VentaId`) REFERENCES `ventas` (`VentaId`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `user_memberships`
--
ALTER TABLE `user_memberships`
  ADD CONSTRAINT `FK_3325a8d7fb6076ca05aa32eaf5d` FOREIGN KEY (`MembershipId`) REFERENCES `membership` (`MembershipId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_866e94b6f1fe120ad6cc0719e79` FOREIGN KEY (`UserId`) REFERENCES `user` (`UserId`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuarios_ventas`
--
ALTER TABLE `usuarios_ventas`
  ADD CONSTRAINT `FK_8753006ddc0045d91c540c05856` FOREIGN KEY (`VentaId`) REFERENCES `ventas` (`VentaId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_9bd788d8f04f258244a85abada9` FOREIGN KEY (`UserId`) REFERENCES `user` (`UserId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `ventas_membresias`
--
ALTER TABLE `ventas_membresias`
  ADD CONSTRAINT `FK_43063571ddeae8bc01b0bdd2ec8` FOREIGN KEY (`VentaId`) REFERENCES `ventas` (`VentaId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_440483dcdfa607a5a914ec11263` FOREIGN KEY (`MembershipId`) REFERENCES `membership` (`MembershipId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `ventas_servicios`
--
ALTER TABLE `ventas_servicios`
  ADD CONSTRAINT `FK_4bc5d9820ad9967bc46406c7a48` FOREIGN KEY (`ServiceId`) REFERENCES `service` (`ServiceId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_c02d0202663045bdc9e609093e4` FOREIGN KEY (`VentaId`) REFERENCES `ventas` (`VentaId`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Base de datos: `ecommerce_db`
--
CREATE DATABASE IF NOT EXISTS `ecommerce_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ecommerce_db`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `name` varchar(75) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`category_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Perfumes', '2023-12-05 02:32:07', '2023-12-05 02:32:07'),
(2, 'Relojes', '2023-12-11 04:44:54', '2023-12-11 04:44:54');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `images`
--

CREATE TABLE `images` (
  `image_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `images`
--

INSERT INTO `images` (`image_id`, `product_id`, `name`, `created_at`) VALUES
(1, 7, 'botella-perfume.png', '2023-12-26 20:57:32'),
(2, 8, 'botella-perfume.png', '2023-12-26 20:57:32'),
(3, 10, 'botella-perfume.png', '2023-12-26 20:58:45'),
(4, 9, 'reloj.png', '2023-12-26 20:59:50'),
(5, 11, 'reloj.png', '2023-12-27 19:18:28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders`
--

CREATE TABLE `orders` (
  `order_id` binary(16) NOT NULL,
  `user_id` binary(16) NOT NULL,
  `transaction_record_id` binary(16) NOT NULL,
  `status` varchar(50) NOT NULL,
  `total` double NOT NULL,
  `delivery_type` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `transaction_record_id`, `status`, `total`, `delivery_type`, `created_at`, `updated_at`) VALUES
(0x451a07307c864fd49208085624b35772, 0x32659430000000000000000000000000, 0x10573999b1dc4d92a9810d64e31bb69c, 'approved', 660, 'store', '2024-01-09 20:36:23', NULL),
(0x6f78973d1462442fb956edf71c53ad68, 0x32659430000000000000000000000000, 0xa4e8d08e8f294a359183ff91b1e6b0bb, 'approved', 1010, 'store', '2024-01-09 20:42:04', NULL),
(0x753a25dbdb7349edacb47e8ebb9827c3, 0x32659430000000000000000000000000, 0xc52c9ff4a1c844eba90cccd0ca833063, 'approved', 1010, 'store', '2024-01-09 20:46:58', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders_details`
--

CREATE TABLE `orders_details` (
  `order_details_id` binary(16) NOT NULL,
  `order_id` binary(16) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `orders_details`
--

INSERT INTO `orders_details` (`order_details_id`, `order_id`, `product_id`, `quantity`, `created_at`) VALUES
(0x25c23725de2440b4b415e062a71762cf, 0x6f78973d1462442fb956edf71c53ad68, 11, 1, '2024-01-09 20:42:04'),
(0x2a8925c913dc40a5a5a7e90663f346b2, 0x753a25dbdb7349edacb47e8ebb9827c3, 11, 1, '2024-01-09 20:46:58'),
(0x2c8acdb838804a158526dc2dc08aabb1, 0x451a07307c864fd49208085624b35772, 8, 2, '2024-01-09 20:36:23'),
(0x2fbdb410e86a4c87af55afb50d75ae2f, 0x451a07307c864fd49208085624b35772, 9, 1, '2024-01-09 20:36:23'),
(0x42262f3f41af4ff499a3c0aa91cf4438, 0x753a25dbdb7349edacb47e8ebb9827c3, 8, 2, '2024-01-09 20:46:58'),
(0xdce412dd841f48ecbc0e66ee6fa3e610, 0x6f78973d1462442fb956edf71c53ad68, 9, 1, '2024-01-09 20:42:04'),
(0xe084988aa7c940faa8b52f84f4650b52, 0x753a25dbdb7349edacb47e8ebb9827c3, 9, 1, '2024-01-09 20:46:58'),
(0xf114f4ffe23e45bab593cb116473631e, 0x6f78973d1462442fb956edf71c53ad68, 8, 2, '2024-01-09 20:42:04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(75) NOT NULL,
  `description` varchar(255) NOT NULL,
  `cost` double NOT NULL,
  `discount` int(11) DEFAULT NULL,
  `stock` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`product_id`, `category_id`, `name`, `description`, `cost`, `discount`, `stock`, `created_at`, `updated_at`) VALUES
(7, 1, 'Perfume 1', 'Descripcion de perfume 1', 200, NULL, 10, '2023-12-27 03:54:37', '0000-00-00 00:00:00'),
(8, 1, 'Perfume 2', 'Descripcion perfume 2', 180, NULL, 2, '2023-12-27 03:55:00', '0000-00-00 00:00:00'),
(9, 2, 'Reloj 1', 'Descripcion reloj 1', 300, NULL, 12, '2023-12-27 03:55:24', '0000-00-00 00:00:00'),
(10, 1, 'Perfume 3', 'Descripcion perfume 3', 300, 10, 6, '2023-12-27 03:55:50', '0000-00-00 00:00:00'),
(11, 2, 'Reloj 2', 'Descripcion reloj 2', 350, NULL, 8, '2023-12-27 03:55:24', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transactions`
--

CREATE TABLE `transactions` (
  `transaction_record_id` binary(16) NOT NULL,
  `transaction_id` varchar(50) NOT NULL,
  `payment_method` varchar(15) NOT NULL,
  `details_payment_method` varchar(50) NOT NULL,
  `total_paid_amount` int(11) NOT NULL,
  `currency` varchar(10) NOT NULL,
  `email` varchar(255) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `ip_address` varchar(15) DEFAULT NULL,
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `transactions`
--

INSERT INTO `transactions` (`transaction_record_id`, `transaction_id`, `payment_method`, `details_payment_method`, `total_paid_amount`, `currency`, `email`, `fullname`, `ip_address`, `date_created`) VALUES
(0x10573999b1dc4d92a9810d64e31bb69c, '14813373950', 'mercadopago', 'account_money', 660, 'MXN', 'test_user_80507629@testuser.com', 'n/a', '201.174.110.58', '2024-01-09 22:36:22'),
(0xa4e8d08e8f294a359183ff91b1e6b0bb, '14808829017', 'mercadopago', 'account_money', 1010, 'MXN', 'test_user_80507629@testuser.com', 'n/a', '201.174.110.58', '2024-01-09 22:42:02'),
(0xc52c9ff4a1c844eba90cccd0ca833063, '14813553462', 'mercadopago', 'account_money', 1010, 'MXN', 'test_user_80507629@testuser.com', 'n/a', '201.174.110.58', '2024-01-09 22:46:57');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `user_id` binary(16) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`user_id`, `fullname`, `email`, `password`) VALUES
(0x6d0026dba52211eebbe17c8ae1ba21d6, 'User 2', 'user2@gmail.com', '$2a$12$vuE4sjoFswrWiNFKARDSou5ELrV9XjsbDHhqe5.0XWtfIALmtYocO'),
(0x89001950a52211eebbe17c8ae1ba21d6, 'User 1', 'user1@gmail.com', '$2a$12$vuE4sjoFswrWiNFKARDSou5ELrV9XjsbDHhqe5.0XWtfIALmtYocO');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indices de la tabla `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`image_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indices de la tabla `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `transaction_record_id` (`transaction_record_id`);

--
-- Indices de la tabla `orders_details`
--
ALTER TABLE `orders_details`
  ADD PRIMARY KEY (`order_details_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `product-category` (`category_id`);

--
-- Indices de la tabla `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`transaction_record_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `images`
--
ALTER TABLE `images`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `images_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`transaction_record_id`) REFERENCES `transactions` (`transaction_record_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `orders_details`
--
ALTER TABLE `orders_details`
  ADD CONSTRAINT `orders_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_details_ibfk_3` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Base de datos: `example_boletosreynosa`
--
CREATE DATABASE IF NOT EXISTS `example_boletosreynosa` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `example_boletosreynosa`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asientos`
--

CREATE TABLE `asientos` (
  `idAsiento` int(11) NOT NULL,
  `idTeatro` int(11) NOT NULL,
  `fila` varchar(3) NOT NULL,
  `columna` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `asientos`
--

INSERT INTO `asientos` (`idAsiento`, `idTeatro`, `fila`, `columna`) VALUES
(2, 1, 'A', '2'),
(3, 1, 'A', '3'),
(4, 1, 'A', '4'),
(5, 1, 'A', '5'),
(6, 1, 'A', '6'),
(7, 1, 'A', '7'),
(8, 1, 'A', '8'),
(9, 1, 'A', '9'),
(10, 1, 'A', '10'),
(11, 1, 'A', '11'),
(12, 1, 'A', '12'),
(13, 1, 'A', '13'),
(14, 1, 'A', '14'),
(15, 1, 'A', '15'),
(16, 1, 'A', '16'),
(17, 1, 'A', '17'),
(18, 1, 'A', '18'),
(19, 1, 'A', '19'),
(20, 1, 'A', '20'),
(21, 1, 'A', '21'),
(22, 1, 'A', '22'),
(23, 1, 'A', '23'),
(24, 1, 'B', '1'),
(25, 1, 'B', '2'),
(26, 1, 'B', '3'),
(27, 1, 'B', '4'),
(28, 1, 'B', '5'),
(29, 1, 'B', '6'),
(30, 1, 'B', '7'),
(31, 1, 'B', '8'),
(32, 1, 'B', '9'),
(33, 1, 'B', '10'),
(34, 1, 'B', '11'),
(35, 1, 'B', '12'),
(36, 1, 'B', '13'),
(37, 1, 'B', '14'),
(38, 1, 'B', '15'),
(39, 1, 'B', '16'),
(40, 1, 'B', '17'),
(41, 1, 'B', '18'),
(42, 1, 'B', '19'),
(43, 1, 'B', '20'),
(44, 1, 'B', '21'),
(45, 1, 'B', '22'),
(46, 1, 'B', '23'),
(47, 1, 'C', '1'),
(48, 1, 'C', '2'),
(49, 1, 'C', '3'),
(50, 1, 'C', '4'),
(51, 1, 'C', '5'),
(52, 1, 'C', '6'),
(53, 1, 'C', '7'),
(54, 1, 'C', '8'),
(55, 1, 'C', '9'),
(56, 1, 'C', '10'),
(57, 1, 'C', '11'),
(58, 1, 'C', '12'),
(59, 1, 'C', '13'),
(60, 1, 'C', '14'),
(61, 1, 'C', '15'),
(62, 1, 'C', '16'),
(63, 1, 'C', '17'),
(64, 1, 'C', '18'),
(65, 1, 'C', '19'),
(66, 1, 'C', '20'),
(67, 1, 'C', '21'),
(68, 1, 'C', '22'),
(69, 1, 'C', '23'),
(70, 1, 'C', '24'),
(71, 1, 'C', '25'),
(72, 1, 'C', '26'),
(73, 1, 'C', '27'),
(74, 1, 'C', '28'),
(75, 1, 'D', '1'),
(76, 1, 'D', '2'),
(77, 1, 'D', '3'),
(78, 1, 'D', '4'),
(79, 1, 'D', '5'),
(80, 1, 'D', '6'),
(81, 1, 'D', '7'),
(82, 1, 'D', '8'),
(83, 1, 'D', '9'),
(84, 1, 'D', '10'),
(85, 1, 'D', '11'),
(86, 1, 'D', '12'),
(87, 1, 'D', '13'),
(88, 1, 'D', '14'),
(89, 1, 'D', '15'),
(90, 1, 'D', '16'),
(91, 1, 'D', '17'),
(92, 1, 'D', '18'),
(93, 1, 'D', '19'),
(94, 1, 'D', '20'),
(95, 1, 'D', '21'),
(96, 1, 'D', '22'),
(97, 1, 'D', '23'),
(98, 1, 'D', '24'),
(99, 1, 'D', '25'),
(100, 1, 'D', '26'),
(101, 1, 'D', '27'),
(102, 1, 'D', '28'),
(103, 1, 'D', '29'),
(104, 1, 'E', '1'),
(105, 1, 'E', '2'),
(106, 1, 'E', '3'),
(107, 1, 'E', '4'),
(108, 1, 'E', '5'),
(109, 1, 'E', '6'),
(110, 1, 'E', '7'),
(111, 1, 'E', '8'),
(112, 1, 'E', '9'),
(113, 1, 'E', '10'),
(114, 1, 'E', '11'),
(115, 1, 'E', '12'),
(116, 1, 'E', '13'),
(117, 1, 'E', '14'),
(118, 1, 'E', '15'),
(119, 1, 'E', '16'),
(120, 1, 'E', '17'),
(121, 1, 'E', '18'),
(122, 1, 'E', '19'),
(123, 1, 'E', '20'),
(124, 1, 'E', '21'),
(125, 1, 'E', '22'),
(126, 1, 'E', '23'),
(127, 1, 'E', '24'),
(128, 1, 'E', '25'),
(129, 1, 'E', '26'),
(130, 1, 'E', '27'),
(131, 1, 'E', '28'),
(132, 1, 'E', '29'),
(133, 1, 'E', '30'),
(134, 1, 'E', '31'),
(135, 1, 'E', '32'),
(136, 1, 'E', '33'),
(137, 1, 'E', '34'),
(138, 1, 'E', '35'),
(139, 1, 'E', '36'),
(140, 1, 'E', '37'),
(141, 1, 'E', '38'),
(142, 1, 'F', '1'),
(143, 1, 'F', '2'),
(144, 1, 'F', '3'),
(145, 1, 'F', '4'),
(146, 1, 'F', '5'),
(147, 1, 'F', '6'),
(148, 1, 'F', '7'),
(149, 1, 'F', '8'),
(150, 1, 'F', '9'),
(151, 1, 'F', '10'),
(152, 1, 'F', '11'),
(153, 1, 'F', '12'),
(154, 1, 'F', '13'),
(155, 1, 'F', '14'),
(156, 1, 'F', '15'),
(157, 1, 'F', '16'),
(158, 1, 'F', '17'),
(159, 1, 'F', '18'),
(160, 1, 'F', '19'),
(161, 1, 'F', '20'),
(162, 1, 'F', '21'),
(163, 1, 'F', '22'),
(164, 1, 'F', '23'),
(165, 1, 'F', '24'),
(166, 1, 'F', '25'),
(167, 1, 'F', '26'),
(168, 1, 'F', '27'),
(169, 1, 'F', '28'),
(170, 1, 'F', '29'),
(171, 1, 'F', '30'),
(172, 1, 'F', '31'),
(173, 1, 'F', '32'),
(174, 1, 'F', '33'),
(175, 1, 'F', '34'),
(176, 1, 'F', '35'),
(177, 1, 'F', '36'),
(178, 1, 'F', '37'),
(179, 1, 'F', '38'),
(180, 1, 'F', '39'),
(181, 1, 'G', '1'),
(182, 1, 'G', '2'),
(183, 1, 'G', '3'),
(184, 1, 'G', '4'),
(185, 1, 'G', '5'),
(186, 1, 'G', '6'),
(187, 1, 'G', '7'),
(188, 1, 'G', '8'),
(189, 1, 'G', '9'),
(190, 1, 'G', '10'),
(191, 1, 'G', '11'),
(192, 1, 'G', '12'),
(193, 1, 'G', '13'),
(194, 1, 'G', '14'),
(195, 1, 'G', '15'),
(196, 1, 'G', '16'),
(197, 1, 'G', '17'),
(198, 1, 'G', '18'),
(225, 1, 'I', '1'),
(226, 1, 'I', '2'),
(227, 1, 'I', '3'),
(228, 1, 'I', '4'),
(229, 1, 'I', '5'),
(230, 1, 'I', '6'),
(231, 1, 'I', '7'),
(232, 1, 'I', '8'),
(233, 1, 'I', '9'),
(234, 1, 'I', '10'),
(235, 1, 'I', '11'),
(236, 1, 'I', '12'),
(237, 1, 'I', '13'),
(238, 1, 'I', '14'),
(239, 1, 'I', '15'),
(240, 1, 'I', '16'),
(241, 1, 'I', '17'),
(242, 1, 'I', '18'),
(243, 1, 'I', '19'),
(244, 1, 'I', '20'),
(245, 1, 'I', '21'),
(246, 1, 'I', '22'),
(247, 1, 'I', '23'),
(248, 1, 'I', '24'),
(249, 1, 'I', '25'),
(250, 1, 'I', '26'),
(251, 1, 'I', '27'),
(252, 1, 'I', '28'),
(253, 1, 'I', '29'),
(254, 1, 'I', '30'),
(255, 1, 'I', '31'),
(256, 1, 'I', '32'),
(257, 1, 'I', '33'),
(258, 1, 'I', '34'),
(259, 1, 'I', '35'),
(260, 1, 'I', '36'),
(261, 1, 'I', '37'),
(262, 1, 'I', '38'),
(263, 1, 'I', '39'),
(264, 1, 'I', '40'),
(265, 1, 'I', '41'),
(266, 1, 'I', '42'),
(267, 1, 'I', '43'),
(268, 1, 'I', '44'),
(269, 1, 'J', '1'),
(270, 1, 'J', '2'),
(271, 1, 'J', '3'),
(272, 1, 'J', '4'),
(273, 1, 'J', '5'),
(274, 1, 'J', '6'),
(275, 1, 'J', '7'),
(276, 1, 'J', '8'),
(277, 1, 'J', '9'),
(278, 1, 'J', '10'),
(279, 1, 'J', '11'),
(280, 1, 'J', '12'),
(281, 1, 'J', '13'),
(282, 1, 'J', '14'),
(283, 1, 'J', '15'),
(284, 1, 'J', '16'),
(285, 1, 'J', '17'),
(286, 1, 'J', '18'),
(287, 1, 'J', '19'),
(288, 1, 'J', '20'),
(289, 1, 'J', '21'),
(290, 1, 'J', '22'),
(291, 1, 'J', '23'),
(292, 1, 'J', '24'),
(293, 1, 'J', '25'),
(294, 1, 'J', '26'),
(295, 1, 'J', '27'),
(296, 1, 'J', '28'),
(297, 1, 'J', '29'),
(298, 1, 'J', '30'),
(299, 1, 'J', '31'),
(300, 1, 'J', '32'),
(301, 1, 'J', '33'),
(302, 1, 'J', '34'),
(303, 1, 'J', '35'),
(304, 1, 'J', '36'),
(305, 1, 'J', '37'),
(306, 1, 'J', '38'),
(307, 1, 'J', '39'),
(308, 1, 'J', '40'),
(309, 1, 'J', '41'),
(310, 1, 'J', '42'),
(311, 1, 'J', '43'),
(312, 1, 'J', '44'),
(313, 1, 'J', '45'),
(314, 1, 'K', '1'),
(315, 1, 'K', '2'),
(316, 1, 'K', '3'),
(317, 1, 'K', '4'),
(318, 1, 'K', '5'),
(319, 1, 'K', '6'),
(320, 1, 'K', '7'),
(321, 1, 'K', '8'),
(322, 1, 'K', '9'),
(323, 1, 'K', '10'),
(324, 1, 'K', '11'),
(325, 1, 'K', '12'),
(326, 1, 'K', '13'),
(327, 1, 'K', '14'),
(328, 1, 'K', '15'),
(329, 1, 'K', '16'),
(330, 1, 'K', '17'),
(331, 1, 'K', '18'),
(332, 1, 'K', '19'),
(333, 1, 'K', '20'),
(334, 1, 'K', '21'),
(335, 1, 'K', '22'),
(336, 1, 'K', '23'),
(337, 1, 'K', '24'),
(338, 1, 'K', '25'),
(339, 1, 'K', '26'),
(340, 1, 'K', '27'),
(341, 1, 'K', '28'),
(342, 1, 'K', '29'),
(343, 1, 'K', '30'),
(344, 1, 'K', '31'),
(345, 1, 'K', '32'),
(346, 1, 'K', '33'),
(347, 1, 'K', '34'),
(348, 1, 'K', '35'),
(349, 1, 'K', '36'),
(350, 1, 'K', '37'),
(351, 1, 'K', '38'),
(352, 1, 'K', '39'),
(353, 1, 'K', '40'),
(354, 1, 'K', '41'),
(355, 1, 'K', '42'),
(356, 1, 'K', '43'),
(357, 1, 'K', '44'),
(358, 1, 'K', '45'),
(359, 1, 'K', '46'),
(360, 1, 'L', '1'),
(361, 1, 'L', '2'),
(362, 1, 'L', '3'),
(363, 1, 'L', '4'),
(364, 1, 'L', '5'),
(365, 1, 'L', '6'),
(366, 1, 'L', '7'),
(367, 1, 'L', '8'),
(368, 1, 'L', '9'),
(369, 1, 'L', '10'),
(370, 1, 'L', '11'),
(371, 1, 'L', '12'),
(372, 1, 'L', '13'),
(373, 1, 'L', '14'),
(374, 1, 'L', '15'),
(375, 1, 'L', '16'),
(376, 1, 'L', '17'),
(377, 1, 'L', '18'),
(378, 1, 'L', '19'),
(379, 1, 'L', '20'),
(380, 1, 'L', '21'),
(381, 1, 'L', '22'),
(382, 1, 'L', '23'),
(383, 1, 'L', '24'),
(384, 1, 'L', '25'),
(385, 1, 'L', '26'),
(386, 1, 'L', '27'),
(387, 1, 'L', '28'),
(388, 1, 'L', '29'),
(389, 1, 'L', '30'),
(390, 1, 'L', '31'),
(391, 1, 'L', '32'),
(392, 1, 'L', '33'),
(393, 1, 'L', '34'),
(394, 1, 'L', '35'),
(395, 1, 'L', '36'),
(396, 1, 'L', '37'),
(397, 1, 'L', '38'),
(398, 1, 'L', '39'),
(399, 1, 'L', '40'),
(400, 1, 'L', '41'),
(401, 1, 'L', '42'),
(402, 1, 'L', '43'),
(403, 1, 'L', '44'),
(404, 1, 'L', '45'),
(405, 1, 'L', '46'),
(406, 1, 'M', '1'),
(407, 1, 'M', '2'),
(408, 1, 'M', '3'),
(409, 1, 'M', '4'),
(410, 1, 'M', '5'),
(411, 1, 'M', '6'),
(412, 1, 'M', '7'),
(413, 1, 'M', '8'),
(414, 1, 'M', '9'),
(415, 1, 'M', '10'),
(416, 1, 'M', '11'),
(417, 1, 'M', '12'),
(418, 1, 'M', '13'),
(419, 1, 'M', '14'),
(420, 1, 'M', '15'),
(421, 1, 'M', '16'),
(422, 1, 'M', '17'),
(423, 1, 'M', '18'),
(424, 1, 'M', '19'),
(425, 1, 'M', '20'),
(426, 1, 'M', '21'),
(427, 1, 'M', '22'),
(428, 1, 'M', '23'),
(429, 1, 'M', '24'),
(430, 1, 'M', '25'),
(431, 1, 'M', '26'),
(432, 1, 'M', '27'),
(433, 1, 'M', '28'),
(434, 1, 'M', '29'),
(435, 1, 'M', '30'),
(436, 1, 'M', '31'),
(437, 1, 'M', '32'),
(438, 1, 'M', '33'),
(439, 1, 'M', '34'),
(440, 1, 'M', '35'),
(441, 1, 'M', '36'),
(442, 1, 'M', '37'),
(443, 1, 'M', '38'),
(444, 1, 'M', '39'),
(445, 1, 'M', '40'),
(446, 1, 'M', '41'),
(447, 1, 'M', '42'),
(448, 1, 'M', '43'),
(449, 1, 'M', '44'),
(450, 1, 'M', '45'),
(451, 1, 'M', '46'),
(452, 1, 'M', '47'),
(453, 1, 'N', '1'),
(454, 1, 'N', '2'),
(455, 1, 'N', '3'),
(456, 1, 'N', '4'),
(457, 1, 'N', '5'),
(458, 1, 'N', '6'),
(459, 1, 'N', '7'),
(460, 1, 'N', '8'),
(461, 1, 'N', '9'),
(462, 1, 'N', '10'),
(463, 1, 'N', '11'),
(464, 1, 'N', '12'),
(465, 1, 'N', '13'),
(466, 1, 'N', '14'),
(467, 1, 'N', '15'),
(468, 1, 'N', '16'),
(469, 1, 'N', '17'),
(470, 1, 'N', '18'),
(471, 1, 'N', '19'),
(472, 1, 'N', '20'),
(473, 1, 'N', '21'),
(474, 1, 'N', '22'),
(475, 1, 'N', '23'),
(476, 1, 'N', '24'),
(477, 1, 'N', '25'),
(478, 1, 'N', '26'),
(479, 1, 'N', '27'),
(480, 1, 'N', '28'),
(481, 1, 'N', '29'),
(482, 1, 'N', '30'),
(483, 1, 'N', '31'),
(484, 1, 'N', '32'),
(485, 1, 'N', '33'),
(486, 1, 'N', '34'),
(487, 1, 'N', '35'),
(488, 1, 'N', '36'),
(489, 1, 'N', '37'),
(490, 1, 'N', '38'),
(491, 1, 'N', '39'),
(492, 1, 'N', '40'),
(493, 1, 'N', '41'),
(494, 1, 'N', '42'),
(495, 1, 'N', '43'),
(496, 1, 'N', '44'),
(497, 1, 'N', '45'),
(498, 1, 'N', '46'),
(499, 1, 'O', '1'),
(500, 1, 'O', '2'),
(501, 1, 'O', '3'),
(502, 1, 'O', '4'),
(503, 1, 'O', '5'),
(504, 1, 'O', '6'),
(505, 1, 'O', '7'),
(506, 1, 'O', '8'),
(507, 1, 'O', '9'),
(508, 1, 'O', '10'),
(509, 1, 'O', '11'),
(510, 1, 'O', '12'),
(511, 1, 'O', '13'),
(512, 1, 'O', '14'),
(513, 1, 'O', '15'),
(514, 1, 'O', '16'),
(515, 1, 'O', '17'),
(516, 1, 'O', '18'),
(517, 1, 'O', '19'),
(518, 1, 'O', '20'),
(519, 1, 'O', '21'),
(520, 1, 'O', '22'),
(521, 1, 'O', '23'),
(522, 1, 'O', '24'),
(523, 1, 'O', '25'),
(524, 1, 'O', '26'),
(525, 1, 'O', '27'),
(526, 1, 'O', '28'),
(527, 1, 'O', '29'),
(528, 1, 'O', '30'),
(529, 1, 'O', '31'),
(530, 1, 'O', '32'),
(531, 1, 'O', '33'),
(532, 1, 'O', '34'),
(533, 1, 'O', '35'),
(534, 1, 'O', '36'),
(535, 1, 'O', '37'),
(536, 1, 'O', '38'),
(537, 1, 'O', '39'),
(538, 1, 'O', '40'),
(539, 1, 'O', '41'),
(540, 1, 'O', '42'),
(541, 1, 'O', '43'),
(542, 1, 'O', '44'),
(543, 1, 'O', '45'),
(544, 1, 'O', '46'),
(545, 1, 'P', '1'),
(546, 1, 'P', '2'),
(547, 1, 'P', '3'),
(548, 1, 'P', '4'),
(549, 1, 'P', '5'),
(550, 1, 'P', '6'),
(551, 1, 'P', '7'),
(552, 1, 'P', '8'),
(553, 1, 'P', '9'),
(554, 1, 'P', '10'),
(555, 1, 'P', '11'),
(556, 1, 'P', '12'),
(557, 1, 'P', '13'),
(558, 1, 'P', '14'),
(559, 1, 'P', '15'),
(560, 1, 'P', '16'),
(561, 1, 'P', '17'),
(562, 1, 'P', '18'),
(563, 1, 'P', '19'),
(564, 1, 'P', '20'),
(565, 1, 'P', '21'),
(566, 1, 'P', '22'),
(567, 1, 'P', '23'),
(568, 1, 'P', '24'),
(569, 1, 'P', '25'),
(570, 1, 'P', '26'),
(571, 1, 'P', '27'),
(572, 1, 'P', '28'),
(573, 1, 'P', '29'),
(574, 1, 'P', '30'),
(575, 1, 'P', '31'),
(576, 1, 'P', '32'),
(577, 1, 'P', '33'),
(578, 1, 'P', '34'),
(579, 1, 'P', '35'),
(580, 1, 'P', '36'),
(581, 1, 'P', '37'),
(582, 1, 'P', '38'),
(583, 1, 'P', '39'),
(584, 1, 'P', '40'),
(585, 1, 'P', '41'),
(586, 1, 'P', '42'),
(587, 1, 'P', '43'),
(588, 1, 'P', '44'),
(589, 1, 'P', '45'),
(590, 1, 'Q', '1'),
(591, 1, 'Q', '2'),
(592, 1, 'Q', '3'),
(593, 1, 'Q', '4'),
(594, 1, 'Q', '5'),
(595, 1, 'Q', '6'),
(596, 1, 'Q', '7'),
(597, 1, 'Q', '8'),
(598, 1, 'Q', '9'),
(599, 1, 'Q', '10'),
(600, 1, 'Q', '11'),
(601, 1, 'Q', '12'),
(602, 1, 'Q', '13'),
(603, 1, 'Q', '14'),
(604, 1, 'Q', '15'),
(605, 1, 'Q', '16'),
(606, 1, 'Q', '17'),
(607, 1, 'Q', '18'),
(608, 1, 'Q', '19'),
(609, 1, 'Q', '20'),
(610, 1, 'Q', '21'),
(611, 1, 'Q', '22'),
(612, 1, 'Q', '23'),
(613, 1, 'Q', '24'),
(614, 1, 'Q', '25'),
(615, 1, 'Q', '26'),
(616, 1, 'Q', '27'),
(617, 1, 'Q', '28'),
(618, 1, 'Q', '29'),
(619, 1, 'Q', '30'),
(620, 1, 'Q', '31'),
(621, 1, 'Q', '32'),
(622, 1, 'Q', '33'),
(623, 1, 'Q', '34'),
(624, 1, 'Q', '35'),
(625, 1, 'Q', '36'),
(626, 1, 'Q', '37'),
(627, 1, 'Q', '38'),
(628, 1, 'Q', '39'),
(629, 1, 'Q', '40'),
(630, 1, 'Q', '41'),
(631, 1, 'Q', '42'),
(632, 1, 'Q', '43'),
(633, 1, 'Q', '44'),
(635, 1, 'R', '1'),
(636, 1, 'R', '2'),
(637, 1, 'R', '3'),
(638, 1, 'R', '4'),
(639, 1, 'R', '5'),
(640, 1, 'R', '6'),
(641, 1, 'R', '7'),
(642, 1, 'R', '8'),
(643, 1, 'R', '9'),
(644, 1, 'R', '10'),
(645, 1, 'R', '11'),
(646, 1, 'R', '12'),
(647, 1, 'R', '13'),
(648, 1, 'R', '14'),
(649, 1, 'R', '15'),
(650, 1, 'R', '16'),
(651, 1, 'R', '17'),
(652, 1, 'R', '18'),
(653, 1, 'R', '19'),
(654, 1, 'R', '20'),
(655, 1, 'R', '21'),
(656, 1, 'R', '22'),
(657, 1, 'R', '23'),
(658, 1, 'R', '24'),
(659, 1, 'R', '25'),
(660, 1, 'R', '26'),
(661, 1, 'R', '27'),
(662, 1, 'R', '28'),
(663, 1, 'R', '29'),
(664, 1, 'R', '30'),
(665, 1, 'R', '31'),
(666, 1, 'R', '32'),
(667, 1, 'R', '33'),
(668, 1, 'R', '34'),
(669, 1, 'R', '35'),
(670, 1, 'R', '36'),
(671, 1, 'R', '37'),
(672, 1, 'R', '38'),
(673, 1, 'R', '39'),
(674, 1, 'R', '40'),
(675, 1, 'R', '41'),
(676, 1, 'R', '42'),
(677, 1, 'R', '43'),
(678, 1, 'R', '44'),
(679, 1, 'S', '1'),
(680, 1, 'S', '2'),
(681, 1, 'S', '3'),
(682, 1, 'S', '4'),
(683, 1, 'S', '5'),
(684, 1, 'S', '6'),
(685, 1, 'S', '7'),
(686, 1, 'S', '8'),
(687, 1, 'S', '9'),
(688, 1, 'S', '10'),
(689, 1, 'S', '11'),
(690, 1, 'S', '12'),
(691, 1, 'S', '13'),
(692, 1, 'S', '14'),
(693, 1, 'S', '15'),
(694, 1, 'S', '16'),
(695, 1, 'S', '17'),
(696, 1, 'S', '18'),
(697, 1, 'S', '19'),
(698, 1, 'S', '20'),
(699, 1, 'S', '21'),
(700, 1, 'S', '22'),
(701, 1, 'S', '23'),
(702, 1, 'S', '24'),
(703, 1, 'S', '25'),
(704, 1, 'S', '26'),
(705, 1, 'S', '27'),
(706, 1, 'S', '28'),
(707, 1, 'S', '29'),
(708, 1, 'S', '30'),
(709, 1, 'S', '31'),
(710, 1, 'S', '32'),
(711, 1, 'S', '33'),
(712, 1, 'S', '34'),
(713, 1, 'S', '35'),
(714, 1, 'S', '36'),
(715, 1, 'S', '37'),
(716, 1, 'S', '38'),
(717, 1, 'S', '39'),
(718, 1, 'S', '40'),
(719, 1, 'S', '41'),
(720, 1, 'S', '42'),
(721, 1, 'T', '1'),
(722, 1, 'T', '2'),
(723, 1, 'T', '3'),
(724, 1, 'T', '4'),
(725, 1, 'T', '5'),
(726, 1, 'T', '6'),
(727, 1, 'T', '7'),
(728, 1, 'T', '8'),
(729, 1, 'T', '9'),
(730, 1, 'T', '10'),
(731, 1, 'T', '11'),
(732, 1, 'T', '12'),
(733, 1, 'T', '13'),
(734, 1, 'T', '14'),
(735, 1, 'T', '15'),
(736, 1, 'T', '16'),
(737, 1, 'T', '17'),
(738, 1, 'T', '18'),
(739, 1, 'T', '19'),
(740, 1, 'T', '20'),
(741, 1, 'T', '21'),
(742, 1, 'T', '22'),
(743, 1, 'T', '23'),
(744, 1, 'T', '24'),
(745, 1, 'T', '25'),
(746, 1, 'T', '26'),
(747, 1, 'T', '27'),
(748, 1, 'T', '28'),
(749, 1, 'T', '29'),
(750, 1, 'T', '30'),
(751, 1, 'T', '31'),
(752, 1, 'T', '32'),
(753, 1, 'T', '33'),
(754, 1, 'T', '34'),
(755, 1, 'T', '35'),
(756, 1, 'T', '36'),
(757, 1, 'T', '37'),
(758, 1, 'U', '1'),
(759, 1, 'U', '2'),
(760, 1, 'U', '3'),
(761, 1, 'U', '4'),
(762, 1, 'U', '5'),
(763, 1, 'U', '6'),
(764, 1, 'U', '7'),
(765, 1, 'U', '8'),
(766, 1, 'U', '9'),
(767, 1, 'U', '10'),
(768, 1, 'U', '11'),
(769, 1, 'U', '12'),
(770, 1, 'U', '13'),
(771, 1, 'U', '14'),
(772, 1, 'U', '15'),
(773, 1, 'U', '16'),
(774, 1, 'U', '17'),
(775, 1, 'U', '18'),
(776, 1, 'U', '19'),
(777, 1, 'U', '20'),
(778, 1, 'U', '21'),
(779, 1, 'U', '22'),
(780, 1, 'U', '23'),
(781, 1, 'U', '24'),
(782, 1, 'U', '25'),
(783, 1, 'U', '26'),
(784, 1, 'U', '27'),
(785, 1, 'U', '28'),
(786, 1, 'U', '29'),
(787, 1, 'U', '30'),
(788, 1, 'U', '31'),
(789, 1, 'U', '32'),
(790, 1, 'U', '33'),
(791, 1, 'U', '34'),
(792, 1, 'U', '35'),
(793, 1, 'U', '36'),
(794, 1, 'U', '37'),
(795, 1, 'U', '38'),
(796, 1, 'U', '39'),
(797, 1, 'V', '1'),
(798, 1, 'V', '2'),
(799, 1, 'V', '3'),
(800, 1, 'V', '4'),
(801, 1, 'V', '5'),
(802, 1, 'V', '6'),
(803, 1, 'V', '7'),
(804, 1, 'V', '8'),
(805, 1, 'V', '9'),
(806, 1, 'V', '10'),
(807, 1, 'V', '11'),
(808, 1, 'V', '12'),
(809, 1, 'V', '13'),
(810, 1, 'V', '14'),
(811, 1, 'V', '15'),
(812, 1, 'V', '16'),
(813, 1, 'V', '17'),
(814, 1, 'V', '18'),
(815, 1, 'V', '19'),
(816, 1, 'V', '20'),
(817, 1, 'V', '21'),
(818, 1, 'V', '22'),
(819, 1, 'V', '23'),
(820, 1, 'V', '24'),
(821, 1, 'V', '25'),
(822, 1, 'V', '26'),
(823, 1, 'V', '27'),
(824, 1, 'V', '28'),
(825, 1, 'V', '29'),
(826, 1, 'V', '30'),
(827, 1, 'V', '31'),
(828, 1, 'V', '32'),
(829, 1, 'V', '33'),
(830, 1, 'V', '34'),
(831, 1, 'W', '1'),
(832, 1, 'W', '2'),
(833, 1, 'W', '3'),
(834, 1, 'W', '4'),
(835, 1, 'W', '5'),
(836, 1, 'W', '6'),
(837, 1, 'W', '7'),
(838, 1, 'W', '8'),
(839, 1, 'W', '9'),
(840, 1, 'W', '10'),
(841, 1, 'W', '11'),
(842, 1, 'W', '12'),
(843, 1, 'W', '13'),
(844, 1, 'W', '14'),
(845, 1, 'W', '15'),
(846, 1, 'W', '16'),
(847, 1, 'W', '17'),
(848, 1, 'W', '18'),
(849, 1, 'W', '19'),
(850, 1, 'X', '1'),
(851, 1, 'X', '2'),
(852, 1, 'X', '3'),
(853, 1, 'X', '4'),
(854, 1, 'X', '5'),
(855, 1, 'X', '6'),
(856, 1, 'X', '7'),
(857, 1, 'X', '8'),
(858, 1, 'AA', '1'),
(859, 1, 'AA', '2'),
(860, 1, 'AA', '3'),
(861, 1, 'AA', '4'),
(862, 1, 'AA', '5'),
(863, 1, 'AA', '6'),
(864, 1, 'AA', '7'),
(865, 1, 'AA', '8'),
(866, 1, 'BB', '1'),
(867, 1, 'BB', '2'),
(868, 1, 'BB', '3'),
(869, 1, 'BB', '4'),
(870, 1, 'BB', '5'),
(871, 1, 'BB', '6'),
(872, 1, 'BB', '7'),
(873, 1, 'BB', '8'),
(874, 1, 'BB', '9'),
(875, 1, 'BB', '10'),
(876, 1, 'CC', '1'),
(877, 1, 'CC', '2'),
(878, 1, 'CC', '3'),
(879, 1, 'CC', '4'),
(880, 1, 'CC', '5'),
(881, 1, 'CC', '6'),
(882, 1, 'CC', '7'),
(883, 1, 'CC', '8'),
(884, 1, 'CC', '9'),
(885, 1, 'CC', '10'),
(886, 1, 'CC', '11'),
(887, 1, 'CC', '12'),
(888, 1, 'DD', '1'),
(889, 1, 'DD', '2'),
(890, 1, 'DD', '3'),
(891, 1, 'DD', '4'),
(892, 1, 'DD', '5'),
(893, 1, 'DD', '6'),
(894, 1, 'DD', '7'),
(895, 1, 'DD', '8'),
(896, 1, 'DD', '9'),
(897, 1, 'DD', '10'),
(898, 1, 'DD', '11'),
(899, 1, 'DD', '12'),
(900, 1, 'EE', '1'),
(901, 1, 'EE', '2'),
(902, 1, 'EE', '3'),
(903, 1, 'EE', '4'),
(904, 1, 'EE', '5'),
(905, 1, 'EE', '6'),
(906, 1, 'EE', '7'),
(907, 1, 'EE', '8'),
(908, 1, 'EE', '9'),
(909, 1, 'EE', '10'),
(910, 1, 'EE', '11'),
(911, 1, 'EE', '12'),
(912, 1, 'EE', '13'),
(913, 1, 'EE', '14'),
(914, 1, 'EE', '15'),
(915, 1, 'EE', '16'),
(916, 1, 'EE', '17'),
(917, 1, 'EE', '18'),
(918, 1, 'EE', '19'),
(919, 1, 'EE', '20'),
(920, 1, 'EE', '21'),
(921, 1, 'EE', '22'),
(922, 1, 'EE', '23'),
(923, 1, 'EE', '24'),
(924, 1, 'EE', '25'),
(925, 1, 'EE', '26'),
(926, 1, 'EE', '27'),
(927, 1, 'EE', '28'),
(928, 1, 'EE', '29'),
(929, 1, 'EE', '30'),
(930, 1, 'EE', '31'),
(931, 1, 'EE', '32'),
(932, 1, 'EE', '33'),
(933, 1, 'EE', '34'),
(934, 1, 'EE', '35'),
(935, 1, 'EE', '36'),
(936, 1, 'EE', '37'),
(937, 1, 'EE', '38'),
(938, 1, 'EE', '39'),
(939, 1, 'EE', '40'),
(940, 1, 'EE', '41'),
(941, 1, 'EE', '42'),
(942, 1, 'EE', '43'),
(943, 1, 'EE', '44'),
(944, 1, 'EE', '45'),
(945, 1, 'EE', '46'),
(946, 1, 'EE', '47'),
(947, 1, 'FF', '1'),
(948, 1, 'FF', '2'),
(949, 1, 'FF', '3'),
(950, 1, 'FF', '4'),
(951, 1, 'FF', '5'),
(952, 1, 'FF', '6'),
(953, 1, 'FF', '7'),
(954, 1, 'FF', '8'),
(955, 1, 'FF', '9'),
(956, 1, 'FF', '10'),
(957, 1, 'FF', '11'),
(958, 1, 'FF', '12'),
(959, 1, 'FF', '13'),
(960, 1, 'FF', '14'),
(961, 1, 'FF', '15'),
(962, 1, 'FF', '16'),
(963, 1, 'FF', '17'),
(964, 1, 'FF', '18'),
(965, 1, 'FF', '19'),
(966, 1, 'FF', '20'),
(967, 1, 'FF', '21'),
(968, 1, 'FF', '22'),
(969, 1, 'FF', '23'),
(970, 1, 'FF', '24'),
(971, 1, 'FF', '25'),
(972, 1, 'FF', '26'),
(973, 1, 'FF', '27'),
(974, 1, 'FF', '28'),
(975, 1, 'FF', '29'),
(976, 1, 'FF', '30'),
(977, 1, 'FF', '31'),
(978, 1, 'FF', '32'),
(979, 1, 'FF', '33'),
(980, 1, 'FF', '34'),
(981, 1, 'FF', '35'),
(982, 1, 'FF', '36'),
(983, 1, 'FF', '37'),
(984, 1, 'FF', '38'),
(985, 1, 'FF', '39'),
(986, 1, 'FF', '40'),
(987, 1, 'FF', '41'),
(988, 1, 'FF', '42'),
(989, 1, 'FF', '43'),
(990, 1, 'FF', '44'),
(991, 1, 'FF', '45'),
(992, 1, 'FF', '46'),
(993, 1, 'FF', '47'),
(994, 1, 'GG', '1'),
(995, 1, 'GG', '2'),
(996, 1, 'GG', '3'),
(997, 1, 'GG', '4'),
(998, 1, 'GG', '5'),
(999, 1, 'GG', '6'),
(1000, 1, 'GG', '7'),
(1001, 1, 'GG', '8'),
(1002, 1, 'GG', '9'),
(1003, 1, 'GG', '10'),
(1004, 1, 'GG', '11'),
(1005, 1, 'GG', '12'),
(1006, 1, 'GG', '13'),
(1007, 1, 'GG', '14'),
(1008, 1, 'GG', '15'),
(1009, 1, 'GG', '16'),
(1010, 1, 'GG', '17'),
(1011, 1, 'GG', '18'),
(1012, 1, 'GG', '19'),
(1013, 1, 'GG', '20'),
(1014, 1, 'GG', '21'),
(1015, 1, 'GG', '22'),
(1016, 1, 'GG', '23'),
(1017, 1, 'GG', '24'),
(1018, 1, 'GG', '25'),
(1019, 1, 'GG', '26'),
(1020, 1, 'GG', '27'),
(1021, 1, 'GG', '28'),
(1022, 1, 'GG', '29'),
(1023, 1, 'GG', '30'),
(1024, 1, 'GG', '31'),
(1025, 1, 'GG', '32'),
(1026, 1, 'GG', '33'),
(1027, 1, 'GG', '34'),
(1028, 1, 'GG', '35'),
(1029, 1, 'GG', '36'),
(1030, 1, 'GG', '37'),
(1031, 1, 'GG', '38'),
(1032, 1, 'GG', '39'),
(1033, 1, 'GG', '40'),
(1034, 1, 'GG', '41'),
(1035, 1, 'GG', '42'),
(1036, 1, 'GG', '43'),
(1037, 1, 'GG', '44'),
(1038, 1, 'GG', '45'),
(1039, 1, 'GG', '46'),
(1040, 1, 'GG', '47'),
(1041, 1, 'HH', '1'),
(1042, 1, 'HH', '2'),
(1043, 1, 'HH', '3'),
(1044, 1, 'HH', '4'),
(1045, 1, 'HH', '5'),
(1046, 1, 'HH', '6'),
(1047, 1, 'HH', '7'),
(1048, 1, 'HH', '8'),
(1049, 1, 'HH', '9'),
(1050, 1, 'HH', '10'),
(1051, 1, 'HH', '11'),
(1052, 1, 'HH', '12'),
(1053, 1, 'HH', '13'),
(1054, 1, 'HH', '14'),
(1055, 1, 'HH', '15'),
(1056, 1, 'HH', '16'),
(1057, 1, 'HH', '17'),
(1058, 1, 'HH', '18'),
(1059, 1, 'HH', '19'),
(1060, 1, 'HH', '20'),
(1061, 1, 'HH', '21'),
(1062, 1, 'HH', '22'),
(1063, 1, 'HH', '23'),
(1064, 1, 'HH', '24'),
(1065, 1, 'HH', '25'),
(1066, 1, 'HH', '26'),
(1067, 1, 'HH', '27'),
(1068, 1, 'HH', '28'),
(1069, 1, 'HH', '29'),
(1070, 1, 'HH', '30'),
(1071, 1, 'HH', '31'),
(1072, 1, 'HH', '32'),
(1073, 1, 'HH', '33'),
(1074, 1, 'HH', '34'),
(1075, 1, 'HH', '35'),
(1076, 1, 'HH', '36'),
(1077, 1, 'HH', '37'),
(1078, 1, 'HH', '38'),
(1079, 1, 'HH', '39'),
(1080, 1, 'HH', '40'),
(1081, 1, 'HH', '41'),
(1082, 1, 'II', '1'),
(1083, 1, 'II', '2'),
(1084, 1, 'II', '3'),
(1085, 1, 'II', '4'),
(1086, 1, 'II', '5'),
(1087, 1, 'II', '6'),
(1088, 1, 'II', '7'),
(1089, 1, 'II', '8'),
(1090, 1, 'II', '9'),
(1091, 1, 'II', '10'),
(1092, 1, 'II', '11'),
(1093, 1, 'II', '12'),
(1094, 1, 'II', '13'),
(1095, 1, 'II', '14'),
(1096, 1, 'II', '15'),
(1097, 1, 'II', '16'),
(1098, 1, 'II', '17'),
(1099, 1, 'II', '18'),
(1100, 1, 'II', '19'),
(1101, 1, 'II', '20'),
(1102, 1, 'II', '21'),
(1103, 1, 'II', '22'),
(1104, 1, 'II', '23'),
(1105, 1, 'II', '24'),
(1106, 1, 'II', '25'),
(1107, 1, 'II', '26'),
(1108, 1, 'II', '27'),
(1109, 1, 'II', '28'),
(1110, 1, 'II', '29'),
(1111, 1, 'II', '30'),
(1112, 1, 'II', '31'),
(1113, 1, 'II', '32'),
(1114, 1, 'II', '33'),
(1115, 1, 'II', '34'),
(1116, 1, 'II', '35'),
(1117, 1, 'II', '36'),
(1118, 1, 'II', '37'),
(1119, 1, 'II', '38'),
(1120, 1, 'II', '39'),
(1121, 1, 'II', '40'),
(1122, 1, 'II', '41'),
(1123, 1, 'II', '42'),
(1124, 1, 'JJ', '1'),
(1125, 1, 'JJ', '2'),
(1126, 1, 'JJ', '3'),
(1127, 1, 'JJ', '4'),
(1128, 1, 'JJ', '5'),
(1129, 1, 'JJ', '6'),
(1130, 1, 'JJ', '7'),
(1131, 1, 'JJ', '8'),
(1132, 1, 'JJ', '9'),
(1133, 1, 'JJ', '10'),
(1134, 1, 'JJ', '11'),
(1135, 1, 'JJ', '12'),
(1136, 1, 'JJ', '13'),
(1137, 1, 'JJ', '14'),
(1138, 1, 'JJ', '15'),
(1139, 1, 'JJ', '16'),
(1140, 1, 'JJ', '17'),
(1141, 1, 'JJ', '18'),
(1142, 1, 'JJ', '19'),
(1143, 1, 'JJ', '20'),
(1144, 1, 'JJ', '21'),
(1145, 1, 'JJ', '22'),
(1146, 1, 'JJ', '23'),
(1147, 1, 'JJ', '24'),
(1148, 1, 'JJ', '25'),
(1149, 1, 'JJ', '26'),
(1150, 1, 'JJ', '27'),
(1151, 1, 'JJ', '28'),
(1152, 1, 'JJ', '29'),
(1153, 1, 'JJ', '30'),
(1154, 1, 'JJ', '31'),
(1155, 1, 'JJ', '32'),
(1156, 1, 'JJ', '33'),
(1157, 1, 'JJ', '34'),
(1158, 1, 'JJ', '35'),
(1159, 1, 'KK', '1'),
(1160, 1, 'KK', '2'),
(1161, 1, 'KK', '3'),
(1162, 1, 'KK', '4'),
(1163, 1, 'KK', '5'),
(1164, 1, 'KK', '6'),
(1165, 1, 'KK', '7'),
(1166, 1, 'KK', '8'),
(1167, 1, 'KK', '9'),
(1168, 1, 'KK', '10'),
(1169, 1, 'KK', '11'),
(1170, 1, 'KK', '12'),
(1171, 1, 'KK', '13'),
(1172, 1, 'KK', '14'),
(1173, 1, 'KK', '15'),
(1174, 1, 'KK', '16'),
(1175, 1, 'KK', '17'),
(1176, 1, 'KK', '18'),
(1177, 1, 'KK', '19'),
(1178, 1, 'KK', '20'),
(1179, 1, 'KK', '21'),
(1180, 1, 'KK', '22'),
(1181, 1, 'KK', '23'),
(1182, 1, 'KK', '24'),
(1183, 1, 'N', '47'),
(1184, 1, 'H', '1'),
(1185, 1, 'H', '2'),
(1186, 1, 'H', '3'),
(1187, 1, 'H', '4'),
(1188, 1, 'H', '5'),
(1189, 1, 'H', '6'),
(1190, 1, 'H', '7'),
(1191, 1, 'H', '8');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asientos_funciones`
--

CREATE TABLE `asientos_funciones` (
  `idAsientosFunciones` int(11) NOT NULL,
  `idAsiento` int(11) NOT NULL,
  `idFuncion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `asientos_funciones`
--

INSERT INTO `asientos_funciones` (`idAsientosFunciones`, `idAsiento`, `idFuncion`) VALUES
(834, 293, 40),
(835, 294, 40),
(836, 295, 40),
(837, 296, 40),
(838, 253, 40),
(839, 254, 40),
(840, 255, 40),
(841, 194, 40),
(842, 195, 40),
(843, 196, 40),
(844, 197, 40),
(845, 198, 40),
(846, 152, 40),
(847, 153, 40),
(860, 104, 40),
(861, 105, 40),
(862, 106, 40),
(863, 107, 40),
(864, 108, 40),
(865, 109, 40),
(866, 110, 40),
(867, 112, 40),
(868, 111, 40),
(869, 238, 39),
(870, 239, 39),
(871, 240, 39),
(872, 241, 39),
(873, 242, 39),
(874, 243, 39),
(875, 244, 39),
(876, 245, 39),
(877, 181, 39),
(889, 246, 39),
(890, 247, 39),
(891, 248, 39),
(892, 249, 39),
(893, 250, 39),
(894, 238, 40),
(895, 252, 40),
(896, 251, 40),
(897, 250, 40),
(898, 249, 40),
(899, 248, 40),
(900, 246, 40),
(901, 245, 40),
(902, 244, 40),
(903, 243, 40),
(904, 242, 40),
(905, 297, 40),
(906, 298, 40),
(907, 299, 40),
(908, 345, 40),
(909, 344, 40),
(910, 181, 40),
(911, 182, 40),
(912, 183, 40),
(913, 193, 40),
(914, 192, 40),
(915, 191, 40),
(916, 190, 40),
(917, 161, 40),
(918, 162, 40),
(919, 163, 40),
(920, 164, 40),
(985, 300, 40),
(986, 301, 40),
(987, 302, 40),
(988, 303, 40),
(989, 304, 40),
(990, 305, 40),
(991, 306, 40),
(992, 307, 40),
(993, 308, 40),
(994, 309, 40),
(995, 343, 40),
(996, 342, 40),
(997, 341, 40),
(998, 340, 40),
(999, 339, 40),
(1000, 338, 40),
(1001, 337, 40),
(1002, 336, 40),
(1003, 335, 40),
(1004, 334, 40),
(1017, 328, 40),
(1018, 329, 40),
(1019, 330, 40),
(1020, 331, 40),
(1021, 332, 40),
(1022, 333, 40),
(1023, 384, 40),
(1024, 385, 40),
(1025, 386, 40),
(1026, 387, 40),
(1028, 1171, 39),
(1049, 388, 40),
(1050, 389, 40),
(1051, 390, 40),
(1052, 391, 40),
(1053, 438, 40),
(1054, 437, 40),
(1055, 436, 40),
(1056, 435, 40),
(1057, 434, 40),
(1058, 433, 40),
(1069, 32, 40),
(1070, 33, 40),
(1071, 34, 40),
(1072, 35, 40),
(1073, 36, 40),
(1074, 37, 40),
(1075, 38, 40),
(1076, 39, 40),
(1077, 40, 40),
(1078, 31, 40),
(1079, 423, 40),
(1080, 424, 40),
(1081, 425, 40),
(1082, 426, 40),
(1083, 427, 40),
(1084, 428, 40),
(1085, 429, 40),
(1086, 430, 40),
(1087, 431, 40),
(1088, 432, 40),
(1089, 113, 40),
(1090, 114, 40),
(1091, 115, 40),
(1092, 116, 40),
(1093, 117, 40),
(1094, 118, 40),
(1095, 119, 40),
(1096, 120, 40),
(1097, 121, 40),
(1098, 122, 40),
(1119, 123, 40),
(1120, 124, 40),
(1121, 125, 40),
(1122, 126, 40),
(1123, 128, 40),
(1124, 129, 40),
(1125, 130, 40),
(1126, 131, 40),
(1127, 132, 40),
(1128, 127, 40),
(1129, 470, 40),
(1130, 471, 40),
(1131, 472, 40),
(1132, 473, 40),
(1133, 474, 40),
(1134, 475, 40),
(1135, 476, 40),
(1136, 477, 40),
(1137, 478, 40),
(1138, 479, 40),
(1139, 89, 40),
(1140, 90, 40),
(1141, 91, 40),
(1142, 92, 40),
(1143, 93, 40),
(1144, 94, 40),
(1145, 95, 40),
(1146, 96, 40),
(1147, 97, 40),
(1148, 98, 40),
(1149, 99, 40),
(1160, 346, 40),
(1161, 347, 40),
(1162, 348, 40),
(1163, 349, 40),
(1164, 350, 40),
(1165, 351, 40),
(1166, 352, 40),
(1167, 353, 40),
(1168, 354, 40),
(1169, 355, 40),
(1170, 517, 40),
(1171, 518, 40),
(1172, 519, 40),
(1173, 520, 40),
(1174, 521, 40),
(1175, 522, 40),
(1176, 523, 40),
(1177, 524, 40),
(1178, 525, 40),
(1179, 526, 40),
(1180, 50, 40),
(1181, 51, 40),
(1182, 52, 40),
(1183, 53, 40),
(1184, 54, 40),
(1185, 55, 40),
(1186, 56, 40),
(1187, 57, 40),
(1188, 58, 40),
(1189, 59, 40),
(1190, 60, 40),
(1191, 61, 40),
(1192, 62, 40),
(1193, 63, 40),
(1194, 64, 40),
(1195, 65, 40),
(1196, 66, 40),
(1197, 67, 40),
(1198, 68, 40),
(1199, 69, 40),
(1200, 24, 40),
(1201, 25, 40),
(1202, 26, 40),
(1203, 27, 40),
(1204, 28, 40),
(1205, 29, 40),
(1206, 30, 40),
(1207, 44, 40),
(1208, 45, 40),
(1209, 46, 40),
(1210, 420, 40),
(1211, 421, 40),
(1212, 422, 40),
(1213, 467, 40),
(1214, 468, 40),
(1215, 469, 40),
(1216, 419, 40),
(1217, 418, 40),
(1218, 466, 40),
(1219, 465, 40),
(1220, 392, 40),
(1221, 393, 40),
(1222, 394, 40),
(1223, 395, 40),
(1224, 396, 40),
(1225, 439, 40),
(1226, 440, 40),
(1227, 441, 40),
(1228, 442, 40),
(1229, 443, 40),
(1230, 480, 40),
(1231, 481, 40),
(1232, 482, 40),
(1233, 483, 40),
(1234, 484, 40),
(1235, 485, 40),
(1236, 531, 40),
(1237, 530, 40),
(1238, 529, 40),
(1239, 528, 40),
(1240, 527, 40),
(1241, 373, 40),
(1242, 372, 40),
(1243, 371, 40),
(1244, 370, 40),
(1245, 369, 40),
(1246, 368, 40),
(1247, 367, 40),
(1248, 366, 40),
(1249, 365, 40),
(1250, 364, 40),
(1261, 557, 40),
(1262, 558, 40),
(1263, 559, 40),
(1264, 560, 40),
(1265, 561, 40),
(1266, 562, 40),
(1267, 563, 40),
(1268, 564, 40),
(1269, 565, 40),
(1270, 566, 40),
(1374, 269, 40),
(1375, 270, 40),
(1376, 271, 40),
(1377, 272, 40),
(1378, 273, 40),
(1379, 274, 40),
(1380, 275, 40),
(1381, 276, 40),
(1382, 322, 40),
(1383, 321, 40),
(1384, 154, 40),
(1385, 155, 40),
(1386, 156, 40),
(1387, 157, 40),
(1388, 158, 40),
(1389, 159, 40),
(1390, 160, 40),
(1391, 165, 40),
(1392, 166, 40),
(1393, 167, 40),
(1400, 567, 40),
(1401, 568, 40),
(1402, 569, 40),
(1403, 570, 40),
(1404, 571, 40),
(1405, 572, 40),
(1406, 573, 40),
(1407, 574, 40),
(1408, 575, 40),
(1409, 576, 40),
(1410, 512, 40),
(1411, 513, 40),
(1412, 514, 40),
(1413, 515, 40),
(1414, 516, 40),
(1415, 601, 40),
(1416, 602, 40),
(1417, 603, 40),
(1418, 604, 40),
(1419, 605, 40),
(1420, 417, 40),
(1421, 416, 40),
(1422, 415, 40),
(1423, 414, 40),
(1424, 413, 40),
(1425, 412, 40),
(1426, 411, 40),
(1427, 409, 40),
(1428, 410, 40),
(1429, 408, 40),
(1430, 606, 40),
(1431, 607, 40),
(1432, 608, 40),
(1433, 609, 40),
(1434, 610, 40),
(1435, 611, 40),
(1436, 612, 40),
(1437, 613, 40),
(1438, 614, 40),
(1439, 615, 40),
(1450, 486, 40),
(1451, 487, 40),
(1452, 488, 40),
(1453, 489, 40),
(1454, 490, 40),
(1455, 491, 40),
(1456, 492, 40),
(1457, 493, 40),
(1458, 494, 40),
(1459, 495, 40),
(1460, 310, 40),
(1461, 311, 40),
(1462, 312, 40),
(1463, 313, 40),
(1464, 356, 40),
(1465, 357, 40),
(1466, 358, 40),
(1467, 359, 40),
(1468, 404, 40),
(1469, 405, 40),
(1470, 241, 40),
(1471, 240, 40),
(1472, 651, 40),
(1473, 652, 40),
(1474, 653, 40),
(1475, 654, 40),
(1476, 655, 40),
(1477, 656, 40),
(1478, 657, 40),
(1479, 658, 40),
(1480, 142, 40),
(1481, 143, 40),
(1482, 144, 40),
(1483, 145, 40),
(1484, 146, 40),
(1485, 147, 40),
(1486, 148, 40),
(1487, 149, 40),
(1488, 150, 40),
(1489, 151, 40),
(1500, 688, 40),
(1501, 689, 40),
(1502, 690, 40),
(1503, 691, 40),
(1504, 692, 40),
(1505, 693, 40),
(1506, 694, 40),
(1507, 695, 40),
(1508, 696, 40),
(1509, 697, 40),
(1510, 47, 40),
(1511, 48, 40),
(1512, 49, 40),
(1513, 78, 40),
(1514, 77, 40),
(1515, 76, 40),
(1516, 75, 40),
(1517, 72, 40),
(1518, 73, 40),
(1519, 74, 40),
(1520, 464, 40),
(1521, 463, 40),
(1522, 462, 40),
(1523, 461, 40),
(1524, 460, 40),
(1525, 459, 40),
(1526, 458, 40),
(1527, 457, 40),
(1528, 456, 40),
(1529, 455, 40),
(1530, 314, 40),
(1531, 316, 40),
(1532, 315, 40),
(1533, 317, 40),
(1534, 318, 40),
(1535, 319, 40),
(1536, 320, 40),
(1537, 360, 40),
(1538, 361, 40),
(1539, 362, 40),
(1540, 698, 40),
(1541, 699, 40),
(1542, 700, 40),
(1543, 701, 40),
(1544, 702, 40),
(1545, 703, 40),
(1546, 704, 40),
(1547, 705, 40),
(1548, 706, 40),
(1549, 707, 40),
(1550, 532, 40),
(1551, 533, 40),
(1552, 534, 40),
(1553, 535, 40),
(1554, 536, 40),
(1555, 578, 40),
(1556, 579, 40),
(1557, 580, 40),
(1558, 581, 40),
(1559, 582, 40),
(1560, 502, 40),
(1561, 503, 40),
(1562, 504, 40),
(1563, 505, 40),
(1564, 506, 40),
(1565, 507, 40),
(1566, 508, 40),
(1567, 509, 40),
(1568, 510, 40),
(1569, 511, 40),
(1575, 71, 40),
(1576, 70, 40),
(1577, 444, 40),
(1578, 445, 40),
(1579, 446, 40),
(1580, 447, 40),
(1581, 448, 40),
(1582, 449, 40),
(1583, 450, 40),
(1584, 451, 40),
(1590, 616, 40),
(1591, 617, 40),
(1592, 618, 40),
(1593, 619, 40),
(1594, 620, 40),
(1595, 621, 40),
(1596, 622, 40),
(1597, 668, 40),
(1598, 667, 40),
(1599, 666, 40),
(1610, 537, 40),
(1611, 538, 40),
(1612, 539, 40),
(1613, 540, 40),
(1614, 541, 40),
(1615, 542, 40),
(1616, 543, 40),
(1617, 544, 40),
(1618, 583, 40),
(1619, 584, 40),
(1620, 659, 40),
(1621, 660, 40),
(1622, 661, 40),
(1623, 662, 40),
(1624, 663, 40),
(1625, 664, 40),
(1626, 665, 40),
(1627, 709, 40),
(1628, 710, 40),
(1629, 711, 40),
(1630, 556, 40),
(1631, 555, 40),
(1632, 554, 40),
(1633, 553, 40),
(1634, 552, 40),
(1635, 551, 40),
(1636, 550, 40),
(1637, 549, 40),
(1638, 548, 40),
(1639, 547, 40),
(1640, 397, 40),
(1641, 398, 40),
(1642, 399, 40),
(1643, 400, 40),
(1644, 401, 40),
(1645, 402, 40),
(1646, 403, 40),
(1647, 623, 40),
(1648, 624, 40),
(1649, 625, 40),
(1650, 600, 40),
(1651, 599, 40),
(1652, 598, 40),
(1653, 597, 40),
(1654, 596, 40),
(1655, 595, 40),
(1656, 594, 40),
(1657, 593, 40),
(1658, 592, 40),
(1659, 591, 40),
(1660, 168, 40),
(1661, 169, 40),
(1662, 170, 40),
(1663, 171, 40),
(1664, 172, 40),
(1665, 173, 40),
(1666, 133, 40),
(1667, 134, 40),
(1668, 135, 40),
(1669, 174, 40),
(1670, 100, 40),
(1671, 101, 40),
(1672, 102, 40),
(1673, 103, 40),
(1674, 363, 40),
(1675, 43, 40),
(1676, 42, 40),
(1677, 136, 40),
(1678, 137, 40),
(1679, 31, 39),
(1680, 32, 39),
(1681, 33, 39),
(1682, 34, 39),
(1683, 35, 39),
(1684, 23, 40),
(1685, 22, 40),
(1686, 21, 40),
(1687, 679, 40),
(1688, 680, 40),
(1689, 681, 40),
(1690, 682, 40),
(1691, 683, 40),
(1692, 684, 40),
(1693, 685, 40),
(1694, 79, 39),
(1695, 80, 39),
(1696, 81, 39),
(1697, 82, 39),
(1698, 83, 39),
(1699, 278, 39),
(1700, 279, 39),
(1701, 280, 39),
(1702, 281, 39),
(1703, 641, 40),
(1704, 642, 40),
(1705, 643, 40),
(1706, 644, 40),
(1707, 645, 40),
(1708, 646, 40),
(1709, 647, 40),
(1710, 648, 40),
(1711, 649, 40),
(1712, 650, 40),
(1713, 669, 40),
(1714, 670, 40),
(1715, 671, 40),
(1716, 672, 40),
(1717, 673, 40),
(1718, 674, 40),
(1719, 675, 40),
(1720, 676, 40),
(1721, 677, 40),
(1722, 678, 40),
(1723, 121, 39),
(1724, 328, 39),
(1725, 329, 39),
(1726, 64, 39),
(1727, 63, 39),
(1738, 36, 39),
(1739, 256, 40),
(1740, 257, 40),
(1741, 258, 40),
(1742, 259, 40),
(1743, 260, 40),
(1744, 261, 40),
(1745, 262, 40),
(1746, 263, 40),
(1747, 264, 40),
(1748, 265, 40),
(1749, 138, 40),
(1750, 139, 40),
(1751, 140, 40),
(1752, 342, 39),
(1753, 343, 39),
(1754, 344, 39),
(1755, 345, 39),
(1756, 256, 39),
(1757, 257, 39),
(1758, 258, 39),
(1759, 259, 39),
(1760, 260, 39),
(1761, 262, 39),
(1762, 263, 39),
(1763, 264, 39),
(1764, 265, 39),
(1765, 266, 39),
(1766, 267, 39),
(1767, 268, 39),
(1768, 261, 39),
(1769, 300, 39),
(1770, 301, 39),
(1771, 302, 39),
(1772, 303, 39),
(1773, 304, 39),
(1774, 305, 39),
(1775, 306, 39),
(1776, 307, 39),
(1777, 308, 39),
(1778, 309, 39),
(1779, 310, 39),
(1780, 311, 39),
(1781, 312, 39),
(1782, 313, 39),
(1783, 359, 39),
(1784, 358, 39),
(1785, 357, 39),
(1786, 356, 39),
(1787, 355, 39),
(1788, 354, 39),
(1789, 353, 39),
(1790, 352, 39),
(1791, 351, 39),
(1792, 350, 39),
(1793, 349, 39),
(1794, 348, 39),
(1795, 347, 39),
(1796, 346, 39),
(1797, 405, 39),
(1798, 162, 39),
(1799, 163, 39),
(1800, 164, 39),
(1801, 165, 39),
(1802, 381, 39),
(1803, 382, 39),
(1804, 383, 39),
(1805, 384, 39),
(1806, 385, 39),
(1807, 386, 39),
(1808, 387, 39),
(1809, 388, 39),
(1810, 237, 39),
(1811, 291, 39),
(1812, 292, 39),
(1813, 293, 39),
(1814, 294, 39),
(1815, 295, 39),
(1816, 296, 39),
(1817, 297, 39),
(1818, 298, 39),
(1819, 299, 39),
(1820, 420, 39),
(1821, 421, 39),
(1822, 422, 39),
(1823, 423, 39),
(1824, 424, 39),
(1825, 425, 39),
(1826, 712, 40),
(1827, 713, 40),
(1828, 714, 40),
(1829, 715, 40),
(1830, 716, 40),
(1831, 717, 40),
(1832, 718, 40),
(1833, 719, 40),
(1854, 375, 39),
(1855, 376, 39),
(1856, 377, 39),
(1857, 378, 39),
(1858, 380, 39),
(1859, 379, 39),
(1872, 236, 39),
(1873, 235, 39),
(1874, 234, 39),
(1875, 175, 40),
(1876, 176, 40),
(1877, 284, 40),
(1878, 285, 40),
(1879, 286, 40),
(1880, 287, 40),
(1881, 288, 40),
(1882, 289, 40),
(1883, 290, 40),
(1884, 291, 40),
(1885, 292, 40),
(1886, 12, 40),
(1887, 13, 40),
(1888, 14, 40),
(1889, 15, 40),
(1890, 16, 40),
(1891, 762, 40),
(1892, 763, 40),
(1893, 764, 40),
(1894, 765, 40),
(1895, 766, 40),
(1896, 767, 40),
(1897, 768, 40),
(1898, 769, 40),
(1899, 770, 40),
(1900, 771, 40),
(1901, 496, 40),
(1902, 497, 40),
(1903, 498, 40),
(1904, 1183, 40),
(1905, 79, 40),
(1906, 80, 40),
(1907, 81, 40),
(1908, 82, 40),
(1909, 83, 40),
(1910, 84, 40),
(1911, 85, 40),
(1912, 86, 40),
(1913, 87, 40),
(1914, 88, 40),
(1915, 267, 40),
(1916, 268, 40),
(1917, 180, 40),
(1918, 179, 40),
(1919, 178, 40),
(1920, 177, 40),
(1921, 438, 39),
(1922, 437, 39),
(1923, 436, 39),
(1924, 435, 39),
(1925, 434, 39),
(1926, 433, 39),
(1927, 432, 39),
(1928, 431, 39),
(1929, 430, 39),
(1930, 626, 40),
(1931, 627, 40),
(1932, 628, 40),
(1933, 629, 40),
(1934, 630, 40),
(1935, 631, 40),
(1936, 632, 40),
(1937, 633, 40),
(1938, 585, 40),
(1939, 586, 40),
(1940, 926, 40),
(1941, 927, 40),
(1942, 928, 40),
(1943, 929, 40),
(1944, 930, 40),
(1945, 931, 40),
(1956, 850, 40),
(1957, 851, 40),
(1958, 852, 40),
(1959, 853, 40),
(1960, 755, 40),
(1961, 756, 40),
(1962, 757, 40),
(1963, 725, 40),
(1964, 726, 40),
(1965, 727, 40),
(1966, 728, 40),
(1967, 729, 40),
(1968, 730, 40),
(1969, 731, 40),
(1970, 732, 40),
(1971, 733, 40),
(1972, 734, 40),
(1973, 745, 40),
(1974, 746, 40),
(1975, 747, 40),
(1976, 748, 40),
(1977, 749, 40),
(1978, 750, 40),
(1979, 751, 40),
(1980, 752, 40),
(1981, 753, 40),
(1982, 754, 40),
(1985, 783, 40),
(1986, 784, 40),
(1987, 785, 40),
(1988, 786, 40),
(1989, 787, 40),
(1990, 788, 40),
(1991, 789, 40),
(1992, 790, 40),
(1993, 791, 40),
(1994, 792, 40),
(2002, 166, 39),
(2003, 167, 39),
(2004, 168, 39),
(2005, 169, 39),
(2006, 170, 39),
(2007, 334, 39),
(2008, 8, 39),
(2009, 9, 39),
(2010, 10, 39),
(2011, 11, 39),
(2012, 12, 39),
(2013, 13, 39),
(2014, 14, 39),
(2015, 15, 39),
(2016, 16, 39),
(2017, 17, 39),
(2018, 18, 39),
(2023, 475, 39),
(2024, 476, 39),
(2025, 477, 39),
(2026, 478, 39),
(2027, 228, 40),
(2028, 229, 40),
(2029, 230, 40),
(2030, 231, 40),
(2031, 232, 40),
(2032, 233, 40),
(2033, 234, 40),
(2034, 235, 40),
(2035, 236, 40),
(2036, 237, 40),
(2037, 65, 39),
(2038, 66, 39),
(2039, 67, 39),
(2040, 68, 39),
(2041, 69, 39),
(2042, 70, 39),
(2043, 71, 39),
(2044, 97, 39),
(2045, 98, 39),
(2046, 99, 39),
(2047, 453, 40),
(2048, 454, 40),
(2049, 499, 40),
(2050, 500, 40),
(2051, 501, 40),
(2052, 545, 40),
(2053, 546, 40),
(2054, 53, 39),
(2055, 54, 39),
(2056, 55, 39),
(2057, 56, 39),
(2058, 57, 39),
(2059, 58, 39),
(2060, 59, 39),
(2061, 60, 39),
(2062, 62, 39),
(2063, 61, 39),
(2064, 113, 39),
(2065, 114, 39),
(2066, 115, 39),
(2067, 116, 39),
(2068, 117, 39),
(2069, 118, 39),
(2083, 338, 39),
(2084, 339, 39),
(2085, 340, 39),
(2086, 341, 39),
(2091, 120, 39),
(2092, 119, 39),
(2093, 155, 39),
(2094, 512, 39),
(2105, 322, 39),
(2106, 323, 39),
(2107, 324, 39),
(2108, 325, 39),
(2109, 326, 39),
(2110, 327, 39),
(2111, 1187, 39),
(2112, 282, 39),
(2113, 283, 39),
(2114, 284, 39),
(2115, 285, 39),
(2116, 286, 39),
(2117, 287, 39),
(2118, 288, 39),
(2119, 289, 39),
(2120, 290, 39),
(2134, 638, 40),
(2135, 639, 40),
(2136, 640, 40),
(2139, 158, 39),
(2140, 159, 39),
(2141, 160, 39),
(2142, 161, 39),
(2143, 182, 39),
(2156, 183, 39),
(2157, 156, 39),
(2158, 157, 39),
(2159, 187, 39),
(2160, 188, 39),
(2161, 189, 39),
(2162, 190, 39),
(2163, 191, 39),
(2164, 192, 39),
(2165, 193, 39),
(2166, 406, 40),
(2167, 407, 40),
(2168, 251, 39),
(2169, 252, 39),
(2170, 122, 39),
(2171, 123, 39),
(2172, 124, 39),
(2173, 125, 39),
(2174, 126, 39),
(2175, 84, 39),
(2176, 85, 39),
(2177, 86, 39),
(2178, 87, 39),
(2179, 88, 39),
(2180, 89, 39),
(2181, 90, 39),
(2182, 91, 39),
(2183, 92, 39),
(2184, 93, 39),
(2185, 94, 39),
(2186, 1188, 39),
(2187, 721, 40),
(2188, 722, 40),
(2189, 723, 40),
(2190, 724, 40),
(2191, 758, 40),
(2192, 759, 40),
(2193, 760, 40),
(2194, 761, 40),
(2195, 797, 40),
(2196, 798, 40),
(2197, 799, 40),
(2198, 800, 40),
(2199, 801, 40),
(2200, 802, 40),
(2201, 803, 40),
(2202, 804, 40),
(2203, 805, 40),
(2204, 806, 40),
(2205, 807, 40),
(2206, 808, 40),
(2207, 831, 40),
(2208, 832, 40),
(2209, 833, 40),
(2210, 834, 40),
(2211, 835, 40),
(2212, 836, 40),
(2213, 837, 40),
(2214, 838, 40),
(2215, 839, 40),
(2216, 840, 40),
(2217, 127, 39),
(2218, 128, 39),
(2219, 129, 39),
(2220, 130, 39),
(2221, 131, 39),
(2222, 132, 39),
(2223, 133, 39),
(2224, 134, 39),
(2225, 135, 39),
(2226, 136, 39),
(2227, 841, 40),
(2228, 842, 40),
(2229, 843, 40),
(2230, 844, 40),
(2231, 845, 40),
(2232, 846, 40),
(2233, 847, 40),
(2234, 848, 40),
(2235, 849, 40),
(2236, 820, 40),
(2237, 282, 40),
(2238, 283, 40),
(2239, 686, 40),
(2240, 687, 40),
(2241, 781, 40),
(2242, 782, 40),
(2243, 587, 40),
(2244, 588, 40),
(2245, 589, 40),
(2246, 818, 40),
(2247, 819, 40),
(2248, 744, 40),
(2249, 1190, 40),
(2250, 1191, 40),
(2251, 239, 40),
(2252, 577, 40),
(2253, 821, 40),
(2254, 822, 40),
(2255, 823, 40),
(2256, 824, 40),
(2257, 825, 40),
(2258, 826, 40),
(2259, 827, 40),
(2260, 828, 40),
(2261, 829, 40),
(2262, 830, 40),
(2265, 226, 40),
(2266, 227, 40),
(2267, 467, 39),
(2268, 468, 39),
(2269, 469, 39),
(2270, 470, 39),
(2271, 370, 39),
(2272, 371, 39),
(2273, 372, 39),
(2274, 373, 39),
(2275, 11, 40),
(2276, 10, 40),
(2277, 9, 40),
(2278, 8, 40),
(2279, 7, 40),
(2280, 6, 40),
(2281, 5, 40),
(2282, 4, 40),
(2283, 971, 40),
(2284, 972, 40),
(2287, 925, 40),
(2288, 924, 40),
(2289, 428, 39),
(2290, 429, 39),
(2292, 1124, 39),
(2303, 20, 40),
(2304, 19, 40),
(2305, 18, 40),
(2306, 17, 40),
(2307, 41, 40),
(2308, 2, 40),
(2309, 3, 40),
(2310, 141, 40),
(2311, 266, 40),
(2312, 452, 40),
(2323, 374, 40),
(2324, 375, 40),
(2325, 376, 40),
(2326, 377, 40),
(2327, 378, 40),
(2328, 379, 40),
(2329, 380, 40),
(2330, 381, 40),
(2331, 382, 40),
(2332, 383, 40),
(2333, 335, 39),
(2334, 336, 39),
(2335, 337, 39),
(2336, 184, 40),
(2337, 185, 40),
(2338, 186, 40),
(2339, 187, 40),
(2340, 188, 40),
(2341, 189, 40),
(2342, 932, 40),
(2343, 933, 40),
(2344, 934, 40),
(2345, 935, 40),
(2348, 794, 40),
(2349, 793, 40),
(2355, 854, 40),
(2356, 855, 40),
(2357, 915, 40),
(2358, 916, 40),
(2359, 917, 40),
(2360, 918, 40),
(2361, 919, 40),
(2362, 920, 40),
(2363, 921, 40),
(2364, 922, 40),
(2365, 923, 40),
(2366, 970, 40),
(2367, 969, 40),
(2368, 968, 40),
(2369, 967, 40),
(2370, 966, 40),
(2371, 965, 40),
(2372, 964, 40),
(2373, 963, 40),
(2374, 962, 40),
(2375, 1008, 40),
(2376, 1009, 40),
(2377, 914, 40),
(2378, 913, 40),
(2379, 912, 40),
(2380, 911, 40),
(2381, 910, 40),
(2382, 374, 39),
(2385, 735, 40),
(2386, 772, 40),
(2387, 637, 40),
(2388, 636, 40),
(2389, 417, 39),
(2390, 418, 39),
(2391, 419, 39),
(2392, 1027, 40),
(2393, 1028, 40),
(2394, 1029, 40),
(2395, 1030, 40),
(2409, 390, 39),
(2410, 391, 39),
(2411, 980, 40),
(2412, 981, 40),
(2413, 982, 40),
(2414, 983, 40),
(2415, 984, 40),
(2416, 795, 40),
(2417, 796, 40),
(2818, 99, 43),
(2819, 97, 43),
(2820, 98, 43),
(2821, 96, 43),
(2822, 71, 43),
(2823, 70, 43),
(2824, 13, 42),
(2825, 12, 42),
(2826, 11, 42),
(2827, 10, 42),
(2828, 9, 42),
(2832, 23, 42),
(2833, 22, 42),
(2834, 21, 42),
(2835, 20, 42),
(2836, 18, 42),
(2837, 19, 42),
(2838, 247, 42),
(2839, 246, 42),
(2840, 248, 42),
(2841, 245, 42),
(2842, 251, 42),
(2843, 250, 42),
(2844, 249, 42),
(2852, 252, 42),
(2853, 253, 42),
(2854, 254, 42),
(2855, 255, 42),
(2859, 50, 43),
(2860, 51, 43),
(2861, 52, 43),
(2862, 53, 43),
(2863, 54, 43),
(2865, 198, 42),
(2866, 197, 42),
(2867, 195, 42),
(2868, 196, 42),
(2869, 194, 42),
(2870, 35, 42),
(2871, 246, 43),
(2872, 248, 43),
(2873, 247, 43),
(2876, 88, 42),
(2877, 89, 42),
(2878, 87, 42),
(2881, 255, 39),
(2882, 254, 39),
(2883, 323, 40),
(2884, 324, 40),
(2885, 325, 40),
(2886, 326, 40),
(2887, 327, 40),
(2888, 277, 40),
(2889, 278, 40),
(2890, 279, 40),
(2891, 280, 40),
(2892, 281, 40),
(2893, 8, 42),
(2894, 7, 42),
(2895, 4, 42),
(2896, 6, 42),
(2897, 5, 42),
(2898, 3, 42),
(2899, 2, 42),
(2900, 14, 42);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `boleto`
--

CREATE TABLE `boleto` (
  `idBoleto` int(11) NOT NULL,
  `idCompra` int(11) NOT NULL,
  `idEvento` int(11) NOT NULL,
  `idFuncion` int(11) NOT NULL,
  `idAsiento` int(11) DEFAULT NULL,
  `estadoBoleto` varchar(15) NOT NULL,
  `nombreCliente` varchar(50) NOT NULL,
  `emailCliente` varchar(50) NOT NULL,
  `telefonoCliente` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `boleto`
--

INSERT INTO `boleto` (`idBoleto`, `idCompra`, `idEvento`, `idFuncion`, `idAsiento`, `estadoBoleto`, `nombreCliente`, `emailCliente`, `telefonoCliente`) VALUES
(562, 181, 30, 40, 293, 'SIN-USAR', 'Antonio  Martinez', 'amtzhdz3@gmail.com', '8992112998'),
(563, 181, 30, 40, 294, 'SIN-USAR', 'Antonio  Martinez', 'amtzhdz3@gmail.com', '8992112998'),
(564, 181, 30, 40, 295, 'SIN-USAR', 'Antonio  Martinez', 'amtzhdz3@gmail.com', '8992112998'),
(565, 181, 30, 40, 296, 'SIN-USAR', 'Antonio  Martinez', 'amtzhdz3@gmail.com', '8992112998'),
(566, 182, 30, 40, 253, 'SIN-USAR', 'Sanjuanita Flores', 'sgflores94@hotmail.com', '8991233306'),
(567, 182, 30, 40, 254, 'SIN-USAR', 'Sanjuanita Flores', 'sgflores94@hotmail.com', '8991233306'),
(568, 182, 30, 40, 255, 'SIN-USAR', 'Sanjuanita Flores', 'sgflores94@hotmail.com', '8991233306'),
(569, 183, 30, 40, 194, 'SIN-USAR', 'Orlando Sedas', 'rene_sedas@hotmail.com', '8991822951'),
(570, 183, 30, 40, 195, 'SIN-USAR', 'Orlando Sedas', 'rene_sedas@hotmail.com', '8991822951'),
(571, 183, 30, 40, 196, 'SIN-USAR', 'Orlando Sedas', 'rene_sedas@hotmail.com', '8991822951'),
(572, 183, 30, 40, 197, 'SIN-USAR', 'Orlando Sedas', 'rene_sedas@hotmail.com', '8991822951'),
(573, 183, 30, 40, 198, 'SIN-USAR', 'Orlando Sedas', 'rene_sedas@hotmail.com', '8991822951'),
(574, 184, 30, 40, 152, 'SIN-USAR', 'Simon Trevino', 'simon.trevino@prodigy.net.mx', '8999443704'),
(575, 185, 30, 40, 153, 'SIN-USAR', 'Belinda Trevino', 'belinda_nte@hotmail.com', '8992726324'),
(588, 188, 30, 40, 104, 'SIN-USAR', 'Aurora Sanchez', 'sareyaurora60@gmail.com', '8994808908'),
(589, 188, 30, 40, 105, 'SIN-USAR', 'Aurora Sanchez', 'sareyaurora60@gmail.com', '8994808908'),
(590, 188, 30, 40, 106, 'SIN-USAR', 'Aurora Sanchez', 'sareyaurora60@gmail.com', '8994808908'),
(591, 188, 30, 40, 107, 'SIN-USAR', 'Aurora Sanchez', 'sareyaurora60@gmail.com', '8994808908'),
(592, 188, 30, 40, 108, 'SIN-USAR', 'Aurora Sanchez', 'sareyaurora60@gmail.com', '8994808908'),
(593, 188, 30, 40, 109, 'SIN-USAR', 'Aurora Sanchez', 'sareyaurora60@gmail.com', '8994808908'),
(594, 188, 30, 40, 110, 'SIN-USAR', 'Aurora Sanchez', 'sareyaurora60@gmail.com', '8994808908'),
(595, 188, 30, 40, 112, 'SIN-USAR', 'Aurora Sanchez', 'sareyaurora60@gmail.com', '8994808908'),
(596, 188, 30, 40, 111, 'SIN-USAR', 'Aurora Sanchez', 'sareyaurora60@gmail.com', '8994808908'),
(597, 189, 30, 39, 238, 'SIN-USAR', 'Luz Edith Perez', 'perez.aranda.luz@gmail.com', '8992832759'),
(598, 189, 30, 39, 239, 'SIN-USAR', 'Luz Edith Perez', 'perez.aranda.luz@gmail.com', '8992832759'),
(599, 189, 30, 39, 240, 'SIN-USAR', 'Luz Edith Perez', 'perez.aranda.luz@gmail.com', '8992832759'),
(600, 189, 30, 39, 241, 'SIN-USAR', 'Luz Edith Perez', 'perez.aranda.luz@gmail.com', '8992832759'),
(601, 190, 30, 39, 242, 'SIN-USAR', 'Antonio Martinez', 'amtzhdz3@gmail.com', '8992112998'),
(602, 190, 30, 39, 243, 'SIN-USAR', 'Antonio Martinez', 'amtzhdz3@gmail.com', '8992112998'),
(603, 190, 30, 39, 244, 'SIN-USAR', 'Antonio Martinez', 'amtzhdz3@gmail.com', '8992112998'),
(604, 190, 30, 39, 245, 'SIN-USAR', 'Antonio Martinez', 'amtzhdz3@gmail.com', '8992112998'),
(605, 191, 30, 39, 181, 'SIN-USAR', 'Simon Esteban Trevino Garza', 'simon.trevino@prodigy.net.mx', '8999443704'),
(617, 193, 30, 39, 246, 'SIN-USAR', 'Rubi Padilla', 'abg_245@hotmail.com', '8991873384'),
(618, 193, 30, 39, 247, 'SIN-USAR', 'Rubi Padilla', 'abg_245@hotmail.com', '8991873384'),
(619, 193, 30, 39, 248, 'SIN-USAR', 'Rubi Padilla', 'abg_245@hotmail.com', '8991873384'),
(620, 193, 30, 39, 249, 'SIN-USAR', 'Rubi Padilla', 'abg_245@hotmail.com', '8991873384'),
(621, 193, 30, 39, 250, 'SIN-USAR', 'Rubi Padilla', 'abg_245@hotmail.com', '8991873384'),
(622, 194, 30, 40, 238, 'SIN-USAR', 'Diana Aparicio', 'diana_aparicio27@hotmail.com', '8998710467'),
(623, 195, 30, 40, 252, 'SIN-USAR', 'Luz Edith Perez', 'perez.aranda.luz@gmail.com', '8992832759'),
(624, 195, 30, 40, 251, 'SIN-USAR', 'Luz Edith Perez', 'perez.aranda.luz@gmail.com', '8992832759'),
(625, 195, 30, 40, 250, 'SIN-USAR', 'Luz Edith Perez', 'perez.aranda.luz@gmail.com', '8992832759'),
(626, 195, 30, 40, 249, 'SIN-USAR', 'Luz Edith Perez', 'perez.aranda.luz@gmail.com', '8992832759'),
(627, 195, 30, 40, 248, 'SIN-USAR', 'Luz Edith Perez', 'perez.aranda.luz@gmail.com', '8992832759'),
(628, 195, 30, 40, 246, 'SIN-USAR', 'Luz Edith Perez', 'perez.aranda.luz@gmail.com', '8992832759'),
(629, 195, 30, 40, 245, 'SIN-USAR', 'Luz Edith Perez', 'perez.aranda.luz@gmail.com', '8992832759'),
(630, 195, 30, 40, 244, 'SIN-USAR', 'Luz Edith Perez', 'perez.aranda.luz@gmail.com', '8992832759'),
(631, 195, 30, 40, 243, 'SIN-USAR', 'Luz Edith Perez', 'perez.aranda.luz@gmail.com', '8992832759'),
(632, 195, 30, 40, 242, 'SIN-USAR', 'Luz Edith Perez', 'perez.aranda.luz@gmail.com', '8992832759'),
(633, 196, 30, 40, 297, 'SIN-USAR', 'Ivanna Rojas', 'ivanna_alr97@hotmail.com', '8999596723'),
(634, 196, 30, 40, 298, 'SIN-USAR', 'Ivanna Rojas', 'ivanna_alr97@hotmail.com', '8999596723'),
(635, 196, 30, 40, 299, 'SIN-USAR', 'Ivanna Rojas', 'ivanna_alr97@hotmail.com', '8999596723'),
(636, 196, 30, 40, 345, 'SIN-USAR', 'Ivanna Rojas', 'ivanna_alr97@hotmail.com', '8999596723'),
(637, 196, 30, 40, 344, 'SIN-USAR', 'Ivanna Rojas', 'ivanna_alr97@hotmail.com', '8999596723'),
(638, 197, 30, 40, 181, 'SIN-USAR', 'Artemisa  Sedas', 'academiarolsed@hotmail.com', '8999560673'),
(639, 197, 30, 40, 182, 'SIN-USAR', 'Artemisa  Sedas', 'academiarolsed@hotmail.com', '8999560673'),
(640, 198, 30, 40, 183, 'SIN-USAR', 'Adelita  Sedas', 'acmejia76@gmail.com', '8994992127'),
(641, 199, 30, 40, 193, 'SIN-USAR', 'Aida Torres', 'aidiuxtc@hotmail.com', '8991605960'),
(642, 199, 30, 40, 192, 'SIN-USAR', 'Aida Torres', 'aidiuxtc@hotmail.com', '8991605960'),
(643, 199, 30, 40, 191, 'SIN-USAR', 'Aida Torres', 'aidiuxtc@hotmail.com', '8991605960'),
(644, 199, 30, 40, 190, 'SIN-USAR', 'Aida Torres', 'aidiuxtc@hotmail.com', '8991605960'),
(645, 199, 30, 40, 161, 'SIN-USAR', 'Aida Torres', 'aidiuxtc@hotmail.com', '8991605960'),
(646, 199, 30, 40, 162, 'SIN-USAR', 'Aida Torres', 'aidiuxtc@hotmail.com', '8991605960'),
(647, 199, 30, 40, 163, 'SIN-USAR', 'Aida Torres', 'aidiuxtc@hotmail.com', '8991605960'),
(648, 199, 30, 40, 164, 'SIN-USAR', 'Aida Torres', 'aidiuxtc@hotmail.com', '8991605960'),
(713, 203, 30, 40, 300, 'SIN-USAR', 'Ruth Cortez', 'ruthcdes@gmail.com', '8998711687'),
(714, 203, 30, 40, 301, 'SIN-USAR', 'Ruth Cortez', 'ruthcdes@gmail.com', '8998711687'),
(715, 203, 30, 40, 302, 'SIN-USAR', 'Ruth Cortez', 'ruthcdes@gmail.com', '8998711687'),
(716, 203, 30, 40, 303, 'SIN-USAR', 'Ruth Cortez', 'ruthcdes@gmail.com', '8998711687'),
(717, 203, 30, 40, 304, 'SIN-USAR', 'Ruth Cortez', 'ruthcdes@gmail.com', '8998711687'),
(718, 203, 30, 40, 305, 'SIN-USAR', 'Ruth Cortez', 'ruthcdes@gmail.com', '8998711687'),
(719, 203, 30, 40, 306, 'SIN-USAR', 'Ruth Cortez', 'ruthcdes@gmail.com', '8998711687'),
(720, 203, 30, 40, 307, 'SIN-USAR', 'Ruth Cortez', 'ruthcdes@gmail.com', '8998711687'),
(721, 203, 30, 40, 308, 'SIN-USAR', 'Ruth Cortez', 'ruthcdes@gmail.com', '8998711687'),
(722, 203, 30, 40, 309, 'SIN-USAR', 'Ruth Cortez', 'ruthcdes@gmail.com', '8998711687'),
(723, 204, 30, 40, 343, 'SIN-USAR', 'Martha Garza', 'martha.garza@cobat.edu.mx', '8991600836'),
(724, 204, 30, 40, 342, 'SIN-USAR', 'Martha Garza', 'martha.garza@cobat.edu.mx', '8991600836'),
(725, 204, 30, 40, 341, 'SIN-USAR', 'Martha Garza', 'martha.garza@cobat.edu.mx', '8991600836'),
(726, 204, 30, 40, 340, 'SIN-USAR', 'Martha Garza', 'martha.garza@cobat.edu.mx', '8991600836'),
(727, 204, 30, 40, 339, 'SIN-USAR', 'Martha Garza', 'martha.garza@cobat.edu.mx', '8991600836'),
(728, 204, 30, 40, 338, 'SIN-USAR', 'Martha Garza', 'martha.garza@cobat.edu.mx', '8991600836'),
(729, 204, 30, 40, 337, 'SIN-USAR', 'Martha Garza', 'martha.garza@cobat.edu.mx', '8991600836'),
(730, 204, 30, 40, 336, 'SIN-USAR', 'Martha Garza', 'martha.garza@cobat.edu.mx', '8991600836'),
(731, 204, 30, 40, 335, 'SIN-USAR', 'Martha Garza', 'martha.garza@cobat.edu.mx', '8991600836'),
(732, 204, 30, 40, 334, 'SIN-USAR', 'Martha Garza', 'martha.garza@cobat.edu.mx', '8991600836'),
(745, 207, 30, 40, 328, 'SIN-USAR', 'Rosy Segura', 'rosysegura1976@gmail.com', '8991606633'),
(746, 207, 30, 40, 329, 'SIN-USAR', 'Rosy Segura', 'rosysegura1976@gmail.com', '8991606633'),
(747, 207, 30, 40, 330, 'SIN-USAR', 'Rosy Segura', 'rosysegura1976@gmail.com', '8991606633'),
(748, 207, 30, 40, 331, 'SIN-USAR', 'Rosy Segura', 'rosysegura1976@gmail.com', '8991606633'),
(749, 207, 30, 40, 332, 'SIN-USAR', 'Rosy Segura', 'rosysegura1976@gmail.com', '8991606633'),
(750, 207, 30, 40, 333, 'SIN-USAR', 'Rosy Segura', 'rosysegura1976@gmail.com', '8991606633'),
(751, 207, 30, 40, 384, 'SIN-USAR', 'Rosy Segura', 'rosysegura1976@gmail.com', '8991606633'),
(752, 207, 30, 40, 385, 'SIN-USAR', 'Rosy Segura', 'rosysegura1976@gmail.com', '8991606633'),
(753, 207, 30, 40, 386, 'SIN-USAR', 'Rosy Segura', 'rosysegura1976@gmail.com', '8991606633'),
(754, 207, 30, 40, 387, 'SIN-USAR', 'Rosy Segura', 'rosysegura1976@gmail.com', '8991606633'),
(756, 209, 30, 39, 1171, 'SIN-USAR', 'guillermo sanchez', 'guillermos@hotmail.com', '8991601986'),
(777, 215, 30, 40, 388, 'SIN-USAR', 'Aleyda Saenz', 'aleydasaenzflores@gmail.com', '8992442455'),
(778, 215, 30, 40, 389, 'SIN-USAR', 'Aleyda Saenz', 'aleydasaenzflores@gmail.com', '8992442455'),
(779, 215, 30, 40, 390, 'SIN-USAR', 'Aleyda Saenz', 'aleydasaenzflores@gmail.com', '8992442455'),
(780, 215, 30, 40, 391, 'SIN-USAR', 'Aleyda Saenz', 'aleydasaenzflores@gmail.com', '8992442455'),
(781, 215, 30, 40, 438, 'SIN-USAR', 'Aleyda Saenz', 'aleydasaenzflores@gmail.com', '8992442455'),
(782, 215, 30, 40, 437, 'SIN-USAR', 'Aleyda Saenz', 'aleydasaenzflores@gmail.com', '8992442455'),
(783, 215, 30, 40, 436, 'SIN-USAR', 'Aleyda Saenz', 'aleydasaenzflores@gmail.com', '8992442455'),
(784, 215, 30, 40, 435, 'SIN-USAR', 'Aleyda Saenz', 'aleydasaenzflores@gmail.com', '8992442455'),
(785, 215, 30, 40, 434, 'SIN-USAR', 'Aleyda Saenz', 'aleydasaenzflores@gmail.com', '8992442455'),
(786, 215, 30, 40, 433, 'SIN-USAR', 'Aleyda Saenz', 'aleydasaenzflores@gmail.com', '8992442455'),
(797, 217, 30, 40, 32, 'SIN-USAR', 'Ethel Ramirez', 'draethelrmz@hotmail.com', '8999442345'),
(798, 217, 30, 40, 33, 'SIN-USAR', 'Ethel Ramirez', 'draethelrmz@hotmail.com', '8999442345'),
(799, 217, 30, 40, 34, 'SIN-USAR', 'Ethel Ramirez', 'draethelrmz@hotmail.com', '8999442345'),
(800, 217, 30, 40, 35, 'SIN-USAR', 'Ethel Ramirez', 'draethelrmz@hotmail.com', '8999442345'),
(801, 217, 30, 40, 36, 'SIN-USAR', 'Ethel Ramirez', 'draethelrmz@hotmail.com', '8999442345'),
(802, 217, 30, 40, 37, 'SIN-USAR', 'Ethel Ramirez', 'draethelrmz@hotmail.com', '8999442345'),
(803, 217, 30, 40, 38, 'SIN-USAR', 'Ethel Ramirez', 'draethelrmz@hotmail.com', '8999442345'),
(804, 217, 30, 40, 39, 'SIN-USAR', 'Ethel Ramirez', 'draethelrmz@hotmail.com', '8999442345'),
(805, 217, 30, 40, 40, 'SIN-USAR', 'Ethel Ramirez', 'draethelrmz@hotmail.com', '8999442345'),
(806, 217, 30, 40, 31, 'SIN-USAR', 'Ethel Ramirez', 'draethelrmz@hotmail.com', '8999442345'),
(807, 218, 30, 40, 423, 'SIN-USAR', 'Leticia Tovar', 'leticiatovare@gmail.com', '8999135756'),
(808, 218, 30, 40, 424, 'SIN-USAR', 'Leticia Tovar', 'leticiatovare@gmail.com', '8999135756'),
(809, 218, 30, 40, 425, 'SIN-USAR', 'Leticia Tovar', 'leticiatovare@gmail.com', '8999135756'),
(810, 218, 30, 40, 426, 'SIN-USAR', 'Leticia Tovar', 'leticiatovare@gmail.com', '8999135756'),
(811, 218, 30, 40, 427, 'SIN-USAR', 'Leticia Tovar', 'leticiatovare@gmail.com', '8999135756'),
(812, 218, 30, 40, 428, 'SIN-USAR', 'Leticia Tovar', 'leticiatovare@gmail.com', '8999135756'),
(813, 218, 30, 40, 429, 'SIN-USAR', 'Leticia Tovar', 'leticiatovare@gmail.com', '8999135756'),
(814, 218, 30, 40, 430, 'SIN-USAR', 'Leticia Tovar', 'leticiatovare@gmail.com', '8999135756'),
(815, 218, 30, 40, 431, 'SIN-USAR', 'Leticia Tovar', 'leticiatovare@gmail.com', '8999135756'),
(816, 218, 30, 40, 432, 'SIN-USAR', 'Leticia Tovar', 'leticiatovare@gmail.com', '8999135756'),
(817, 219, 30, 40, 113, 'SIN-USAR', 'Paola  Ramirez', 'pao_rmz86@hotmail.com', '8999593279'),
(818, 219, 30, 40, 114, 'SIN-USAR', 'Paola  Ramirez', 'pao_rmz86@hotmail.com', '8999593279'),
(819, 219, 30, 40, 115, 'SIN-USAR', 'Paola  Ramirez', 'pao_rmz86@hotmail.com', '8999593279'),
(820, 219, 30, 40, 116, 'SIN-USAR', 'Paola  Ramirez', 'pao_rmz86@hotmail.com', '8999593279'),
(821, 219, 30, 40, 117, 'SIN-USAR', 'Paola  Ramirez', 'pao_rmz86@hotmail.com', '8999593279'),
(822, 219, 30, 40, 118, 'SIN-USAR', 'Paola  Ramirez', 'pao_rmz86@hotmail.com', '8999593279'),
(823, 219, 30, 40, 119, 'SIN-USAR', 'Paola  Ramirez', 'pao_rmz86@hotmail.com', '8999593279'),
(824, 219, 30, 40, 120, 'SIN-USAR', 'Paola  Ramirez', 'pao_rmz86@hotmail.com', '8999593279'),
(825, 219, 30, 40, 121, 'SIN-USAR', 'Paola  Ramirez', 'pao_rmz86@hotmail.com', '8999593279'),
(826, 219, 30, 40, 122, 'SIN-USAR', 'Paola  Ramirez', 'pao_rmz86@hotmail.com', '8999593279'),
(847, 222, 30, 40, 123, 'SIN-USAR', 'Lylian Adame', 'lylaadame_g@hotmail.com', '8991227998'),
(848, 222, 30, 40, 124, 'SIN-USAR', 'Lylian Adame', 'lylaadame_g@hotmail.com', '8991227998'),
(849, 222, 30, 40, 125, 'SIN-USAR', 'Lylian Adame', 'lylaadame_g@hotmail.com', '8991227998'),
(850, 222, 30, 40, 126, 'SIN-USAR', 'Lylian Adame', 'lylaadame_g@hotmail.com', '8991227998'),
(851, 222, 30, 40, 128, 'SIN-USAR', 'Lylian Adame', 'lylaadame_g@hotmail.com', '8991227998'),
(852, 222, 30, 40, 129, 'SIN-USAR', 'Lylian Adame', 'lylaadame_g@hotmail.com', '8991227998'),
(853, 222, 30, 40, 130, 'SIN-USAR', 'Lylian Adame', 'lylaadame_g@hotmail.com', '8991227998'),
(854, 222, 30, 40, 131, 'SIN-USAR', 'Lylian Adame', 'lylaadame_g@hotmail.com', '8991227998'),
(855, 222, 30, 40, 132, 'SIN-USAR', 'Lylian Adame', 'lylaadame_g@hotmail.com', '8991227998'),
(856, 222, 30, 40, 127, 'SIN-USAR', 'Lylian Adame', 'lylaadame_g@hotmail.com', '8991227998'),
(857, 223, 30, 40, 470, 'SIN-USAR', 'Anaid Alarcon', 'anaidalarconm@gmail.com', '8119997318'),
(858, 223, 30, 40, 471, 'SIN-USAR', 'Anaid Alarcon', 'anaidalarconm@gmail.com', '8119997318'),
(859, 223, 30, 40, 472, 'SIN-USAR', 'Anaid Alarcon', 'anaidalarconm@gmail.com', '8119997318'),
(860, 223, 30, 40, 473, 'SIN-USAR', 'Anaid Alarcon', 'anaidalarconm@gmail.com', '8119997318'),
(861, 223, 30, 40, 474, 'SIN-USAR', 'Anaid Alarcon', 'anaidalarconm@gmail.com', '8119997318'),
(862, 223, 30, 40, 475, 'SIN-USAR', 'Anaid Alarcon', 'anaidalarconm@gmail.com', '8119997318'),
(863, 223, 30, 40, 476, 'SIN-USAR', 'Anaid Alarcon', 'anaidalarconm@gmail.com', '8119997318'),
(864, 223, 30, 40, 477, 'SIN-USAR', 'Anaid Alarcon', 'anaidalarconm@gmail.com', '8119997318'),
(865, 223, 30, 40, 478, 'SIN-USAR', 'Anaid Alarcon', 'anaidalarconm@gmail.com', '8119997318'),
(866, 223, 30, 40, 479, 'SIN-USAR', 'Anaid Alarcon', 'anaidalarconm@gmail.com', '8119997318'),
(867, 224, 30, 40, 89, 'SIN-USAR', 'Mariana Vargas', 'drsmarianavargas@hotmail.com', '8992457684'),
(868, 224, 30, 40, 90, 'SIN-USAR', 'Mariana Vargas', 'drsmarianavargas@hotmail.com', '8992457684'),
(869, 224, 30, 40, 91, 'SIN-USAR', 'Mariana Vargas', 'drsmarianavargas@hotmail.com', '8992457684'),
(870, 224, 30, 40, 92, 'SIN-USAR', 'Mariana Vargas', 'drsmarianavargas@hotmail.com', '8992457684'),
(871, 224, 30, 40, 93, 'SIN-USAR', 'Mariana Vargas', 'drsmarianavargas@hotmail.com', '8992457684'),
(872, 224, 30, 40, 94, 'SIN-USAR', 'Mariana Vargas', 'drsmarianavargas@hotmail.com', '8992457684'),
(873, 224, 30, 40, 95, 'SIN-USAR', 'Mariana Vargas', 'drsmarianavargas@hotmail.com', '8992457684'),
(874, 224, 30, 40, 96, 'SIN-USAR', 'Mariana Vargas', 'drsmarianavargas@hotmail.com', '8992457684'),
(875, 224, 30, 40, 97, 'SIN-USAR', 'Mariana Vargas', 'drsmarianavargas@hotmail.com', '8992457684'),
(876, 224, 30, 40, 98, 'SIN-USAR', 'Mariana Vargas', 'drsmarianavargas@hotmail.com', '8992457684'),
(877, 224, 30, 40, 99, 'SIN-USAR', 'Mariana Vargas', 'drsmarianavargas@hotmail.com', '8992457684'),
(888, 226, 30, 40, 346, 'SIN-USAR', 'Alma Fayett', 'almisfayett@gmail.com', '89935779327'),
(889, 226, 30, 40, 347, 'SIN-USAR', 'Alma Fayett', 'almisfayett@gmail.com', '89935779327'),
(890, 226, 30, 40, 348, 'SIN-USAR', 'Alma Fayett', 'almisfayett@gmail.com', '89935779327'),
(891, 226, 30, 40, 349, 'SIN-USAR', 'Alma Fayett', 'almisfayett@gmail.com', '89935779327'),
(892, 226, 30, 40, 350, 'SIN-USAR', 'Alma Fayett', 'almisfayett@gmail.com', '89935779327'),
(893, 226, 30, 40, 351, 'SIN-USAR', 'Alma Fayett', 'almisfayett@gmail.com', '89935779327'),
(894, 226, 30, 40, 352, 'SIN-USAR', 'Alma Fayett', 'almisfayett@gmail.com', '89935779327'),
(895, 226, 30, 40, 353, 'SIN-USAR', 'Alma Fayett', 'almisfayett@gmail.com', '89935779327'),
(896, 226, 30, 40, 354, 'SIN-USAR', 'Alma Fayett', 'almisfayett@gmail.com', '89935779327'),
(897, 226, 30, 40, 355, 'SIN-USAR', 'Alma Fayett', 'almisfayett@gmail.com', '89935779327'),
(898, 227, 30, 40, 517, 'SIN-USAR', 'Sanjuanita Hernandez', 'sanjuis_hdz@hotmail.com', '8991307402'),
(899, 227, 30, 40, 518, 'SIN-USAR', 'Sanjuanita Hernandez', 'sanjuis_hdz@hotmail.com', '8991307402'),
(900, 227, 30, 40, 519, 'SIN-USAR', 'Sanjuanita Hernandez', 'sanjuis_hdz@hotmail.com', '8991307402'),
(901, 227, 30, 40, 520, 'SIN-USAR', 'Sanjuanita Hernandez', 'sanjuis_hdz@hotmail.com', '8991307402'),
(902, 227, 30, 40, 521, 'SIN-USAR', 'Sanjuanita Hernandez', 'sanjuis_hdz@hotmail.com', '8991307402'),
(903, 227, 30, 40, 522, 'SIN-USAR', 'Sanjuanita Hernandez', 'sanjuis_hdz@hotmail.com', '8991307402'),
(904, 227, 30, 40, 523, 'SIN-USAR', 'Sanjuanita Hernandez', 'sanjuis_hdz@hotmail.com', '8991307402'),
(905, 227, 30, 40, 524, 'SIN-USAR', 'Sanjuanita Hernandez', 'sanjuis_hdz@hotmail.com', '8991307402'),
(906, 227, 30, 40, 525, 'SIN-USAR', 'Sanjuanita Hernandez', 'sanjuis_hdz@hotmail.com', '8991307402'),
(907, 227, 30, 40, 526, 'SIN-USAR', 'Sanjuanita Hernandez', 'sanjuis_hdz@hotmail.com', '8991307402'),
(908, 228, 30, 40, 50, 'SIN-USAR', 'Chely Maya', 'graciela_maya@hotmail.com', '8991601410'),
(909, 228, 30, 40, 51, 'SIN-USAR', 'Chely Maya', 'graciela_maya@hotmail.com', '8991601410'),
(910, 228, 30, 40, 52, 'SIN-USAR', 'Chely Maya', 'graciela_maya@hotmail.com', '8991601410'),
(911, 228, 30, 40, 53, 'SIN-USAR', 'Chely Maya', 'graciela_maya@hotmail.com', '8991601410'),
(912, 228, 30, 40, 54, 'SIN-USAR', 'Chely Maya', 'graciela_maya@hotmail.com', '8991601410'),
(913, 228, 30, 40, 55, 'SIN-USAR', 'Chely Maya', 'graciela_maya@hotmail.com', '8991601410'),
(914, 228, 30, 40, 56, 'SIN-USAR', 'Chely Maya', 'graciela_maya@hotmail.com', '8991601410'),
(915, 228, 30, 40, 57, 'SIN-USAR', 'Chely Maya', 'graciela_maya@hotmail.com', '8991601410'),
(916, 228, 30, 40, 58, 'SIN-USAR', 'Chely Maya', 'graciela_maya@hotmail.com', '8991601410'),
(917, 228, 30, 40, 59, 'SIN-USAR', 'Chely Maya', 'graciela_maya@hotmail.com', '8991601410'),
(918, 229, 30, 40, 60, 'SIN-USAR', 'Lulu Guarneros', 'lguarnerosalatorre@gmail.com', '8992386924'),
(919, 229, 30, 40, 61, 'SIN-USAR', 'Lulu Guarneros', 'lguarnerosalatorre@gmail.com', '8992386924'),
(920, 229, 30, 40, 62, 'SIN-USAR', 'Lulu Guarneros', 'lguarnerosalatorre@gmail.com', '8992386924'),
(921, 229, 30, 40, 63, 'SIN-USAR', 'Lulu Guarneros', 'lguarnerosalatorre@gmail.com', '8992386924'),
(922, 229, 30, 40, 64, 'SIN-USAR', 'Lulu Guarneros', 'lguarnerosalatorre@gmail.com', '8992386924'),
(923, 229, 30, 40, 65, 'SIN-USAR', 'Lulu Guarneros', 'lguarnerosalatorre@gmail.com', '8992386924'),
(924, 229, 30, 40, 66, 'SIN-USAR', 'Lulu Guarneros', 'lguarnerosalatorre@gmail.com', '8992386924'),
(925, 229, 30, 40, 67, 'SIN-USAR', 'Lulu Guarneros', 'lguarnerosalatorre@gmail.com', '8992386924'),
(926, 229, 30, 40, 68, 'SIN-USAR', 'Lulu Guarneros', 'lguarnerosalatorre@gmail.com', '8992386924'),
(927, 229, 30, 40, 69, 'SIN-USAR', 'Lulu Guarneros', 'lguarnerosalatorre@gmail.com', '8992386924'),
(928, 230, 30, 40, 24, 'SIN-USAR', 'Lizeth Cavazos', 'lizcavazos@outlook.com', '8991344387'),
(929, 230, 30, 40, 25, 'SIN-USAR', 'Lizeth Cavazos', 'lizcavazos@outlook.com', '8991344387'),
(930, 230, 30, 40, 26, 'SIN-USAR', 'Lizeth Cavazos', 'lizcavazos@outlook.com', '8991344387'),
(931, 230, 30, 40, 27, 'SIN-USAR', 'Lizeth Cavazos', 'lizcavazos@outlook.com', '8991344387'),
(932, 230, 30, 40, 28, 'SIN-USAR', 'Lizeth Cavazos', 'lizcavazos@outlook.com', '8991344387'),
(933, 230, 30, 40, 29, 'SIN-USAR', 'Lizeth Cavazos', 'lizcavazos@outlook.com', '8991344387'),
(934, 230, 30, 40, 30, 'SIN-USAR', 'Lizeth Cavazos', 'lizcavazos@outlook.com', '8991344387'),
(935, 230, 30, 40, 44, 'SIN-USAR', 'Lizeth Cavazos', 'lizcavazos@outlook.com', '8991344387'),
(936, 230, 30, 40, 45, 'SIN-USAR', 'Lizeth Cavazos', 'lizcavazos@outlook.com', '8991344387'),
(937, 230, 30, 40, 46, 'SIN-USAR', 'Lizeth Cavazos', 'lizcavazos@outlook.com', '8991344387'),
(938, 231, 30, 40, 420, 'SIN-USAR', 'Elida Barbosa', 'elypower@hotmail.com', '8999362669'),
(939, 231, 30, 40, 421, 'SIN-USAR', 'Elida Barbosa', 'elypower@hotmail.com', '8999362669'),
(940, 231, 30, 40, 422, 'SIN-USAR', 'Elida Barbosa', 'elypower@hotmail.com', '8999362669'),
(941, 231, 30, 40, 467, 'SIN-USAR', 'Elida Barbosa', 'elypower@hotmail.com', '8999362669'),
(942, 231, 30, 40, 468, 'SIN-USAR', 'Elida Barbosa', 'elypower@hotmail.com', '8999362669'),
(943, 231, 30, 40, 469, 'SIN-USAR', 'Elida Barbosa', 'elypower@hotmail.com', '8999362669'),
(944, 231, 30, 40, 419, 'SIN-USAR', 'Elida Barbosa', 'elypower@hotmail.com', '8999362669'),
(945, 231, 30, 40, 418, 'SIN-USAR', 'Elida Barbosa', 'elypower@hotmail.com', '8999362669'),
(946, 231, 30, 40, 466, 'SIN-USAR', 'Elida Barbosa', 'elypower@hotmail.com', '8999362669'),
(947, 231, 30, 40, 465, 'SIN-USAR', 'Elida Barbosa', 'elypower@hotmail.com', '8999362669'),
(948, 232, 30, 40, 392, 'SIN-USAR', 'Yadira Ramirez', 'yramirez.8a@gmail.com', '8991260531'),
(949, 232, 30, 40, 393, 'SIN-USAR', 'Yadira Ramirez', 'yramirez.8a@gmail.com', '8991260531'),
(950, 232, 30, 40, 394, 'SIN-USAR', 'Yadira Ramirez', 'yramirez.8a@gmail.com', '8991260531'),
(951, 232, 30, 40, 395, 'SIN-USAR', 'Yadira Ramirez', 'yramirez.8a@gmail.com', '8991260531'),
(952, 232, 30, 40, 396, 'SIN-USAR', 'Yadira Ramirez', 'yramirez.8a@gmail.com', '8991260531'),
(953, 232, 30, 40, 439, 'SIN-USAR', 'Yadira Ramirez', 'yramirez.8a@gmail.com', '8991260531'),
(954, 232, 30, 40, 440, 'SIN-USAR', 'Yadira Ramirez', 'yramirez.8a@gmail.com', '8991260531'),
(955, 232, 30, 40, 441, 'SIN-USAR', 'Yadira Ramirez', 'yramirez.8a@gmail.com', '8991260531'),
(956, 232, 30, 40, 442, 'SIN-USAR', 'Yadira Ramirez', 'yramirez.8a@gmail.com', '8991260531'),
(957, 232, 30, 40, 443, 'SIN-USAR', 'Yadira Ramirez', 'yramirez.8a@gmail.com', '8991260531'),
(958, 233, 30, 40, 480, 'SIN-USAR', 'Ceny Villarreal', 'ceny14@hotmail.com', '8999361478'),
(959, 233, 30, 40, 481, 'SIN-USAR', 'Ceny Villarreal', 'ceny14@hotmail.com', '8999361478'),
(960, 233, 30, 40, 482, 'SIN-USAR', 'Ceny Villarreal', 'ceny14@hotmail.com', '8999361478'),
(961, 233, 30, 40, 483, 'SIN-USAR', 'Ceny Villarreal', 'ceny14@hotmail.com', '8999361478'),
(962, 233, 30, 40, 484, 'SIN-USAR', 'Ceny Villarreal', 'ceny14@hotmail.com', '8999361478'),
(963, 233, 30, 40, 485, 'SIN-USAR', 'Ceny Villarreal', 'ceny14@hotmail.com', '8999361478'),
(964, 233, 30, 40, 531, 'SIN-USAR', 'Ceny Villarreal', 'ceny14@hotmail.com', '8999361478'),
(965, 233, 30, 40, 530, 'SIN-USAR', 'Ceny Villarreal', 'ceny14@hotmail.com', '8999361478'),
(966, 233, 30, 40, 529, 'SIN-USAR', 'Ceny Villarreal', 'ceny14@hotmail.com', '8999361478'),
(967, 233, 30, 40, 528, 'SIN-USAR', 'Ceny Villarreal', 'ceny14@hotmail.com', '8999361478'),
(968, 233, 30, 40, 527, 'SIN-USAR', 'Ceny Villarreal', 'ceny14@hotmail.com', '8999361478'),
(969, 234, 30, 40, 373, 'SIN-USAR', 'Vero Alvarado', 'veriiito-alvarado@hotmail.com', '8991227543'),
(970, 234, 30, 40, 372, 'SIN-USAR', 'Vero Alvarado', 'veriiito-alvarado@hotmail.com', '8991227543'),
(971, 234, 30, 40, 371, 'SIN-USAR', 'Vero Alvarado', 'veriiito-alvarado@hotmail.com', '8991227543'),
(972, 234, 30, 40, 370, 'SIN-USAR', 'Vero Alvarado', 'veriiito-alvarado@hotmail.com', '8991227543'),
(973, 234, 30, 40, 369, 'SIN-USAR', 'Vero Alvarado', 'veriiito-alvarado@hotmail.com', '8991227543'),
(974, 234, 30, 40, 368, 'SIN-USAR', 'Vero Alvarado', 'veriiito-alvarado@hotmail.com', '8991227543'),
(975, 234, 30, 40, 367, 'SIN-USAR', 'Vero Alvarado', 'veriiito-alvarado@hotmail.com', '8991227543'),
(976, 234, 30, 40, 366, 'SIN-USAR', 'Vero Alvarado', 'veriiito-alvarado@hotmail.com', '8991227543'),
(977, 234, 30, 40, 365, 'SIN-USAR', 'Vero Alvarado', 'veriiito-alvarado@hotmail.com', '8991227543'),
(978, 234, 30, 40, 364, 'SIN-USAR', 'Vero Alvarado', 'veriiito-alvarado@hotmail.com', '8991227543'),
(989, 236, 30, 40, 557, 'SIN-USAR', 'Jessica Herebia', 'jessi_herebia@hotmail.com', '8992343880'),
(990, 236, 30, 40, 558, 'SIN-USAR', 'Jessica Herebia', 'jessi_herebia@hotmail.com', '8992343880'),
(991, 236, 30, 40, 559, 'SIN-USAR', 'Jessica Herebia', 'jessi_herebia@hotmail.com', '8992343880'),
(992, 236, 30, 40, 560, 'SIN-USAR', 'Jessica Herebia', 'jessi_herebia@hotmail.com', '8992343880'),
(993, 236, 30, 40, 561, 'SIN-USAR', 'Jessica Herebia', 'jessi_herebia@hotmail.com', '8992343880'),
(994, 236, 30, 40, 562, 'SIN-USAR', 'Jessica Herebia', 'jessi_herebia@hotmail.com', '8992343880'),
(995, 236, 30, 40, 563, 'SIN-USAR', 'Jessica Herebia', 'jessi_herebia@hotmail.com', '8992343880'),
(996, 236, 30, 40, 564, 'SIN-USAR', 'Jessica Herebia', 'jessi_herebia@hotmail.com', '8992343880'),
(997, 236, 30, 40, 565, 'SIN-USAR', 'Jessica Herebia', 'jessi_herebia@hotmail.com', '8992343880'),
(998, 236, 30, 40, 566, 'SIN-USAR', 'Jessica Herebia', 'jessi_herebia@hotmail.com', '8992343880'),
(1102, 253, 30, 40, 269, 'SIN-USAR', 'Alejandra Vargas', 'alejandravargasvelasco@gmail.com', '8991657281'),
(1103, 253, 30, 40, 270, 'SIN-USAR', 'Alejandra Vargas', 'alejandravargasvelasco@gmail.com', '8991657281'),
(1104, 253, 30, 40, 271, 'SIN-USAR', 'Alejandra Vargas', 'alejandravargasvelasco@gmail.com', '8991657281'),
(1105, 253, 30, 40, 272, 'SIN-USAR', 'Alejandra Vargas', 'alejandravargasvelasco@gmail.com', '8991657281'),
(1106, 253, 30, 40, 273, 'SIN-USAR', 'Alejandra Vargas', 'alejandravargasvelasco@gmail.com', '8991657281'),
(1107, 253, 30, 40, 274, 'SIN-USAR', 'Alejandra Vargas', 'alejandravargasvelasco@gmail.com', '8991657281'),
(1108, 253, 30, 40, 275, 'SIN-USAR', 'Alejandra Vargas', 'alejandravargasvelasco@gmail.com', '8991657281'),
(1109, 253, 30, 40, 276, 'SIN-USAR', 'Alejandra Vargas', 'alejandravargasvelasco@gmail.com', '8991657281'),
(1110, 253, 30, 40, 322, 'SIN-USAR', 'Alejandra Vargas', 'alejandravargasvelasco@gmail.com', '8991657281'),
(1111, 253, 30, 40, 321, 'SIN-USAR', 'Alejandra Vargas', 'alejandravargasvelasco@gmail.com', '8991657281'),
(1112, 254, 30, 40, 154, 'SIN-USAR', 'Laura Contreras', 'lcontreras@papeleraabc.com', '8999594628'),
(1113, 254, 30, 40, 155, 'SIN-USAR', 'Laura Contreras', 'lcontreras@papeleraabc.com', '8999594628'),
(1114, 254, 30, 40, 156, 'SIN-USAR', 'Laura Contreras', 'lcontreras@papeleraabc.com', '8999594628'),
(1115, 254, 30, 40, 157, 'SIN-USAR', 'Laura Contreras', 'lcontreras@papeleraabc.com', '8999594628'),
(1116, 254, 30, 40, 158, 'SIN-USAR', 'Laura Contreras', 'lcontreras@papeleraabc.com', '8999594628'),
(1117, 254, 30, 40, 159, 'SIN-USAR', 'Laura Contreras', 'lcontreras@papeleraabc.com', '8999594628'),
(1118, 254, 30, 40, 160, 'SIN-USAR', 'Laura Contreras', 'lcontreras@papeleraabc.com', '8999594628'),
(1119, 254, 30, 40, 165, 'SIN-USAR', 'Laura Contreras', 'lcontreras@papeleraabc.com', '8999594628'),
(1120, 254, 30, 40, 166, 'SIN-USAR', 'Laura Contreras', 'lcontreras@papeleraabc.com', '8999594628'),
(1121, 254, 30, 40, 167, 'SIN-USAR', 'Laura Contreras', 'lcontreras@papeleraabc.com', '8999594628'),
(1128, 256, 30, 40, 567, 'SIN-USAR', 'Blanca Moctezuma', 'abiliz08@hotmail.com', '8998724614'),
(1129, 256, 30, 40, 568, 'SIN-USAR', 'Blanca Moctezuma', 'abiliz08@hotmail.com', '8998724614'),
(1130, 256, 30, 40, 569, 'SIN-USAR', 'Blanca Moctezuma', 'abiliz08@hotmail.com', '8998724614'),
(1131, 256, 30, 40, 570, 'SIN-USAR', 'Blanca Moctezuma', 'abiliz08@hotmail.com', '8998724614'),
(1132, 256, 30, 40, 571, 'SIN-USAR', 'Blanca Moctezuma', 'abiliz08@hotmail.com', '8998724614'),
(1133, 256, 30, 40, 572, 'SIN-USAR', 'Blanca Moctezuma', 'abiliz08@hotmail.com', '8998724614'),
(1134, 256, 30, 40, 573, 'SIN-USAR', 'Blanca Moctezuma', 'abiliz08@hotmail.com', '8998724614'),
(1135, 256, 30, 40, 574, 'SIN-USAR', 'Blanca Moctezuma', 'abiliz08@hotmail.com', '8998724614'),
(1136, 256, 30, 40, 575, 'SIN-USAR', 'Blanca Moctezuma', 'abiliz08@hotmail.com', '8998724614'),
(1137, 256, 30, 40, 576, 'SIN-USAR', 'Blanca Moctezuma', 'abiliz08@hotmail.com', '8998724614'),
(1138, 257, 30, 40, 512, 'SIN-USAR', 'Rocio Avila', 'rocio.avilag@outlook.com', '8999415511'),
(1139, 257, 30, 40, 513, 'SIN-USAR', 'Rocio Avila', 'rocio.avilag@outlook.com', '8999415511'),
(1140, 257, 30, 40, 514, 'SIN-USAR', 'Rocio Avila', 'rocio.avilag@outlook.com', '8999415511'),
(1141, 257, 30, 40, 515, 'SIN-USAR', 'Rocio Avila', 'rocio.avilag@outlook.com', '8999415511'),
(1142, 257, 30, 40, 516, 'SIN-USAR', 'Rocio Avila', 'rocio.avilag@outlook.com', '8999415511'),
(1143, 257, 30, 40, 601, 'SIN-USAR', 'Rocio Avila', 'rocio.avilag@outlook.com', '8999415511'),
(1144, 257, 30, 40, 602, 'SIN-USAR', 'Rocio Avila', 'rocio.avilag@outlook.com', '8999415511'),
(1145, 257, 30, 40, 603, 'SIN-USAR', 'Rocio Avila', 'rocio.avilag@outlook.com', '8999415511'),
(1146, 257, 30, 40, 604, 'SIN-USAR', 'Rocio Avila', 'rocio.avilag@outlook.com', '8999415511'),
(1147, 257, 30, 40, 605, 'SIN-USAR', 'Rocio Avila', 'rocio.avilag@outlook.com', '8999415511'),
(1148, 258, 30, 40, 417, 'SIN-USAR', 'Karen  Quintanilla', 'karen_quintanilla@hotmail.com', '8999596512'),
(1149, 258, 30, 40, 416, 'SIN-USAR', 'Karen  Quintanilla', 'karen_quintanilla@hotmail.com', '8999596512'),
(1150, 258, 30, 40, 415, 'SIN-USAR', 'Karen  Quintanilla', 'karen_quintanilla@hotmail.com', '8999596512'),
(1151, 258, 30, 40, 414, 'SIN-USAR', 'Karen  Quintanilla', 'karen_quintanilla@hotmail.com', '8999596512'),
(1152, 258, 30, 40, 413, 'SIN-USAR', 'Karen  Quintanilla', 'karen_quintanilla@hotmail.com', '8999596512'),
(1153, 258, 30, 40, 412, 'SIN-USAR', 'Karen  Quintanilla', 'karen_quintanilla@hotmail.com', '8999596512'),
(1154, 258, 30, 40, 411, 'SIN-USAR', 'Karen  Quintanilla', 'karen_quintanilla@hotmail.com', '8999596512'),
(1155, 258, 30, 40, 409, 'SIN-USAR', 'Karen  Quintanilla', 'karen_quintanilla@hotmail.com', '8999596512'),
(1156, 258, 30, 40, 410, 'SIN-USAR', 'Karen  Quintanilla', 'karen_quintanilla@hotmail.com', '8999596512'),
(1157, 258, 30, 40, 408, 'SIN-USAR', 'Karen  Quintanilla', 'karen_quintanilla@hotmail.com', '8999596512'),
(1158, 259, 30, 40, 606, 'SIN-USAR', 'Catalina Juarez', 'katytea21@gmail.com', '9564754440'),
(1159, 259, 30, 40, 607, 'SIN-USAR', 'Catalina Juarez', 'katytea21@gmail.com', '9564754440'),
(1160, 259, 30, 40, 608, 'SIN-USAR', 'Catalina Juarez', 'katytea21@gmail.com', '9564754440'),
(1161, 259, 30, 40, 609, 'SIN-USAR', 'Catalina Juarez', 'katytea21@gmail.com', '9564754440'),
(1162, 259, 30, 40, 610, 'SIN-USAR', 'Catalina Juarez', 'katytea21@gmail.com', '9564754440'),
(1163, 259, 30, 40, 611, 'SIN-USAR', 'Catalina Juarez', 'katytea21@gmail.com', '9564754440'),
(1164, 259, 30, 40, 612, 'SIN-USAR', 'Catalina Juarez', 'katytea21@gmail.com', '9564754440'),
(1165, 259, 30, 40, 613, 'SIN-USAR', 'Catalina Juarez', 'katytea21@gmail.com', '9564754440'),
(1166, 259, 30, 40, 614, 'SIN-USAR', 'Catalina Juarez', 'katytea21@gmail.com', '9564754440'),
(1167, 259, 30, 40, 615, 'SIN-USAR', 'Catalina Juarez', 'katytea21@gmail.com', '9564754440'),
(1178, 261, 30, 40, 486, 'SIN-USAR', 'Valeria Fuentes', 'valeria.reynosa@gmail.com', '8992309421'),
(1179, 261, 30, 40, 487, 'SIN-USAR', 'Valeria Fuentes', 'valeria.reynosa@gmail.com', '8992309421'),
(1180, 261, 30, 40, 488, 'SIN-USAR', 'Valeria Fuentes', 'valeria.reynosa@gmail.com', '8992309421'),
(1181, 261, 30, 40, 489, 'SIN-USAR', 'Valeria Fuentes', 'valeria.reynosa@gmail.com', '8992309421'),
(1182, 261, 30, 40, 490, 'SIN-USAR', 'Valeria Fuentes', 'valeria.reynosa@gmail.com', '8992309421'),
(1183, 261, 30, 40, 491, 'SIN-USAR', 'Valeria Fuentes', 'valeria.reynosa@gmail.com', '8992309421'),
(1184, 261, 30, 40, 492, 'SIN-USAR', 'Valeria Fuentes', 'valeria.reynosa@gmail.com', '8992309421'),
(1185, 261, 30, 40, 493, 'SIN-USAR', 'Valeria Fuentes', 'valeria.reynosa@gmail.com', '8992309421'),
(1186, 261, 30, 40, 494, 'SIN-USAR', 'Valeria Fuentes', 'valeria.reynosa@gmail.com', '8992309421'),
(1187, 261, 30, 40, 495, 'SIN-USAR', 'Valeria Fuentes', 'valeria.reynosa@gmail.com', '8992309421'),
(1188, 262, 30, 40, 310, 'SIN-USAR', 'Amaparo Carrillo', 'mariamparo_gaeta@hotmail.com', '8991872859'),
(1189, 262, 30, 40, 311, 'SIN-USAR', 'Amaparo Carrillo', 'mariamparo_gaeta@hotmail.com', '8991872859'),
(1190, 262, 30, 40, 312, 'SIN-USAR', 'Amaparo Carrillo', 'mariamparo_gaeta@hotmail.com', '8991872859'),
(1191, 262, 30, 40, 313, 'SIN-USAR', 'Amaparo Carrillo', 'mariamparo_gaeta@hotmail.com', '8991872859'),
(1192, 262, 30, 40, 356, 'SIN-USAR', 'Amaparo Carrillo', 'mariamparo_gaeta@hotmail.com', '8991872859'),
(1193, 262, 30, 40, 357, 'SIN-USAR', 'Amaparo Carrillo', 'mariamparo_gaeta@hotmail.com', '8991872859'),
(1194, 262, 30, 40, 358, 'SIN-USAR', 'Amaparo Carrillo', 'mariamparo_gaeta@hotmail.com', '8991872859'),
(1195, 262, 30, 40, 359, 'SIN-USAR', 'Amaparo Carrillo', 'mariamparo_gaeta@hotmail.com', '8991872859'),
(1196, 262, 30, 40, 404, 'SIN-USAR', 'Amaparo Carrillo', 'mariamparo_gaeta@hotmail.com', '8991872859'),
(1197, 262, 30, 40, 405, 'SIN-USAR', 'Amaparo Carrillo', 'mariamparo_gaeta@hotmail.com', '8991872859'),
(1198, 263, 30, 40, 241, 'SIN-USAR', 'Damian  Sedas', 'damiansedas@hotmail.com', '8991155682'),
(1199, 264, 30, 40, 240, 'SIN-USAR', 'Kenya  Salazar', 'kenyasalazar@hotmail.com', '8991089725'),
(1200, 264, 30, 40, 651, 'SIN-USAR', 'Kenya  Salazar', 'kenyasalazar@hotmail.com', '8991089725'),
(1201, 264, 30, 40, 652, 'SIN-USAR', 'Kenya  Salazar', 'kenyasalazar@hotmail.com', '8991089725'),
(1202, 264, 30, 40, 653, 'SIN-USAR', 'Kenya  Salazar', 'kenyasalazar@hotmail.com', '8991089725'),
(1203, 264, 30, 40, 654, 'SIN-USAR', 'Kenya  Salazar', 'kenyasalazar@hotmail.com', '8991089725'),
(1204, 264, 30, 40, 655, 'SIN-USAR', 'Kenya  Salazar', 'kenyasalazar@hotmail.com', '8991089725'),
(1205, 264, 30, 40, 656, 'SIN-USAR', 'Kenya  Salazar', 'kenyasalazar@hotmail.com', '8991089725'),
(1206, 264, 30, 40, 657, 'SIN-USAR', 'Kenya  Salazar', 'kenyasalazar@hotmail.com', '8991089725'),
(1207, 264, 30, 40, 658, 'SIN-USAR', 'Kenya  Salazar', 'kenyasalazar@hotmail.com', '8991089725'),
(1208, 265, 30, 40, 142, 'SIN-USAR', 'Nora Cavazos', 'norac7322_3@hotmail.com', '9563298733'),
(1209, 265, 30, 40, 143, 'SIN-USAR', 'Nora Cavazos', 'norac7322_3@hotmail.com', '9563298733'),
(1210, 265, 30, 40, 144, 'SIN-USAR', 'Nora Cavazos', 'norac7322_3@hotmail.com', '9563298733'),
(1211, 265, 30, 40, 145, 'SIN-USAR', 'Nora Cavazos', 'norac7322_3@hotmail.com', '9563298733'),
(1212, 265, 30, 40, 146, 'SIN-USAR', 'Nora Cavazos', 'norac7322_3@hotmail.com', '9563298733'),
(1213, 265, 30, 40, 147, 'SIN-USAR', 'Nora Cavazos', 'norac7322_3@hotmail.com', '9563298733'),
(1214, 265, 30, 40, 148, 'SIN-USAR', 'Nora Cavazos', 'norac7322_3@hotmail.com', '9563298733'),
(1215, 265, 30, 40, 149, 'SIN-USAR', 'Nora Cavazos', 'norac7322_3@hotmail.com', '9563298733'),
(1216, 265, 30, 40, 150, 'SIN-USAR', 'Nora Cavazos', 'norac7322_3@hotmail.com', '9563298733'),
(1217, 265, 30, 40, 151, 'SIN-USAR', 'Nora Cavazos', 'norac7322_3@hotmail.com', '9563298733'),
(1228, 267, 30, 40, 688, 'SIN-USAR', 'Isabel Centeno', 'isabel_cpa@hotmail.com', '8991677659'),
(1229, 267, 30, 40, 689, 'SIN-USAR', 'Isabel Centeno', 'isabel_cpa@hotmail.com', '8991677659'),
(1230, 267, 30, 40, 690, 'SIN-USAR', 'Isabel Centeno', 'isabel_cpa@hotmail.com', '8991677659'),
(1231, 267, 30, 40, 691, 'SIN-USAR', 'Isabel Centeno', 'isabel_cpa@hotmail.com', '8991677659'),
(1232, 267, 30, 40, 692, 'SIN-USAR', 'Isabel Centeno', 'isabel_cpa@hotmail.com', '8991677659'),
(1233, 267, 30, 40, 693, 'SIN-USAR', 'Isabel Centeno', 'isabel_cpa@hotmail.com', '8991677659'),
(1234, 267, 30, 40, 694, 'SIN-USAR', 'Isabel Centeno', 'isabel_cpa@hotmail.com', '8991677659'),
(1235, 267, 30, 40, 695, 'SIN-USAR', 'Isabel Centeno', 'isabel_cpa@hotmail.com', '8991677659'),
(1236, 267, 30, 40, 696, 'SIN-USAR', 'Isabel Centeno', 'isabel_cpa@hotmail.com', '8991677659'),
(1237, 267, 30, 40, 697, 'SIN-USAR', 'Isabel Centeno', 'isabel_cpa@hotmail.com', '8991677659'),
(1238, 268, 30, 40, 47, 'SIN-USAR', 'Elizabeth Cortez', 'cortez_ely@hotmail.com', '8992292657'),
(1239, 268, 30, 40, 48, 'SIN-USAR', 'Elizabeth Cortez', 'cortez_ely@hotmail.com', '8992292657'),
(1240, 268, 30, 40, 49, 'SIN-USAR', 'Elizabeth Cortez', 'cortez_ely@hotmail.com', '8992292657'),
(1241, 268, 30, 40, 78, 'SIN-USAR', 'Elizabeth Cortez', 'cortez_ely@hotmail.com', '8992292657'),
(1242, 268, 30, 40, 77, 'SIN-USAR', 'Elizabeth Cortez', 'cortez_ely@hotmail.com', '8992292657'),
(1243, 268, 30, 40, 76, 'SIN-USAR', 'Elizabeth Cortez', 'cortez_ely@hotmail.com', '8992292657'),
(1244, 268, 30, 40, 75, 'SIN-USAR', 'Elizabeth Cortez', 'cortez_ely@hotmail.com', '8992292657'),
(1245, 268, 30, 40, 72, 'SIN-USAR', 'Elizabeth Cortez', 'cortez_ely@hotmail.com', '8992292657'),
(1246, 268, 30, 40, 73, 'SIN-USAR', 'Elizabeth Cortez', 'cortez_ely@hotmail.com', '8992292657'),
(1247, 268, 30, 40, 74, 'SIN-USAR', 'Elizabeth Cortez', 'cortez_ely@hotmail.com', '8992292657'),
(1248, 269, 30, 40, 464, 'SIN-USAR', 'Sandrina Morales', 'sandrina_89@hotmail.com', '8999590413'),
(1249, 269, 30, 40, 463, 'SIN-USAR', 'Sandrina Morales', 'sandrina_89@hotmail.com', '8999590413'),
(1250, 269, 30, 40, 462, 'SIN-USAR', 'Sandrina Morales', 'sandrina_89@hotmail.com', '8999590413'),
(1251, 269, 30, 40, 461, 'SIN-USAR', 'Sandrina Morales', 'sandrina_89@hotmail.com', '8999590413'),
(1252, 269, 30, 40, 460, 'SIN-USAR', 'Sandrina Morales', 'sandrina_89@hotmail.com', '8999590413'),
(1253, 269, 30, 40, 459, 'SIN-USAR', 'Sandrina Morales', 'sandrina_89@hotmail.com', '8999590413'),
(1254, 269, 30, 40, 458, 'SIN-USAR', 'Sandrina Morales', 'sandrina_89@hotmail.com', '8999590413'),
(1255, 269, 30, 40, 457, 'SIN-USAR', 'Sandrina Morales', 'sandrina_89@hotmail.com', '8999590413'),
(1256, 269, 30, 40, 456, 'SIN-USAR', 'Sandrina Morales', 'sandrina_89@hotmail.com', '8999590413'),
(1257, 269, 30, 40, 455, 'SIN-USAR', 'Sandrina Morales', 'sandrina_89@hotmail.com', '8999590413'),
(1258, 270, 30, 40, 314, 'SIN-USAR', 'Vero Gallegos', '5038vero@gmail.com', '8993073371'),
(1259, 270, 30, 40, 316, 'SIN-USAR', 'Vero Gallegos', '5038vero@gmail.com', '8993073371'),
(1260, 270, 30, 40, 315, 'SIN-USAR', 'Vero Gallegos', '5038vero@gmail.com', '8993073371'),
(1261, 270, 30, 40, 317, 'SIN-USAR', 'Vero Gallegos', '5038vero@gmail.com', '8993073371'),
(1262, 270, 30, 40, 318, 'SIN-USAR', 'Vero Gallegos', '5038vero@gmail.com', '8993073371'),
(1263, 270, 30, 40, 319, 'SIN-USAR', 'Vero Gallegos', '5038vero@gmail.com', '8993073371'),
(1264, 270, 30, 40, 320, 'SIN-USAR', 'Vero Gallegos', '5038vero@gmail.com', '8993073371'),
(1265, 270, 30, 40, 360, 'SIN-USAR', 'Vero Gallegos', '5038vero@gmail.com', '8993073371'),
(1266, 270, 30, 40, 361, 'SIN-USAR', 'Vero Gallegos', '5038vero@gmail.com', '8993073371'),
(1267, 270, 30, 40, 362, 'SIN-USAR', 'Vero Gallegos', '5038vero@gmail.com', '8993073371'),
(1268, 271, 30, 40, 698, 'SIN-USAR', 'Liliana Sanchez', 'lilianaxoxo@hotmail.com', '3314602510'),
(1269, 271, 30, 40, 699, 'SIN-USAR', 'Liliana Sanchez', 'lilianaxoxo@hotmail.com', '3314602510'),
(1270, 271, 30, 40, 700, 'SIN-USAR', 'Liliana Sanchez', 'lilianaxoxo@hotmail.com', '3314602510'),
(1271, 271, 30, 40, 701, 'SIN-USAR', 'Liliana Sanchez', 'lilianaxoxo@hotmail.com', '3314602510'),
(1272, 271, 30, 40, 702, 'SIN-USAR', 'Liliana Sanchez', 'lilianaxoxo@hotmail.com', '3314602510'),
(1273, 271, 30, 40, 703, 'SIN-USAR', 'Liliana Sanchez', 'lilianaxoxo@hotmail.com', '3314602510'),
(1274, 271, 30, 40, 704, 'SIN-USAR', 'Liliana Sanchez', 'lilianaxoxo@hotmail.com', '3314602510'),
(1275, 271, 30, 40, 705, 'SIN-USAR', 'Liliana Sanchez', 'lilianaxoxo@hotmail.com', '3314602510'),
(1276, 271, 30, 40, 706, 'SIN-USAR', 'Liliana Sanchez', 'lilianaxoxo@hotmail.com', '3314602510'),
(1277, 271, 30, 40, 707, 'SIN-USAR', 'Liliana Sanchez', 'lilianaxoxo@hotmail.com', '3314602510'),
(1278, 272, 30, 40, 532, 'SIN-USAR', 'Claudia Alvarado', 'clau_yanet12@hotmail.com', '8999564012'),
(1279, 272, 30, 40, 533, 'SIN-USAR', 'Claudia Alvarado', 'clau_yanet12@hotmail.com', '8999564012'),
(1280, 272, 30, 40, 534, 'SIN-USAR', 'Claudia Alvarado', 'clau_yanet12@hotmail.com', '8999564012'),
(1281, 272, 30, 40, 535, 'SIN-USAR', 'Claudia Alvarado', 'clau_yanet12@hotmail.com', '8999564012'),
(1282, 272, 30, 40, 536, 'SIN-USAR', 'Claudia Alvarado', 'clau_yanet12@hotmail.com', '8999564012'),
(1283, 272, 30, 40, 578, 'SIN-USAR', 'Claudia Alvarado', 'clau_yanet12@hotmail.com', '8999564012'),
(1284, 272, 30, 40, 579, 'SIN-USAR', 'Claudia Alvarado', 'clau_yanet12@hotmail.com', '8999564012'),
(1285, 272, 30, 40, 580, 'SIN-USAR', 'Claudia Alvarado', 'clau_yanet12@hotmail.com', '8999564012'),
(1286, 272, 30, 40, 581, 'SIN-USAR', 'Claudia Alvarado', 'clau_yanet12@hotmail.com', '8999564012'),
(1287, 272, 30, 40, 582, 'SIN-USAR', 'Claudia Alvarado', 'clau_yanet12@hotmail.com', '8999564012'),
(1288, 273, 30, 40, 502, 'SIN-USAR', 'Jessica Salinas', 'yessica_salinas@hotmail.com', '8999448885'),
(1289, 273, 30, 40, 503, 'SIN-USAR', 'Jessica Salinas', 'yessica_salinas@hotmail.com', '8999448885'),
(1290, 273, 30, 40, 504, 'SIN-USAR', 'Jessica Salinas', 'yessica_salinas@hotmail.com', '8999448885'),
(1291, 273, 30, 40, 505, 'SIN-USAR', 'Jessica Salinas', 'yessica_salinas@hotmail.com', '8999448885'),
(1292, 273, 30, 40, 506, 'SIN-USAR', 'Jessica Salinas', 'yessica_salinas@hotmail.com', '8999448885'),
(1293, 273, 30, 40, 507, 'SIN-USAR', 'Jessica Salinas', 'yessica_salinas@hotmail.com', '8999448885'),
(1294, 273, 30, 40, 508, 'SIN-USAR', 'Jessica Salinas', 'yessica_salinas@hotmail.com', '8999448885'),
(1295, 273, 30, 40, 509, 'SIN-USAR', 'Jessica Salinas', 'yessica_salinas@hotmail.com', '8999448885'),
(1296, 273, 30, 40, 510, 'SIN-USAR', 'Jessica Salinas', 'yessica_salinas@hotmail.com', '8999448885'),
(1297, 273, 30, 40, 511, 'SIN-USAR', 'Jessica Salinas', 'yessica_salinas@hotmail.com', '8999448885'),
(1303, 275, 30, 40, 71, 'SIN-USAR', 'Adriana Vincent', 'a_vincent_g@hotmail.com', '8999639201'),
(1304, 275, 30, 40, 70, 'SIN-USAR', 'Adriana Vincent', 'a_vincent_g@hotmail.com', '8999639201'),
(1305, 275, 30, 40, 444, 'SIN-USAR', 'Adriana Vincent', 'a_vincent_g@hotmail.com', '8999639201'),
(1306, 275, 30, 40, 445, 'SIN-USAR', 'Adriana Vincent', 'a_vincent_g@hotmail.com', '8999639201'),
(1307, 275, 30, 40, 446, 'SIN-USAR', 'Adriana Vincent', 'a_vincent_g@hotmail.com', '8999639201'),
(1308, 275, 30, 40, 447, 'SIN-USAR', 'Adriana Vincent', 'a_vincent_g@hotmail.com', '8999639201'),
(1309, 275, 30, 40, 448, 'SIN-USAR', 'Adriana Vincent', 'a_vincent_g@hotmail.com', '8999639201'),
(1310, 275, 30, 40, 449, 'SIN-USAR', 'Adriana Vincent', 'a_vincent_g@hotmail.com', '8999639201'),
(1311, 275, 30, 40, 450, 'SIN-USAR', 'Adriana Vincent', 'a_vincent_g@hotmail.com', '8999639201'),
(1312, 275, 30, 40, 451, 'SIN-USAR', 'Adriana Vincent', 'a_vincent_g@hotmail.com', '8999639201'),
(1318, 277, 30, 40, 616, 'SIN-USAR', 'Karen Alamillo', 'karen.alarey@hotmail.com', '8999368543'),
(1319, 277, 30, 40, 617, 'SIN-USAR', 'Karen Alamillo', 'karen.alarey@hotmail.com', '8999368543'),
(1320, 277, 30, 40, 618, 'SIN-USAR', 'Karen Alamillo', 'karen.alarey@hotmail.com', '8999368543'),
(1321, 277, 30, 40, 619, 'SIN-USAR', 'Karen Alamillo', 'karen.alarey@hotmail.com', '8999368543'),
(1322, 277, 30, 40, 620, 'SIN-USAR', 'Karen Alamillo', 'karen.alarey@hotmail.com', '8999368543'),
(1323, 277, 30, 40, 621, 'SIN-USAR', 'Karen Alamillo', 'karen.alarey@hotmail.com', '8999368543'),
(1324, 277, 30, 40, 622, 'SIN-USAR', 'Karen Alamillo', 'karen.alarey@hotmail.com', '8999368543'),
(1325, 277, 30, 40, 668, 'SIN-USAR', 'Karen Alamillo', 'karen.alarey@hotmail.com', '8999368543'),
(1326, 277, 30, 40, 667, 'SIN-USAR', 'Karen Alamillo', 'karen.alarey@hotmail.com', '8999368543'),
(1327, 277, 30, 40, 666, 'SIN-USAR', 'Karen Alamillo', 'karen.alarey@hotmail.com', '8999368543'),
(1338, 279, 30, 40, 537, 'SIN-USAR', 'Martha Azocar', 'esteticagema@hotmail.com', '8991691917'),
(1339, 279, 30, 40, 538, 'SIN-USAR', 'Martha Azocar', 'esteticagema@hotmail.com', '8991691917'),
(1340, 279, 30, 40, 539, 'SIN-USAR', 'Martha Azocar', 'esteticagema@hotmail.com', '8991691917'),
(1341, 279, 30, 40, 540, 'SIN-USAR', 'Martha Azocar', 'esteticagema@hotmail.com', '8991691917'),
(1342, 279, 30, 40, 541, 'SIN-USAR', 'Martha Azocar', 'esteticagema@hotmail.com', '8991691917'),
(1343, 279, 30, 40, 542, 'SIN-USAR', 'Martha Azocar', 'esteticagema@hotmail.com', '8991691917'),
(1344, 279, 30, 40, 543, 'SIN-USAR', 'Martha Azocar', 'esteticagema@hotmail.com', '8991691917'),
(1345, 279, 30, 40, 544, 'SIN-USAR', 'Martha Azocar', 'esteticagema@hotmail.com', '8991691917'),
(1346, 279, 30, 40, 583, 'SIN-USAR', 'Martha Azocar', 'esteticagema@hotmail.com', '8991691917'),
(1347, 279, 30, 40, 584, 'SIN-USAR', 'Martha Azocar', 'esteticagema@hotmail.com', '8991691917'),
(1348, 280, 30, 40, 659, 'SIN-USAR', 'Patty Alamillo', 'patoalre@gmail.com', '8999368621'),
(1349, 280, 30, 40, 660, 'SIN-USAR', 'Patty Alamillo', 'patoalre@gmail.com', '8999368621'),
(1350, 280, 30, 40, 661, 'SIN-USAR', 'Patty Alamillo', 'patoalre@gmail.com', '8999368621'),
(1351, 280, 30, 40, 662, 'SIN-USAR', 'Patty Alamillo', 'patoalre@gmail.com', '8999368621'),
(1352, 280, 30, 40, 663, 'SIN-USAR', 'Patty Alamillo', 'patoalre@gmail.com', '8999368621'),
(1353, 280, 30, 40, 664, 'SIN-USAR', 'Patty Alamillo', 'patoalre@gmail.com', '8999368621'),
(1354, 280, 30, 40, 665, 'SIN-USAR', 'Patty Alamillo', 'patoalre@gmail.com', '8999368621'),
(1355, 280, 30, 40, 709, 'SIN-USAR', 'Patty Alamillo', 'patoalre@gmail.com', '8999368621'),
(1356, 280, 30, 40, 710, 'SIN-USAR', 'Patty Alamillo', 'patoalre@gmail.com', '8999368621'),
(1357, 280, 30, 40, 711, 'SIN-USAR', 'Patty Alamillo', 'patoalre@gmail.com', '8999368621'),
(1358, 281, 30, 40, 556, 'SIN-USAR', 'Alejandra Lopez', 'alelpz85@hotmail.com', '8999360876'),
(1359, 281, 30, 40, 555, 'SIN-USAR', 'Alejandra Lopez', 'alelpz85@hotmail.com', '8999360876'),
(1360, 281, 30, 40, 554, 'SIN-USAR', 'Alejandra Lopez', 'alelpz85@hotmail.com', '8999360876'),
(1361, 281, 30, 40, 553, 'SIN-USAR', 'Alejandra Lopez', 'alelpz85@hotmail.com', '8999360876'),
(1362, 281, 30, 40, 552, 'SIN-USAR', 'Alejandra Lopez', 'alelpz85@hotmail.com', '8999360876'),
(1363, 281, 30, 40, 551, 'SIN-USAR', 'Alejandra Lopez', 'alelpz85@hotmail.com', '8999360876'),
(1364, 281, 30, 40, 550, 'SIN-USAR', 'Alejandra Lopez', 'alelpz85@hotmail.com', '8999360876'),
(1365, 281, 30, 40, 549, 'SIN-USAR', 'Alejandra Lopez', 'alelpz85@hotmail.com', '8999360876'),
(1366, 281, 30, 40, 548, 'SIN-USAR', 'Alejandra Lopez', 'alelpz85@hotmail.com', '8999360876'),
(1367, 281, 30, 40, 547, 'SIN-USAR', 'Alejandra Lopez', 'alelpz85@hotmail.com', '8999360876'),
(1368, 282, 30, 40, 397, 'SIN-USAR', 'liliana Benavides', 'lyly_ica@hotmail.com', '9563400148'),
(1369, 282, 30, 40, 398, 'SIN-USAR', 'liliana Benavides', 'lyly_ica@hotmail.com', '9563400148'),
(1370, 282, 30, 40, 399, 'SIN-USAR', 'liliana Benavides', 'lyly_ica@hotmail.com', '9563400148'),
(1371, 282, 30, 40, 400, 'SIN-USAR', 'liliana Benavides', 'lyly_ica@hotmail.com', '9563400148'),
(1372, 282, 30, 40, 401, 'SIN-USAR', 'liliana Benavides', 'lyly_ica@hotmail.com', '9563400148'),
(1373, 282, 30, 40, 402, 'SIN-USAR', 'liliana Benavides', 'lyly_ica@hotmail.com', '9563400148'),
(1374, 282, 30, 40, 403, 'SIN-USAR', 'liliana Benavides', 'lyly_ica@hotmail.com', '9563400148'),
(1375, 282, 30, 40, 623, 'SIN-USAR', 'liliana Benavides', 'lyly_ica@hotmail.com', '9563400148'),
(1376, 282, 30, 40, 624, 'SIN-USAR', 'liliana Benavides', 'lyly_ica@hotmail.com', '9563400148'),
(1377, 282, 30, 40, 625, 'SIN-USAR', 'liliana Benavides', 'lyly_ica@hotmail.com', '9563400148'),
(1378, 283, 30, 40, 600, 'SIN-USAR', 'Veronica Careaga', 'dracareaga@hotmail.com', '89928888322'),
(1379, 283, 30, 40, 599, 'SIN-USAR', 'Veronica Careaga', 'dracareaga@hotmail.com', '89928888322'),
(1380, 283, 30, 40, 598, 'SIN-USAR', 'Veronica Careaga', 'dracareaga@hotmail.com', '89928888322'),
(1381, 283, 30, 40, 597, 'SIN-USAR', 'Veronica Careaga', 'dracareaga@hotmail.com', '89928888322'),
(1382, 283, 30, 40, 596, 'SIN-USAR', 'Veronica Careaga', 'dracareaga@hotmail.com', '89928888322'),
(1383, 283, 30, 40, 595, 'SIN-USAR', 'Veronica Careaga', 'dracareaga@hotmail.com', '89928888322'),
(1384, 283, 30, 40, 594, 'SIN-USAR', 'Veronica Careaga', 'dracareaga@hotmail.com', '89928888322'),
(1385, 283, 30, 40, 593, 'SIN-USAR', 'Veronica Careaga', 'dracareaga@hotmail.com', '89928888322'),
(1386, 283, 30, 40, 592, 'SIN-USAR', 'Veronica Careaga', 'dracareaga@hotmail.com', '89928888322'),
(1387, 283, 30, 40, 591, 'SIN-USAR', 'Veronica Careaga', 'dracareaga@hotmail.com', '89928888322'),
(1388, 284, 30, 40, 168, 'SIN-USAR', 'Florentina  Santos', 'florecitasantos.jones@gmail.com', '8999443052'),
(1389, 284, 30, 40, 169, 'SIN-USAR', 'Florentina  Santos', 'florecitasantos.jones@gmail.com', '8999443052'),
(1390, 284, 30, 40, 170, 'SIN-USAR', 'Florentina  Santos', 'florecitasantos.jones@gmail.com', '8999443052'),
(1391, 284, 30, 40, 171, 'SIN-USAR', 'Florentina  Santos', 'florecitasantos.jones@gmail.com', '8999443052'),
(1392, 284, 30, 40, 172, 'SIN-USAR', 'Florentina  Santos', 'florecitasantos.jones@gmail.com', '8999443052'),
(1393, 284, 30, 40, 173, 'SIN-USAR', 'Florentina  Santos', 'florecitasantos.jones@gmail.com', '8999443052'),
(1394, 284, 30, 40, 133, 'SIN-USAR', 'Florentina  Santos', 'florecitasantos.jones@gmail.com', '8999443052'),
(1395, 284, 30, 40, 134, 'SIN-USAR', 'Florentina  Santos', 'florecitasantos.jones@gmail.com', '8999443052'),
(1396, 284, 30, 40, 135, 'SIN-USAR', 'Florentina  Santos', 'florecitasantos.jones@gmail.com', '8999443052'),
(1397, 284, 30, 40, 174, 'SIN-USAR', 'Florentina  Santos', 'florecitasantos.jones@gmail.com', '8999443052'),
(1398, 285, 30, 40, 100, 'SIN-USAR', 'Vero Gallegos', '5038vero@gmail.com', '8993073371'),
(1399, 285, 30, 40, 101, 'SIN-USAR', 'Vero Gallegos', '5038vero@gmail.com', '8993073371'),
(1400, 285, 30, 40, 102, 'SIN-USAR', 'Vero Gallegos', '5038vero@gmail.com', '8993073371'),
(1401, 285, 30, 40, 103, 'SIN-USAR', 'Vero Gallegos', '5038vero@gmail.com', '8993073371'),
(1402, 285, 30, 40, 363, 'SIN-USAR', 'Vero Gallegos', '5038vero@gmail.com', '8993073371'),
(1403, 286, 30, 40, 43, 'SIN-USAR', 'Vero Gallegos', '5038vero@gmail.com', '8993073371'),
(1404, 287, 30, 40, 42, 'SIN-USAR', 'Ethel Ramirez', 'draethelrmz@hotmail.com', '8999442345'),
(1405, 287, 30, 40, 136, 'SIN-USAR', 'Ethel Ramirez', 'draethelrmz@hotmail.com', '8999442345');
INSERT INTO `boleto` (`idBoleto`, `idCompra`, `idEvento`, `idFuncion`, `idAsiento`, `estadoBoleto`, `nombreCliente`, `emailCliente`, `telefonoCliente`) VALUES
(1406, 287, 30, 40, 137, 'SIN-USAR', 'Ethel Ramirez', 'draethelrmz@hotmail.com', '8999442345'),
(1407, 288, 30, 39, 31, 'SIN-USAR', 'Ethel Ramirez', 'draethelrmz@hotmail.com', '8999442345'),
(1408, 288, 30, 39, 32, 'SIN-USAR', 'Ethel Ramirez', 'draethelrmz@hotmail.com', '8999442345'),
(1409, 288, 30, 39, 33, 'SIN-USAR', 'Ethel Ramirez', 'draethelrmz@hotmail.com', '8999442345'),
(1410, 288, 30, 39, 34, 'SIN-USAR', 'Ethel Ramirez', 'draethelrmz@hotmail.com', '8999442345'),
(1411, 288, 30, 39, 35, 'SIN-USAR', 'Ethel Ramirez', 'draethelrmz@hotmail.com', '8999442345'),
(1412, 289, 30, 40, 23, 'SIN-USAR', 'Mayra Juarez', 'mayra_0186@hotmail.com', '8991126581'),
(1413, 289, 30, 40, 22, 'SIN-USAR', 'Mayra Juarez', 'mayra_0186@hotmail.com', '8991126581'),
(1414, 289, 30, 40, 21, 'SIN-USAR', 'Mayra Juarez', 'mayra_0186@hotmail.com', '8991126581'),
(1415, 289, 30, 40, 679, 'SIN-USAR', 'Mayra Juarez', 'mayra_0186@hotmail.com', '8991126581'),
(1416, 289, 30, 40, 680, 'SIN-USAR', 'Mayra Juarez', 'mayra_0186@hotmail.com', '8991126581'),
(1417, 289, 30, 40, 681, 'SIN-USAR', 'Mayra Juarez', 'mayra_0186@hotmail.com', '8991126581'),
(1418, 289, 30, 40, 682, 'SIN-USAR', 'Mayra Juarez', 'mayra_0186@hotmail.com', '8991126581'),
(1419, 289, 30, 40, 683, 'SIN-USAR', 'Mayra Juarez', 'mayra_0186@hotmail.com', '8991126581'),
(1420, 289, 30, 40, 684, 'SIN-USAR', 'Mayra Juarez', 'mayra_0186@hotmail.com', '8991126581'),
(1421, 289, 30, 40, 685, 'SIN-USAR', 'Mayra Juarez', 'mayra_0186@hotmail.com', '8991126581'),
(1422, 290, 30, 39, 79, 'SIN-USAR', 'Mayra Juarez', 'mayra_0186@hotmail.com', '8991126581'),
(1423, 290, 30, 39, 80, 'SIN-USAR', 'Mayra Juarez', 'mayra_0186@hotmail.com', '8991126581'),
(1424, 290, 30, 39, 81, 'SIN-USAR', 'Mayra Juarez', 'mayra_0186@hotmail.com', '8991126581'),
(1425, 290, 30, 39, 82, 'SIN-USAR', 'Mayra Juarez', 'mayra_0186@hotmail.com', '8991126581'),
(1426, 290, 30, 39, 83, 'SIN-USAR', 'Mayra Juarez', 'mayra_0186@hotmail.com', '8991126581'),
(1427, 291, 30, 39, 278, 'SIN-USAR', 'Vero Alvarado', 'veriiito-alvarado@hotmail.com', '8991227543'),
(1428, 291, 30, 39, 279, 'SIN-USAR', 'Vero Alvarado', 'veriiito-alvarado@hotmail.com', '8991227543'),
(1429, 291, 30, 39, 280, 'SIN-USAR', 'Vero Alvarado', 'veriiito-alvarado@hotmail.com', '8991227543'),
(1430, 291, 30, 39, 281, 'SIN-USAR', 'Vero Alvarado', 'veriiito-alvarado@hotmail.com', '8991227543'),
(1431, 292, 30, 40, 641, 'SIN-USAR', 'Adriana Camacho', 'adsofia@hotmail.com', '8992854519'),
(1432, 292, 30, 40, 642, 'SIN-USAR', 'Adriana Camacho', 'adsofia@hotmail.com', '8992854519'),
(1433, 292, 30, 40, 643, 'SIN-USAR', 'Adriana Camacho', 'adsofia@hotmail.com', '8992854519'),
(1434, 292, 30, 40, 644, 'SIN-USAR', 'Adriana Camacho', 'adsofia@hotmail.com', '8992854519'),
(1435, 292, 30, 40, 645, 'SIN-USAR', 'Adriana Camacho', 'adsofia@hotmail.com', '8992854519'),
(1436, 292, 30, 40, 646, 'SIN-USAR', 'Adriana Camacho', 'adsofia@hotmail.com', '8992854519'),
(1437, 292, 30, 40, 647, 'SIN-USAR', 'Adriana Camacho', 'adsofia@hotmail.com', '8992854519'),
(1438, 292, 30, 40, 648, 'SIN-USAR', 'Adriana Camacho', 'adsofia@hotmail.com', '8992854519'),
(1439, 292, 30, 40, 649, 'SIN-USAR', 'Adriana Camacho', 'adsofia@hotmail.com', '8992854519'),
(1440, 292, 30, 40, 650, 'SIN-USAR', 'Adriana Camacho', 'adsofia@hotmail.com', '8992854519'),
(1441, 293, 30, 40, 669, 'SIN-USAR', 'Mariel Lopez', 'msla1206@gmail.com', '8999118526'),
(1442, 293, 30, 40, 670, 'SIN-USAR', 'Mariel Lopez', 'msla1206@gmail.com', '8999118526'),
(1443, 293, 30, 40, 671, 'SIN-USAR', 'Mariel Lopez', 'msla1206@gmail.com', '8999118526'),
(1444, 293, 30, 40, 672, 'SIN-USAR', 'Mariel Lopez', 'msla1206@gmail.com', '8999118526'),
(1445, 293, 30, 40, 673, 'SIN-USAR', 'Mariel Lopez', 'msla1206@gmail.com', '8999118526'),
(1446, 293, 30, 40, 674, 'SIN-USAR', 'Mariel Lopez', 'msla1206@gmail.com', '8999118526'),
(1447, 293, 30, 40, 675, 'SIN-USAR', 'Mariel Lopez', 'msla1206@gmail.com', '8999118526'),
(1448, 293, 30, 40, 676, 'SIN-USAR', 'Mariel Lopez', 'msla1206@gmail.com', '8999118526'),
(1449, 293, 30, 40, 677, 'SIN-USAR', 'Mariel Lopez', 'msla1206@gmail.com', '8999118526'),
(1450, 293, 30, 40, 678, 'SIN-USAR', 'Mariel Lopez', 'msla1206@gmail.com', '8999118526'),
(1451, 294, 30, 39, 121, 'SIN-USAR', 'Mariel Lopez', 'msla1206@gmail.com', '8999118526'),
(1452, 295, 30, 39, 328, 'SIN-USAR', 'Alma Fayett', 'almafayett@hotmail.com', '89935779327'),
(1453, 295, 30, 39, 329, 'SIN-USAR', 'Alma Fayett', 'almafayett@hotmail.com', '89935779327'),
(1454, 296, 30, 39, 64, 'SIN-USAR', 'Karen Quintanilla', 'karen_quintanilla@hotmail.com', '8999596512'),
(1455, 296, 30, 39, 63, 'SIN-USAR', 'Karen Quintanilla', 'karen_quintanilla@hotmail.com', '8999596512'),
(1466, 298, 30, 39, 36, 'SIN-USAR', 'Ethel Ramirez', 'draethelrmz@hotmail.com', '8999442345'),
(1467, 299, 30, 40, 256, 'SIN-USAR', 'Juany Montes', 'diosy5juanes@hotmail.com', '8998711127'),
(1468, 299, 30, 40, 257, 'SIN-USAR', 'Juany Montes', 'diosy5juanes@hotmail.com', '8998711127'),
(1469, 299, 30, 40, 258, 'SIN-USAR', 'Juany Montes', 'diosy5juanes@hotmail.com', '8998711127'),
(1470, 299, 30, 40, 259, 'SIN-USAR', 'Juany Montes', 'diosy5juanes@hotmail.com', '8998711127'),
(1471, 299, 30, 40, 260, 'SIN-USAR', 'Juany Montes', 'diosy5juanes@hotmail.com', '8998711127'),
(1472, 299, 30, 40, 261, 'SIN-USAR', 'Juany Montes', 'diosy5juanes@hotmail.com', '8998711127'),
(1473, 299, 30, 40, 262, 'SIN-USAR', 'Juany Montes', 'diosy5juanes@hotmail.com', '8998711127'),
(1474, 299, 30, 40, 263, 'SIN-USAR', 'Juany Montes', 'diosy5juanes@hotmail.com', '8998711127'),
(1475, 299, 30, 40, 264, 'SIN-USAR', 'Juany Montes', 'diosy5juanes@hotmail.com', '8998711127'),
(1476, 299, 30, 40, 265, 'SIN-USAR', 'Juany Montes', 'diosy5juanes@hotmail.com', '8998711127'),
(1477, 300, 30, 40, 138, 'SIN-USAR', 'Adriana Perez', 'sylvia_roldan@hotmail.com', '8999560673'),
(1478, 300, 30, 40, 139, 'SIN-USAR', 'Adriana Perez', 'sylvia_roldan@hotmail.com', '8999560673'),
(1479, 300, 30, 40, 140, 'SIN-USAR', 'Adriana Perez', 'sylvia_roldan@hotmail.com', '8999560673'),
(1480, 301, 30, 39, 342, 'SIN-USAR', 'Elida Barbosa', 'elypower@hotmail.com', '8999362669'),
(1481, 301, 30, 39, 343, 'SIN-USAR', 'Elida Barbosa', 'elypower@hotmail.com', '8999362669'),
(1482, 301, 30, 39, 344, 'SIN-USAR', 'Elida Barbosa', 'elypower@hotmail.com', '8999362669'),
(1483, 301, 30, 39, 345, 'SIN-USAR', 'Elida Barbosa', 'elypower@hotmail.com', '8999362669'),
(1484, 302, 30, 39, 256, 'SIN-USAR', 'Ruth cortez', 'ruthcdes@gmail.com', '8998711687'),
(1485, 302, 30, 39, 257, 'SIN-USAR', 'Ruth cortez', 'ruthcdes@gmail.com', '8998711687'),
(1486, 302, 30, 39, 258, 'SIN-USAR', 'Ruth cortez', 'ruthcdes@gmail.com', '8998711687'),
(1487, 302, 30, 39, 259, 'SIN-USAR', 'Ruth cortez', 'ruthcdes@gmail.com', '8998711687'),
(1488, 302, 30, 39, 260, 'SIN-USAR', 'Ruth cortez', 'ruthcdes@gmail.com', '8998711687'),
(1489, 302, 30, 39, 262, 'SIN-USAR', 'Ruth cortez', 'ruthcdes@gmail.com', '8998711687'),
(1490, 302, 30, 39, 263, 'SIN-USAR', 'Ruth cortez', 'ruthcdes@gmail.com', '8998711687'),
(1491, 302, 30, 39, 264, 'SIN-USAR', 'Ruth cortez', 'ruthcdes@gmail.com', '8998711687'),
(1492, 302, 30, 39, 265, 'SIN-USAR', 'Ruth cortez', 'ruthcdes@gmail.com', '8998711687'),
(1493, 302, 30, 39, 266, 'SIN-USAR', 'Ruth cortez', 'ruthcdes@gmail.com', '8998711687'),
(1494, 302, 30, 39, 267, 'SIN-USAR', 'Ruth cortez', 'ruthcdes@gmail.com', '8998711687'),
(1495, 302, 30, 39, 268, 'SIN-USAR', 'Ruth cortez', 'ruthcdes@gmail.com', '8998711687'),
(1496, 302, 30, 39, 261, 'SIN-USAR', 'Ruth cortez', 'ruthcdes@gmail.com', '8998711687'),
(1497, 302, 30, 39, 300, 'SIN-USAR', 'Ruth cortez', 'ruthcdes@gmail.com', '8998711687'),
(1498, 302, 30, 39, 301, 'SIN-USAR', 'Ruth cortez', 'ruthcdes@gmail.com', '8998711687'),
(1499, 302, 30, 39, 302, 'SIN-USAR', 'Ruth cortez', 'ruthcdes@gmail.com', '8998711687'),
(1500, 302, 30, 39, 303, 'SIN-USAR', 'Ruth cortez', 'ruthcdes@gmail.com', '8998711687'),
(1501, 302, 30, 39, 304, 'SIN-USAR', 'Ruth cortez', 'ruthcdes@gmail.com', '8998711687'),
(1502, 302, 30, 39, 305, 'SIN-USAR', 'Ruth cortez', 'ruthcdes@gmail.com', '8998711687'),
(1503, 302, 30, 39, 306, 'SIN-USAR', 'Ruth cortez', 'ruthcdes@gmail.com', '8998711687'),
(1504, 302, 30, 39, 307, 'SIN-USAR', 'Ruth cortez', 'ruthcdes@gmail.com', '8998711687'),
(1505, 302, 30, 39, 308, 'SIN-USAR', 'Ruth cortez', 'ruthcdes@gmail.com', '8998711687'),
(1506, 302, 30, 39, 309, 'SIN-USAR', 'Ruth cortez', 'ruthcdes@gmail.com', '8998711687'),
(1507, 302, 30, 39, 310, 'SIN-USAR', 'Ruth cortez', 'ruthcdes@gmail.com', '8998711687'),
(1508, 302, 30, 39, 311, 'SIN-USAR', 'Ruth cortez', 'ruthcdes@gmail.com', '8998711687'),
(1509, 302, 30, 39, 312, 'SIN-USAR', 'Ruth cortez', 'ruthcdes@gmail.com', '8998711687'),
(1510, 302, 30, 39, 313, 'SIN-USAR', 'Ruth cortez', 'ruthcdes@gmail.com', '8998711687'),
(1511, 302, 30, 39, 359, 'SIN-USAR', 'Ruth cortez', 'ruthcdes@gmail.com', '8998711687'),
(1512, 302, 30, 39, 358, 'SIN-USAR', 'Ruth cortez', 'ruthcdes@gmail.com', '8998711687'),
(1513, 302, 30, 39, 357, 'SIN-USAR', 'Ruth cortez', 'ruthcdes@gmail.com', '8998711687'),
(1514, 302, 30, 39, 356, 'SIN-USAR', 'Ruth cortez', 'ruthcdes@gmail.com', '8998711687'),
(1515, 302, 30, 39, 355, 'SIN-USAR', 'Ruth cortez', 'ruthcdes@gmail.com', '8998711687'),
(1516, 302, 30, 39, 354, 'SIN-USAR', 'Ruth cortez', 'ruthcdes@gmail.com', '8998711687'),
(1517, 302, 30, 39, 353, 'SIN-USAR', 'Ruth cortez', 'ruthcdes@gmail.com', '8998711687'),
(1518, 302, 30, 39, 352, 'SIN-USAR', 'Ruth cortez', 'ruthcdes@gmail.com', '8998711687'),
(1519, 302, 30, 39, 351, 'SIN-USAR', 'Ruth cortez', 'ruthcdes@gmail.com', '8998711687'),
(1520, 302, 30, 39, 350, 'SIN-USAR', 'Ruth cortez', 'ruthcdes@gmail.com', '8998711687'),
(1521, 302, 30, 39, 349, 'SIN-USAR', 'Ruth cortez', 'ruthcdes@gmail.com', '8998711687'),
(1522, 302, 30, 39, 348, 'SIN-USAR', 'Ruth cortez', 'ruthcdes@gmail.com', '8998711687'),
(1523, 302, 30, 39, 347, 'SIN-USAR', 'Ruth cortez', 'ruthcdes@gmail.com', '8998711687'),
(1524, 302, 30, 39, 346, 'SIN-USAR', 'Ruth cortez', 'ruthcdes@gmail.com', '8998711687'),
(1525, 302, 30, 39, 405, 'SIN-USAR', 'Ruth cortez', 'ruthcdes@gmail.com', '8998711687'),
(1526, 303, 30, 39, 162, 'SIN-USAR', 'Lulu Guarneros', 'lguarnerosalatorre@gmail.com', '8992386924'),
(1527, 303, 30, 39, 163, 'SIN-USAR', 'Lulu Guarneros', 'lguarnerosalatorre@gmail.com', '8992386924'),
(1528, 303, 30, 39, 164, 'SIN-USAR', 'Lulu Guarneros', 'lguarnerosalatorre@gmail.com', '8992386924'),
(1529, 303, 30, 39, 165, 'SIN-USAR', 'Lulu Guarneros', 'lguarnerosalatorre@gmail.com', '8992386924'),
(1530, 304, 30, 39, 381, 'SIN-USAR', 'Sanjuanita Hernandez', 'sanjuis_hdz@hotmail.com', '8991307402'),
(1531, 304, 30, 39, 382, 'SIN-USAR', 'Sanjuanita Hernandez', 'sanjuis_hdz@hotmail.com', '8991307402'),
(1532, 304, 30, 39, 383, 'SIN-USAR', 'Sanjuanita Hernandez', 'sanjuis_hdz@hotmail.com', '8991307402'),
(1533, 304, 30, 39, 384, 'SIN-USAR', 'Sanjuanita Hernandez', 'sanjuis_hdz@hotmail.com', '8991307402'),
(1534, 304, 30, 39, 385, 'SIN-USAR', 'Sanjuanita Hernandez', 'sanjuis_hdz@hotmail.com', '8991307402'),
(1535, 304, 30, 39, 386, 'SIN-USAR', 'Sanjuanita Hernandez', 'sanjuis_hdz@hotmail.com', '8991307402'),
(1536, 304, 30, 39, 387, 'SIN-USAR', 'Sanjuanita Hernandez', 'sanjuis_hdz@hotmail.com', '8991307402'),
(1537, 304, 30, 39, 388, 'SIN-USAR', 'Sanjuanita Hernandez', 'sanjuis_hdz@hotmail.com', '8991307402'),
(1538, 305, 30, 39, 237, 'SIN-USAR', 'Martha Garza', 'martha.garza@cobat.edu.mx', '8991600836'),
(1539, 306, 30, 39, 291, 'SIN-USAR', 'Martha Garza', 'martha.garza@cobat.edu.mx', '8991600836'),
(1540, 306, 30, 39, 292, 'SIN-USAR', 'Martha Garza', 'martha.garza@cobat.edu.mx', '8991600836'),
(1541, 306, 30, 39, 293, 'SIN-USAR', 'Martha Garza', 'martha.garza@cobat.edu.mx', '8991600836'),
(1542, 306, 30, 39, 294, 'SIN-USAR', 'Martha Garza', 'martha.garza@cobat.edu.mx', '8991600836'),
(1543, 306, 30, 39, 295, 'SIN-USAR', 'Martha Garza', 'martha.garza@cobat.edu.mx', '8991600836'),
(1544, 306, 30, 39, 296, 'SIN-USAR', 'Martha Garza', 'martha.garza@cobat.edu.mx', '8991600836'),
(1545, 306, 30, 39, 297, 'SIN-USAR', 'Martha Garza', 'martha.garza@cobat.edu.mx', '8991600836'),
(1546, 306, 30, 39, 298, 'SIN-USAR', 'Martha Garza', 'martha.garza@cobat.edu.mx', '8991600836'),
(1547, 306, 30, 39, 299, 'SIN-USAR', 'Martha Garza', 'martha.garza@cobat.edu.mx', '8991600836'),
(1548, 307, 30, 39, 420, 'SIN-USAR', 'CENY  Villarreal ', 'ceny14@hotmail.com', '8999361478'),
(1549, 307, 30, 39, 421, 'SIN-USAR', 'CENY  Villarreal ', 'ceny14@hotmail.com', '8999361478'),
(1550, 307, 30, 39, 422, 'SIN-USAR', 'CENY  Villarreal ', 'ceny14@hotmail.com', '8999361478'),
(1551, 307, 30, 39, 423, 'SIN-USAR', 'CENY  Villarreal ', 'ceny14@hotmail.com', '8999361478'),
(1552, 307, 30, 39, 424, 'SIN-USAR', 'CENY  Villarreal ', 'ceny14@hotmail.com', '8999361478'),
(1553, 307, 30, 39, 425, 'SIN-USAR', 'CENY  Villarreal ', 'ceny14@hotmail.com', '8999361478'),
(1554, 308, 30, 40, 712, 'SIN-USAR', 'Rocio Aleman ', 'miguel070709@hotmail.com', '8993009066'),
(1555, 308, 30, 40, 713, 'SIN-USAR', 'Rocio Aleman ', 'miguel070709@hotmail.com', '8993009066'),
(1556, 308, 30, 40, 714, 'SIN-USAR', 'Rocio Aleman ', 'miguel070709@hotmail.com', '8993009066'),
(1557, 308, 30, 40, 715, 'SIN-USAR', 'Rocio Aleman ', 'miguel070709@hotmail.com', '8993009066'),
(1558, 308, 30, 40, 716, 'SIN-USAR', 'Rocio Aleman ', 'miguel070709@hotmail.com', '8993009066'),
(1559, 308, 30, 40, 717, 'SIN-USAR', 'Rocio Aleman ', 'miguel070709@hotmail.com', '8993009066'),
(1560, 308, 30, 40, 718, 'SIN-USAR', 'Rocio Aleman ', 'miguel070709@hotmail.com', '8993009066'),
(1561, 308, 30, 40, 719, 'SIN-USAR', 'Rocio Aleman ', 'miguel070709@hotmail.com', '8993009066'),
(1582, 311, 30, 39, 375, 'SIN-USAR', 'Blanca Moctezuma', 'abiliz08@hotmail.com', '8998724614'),
(1583, 311, 30, 39, 376, 'SIN-USAR', 'Blanca Moctezuma', 'abiliz08@hotmail.com', '8998724614'),
(1584, 311, 30, 39, 377, 'SIN-USAR', 'Blanca Moctezuma', 'abiliz08@hotmail.com', '8998724614'),
(1585, 311, 30, 39, 378, 'SIN-USAR', 'Blanca Moctezuma', 'abiliz08@hotmail.com', '8998724614'),
(1586, 311, 30, 39, 380, 'SIN-USAR', 'Blanca Moctezuma', 'abiliz08@hotmail.com', '8998724614'),
(1587, 311, 30, 39, 379, 'SIN-USAR', 'Blanca Moctezuma', 'abiliz08@hotmail.com', '8998724614'),
(1600, 314, 30, 39, 236, 'SIN-USAR', 'Zayra Hernandez', 'yunmat04@gmail.com', '8999442321'),
(1601, 314, 30, 39, 235, 'SIN-USAR', 'Zayra Hernandez', 'yunmat04@gmail.com', '8999442321'),
(1602, 314, 30, 39, 234, 'SIN-USAR', 'Zayra Hernandez', 'yunmat04@gmail.com', '8999442321'),
(1603, 315, 30, 40, 175, 'SIN-USAR', 'Rubi Padilla', 'abg_245@hotmail.com', '8991873384'),
(1604, 315, 30, 40, 176, 'SIN-USAR', 'Rubi Padilla', 'abg_245@hotmail.com', '8991873384'),
(1605, 316, 30, 40, 284, 'SIN-USAR', 'Rubi Padilla', 'abg_245@hotmail.com', '8991873384'),
(1606, 316, 30, 40, 285, 'SIN-USAR', 'Rubi Padilla', 'abg_245@hotmail.com', '8991873384'),
(1607, 316, 30, 40, 286, 'SIN-USAR', 'Rubi Padilla', 'abg_245@hotmail.com', '8991873384'),
(1608, 316, 30, 40, 287, 'SIN-USAR', 'Rubi Padilla', 'abg_245@hotmail.com', '8991873384'),
(1609, 316, 30, 40, 288, 'SIN-USAR', 'Rubi Padilla', 'abg_245@hotmail.com', '8991873384'),
(1610, 316, 30, 40, 289, 'SIN-USAR', 'Rubi Padilla', 'abg_245@hotmail.com', '8991873384'),
(1611, 316, 30, 40, 290, 'SIN-USAR', 'Rubi Padilla', 'abg_245@hotmail.com', '8991873384'),
(1612, 316, 30, 40, 291, 'SIN-USAR', 'Rubi Padilla', 'abg_245@hotmail.com', '8991873384'),
(1613, 316, 30, 40, 292, 'SIN-USAR', 'Rubi Padilla', 'abg_245@hotmail.com', '8991873384'),
(1614, 317, 30, 40, 12, 'SIN-USAR', 'Jaqueline Espinoza', 'yaquie.espinoza77@hotmail.com', '8911080455'),
(1615, 317, 30, 40, 13, 'SIN-USAR', 'Jaqueline Espinoza', 'yaquie.espinoza77@hotmail.com', '8911080455'),
(1616, 317, 30, 40, 14, 'SIN-USAR', 'Jaqueline Espinoza', 'yaquie.espinoza77@hotmail.com', '8911080455'),
(1617, 317, 30, 40, 15, 'SIN-USAR', 'Jaqueline Espinoza', 'yaquie.espinoza77@hotmail.com', '8911080455'),
(1618, 317, 30, 40, 16, 'SIN-USAR', 'Jaqueline Espinoza', 'yaquie.espinoza77@hotmail.com', '8911080455'),
(1619, 318, 30, 40, 762, 'SIN-USAR', 'Elizabeth Lopez', 'betylopez80@gmail.com', '8991094501'),
(1620, 318, 30, 40, 763, 'SIN-USAR', 'Elizabeth Lopez', 'betylopez80@gmail.com', '8991094501'),
(1621, 318, 30, 40, 764, 'SIN-USAR', 'Elizabeth Lopez', 'betylopez80@gmail.com', '8991094501'),
(1622, 318, 30, 40, 765, 'SIN-USAR', 'Elizabeth Lopez', 'betylopez80@gmail.com', '8991094501'),
(1623, 318, 30, 40, 766, 'SIN-USAR', 'Elizabeth Lopez', 'betylopez80@gmail.com', '8991094501'),
(1624, 318, 30, 40, 767, 'SIN-USAR', 'Elizabeth Lopez', 'betylopez80@gmail.com', '8991094501'),
(1625, 318, 30, 40, 768, 'SIN-USAR', 'Elizabeth Lopez', 'betylopez80@gmail.com', '8991094501'),
(1626, 318, 30, 40, 769, 'SIN-USAR', 'Elizabeth Lopez', 'betylopez80@gmail.com', '8991094501'),
(1627, 318, 30, 40, 770, 'SIN-USAR', 'Elizabeth Lopez', 'betylopez80@gmail.com', '8991094501'),
(1628, 318, 30, 40, 771, 'SIN-USAR', 'Elizabeth Lopez', 'betylopez80@gmail.com', '8991094501'),
(1629, 319, 30, 40, 496, 'SIN-USAR', 'Bertha Duenas', 'berthaduenasirca@gmail.com', '8999595738'),
(1630, 319, 30, 40, 497, 'SIN-USAR', 'Bertha Duenas', 'berthaduenasirca@gmail.com', '8999595738'),
(1631, 319, 30, 40, 498, 'SIN-USAR', 'Bertha Duenas', 'berthaduenasirca@gmail.com', '8999595738'),
(1632, 319, 30, 40, 1183, 'SIN-USAR', 'Bertha Duenas', 'berthaduenasirca@gmail.com', '8999595738'),
(1633, 320, 30, 40, 79, 'SIN-USAR', 'Jaqueline Robledo', 'delangel_54@hotmail.com', '8991018910'),
(1634, 320, 30, 40, 80, 'SIN-USAR', 'Jaqueline Robledo', 'delangel_54@hotmail.com', '8991018910'),
(1635, 320, 30, 40, 81, 'SIN-USAR', 'Jaqueline Robledo', 'delangel_54@hotmail.com', '8991018910'),
(1636, 320, 30, 40, 82, 'SIN-USAR', 'Jaqueline Robledo', 'delangel_54@hotmail.com', '8991018910'),
(1637, 320, 30, 40, 83, 'SIN-USAR', 'Jaqueline Robledo', 'delangel_54@hotmail.com', '8991018910'),
(1638, 320, 30, 40, 84, 'SIN-USAR', 'Jaqueline Robledo', 'delangel_54@hotmail.com', '8991018910'),
(1639, 320, 30, 40, 85, 'SIN-USAR', 'Jaqueline Robledo', 'delangel_54@hotmail.com', '8991018910'),
(1640, 320, 30, 40, 86, 'SIN-USAR', 'Jaqueline Robledo', 'delangel_54@hotmail.com', '8991018910'),
(1641, 320, 30, 40, 87, 'SIN-USAR', 'Jaqueline Robledo', 'delangel_54@hotmail.com', '8991018910'),
(1642, 320, 30, 40, 88, 'SIN-USAR', 'Jaqueline Robledo', 'delangel_54@hotmail.com', '8991018910'),
(1643, 321, 30, 40, 267, 'SIN-USAR', 'Alexa Yanez', 'alexa_yh@hotmail.com', '8999362321'),
(1644, 321, 30, 40, 268, 'SIN-USAR', 'Alexa Yanez', 'alexa_yh@hotmail.com', '8999362321'),
(1645, 321, 30, 40, 180, 'SIN-USAR', 'Alexa Yanez', 'alexa_yh@hotmail.com', '8999362321'),
(1646, 321, 30, 40, 179, 'SIN-USAR', 'Alexa Yanez', 'alexa_yh@hotmail.com', '8999362321'),
(1647, 321, 30, 40, 178, 'SIN-USAR', 'Alexa Yanez', 'alexa_yh@hotmail.com', '8999362321'),
(1648, 321, 30, 40, 177, 'SIN-USAR', 'Alexa Yanez', 'alexa_yh@hotmail.com', '8999362321'),
(1649, 322, 30, 39, 438, 'SIN-USAR', 'Vero Gallegos', '5038vero@gmail.com', '8993073371'),
(1650, 322, 30, 39, 437, 'SIN-USAR', 'Vero Gallegos', '5038vero@gmail.com', '8993073371'),
(1651, 322, 30, 39, 436, 'SIN-USAR', 'Vero Gallegos', '5038vero@gmail.com', '8993073371'),
(1652, 322, 30, 39, 435, 'SIN-USAR', 'Vero Gallegos', '5038vero@gmail.com', '8993073371'),
(1653, 322, 30, 39, 434, 'SIN-USAR', 'Vero Gallegos', '5038vero@gmail.com', '8993073371'),
(1654, 322, 30, 39, 433, 'SIN-USAR', 'Vero Gallegos', '5038vero@gmail.com', '8993073371'),
(1655, 322, 30, 39, 432, 'SIN-USAR', 'Vero Gallegos', '5038vero@gmail.com', '8993073371'),
(1656, 322, 30, 39, 431, 'SIN-USAR', 'Vero Gallegos', '5038vero@gmail.com', '8993073371'),
(1657, 322, 30, 39, 430, 'SIN-USAR', 'Vero Gallegos', '5038vero@gmail.com', '8993073371'),
(1658, 323, 30, 40, 626, 'SIN-USAR', 'Yoselin  Delgado', 'yoselindelgado252@gmail.com', '8994593026'),
(1659, 323, 30, 40, 627, 'SIN-USAR', 'Yoselin  Delgado', 'yoselindelgado252@gmail.com', '8994593026'),
(1660, 323, 30, 40, 628, 'SIN-USAR', 'Yoselin  Delgado', 'yoselindelgado252@gmail.com', '8994593026'),
(1661, 323, 30, 40, 629, 'SIN-USAR', 'Yoselin  Delgado', 'yoselindelgado252@gmail.com', '8994593026'),
(1662, 323, 30, 40, 630, 'SIN-USAR', 'Yoselin  Delgado', 'yoselindelgado252@gmail.com', '8994593026'),
(1663, 323, 30, 40, 631, 'SIN-USAR', 'Yoselin  Delgado', 'yoselindelgado252@gmail.com', '8994593026'),
(1664, 323, 30, 40, 632, 'SIN-USAR', 'Yoselin  Delgado', 'yoselindelgado252@gmail.com', '8994593026'),
(1665, 323, 30, 40, 633, 'SIN-USAR', 'Yoselin  Delgado', 'yoselindelgado252@gmail.com', '8994593026'),
(1666, 323, 30, 40, 585, 'SIN-USAR', 'Yoselin  Delgado', 'yoselindelgado252@gmail.com', '8994593026'),
(1667, 323, 30, 40, 586, 'SIN-USAR', 'Yoselin  Delgado', 'yoselindelgado252@gmail.com', '8994593026'),
(1668, 324, 30, 40, 926, 'SIN-USAR', 'Jaqueline Robledo', 'delangel_54@hotmail.com', '8991018910'),
(1669, 324, 30, 40, 927, 'SIN-USAR', 'Jaqueline Robledo', 'delangel_54@hotmail.com', '8991018910'),
(1670, 324, 30, 40, 928, 'SIN-USAR', 'Jaqueline Robledo', 'delangel_54@hotmail.com', '8991018910'),
(1671, 324, 30, 40, 929, 'SIN-USAR', 'Jaqueline Robledo', 'delangel_54@hotmail.com', '8991018910'),
(1672, 324, 30, 40, 930, 'SIN-USAR', 'Jaqueline Robledo', 'delangel_54@hotmail.com', '8991018910'),
(1673, 324, 30, 40, 931, 'SIN-USAR', 'Jaqueline Robledo', 'delangel_54@hotmail.com', '8991018910'),
(1684, 326, 30, 40, 850, 'SIN-USAR', 'Graciela Moran', 'graciela_io@hotmail.com', '8341485214'),
(1685, 326, 30, 40, 851, 'SIN-USAR', 'Graciela Moran', 'graciela_io@hotmail.com', '8341485214'),
(1686, 326, 30, 40, 852, 'SIN-USAR', 'Graciela Moran', 'graciela_io@hotmail.com', '8341485214'),
(1687, 326, 30, 40, 853, 'SIN-USAR', 'Graciela Moran', 'graciela_io@hotmail.com', '8341485214'),
(1688, 327, 30, 40, 755, 'SIN-USAR', 'Cesar Perez', 'cesarp5537902@gmail.com', '8995428042'),
(1689, 327, 30, 40, 756, 'SIN-USAR', 'Cesar Perez', 'cesarp5537902@gmail.com', '8995428042'),
(1690, 327, 30, 40, 757, 'SIN-USAR', 'Cesar Perez', 'cesarp5537902@gmail.com', '8995428042'),
(1691, 328, 30, 40, 725, 'SIN-USAR', 'Sarahi Martinez', 'qfb_mt12@hotmail.com', '8992359915'),
(1692, 328, 30, 40, 726, 'SIN-USAR', 'Sarahi Martinez', 'qfb_mt12@hotmail.com', '8992359915'),
(1693, 328, 30, 40, 727, 'SIN-USAR', 'Sarahi Martinez', 'qfb_mt12@hotmail.com', '8992359915'),
(1694, 328, 30, 40, 728, 'SIN-USAR', 'Sarahi Martinez', 'qfb_mt12@hotmail.com', '8992359915'),
(1695, 328, 30, 40, 729, 'SIN-USAR', 'Sarahi Martinez', 'qfb_mt12@hotmail.com', '8992359915'),
(1696, 328, 30, 40, 730, 'SIN-USAR', 'Sarahi Martinez', 'qfb_mt12@hotmail.com', '8992359915'),
(1697, 328, 30, 40, 731, 'SIN-USAR', 'Sarahi Martinez', 'qfb_mt12@hotmail.com', '8992359915'),
(1698, 328, 30, 40, 732, 'SIN-USAR', 'Sarahi Martinez', 'qfb_mt12@hotmail.com', '8992359915'),
(1699, 328, 30, 40, 733, 'SIN-USAR', 'Sarahi Martinez', 'qfb_mt12@hotmail.com', '8992359915'),
(1700, 328, 30, 40, 734, 'SIN-USAR', 'Sarahi Martinez', 'qfb_mt12@hotmail.com', '8992359915'),
(1701, 329, 30, 40, 745, 'SIN-USAR', 'Fernanda Lozano', 'fernanda.camarena2000@gmail.com', '8993218111'),
(1702, 329, 30, 40, 746, 'SIN-USAR', 'Fernanda Lozano', 'fernanda.camarena2000@gmail.com', '8993218111'),
(1703, 329, 30, 40, 747, 'SIN-USAR', 'Fernanda Lozano', 'fernanda.camarena2000@gmail.com', '8993218111'),
(1704, 329, 30, 40, 748, 'SIN-USAR', 'Fernanda Lozano', 'fernanda.camarena2000@gmail.com', '8993218111'),
(1705, 329, 30, 40, 749, 'SIN-USAR', 'Fernanda Lozano', 'fernanda.camarena2000@gmail.com', '8993218111'),
(1706, 329, 30, 40, 750, 'SIN-USAR', 'Fernanda Lozano', 'fernanda.camarena2000@gmail.com', '8993218111'),
(1707, 329, 30, 40, 751, 'SIN-USAR', 'Fernanda Lozano', 'fernanda.camarena2000@gmail.com', '8993218111'),
(1708, 329, 30, 40, 752, 'SIN-USAR', 'Fernanda Lozano', 'fernanda.camarena2000@gmail.com', '8993218111'),
(1709, 329, 30, 40, 753, 'SIN-USAR', 'Fernanda Lozano', 'fernanda.camarena2000@gmail.com', '8993218111'),
(1710, 329, 30, 40, 754, 'SIN-USAR', 'Fernanda Lozano', 'fernanda.camarena2000@gmail.com', '8993218111'),
(1713, 331, 30, 40, 783, 'SIN-USAR', 'Graciela Moran', 'graciela_io@hotmail.com', '8341485214'),
(1714, 331, 30, 40, 784, 'SIN-USAR', 'Graciela Moran', 'graciela_io@hotmail.com', '8341485214'),
(1715, 331, 30, 40, 785, 'SIN-USAR', 'Graciela Moran', 'graciela_io@hotmail.com', '8341485214'),
(1716, 331, 30, 40, 786, 'SIN-USAR', 'Graciela Moran', 'graciela_io@hotmail.com', '8341485214'),
(1717, 331, 30, 40, 787, 'SIN-USAR', 'Graciela Moran', 'graciela_io@hotmail.com', '8341485214'),
(1718, 331, 30, 40, 788, 'SIN-USAR', 'Graciela Moran', 'graciela_io@hotmail.com', '8341485214'),
(1719, 331, 30, 40, 789, 'SIN-USAR', 'Graciela Moran', 'graciela_io@hotmail.com', '8341485214'),
(1720, 331, 30, 40, 790, 'SIN-USAR', 'Graciela Moran', 'graciela_io@hotmail.com', '8341485214'),
(1721, 331, 30, 40, 791, 'SIN-USAR', 'Graciela Moran', 'graciela_io@hotmail.com', '8341485214'),
(1722, 331, 30, 40, 792, 'SIN-USAR', 'Graciela Moran', 'graciela_io@hotmail.com', '8341485214'),
(1730, 335, 30, 39, 166, 'SIN-USAR', 'Laura Contreras', 'lcontreras@papeleraabc.com', '8999594628'),
(1731, 335, 30, 39, 167, 'SIN-USAR', 'Laura Contreras', 'lcontreras@papeleraabc.com', '8999594628'),
(1732, 335, 30, 39, 168, 'SIN-USAR', 'Laura Contreras', 'lcontreras@papeleraabc.com', '8999594628'),
(1733, 335, 30, 39, 169, 'SIN-USAR', 'Laura Contreras', 'lcontreras@papeleraabc.com', '8999594628'),
(1734, 335, 30, 39, 170, 'SIN-USAR', 'Laura Contreras', 'lcontreras@papeleraabc.com', '8999594628'),
(1735, 335, 30, 39, 334, 'SIN-USAR', 'Laura Contreras', 'lcontreras@papeleraabc.com', '8999594628'),
(1736, 336, 30, 39, 8, 'SIN-USAR', 'Jaqueline Espinoza', 'yaquie.espinoza77@hotmail.com', '8911080455'),
(1737, 336, 30, 39, 9, 'SIN-USAR', 'Jaqueline Espinoza', 'yaquie.espinoza77@hotmail.com', '8911080455'),
(1738, 336, 30, 39, 10, 'SIN-USAR', 'Jaqueline Espinoza', 'yaquie.espinoza77@hotmail.com', '8911080455'),
(1739, 336, 30, 39, 11, 'SIN-USAR', 'Jaqueline Espinoza', 'yaquie.espinoza77@hotmail.com', '8911080455'),
(1740, 336, 30, 39, 12, 'SIN-USAR', 'Jaqueline Espinoza', 'yaquie.espinoza77@hotmail.com', '8911080455'),
(1741, 336, 30, 39, 13, 'SIN-USAR', 'Jaqueline Espinoza', 'yaquie.espinoza77@hotmail.com', '8911080455'),
(1742, 336, 30, 39, 14, 'SIN-USAR', 'Jaqueline Espinoza', 'yaquie.espinoza77@hotmail.com', '8911080455'),
(1743, 336, 30, 39, 15, 'SIN-USAR', 'Jaqueline Espinoza', 'yaquie.espinoza77@hotmail.com', '8911080455'),
(1744, 336, 30, 39, 16, 'SIN-USAR', 'Jaqueline Espinoza', 'yaquie.espinoza77@hotmail.com', '8911080455'),
(1745, 336, 30, 39, 17, 'SIN-USAR', 'Jaqueline Espinoza', 'yaquie.espinoza77@hotmail.com', '8911080455'),
(1746, 336, 30, 39, 18, 'SIN-USAR', 'Jaqueline Espinoza', 'yaquie.espinoza77@hotmail.com', '8911080455'),
(1751, 338, 30, 39, 475, 'SIN-USAR', 'Martha Aviles', 'cmmia1104@gmail.com', '8999594285'),
(1752, 338, 30, 39, 476, 'SIN-USAR', 'Martha Aviles', 'cmmia1104@gmail.com', '8999594285'),
(1753, 338, 30, 39, 477, 'SIN-USAR', 'Martha Aviles', 'cmmia1104@gmail.com', '8999594285'),
(1754, 338, 30, 39, 478, 'SIN-USAR', 'Martha Aviles', 'cmmia1104@gmail.com', '8999594285'),
(1755, 339, 30, 40, 228, 'SIN-USAR', 'Martha Aviles', 'cmmia1104@gmail.com', '8999594285'),
(1756, 339, 30, 40, 229, 'SIN-USAR', 'Martha Aviles', 'cmmia1104@gmail.com', '8999594285'),
(1757, 339, 30, 40, 230, 'SIN-USAR', 'Martha Aviles', 'cmmia1104@gmail.com', '8999594285'),
(1758, 339, 30, 40, 231, 'SIN-USAR', 'Martha Aviles', 'cmmia1104@gmail.com', '8999594285'),
(1759, 339, 30, 40, 232, 'SIN-USAR', 'Martha Aviles', 'cmmia1104@gmail.com', '8999594285'),
(1760, 339, 30, 40, 233, 'SIN-USAR', 'Martha Aviles', 'cmmia1104@gmail.com', '8999594285'),
(1761, 339, 30, 40, 234, 'SIN-USAR', 'Martha Aviles', 'cmmia1104@gmail.com', '8999594285'),
(1762, 339, 30, 40, 235, 'SIN-USAR', 'Martha Aviles', 'cmmia1104@gmail.com', '8999594285'),
(1763, 339, 30, 40, 236, 'SIN-USAR', 'Martha Aviles', 'cmmia1104@gmail.com', '8999594285'),
(1764, 339, 30, 40, 237, 'SIN-USAR', 'Martha Aviles', 'cmmia1104@gmail.com', '8999594285'),
(1765, 340, 30, 39, 65, 'SIN-USAR', 'Sandrina Morales', 'sandrina_89@hotmail.com', '8999590413'),
(1766, 340, 30, 39, 66, 'SIN-USAR', 'Sandrina Morales', 'sandrina_89@hotmail.com', '8999590413'),
(1767, 340, 30, 39, 67, 'SIN-USAR', 'Sandrina Morales', 'sandrina_89@hotmail.com', '8999590413'),
(1768, 340, 30, 39, 68, 'SIN-USAR', 'Sandrina Morales', 'sandrina_89@hotmail.com', '8999590413'),
(1769, 340, 30, 39, 69, 'SIN-USAR', 'Sandrina Morales', 'sandrina_89@hotmail.com', '8999590413'),
(1770, 340, 30, 39, 70, 'SIN-USAR', 'Sandrina Morales', 'sandrina_89@hotmail.com', '8999590413'),
(1771, 340, 30, 39, 71, 'SIN-USAR', 'Sandrina Morales', 'sandrina_89@hotmail.com', '8999590413'),
(1772, 340, 30, 39, 97, 'SIN-USAR', 'Sandrina Morales', 'sandrina_89@hotmail.com', '8999590413'),
(1773, 340, 30, 39, 98, 'SIN-USAR', 'Sandrina Morales', 'sandrina_89@hotmail.com', '8999590413'),
(1774, 340, 30, 39, 99, 'SIN-USAR', 'Sandrina Morales', 'sandrina_89@hotmail.com', '8999590413'),
(1775, 341, 30, 40, 453, 'SIN-USAR', 'Claudia Alvarado', 'clau_yanet12@hotmail.com', '8999564012'),
(1776, 341, 30, 40, 454, 'SIN-USAR', 'Claudia Alvarado', 'clau_yanet12@hotmail.com', '8999564012'),
(1777, 341, 30, 40, 499, 'SIN-USAR', 'Claudia Alvarado', 'clau_yanet12@hotmail.com', '8999564012'),
(1778, 341, 30, 40, 500, 'SIN-USAR', 'Claudia Alvarado', 'clau_yanet12@hotmail.com', '8999564012'),
(1779, 341, 30, 40, 501, 'SIN-USAR', 'Claudia Alvarado', 'clau_yanet12@hotmail.com', '8999564012'),
(1780, 341, 30, 40, 545, 'SIN-USAR', 'Claudia Alvarado', 'clau_yanet12@hotmail.com', '8999564012'),
(1781, 341, 30, 40, 546, 'SIN-USAR', 'Claudia Alvarado', 'clau_yanet12@hotmail.com', '8999564012'),
(1782, 342, 30, 39, 53, 'SIN-USAR', 'Catalina Juarez', 'katytea21@gmail.com', '9564754440'),
(1783, 342, 30, 39, 54, 'SIN-USAR', 'Catalina Juarez', 'katytea21@gmail.com', '9564754440'),
(1784, 342, 30, 39, 55, 'SIN-USAR', 'Catalina Juarez', 'katytea21@gmail.com', '9564754440'),
(1785, 342, 30, 39, 56, 'SIN-USAR', 'Catalina Juarez', 'katytea21@gmail.com', '9564754440'),
(1786, 342, 30, 39, 57, 'SIN-USAR', 'Catalina Juarez', 'katytea21@gmail.com', '9564754440'),
(1787, 342, 30, 39, 58, 'SIN-USAR', 'Catalina Juarez', 'katytea21@gmail.com', '9564754440'),
(1788, 342, 30, 39, 59, 'SIN-USAR', 'Catalina Juarez', 'katytea21@gmail.com', '9564754440'),
(1789, 342, 30, 39, 60, 'SIN-USAR', 'Catalina Juarez', 'katytea21@gmail.com', '9564754440'),
(1790, 342, 30, 39, 62, 'SIN-USAR', 'Catalina Juarez', 'katytea21@gmail.com', '9564754440'),
(1791, 342, 30, 39, 61, 'SIN-USAR', 'Catalina Juarez', 'katytea21@gmail.com', '9564754440'),
(1792, 342, 30, 39, 113, 'SIN-USAR', 'Catalina Juarez', 'katytea21@gmail.com', '9564754440'),
(1793, 342, 30, 39, 114, 'SIN-USAR', 'Catalina Juarez', 'katytea21@gmail.com', '9564754440'),
(1794, 342, 30, 39, 115, 'SIN-USAR', 'Catalina Juarez', 'katytea21@gmail.com', '9564754440'),
(1795, 342, 30, 39, 116, 'SIN-USAR', 'Catalina Juarez', 'katytea21@gmail.com', '9564754440'),
(1796, 342, 30, 39, 117, 'SIN-USAR', 'Catalina Juarez', 'katytea21@gmail.com', '9564754440'),
(1797, 342, 30, 39, 118, 'SIN-USAR', 'Catalina Juarez', 'katytea21@gmail.com', '9564754440'),
(1811, 345, 30, 39, 338, 'SIN-USAR', 'Aleyda Saenz', 'aleydasaenzflores@gmail.com', '8992442455'),
(1812, 345, 30, 39, 339, 'SIN-USAR', 'Aleyda Saenz', 'aleydasaenzflores@gmail.com', '8992442455'),
(1813, 345, 30, 39, 340, 'SIN-USAR', 'Aleyda Saenz', 'aleydasaenzflores@gmail.com', '8992442455'),
(1814, 345, 30, 39, 341, 'SIN-USAR', 'Aleyda Saenz', 'aleydasaenzflores@gmail.com', '8992442455'),
(1819, 347, 30, 39, 120, 'SIN-USAR', 'Mariana Vargas', 'drsmarianavargas@hotmail.com', '8992457684'),
(1820, 347, 30, 39, 119, 'SIN-USAR', 'Mariana Vargas', 'drsmarianavargas@hotmail.com', '8992457684'),
(1821, 348, 30, 39, 155, 'SIN-USAR', 'Valeria Fuentes', 'valeria.reynosa@gmail.com', '8992309421'),
(1822, 349, 30, 39, 512, 'SIN-USAR', 'luz edith perez', 'perez.aranda.luz@gmail.com', '8992832759'),
(1833, 351, 30, 39, 322, 'SIN-USAR', 'Mariel Lopez', 'msla1206@gmail.com', '8999118526'),
(1834, 351, 30, 39, 323, 'SIN-USAR', 'Mariel Lopez', 'msla1206@gmail.com', '8999118526'),
(1835, 351, 30, 39, 324, 'SIN-USAR', 'Mariel Lopez', 'msla1206@gmail.com', '8999118526'),
(1836, 351, 30, 39, 325, 'SIN-USAR', 'Mariel Lopez', 'msla1206@gmail.com', '8999118526'),
(1837, 351, 30, 39, 326, 'SIN-USAR', 'Mariel Lopez', 'msla1206@gmail.com', '8999118526'),
(1838, 351, 30, 39, 327, 'SIN-USAR', 'Mariel Lopez', 'msla1206@gmail.com', '8999118526'),
(1839, 352, 30, 39, 1187, 'SIN-USAR', 'Franky Gutierrez', 'frankygutierrez9@gmail.com', '8992096860'),
(1840, 352, 30, 39, 282, 'SIN-USAR', 'Franky Gutierrez', 'frankygutierrez9@gmail.com', '8992096860'),
(1841, 352, 30, 39, 283, 'SIN-USAR', 'Franky Gutierrez', 'frankygutierrez9@gmail.com', '8992096860'),
(1842, 352, 30, 39, 284, 'SIN-USAR', 'Franky Gutierrez', 'frankygutierrez9@gmail.com', '8992096860'),
(1843, 352, 30, 39, 285, 'SIN-USAR', 'Franky Gutierrez', 'frankygutierrez9@gmail.com', '8992096860'),
(1844, 352, 30, 39, 286, 'SIN-USAR', 'Franky Gutierrez', 'frankygutierrez9@gmail.com', '8992096860'),
(1845, 352, 30, 39, 287, 'SIN-USAR', 'Franky Gutierrez', 'frankygutierrez9@gmail.com', '8992096860'),
(1846, 352, 30, 39, 288, 'SIN-USAR', 'Franky Gutierrez', 'frankygutierrez9@gmail.com', '8992096860'),
(1847, 352, 30, 39, 289, 'SIN-USAR', 'Franky Gutierrez', 'frankygutierrez9@gmail.com', '8992096860'),
(1848, 352, 30, 39, 290, 'SIN-USAR', 'Franky Gutierrez', 'frankygutierrez9@gmail.com', '8992096860'),
(1862, 355, 30, 40, 638, 'SIN-USAR', 'liliana Benavides', 'lyly_ica@hotmail.com', '9563400148'),
(1863, 355, 30, 40, 639, 'SIN-USAR', 'liliana Benavides', 'lyly_ica@hotmail.com', '9563400148'),
(1864, 355, 30, 40, 640, 'SIN-USAR', 'liliana Benavides', 'lyly_ica@hotmail.com', '9563400148'),
(1867, 357, 30, 39, 158, 'SIN-USAR', 'Paola Ramirez', 'pao_rmz86@hotmail.com', '8999593279'),
(1868, 357, 30, 39, 159, 'SIN-USAR', 'Paola Ramirez', 'pao_rmz86@hotmail.com', '8999593279'),
(1869, 357, 30, 39, 160, 'SIN-USAR', 'Paola Ramirez', 'pao_rmz86@hotmail.com', '8999593279'),
(1870, 357, 30, 39, 161, 'SIN-USAR', 'Paola Ramirez', 'pao_rmz86@hotmail.com', '8999593279'),
(1871, 358, 30, 39, 182, 'SIN-USAR', 'Aida Torres', 'aidiuxtc@hotmail.com', '8991605960'),
(1884, 361, 30, 39, 183, 'SIN-USAR', 'Aida Torres', 'aidiuxtc@hotmail.com', '8991605960'),
(1885, 362, 30, 39, 156, 'SIN-USAR', 'Paola Ramirez', 'pao_rmz86@hotmail.com', '8999593279'),
(1886, 362, 30, 39, 157, 'SIN-USAR', 'Paola Ramirez', 'pao_rmz86@hotmail.com', '8999593279'),
(1887, 363, 30, 39, 187, 'SIN-USAR', 'Jessica Salinas', 'yessica_salinas@hotmail.com', '8999448885'),
(1888, 363, 30, 39, 188, 'SIN-USAR', 'Jessica Salinas', 'yessica_salinas@hotmail.com', '8999448885'),
(1889, 363, 30, 39, 189, 'SIN-USAR', 'Jessica Salinas', 'yessica_salinas@hotmail.com', '8999448885'),
(1890, 363, 30, 39, 190, 'SIN-USAR', 'Jessica Salinas', 'yessica_salinas@hotmail.com', '8999448885'),
(1891, 363, 30, 39, 191, 'SIN-USAR', 'Jessica Salinas', 'yessica_salinas@hotmail.com', '8999448885'),
(1892, 363, 30, 39, 192, 'SIN-USAR', 'Jessica Salinas', 'yessica_salinas@hotmail.com', '8999448885'),
(1893, 363, 30, 39, 193, 'SIN-USAR', 'Jessica Salinas', 'yessica_salinas@hotmail.com', '8999448885'),
(1894, 364, 30, 40, 406, 'SIN-USAR', 'Claudia Alvarado', 'clau_yanet12@hotmail.com', '8999564012'),
(1895, 364, 30, 40, 407, 'SIN-USAR', 'Claudia Alvarado', 'clau_yanet12@hotmail.com', '8999564012'),
(1896, 365, 30, 39, 251, 'SIN-USAR', 'Martha Azocar', 'esteticagema@hotmail.com', '8991691917'),
(1897, 365, 30, 39, 252, 'SIN-USAR', 'Martha Azocar', 'esteticagema@hotmail.com', '8991691917'),
(1898, 366, 30, 39, 122, 'SIN-USAR', 'Nora Cavazos', 'norac7322_3@hotmail.com', '9563298733'),
(1899, 366, 30, 39, 123, 'SIN-USAR', 'Nora Cavazos', 'norac7322_3@hotmail.com', '9563298733'),
(1900, 366, 30, 39, 124, 'SIN-USAR', 'Nora Cavazos', 'norac7322_3@hotmail.com', '9563298733'),
(1901, 366, 30, 39, 125, 'SIN-USAR', 'Nora Cavazos', 'norac7322_3@hotmail.com', '9563298733'),
(1902, 366, 30, 39, 126, 'SIN-USAR', 'Nora Cavazos', 'norac7322_3@hotmail.com', '9563298733'),
(1903, 367, 30, 39, 84, 'SIN-USAR', 'Elizabeth Cortez', 'cortez_ely@hotmail.com', '8992292657'),
(1904, 367, 30, 39, 85, 'SIN-USAR', 'Elizabeth Cortez', 'cortez_ely@hotmail.com', '8992292657'),
(1905, 367, 30, 39, 86, 'SIN-USAR', 'Elizabeth Cortez', 'cortez_ely@hotmail.com', '8992292657'),
(1906, 367, 30, 39, 87, 'SIN-USAR', 'Elizabeth Cortez', 'cortez_ely@hotmail.com', '8992292657'),
(1907, 367, 30, 39, 88, 'SIN-USAR', 'Elizabeth Cortez', 'cortez_ely@hotmail.com', '8992292657'),
(1908, 367, 30, 39, 89, 'SIN-USAR', 'Elizabeth Cortez', 'cortez_ely@hotmail.com', '8992292657'),
(1909, 367, 30, 39, 90, 'SIN-USAR', 'Elizabeth Cortez', 'cortez_ely@hotmail.com', '8992292657'),
(1910, 367, 30, 39, 91, 'SIN-USAR', 'Elizabeth Cortez', 'cortez_ely@hotmail.com', '8992292657'),
(1911, 367, 30, 39, 92, 'SIN-USAR', 'Elizabeth Cortez', 'cortez_ely@hotmail.com', '8992292657'),
(1912, 367, 30, 39, 93, 'SIN-USAR', 'Elizabeth Cortez', 'cortez_ely@hotmail.com', '8992292657'),
(1913, 367, 30, 39, 94, 'SIN-USAR', 'Elizabeth Cortez', 'cortez_ely@hotmail.com', '8992292657'),
(1914, 368, 30, 39, 1188, 'SIN-USAR', 'Ruth cortez', 'ruthcdes@gmail.com', '8998711687'),
(1915, 369, 30, 40, 721, 'SIN-USAR', 'Sanjuanita Garcia', 'sanjuanitaedith@hotmail.com', '8991384188'),
(1916, 369, 30, 40, 722, 'SIN-USAR', 'Sanjuanita Garcia', 'sanjuanitaedith@hotmail.com', '8991384188'),
(1917, 369, 30, 40, 723, 'SIN-USAR', 'Sanjuanita Garcia', 'sanjuanitaedith@hotmail.com', '8991384188'),
(1918, 369, 30, 40, 724, 'SIN-USAR', 'Sanjuanita Garcia', 'sanjuanitaedith@hotmail.com', '8991384188'),
(1919, 369, 30, 40, 758, 'SIN-USAR', 'Sanjuanita Garcia', 'sanjuanitaedith@hotmail.com', '8991384188'),
(1920, 369, 30, 40, 759, 'SIN-USAR', 'Sanjuanita Garcia', 'sanjuanitaedith@hotmail.com', '8991384188'),
(1921, 369, 30, 40, 760, 'SIN-USAR', 'Sanjuanita Garcia', 'sanjuanitaedith@hotmail.com', '8991384188'),
(1922, 369, 30, 40, 761, 'SIN-USAR', 'Sanjuanita Garcia', 'sanjuanitaedith@hotmail.com', '8991384188'),
(1923, 369, 30, 40, 797, 'SIN-USAR', 'Sanjuanita Garcia', 'sanjuanitaedith@hotmail.com', '8991384188'),
(1924, 369, 30, 40, 798, 'SIN-USAR', 'Sanjuanita Garcia', 'sanjuanitaedith@hotmail.com', '8991384188'),
(1925, 370, 30, 40, 799, 'SIN-USAR', 'Cecilia Turriza', 'cesdrdz@gmail.com', '8991196029'),
(1926, 370, 30, 40, 800, 'SIN-USAR', 'Cecilia Turriza', 'cesdrdz@gmail.com', '8991196029'),
(1927, 370, 30, 40, 801, 'SIN-USAR', 'Cecilia Turriza', 'cesdrdz@gmail.com', '8991196029'),
(1928, 370, 30, 40, 802, 'SIN-USAR', 'Cecilia Turriza', 'cesdrdz@gmail.com', '8991196029'),
(1929, 370, 30, 40, 803, 'SIN-USAR', 'Cecilia Turriza', 'cesdrdz@gmail.com', '8991196029'),
(1930, 370, 30, 40, 804, 'SIN-USAR', 'Cecilia Turriza', 'cesdrdz@gmail.com', '8991196029'),
(1931, 370, 30, 40, 805, 'SIN-USAR', 'Cecilia Turriza', 'cesdrdz@gmail.com', '8991196029'),
(1932, 370, 30, 40, 806, 'SIN-USAR', 'Cecilia Turriza', 'cesdrdz@gmail.com', '8991196029'),
(1933, 370, 30, 40, 807, 'SIN-USAR', 'Cecilia Turriza', 'cesdrdz@gmail.com', '8991196029'),
(1934, 370, 30, 40, 808, 'SIN-USAR', 'Cecilia Turriza', 'cesdrdz@gmail.com', '8991196029'),
(1935, 371, 30, 40, 831, 'SIN-USAR', 'Sarahi  Cigala', 'valeriacigala2121@gmail.com', '8991602728'),
(1936, 371, 30, 40, 832, 'SIN-USAR', 'Sarahi  Cigala', 'valeriacigala2121@gmail.com', '8991602728'),
(1937, 371, 30, 40, 833, 'SIN-USAR', 'Sarahi  Cigala', 'valeriacigala2121@gmail.com', '8991602728'),
(1938, 371, 30, 40, 834, 'SIN-USAR', 'Sarahi  Cigala', 'valeriacigala2121@gmail.com', '8991602728'),
(1939, 371, 30, 40, 835, 'SIN-USAR', 'Sarahi  Cigala', 'valeriacigala2121@gmail.com', '8991602728'),
(1940, 371, 30, 40, 836, 'SIN-USAR', 'Sarahi  Cigala', 'valeriacigala2121@gmail.com', '8991602728'),
(1941, 371, 30, 40, 837, 'SIN-USAR', 'Sarahi  Cigala', 'valeriacigala2121@gmail.com', '8991602728'),
(1942, 371, 30, 40, 838, 'SIN-USAR', 'Sarahi  Cigala', 'valeriacigala2121@gmail.com', '8991602728'),
(1943, 371, 30, 40, 839, 'SIN-USAR', 'Sarahi  Cigala', 'valeriacigala2121@gmail.com', '8991602728'),
(1944, 371, 30, 40, 840, 'SIN-USAR', 'Sarahi  Cigala', 'valeriacigala2121@gmail.com', '8991602728'),
(1945, 372, 30, 39, 127, 'SIN-USAR', 'Iker Ruiz', 'melladoo.maar@gmail.com', '8998734029'),
(1946, 372, 30, 39, 128, 'SIN-USAR', 'Iker Ruiz', 'melladoo.maar@gmail.com', '8998734029'),
(1947, 372, 30, 39, 129, 'SIN-USAR', 'Iker Ruiz', 'melladoo.maar@gmail.com', '8998734029'),
(1948, 372, 30, 39, 130, 'SIN-USAR', 'Iker Ruiz', 'melladoo.maar@gmail.com', '8998734029'),
(1949, 372, 30, 39, 131, 'SIN-USAR', 'Iker Ruiz', 'melladoo.maar@gmail.com', '8998734029'),
(1950, 372, 30, 39, 132, 'SIN-USAR', 'Iker Ruiz', 'melladoo.maar@gmail.com', '8998734029'),
(1951, 372, 30, 39, 133, 'SIN-USAR', 'Iker Ruiz', 'melladoo.maar@gmail.com', '8998734029'),
(1952, 372, 30, 39, 134, 'SIN-USAR', 'Iker Ruiz', 'melladoo.maar@gmail.com', '8998734029'),
(1953, 372, 30, 39, 135, 'SIN-USAR', 'Iker Ruiz', 'melladoo.maar@gmail.com', '8998734029'),
(1954, 372, 30, 39, 136, 'SIN-USAR', 'Iker Ruiz', 'melladoo.maar@gmail.com', '8998734029'),
(1955, 373, 30, 40, 841, 'SIN-USAR', 'Anselma Herrera', 'herrerardzma_jjoa@hotmail.com', '8991938401'),
(1956, 373, 30, 40, 842, 'SIN-USAR', 'Anselma Herrera', 'herrerardzma_jjoa@hotmail.com', '8991938401'),
(1957, 373, 30, 40, 843, 'SIN-USAR', 'Anselma Herrera', 'herrerardzma_jjoa@hotmail.com', '8991938401'),
(1958, 373, 30, 40, 844, 'SIN-USAR', 'Anselma Herrera', 'herrerardzma_jjoa@hotmail.com', '8991938401'),
(1959, 373, 30, 40, 845, 'SIN-USAR', 'Anselma Herrera', 'herrerardzma_jjoa@hotmail.com', '8991938401'),
(1960, 373, 30, 40, 846, 'SIN-USAR', 'Anselma Herrera', 'herrerardzma_jjoa@hotmail.com', '8991938401'),
(1961, 373, 30, 40, 847, 'SIN-USAR', 'Anselma Herrera', 'herrerardzma_jjoa@hotmail.com', '8991938401'),
(1962, 373, 30, 40, 848, 'SIN-USAR', 'Anselma Herrera', 'herrerardzma_jjoa@hotmail.com', '8991938401'),
(1963, 373, 30, 40, 849, 'SIN-USAR', 'Anselma Herrera', 'herrerardzma_jjoa@hotmail.com', '8991938401'),
(1964, 373, 30, 40, 820, 'SIN-USAR', 'Anselma Herrera', 'herrerardzma_jjoa@hotmail.com', '8991938401'),
(1965, 374, 30, 40, 282, 'SIN-USAR', 'Paulette Garza', 'academiarolsed@hotmail.com', '8991608117'),
(1966, 374, 30, 40, 283, 'SIN-USAR', 'Paulette Garza', 'academiarolsed@hotmail.com', '8991608117'),
(1967, 375, 30, 40, 686, 'SIN-USAR', 'Angeles  Martinez', 'lae.luzangel@gmail.com', '8991062929'),
(1968, 375, 30, 40, 687, 'SIN-USAR', 'Angeles  Martinez', 'lae.luzangel@gmail.com', '8991062929'),
(1969, 375, 30, 40, 781, 'SIN-USAR', 'Angeles  Martinez', 'lae.luzangel@gmail.com', '8991062929'),
(1970, 375, 30, 40, 782, 'SIN-USAR', 'Angeles  Martinez', 'lae.luzangel@gmail.com', '8991062929'),
(1971, 375, 30, 40, 587, 'SIN-USAR', 'Angeles  Martinez', 'lae.luzangel@gmail.com', '8991062929'),
(1972, 375, 30, 40, 588, 'SIN-USAR', 'Angeles  Martinez', 'lae.luzangel@gmail.com', '8991062929'),
(1973, 375, 30, 40, 589, 'SIN-USAR', 'Angeles  Martinez', 'lae.luzangel@gmail.com', '8991062929'),
(1974, 375, 30, 40, 818, 'SIN-USAR', 'Angeles  Martinez', 'lae.luzangel@gmail.com', '8991062929'),
(1975, 375, 30, 40, 819, 'SIN-USAR', 'Angeles  Martinez', 'lae.luzangel@gmail.com', '8991062929'),
(1976, 375, 30, 40, 744, 'SIN-USAR', 'Angeles  Martinez', 'lae.luzangel@gmail.com', '8991062929'),
(1977, 376, 30, 40, 1190, 'SIN-USAR', 'Rocio  Aleman', 'miguel070709@hotmail.com', '8993009066'),
(1978, 376, 30, 40, 1191, 'SIN-USAR', 'Rocio  Aleman', 'miguel070709@hotmail.com', '8993009066'),
(1979, 377, 30, 40, 239, 'SIN-USAR', 'Karen  Alamillo', 'karen.alarey@hotmail.com', '8999368543'),
(1980, 378, 30, 40, 577, 'SIN-USAR', 'Felizardo Garcia', 'felizardo_garcia@hotmail.com', '8994107135'),
(1981, 379, 30, 40, 821, 'SIN-USAR', 'Blanca Granados', 'aldoespinosamd@gmail.com', '8991609827'),
(1982, 379, 30, 40, 822, 'SIN-USAR', 'Blanca Granados', 'aldoespinosamd@gmail.com', '8991609827'),
(1983, 379, 30, 40, 823, 'SIN-USAR', 'Blanca Granados', 'aldoespinosamd@gmail.com', '8991609827'),
(1984, 379, 30, 40, 824, 'SIN-USAR', 'Blanca Granados', 'aldoespinosamd@gmail.com', '8991609827'),
(1985, 379, 30, 40, 825, 'SIN-USAR', 'Blanca Granados', 'aldoespinosamd@gmail.com', '8991609827'),
(1986, 379, 30, 40, 826, 'SIN-USAR', 'Blanca Granados', 'aldoespinosamd@gmail.com', '8991609827'),
(1987, 379, 30, 40, 827, 'SIN-USAR', 'Blanca Granados', 'aldoespinosamd@gmail.com', '8991609827'),
(1988, 379, 30, 40, 828, 'SIN-USAR', 'Blanca Granados', 'aldoespinosamd@gmail.com', '8991609827'),
(1989, 379, 30, 40, 829, 'SIN-USAR', 'Blanca Granados', 'aldoespinosamd@gmail.com', '8991609827'),
(1990, 379, 30, 40, 830, 'SIN-USAR', 'Blanca Granados', 'aldoespinosamd@gmail.com', '8991609827'),
(1993, 381, 30, 40, 226, 'SIN-USAR', 'lulu guarneros', 'lguarnerosalatorre@gmail.com', '8992386924'),
(1994, 381, 30, 40, 227, 'SIN-USAR', 'lulu guarneros', 'lguarnerosalatorre@gmail.com', '8992386924'),
(1995, 382, 30, 39, 467, 'SIN-USAR', 'Amparo Carrillo', 'mariamparo_gaeta@hotmail.com', '8991872859'),
(1996, 382, 30, 39, 468, 'SIN-USAR', 'Amparo Carrillo', 'mariamparo_gaeta@hotmail.com', '8991872859'),
(1997, 382, 30, 39, 469, 'SIN-USAR', 'Amparo Carrillo', 'mariamparo_gaeta@hotmail.com', '8991872859'),
(1998, 382, 30, 39, 470, 'SIN-USAR', 'Amparo Carrillo', 'mariamparo_gaeta@hotmail.com', '8991872859'),
(1999, 383, 30, 39, 370, 'SIN-USAR', 'blanca Moctezuma', 'abiliz08@hotmail.com', '8998724614'),
(2000, 383, 30, 39, 371, 'SIN-USAR', 'blanca Moctezuma', 'abiliz08@hotmail.com', '8998724614'),
(2001, 383, 30, 39, 372, 'SIN-USAR', 'blanca Moctezuma', 'abiliz08@hotmail.com', '8998724614'),
(2002, 383, 30, 39, 373, 'SIN-USAR', 'blanca Moctezuma', 'abiliz08@hotmail.com', '8998724614'),
(2003, 384, 30, 40, 11, 'SIN-USAR', 'Esmeralda Gomez', 'bbvaizq87@hotmail.com', '8994190208'),
(2004, 384, 30, 40, 10, 'SIN-USAR', 'Esmeralda Gomez', 'bbvaizq87@hotmail.com', '8994190208'),
(2005, 384, 30, 40, 9, 'SIN-USAR', 'Esmeralda Gomez', 'bbvaizq87@hotmail.com', '8994190208'),
(2006, 384, 30, 40, 8, 'SIN-USAR', 'Esmeralda Gomez', 'bbvaizq87@hotmail.com', '8994190208'),
(2007, 384, 30, 40, 7, 'SIN-USAR', 'Esmeralda Gomez', 'bbvaizq87@hotmail.com', '8994190208'),
(2008, 384, 30, 40, 6, 'SIN-USAR', 'Esmeralda Gomez', 'bbvaizq87@hotmail.com', '8994190208'),
(2009, 384, 30, 40, 5, 'SIN-USAR', 'Esmeralda Gomez', 'bbvaizq87@hotmail.com', '8994190208'),
(2010, 384, 30, 40, 4, 'SIN-USAR', 'Esmeralda Gomez', 'bbvaizq87@hotmail.com', '8994190208'),
(2011, 384, 30, 40, 971, 'SIN-USAR', 'Esmeralda Gomez', 'bbvaizq87@hotmail.com', '8994190208'),
(2012, 384, 30, 40, 972, 'SIN-USAR', 'Esmeralda Gomez', 'bbvaizq87@hotmail.com', '8994190208'),
(2015, 387, 30, 40, 925, 'SIN-USAR', 'Jaqueline Robledo', 'delangel_54@hotmail.com', '8991018910'),
(2016, 387, 30, 40, 924, 'SIN-USAR', 'Jaqueline Robledo', 'delangel_54@hotmail.com', '8991018910'),
(2017, 388, 30, 39, 428, 'SIN-USAR', 'Rocio Avila', 'rocio.avilag@outlook.com', '8999415511'),
(2018, 388, 30, 39, 429, 'SIN-USAR', 'Rocio Avila', 'rocio.avilag@outlook.com', '8999415511'),
(2020, 390, 30, 39, 1124, 'SIN-USAR', 'sylvia roldan', 'sylvia_roldan@hotmail.com', '8999560673'),
(2031, 392, 30, 40, 20, 'SIN-USAR', 'Martha Azocar', 'esteticagema@hotmail.com', '8991691917'),
(2032, 392, 30, 40, 19, 'SIN-USAR', 'Martha Azocar', 'esteticagema@hotmail.com', '8991691917'),
(2033, 392, 30, 40, 18, 'SIN-USAR', 'Martha Azocar', 'esteticagema@hotmail.com', '8991691917'),
(2034, 392, 30, 40, 17, 'SIN-USAR', 'Martha Azocar', 'esteticagema@hotmail.com', '8991691917'),
(2035, 392, 30, 40, 41, 'SIN-USAR', 'Martha Azocar', 'esteticagema@hotmail.com', '8991691917'),
(2036, 392, 30, 40, 2, 'SIN-USAR', 'Martha Azocar', 'esteticagema@hotmail.com', '8991691917'),
(2037, 392, 30, 40, 3, 'SIN-USAR', 'Martha Azocar', 'esteticagema@hotmail.com', '8991691917'),
(2038, 392, 30, 40, 141, 'SIN-USAR', 'Martha Azocar', 'esteticagema@hotmail.com', '8991691917'),
(2039, 392, 30, 40, 266, 'SIN-USAR', 'Martha Azocar', 'esteticagema@hotmail.com', '8991691917'),
(2040, 392, 30, 40, 452, 'SIN-USAR', 'Martha Azocar', 'esteticagema@hotmail.com', '8991691917'),
(2051, 394, 30, 40, 374, 'SIN-USAR', 'cinthia Lopez', 'wichotc@hotmail.com', '8991159739'),
(2052, 394, 30, 40, 375, 'SIN-USAR', 'cinthia Lopez', 'wichotc@hotmail.com', '8991159739'),
(2053, 394, 30, 40, 376, 'SIN-USAR', 'cinthia Lopez', 'wichotc@hotmail.com', '8991159739'),
(2054, 394, 30, 40, 377, 'SIN-USAR', 'cinthia Lopez', 'wichotc@hotmail.com', '8991159739'),
(2055, 394, 30, 40, 378, 'SIN-USAR', 'cinthia Lopez', 'wichotc@hotmail.com', '8991159739'),
(2056, 394, 30, 40, 379, 'SIN-USAR', 'cinthia Lopez', 'wichotc@hotmail.com', '8991159739'),
(2057, 394, 30, 40, 380, 'SIN-USAR', 'cinthia Lopez', 'wichotc@hotmail.com', '8991159739'),
(2058, 394, 30, 40, 381, 'SIN-USAR', 'cinthia Lopez', 'wichotc@hotmail.com', '8991159739'),
(2059, 394, 30, 40, 382, 'SIN-USAR', 'cinthia Lopez', 'wichotc@hotmail.com', '8991159739'),
(2060, 394, 30, 40, 383, 'SIN-USAR', 'cinthia Lopez', 'wichotc@hotmail.com', '8991159739'),
(2061, 395, 30, 39, 335, 'SIN-USAR', 'cinthia Lopez', 'wichotc@hotmail.com', '8991159739'),
(2062, 395, 30, 39, 336, 'SIN-USAR', 'cinthia Lopez', 'wichotc@hotmail.com', '8991159739'),
(2063, 395, 30, 39, 337, 'SIN-USAR', 'cinthia Lopez', 'wichotc@hotmail.com', '8991159739'),
(2064, 396, 30, 40, 184, 'SIN-USAR', 'Claudia sedas', 'claudiasedas@hotmail.com', '8999565303'),
(2065, 396, 30, 40, 185, 'SIN-USAR', 'Claudia sedas', 'claudiasedas@hotmail.com', '8999565303'),
(2066, 396, 30, 40, 186, 'SIN-USAR', 'Claudia sedas', 'claudiasedas@hotmail.com', '8999565303'),
(2067, 396, 30, 40, 187, 'SIN-USAR', 'Claudia sedas', 'claudiasedas@hotmail.com', '8999565303'),
(2068, 396, 30, 40, 188, 'SIN-USAR', 'Claudia sedas', 'claudiasedas@hotmail.com', '8999565303'),
(2069, 396, 30, 40, 189, 'SIN-USAR', 'Claudia sedas', 'claudiasedas@hotmail.com', '8999565303'),
(2070, 397, 30, 40, 932, 'SIN-USAR', 'Hector  Galindo', 'hgalindog@hotmail.com', '8991224706'),
(2071, 397, 30, 40, 933, 'SIN-USAR', 'Hector  Galindo', 'hgalindog@hotmail.com', '8991224706'),
(2072, 397, 30, 40, 934, 'SIN-USAR', 'Hector  Galindo', 'hgalindog@hotmail.com', '8991224706'),
(2073, 397, 30, 40, 935, 'SIN-USAR', 'Hector  Galindo', 'hgalindog@hotmail.com', '8991224706'),
(2076, 399, 30, 40, 794, 'SIN-USAR', 'Fita Zamora', 'mgarsol@hotmail.com', '8991642556'),
(2077, 399, 30, 40, 793, 'SIN-USAR', 'Fita Zamora', 'mgarsol@hotmail.com', '8991642556'),
(2083, 401, 30, 40, 854, 'SIN-USAR', 'Alejandra Lorenza', 'aleloz.cr@gmail.com', '8999560673');
INSERT INTO `boleto` (`idBoleto`, `idCompra`, `idEvento`, `idFuncion`, `idAsiento`, `estadoBoleto`, `nombreCliente`, `emailCliente`, `telefonoCliente`) VALUES
(2084, 401, 30, 40, 855, 'SIN-USAR', 'Alejandra Lorenza', 'aleloz.cr@gmail.com', '8999560673'),
(2085, 402, 30, 40, 915, 'SIN-USAR', 'Isabel Centeno', 'isabel_cpa@hotmail.com', '8991677659'),
(2086, 402, 30, 40, 916, 'SIN-USAR', 'Isabel Centeno', 'isabel_cpa@hotmail.com', '8991677659'),
(2087, 402, 30, 40, 917, 'SIN-USAR', 'Isabel Centeno', 'isabel_cpa@hotmail.com', '8991677659'),
(2088, 402, 30, 40, 918, 'SIN-USAR', 'Isabel Centeno', 'isabel_cpa@hotmail.com', '8991677659'),
(2089, 402, 30, 40, 919, 'SIN-USAR', 'Isabel Centeno', 'isabel_cpa@hotmail.com', '8991677659'),
(2090, 402, 30, 40, 920, 'SIN-USAR', 'Isabel Centeno', 'isabel_cpa@hotmail.com', '8991677659'),
(2091, 402, 30, 40, 921, 'SIN-USAR', 'Isabel Centeno', 'isabel_cpa@hotmail.com', '8991677659'),
(2092, 402, 30, 40, 922, 'SIN-USAR', 'Isabel Centeno', 'isabel_cpa@hotmail.com', '8991677659'),
(2093, 402, 30, 40, 923, 'SIN-USAR', 'Isabel Centeno', 'isabel_cpa@hotmail.com', '8991677659'),
(2094, 402, 30, 40, 970, 'SIN-USAR', 'Isabel Centeno', 'isabel_cpa@hotmail.com', '8991677659'),
(2095, 402, 30, 40, 969, 'SIN-USAR', 'Isabel Centeno', 'isabel_cpa@hotmail.com', '8991677659'),
(2096, 402, 30, 40, 968, 'SIN-USAR', 'Isabel Centeno', 'isabel_cpa@hotmail.com', '8991677659'),
(2097, 402, 30, 40, 967, 'SIN-USAR', 'Isabel Centeno', 'isabel_cpa@hotmail.com', '8991677659'),
(2098, 402, 30, 40, 966, 'SIN-USAR', 'Isabel Centeno', 'isabel_cpa@hotmail.com', '8991677659'),
(2099, 402, 30, 40, 965, 'SIN-USAR', 'Isabel Centeno', 'isabel_cpa@hotmail.com', '8991677659'),
(2100, 402, 30, 40, 964, 'SIN-USAR', 'Isabel Centeno', 'isabel_cpa@hotmail.com', '8991677659'),
(2101, 402, 30, 40, 963, 'SIN-USAR', 'Isabel Centeno', 'isabel_cpa@hotmail.com', '8991677659'),
(2102, 402, 30, 40, 962, 'SIN-USAR', 'Isabel Centeno', 'isabel_cpa@hotmail.com', '8991677659'),
(2103, 402, 30, 40, 1008, 'SIN-USAR', 'Isabel Centeno', 'isabel_cpa@hotmail.com', '8991677659'),
(2104, 402, 30, 40, 1009, 'SIN-USAR', 'Isabel Centeno', 'isabel_cpa@hotmail.com', '8991677659'),
(2105, 403, 30, 40, 914, 'SIN-USAR', 'Keren Santamaria', 'keren.asv01@gmail.com', '8998722396'),
(2106, 403, 30, 40, 913, 'SIN-USAR', 'Keren Santamaria', 'keren.asv01@gmail.com', '8998722396'),
(2107, 403, 30, 40, 912, 'SIN-USAR', 'Keren Santamaria', 'keren.asv01@gmail.com', '8998722396'),
(2108, 403, 30, 40, 911, 'SIN-USAR', 'Keren Santamaria', 'keren.asv01@gmail.com', '8998722396'),
(2109, 403, 30, 40, 910, 'SIN-USAR', 'Keren Santamaria', 'keren.asv01@gmail.com', '8998722396'),
(2110, 404, 30, 39, 374, 'SIN-USAR', 'Nora Cavazos', 'norac7322_3@hotmail.com', '9563298733'),
(2113, 406, 30, 40, 735, 'SIN-USAR', 'Ivanna Rojas', 'ivanna_alr97@hotmail.com', '8999596723'),
(2114, 406, 30, 40, 772, 'SIN-USAR', 'Ivanna Rojas', 'ivanna_alr97@hotmail.com', '8999596723'),
(2115, 407, 30, 40, 637, 'SIN-USAR', 'Rubi Padilla', 'abg_245@hotmail.com', '8991873384'),
(2116, 407, 30, 40, 636, 'SIN-USAR', 'Rubi Padilla', 'abg_245@hotmail.com', '8991873384'),
(2117, 408, 30, 39, 417, 'SIN-USAR', 'Adriana Camacho', 'adsofia@hotmail.com', '8992854519'),
(2118, 408, 30, 39, 418, 'SIN-USAR', 'Adriana Camacho', 'adsofia@hotmail.com', '8992854519'),
(2119, 408, 30, 39, 419, 'SIN-USAR', 'Adriana Camacho', 'adsofia@hotmail.com', '8992854519'),
(2120, 409, 30, 40, 1027, 'SIN-USAR', 'Pamela Sedas', 'sedas.rivera@hotmail.com', '9567775244'),
(2121, 409, 30, 40, 1028, 'SIN-USAR', 'Pamela Sedas', 'sedas.rivera@hotmail.com', '9567775244'),
(2122, 409, 30, 40, 1029, 'SIN-USAR', 'Pamela Sedas', 'sedas.rivera@hotmail.com', '9567775244'),
(2123, 409, 30, 40, 1030, 'SIN-USAR', 'Pamela Sedas', 'sedas.rivera@hotmail.com', '9567775244'),
(2137, 414, 30, 39, 390, 'SIN-USAR', 'Yoselin Delgado', 'yoselindelgado252@gmail.com', '8994593026'),
(2138, 414, 30, 39, 391, 'SIN-USAR', 'Yoselin Delgado', 'yoselindelgado252@gmail.com', '8994593026'),
(2139, 415, 30, 40, 980, 'SIN-USAR', 'Irma Mora', '8992491623@gmail.com', '8992491623'),
(2140, 415, 30, 40, 981, 'SIN-USAR', 'Irma Mora', '8992491623@gmail.com', '8992491623'),
(2141, 415, 30, 40, 982, 'SIN-USAR', 'Irma Mora', '8992491623@gmail.com', '8992491623'),
(2142, 415, 30, 40, 983, 'SIN-USAR', 'Irma Mora', '8992491623@gmail.com', '8992491623'),
(2143, 415, 30, 40, 984, 'SIN-USAR', 'Irma Mora', '8992491623@gmail.com', '8992491623'),
(2144, 416, 30, 40, 795, 'SIN-USAR', 'Mine Ernesto', 'ernesto_seguridadprivada@hotmail.com', '8992843458'),
(2145, 416, 30, 40, 796, 'SIN-USAR', 'Mine Ernesto', 'ernesto_seguridadprivada@hotmail.com', '8992843458'),
(2546, 511, 33, 43, 99, 'SIN-USAR', 'Ana Karen  Zepeda', 'ana930601@gmail.com', '8991562247'),
(2547, 511, 33, 43, 97, 'SIN-USAR', 'Ana Karen  Zepeda', 'ana930601@gmail.com', '8991562247'),
(2548, 511, 33, 43, 98, 'SIN-USAR', 'Ana Karen  Zepeda', 'ana930601@gmail.com', '8991562247'),
(2549, 511, 33, 43, 96, 'SIN-USAR', 'Ana Karen  Zepeda', 'ana930601@gmail.com', '8991562247'),
(2550, 512, 33, 43, 71, 'SIN-USAR', 'Karla Nallely Mijares', 'mijares.0809@gmail.com', '8993494561'),
(2551, 512, 33, 43, 70, 'SIN-USAR', 'Karla Nallely Mijares', 'mijares.0809@gmail.com', '8993494561'),
(2552, 513, 33, 42, 13, 'SIN-USAR', 'Jaime Salvador  Alpuche ', 'jaime.alpuche@hotmail.com', '8994580871'),
(2553, 513, 33, 42, 12, 'SIN-USAR', 'Jaime Salvador  Alpuche ', 'jaime.alpuche@hotmail.com', '8994580871'),
(2554, 513, 33, 42, 11, 'SIN-USAR', 'Jaime Salvador  Alpuche ', 'jaime.alpuche@hotmail.com', '8994580871'),
(2555, 514, 33, 42, 10, 'SIN-USAR', 'Margarita  Tabla', 'myangel_th@hotmail.com', '8999676718'),
(2556, 514, 33, 42, 9, 'SIN-USAR', 'Margarita  Tabla', 'myangel_th@hotmail.com', '8999676718'),
(2560, 517, 33, 42, 23, 'SIN-USAR', 'Claudia Mejia', 'claudia_mejiia@hotmail.com', '8991143449'),
(2561, 517, 33, 42, 22, 'SIN-USAR', 'Claudia Mejia', 'claudia_mejiia@hotmail.com', '8991143449'),
(2562, 517, 33, 42, 21, 'SIN-USAR', 'Claudia Mejia', 'claudia_mejiia@hotmail.com', '8991143449'),
(2563, 517, 33, 42, 20, 'SIN-USAR', 'Claudia Mejia', 'claudia_mejiia@hotmail.com', '8991143449'),
(2564, 517, 33, 42, 18, 'SIN-USAR', 'Claudia Mejia', 'claudia_mejiia@hotmail.com', '8991143449'),
(2565, 517, 33, 42, 19, 'SIN-USAR', 'Claudia Mejia', 'claudia_mejiia@hotmail.com', '8991143449'),
(2566, 518, 33, 42, 247, 'SIN-USAR', 'Claudia Patricia Calderon Cota', 'c0t1t4@hotmail.com', '8998711184'),
(2567, 518, 33, 42, 246, 'SIN-USAR', 'Claudia Patricia Calderon Cota', 'c0t1t4@hotmail.com', '8998711184'),
(2568, 518, 33, 42, 248, 'SIN-USAR', 'Claudia Patricia Calderon Cota', 'c0t1t4@hotmail.com', '8998711184'),
(2569, 518, 33, 42, 245, 'SIN-USAR', 'Claudia Patricia Calderon Cota', 'c0t1t4@hotmail.com', '8998711184'),
(2570, 519, 33, 42, 251, 'SIN-USAR', 'Lidia Mercedes Heredia Siarez', 'lsc98@hotmail.com', '8999564165'),
(2571, 519, 33, 42, 250, 'SIN-USAR', 'Lidia Mercedes Heredia Siarez', 'lsc98@hotmail.com', '8999564165'),
(2572, 519, 33, 42, 249, 'SIN-USAR', 'Lidia Mercedes Heredia Siarez', 'lsc98@hotmail.com', '8999564165'),
(2580, 524, 33, 42, 252, 'SIN-USAR', 'Freda Frias', 'fedra_frias123@gmail.com', '8994143218'),
(2581, 524, 33, 42, 253, 'SIN-USAR', 'Freda Frias', 'fedra_frias123@gmail.com', '8994143218'),
(2582, 524, 33, 42, 254, 'SIN-USAR', 'Freda Frias', 'fedra_frias123@gmail.com', '8994143218'),
(2583, 524, 33, 42, 255, 'SIN-USAR', 'Freda Frias', 'fedra_frias123@gmail.com', '8994143218'),
(2587, 526, 33, 43, 50, 'SIN-USAR', 'JORGE ALBERTO GARCIA MORALES ', 'alberto.garciam26@gmail.com', '8992441319'),
(2588, 526, 33, 43, 51, 'SIN-USAR', 'JORGE ALBERTO GARCIA MORALES ', 'alberto.garciam26@gmail.com', '8992441319'),
(2589, 526, 33, 43, 52, 'SIN-USAR', 'JORGE ALBERTO GARCIA MORALES ', 'alberto.garciam26@gmail.com', '8992441319'),
(2590, 526, 33, 43, 53, 'SIN-USAR', 'JORGE ALBERTO GARCIA MORALES ', 'alberto.garciam26@gmail.com', '8992441319'),
(2591, 526, 33, 43, 54, 'SIN-USAR', 'JORGE ALBERTO GARCIA MORALES ', 'alberto.garciam26@gmail.com', '8992441319'),
(2593, 528, 33, 42, 198, 'SIN-USAR', 'Martha Patricia Amador Amador', 'patyamador2@hotmail.com', '8999562113'),
(2594, 528, 33, 42, 197, 'SIN-USAR', 'Martha Patricia Amador Amador', 'patyamador2@hotmail.com', '8999562113'),
(2595, 528, 33, 42, 195, 'SIN-USAR', 'Martha Patricia Amador Amador', 'patyamador2@hotmail.com', '8999562113'),
(2596, 528, 33, 42, 196, 'SIN-USAR', 'Martha Patricia Amador Amador', 'patyamador2@hotmail.com', '8999562113'),
(2597, 528, 33, 42, 194, 'SIN-USAR', 'Martha Patricia Amador Amador', 'patyamador2@hotmail.com', '8999562113'),
(2598, 529, 33, 42, 35, 'SIN-USAR', 'Cesar Garcia Elizondo', 'cesareduardo.garcia08@gmail.com', '8994131178'),
(2599, 530, 33, 43, 246, 'SIN-USAR', 'Flor Berenice  Grimaldo', 'bereniice.luna@outlook.es', '8992082850'),
(2600, 530, 33, 43, 248, 'SIN-USAR', 'Flor Berenice  Grimaldo', 'bereniice.luna@outlook.es', '8992082850'),
(2601, 530, 33, 43, 247, 'SIN-USAR', 'Flor Berenice  Grimaldo', 'bereniice.luna@outlook.es', '8992082850'),
(2634, 556, 28, 37, NULL, 'SIN-USAR', 'Luis Alfredo Hernandez Gonzalez ', 'alfredohdz080995@gmail.com', '8995491165'),
(2635, 556, 28, 37, NULL, 'SIN-USAR', 'Luis Alfredo Hernandez Gonzalez ', 'alfredohdz080995@gmail.com', '8995491165'),
(2636, 557, 28, 38, NULL, 'SIN-USAR', 'Rosa angelica Martinez  santes', 'angelic_pink25@hotmail.com', '8999276273'),
(2637, 557, 28, 38, NULL, 'SIN-USAR', 'Rosa angelica Martinez  santes', 'angelic_pink25@hotmail.com', '8999276273'),
(2644, 561, 33, 42, 88, 'SIN-USAR', 'Maria Angelina  Contreras Cortez', 'angelinacontreras23@gmail.com', '5552482014'),
(2645, 561, 33, 42, 89, 'SIN-USAR', 'Maria Angelina  Contreras Cortez', 'angelinacontreras23@gmail.com', '5552482014'),
(2646, 561, 33, 42, 87, 'SIN-USAR', 'Maria Angelina  Contreras Cortez', 'angelinacontreras23@gmail.com', '5552482014'),
(2651, 564, 28, 38, NULL, 'SIN-USAR', 'Monica Solis ', 'monica@promospublicidad.com', '8998710613'),
(2652, 564, 28, 38, NULL, 'SIN-USAR', 'Monica Solis ', 'monica@promospublicidad.com', '8998710613'),
(2653, 565, 30, 39, 255, 'SIN-USAR', 'Martha Garza', 'martha.garza@cobat.edu.mx', '8991600836'),
(2654, 565, 30, 39, 254, 'SIN-USAR', 'Martha Garza', 'martha.garza@cobat.edu.mx', '8991600836'),
(2655, 566, 30, 40, 323, 'SIN-USAR', 'Giovanna Granados', 'giovannagranados@hotmail.com', '8992045802'),
(2656, 566, 30, 40, 324, 'SIN-USAR', 'Giovanna Granados', 'giovannagranados@hotmail.com', '8992045802'),
(2657, 566, 30, 40, 325, 'SIN-USAR', 'Giovanna Granados', 'giovannagranados@hotmail.com', '8992045802'),
(2658, 566, 30, 40, 326, 'SIN-USAR', 'Giovanna Granados', 'giovannagranados@hotmail.com', '8992045802'),
(2659, 566, 30, 40, 327, 'SIN-USAR', 'Giovanna Granados', 'giovannagranados@hotmail.com', '8992045802'),
(2660, 566, 30, 40, 277, 'SIN-USAR', 'Giovanna Granados', 'giovannagranados@hotmail.com', '8992045802'),
(2661, 566, 30, 40, 278, 'SIN-USAR', 'Giovanna Granados', 'giovannagranados@hotmail.com', '8992045802'),
(2662, 566, 30, 40, 279, 'SIN-USAR', 'Giovanna Granados', 'giovannagranados@hotmail.com', '8992045802'),
(2663, 566, 30, 40, 280, 'SIN-USAR', 'Giovanna Granados', 'giovannagranados@hotmail.com', '8992045802'),
(2664, 566, 30, 40, 281, 'SIN-USAR', 'Giovanna Granados', 'giovannagranados@hotmail.com', '8992045802'),
(2665, 567, 33, 42, 8, 'SIN-USAR', 'Jessica  Romero Lopez ', 'aldo_vilchez@hotmail.com', '8117783954'),
(2666, 567, 33, 42, 7, 'SIN-USAR', 'Jessica  Romero Lopez ', 'aldo_vilchez@hotmail.com', '8117783954'),
(2667, 567, 33, 42, 4, 'SIN-USAR', 'Jessica  Romero Lopez ', 'aldo_vilchez@hotmail.com', '8117783954'),
(2668, 567, 33, 42, 6, 'SIN-USAR', 'Jessica  Romero Lopez ', 'aldo_vilchez@hotmail.com', '8117783954'),
(2669, 567, 33, 42, 5, 'SIN-USAR', 'Jessica  Romero Lopez ', 'aldo_vilchez@hotmail.com', '8117783954'),
(2670, 567, 33, 42, 3, 'SIN-USAR', 'Jessica  Romero Lopez ', 'aldo_vilchez@hotmail.com', '8117783954'),
(2671, 567, 33, 42, 2, 'SIN-USAR', 'Jessica  Romero Lopez ', 'aldo_vilchez@hotmail.com', '8117783954'),
(2672, 567, 33, 42, 14, 'SIN-USAR', 'Jessica  Romero Lopez ', 'aldo_vilchez@hotmail.com', '8117783954'),
(2673, 568, 28, 38, NULL, 'SIN-USAR', 'Miguel Cortes', 'hagenv36@runbox.com', '8999442224'),
(2674, 568, 28, 38, NULL, 'SIN-USAR', 'Miguel Cortes', 'hagenv36@runbox.com', '8999442224'),
(2675, 568, 28, 38, NULL, 'SIN-USAR', 'Miguel Cortes', 'hagenv36@runbox.com', '8999442224'),
(2676, 568, 28, 38, NULL, 'SIN-USAR', 'Miguel Cortes', 'hagenv36@runbox.com', '8999442224'),
(2677, 569, 28, 37, NULL, 'SIN-USAR', 'Mayra Alejandra Romero Cruz', 'mayraromerocruz8@gmail.com', '8992583338'),
(2678, 569, 28, 37, NULL, 'SIN-USAR', 'Mayra Alejandra Romero Cruz', 'mayraromerocruz8@gmail.com', '8992583338');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `client`
--

CREATE TABLE `client` (
  `idClient` int(11) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `passwordC` char(255) NOT NULL,
  `phonenumber` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `client`
--

INSERT INTO `client` (`idClient`, `firstname`, `lastname`, `email`, `passwordC`, `phonenumber`) VALUES
(1, 'Sucursal', 'Ballerina', 'contacto@angel.ballerinareynosa.com', 'Ballerina12345678', '8994585918'),
(10, 'Ejemplo', 'Ejemplo', 'ejemplo@gmail.com', '$2y$10$hDgZxecaShGE47w7GFfXFOVSG5uLidK2WUKLVOwXr9cO4UoHAs1be', '1234567890'),
(12, 'ds', 'sd', 'esdras.ibarra@uttn.mx', '$2y$10$bpkmVOocYWYpyyjVdib/guZREprX6h0hok2iCx89CtkacaSs4yLaa', '13123'),
(15, 'maria', 'g', 'mar@com', '$2y$10$RO7.aefX1NdsKp54CgVoP.1O15m40ZvxikivGReGOOFSDIWBYgR76', '1234567890'),
(18, 'ejemplo2', 'ejemplo2', 'ejemplo23@gmail.com', '$2y$10$Ke1CehS4IslJO/zS0O55qOmOQNZ48ezO1mEM.VfpFpDoNDRs51sBm', '1234'),
(19, 'gfsdfgsdgf', 'gfds', 'dsadsa@gmail.com', '$2y$10$s6UKbgRE1tJq5O5/6bkvnOBir9TWGACl5MP.dKrYNSAOlC5di.kSu', '321'),
(20, 'Esdras', 'Ibarra', 'esdras.jehiel@gmail.com', '$2y$10$c9le7Qowg7.Osh1ncopYZ.UCyIndySmj4hgEUh5RKJEe8G2NkJHqy', '1234'),
(21, 'test', 'tsete', 'test234@gmail.com', '$2y$10$U0Z1y3.BqsaPZg2Y7OWayevKgSFqGPG70KVxdQaDibOxFLJu9Obb6', '8991234567'),
(22, 'Paola', 'Tlemoyotzi', 'paolatlemoyotzi@gmail.com', '$2y$10$Ue34zWZ92dldW5D91IYatOqRr6tQUUzVAHyQZLannYNiyaEG4Nl5i', '8994868751'),
(23, 'Castan', 'Guillermo', 'guillermo@gmail.com', '$2y$10$z0/lAUZsgPXcyGDV3LUWzO2vwjf55dOCLIb4bBDAs0cXvlPZxEqse', '1'),
(25, 'sda', 'sda', 'sda@gmail.com', '$2y$10$UB.qjOBB0kHtEa5NXEk/9eVwdjiLKdV6YYK73kUdzg0kW/54y0w6i', '8994585918'),
(26, 'zahid', 'Gutierrez', 'zahid@gmail.com', '$2y$10$PUR4EexqmIGEZoxJ0LBlmeKjeqwuZhFc.Umw2IEfChL/FgCfMbiHK', '1234123123'),
(27, 'Juan', 'Test', 'test@gmail.com', '$2y$10$HrBgONp9B3dUXhmF.X9JeOD.MLbyZZnS0zoLxAYTLpeZcRQRxF9qi', '8991234567'),
(29, 'josh', 'paco', 'joshpaco@gmail.com', '$2y$10$c7WDxxTOJr8gkZ12prVuxOBzBwhK0pWlQlIHi1/JDLBXDkdtjQdvG', '8989898989'),
(30, 'Angel', 'Leal', 'angel@gmail.com', '$2y$10$moiIsFUKXlhIh0bsqg4EeunH/bXDgm./S6RmBCB.6PWd/MURr3Ej2', '2721029182'),
(34, 'Jonathan', 'Tobias', 'ian.pkt@cisco.com', '$2y$10$kSAAWEGNzd0y5Jo0IqdKgu3MGQS.IRikYbG5BWuYEwkwGjEbLQd8S', '8992999999'),
(35, 'Francisco', 'Portilla', 'francisco.portilla@uttn.mx', '$2y$10$vEQ6oaiTzXUA0DHwoj47sOwJECPBP2ALozD2C77iAuauqbi7PFY5q', '1234567890'),
(36, 'Ananns', 'Djfjsj', 'qwe@gmail.com', '$2y$10$R/GB0PBQdZvmgBDGdcfXWuHKWZP7gBOp4HdN7F78KacopXc9DxHZ2', '1234567890'),
(37, 'kike', 'Lopez', 'kikelopez@gmail.com', '$2y$10$hPod9Vh0MXbkC4XcnkS2iOlKwX0Fz7EL1490LmiZTYrwdeR4uDMIy', '1234567890'),
(38, 'asdsadsa', 'asdas', 'dsads@gmail.com', '$2y$10$g1PBWpU2EfYdEdbj51ccgO.MH4sJz39l7HwqbdTBoBp.NLPEWi6a.', '1234567890'),
(39, 'qew', 'asd', 'dsaqwe123@gmail.com', '$2y$10$BqNM5JdrljWBA.QPgUW/3ue9b/CdpC6hXEJIP2QgK9Wv2fpd.VB22', '1234567890'),
(40, 'efren', 'guitirrez', 'efren@gmail.com', '$2y$10$cEVUW.c3B4.lKTBYSn2CtOcRmDhc3RMBbHtZuG2/CkuBUdy6AQwLi', '1234567891'),
(41, 'qwerty', 'qwerty', 'qwerty@gmail.com', '$2y$10$Xxl50xT4JygR47woZJky8uzWjO.Yw6CsQeIOlHoBjAk7HnD6CoIE2', '1234567890'),
(42, 'abigail', 'Gonzales', 'aby@gmail.com', '$2y$10$fAb3TgvmFsJZOw97iyKk6.2rVknT2XAcEBCfv7AJX3gUB7RSltqCe', '1234567891'),
(43, 'Mora', 'Tellez', 'tellez@gmail.com', '$2y$10$1xEH2PhRPmao65ifvnF1S.UtqDovJfDscp2FvNRPaDvt1lLW5Rc4K', '1234567891'),
(44, 'karen', 'tapia', 'karen@gmail.com', '$2y$10$72il.WDGQpGLcMik/EHVWuEzrrKDFYlSYihlwnJv881TS5PJknuO2', '1234567891'),
(45, 'guzman', 'campos', 'guzman@gmai.com', '$2y$10$eyCCAtgTRM63tXhTOmVYie.h3qKdK6FtcTz.2UM26nX3YSk.M/D36', '2234523535'),
(46, 'Yara', 'Ortiz', 'yara@gmail.com', '$2y$10$DxISVPxvIRqiOe.Tltqx4.aRtaD1.M91Uwuv6RmbtiOvwI1iXAOMS', '8888888888'),
(47, 'Uriel', 'Cuellar', 'saenzu147@gmail.com', '$2y$10$uwbQfL4BU59NKs9/.v0BZ.AAeMnAExumbyuPFQ4NSAH9enkfmppi.', '8991667755'),
(48, 'miguel', 'Jose', 'jose@gmail.com', '$2y$10$4yyVRDwo1jMNgnAy7wzWx.1jjQXeWD6tzA/JpMcfhkCAIiWBzL7w2', '1233423422'),
(49, 'Daniel', 'Guillermo', 'dguillermo30@gmail.com', '$2y$10$Tm/gplXtlEOOGBAUUcR7bOZ77H52m0HfwyNrhifbKRUfhlC8obVni', '8992243756'),
(52, 'ldksjalj', 'jkljlkj', 'sljak@gmail.com', '$2y$10$Ygf9WtSw1HzObfXSo/5FTOzSjnffB1ce.x3oQMexEZ0IkKGeEwrmm', '1234567890'),
(54, '<h1>A</<h1>', 'fddsdsf', 'ljdkasl@gmail.com', '$2y$10$IbZ6U4qjqoLjPyYf8o5h3uROkciV9YLGG1ii7/rdqyRj.EHU5jT1y', '1234567890'),
(55, 'ljdlsajl', 'jdslkajl', 'dlksjajdska@gmail.com', '$2y$10$n1yo1IWM.N4C0Y5A4PsweupSAUNQZ.JgTj.cn.1RgPErahnBQeFoC', '1234567890'),
(56, '<h1>PTM</<h1>', 'fddsdsf', 'ljdkaksl@gmail.com', '$2y$10$7s8saQDMlSriHVEMtp8W7.qpiC2/EAaWKCd3Y6RdU6tBPZ0VflVPS', '1234567890'),
(57, '\\\'\\\'\\\'a\\\'\\\';;;1100-__/', 'dlkjas', 'alaxd@gmail.com', '$2y$10$.vgQRUiPWknPcGkmbllIO.K0Wm5gtBWDXvwgaL8wIWcN8a6mhv.Gi', '1234567890'),
(58, '<h1>PTM2</h1>', 'lkjdlsa', 'doiqw2@gmail.com', '$2y$10$nM2rcc4Ijd9/6wyaDtxSw.3eOh5oKF3b1bMoU92NXU0b0sGxD0Rse', '1234567890'),
(59, '<asl-\\\'s\\\'as<h1>AJSLKAJLS</h1>', 'lkxjakjl', 'jsa911@gmail.com', '$2y$10$89nVGh2BfF9Bqu4G58CMVOZHP0NLdbpOTDGbVll8k5FvLf/Sx0Uy.', '1234567890'),
(60, '<h1>XD ADJSLAK</h1>', 'jdlaksj', 'daskjadsjlk3@gmail.com', '$2y$10$9/bEnhU.StFOM5nh7VuUW.3A5GMGDKcZKj2HLg6xprRbCHp2xoEya', '1234567890'),
(61, 'A', 'B', 'ldsjka@gmail.com', '$2y$10$tbsOYNodgipA3xguUNpta./9vVMywQVmBb7aNgGQvByIXkmPjfXWu', '1234567890'),
(62, '', 'sldjak', 'sldkja@gmail.com', '$2y$10$3KVjOywI0opVBCLY1T5vy.LdM7TaPna4O0W/y.7hu/ZF4zyNpv8fu', '1234567890'),
(63, 'XD A', 'dlsajkdsl', 'lkadsjas22@gmail.com', '$2y$10$LnNjh3U/lkMxaPnQ3eGGw.hRZLbgDuYTLgEEmWoxfvu9yJfhY/pUy', '1234567890');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE `compra` (
  `idCompra` int(11) NOT NULL,
  `idTransaccion` varchar(20) NOT NULL,
  `cantidadBoletos` int(11) NOT NULL,
  `nombreCuenta` varchar(30) NOT NULL,
  `emailCuenta` varchar(30) NOT NULL,
  `fecha` datetime NOT NULL,
  `status` varchar(20) NOT NULL,
  `total` decimal(10,0) NOT NULL,
  `costo_servicio` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `compra`
--

INSERT INTO `compra` (`idCompra`, `idTransaccion`, `cantidadBoletos`, `nombreCuenta`, `emailCuenta`, `fecha`, `status`, `total`, `costo_servicio`) VALUES
(127, '001', 4, 'daniela  sanchez', 'dnlasnchz@hotmail.com', '2023-05-03 10:18:33', 'COMPLETADO', 800, 0),
(155, '001', 10, 'miranda  garcia ', 'gcvalentina@icloud.com', '2023-05-16 17:06:33', 'COMPLETADO', 2000, 0),
(156, '001', 10, 'otilia  gonzalez ', 'ballerinadanzayarte@gmail.com', '2023-05-16 17:18:10', 'COMPLETADO', 2000, 0),
(181, '001', 4, 'Antonio  Martinez', 'amtzhdz3@gmail.com', '2023-05-22 09:51:19', 'COMPLETADO', 400, 0),
(182, '001', 3, 'Sanjuanita Flores', 'sgflores94@hotmail.com', '2023-05-22 09:53:25', 'COMPLETADO', 300, 0),
(183, '001', 5, 'Orlando Sedas', 'rene_sedas@hotmail.com', '2023-05-22 10:35:25', 'COMPLETADO', 500, 0),
(184, '001', 1, 'Simon Trevino', 'simon.trevino@prodigy.net.mx', '2023-05-22 10:44:36', 'COMPLETADO', 100, 0),
(185, '001', 1, 'Belinda Trevino', 'belinda_nte@hotmail.com', '2023-05-22 10:46:42', 'COMPLETADO', 100, 0),
(188, '001', 9, 'Aurora Sanchez', 'sareyaurora60@gmail.com', '2023-05-22 11:32:16', 'COMPLETADO', 900, 0),
(189, '001', 4, 'Luz Edith Perez', 'perez.aranda.luz@gmail.com', '2023-05-22 11:35:24', 'COMPLETADO', 400, 0),
(190, '001', 4, 'Antonio Martinez', 'amtzhdz3@gmail.com', '2023-05-22 11:36:51', 'COMPLETADO', 400, 0),
(191, '001', 1, 'Simon Esteban Trevino Garza', 'simon.trevino@prodigy.net.mx', '2023-05-22 11:37:51', 'COMPLETADO', 100, 0),
(193, '001', 5, 'Rubi Padilla', 'abg_245@hotmail.com', '2023-05-22 12:25:09', 'COMPLETADO', 500, 0),
(194, '001', 1, 'Diana Aparicio', 'diana_aparicio27@hotmail.com', '2023-05-22 12:28:59', 'COMPLETADO', 100, 0),
(195, '001', 10, 'Luz Edith Perez', 'perez.aranda.luz@gmail.com', '2023-05-22 12:31:44', 'COMPLETADO', 1000, 0),
(196, '001', 5, 'Ivanna Rojas', 'ivanna_alr97@hotmail.com', '2023-05-22 12:35:38', 'COMPLETADO', 500, 0),
(197, '001', 2, 'Artemisa  Sedas', 'academiarolsed@hotmail.com', '2023-05-22 12:39:18', 'COMPLETADO', 200, 0),
(198, '001', 1, 'Adelita  Sedas', 'acmejia76@gmail.com', '2023-05-22 12:41:47', 'COMPLETADO', 100, 0),
(199, '001', 8, 'Aida Torres', 'aidiuxtc@hotmail.com', '2023-05-22 12:49:42', 'COMPLETADO', 800, 0),
(201, '001', 36, 'brandon  sandoval ', 'ballerinadanzayarte@gmail.com', '2023-05-22 16:25:28', 'COMPLETADO', 7200, 0),
(203, '001', 10, 'Ruth Cortez', 'ruthcdes@gmail.com', '2023-05-22 17:04:02', 'COMPLETADO', 1000, 0),
(204, '001', 10, 'Martha Garza', 'martha.garza@cobat.edu.mx', '2023-05-22 17:29:24', 'COMPLETADO', 1000, 0),
(207, '001', 10, 'Rosy Segura', 'rosysegura1976@gmail.com', '2023-05-22 17:56:05', 'COMPLETADO', 1000, 0),
(208, '71X76973RU520101J', 1, 'guillermo sanchez', 'memojones08@gmail.com', '2023-05-25 17:08:55', 'COMPLETED', 220, NULL),
(209, '4VY98339PU735551J', 1, 'Guillermo Elizalde', 'memojones08@gmail.com', '2023-05-25 17:18:24', 'COMPLETED', 10, NULL),
(210, '001', 2, 'Laura luevano', 'ballerinadanzayarte@gmail.com', '2023-05-26 15:59:10', 'COMPLETADO', 600, 0),
(211, '001', 2, 'Brenda Snell', 'ballerinadanzayarte@gmail.com', '2023-05-26 16:00:34', 'COMPLETADO', 600, 0),
(212, '001', 4, 'laura  luevano', 'ballerinadanzayarte@gmail.com', '2023-05-26 16:03:43', 'COMPLETADO', 1200, 0),
(213, '001', 4, 'laura  luevano', 'ballerinadanzayarte@gmail.com', '2023-05-26 16:05:49', 'COMPLETADO', 1200, 0),
(215, '001', 10, 'Aleyda Saenz', 'aleydasaenzflores@gmail.com', '2023-05-26 18:38:58', 'COMPLETADO', 1000, 0),
(217, '001', 10, 'Ethel Ramirez', 'draethelrmz@hotmail.com', '2023-05-27 09:37:44', 'COMPLETADO', 1000, 0),
(218, '001', 10, 'Leticia Tovar', 'leticiatovare@gmail.com', '2023-05-27 09:50:40', 'COMPLETADO', 1000, 0),
(219, '001', 10, 'Paola  Ramirez', 'pao_rmz86@hotmail.com', '2023-05-27 09:53:37', 'COMPLETADO', 1000, 0),
(222, '001', 10, 'Lylian Adame', 'lylaadame_g@hotmail.com', '2023-05-27 12:13:58', 'COMPLETADO', 1000, 0),
(223, '001', 10, 'Anaid Alarcon', 'anaidalarconm@gmail.com', '2023-05-27 12:41:51', 'COMPLETADO', 1000, 0),
(224, '001', 11, 'Mariana Vargas', 'drsmarianavargas@hotmail.com', '2023-05-27 14:45:58', 'COMPLETADO', 1100, 0),
(226, '001', 10, 'Alma Fayett', 'almisfayett@gmail.com', '2023-05-27 16:25:06', 'COMPLETADO', 1000, 0),
(227, '001', 10, 'Sanjuanita Hernandez', 'sanjuis_hdz@hotmail.com', '2023-05-27 16:35:31', 'COMPLETADO', 1000, 0),
(228, '001', 10, 'Chely Maya', 'graciela_maya@hotmail.com', '2023-05-27 16:55:33', 'COMPLETADO', 1000, 0),
(229, '001', 10, 'Lulu Guarneros', 'lguarnerosalatorre@gmail.com', '2023-05-27 17:01:36', 'COMPLETADO', 1000, 0),
(230, '001', 10, 'Lizeth Cavazos', 'lizcavazos@outlook.com', '2023-05-27 17:08:38', 'COMPLETADO', 1000, 0),
(231, '001', 10, 'Elida Barbosa', 'elypower@hotmail.com', '2023-05-27 17:33:36', 'COMPLETADO', 1000, 0),
(232, '001', 10, 'Yadira Ramirez', 'yramirez.8a@gmail.com', '2023-05-27 17:58:57', 'COMPLETADO', 1000, 0),
(233, '001', 11, 'Ceny Villarreal', 'ceny14@hotmail.com', '2023-05-27 18:10:51', 'COMPLETADO', 1100, 0),
(234, '001', 10, 'Vero Alvarado', 'veriiito-alvarado@hotmail.com', '2023-05-27 18:27:09', 'COMPLETADO', 1000, 0),
(236, '001', 10, 'Jessica Herebia', 'jessi_herebia@hotmail.com', '2023-05-27 18:48:11', 'COMPLETADO', 1000, 0),
(239, '4FN65624L75121640', 1, 'Guillermo Elizalde', 'memojones08@gmail.com', '2023-05-30 00:32:43', 'COMPLETED', 220, NULL),
(242, '001', 10, 'hector  torruco', 'ballerinadanzayarte@gmail.com', '2023-05-30 16:50:45', 'COMPLETADO', 3000, 0),
(243, '001', 10, 'ivanna  navarro', 'ballerinadanzayarte@gmail.com', '2023-05-30 16:55:11', 'COMPLETADO', 3000, 0),
(244, '001', 10, 'tamara  segoviano', 'ballerinadanzayarte@gmail.com', '2023-05-30 16:58:43', 'COMPLETADO', 2000, 0),
(245, '001', 10, 'renata  gamboa', 'ballerinadanzayarte@gmail.com', '2023-05-30 17:01:43', 'COMPLETADO', 2000, 0),
(246, '001', 10, 'victoria garcia', 'ballerinadanzayarte@gmail.com', '2023-05-30 17:14:34', 'COMPLETADO', 3000, 0),
(247, '001', 10, 'kamilha  zoe ', 'ballerinadanzayarte@gmail.com', '2023-05-30 17:23:28', 'COMPLETADO', 2000, 0),
(248, '001', 6, 'brenda  snell', 'ballerinadanzayarte@gmail.com', '2023-05-31 16:17:58', 'COMPLETADO', 1800, 0),
(249, '001', 2, 'brenda  snell', 'ballerinadanzayarte@gmail.com', '2023-05-31 16:19:36', 'COMPLETADO', 600, 0),
(250, '001', 10, 'Ana Rebecca Castillo Alanis', 'ballerinadanzayarte@gmail.com', '2023-05-31 19:09:58', 'COMPLETADO', 2000, 0),
(251, '001', 10, 'valeria guillen', 'ballerinadanzayarte@gmail.com', '2023-06-01 20:38:12', 'COMPLETADO', 2500, 0),
(252, '001', 10, 'Paty Orta', 'ballerinadanzayarte@gmail.com', '2023-06-01 20:40:07', 'COMPLETADO', 2500, 0),
(253, '001', 10, 'Alejandra Vargas', 'alejandravargasvelasco@gmail.c', '2023-06-02 10:10:52', 'COMPLETADO', 1000, 0),
(254, '001', 10, 'Laura Contreras', 'lcontreras@papeleraabc.com', '2023-06-02 10:40:16', 'COMPLETADO', 1000, 0),
(256, '001', 10, 'Blanca Moctezuma', 'abiliz08@hotmail.com', '2023-06-02 11:32:04', 'COMPLETADO', 1000, 0),
(257, '001', 10, 'Rocio Avila', 'rocio.avilag@outlook.com', '2023-06-02 14:49:36', 'COMPLETADO', 1000, 0),
(258, '001', 10, 'Karen  Quintanilla', 'karen_quintanilla@hotmail.com', '2023-06-02 14:57:21', 'COMPLETADO', 1000, 0),
(259, '001', 10, 'Catalina Juarez', 'katytea21@gmail.com', '2023-06-03 09:45:11', 'COMPLETADO', 1000, 0),
(261, '001', 10, 'Valeria Fuentes', 'valeria.reynosa@gmail.com', '2023-06-03 10:12:15', 'COMPLETADO', 1000, 0),
(262, '001', 10, 'Amaparo Carrillo', 'mariamparo_gaeta@hotmail.com', '2023-06-03 10:35:08', 'COMPLETADO', 1000, 0),
(263, '001', 1, 'Damian  Sedas', 'damiansedas@hotmail.com', '2023-06-03 10:47:30', 'COMPLETADO', 100, 0),
(264, '001', 9, 'Kenya  Salazar', 'kenyasalazar@hotmail.com', '2023-06-03 10:54:26', 'COMPLETADO', 900, 0),
(265, '001', 10, 'Nora Cavazos', 'norac7322_3@hotmail.com', '2023-06-03 11:07:26', 'COMPLETADO', 1000, 0),
(267, '001', 10, 'Isabel Centeno', 'isabel_cpa@hotmail.com', '2023-06-03 11:36:46', 'COMPLETADO', 1000, 0),
(268, '001', 10, 'Elizabeth Cortez', 'cortez_ely@hotmail.com', '2023-06-03 11:41:48', 'COMPLETADO', 1000, 0),
(269, '001', 10, 'Sandrina Morales', 'sandrina_89@hotmail.com', '2023-06-03 11:45:43', 'COMPLETADO', 1000, 0),
(270, '001', 10, 'Vero Gallegos', '5038vero@gmail.com', '2023-06-03 11:50:45', 'COMPLETADO', 1000, 0),
(271, '001', 10, 'Liliana Sanchez', 'lilianaxoxo@hotmail.com', '2023-06-03 12:03:38', 'COMPLETADO', 1000, 0),
(272, '001', 10, 'Claudia Alvarado', 'clau_yanet12@hotmail.com', '2023-06-03 12:11:30', 'COMPLETADO', 1000, 0),
(273, '001', 10, 'Jessica Salinas', 'yessica_salinas@hotmail.com', '2023-06-03 12:15:19', 'COMPLETADO', 1000, 0),
(275, '001', 10, 'Adriana Vincent', 'a_vincent_g@hotmail.com', '2023-06-03 12:31:17', 'COMPLETADO', 1000, 0),
(277, '001', 10, 'Karen Alamillo', 'karen.alarey@hotmail.com', '2023-06-03 12:50:16', 'COMPLETADO', 1000, 0),
(279, '001', 10, 'Martha Azocar', 'esteticagema@hotmail.com', '2023-06-03 13:08:01', 'COMPLETADO', 1000, 0),
(280, '001', 10, 'Patty Alamillo', 'patoalre@gmail.com', '2023-06-03 13:12:11', 'COMPLETADO', 1000, 0),
(281, '001', 10, 'Alejandra Lopez', 'alelpz85@hotmail.com', '2023-06-03 13:15:09', 'COMPLETADO', 1000, 0),
(282, '001', 10, 'liliana Benavides', 'lyly_ica@hotmail.com', '2023-06-03 13:33:42', 'COMPLETADO', 1000, 0),
(283, '001', 10, 'Veronica Careaga', 'dracareaga@hotmail.com', '2023-06-03 13:39:46', 'COMPLETADO', 1000, 0),
(284, '001', 10, 'Florentina  Santos', 'florecitasantos.jones@gmail.co', '2023-06-05 19:29:10', 'COMPLETADO', 1000, 0),
(285, '001', 5, 'Vero Gallegos', '5038vero@gmail.com', '2023-06-05 21:41:13', 'COMPLETADO', 500, 0),
(286, '001', 1, 'Vero Gallegos', '5038vero@gmail.com', '2023-06-05 21:46:31', 'COMPLETADO', 100, 0),
(287, '001', 3, 'Ethel Ramirez', 'draethelrmz@hotmail.com', '2023-06-05 21:58:58', 'COMPLETADO', 300, 0),
(288, '001', 5, 'Ethel Ramirez', 'draethelrmz@hotmail.com', '2023-06-05 22:00:01', 'COMPLETADO', 500, 0),
(289, '001', 10, 'Mayra Juarez', 'mayra_0186@hotmail.com', '2023-06-07 15:40:50', 'COMPLETADO', 1000, 0),
(290, '001', 5, 'Mayra Juarez', 'mayra_0186@hotmail.com', '2023-06-07 15:51:20', 'COMPLETADO', 500, 0),
(291, '001', 4, 'Vero Alvarado', 'veriiito-alvarado@hotmail.com', '2023-06-07 15:53:00', 'COMPLETADO', 400, 0),
(292, '001', 10, 'Adriana Camacho', 'adsofia@hotmail.com', '2023-06-07 15:55:36', 'COMPLETADO', 1000, 0),
(293, '001', 10, 'Mariel Lopez', 'msla1206@gmail.com', '2023-06-07 16:04:38', 'COMPLETADO', 1000, 0),
(294, '001', 1, 'Mariel Lopez', 'msla1206@gmail.com', '2023-06-07 16:05:57', 'COMPLETADO', 100, 0),
(295, '001', 2, 'Alma Fayett', 'almafayett@hotmail.com', '2023-06-07 16:09:11', 'COMPLETADO', 200, 0),
(296, '001', 2, 'Karen Quintanilla', 'karen_quintanilla@hotmail.com', '2023-06-07 16:52:39', 'COMPLETADO', 200, 0),
(298, '001', 1, 'Ethel Ramirez', 'draethelrmz@hotmail.com', '2023-06-07 17:10:10', 'COMPLETADO', 100, 0),
(299, '001', 10, 'Juany Montes', 'diosy5juanes@hotmail.com', '2023-06-07 17:15:19', 'COMPLETADO', 1000, 0),
(300, '001', 3, 'Adriana Perez', 'sylvia_roldan@hotmail.com', '2023-06-07 17:44:32', 'COMPLETADO', 300, 0),
(301, '001', 4, 'Elida Barbosa', 'elypower@hotmail.com', '2023-06-07 17:45:54', 'COMPLETADO', 400, 0),
(302, '001', 42, 'Ruth cortez', 'ruthcdes@gmail.com', '2023-06-07 17:58:55', 'COMPLETADO', 4200, 0),
(303, '001', 4, 'Lulu Guarneros', 'lguarnerosalatorre@gmail.com', '2023-06-07 18:07:50', 'COMPLETADO', 400, 0),
(304, '001', 8, 'Sanjuanita Hernandez', 'sanjuis_hdz@hotmail.com', '2023-06-07 18:11:37', 'COMPLETADO', 800, 0),
(305, '001', 1, 'Martha Garza', 'martha.garza@cobat.edu.mx', '2023-06-07 19:01:40', 'COMPLETADO', 100, 0),
(306, '001', 9, 'Martha Garza', 'martha.garza@cobat.edu.mx', '2023-06-07 19:03:57', 'COMPLETADO', 900, 0),
(307, '001', 6, 'CENY  Villarreal ', 'ceny14@hotmail.com', '2023-06-07 19:21:26', 'COMPLETADO', 600, 0),
(308, '001', 8, 'Rocio Aleman ', 'miguel070709@hotmail.com', '2023-06-07 19:39:51', 'COMPLETADO', 800, 0),
(309, '001', 10, 'devany  hernandez ', 'ballerinadanzayarte@gmail.com', '2023-06-08 17:01:33', 'COMPLETADO', 3500, 0),
(310, '001', 10, 'allison  bautista ', 'ballerinadanzayarte@gmail.com', '2023-06-08 17:14:06', 'COMPLETADO', 2500, 0),
(311, '001', 6, 'Blanca Moctezuma', 'abiliz08@hotmail.com', '2023-06-08 19:26:50', 'COMPLETADO', 600, 0),
(314, '001', 3, 'Zayra Hernandez', 'yunmat04@gmail.com', '2023-06-08 19:33:29', 'COMPLETADO', 300, 0),
(315, '001', 2, 'Rubi Padilla', 'abg_245@hotmail.com', '2023-06-08 19:41:59', 'COMPLETADO', 200, 0),
(316, '001', 9, 'Rubi Padilla', 'abg_245@hotmail.com', '2023-06-08 19:44:34', 'COMPLETADO', 900, 0),
(317, '001', 5, 'Jaqueline Espinoza', 'yaquie.espinoza77@hotmail.com', '2023-06-08 20:33:20', 'COMPLETADO', 500, 0),
(318, '001', 10, 'Elizabeth Lopez', 'betylopez80@gmail.com', '2023-06-08 20:42:35', 'COMPLETADO', 1000, 0),
(319, '001', 4, 'Bertha Duenas', 'berthaduenasirca@gmail.com', '2023-06-08 20:50:58', 'COMPLETADO', 400, 0),
(320, '001', 10, 'Jaqueline Robledo', 'delangel_54@hotmail.com', '2023-06-09 08:31:25', 'COMPLETADO', 1000, 0),
(321, '001', 6, 'Alexa Yanez', 'alexa_yh@hotmail.com', '2023-06-09 08:46:27', 'COMPLETADO', 600, 0),
(322, '001', 9, 'Vero Gallegos', '5038vero@gmail.com', '2023-06-09 09:00:43', 'COMPLETADO', 900, 0),
(323, '001', 10, 'Yoselin  Delgado', 'yoselindelgado252@gmail.com', '2023-06-09 09:32:34', 'COMPLETADO', 1000, 0),
(324, '001', 6, 'Jaqueline Robledo', 'delangel_54@hotmail.com', '2023-06-09 09:37:02', 'COMPLETADO', 600, 0),
(326, '001', 4, 'Graciela Moran', 'graciela_io@hotmail.com', '2023-06-09 10:07:19', 'COMPLETADO', 400, 0),
(327, '001', 3, 'Cesar Perez', 'cesarp5537902@gmail.com', '2023-06-09 10:15:19', 'COMPLETADO', 300, 0),
(328, '001', 10, 'Sarahi Martinez', 'qfb_mt12@hotmail.com', '2023-06-09 12:12:10', 'COMPLETADO', 1000, 0),
(329, '001', 10, 'Fernanda Lozano', 'fernanda.camarena2000@gmail.co', '2023-06-09 12:14:55', 'COMPLETADO', 1000, 0),
(331, '001', 10, 'Graciela Moran', 'graciela_io@hotmail.com', '2023-06-09 15:13:23', 'COMPLETADO', 1000, 0),
(332, '4XE95437N9032873A', 2, 'Elizabeth Rodriguez Segura', 'memojones08@gmail.com', '2023-06-09 23:10:03', 'COMPLETED', 472, NULL),
(333, '47G64007GY034410L', 3, 'jesus nunez', 'memojones08@gmail.com', '2023-06-10 15:47:14', 'COMPLETED', 1062, NULL),
(334, '60J42635LR342245U', 2, 'Sandra Vanessa Parada Pablo', 'memojones08@gmail.com', '2023-06-11 15:02:55', 'COMPLETED', 472, NULL),
(335, '001', 6, 'Laura Contreras', 'lcontreras@papeleraabc.com', '2023-06-11 11:24:18', 'COMPLETADO', 600, 0),
(336, '001', 11, 'Jaqueline Espinoza', 'yaquie.espinoza77@hotmail.com', '2023-06-11 11:28:59', 'COMPLETADO', 1100, 0),
(338, '001', 4, 'Martha Aviles', 'cmmia1104@gmail.com', '2023-06-11 11:35:40', 'COMPLETADO', 400, 0),
(339, '001', 10, 'Martha Aviles', 'cmmia1104@gmail.com', '2023-06-11 11:38:28', 'COMPLETADO', 1000, 0),
(340, '001', 10, 'Sandrina Morales', 'sandrina_89@hotmail.com', '2023-06-11 12:42:13', 'COMPLETADO', 1000, 0),
(341, '001', 7, 'Claudia Alvarado', 'clau_yanet12@hotmail.com', '2023-06-11 12:44:59', 'COMPLETADO', 700, 0),
(342, '001', 16, 'Catalina Juarez', 'katytea21@gmail.com', '2023-06-11 12:48:27', 'COMPLETADO', 1600, 0),
(345, '001', 4, 'Aleyda Saenz', 'aleydasaenzflores@gmail.com', '2023-06-11 13:08:13', 'COMPLETADO', 400, 0),
(347, '001', 2, 'Mariana Vargas', 'drsmarianavargas@hotmail.com', '2023-06-11 13:13:53', 'COMPLETADO', 200, 0),
(348, '001', 1, 'Valeria Fuentes', 'valeria.reynosa@gmail.com', '2023-06-11 13:16:45', 'COMPLETADO', 100, 0),
(349, '001', 1, 'luz edith perez', 'perez.aranda.luz@gmail.com', '2023-06-11 13:20:52', 'COMPLETADO', 100, 0),
(351, '001', 6, 'Mariel Lopez', 'msla1206@gmail.com', '2023-06-11 13:26:05', 'COMPLETADO', 600, 0),
(352, '001', 10, 'Franky Gutierrez', 'frankygutierrez9@gmail.com', '2023-06-11 13:42:04', 'COMPLETADO', 1000, 0),
(353, '9AM14342JR532512U', 3, 'Zaidaly leonela Ayala Alanis', 'memojones08@gmail.com', '2023-06-11 19:57:21', 'COMPLETED', 708, NULL),
(354, '001', 10, 'hermanas  arias ', 'ballerinadanzayarte@gmail.com', '2023-06-12 17:05:10', 'COMPLETADO', 3500, 0),
(355, '001', 3, 'liliana Benavides', 'lyly_ica@hotmail.com', '2023-06-12 17:59:36', 'COMPLETADO', 300, 0),
(356, '48263782ML515374U', 2, 'Ileana Gutierrez', 'memojones08@gmail.com', '2023-06-13 01:59:47', 'COMPLETED', 472, NULL),
(357, '001', 4, 'Paola Ramirez', 'pao_rmz86@hotmail.com', '2023-06-13 08:02:25', 'COMPLETADO', 400, 0),
(358, '001', 1, 'Aida Torres', 'aidiuxtc@hotmail.com', '2023-06-13 08:08:55', 'COMPLETADO', 100, 0),
(359, '93E06080XK723661S', 2, 'Elizabeth Santiago', 'memojones08@gmail.com', '2023-06-13 16:57:37', 'COMPLETED', 472, NULL),
(360, '001', 10, 'Abigail Garcia Quintana', 'ballerinadanzayarte@gmail.com', '2023-06-13 17:55:04', 'COMPLETADO', 2500, 0),
(361, '001', 1, 'Aida Torres', 'aidiuxtc@hotmail.com', '2023-06-13 20:06:46', 'COMPLETADO', 100, 0),
(362, '001', 2, 'Paola Ramirez', 'pao_rmz86@hotmail.com', '2023-06-13 20:11:03', 'COMPLETADO', 200, 0),
(363, '001', 7, 'Jessica Salinas', 'yessica_salinas@hotmail.com', '2023-06-13 20:33:31', 'COMPLETADO', 700, 0),
(364, '001', 2, 'Claudia Alvarado', 'clau_yanet12@hotmail.com', '2023-06-13 20:36:46', 'COMPLETADO', 200, 0),
(365, '001', 2, 'Martha Azocar', 'esteticagema@hotmail.com', '2023-06-13 20:51:19', 'COMPLETADO', 200, 0),
(366, '001', 5, 'Nora Cavazos', 'norac7322_3@hotmail.com', '2023-06-13 20:55:54', 'COMPLETADO', 500, 0),
(367, '001', 11, 'Elizabeth Cortez', 'cortez_ely@hotmail.com', '2023-06-13 21:01:35', 'COMPLETADO', 1100, 0),
(368, '001', 1, 'Ruth cortez', 'ruthcdes@gmail.com', '2023-06-13 21:02:51', 'COMPLETADO', 100, 0),
(369, '001', 10, 'Sanjuanita Garcia', 'sanjuanitaedith@hotmail.com', '2023-06-13 21:17:29', 'COMPLETADO', 1000, 0),
(370, '001', 10, 'Cecilia Turriza', 'cesdrdz@gmail.com', '2023-06-13 21:21:03', 'COMPLETADO', 1000, 0),
(371, '001', 10, 'Sarahi  Cigala', 'valeriacigala2121@gmail.com', '2023-06-13 21:28:41', 'COMPLETADO', 1000, 0),
(372, '001', 10, 'Iker Ruiz', 'melladoo.maar@gmail.com', '2023-06-13 22:10:30', 'COMPLETADO', 1000, 0),
(373, '001', 10, 'Anselma Herrera', 'herrerardzma_jjoa@hotmail.com', '2023-06-13 22:18:06', 'COMPLETADO', 1000, 0),
(374, '001', 2, 'Paulette Garza', 'academiarolsed@hotmail.com', '2023-06-13 22:30:54', 'COMPLETADO', 200, 0),
(375, '001', 10, 'Angeles  Martinez', 'lae.luzangel@gmail.com', '2023-06-13 22:41:13', 'COMPLETADO', 1000, 0),
(376, '001', 2, 'Rocio  Aleman', 'miguel070709@hotmail.com', '2023-06-14 06:21:11', 'COMPLETADO', 200, 0),
(377, '001', 1, 'Karen  Alamillo', 'karen.alarey@hotmail.com', '2023-06-14 06:27:12', 'COMPLETADO', 100, 0),
(378, '001', 1, 'Felizardo Garcia', 'felizardo_garcia@hotmail.com', '2023-06-14 06:37:39', 'COMPLETADO', 100, 0),
(379, '001', 10, 'Blanca Granados', 'aldoespinosamd@gmail.com', '2023-06-14 06:49:23', 'COMPLETADO', 1000, 0),
(381, '001', 2, 'lulu guarneros', 'lguarnerosalatorre@gmail.com', '2023-06-14 15:22:52', 'COMPLETADO', 200, 0),
(382, '001', 4, 'Amparo Carrillo', 'mariamparo_gaeta@hotmail.com', '2023-06-14 15:45:55', 'COMPLETADO', 400, 0),
(383, '001', 4, 'blanca Moctezuma', 'abiliz08@hotmail.com', '2023-06-14 15:50:02', 'COMPLETADO', 400, 0),
(384, '001', 10, 'Esmeralda Gomez', 'bbvaizq87@hotmail.com', '2023-06-14 16:39:34', 'COMPLETADO', 1000, 0),
(387, '001', 2, 'Jaqueline Robledo', 'delangel_54@hotmail.com', '2023-06-14 17:32:43', 'COMPLETADO', 200, 0),
(388, '001', 2, 'Rocio Avila', 'rocio.avilag@outlook.com', '2023-06-14 17:54:02', 'COMPLETADO', 200, 0),
(390, '001', 1, 'sylvia roldan', 'sylvia_roldan@hotmail.com', '2023-06-14 18:31:55', 'COMPLETADO', 100, 0),
(391, '001', 10, 'KAROL CASTILLO', 'ballerinadanzayarte@gmail.com', '2023-06-14 18:54:13', 'COMPLETADO', 2500, 0),
(392, '001', 10, 'Martha Azocar', 'esteticagema@hotmail.com', '2023-06-15 09:52:21', 'COMPLETADO', 1000, 0),
(394, '001', 10, 'cinthia Lopez', 'wichotc@hotmail.com', '2023-06-15 10:26:16', 'COMPLETADO', 1000, 0),
(395, '001', 3, 'cinthia Lopez', 'wichotc@hotmail.com', '2023-06-15 10:27:58', 'COMPLETADO', 300, 0),
(396, '001', 6, 'Claudia sedas', 'claudiasedas@hotmail.com', '2023-06-15 10:33:34', 'COMPLETADO', 600, 0),
(397, '001', 4, 'Hector  Galindo', 'hgalindog@hotmail.com', '2023-06-15 11:15:14', 'COMPLETADO', 400, 0),
(399, '001', 2, 'Fita Zamora', 'mgarsol@hotmail.com', '2023-06-15 11:20:23', 'COMPLETADO', 200, 0),
(401, '001', 2, 'Alejandra Lorenza', 'aleloz.cr@gmail.com', '2023-06-15 12:40:33', 'COMPLETADO', 200, 0),
(402, '001', 20, 'Isabel Centeno', 'isabel_cpa@hotmail.com', '2023-06-15 16:49:56', 'COMPLETADO', 2000, 0),
(403, '001', 5, 'Keren Santamaria', 'keren.asv01@gmail.com', '2023-06-15 18:40:01', 'COMPLETADO', 500, 0),
(404, '001', 1, 'Nora Cavazos', 'norac7322_3@hotmail.com', '2023-06-15 18:45:00', 'COMPLETADO', 100, 0),
(405, '001', 2, 'Lalo Sanchez', 'jorge.sanchez.mtz@hotmail.com', '2023-06-15 18:51:15', 'COMPLETADO', 500, 0),
(406, '001', 2, 'Ivanna Rojas', 'ivanna_alr97@hotmail.com', '2023-06-15 19:18:30', 'COMPLETADO', 200, 0),
(407, '001', 2, 'Rubi Padilla', 'abg_245@hotmail.com', '2023-06-15 19:35:07', 'COMPLETADO', 200, 0),
(408, '001', 3, 'Adriana Camacho', 'adsofia@hotmail.com', '2023-06-15 19:41:45', 'COMPLETADO', 300, 0),
(409, '001', 4, 'Pamela Sedas', 'sedas.rivera@hotmail.com', '2023-06-15 20:13:33', 'COMPLETADO', 400, 0),
(410, '5BX91776F2585625N', 2, 'Juan Jose Almazan Moreno', 'memojones08@gmail.com', '2023-06-16 16:28:13', 'COMPLETED', 295, NULL),
(411, '6F734555GW737690P', 4, 'Enver Hassan  Martínez Jiménez', 'memojones08@gmail.com', '2023-06-16 16:41:32', 'COMPLETED', 826, NULL),
(412, '5TD742733A476621W', 2, 'Eusebio Latiholett Bastian', 'memojones08@gmail.com', '2023-06-16 17:57:03', 'COMPLETED', 413, NULL),
(414, '001', 2, 'Yoselin Delgado', 'yoselindelgado252@gmail.com', '2023-06-16 12:43:35', 'COMPLETADO', 200, 0),
(415, '001', 5, 'Irma Mora', '8992491623@gmail.com', '2023-06-16 13:03:29', 'COMPLETADO', 500, 0),
(416, '001', 2, 'Mine Ernesto', 'ernesto_seguridadprivada@hotma', '2023-06-16 13:14:05', 'COMPLETADO', 200, 0),
(417, '8X685787NW6560148', 2, 'Maria del pilar Sanchez sanche', 'memojones08@gmail.com', '2023-06-16 19:36:52', 'COMPLETED', 295, NULL),
(418, '6NA55600TJ091815M', 2, 'Manuel Adolfo Ramos Aguirre', 'memojones08@gmail.com', '2023-06-16 20:47:25', 'COMPLETED', 413, NULL),
(419, '7M922199SD2264604', 4, 'Elma Del Ángel Sobrevilla', 'memojones08@gmail.com', '2023-06-17 04:20:33', 'COMPLETED', 590, NULL),
(420, '05X39311PM705073L', 2, 'Fernanda Cano', 'memojones08@gmail.com', '2023-06-18 22:59:28', 'COMPLETED', 295, NULL),
(421, '5Y1584861C863590H', 2, 'Rosa isela Gonzalez cerda', 'memojones08@gmail.com', '2023-06-18 23:42:08', 'COMPLETED', 295, NULL),
(422, '93G33175M23233506', 2, 'VALERIA ELIZABETH CASTRO CIENF', 'memojones08@gmail.com', '2023-06-19 00:38:30', 'COMPLETED', 295, NULL),
(423, '36206579G4774390L', 4, 'SANDRA URIBE', 'memojones08@gmail.com', '2023-06-19 01:13:46', 'COMPLETED', 826, NULL),
(424, '9NG99647Y5468241B', 6, 'Sergio Gonzalez Berra', 'memojones08@gmail.com', '2023-06-19 04:58:41', 'COMPLETED', 885, NULL),
(425, '2BG194607M754980K', 6, 'evelio espinoza', 'memojones08@gmail.com', '2023-06-19 12:57:53', 'COMPLETED', 885, NULL),
(426, '4UM969942F324080G', 2, 'Yesenia Gonzalez Cornejo', 'memojones08@gmail.com', '2023-06-19 13:03:19', 'COMPLETED', 295, NULL),
(427, '3TM656604F665442K', 2, 'Nayla Hernandez', 'memojones08@gmail.com', '2023-06-19 16:24:22', 'COMPLETED', 413, NULL),
(428, '2MT28170VB990890V', 2, 'Laura Montelongo', 'memojones08@gmail.com', '2023-06-22 02:48:12', 'COMPLETED', 472, NULL),
(429, '001', 10, 'Romina leija', 'gatitoenproblemas@gmail.com', '2023-06-22 20:23:33', 'COMPLETADO', 2500, 0),
(430, '9MF89522X7497333R', 2, 'Adriana Nava', 'memojones08@gmail.com', '2023-06-23 18:26:23', 'COMPLETED', 472, NULL),
(431, '001', 2, 'Lorena  Hernandez Gurierrez', 'ballerinadanzayarte@gmail.com', '2023-06-24 11:49:30', 'COMPLETADO', 700, 0),
(432, '001', 2, 'mya  cantero', 'ballerinadanzayarte@gmail.com', '2023-06-29 15:30:47', 'COMPLETADO', 500, 0),
(433, '001', 5, 'tamara  segoviano', 'ballerinadanzayarte@gmail.com', '2023-06-29 16:55:07', 'COMPLETADO', 1250, 0),
(434, '75F1602452485740S', 2, 'Mario Rene Vazquez Castillo', 'memojones08@gmail.com', '2023-07-01 18:14:00', 'COMPLETED', 413, NULL),
(435, '1L89500969560062P', 2, 'Diana Selene Escobedo Arellano', 'memojones08@gmail.com', '2023-07-01 23:39:13', 'COMPLETED', 295, NULL),
(436, '39D493103N8228907', 6, 'Gilma Ibanez', 'memojones08@gmail.com', '2023-07-02 01:17:19', 'COMPLETED', 1239, NULL),
(437, '1WC36124US697391U', 6, 'Brenda Resendez', 'memojones08@gmail.com', '2023-07-02 17:59:45', 'COMPLETED', 885, NULL),
(438, '094051708J1302015', 4, 'Antonio Ismael Vazquez Salinas', 'memojones08@gmail.com', '2023-07-02 23:02:26', 'COMPLETED', 826, NULL),
(439, '50U85135405013913', 6, 'Luis Andres Mejia Navarro', 'memojones08@gmail.com', '2023-07-02 23:45:09', 'COMPLETED', 885, NULL),
(440, '6F108930X4865643W', 2, 'Liliana Margarita Torres Cárde', 'memojones08@gmail.com', '2023-07-03 04:11:35', 'COMPLETED', 413, NULL),
(441, '91R730695E5535619', 2, 'karla gonzalez briones', 'memojones08@gmail.com', '2023-07-03 22:36:23', 'COMPLETED', 295, NULL),
(442, '75064642UJ9056018', 2, 'Claudia Torres', 'memojones08@gmail.com', '2023-07-04 01:12:25', 'COMPLETED', 413, NULL),
(443, '001', 10, 'evelyn reyes', 'ballerinadanzayarte@gmail.com', '2023-07-04 17:44:34', 'COMPLETADO', 2500, 0),
(444, '5S367303HY0775843', 3, 'Vicente Roman', 'memojones08@gmail.com', '2023-07-05 17:24:57', 'COMPLETED', 826, NULL),
(445, '1A764893AB076760E', 2, 'Cita Salazar Moctezuma', 'memojones08@gmail.com', '2023-07-05 20:37:53', 'COMPLETED', 295, NULL),
(447, '6WU249080W503805M', 2, 'Nayla Hernandez', 'memojones08@gmail.com', '2023-07-06 00:27:02', 'COMPLETED', 413, NULL),
(448, '3AB58904EJ210194B', 1, 'Vicente Roman', 'memojones08@gmail.com', '2023-07-06 01:40:35', 'COMPLETED', 413, NULL),
(449, '3B399206D7955770F', 1, 'Roberto Reza', 'memojones08@gmail.com', '2023-07-06 06:17:10', 'COMPLETED', 413, NULL),
(451, '6GA83090LA9484356', 2, 'Imelda Carreón', 'memojones08@gmail.com', '2023-07-07 18:30:25', 'COMPLETED', 295, NULL),
(452, '001', 4, 'Sarahi  Chavez', 'ballerinadanzayarte@gmail.com', '2023-07-07 15:30:21', 'COMPLETADO', 1400, 0),
(453, '001', 3, 'Hermana  Perez', 'ballerinadanzayarte@gmail.com', '2023-07-07 15:36:32', 'COMPLETADO', 1050, 0),
(454, '001', 10, 'Renata  Botello', 'ballerinadanzayarte@gmail.com', '2023-07-07 17:08:31', 'COMPLETADO', 2500, 0),
(455, '001', 3, 'Angel Leija', 'angelgaelleija2@gmail.com', '2023-07-07 17:45:59', 'COMPLETADO', 3, 0),
(456, '001', 10, 'Salvador  Luna', 'ballerinadanzayarte@gmail.com', '2023-07-07 18:34:15', 'COMPLETADO', 2500, 0),
(457, '001', 4, 'Oscar  Chavira', 'ballerinadanzayarte@gmail.com', '2023-07-07 18:39:46', 'COMPLETADO', 1000, 0),
(458, '001', 10, 'Jared Silva', 'ballerinadanzayarte@gmail.com', '2023-07-07 18:40:51', 'COMPLETADO', 2500, 0),
(459, '001', 10, 'Salvador  Valle', 'ballerinadanzayarte@gmail.com', '2023-07-07 18:44:31', 'COMPLETADO', 2500, 0),
(460, '001', 10, 'Abdiel Alonso Rodriguez Navarr', 'ballerinadanzayarte@gmail.com', '2023-07-07 18:48:35', 'COMPLETADO', 2500, 0),
(462, '8P975584370636847', 4, 'MARIA CELESTE GARZA MALDONADO', 'memojones08@gmail.com', '2023-07-09 13:58:08', 'COMPLETED', 590, NULL),
(463, '32658172WW9316053', 4, 'Sabino Heriberto Torruco Barbo', 'memojones08@gmail.com', '2023-07-10 04:46:23', 'COMPLETED', 590, NULL),
(464, '001', 2, 'consuelo  martinez', 'ballerinadanzayarte@gmail.com', '2023-07-10 10:53:40', 'COMPLETADO', 500, 0),
(465, '001', 10, 'Andrea  Sanchez', 'ballerinadanzayarte@gmail.com', '2023-07-10 14:43:10', 'COMPLETADO', 3500, 0),
(466, '001', 10, 'Odette y Sandra Marquez', 'ballerinadanzayarte@gmail.com', '2023-07-10 16:55:37', 'COMPLETADO', 2500, 0),
(467, '001', 10, 'Siomara  De Leon', 'ballerinadanzayarte@gmail.com', '2023-07-10 16:58:00', 'COMPLETADO', 2500, 0),
(468, '0WY21066MU517692R', 2, 'Sonia Leal', 'memojones08@gmail.com', '2023-07-10 23:30:46', 'COMPLETED', 413, NULL),
(469, '001', 10, 'Frida Cienfuegos', 'ballerinadanzayarte@gmail.com', '2023-07-10 19:24:42', 'COMPLETADO', 2500, 0),
(470, '001', 10, 'Jacob Cabello', 'ballerinadanzayarte@gmail.com', '2023-07-10 19:30:17', 'COMPLETADO', 2500, 0),
(471, '0R146336W6013463U', 2, 'María Fernanda Torres', 'memojones08@gmail.com', '2023-07-11 14:54:56', 'COMPLETED', 413, NULL),
(473, '001', 4, 'manuel puente', 'manu_puente9@live.com', '2023-07-11 10:05:48', 'COMPLETADO', 1400, 0),
(474, '001', 10, 'Luis Angel Rivera Ibanez', 'ballerinadanzayarte@gmail.com', '2023-07-11 17:26:48', 'COMPLETADO', 2500, 0),
(475, '001', 10, 'Jorge Contreras', 'ballerinadanzayarte@gmail.com', '2023-07-11 18:01:18', 'COMPLETADO', 3500, 0),
(478, '001', 6, 'Jacob Cabello', 'MARINAAMAROD@GMAIL.COM', '2023-07-11 19:19:13', 'COMPLETADO', 1500, 0),
(479, '001', 3, 'Paola Golpe', 'ballerinadanzayarte@gmail.com', '2023-07-11 19:26:24', 'COMPLETADO', 750, 0),
(480, '001', 10, 'Julieta Gonzalez Herrera', 'ballerinadanzayarte@gmail.com', '2023-07-11 19:28:19', 'COMPLETADO', 3500, 0),
(481, '0M099754W54765641', 2, 'Martha Catalina Vega Avila', 'memojones08@gmail.com', '2023-07-12 18:34:16', 'COMPLETED', 708, NULL),
(482, '9X766894D7052124H', 3, 'veronica zapata', 'memojones08@gmail.com', '2023-07-12 21:08:21', 'COMPLETED', 708, NULL),
(483, '001', 10, 'Valeria y Victoria Reyes', 'ballerinadanzayarte@gmail.com', '2023-07-12 17:39:53', 'COMPLETADO', 2500, 0),
(484, '001', 5, 'Ricardo  Luna', 'ballerinadanzayarte@gmail.com', '2023-07-12 17:44:08', 'COMPLETADO', 1750, 0),
(485, '001', 5, 'Ricardo  Luna', 'ballerinadanzayarte@gmail.com', '2023-07-12 17:45:03', 'COMPLETADO', 1750, 0),
(486, '001', 3, 'SANDRA  MARQUEZ', 'SANDRA_MQZ@OUTLOOK.COM', '2023-07-12 18:08:06', 'COMPLETADO', 750, 0),
(487, '001', 10, 'Galilea Plata', 'ballerinadanzayarte@gmail.com', '2023-07-12 19:16:43', 'COMPLETADO', 3500, 0),
(488, '001', 1, 'Reyna Garcia', 'reyna@solucionescomputacionale', '2023-07-13 19:33:03', 'COMPLETADO', 250, 0),
(489, '3P087575CW718943J', 2, 'Antonio Sandoval Musule', 'memojones08@gmail.com', '2023-07-14 03:39:06', 'COMPLETED', 472, NULL),
(490, '2J1172368H981221T', 8, 'roberto zuniga pacheco', 'memojones08@gmail.com', '2023-07-14 04:14:40', 'COMPLETED', 2832, NULL),
(491, '001', 4, 'Nahomi Leija', 'limones.leija@gmail.com', '2023-07-14 17:30:09', 'COMPLETADO', 1000, 0),
(492, '001', 5, 'Guillermo Sanchez', 'dnlasnchz@hotmail.com', '2023-07-14 18:48:46', 'COMPLETADO', 1250, 0),
(494, '3KF48489TH4314307', 2, 'Fidel Rodriguez', 'memojones08@gmail.com', '2023-07-15 02:04:27', 'COMPLETED', 472, NULL),
(495, '66A15823E5508982R', 3, 'Juan Ruiz', 'memojones08@gmail.com', '2023-07-15 04:41:10', 'COMPLETED', 708, NULL),
(496, '001', 4, 'Salvador  Luna', 'dnlasnchz@hotmail.com', '2023-07-15 09:21:38', 'COMPLETADO', 1000, 0),
(497, '50740284TL828111S', 1, 'Yesenia Gonzalez Cornejo', 'memojones08@gmail.com', '2023-07-15 18:15:16', 'COMPLETED', 236, NULL),
(498, '1J09166195695490K', 2, 'Magdalena  I Mendiola Guerra', 'memojones08@gmail.com', '2023-07-15 18:48:31', 'COMPLETED', 472, NULL),
(499, '9TP36363088899628', 2, 'Lili Ibanez', 'memojones08@gmail.com', '2023-07-15 18:51:31', 'COMPLETED', 472, NULL),
(500, '8HB997390H641400H', 2, 'Maricruz Zuñiga mares', 'memojones08@gmail.com', '2023-07-15 19:42:32', 'COMPLETED', 472, NULL),
(501, '001', 2, 'kevin  Blanco', 'kevin312blanc0@hotmail.com', '2023-07-15 16:01:18', 'COMPLETADO', 500, 0),
(502, '001', 3, 'Julissa  Salgado', 'julisalgado01@outlook.com', '2023-07-15 16:40:30', 'COMPLETADO', 750, 0),
(503, '25L69555NH439435U', 3, 'RIGOBERTO FUENTE', 'memojones08@gmail.com', '2023-07-15 23:28:07', 'COMPLETED', 708, NULL),
(504, '001', 3, 'Ared Jimenez', 'ared.jimenez@hotmail.com', '2023-07-15 18:21:41', 'COMPLETADO', 750, 0),
(505, '001', 2, 'Benita Martinez', 'taurorocha@hotmail.com', '2023-07-15 18:29:25', 'COMPLETADO', 500, 0),
(506, '001', 2, 'Imelda Camarena', 'ktc.icamarena@gmail.com', '2023-07-15 18:57:50', 'COMPLETADO', 500, 0),
(507, '001', 6, 'Julia Hernandez', 'julia.hernandez@nvent.com', '2023-07-15 18:59:53', 'COMPLETADO', 1500, 0),
(508, '001', 1, 'Reyna Garcia', 'reyna@solucionescomputacionale', '2023-07-15 19:03:19', 'COMPLETADO', 350, 0),
(509, '001', 2, 'Alba y Hector Torruco', 'ballerinadanzayarte@gmail.com', '2023-07-15 19:11:44', 'COMPLETADO', 700, 0),
(510, '10X448253N230864X', 3, 'Liliana Guadalupe Alpirez cero', 'memojones08@gmail.com', '2023-07-16 01:19:58', 'COMPLETED', 708, NULL),
(511, '1HL95930VU6233233', 4, 'Ana Karen Zepeda Hernández', 'memojones08@gmail.com', '2023-08-01 16:22:26', 'COMPLETED', 1888, NULL),
(512, '4KF92498LT831511N', 2, 'Cristian Eduardo Mijares Piña', 'memojones08@gmail.com', '2023-08-01 17:38:27', 'COMPLETED', 944, NULL),
(513, '2MJ57533N8643042M', 3, 'Jaime Salvador Alpuche Mendoza', 'memojones08@gmail.com', '2023-08-02 01:36:42', 'COMPLETED', 1416, NULL),
(514, '2VS10229R6166843W', 2, 'Margarita Tabla', 'memojones08@gmail.com', '2023-08-02 21:17:52', 'COMPLETED', 944, NULL),
(515, '001', 2, 'Angel Leija', 'angelgaelleija2@gmail.com', '2023-08-02 19:47:31', 'COMPLETADO', 4, 0),
(516, '001', 1, 'Angel Gael', 'angelgaelleija2@gmail.com', '2023-08-02 19:50:51', 'COMPLETADO', 2, 0),
(517, '30Y690182C595531B', 6, 'Claudia Mejia chavero', 'memojones08@gmail.com', '2023-08-03 15:39:45', 'COMPLETED', 2832, NULL),
(518, '8SX338131D760300D', 4, 'Claudia Calderon', 'memojones08@gmail.com', '2023-08-03 16:52:57', 'COMPLETED', 1416, NULL),
(519, '54112862R2788004B', 3, 'Lidia M Heredia Suarez', 'memojones08@gmail.com', '2023-08-04 15:13:07', 'COMPLETED', 1062, NULL),
(524, '001', 4, 'Freda Frias', 'fedra_frias123@gmail.com', '2023-08-06 07:51:54', 'COMPLETADO', 1200, 0),
(526, '4Y775678MH5848415', 5, 'JORGE ALBERTO GARCIA MORALES', 'memojones08@gmail.com', '2023-08-18 19:49:10', 'COMPLETED', 2360, NULL),
(528, '2YS10384JL664864S', 5, 'Martha Patricia Amador Amador', 'memojones08@gmail.com', '2023-08-21 17:03:23', 'COMPLETED', 2360, NULL),
(529, '2CM89854U7074510D', 1, 'Cesar Garcia Elizondo', 'memojones08@gmail.com', '2023-08-22 20:03:28', 'COMPLETED', 472, NULL),
(530, '2GW87180UA079423W', 3, 'Flor berenice Grimaldo', 'memojones08@gmail.com', '2023-08-25 02:46:13', 'COMPLETED', 1062, NULL),
(531, '0CG07273AA188835X', 2, 'John Doe', 'sb-ggzye25039847@business.exam', '2023-08-25 23:16:47', 'COMPLETED', 236, NULL),
(532, '02S52013WK207294H', 2, 'John Doe', 'sb-ggzye25039847@business.exam', '2023-08-26 17:10:35', 'COMPLETED', 236, NULL),
(533, '5PS55793WJ095150P', 2, 'John Doe', 'sb-ggzye25039847@business.exam', '2023-08-26 17:12:29', 'COMPLETED', 236, NULL),
(534, '0A281586JV931264K', 2, 'John Doe', 'sb-ggzye25039847@business.exam', '2023-08-26 17:16:46', 'COMPLETED', 236, NULL),
(535, '9R573181BJ802971M', 2, 'John Doe', 'sb-ggzye25039847@business.exam', '2023-08-26 17:21:33', 'COMPLETED', 236, NULL),
(536, '4S444284KG781703H', 2, 'John Doe', 'sb-ggzye25039847@business.exam', '2023-08-26 17:24:53', 'COMPLETED', 236, NULL),
(537, '2X713624MG854780E', 3, 'John Doe', 'sb-ggzye25039847@business.exam', '2023-08-26 17:27:48', 'COMPLETED', 354, NULL),
(538, '5EB78073GJ9229639', 1, 'John Doe', 'sb-ggzye25039847@business.exam', '2023-08-26 17:29:26', 'COMPLETED', 118, NULL),
(545, '0U149979EC4821119', 2, 'John Doe', 'sb-ggzye25039847@business.exam', '2023-08-26 17:47:05', 'COMPLETED', 236, NULL),
(546, '1R8910526D727173N', 1, 'John Doe', 'sb-ggzye25039847@business.exam', '2023-08-26 18:00:02', 'COMPLETED', 118, NULL),
(547, '1AG650281C621003E', 2, 'John Doe', 'sb-ggzye25039847@business.exam', '2023-08-26 20:14:03', 'COMPLETED', 236, NULL),
(548, '3DE75145VU2347601', 2, 'John Doe', 'sb-ggzye25039847@business.exam', '2023-08-26 20:14:49', 'COMPLETED', 236, NULL),
(549, '2N5126775T193635T', 2, 'John Doe', 'sb-ggzye25039847@business.exam', '2023-08-26 20:17:43', 'COMPLETED', 236, NULL),
(556, '18D94489807613332', 2, 'Alfredo Hernandez', 'memojones08@gmail.com', '2023-08-29 04:22:38', 'COMPLETED', 236, 36),
(557, '4U14642216626700U', 2, 'rosa martinez', 'memojones08@gmail.com', '2023-08-30 19:01:12', 'COMPLETED', 236, 36),
(561, '5ML10776T7319735C', 3, 'Maria Angelina Contreras Corte', 'memojones08@gmail.com', '2023-08-31 17:57:16', 'COMPLETED', 1416, 162),
(564, '001', 2, 'Monica Solis ', 'monica@promospublicidad.com', '2023-08-31 16:39:07', 'COMPLETADO', 236, 0),
(565, '001', 2, 'Martha Garza', 'martha.garza@cobat.edu.mx', '2023-08-31 16:54:14', 'COMPLETADO', 200, 0),
(566, '001', 10, 'Giovanna Granados', 'giovannagranados@hotmail.com', '2023-08-31 17:10:00', 'COMPLETADO', 1000, 0),
(567, '8FB3994617379851L', 8, 'Aldo Daniel Vilchez villalobos', 'memojones08@gmail.com', '2023-09-01 04:59:17', 'COMPLETED', 3776, 432),
(568, '8XS92761LD477153F', 4, 'Miguel Cortes', 'memojones08@gmail.com', '2023-09-01 21:10:42', 'COMPLETED', 472, 72),
(569, '20636128Y9949623K', 2, 'Mayra Alejandra Romero Cruz', 'memojones08@gmail.com', '2023-09-01 21:56:45', 'COMPLETED', 236, 36);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evento`
--

CREATE TABLE `evento` (
  `idEvento` int(11) NOT NULL,
  `idTeatro` int(11) NOT NULL,
  `nombreEvento` varchar(100) NOT NULL,
  `descripcionEvento` varchar(300) NOT NULL,
  `imagenURL` varchar(255) NOT NULL,
  `empresa` varchar(100) NOT NULL,
  `idUser` int(11) NOT NULL,
  `enumerado` varchar(3) NOT NULL,
  `publico` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `evento`
--

INSERT INTO `evento` (`idEvento`, `idTeatro`, `nombreEvento`, `descripcionEvento`, `imagenURL`, `empresa`, `idUser`, `enumerado`, `publico`) VALUES
(28, 1, 'José El Soñador', 'Jose el Soñador, un clásico del Teatro Musical, recrea la historia de José, uno de los hijos de Jacob, que tenía el don de predecir el futuro a través de los sueños. La envidia que despertó en sus hermanos lo llevó a ser vendido como esclavo y llegar hasta Egipto, donde con el paso del tiempo acabó ', '1684282939_Evento_JoseElSoñador.webp', 'Ballerina Centro de Artes Escenicas', 30, 'No', 'Si'),
(30, 1, 'THIS IS IT - 20 AÑOS', 'THIS IS IT - 20 AÑOS', '1684278832_Evento_Rolsed.webp', 'Academia de Danza Rolsed', 33, 'Si', 'Si'),
(33, 1, 'Cuentos Magicos', 'Acompaña a mickey y Minnie a un viaje dentro de todos los cuentos mágicos de Disney, encanto, frozen, rey leon, toy story son algunos de los personajes que visitarán los dos famosos ratoncitos en este mágico musical.', '1690843883_evento-the-circus-show.jpeg', 'The Circus Producciones', 34, 'Si', 'Si');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `funciones`
--

CREATE TABLE `funciones` (
  `idFuncion` int(11) NOT NULL,
  `idEvento` int(11) NOT NULL,
  `estado` varchar(25) NOT NULL,
  `fechaFuncion` date NOT NULL,
  `horaFuncion` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `funciones`
--

INSERT INTO `funciones` (`idFuncion`, `idEvento`, `estado`, `fechaFuncion`, `horaFuncion`) VALUES
(37, 28, 'disponible', '2023-09-03', '19:30:00'),
(38, 28, 'disponible', '2023-09-03', '17:00:00'),
(39, 30, 'disponible', '2023-09-30', '13:30:00'),
(40, 30, 'disponible', '2023-09-30', '16:30:00'),
(42, 33, 'disponible', '2023-09-17', '16:00:00'),
(43, 33, 'disponible', '2023-09-17', '18:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `galeria_evento`
--

CREATE TABLE `galeria_evento` (
  `idGaleria` int(11) NOT NULL,
  `idEvento` int(11) NOT NULL,
  `fotos` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`fotos`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `galeria_evento`
--

INSERT INTO `galeria_evento` (`idGaleria`, `idEvento`, `fotos`) VALUES
(1, 28, '{\"fotos\": [\"BallerinaCentroDeArtesEscenicas/Photo1.jpg\", \"BallerinaCentroDeArtesEscenicas/Photo2.jpg\", \"BallerinaCentroDeArtesEscenicas/Photo3.jpg\", \"BallerinaCentroDeArtesEscenicas/Photo4.jpg\", \"BallerinaCentroDeArtesEscenicas/Photo5.jpg\"]}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oferta`
--

CREATE TABLE `oferta` (
  `idOferta` int(11) NOT NULL,
  `idEvento` int(11) NOT NULL,
  `boletos2x1` varchar(5) NOT NULL,
  `ofertaAsientoNormal` int(10) NOT NULL,
  `ofertaAsientoVIP` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `teatro`
--

CREATE TABLE `teatro` (
  `idTeatro` int(11) NOT NULL,
  `nombreTeatro` varchar(50) NOT NULL,
  `cantidadAsientos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `teatro`
--

INSERT INTO `teatro` (`idTeatro`, `nombreTeatro`, `cantidadAsientos`) VALUES
(1, 'Teatro principal', 1155),
(2, 'Teatro experimental', 300);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_precio`
--

CREATE TABLE `tipo_precio` (
  `idTipoPrecio` int(11) NOT NULL,
  `idEvento` int(11) NOT NULL,
  `nombreTipo` varchar(50) NOT NULL,
  `precioTipo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tipo_precio`
--

INSERT INTO `tipo_precio` (`idTipoPrecio`, `idEvento`, `nombreTipo`, `precioTipo`) VALUES
(10, 28, 'Asiento normal', 100),
(11, 28, 'Asiento VIP', 100),
(12, 30, 'Asiento normal', 100),
(13, 30, 'Asiento VIP', 100),
(16, 33, 'Asiento Normal', 300),
(17, 33, 'Asiento VIP', 400);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `idUser` int(11) NOT NULL,
  `idTypeUser` int(11) NOT NULL,
  `emailPaypal` varchar(50) NOT NULL,
  `idComercio` varchar(20) NOT NULL,
  `username` varchar(25) NOT NULL,
  `email` varchar(50) NOT NULL,
  `passwordU` char(255) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `phonenumber` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`idUser`, `idTypeUser`, `emailPaypal`, `idComercio`, `username`, `email`, `passwordU`, `firstname`, `lastname`, `phonenumber`) VALUES
(28, 1, 'angel.leija@uttn.mx', '8SVPR48YSX4LQ', 'Angel', '8V9uGgd7ji3@gmail.com', '$2y$10$s2FlCf1jLVXc1S9Sw10Y4O1JQ2iCyVB.aoPUAdMhFAuuC3GGIo2DC', 'Angel', 'Leija ', '8994585918'),
(29, 1, 'n/a', 'n/a', 'Esdras', 'OnQY650vcMZ@gmail.com', '$2y$10$8AUe3p2/6Jvh3Q9Jff/bTO0q0jrA/tfv3TU.nCKRhClB5LMzxJNJS', 'Esdras', 'Ibarra', '1234567890'),
(30, 2, 'memojones08@gmail.com', 'GLK3BW2ZA3CH2', 'Ballerina', 'NbRcJ394sfh@gmail.com', '$2y$10$NEKO3Xhj.CkrZpOb3j/JSOBTGMwyiGKgkBDnWmzuelP2I/BPvUbRS', 'Guillermo', 'Sanchez', '1234567890'),
(32, 2, 'n/a', 'n/a', 'Empresa', 'empresa@gmail.com', '$2y$10$BExntszDSNxVDsd1oXo1Hu8NsaEPTegvrgTkI0sMI5QUDeyJ4XZ3u', 'Angel', 'Leija', '8994585917'),
(33, 2, 'boletosreynosarolsed@gmail.com', 'JZZ6KCA45UFW2', 'Rolsed', '$NvHg%62F3j@gmail.com', '$2y$10$x5.LQ/66T/7c240cPHg1w.GOTPbzD/bunAQoPtqQqtR4v.Q3Igba6', 'Rolsed', 'Academia de Danza', '123'),
(34, 2, 'n/a', 'n/a', 'The Circus Show', 'the_circus_show@boletosreynosa.com', '$2y$10$psHbT0xd31UhoXSdqkFnMuZOZroUMBPQy7R.iIyPy.9NlnSja2wuK', 'Julio Cesar', 'Lopez Vasquez', '8991032847'),
(35, 1, 'n/a', 'n/a', 'Guillermo', 'memojones08@gmail.com', '$2y$10$YXLkPTMgjaQDQpLJ7ZgN8uEkKMoQdOOKnbdquMHVhgegQboqNgi42', 'Guillermo', 'Sanchez', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usertype`
--

CREATE TABLE `usertype` (
  `idTypeUser` int(11) NOT NULL,
  `typeuser` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `usertype`
--

INSERT INTO `usertype` (`idTypeUser`, `typeuser`) VALUES
(1, 'admin'),
(2, 'mod'),
(3, 'cliente');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asientos`
--
ALTER TABLE `asientos`
  ADD PRIMARY KEY (`idAsiento`),
  ADD KEY `idTeatro` (`idTeatro`);

--
-- Indices de la tabla `asientos_funciones`
--
ALTER TABLE `asientos_funciones`
  ADD PRIMARY KEY (`idAsientosFunciones`),
  ADD KEY `idAsiento` (`idAsiento`),
  ADD KEY `idFuncion` (`idFuncion`);

--
-- Indices de la tabla `boleto`
--
ALTER TABLE `boleto`
  ADD PRIMARY KEY (`idBoleto`),
  ADD KEY `idFuncion` (`idFuncion`),
  ADD KEY `idEvento` (`idEvento`),
  ADD KEY `idCompra` (`idCompra`),
  ADD KEY `idAsiento` (`idAsiento`);

--
-- Indices de la tabla `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`idClient`);

--
-- Indices de la tabla `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`idCompra`);

--
-- Indices de la tabla `evento`
--
ALTER TABLE `evento`
  ADD PRIMARY KEY (`idEvento`),
  ADD KEY `idTeatro` (`idTeatro`),
  ADD KEY `idUser` (`idUser`);

--
-- Indices de la tabla `funciones`
--
ALTER TABLE `funciones`
  ADD PRIMARY KEY (`idFuncion`),
  ADD KEY `idEvento` (`idEvento`);

--
-- Indices de la tabla `galeria_evento`
--
ALTER TABLE `galeria_evento`
  ADD PRIMARY KEY (`idGaleria`),
  ADD KEY `idEvento` (`idEvento`);

--
-- Indices de la tabla `oferta`
--
ALTER TABLE `oferta`
  ADD PRIMARY KEY (`idOferta`),
  ADD KEY `idEvento` (`idEvento`);

--
-- Indices de la tabla `teatro`
--
ALTER TABLE `teatro`
  ADD PRIMARY KEY (`idTeatro`);

--
-- Indices de la tabla `tipo_precio`
--
ALTER TABLE `tipo_precio`
  ADD PRIMARY KEY (`idTipoPrecio`),
  ADD KEY `idEvento` (`idEvento`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`idUser`),
  ADD KEY `idTypeUser` (`idTypeUser`);

--
-- Indices de la tabla `usertype`
--
ALTER TABLE `usertype`
  ADD PRIMARY KEY (`idTypeUser`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asientos`
--
ALTER TABLE `asientos`
  MODIFY `idAsiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1192;

--
-- AUTO_INCREMENT de la tabla `asientos_funciones`
--
ALTER TABLE `asientos_funciones`
  MODIFY `idAsientosFunciones` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2901;

--
-- AUTO_INCREMENT de la tabla `boleto`
--
ALTER TABLE `boleto`
  MODIFY `idBoleto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2685;

--
-- AUTO_INCREMENT de la tabla `client`
--
ALTER TABLE `client`
  MODIFY `idClient` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT de la tabla `compra`
--
ALTER TABLE `compra`
  MODIFY `idCompra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=572;

--
-- AUTO_INCREMENT de la tabla `evento`
--
ALTER TABLE `evento`
  MODIFY `idEvento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `funciones`
--
ALTER TABLE `funciones`
  MODIFY `idFuncion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT de la tabla `galeria_evento`
--
ALTER TABLE `galeria_evento`
  MODIFY `idGaleria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `oferta`
--
ALTER TABLE `oferta`
  MODIFY `idOferta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `teatro`
--
ALTER TABLE `teatro`
  MODIFY `idTeatro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipo_precio`
--
ALTER TABLE `tipo_precio`
  MODIFY `idTipoPrecio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `usertype`
--
ALTER TABLE `usertype`
  MODIFY `idTypeUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asientos`
--
ALTER TABLE `asientos`
  ADD CONSTRAINT `asientos_ibfk_1` FOREIGN KEY (`idTeatro`) REFERENCES `teatro` (`idTeatro`);

--
-- Filtros para la tabla `asientos_funciones`
--
ALTER TABLE `asientos_funciones`
  ADD CONSTRAINT `asientos_funciones_ibfk_1` FOREIGN KEY (`idFuncion`) REFERENCES `funciones` (`idFuncion`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `asientos_funciones_ibfk_2` FOREIGN KEY (`idAsiento`) REFERENCES `asientos` (`idAsiento`);

--
-- Filtros para la tabla `boleto`
--
ALTER TABLE `boleto`
  ADD CONSTRAINT `boleto_ibfk_2` FOREIGN KEY (`idFuncion`) REFERENCES `funciones` (`idFuncion`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `boleto_ibfk_3` FOREIGN KEY (`idEvento`) REFERENCES `evento` (`idEvento`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `boleto_ibfk_4` FOREIGN KEY (`idCompra`) REFERENCES `compra` (`idCompra`);

--
-- Filtros para la tabla `evento`
--
ALTER TABLE `evento`
  ADD CONSTRAINT `evento_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `funciones`
--
ALTER TABLE `funciones`
  ADD CONSTRAINT `funciones_ibfk_1` FOREIGN KEY (`idEvento`) REFERENCES `evento` (`idEvento`) ON DELETE CASCADE;

--
-- Filtros para la tabla `oferta`
--
ALTER TABLE `oferta`
  ADD CONSTRAINT `oferta_ibfk_1` FOREIGN KEY (`idEvento`) REFERENCES `evento` (`idEvento`);

--
-- Filtros para la tabla `tipo_precio`
--
ALTER TABLE `tipo_precio`
  ADD CONSTRAINT `tipo_precio_ibfk_1` FOREIGN KEY (`idEvento`) REFERENCES `evento` (`idEvento`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`idTypeUser`) REFERENCES `usertype` (`idTypeUser`);
--
-- Base de datos: `gym_platform_db`
--
CREATE DATABASE IF NOT EXISTS `gym_platform_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `gym_platform_db`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `attendances`
--

CREATE TABLE `attendances` (
  `id` int(11) NOT NULL,
  `clientId` char(36) NOT NULL,
  `checkIn` timestamp NOT NULL DEFAULT current_timestamp(),
  `checkOut` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clients`
--

CREATE TABLE `clients` (
  `id` char(36) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `lastLogin` timestamp NULL DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clients`
--

INSERT INTO `clients` (`id`, `name`, `email`, `phone`, `password`, `lastLogin`, `createdAt`, `updatedAt`) VALUES
('08dd88e3-4b2c-4baf-8f09-af43ff84fc5a', 'Cliente ejemplo', 'cliente-ejemplo@gmail.com', '8991234567', '123456', NULL, '2025-05-02 00:06:35', '2025-05-01 19:06:35'),
('fe185413-2537-11f0-ad2f-7c8ae1ba21d6', 'Juan Pérez', 'juan.perez@gmail.com', '5551001001', 'password', NULL, '2025-04-29 20:24:46', '2025-04-29 20:24:46'),
('fe186a33-2537-11f0-ad2f-7c8ae1ba21d6', 'María López', 'maria.lopez@gmail.com', '5551001002', 'password', NULL, '2025-04-29 20:24:46', '2025-04-29 20:24:46'),
('fe186ad1-2537-11f0-ad2f-7c8ae1ba21d6', 'Luis Hernández', 'luis.hernandez@gmail.com', '5551001003', 'password', NULL, '2025-04-29 20:24:46', '2025-04-29 20:24:46'),
('fe186b0f-2537-11f0-ad2f-7c8ae1ba21d6', 'Ana Martínez', 'ana.martinez@gmail.com', '5551001004', 'password', NULL, '2025-04-29 20:24:46', '2025-04-29 20:24:46'),
('fe186b43-2537-11f0-ad2f-7c8ae1ba21d6', 'José García', 'jose.garcia@gmail.com', '5551001005', 'password', NULL, '2025-04-29 20:24:46', '2025-04-29 20:24:46'),
('fe186b76-2537-11f0-ad2f-7c8ae1ba21d6', 'Laura Rodríguez', 'laura.rodriguez@gmail.com', '5551001006', 'password', NULL, '2025-04-29 20:24:46', '2025-04-29 20:24:46'),
('fe186bc2-2537-11f0-ad2f-7c8ae1ba21d6', 'Carlos Sánchez', 'carlos.sanchez@gmail.com', '5551001007', 'password', NULL, '2025-04-29 20:24:46', '2025-04-29 20:24:46'),
('fe186c07-2537-11f0-ad2f-7c8ae1ba21d6', 'Fernanda Ramírez', 'fernanda.ramirez@gmail.com', '5551001008', 'password', NULL, '2025-04-29 20:24:46', '2025-04-29 20:24:46'),
('fe186c3c-2537-11f0-ad2f-7c8ae1ba21d6', 'Miguel Torres', 'miguel.torres@gmail.com', '5551001009', 'password', NULL, '2025-04-29 20:24:46', '2025-04-29 20:24:46'),
('fe186c6a-2537-11f0-ad2f-7c8ae1ba21d6', 'Daniela Flores', 'daniela.flores@gmail.com', '5551001010', 'password', NULL, '2025-04-29 20:24:46', '2025-04-29 20:24:46'),
('fe186c97-2537-11f0-ad2f-7c8ae1ba21d6', 'Ricardo Gómez', 'ricardo.gomez@gmail.com', '5551001011', 'password', NULL, '2025-04-29 20:24:46', '2025-04-29 20:24:46'),
('fe186cc2-2537-11f0-ad2f-7c8ae1ba21d6', 'Alejandra Díaz', 'alejandra.diaz@gmail.com', '5551001012', 'password', NULL, '2025-04-29 20:24:46', '2025-04-29 20:24:46'),
('fe186ceb-2537-11f0-ad2f-7c8ae1ba21d6', 'Hugo Morales', 'hugo.morales@gmail.com', '5551001013', 'password', NULL, '2025-04-29 20:24:46', '2025-04-29 20:24:46'),
('fe186d18-2537-11f0-ad2f-7c8ae1ba21d6', 'Diana Ortiz', 'diana.ortiz@gmail.com', '5551001014', 'password', NULL, '2025-04-29 20:24:46', '2025-04-29 20:24:46'),
('fe186d3c-2537-11f0-ad2f-7c8ae1ba21d6', 'Emilio Ruiz', 'emilio.ruiz@gmail.com', '5551001015', 'password', NULL, '2025-04-29 20:24:46', '2025-04-29 20:24:46'),
('fe186d75-2537-11f0-ad2f-7c8ae1ba21d6', 'Sofía Méndez', 'sofia.mendez@gmail.com', '5551001016', 'password', NULL, '2025-04-29 20:24:46', '2025-04-29 20:24:46'),
('fe186d98-2537-11f0-ad2f-7c8ae1ba21d6', 'Andrés Castro', 'andres.castro@gmail.com', '5551001017', 'password', NULL, '2025-04-29 20:24:46', '2025-04-29 20:24:46'),
('fe186dbc-2537-11f0-ad2f-7c8ae1ba21d6', 'Valeria Rojas', 'valeria.rojas@gmail.com', '5551001018', 'password', NULL, '2025-04-29 20:24:46', '2025-04-29 20:24:46'),
('fe186de2-2537-11f0-ad2f-7c8ae1ba21d6', 'Jorge Vázquez', 'jorge.vazquez@gmail.com', '5551001019', 'password', NULL, '2025-04-29 20:24:46', '2025-04-29 20:24:46'),
('fe186e05-2537-11f0-ad2f-7c8ae1ba21d6', 'Paola Navarro', 'paola.navarro@gmail.com', '5551001020', 'password', NULL, '2025-04-29 20:24:46', '2025-04-29 20:24:46');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clients_memberships`
--

CREATE TABLE `clients_memberships` (
  `id` int(11) NOT NULL,
  `clientId` char(36) NOT NULL,
  `membershipId` int(11) NOT NULL,
  `startDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `endDate` timestamp NULL DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clients_memberships`
--

INSERT INTO `clients_memberships` (`id`, `clientId`, `membershipId`, `startDate`, `endDate`, `status`) VALUES
(14, 'fe185413-2537-11f0-ad2f-7c8ae1ba21d6', 13, '2025-07-08 04:35:35', '2025-08-07 04:35:35', 'active');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `priority` enum('1','2','3') NOT NULL,
  `userId` char(36) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `memberships`
--

CREATE TABLE `memberships` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `benefits` text NOT NULL,
  `duration` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `memberships`
--

INSERT INTO `memberships` (`id`, `name`, `benefits`, `duration`, `price`, `status`, `createdAt`, `updatedAt`) VALUES
(2, 'Membresía Premium', 'Acceso a todos los equipos', 7, 500.00, 'inactive', '2025-04-29 18:39:10', '2025-04-29 23:39:10'),
(13, 'Membresia Normal', 'Acceso limitado a los equipos', 30, 345.00, 'active', '2025-05-01 17:13:23', '2025-05-01 22:13:23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `image`, `price`, `stock`, `createdAt`, `updatedAt`) VALUES
(11, 'Proteína Vainilla', 'Proteína sabor vainilla para recuperación muscular', 'gold-standard.webp', 1299.00, 25, '2025-04-20 01:12:20', '2025-04-20 01:12:20'),
(12, 'Proteína Chocolate', 'Proteína sabor chocolate de rápida absorción', 'gold-standard.webp', 1100.50, 30, '2025-04-20 01:12:20', '2025-04-20 01:12:20'),
(13, 'Creatina Monohidratada', 'Mejora el rendimiento físico y la fuerza', 'gold-standard.webp', 499.99, 40, '2025-04-20 01:12:20', '2025-04-20 01:12:20'),
(14, 'Aminoácidos BCAA', 'Mejora la recuperación muscular post entrenamiento', 'gold-standard.webp', 899.00, 20, '2025-04-20 01:12:20', '2025-04-20 01:12:20'),
(15, 'Proteína Fresa', 'Suplemento sabor fresa bajo en grasa', 'gold-standard.webp', 1150.00, 15, '2025-04-20 01:12:20', '2025-04-20 01:12:20'),
(16, 'Proteína Cookies & Cream', 'Sabor delicioso y alto contenido proteico', 'gold-standard.webp', 1250.75, 18, '2025-04-20 01:12:20', '2025-04-20 01:12:20'),
(17, 'Proteína Café', 'Suplemento energizante sabor café', 'gold-standard.webp', 1350.00, 10, '2025-04-20 01:12:20', '2025-04-20 01:12:20'),
(18, 'Pre Entreno NitroX', 'Energizante para antes del entrenamiento', 'gold-standard.webp', 649.90, 12, '2025-04-20 01:12:20', '2025-04-20 01:12:20'),
(19, 'Quemador de Grasa', 'Acelera el metabolismo y reduce grasa corporal', 'gold-standard.webp', 999.99, 22, '2025-04-20 01:12:20', '2025-04-20 01:12:20'),
(20, 'Colágeno Hidrolizado', 'Mejora articulaciones y piel', 'gold-standard.webp', 749.00, 14, '2025-04-20 01:12:20', '2025-04-20 01:12:20'),
(21, 'Proteína Isolate', 'Proteína aislada premium de rápida absorción', 'gold-standard.webp', 1399.00, 16, '2025-04-20 01:12:20', '2025-04-20 01:12:20'),
(22, 'Gainer Mass', 'Para ganancia de masa muscular rápida', 'gold-standard.webp', 1450.50, 9, '2025-04-20 01:12:20', '2025-04-20 01:12:20'),
(23, 'Omega 3', 'Salud cardiovascular y cognitiva', 'gold-standard.webp', 399.00, 35, '2025-04-20 01:12:20', '2025-04-20 01:12:20'),
(24, 'Multivitamínico', 'Aporte completo de vitaminas esenciales', 'gold-standard.webp', 299.00, 40, '2025-04-20 01:12:20', '2025-04-20 01:12:20'),
(25, 'Glutamina', 'Apoya recuperación muscular y sistema inmunológico', 'gold-standard.webp', 599.00, 25, '2025-04-20 01:12:20', '2025-04-20 01:12:20'),
(26, 'Proteína Natural', 'Sin saborizantes, 100% natural', 'gold-standard.webp', 1199.99, 20, '2025-04-20 01:12:20', '2025-04-20 01:12:20'),
(27, 'Proteína Mujer', 'Formulada especialmente para mujeres', 'gold-standard.webp', 1099.00, 12, '2025-04-20 01:12:20', '2025-04-20 01:12:20'),
(28, 'Proteína Vegana', 'Alternativa sin lácteos, sabor chocolate', 'gold-standard.webp', 1249.50, 15, '2025-04-20 01:12:20', '2025-04-20 01:12:20'),
(29, 'Batido Proteico RTD', 'Bebida lista para tomar, sabor vainilla', 'gold-standard.webp', 120.00, 50, '2025-04-20 01:12:20', '2025-04-20 01:12:20'),
(30, 'Barritas Proteicas', 'Snack saludable con alto contenido proteico', 'gold-standard.webp', 150.00, 45, '2025-04-20 01:12:20', '2025-04-20 01:12:20'),
(31, 'Proteína Sabor Mango', 'Sabor refrescante y veraniego', 'gold-standard.webp', 999.99, 19, '2025-04-20 01:12:20', '2025-04-20 01:12:20'),
(32, 'Pre Entreno Frambuesa', 'Sabor ácido para energía máxima', 'gold-standard.webp', 679.00, 17, '2025-04-20 01:12:20', '2025-04-20 01:12:20'),
(33, 'Shaker Pro', 'Vaso mezclador con compartimento extra', 'gold-standard.webp', 199.00, 30, '2025-04-20 01:12:20', '2025-04-20 01:12:20'),
(34, 'Proteína en Sobres', 'Ideal para viajes o porciones individuales', 'gold-standard.webp', 1350.00, 27, '2025-04-20 01:12:20', '2025-04-20 01:12:20'),
(35, 'Vitaminas B12', 'Energía y sistema nervioso saludable', 'gold-standard.webp', 450.00, 38, '2025-04-20 01:12:20', '2025-04-20 01:12:20'),
(36, 'Magnesio', 'Relajación muscular y mejor sueño', 'gold-standard.webp', 349.90, 40, '2025-04-20 01:12:20', '2025-04-20 01:12:20'),
(37, 'Zinc', 'Mejora el sistema inmune', 'gold-standard.webp', 320.00, 36, '2025-04-20 01:12:20', '2025-04-20 01:12:20'),
(38, 'Suplemento Keto', 'Ideal para dietas bajas en carbohidratos', 'gold-standard.webp', 899.99, 11, '2025-04-20 01:12:20', '2025-04-20 01:12:20'),
(39, 'Proteína para Niños', 'Desarrollo saludable con sabor chocolate', 'gold-standard.webp', 799.00, 21, '2025-04-20 01:12:20', '2025-04-20 01:12:20'),
(40, 'Pack Proteína + Creatina', 'Mejor combinación para fuerza y volumen', 'gold-standard.webp', 1499.99, 7, '2025-04-20 01:12:20', '2025-04-20 01:12:20'),
(41, 'Proteína PowerMax', 'Alta concentración de proteínas para atletas avanzados', 'gold-standard.webp', 1349.00, 14, '2025-04-20 01:14:49', '2025-04-20 01:14:49'),
(42, 'Batido Chocolate Intenso', 'Suplemento con sabor extra a cacao natural', 'gold-standard.webp', 1149.90, 18, '2025-04-20 01:14:49', '2025-04-20 01:14:49'),
(43, 'Creatina Micronizada', 'Fácil disolución y rápida absorción', 'gold-standard.webp', 520.00, 22, '2025-04-20 01:14:49', '2025-04-20 01:14:49'),
(44, 'Galletas Proteicas', 'Snacks ricos en proteína con chispas de chocolate', 'gold-standard.webp', 160.00, 60, '2025-04-20 01:14:49', '2025-04-20 01:14:49'),
(45, 'BCAA Mango', 'Aminoácidos esenciales sabor mango', 'gold-standard.webp', 899.00, 17, '2025-04-20 01:14:49', '2025-04-20 01:14:49'),
(46, 'Proteína Cero Carb', 'Sin carbohidratos, ideal para definición muscular', 'gold-standard.webp', 1420.00, 10, '2025-04-20 01:14:49', '2025-04-20 01:14:49'),
(47, 'Suero Isolate Pro', 'Fórmula avanzada de proteína aislada', 'gold-standard.webp', 1390.99, 12, '2025-04-20 01:14:49', '2025-04-20 01:14:49'),
(48, 'Pre Entreno NitroRush', 'Explosión de energía para entrenamientos intensos', 'gold-standard.webp', 670.00, 15, '2025-04-20 01:14:49', '2025-04-20 01:14:49'),
(49, 'Colágeno Marino', 'Alta absorción para piel, uñas y cabello', 'gold-standard.webp', 799.00, 25, '2025-04-20 01:14:49', '2025-04-20 01:14:49'),
(50, 'Caseína Nocturna', 'Proteína de liberación lenta para recuperación nocturna', 'gold-standard.webp', 1299.50, 11, '2025-04-20 01:14:49', '2025-04-20 01:14:49'),
(51, 'Multivitamínico Hombre', 'Fórmula completa para hombres activos', 'gold-standard.webp', 320.00, 30, '2025-04-20 01:14:49', '2025-04-20 01:14:49'),
(52, 'Multivitamínico Mujer', 'Fórmula especial para mujeres deportistas', 'gold-standard.webp', 340.00, 28, '2025-04-20 01:14:49', '2025-04-20 01:14:49'),
(53, 'Proteína Cereal', 'Sabor cereal con alto valor nutricional', 'gold-standard.webp', 1190.00, 16, '2025-04-20 01:14:49', '2025-04-20 01:14:49'),
(54, 'Shaker con Compartimientos', 'Ideal para proteína, pastillas y snacks', 'gold-standard.webp', 240.00, 20, '2025-04-20 01:14:49', '2025-04-20 01:14:49'),
(55, 'Proteína Premium', 'Calidad superior con mezcla de sabores', 'gold-standard.webp', 1499.00, 14, '2025-04-20 01:14:49', '2025-04-20 01:14:49'),
(56, 'Aminoácidos Sandía', 'Hidratación y recuperación sabor sandía', 'gold-standard.webp', 879.00, 19, '2025-04-20 01:14:49', '2025-04-20 01:14:49'),
(57, 'Proteína Café Mocha', 'Delicioso sabor para amantes del café', 'gold-standard.webp', 1320.00, 13, '2025-04-20 01:14:49', '2025-04-20 01:14:49'),
(58, 'Colágeno + Biotina', 'Mezcla ideal para piel radiante', 'gold-standard.webp', 850.00, 17, '2025-04-20 01:14:49', '2025-04-20 01:14:49'),
(59, 'Termogénico', 'Apoyo a la quema de grasa con energía', 'gold-standard.webp', 999.00, 20, '2025-04-20 01:14:49', '2025-04-20 01:14:49'),
(60, 'Suplemento Post Entreno', 'Recuperación completa tras ejercicios intensos', 'gold-standard.webp', 1090.00, 15, '2025-04-20 01:14:49', '2025-04-20 01:14:49'),
(61, 'Proteína Whey Pro', 'Suplemento diario para todo tipo de atletas', 'gold-standard.webp', 1250.00, 12, '2025-04-20 01:14:49', '2025-04-20 01:14:49'),
(62, 'Proteína con Avena', 'Mezcla energética de avena y proteína', 'gold-standard.webp', 1150.00, 20, '2025-04-20 01:14:49', '2025-04-20 01:14:49'),
(63, 'Pre Entreno Punch', 'Energía explosiva con sabor a frutas', 'gold-standard.webp', 689.00, 16, '2025-04-20 01:14:49', '2025-04-20 01:14:49'),
(64, 'Bebida Isotónica', 'Hidratación y electrolitos para rendimiento óptimo', 'gold-standard.webp', 150.00, 35, '2025-04-20 01:14:49', '2025-04-20 01:14:49'),
(65, 'Gel Energético', 'Rápido aporte calórico para carreras largas', 'gold-standard.webp', 110.00, 40, '2025-04-20 01:14:49', '2025-04-20 01:14:49'),
(66, 'Suplemento Articular', 'Cuida tus articulaciones con glucosamina y colágeno', 'gold-standard.webp', 790.00, 19, '2025-04-20 01:14:49', '2025-04-20 01:14:49'),
(67, 'Barritas Keto', 'Snack bajo en carbohidratos', 'gold-standard.webp', 180.00, 38, '2025-04-20 01:14:49', '2025-04-20 01:14:49'),
(68, 'Suplemento Detox', 'Desintoxica tu cuerpo con ingredientes naturales', 'gold-standard.webp', 499.00, 25, '2025-04-20 01:14:49', '2025-04-20 01:14:49'),
(69, 'Proteína Líquida', 'Botella lista para tomar con alto contenido proteico', 'gold-standard.webp', 145.00, 60, '2025-04-20 01:14:49', '2025-04-20 01:14:49'),
(70, 'Proteína Peanut Butter', 'Sabor mantequilla de maní y alta proteína', 'gold-standard.webp', 1290.00, 13, '2025-04-20 01:14:49', '2025-04-20 01:14:49'),
(71, 'Creatina + Beta Alanina', 'Combinación perfecta para fuerza y resistencia', 'gold-standard.webp', 790.00, 21, '2025-04-20 01:14:49', '2025-04-20 01:14:49'),
(72, 'Proteína Kids Fresa', 'Especial para niños activos, sabor fresa', 'gold-standard.webp', 820.00, 24, '2025-04-20 01:14:49', '2025-04-20 01:14:49'),
(73, 'Pre Entreno Woman', 'Energizante suave para mujeres', 'gold-standard.webp', 620.00, 22, '2025-04-20 01:14:49', '2025-04-20 01:14:49'),
(74, 'Vitamina C + Zinc', 'Apoya al sistema inmune', 'gold-standard.webp', 290.00, 28, '2025-04-20 01:14:49', '2025-04-20 01:14:49'),
(75, 'Magnesio + Melatonina', 'Relajación y mejora del sueño', 'gold-standard.webp', 360.00, 19, '2025-04-20 01:14:49', '2025-04-20 01:14:49'),
(76, 'Cápsulas de Colágeno', 'Cuidado de piel y articulaciones en formato cápsula', 'gold-standard.webp', 480.00, 30, '2025-04-20 01:14:49', '2025-04-20 01:14:49'),
(77, 'Suplemento Focus', 'Mejora concentración y energía mental', 'gold-standard.webp', 850.00, 14, '2025-04-20 01:14:49', '2025-04-20 01:14:49'),
(78, 'Proteína High Fiber', 'Con alto contenido en fibra para digestión', 'gold-standard.webp', 1120.00, 18, '2025-04-20 01:14:49', '2025-04-20 01:14:49'),
(79, 'Pack Recuperación Total', 'Incluye proteína, BCAA y creatina', 'gold-standard.webp', 1450.00, 9, '2025-04-20 01:14:49', '2025-04-20 01:14:49'),
(80, 'Bebida Recovery', 'Bebida lista para recuperar tras el entrenamiento', 'gold-standard.webp', 140.00, 33, '2025-04-20 01:14:49', '2025-04-20 01:14:49'),
(81, 'Isolate Chocolate Blanco', 'Sabor único con proteína de calidad', 'gold-standard.webp', 1370.00, 10, '2025-04-20 01:14:49', '2025-04-20 01:14:49'),
(82, 'Gomitas de Vitaminas', 'Multivitamínico en presentación de gomita', 'gold-standard.webp', 310.00, 27, '2025-04-20 01:14:49', '2025-04-20 01:14:49'),
(83, 'Pre Entreno Hardcore', 'Estímulo máximo para entrenamientos extremos', 'gold-standard.webp', 740.00, 11, '2025-04-20 01:14:49', '2025-04-20 01:14:49'),
(84, 'Proteína Herbal', 'Combinación de proteína y extractos herbales', 'gold-standard.webp', 1220.00, 12, '2025-04-20 01:14:49', '2025-04-20 01:14:49'),
(85, 'BCAA Limón', 'Aminoácidos esenciales sabor limón', 'gold-standard.webp', 850.00, 14, '2025-04-20 01:14:49', '2025-04-20 01:14:49'),
(86, 'Proteína + Creatina', 'Doble beneficio para músculo y energía', 'gold-standard.webp', 1350.00, 14, '2025-04-20 01:14:49', '2025-06-29 03:16:42'),
(87, 'Suplemento para Hígado', 'Apoyo hepático con ingredientes naturales', 'gold-standard.webp', 590.00, 23, '2025-04-20 01:14:49', '2025-04-20 01:14:49'),
(88, 'Proteína Sabor Plátano', 'Ideal para desayunos rápidos', 'gold-standard.webp', 1125.00, 16, '2025-04-20 01:14:49', '2025-07-07 21:23:11'),
(89, 'Proteína con Caféína', 'Aumenta la energía durante el día', 'gold-standard.webp', 1270.00, 0, '2025-04-20 01:14:49', '2025-04-30 01:39:15'),
(90, 'Proteína Post Cirugía', 'Fórmula especializada para recuperación', '1745529383805_proteina.png', 1199.00, 2, '2025-04-24 21:04:10', '2025-07-07 23:35:35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sales`
--

CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `clientId` char(36) DEFAULT NULL,
  `userId` char(36) DEFAULT NULL,
  `clientName` varchar(50) DEFAULT NULL,
  `total` decimal(10,2) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `paymentMethod` enum('cash','card','transfer','deposit','qr','other') NOT NULL DEFAULT 'cash'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sales`
--

INSERT INTO `sales` (`id`, `clientId`, `userId`, `clientName`, `total`, `createdAt`, `paymentMethod`) VALUES
(26, 'fe185413-2537-11f0-ad2f-7c8ae1ba21d6', 'fa47fd9c-1a6a-11f0-b258-7c8ae1ba21d6', 'Juan Pérez', 1544.00, '2025-07-08 04:35:35', 'cash');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sales_details`
--

CREATE TABLE `sales_details` (
  `id` int(11) NOT NULL,
  `saleId` int(11) NOT NULL,
  `productId` int(11) DEFAULT NULL,
  `membershipId` int(11) DEFAULT NULL,
  `type` enum('product','membership') NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `unitPrice` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sales_details`
--

INSERT INTO `sales_details` (`id`, `saleId`, `productId`, `membershipId`, `type`, `quantity`, `unitPrice`, `subtotal`, `createdAt`) VALUES
(26, 26, NULL, 13, 'membership', 1, 345.00, 345.00, '2025-07-08 04:35:35'),
(27, 26, 90, NULL, 'product', 1, 1199.00, 1199.00, '2025-07-08 04:35:35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` char(36) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('1','2','3') NOT NULL DEFAULT '3',
  `lastLogin` timestamp NULL DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `lastLogin`, `createdAt`, `updatedAt`) VALUES
('fa47fd9c-1a6a-11f0-b258-7c8ae1ba21d6', 'Angel Leija', 'angel@example.com', '12345678', '3', NULL, '2025-04-16 02:32:01', '2025-04-29 21:01:46');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`clientId`);

--
-- Indices de la tabla `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `clients_memberships`
--
ALTER TABLE `clients_memberships`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`clientId`),
  ADD KEY `membership_id` (`membershipId`);

--
-- Indices de la tabla `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`userId`);

--
-- Indices de la tabla `memberships`
--
ALTER TABLE `memberships`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`clientId`),
  ADD KEY `user_id` (`userId`);

--
-- Indices de la tabla `sales_details`
--
ALTER TABLE `sales_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale_id` (`saleId`),
  ADD KEY `product_id` (`productId`),
  ADD KEY `membership_id` (`membershipId`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `attendances`
--
ALTER TABLE `attendances`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `clients_memberships`
--
ALTER TABLE `clients_memberships`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `memberships`
--
ALTER TABLE `memberships`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT de la tabla `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `sales_details`
--
ALTER TABLE `sales_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `attendances`
--
ALTER TABLE `attendances`
  ADD CONSTRAINT `attendances_ibfk_1` FOREIGN KEY (`clientId`) REFERENCES `clients` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `clients_memberships`
--
ALTER TABLE `clients_memberships`
  ADD CONSTRAINT `clients_memberships_ibfk_1` FOREIGN KEY (`clientId`) REFERENCES `clients` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `clients_memberships_ibfk_2` FOREIGN KEY (`membershipId`) REFERENCES `memberships` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `logs`
--
ALTER TABLE `logs`
  ADD CONSTRAINT `logs_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`clientId`) REFERENCES `clients` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `sales_details`
--
ALTER TABLE `sales_details`
  ADD CONSTRAINT `sales_details_ibfk_1` FOREIGN KEY (`saleId`) REFERENCES `sales` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sales_details_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `products` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `sales_details_ibfk_3` FOREIGN KEY (`membershipId`) REFERENCES `memberships` (`id`) ON DELETE SET NULL;
--
-- Base de datos: `inventario_uttn`
--
CREATE DATABASE IF NOT EXISTS `inventario_uttn` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `inventario_uttn`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulo`
--

CREATE TABLE `articulo` (
  `id` int(255) NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `marca` varchar(250) NOT NULL,
  `modelo` varchar(250) NOT NULL,
  `serie` varchar(250) NOT NULL,
  `imagen` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `articulo`
--

INSERT INTO `articulo` (`id`, `nombre`, `marca`, `modelo`, `serie`, `imagen`) VALUES
(261262, 'Ipad', 'Apple', 'MXAT2LZ/A', 'DMPDWVQNF', '1710433076_ipad.jpg'),
(261282, 'Escritorio', 'N/A', 'EST2131', 'S/N', '1710432876_escritorio.webp'),
(261302, 'Silla giratoria', 'N/A', 'N/A', 'S/N', '1710432292_silla.webp');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `condiciones`
--

CREATE TABLE `condiciones` (
  `idcondiciones` int(250) NOT NULL,
  `nombre` char(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `condiciones`
--

INSERT INTO `condiciones` (`idcondiciones`, `nombre`) VALUES
(1, 'Funcional'),
(2, 'En mantenimiento'),
(3, 'Baja');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles`
--

CREATE TABLE `detalles` (
  `idcondiciones` int(255) NOT NULL,
  `empleado` char(255) NOT NULL,
  `idedificio` int(255) NOT NULL,
  `iddetalles` int(255) NOT NULL,
  `id` int(255) NOT NULL,
  `fecha` date NOT NULL,
  `departamento` varchar(250) NOT NULL,
  `programa` varchar(250) NOT NULL,
  `area` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `edificio`
--

CREATE TABLE `edificio` (
  `idedificio` int(250) NOT NULL,
  `nombre` char(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `edificio`
--

INSERT INTO `edificio` (`idedificio`, `nombre`) VALUES
(1, 'C'),
(2, 'F');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articulo`
--
ALTER TABLE `articulo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `condiciones`
--
ALTER TABLE `condiciones`
  ADD PRIMARY KEY (`idcondiciones`);

--
-- Indices de la tabla `detalles`
--
ALTER TABLE `detalles`
  ADD PRIMARY KEY (`iddetalles`),
  ADD KEY `id` (`id`),
  ADD KEY `idcondiciones` (`idcondiciones`),
  ADD KEY `idedificio` (`idedificio`);

--
-- Indices de la tabla `edificio`
--
ALTER TABLE `edificio`
  ADD PRIMARY KEY (`idedificio`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `detalles`
--
ALTER TABLE `detalles`
  MODIFY `iddetalles` int(255) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalles`
--
ALTER TABLE `detalles`
  ADD CONSTRAINT `detalles_ibfk_1` FOREIGN KEY (`id`) REFERENCES `articulo` (`id`),
  ADD CONSTRAINT `detalles_ibfk_2` FOREIGN KEY (`idcondiciones`) REFERENCES `condiciones` (`idcondiciones`),
  ADD CONSTRAINT `detalles_ibfk_5` FOREIGN KEY (`idedificio`) REFERENCES `edificio` (`idedificio`);
--
-- Base de datos: `it_tickets_db`
--
CREATE DATABASE IF NOT EXISTS `it_tickets_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `it_tickets_db`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrators`
--

CREATE TABLE `administrators` (
  `administrator_id` char(32) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `username` varchar(100) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agents`
--

CREATE TABLE `agents` (
  `agent_id` char(32) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `username` varchar(100) NOT NULL,
  `last_login` datetime NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tickets`
--

CREATE TABLE `tickets` (
  `ticket_id` int(11) NOT NULL,
  `user_id` char(32) NOT NULL,
  `agent_id` char(32) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `state` varchar(25) NOT NULL,
  `created_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `user_id` char(32) NOT NULL,
  `username` varchar(100) NOT NULL,
  `last_login` datetime NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrators`
--
ALTER TABLE `administrators`
  ADD UNIQUE KEY `idx_unique_email` (`email`);

--
-- Indices de la tabla `agents`
--
ALTER TABLE `agents`
  ADD UNIQUE KEY `idx_unique_email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`ticket_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD UNIQUE KEY `idx_unique_username` (`username`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tickets`
--
ALTER TABLE `tickets`
  MODIFY `ticket_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Base de datos: `new_portal_ballerina_db`
--
CREATE DATABASE IF NOT EXISTS `new_portal_ballerina_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `new_portal_ballerina_db`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrators`
--

CREATE TABLE `administrators` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `lastLogin` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `administrators`
--

INSERT INTO `administrators` (`id`, `name`, `email`, `password`, `lastLogin`, `createdAt`) VALUES
(14, 'Angel Leija', 'angel.leija@ballerinareynosa.com', '$2a$11$6.rfYbsECIVUxJHFKTPWEeucPEonzGzvw1i1cnFl9Fc8XKzXSQVmq', '2025-05-28 23:25:13', '2025-05-28 23:25:13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `role` varchar(100) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `employees`
--

INSERT INTO `employees` (`id`, `name`, `role`, `createdAt`, `updatedAt`) VALUES
(1, 'Javier Leija', 'Administrador', '2025-05-14 03:31:41', NULL),
(2, 'Angel Leija', 'Administrador', '2025-05-27 21:37:13', '2025-05-27 16:37:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `employee_payments`
--

CREATE TABLE `employee_payments` (
  `paymentId` int(11) NOT NULL,
  `employeeId` int(11) NOT NULL,
  `amount` double NOT NULL,
  `paymentMethod` varchar(50) DEFAULT NULL,
  `createdAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `expenses`
--

CREATE TABLE `expenses` (
  `id` int(11) NOT NULL,
  `concept` varchar(255) NOT NULL,
  `amount` double NOT NULL,
  `paymentMethod` varchar(50) NOT NULL,
  `category` varchar(50) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `expenses`
--

INSERT INTO `expenses` (`id`, `concept`, `amount`, `paymentMethod`, `category`, `createdAt`, `updatedAt`) VALUES
(2, 'impermeabilizada', 1300, 'card', 'Otro', '2024-07-22 13:12:39', NULL),
(3, 'pago de la pagina angel', 4700, 'cash', 'Otro', '2024-07-22 13:13:22', NULL),
(4, 'papas', 1200, 'transfer', 'Otro', '2024-07-22 13:13:57', NULL),
(5, 'Ballet Shoes', 1606, 'card', 'Otro', '2024-07-22 15:45:29', NULL),
(6, '\r\nlimpieza / impermeabilizada', 3650, 'card', 'Otro', '2024-07-22 15:46:52', NULL),
(7, 'Gastos Willy / comida', 800, 'cash', 'Comida', '2024-07-22 15:47:21', NULL),
(8, 'Impuestos', 2500, 'cash', 'Impuestos', '2024-07-22 15:47:44', NULL),
(9, 'Nissan Ford Camioneta', 1166, 'cash', 'Otro', '2024-07-22 19:31:38', NULL),
(10, 'remodelacion', 189, 'card', 'Otro', '2024-07-23 14:01:55', NULL),
(11, 'remodelacion', 272, 'card', 'Otro', '2024-07-23 14:02:32', NULL),
(12, 'remodelacion', 5645, 'card', 'Otro', '2024-07-23 14:03:48', NULL),
(13, 'mtto', 1400, 'card', 'Otro', '2024-07-24 15:43:05', NULL),
(15, 'Pago Suhey Curso Aereo ', 9250, 'cash', 'Otro', '2024-07-26 19:29:53', NULL),
(16, 'Nómina Odette', 1600, 'cash', 'Nómina', '2024-07-31 16:34:53', NULL),
(17, 'Pago luz CFE', 6732, 'card', 'CFE', '2024-07-31 16:50:24', NULL),
(18, 'Home Depot Willy', 5046, 'card', 'Otro', '2024-07-31 16:51:02', NULL),
(19, 'Soriana Willy', 172, 'card', 'Otro', '2024-07-31 16:51:20', NULL),
(20, 'COMAPA', 274, 'card', 'COMAPA', '2024-08-09 16:13:47', NULL),
(21, 'Papeleria Hojas Opalina', 124, 'cash', 'Otro', '2024-08-09 16:15:31', NULL),
(22, 'Nómina Odette', 1600, 'cash', 'Nómina', '2024-08-09 18:43:15', NULL),
(23, 'Aguas/gatorade Sandra', 130, 'none', 'Otro', '2024-08-09 18:49:55', NULL),
(24, 'Sillas Evento Aereo', 780, 'cash', 'Otro', '2024-08-24 17:21:06', NULL),
(25, 'Utencilios Jesse Clase Baby Ballet', 298, 'card', 'Otro', '2024-08-24 17:21:39', NULL),
(26, 'Playeras', 2804, 'transfer', 'Otro', '2024-08-24 17:22:00', NULL),
(27, 'Sandra Gatorade/aguas', 114, 'cash', 'Otro', '2024-08-24 17:22:20', NULL),
(28, 'letrero / formato inscripcion', 81, 'cash', 'Otro', '2024-08-26 19:59:14', NULL),
(29, 'Nómina Jaqueline Hinojosa ', 150, 'cash', 'Nómina', '2024-08-29 16:50:51', NULL),
(30, 'Nómina Suhey', 500, 'cash', 'Nómina', '2024-08-29 19:11:52', NULL),
(31, 'Nómina Odette', 1600, 'cash', 'Nómina', '2024-08-29 19:13:56', NULL),
(32, 'Nómina Sandra Limpieza', 750, 'cash', 'Nómina', '2024-08-31 11:19:28', NULL),
(33, 'Nómina Sany ', 150, 'cash', 'Nómina', '2024-08-31 11:19:46', NULL),
(34, 'Romina Regalo de graduación', 3000, 'cash', 'Otro', '2024-09-03 17:43:52', NULL),
(35, 'Willy Empanadas jaja', 90, 'cash', 'Otro', '2024-09-03 17:44:10', NULL),
(36, 'Nómina Semanal Suhey', 500, 'cash', 'Nómina', '2024-09-03 17:46:31', NULL),
(37, 'Nómina Sandra limpieza', 750, 'cash', 'Nómina', '2024-09-03 17:47:47', NULL),
(38, 'Nómina Sany teatro musical', 150, 'cash', 'Nómina', '2024-09-03 17:49:34', NULL),
(39, 'Nómina Jesse Baby Ballet', 300, 'cash', 'Nómina', '2024-09-04 15:57:45', NULL),
(40, 'Nómina Jaqueline Lírico', 150, 'cash', 'Nómina', '2024-09-06 15:32:58', NULL),
(41, 'Nómina Odette ', 1600, 'cash', 'Nómina', '2024-09-06 15:33:41', NULL),
(42, 'Nómina Julieta', 500, 'cash', 'Nómina', '2024-09-06 18:10:35', NULL),
(43, 'Lypro', 148, 'cash', 'LYPRO', '2024-09-07 11:06:30', NULL),
(44, 'Nómina Suhey Semanal', 500, 'cash', 'Nómina', '2024-09-10 17:35:47', NULL),
(45, 'Nómina Sany Teatro M', 150, 'cash', 'Nómina', '2024-09-10 17:36:00', NULL),
(46, 'COMAPA agua', 563, 'cash', 'COMAPA', '2024-09-10 18:28:01', NULL),
(47, 'Odette Nómina', 1600, 'cash', 'Nómina', '2024-09-17 15:26:04', NULL),
(48, 'Nómina sandra limpieza', 750, 'cash', 'Nómina', '2024-09-17 15:26:26', NULL),
(49, 'Halloween deco', 164, 'cash', 'Otro', '2024-09-17 15:28:02', NULL),
(50, 'Lypro', 179, 'cash', 'LYPRO', '2024-09-17 16:13:17', NULL),
(51, '\r\n\r\nSuhey nómina', 500, 'cash', 'Nómina', '2024-09-17 19:07:11', NULL),
(52, 'Jaqui Nómina', 150, 'cash', 'Nómina', '2024-09-20 16:41:57', NULL),
(53, 'Jesse Nómina', 300, 'cash', 'Nómina', '2024-09-20 16:42:11', NULL),
(54, 'Jesse Nómina (anterior semana)', 300, 'cash', 'Nómina', '2024-09-20 16:43:27', NULL),
(55, 'Pablo Comida de mascotas', 477, 'cash', 'Comida', '2024-09-20 16:43:56', NULL),
(57, '7 Leotardo Lesslie ', 1390, 'cash', 'Otro', '2024-09-21 09:18:27', NULL),
(58, 'Nómina Odette', 1600, 'cash', 'Nómina', '2024-09-21 09:18:40', NULL),
(59, 'CFE', 1755, 'card', 'CFE', '2024-09-21 09:31:53', NULL),
(60, 'Nómina Suhey', 500, 'cash', 'Nómina', '2024-09-25 19:06:45', NULL),
(61, 'Nómina Jesse', 300, 'cash', 'Nómina', '2024-09-25 19:07:06', NULL),
(62, 'Nómina Sany', 150, 'cash', 'Nómina', '2024-09-25 19:07:16', NULL),
(64, 'Chuleta Quincena 21 septiembre', 500, 'cash', 'Otro', '2024-09-25 19:44:46', NULL),
(65, 'Pago Playeras + Comisión', 1485, 'cash', 'Ropa', '2024-09-27 17:17:36', NULL),
(66, 'Sany teatro Nómina (17 de septiembre)', 150, 'cash', 'Nómina', '2024-09-27 18:21:57', NULL),
(67, 'Jaqui Nómina (17 de septiembre)', 150, 'cash', 'Nómina', '2024-09-27 18:23:09', NULL),
(68, 'Odette nómina', 1600, 'cash', 'Nómina', '2024-09-27 18:24:14', NULL),
(69, 'Suhey Nómina', 500, 'cash', 'Nómina', '2024-10-01 18:00:39', NULL),
(71, 'Clase Lírico (cubrió Suhey) 27/09/24', 150, 'cash', 'Otro', '2024-10-01 18:02:39', NULL),
(72, 'Nómina Sany', 150, 'cash', 'Nómina', '2024-10-01 18:03:24', NULL),
(73, 'Nómina Jesse', 300, 'cash', 'Nómina', '2024-10-02 16:00:33', NULL),
(74, 'Lypro (clips, hojas de máquina & mini sharpie)', 89, 'cash', 'LYPRO', '2024-10-02 16:01:47', NULL),
(75, 'Nómina Romina\r\n2 quincenas', 1000, 'cash', 'Nómina', '2024-10-02 17:59:25', NULL),
(76, 'Foco ', 150, 'cash', 'Otro', '2024-10-03 16:26:51', NULL),
(77, 'Sandra Limpieza', 750, 'cash', 'Otro', '2024-10-03 16:28:50', NULL),
(78, 'Jaqui Nómina 03/10/24', 150, 'cash', 'Nómina', '2024-10-07 15:31:31', NULL),
(79, 'Julieta Nómina Quincena 05/10/24', 500, 'cash', 'Nómina', '2024-10-07 15:31:58', NULL),
(80, 'Romina Nómina Quincena (05/10/24)', 500, 'cash', 'Nómina', '2024-10-07 15:32:21', NULL),
(81, 'Odette Nómina ', 1600, 'cash', 'Nómina', '2024-10-07 15:42:34', NULL),
(82, 'Suhey NóminA', 500, 'cash', 'Nómina', '2024-10-08 19:51:13', NULL),
(83, 'hojas de máquina Lypro', 120, 'cash', 'LYPRO', '2024-10-09 16:37:44', NULL),
(84, 'COMAPA agua', 259, 'cash', 'COMAPA', '2024-10-09 16:46:55', NULL),
(85, 'Nómina Jesse ', 300, 'cash', 'Nómina', '2024-10-09 16:50:53', NULL),
(86, 'Nómina Sandra', 150, 'cash', 'Nómina', '2024-10-09 16:51:13', NULL),
(87, 'Stand Evento KidsFest', 500, 'transfer', 'Otro', '2024-10-09 16:55:01', NULL),
(88, 'Nómina Sandra Limpieza', 750, 'cash', 'Nómina', '2024-10-10 15:55:39', NULL),
(89, 'Nómina  Jaqueline Lírico', 150, 'cash', 'Nómina', '2024-10-10 15:56:04', NULL),
(90, 'Nómina Odette', 1600, 'cash', 'Nómina', '2024-10-11 15:32:23', NULL),
(91, 'Willy Parisina ', 450, 'card', 'Otro', '2024-10-11 15:32:53', NULL),
(92, 'Willy gastos comex ', 160, 'cash', 'Otro', '2024-10-12 12:35:50', NULL),
(94, 'Papeleria', 300, 'cash', 'Otro', '2024-10-12 12:36:11', NULL),
(96, 'Globos Evento', 1000, 'cash', 'Otro', '2024-10-14 16:19:19', NULL),
(97, 'Flyers 250\r\nDulces 250 2 kg', 500, 'cash', 'Otro', '2024-10-14 16:21:38', NULL),
(98, 'Nomina Jesse', 300, 'cash', 'Nómina', '2024-10-16 21:11:36', NULL),
(99, 'Leotardos Lesslie ', 2800, 'transfer', 'Otro', '2024-10-16 21:12:01', NULL),
(100, 'Jaqueline Nómina', 150, 'cash', 'Nómina', '2024-10-18 16:03:22', NULL),
(101, 'Nómina Suhey', 500, 'cash', 'Nómina', '2024-10-18 16:13:21', NULL),
(102, 'Nómina Sany', 150, 'cash', 'Nómina', '2024-10-18 16:13:57', NULL),
(104, 'sandra limpieza', 750, 'cash', 'Otro', '2024-10-18 16:14:30', NULL),
(105, 'Willy gastos 17 oct', 380, 'card', 'Otro', '2024-10-18 16:17:07', NULL),
(106, 'Willy gastos 16 oct', 250, 'card', 'Otro', '2024-10-18 16:17:30', NULL),
(107, 'Odette Nómina ', 1600, 'cash', 'Nómina', '2024-10-18 16:18:57', NULL),
(108, 'Playeras Mama pelo azul', 1490, 'cash', 'Otro', '2024-10-19 09:57:20', NULL),
(109, 'Romina Nómina', 500, 'cash', 'Nómina', '2024-10-19 10:07:36', NULL),
(110, 'Julieta Nómina', 500, 'cash', 'Nómina', '2024-10-19 11:16:54', NULL),
(111, 'Nómina Suhey Aéreo', 500, 'cash', 'Nómina', '2024-10-23 16:13:31', NULL),
(112, 'Jesse Nómina', 300, 'cash', 'Nómina', '2024-10-23 16:16:07', NULL),
(114, 'Nómina Sany Teatro', 150, 'cash', 'Nómina', '2024-10-23 16:16:23', NULL),
(115, 'Nómina Jaqui', 150, 'cash', 'Nómina', '2024-10-24 15:47:35', NULL),
(117, 'Dogo\r\nFunda 60 cm\r\nEscoba\r\npapel Craft', 217, 'cash', 'Otro', '2024-10-24 15:50:37', NULL),
(118, 'Notas Comprobantes Willy', 700, 'cash', 'Otro', '2024-10-25 15:43:43', NULL),
(119, 'Nómina Odette', 1600, 'cash', 'Nómina', '2024-10-25 15:44:01', NULL),
(120, 'Limpieza Sandra', 750, 'cash', 'Otro', '2024-10-25 15:44:25', NULL),
(122, 'Costurera Payasitos', 5100, 'cash', 'Otro', '2024-10-25 18:19:09', NULL),
(124, 'Playeras mama Arantza', 480, 'cash', 'Ropa', '2024-10-28 17:54:24', NULL),
(125, 'Costurera ORALDA \r\n', 5000, 'cash', 'Ropa', '2024-10-29 16:28:08', NULL),
(126, 'Telas Material Cascanueces', 800, 'card', 'Otro', '2024-10-29 16:34:41', NULL),
(127, 'Jesse Nómina', 300, 'cash', 'Nómina', '2024-10-30 17:21:54', NULL),
(128, 'Gastos Willy (puente de McAllen)', 300, 'cash', 'Otro', '2024-10-30 17:22:15', NULL),
(129, 'Suhey Nómina ', 500, 'cash', 'Nómina', '2024-10-30 17:56:52', NULL),
(130, 'Sany Nómina', 150, 'cash', 'Nómina', '2024-10-30 18:15:20', NULL),
(131, 'Julieta Nómina', 500, 'cash', 'Nómina', '2024-10-30 18:17:04', NULL),
(132, 'Romina Nómina', 500, 'cash', 'Nómina', '2024-10-30 18:17:15', NULL),
(133, 'Jaqui Nómina', 150, 'cash', 'Nómina', '2024-10-31 17:22:50', NULL),
(134, 'Odette Nómina', 1600, 'cash', 'Nómina', '2024-11-04 18:35:27', NULL),
(135, 'Playeras pelo azul', 300, 'cash', 'Ropa', '2024-11-04 18:35:57', NULL),
(136, 'Paquete Hojas Pastel', 187, 'cash', 'Otro', '2024-11-05 17:19:37', NULL),
(137, 'Cinta', 12, 'cash', 'Otro', '2024-11-05 19:34:55', NULL),
(138, 'Nómina Suhey', 500, 'cash', 'Nómina', '2024-11-05 21:31:50', NULL),
(139, 'Sandra Nómina', 150, 'cash', 'Nómina', '2024-11-05 21:32:06', NULL),
(140, 'Jesse Nómina', 300, 'cash', 'Nómina', '2024-11-06 20:17:35', NULL),
(141, 'Anticipo Playeras Pelo Azul', 4000, 'cash', 'Otro', '2024-11-06 20:18:21', NULL),
(142, 'Pedido Leotardos', 6106, 'card', 'Ropa', '2024-11-06 20:19:26', NULL),
(143, 'Shein', 1500, 'card', 'Otro', '2024-11-06 20:20:16', NULL),
(144, 'Temu', 2325, 'card', 'Otro', '2024-11-06 20:20:41', NULL),
(145, 'Publicidad Facebook', 1000, 'card', 'Otro', '2024-11-06 20:21:09', NULL),
(146, 'Publicidad Instagram', 500, 'cash', 'Otro', '2024-11-06 20:21:36', NULL),
(147, 'Amazon', 150, 'card', 'Otro', '2024-11-06 20:21:49', NULL),
(148, 'Jaqueline Nómina', 150, 'cash', 'Nómina', '2024-11-08 17:02:21', NULL),
(149, 'Sandra Limpieza', 750, 'cash', 'Otro', '2024-11-08 17:02:37', NULL),
(150, 'Odette Nómina', 1600, 'cash', 'Nómina', '2024-11-08 17:02:49', NULL),
(151, 'Agua', 1588, 'card', 'Otro', '2024-11-08 17:06:19', NULL),
(152, 'Nómina Suhey', 500, 'cash', 'Nómina', '2024-11-12 20:57:16', NULL),
(153, 'Nómina Jesse', 300, 'cash', 'Nómina', '2024-11-13 16:40:03', NULL),
(154, 'Nómina Sany', 150, 'cash', 'Nómina', '2024-11-13 16:40:14', NULL),
(156, 'Izzi Internet - Octubre', 610, 'transfer', 'Otro', '2024-11-14 17:14:48', NULL),
(157, 'Nómina Chuleta ', 500, 'cash', 'Nómina', '2024-11-14 18:13:03', NULL),
(158, 'Sandra Limpieza', 750, 'cash', 'Otro', '2024-11-14 18:15:39', NULL),
(159, 'Nómina Odette', 1066, 'cash', 'Nómina', '2024-11-14 18:25:35', NULL),
(160, 'Sany 08-10-24', 150, 'cash', 'Otro', '2024-11-14 18:34:19', NULL),
(162, 'Sany Nómina', 150, 'cash', 'Nómina', '2024-11-19 19:00:32', NULL),
(163, 'Suhey nómina', 500, 'cash', 'Nómina', '2024-11-19 19:03:41', NULL),
(164, 'Jesse (ya se pagaron correspondiente, solo no lo había anotado)\r\n07.10.24\r\n14.10.24\r\n21.10.24\r\n28.10.24', 600, 'cash', 'Otro', '2024-11-19 19:17:12', NULL),
(165, 'Costurera Laura PAYASOS', 5100, 'cash', 'Ropa', '2024-11-20 19:36:26', NULL),
(166, 'Costurera Laura RENOS\r\n', 3750, 'cash', 'Ropa', '2024-11-20 19:36:55', NULL),
(167, 'Costurera Laura', 1840, 'cash', 'Ropa', '2024-11-23 13:27:16', NULL),
(168, 'Nómina Odette + 1 día', 1866, 'cash', 'Nómina', '2024-11-23 13:27:49', NULL),
(169, 'Limpieza', 750, 'cash', 'Otro', '2024-11-23 13:28:05', NULL),
(170, 'Romina 11 - 14 sem ', 500, 'cash', 'Otro', '2024-11-23 13:28:51', NULL),
(171, 'Jesse nómina', 300, 'cash', 'Nómina', '2024-11-23 13:32:18', NULL),
(172, 'CFE nov', 4546, 'card', 'CFE', '2024-11-25 17:22:55', NULL),
(173, 'Cintas', 97, 'cash', 'Otro', '2024-11-25 17:49:32', NULL),
(174, 'Nómina Julieta', 500, 'cash', 'Nómina', '2024-11-25 20:31:37', NULL),
(175, 'Pago playeras', 7450, 'cash', 'Ropa', '2024-11-26 19:48:00', NULL),
(176, 'Suhey nómina', 500, 'cash', 'Nómina', '2024-11-27 21:01:07', NULL),
(177, 'Sany x 4 días', 600, 'cash', 'Otro', '2024-11-27 21:04:25', NULL),
(178, 'Costurera ORALDA \r\n4000 + 2000 material', 6000, 'cash', 'Ropa', '2024-11-27 21:07:57', NULL),
(179, 'Playeras Arantza extras :(', 400, 'cash', 'Ropa', '2024-12-02 16:55:28', NULL),
(180, 'Mallas Pinky', 5530, 'card', 'Otro', '2024-12-02 17:51:20', NULL),
(181, 'La chula novedades', 316, 'cash', 'Otro', '2024-12-02 18:35:32', NULL),
(182, 'Marcadores', 68, 'cash', 'Otro', '2024-12-02 18:46:26', NULL),
(183, 'COMAPA agua', 563, 'cash', 'COMAPA', '2024-12-03 16:42:28', NULL),
(184, 'Jesse x 3días ( sem pasada, esta semana)', 450, 'cash', 'Otro', '2024-12-03 17:17:29', NULL),
(185, 'Romina nómina', 500, 'cash', 'Nómina', '2024-12-03 20:40:23', NULL),
(186, 'señora oralda costura\r\npendiente $800\r\npendiente moño muñeca', 16050, 'cash', 'Ropa', '2024-12-04 20:07:48', NULL),
(187, 'Julieta nómina', 500, 'cash', 'Nómina', '2024-12-13 18:55:33', NULL),
(188, 'Señora Valentina Costurera', 2000, 'cash', 'Otro', '2024-12-13 18:55:47', NULL),
(189, 'La Chinita Moños Payasitos', 219, 'cash', 'Ropa', '2024-12-13 18:56:19', NULL),
(190, 'Romina Nómina', 500, 'cash', 'Nómina', '2024-12-13 19:01:38', NULL),
(191, 'Nómina Suhey', 250, 'cash', 'Nómina', '2025-01-09 17:22:05', NULL),
(192, 'Nómina Sany', 150, 'cash', 'Nómina', '2025-01-09 17:22:24', NULL),
(195, 'Nómina Jesse 1 día', 150, 'cash', 'Nómina', '2025-01-09 17:49:01', NULL),
(196, 'Nómina Jaqueline x 3 días', 450, 'cash', 'Nómina', '2025-01-09 18:18:05', NULL),
(197, 'nómina Odette ', 1600, 'cash', 'Nómina', '2025-01-09 18:34:35', NULL),
(198, 'Nómina Sandra limpieza', 1000, 'cash', 'Nómina', '2025-01-10 17:30:56', NULL),
(199, 'Papelería pluma', 98, 'cash', 'Otro', '2025-01-13 17:20:31', NULL),
(200, 'Nómina Profe Carmen', 500, 'cash', 'Nómina', '2025-01-13 17:24:23', NULL),
(201, 'Nómina Julieta semana anterior', 500, 'cash', 'Nómina', '2025-01-13 17:24:55', NULL),
(203, 'COMAPA agua', 1588, 'card', 'COMAPA', '2025-01-13 19:27:07', NULL),
(204, 'luz CFE', 4546, 'card', 'CFE', '2025-01-13 19:29:09', NULL),
(205, 'Nómina Suhey', 250, 'cash', 'Nómina', '2025-01-15 19:57:29', NULL),
(206, 'Nómina Jesse', 300, 'cash', 'Nómina', '2025-01-15 19:57:46', NULL),
(207, 'Nómina Odette ', 1600, 'cash', 'Nómina', '2025-01-15 19:59:31', NULL),
(208, 'Nómina Profe Cármen', 500, 'cash', 'Nómina', '2025-01-17 19:17:13', NULL),
(209, 'Jesse Nómina x 2 \r\n(Cubrió a Miranda)', 300, 'cash', 'Nómina', '2025-01-22 17:14:02', NULL),
(210, 'Julieta nómina', 500, 'cash', 'Nómina', '2025-01-22 17:35:08', NULL),
(211, 'Papelería Sobres', 36, 'cash', 'Otro', '2025-01-22 17:39:21', NULL),
(212, 'Sandra Limpieza Nómina', 1000, 'cash', 'Nómina', '2025-01-23 17:34:27', NULL),
(213, 'Jaqueline Nómina', 150, 'cash', 'Nómina', '2025-01-23 17:35:07', NULL),
(214, 'Profe Carmen Nómina', 500, 'cash', 'Nómina', '2025-01-24 17:26:46', NULL),
(215, 'Odette Nómina', 1600, 'cash', 'Nómina', '2025-01-24 17:27:06', NULL),
(216, 'Romina Nómina', 500, 'cash', 'Nómina', '2025-01-27 16:41:59', NULL),
(217, 'Suhey nómina', 250, 'cash', 'Nómina', '2025-01-29 17:47:45', NULL),
(218, 'Jesse Nómina', 300, 'cash', 'Nómina', '2025-01-29 17:47:57', NULL),
(219, 'Sany Nómina', 150, 'cash', 'Nómina', '2025-01-29 17:49:29', NULL),
(220, 'Jaqueline Nómina', 150, 'cash', 'Nómina', '2025-01-31 17:07:23', NULL),
(221, 'Sandra limpieza', 1000, 'cash', 'Otro', '2025-01-31 17:07:38', NULL),
(222, 'Profe Carmen Nómina', 500, 'cash', 'Nómina', '2025-01-31 17:08:00', NULL),
(223, 'Odette Nómina', 1600, 'cash', 'Nómina', '2025-01-31 17:08:21', NULL),
(224, 'Convivio Duritos/etc', 338, 'cash', 'Otro', '2025-01-31 17:08:53', NULL),
(225, 'Suhey Nómina', 250, 'cash', 'Nómina', '2025-02-04 19:49:08', NULL),
(226, 'Sany Nómina', 150, 'cash', 'Nómina', '2025-02-04 19:49:44', NULL),
(227, 'Jesse Nómina', 300, 'cash', 'Nómina', '2025-02-05 18:19:05', NULL),
(228, 'Julieta Nómina', 500, 'cash', 'Nómina', '2025-02-05 18:21:58', NULL),
(229, 'Odette Nómina', 1600, 'cash', 'Nómina', '2025-02-07 18:13:29', NULL),
(230, 'Sandra limpieza', 1000, 'cash', 'Otro', '2025-02-08 09:59:17', NULL),
(231, 'Profe Carmen Nómina', 500, 'cash', 'Nómina', '2025-02-08 09:59:33', NULL),
(232, 'COMAPA', 274, 'cash', 'COMAPA', '2025-02-10 17:33:49', NULL),
(233, 'Playeras Pedido 1 jazz', 2160, 'cash', 'Ropa', '2025-02-10 18:54:42', NULL),
(234, 'Nómina Romina sem pasada 08-02-25', 500, 'cash', 'Nómina', '2025-02-14 18:40:07', NULL),
(235, 'Suhey Nómina 11-02-25', 250, 'cash', 'Nómina', '2025-02-14 18:40:46', NULL),
(236, 'Sany Nómina 11-02-25', 150, 'cash', 'Nómina', '2025-02-14 18:41:10', NULL),
(237, 'Jesse Nómina 12-02-25', 300, 'cash', 'Nómina', '2025-02-14 18:41:51', NULL),
(238, 'Jaqueline Nómina', 150, 'cash', 'Nómina', '2025-02-14 18:42:33', NULL),
(239, 'Profe Carmen Nómina', 500, 'cash', 'Nómina', '2025-02-14 18:42:50', NULL),
(240, 'Convivio San Valentin:\r\n- Galletas: $400\r\n- Globos: $450\r\n- Papas y refrescos: $250\r\n- Decoración: $400\r\n- \r\n', 1500, 'cash', 'Otro', '2025-02-14 18:46:49', NULL),
(241, 'Odette Nómina', 1500, 'cash', 'Nómina', '2025-02-14 18:47:08', NULL),
(242, 'pago a Pablo', 2000, 'cash', 'Otro', '2025-02-15 10:20:24', NULL),
(243, 'Suhey Nómina', 250, 'cash', 'Nómina', '2025-02-19 18:19:24', NULL),
(244, 'Jesse Nómina', 150, 'cash', 'Nómina', '2025-02-19 18:25:02', NULL),
(245, 'Julieta Nómina', 500, 'cash', 'Nómina', '2025-02-19 18:30:17', NULL),
(246, 'Odette Nómina', 1600, 'cash', 'Nómina', '2025-02-19 20:37:14', NULL),
(247, 'Sany NóminA', 150, 'cash', 'Nómina', '2025-02-20 17:32:13', NULL),
(248, 'Aseo externo', 300, 'cash', 'Otro', '2025-02-20 17:33:10', NULL),
(249, 'Jaqueline Nómina', 150, 'cash', 'Nómina', '2025-02-20 17:33:28', NULL),
(250, 'Profe Carmen Nómina', 500, 'cash', 'Nómina', '2025-02-21 20:58:52', NULL),
(251, '4 Leotardos bordados', 1100, 'cash', 'Otro', '2025-02-21 21:00:07', NULL),
(252, 'Romina Nómina', 500, 'cash', 'Nómina', '2025-02-22 10:10:07', NULL),
(253, 'playeras Arantza', 1430, 'cash', 'Otro', '2025-02-24 20:12:48', NULL),
(254, 'Nómina Suhey', 250, 'cash', 'Nómina', '2025-02-26 20:49:23', NULL),
(255, 'Nómina Sany', 150, 'cash', 'Nómina', '2025-02-26 20:49:53', NULL),
(256, 'Nómina Jesse', 300, 'cash', 'Nómina', '2025-02-26 20:50:03', NULL),
(257, 'Jaqueline Nómina', 150, 'cash', 'Nómina', '2025-02-28 18:14:10', NULL),
(258, 'Nómina Pablo', 2000, 'cash', 'Nómina', '2025-02-28 18:14:24', NULL),
(259, 'Aseo Sandra limpieza Nómina', 1000, 'cash', 'Nómina', '2025-02-28 18:14:44', NULL),
(260, 'Nómina Profe Carmen', 500, 'cash', 'Nómina', '2025-02-28 18:15:02', NULL),
(261, 'Nómina Odette', 1600, 'transfer', 'Nómina', '2025-03-01 11:51:15', NULL),
(262, 'Productos de limpieza', 500, 'cash', 'Otro', '2025-03-05 18:11:51', NULL),
(263, 'COMAPA casa willy', 522, 'cash', 'COMAPA', '2025-03-05 18:12:08', NULL),
(264, 'Nómina Suhey ', 250, 'cash', 'Nómina', '2025-03-06 18:12:10', NULL),
(265, 'Nómina Sany', 150, 'cash', 'Nómina', '2025-03-06 18:12:20', NULL),
(266, 'Nómina Jesse', 300, 'cash', 'Nómina', '2025-03-06 18:12:39', NULL),
(267, 'Nómina Julieta', 500, 'cash', 'Nómina', '2025-03-06 18:12:55', NULL),
(268, 'Nómina Jaqueline', 150, 'cash', 'Nómina', '2025-03-06 18:13:08', NULL),
(269, 'Nómina Romina', 500, 'cash', 'Nómina', '2025-03-06 18:14:13', NULL),
(270, 'Nómina profe Carmen', 500, 'cash', 'Nómina', '2025-03-06 18:19:55', NULL),
(271, 'Nómina Romina', 500, 'cash', 'Nómina', '2025-03-08 11:44:54', NULL),
(272, 'Nómina Odette', 1600, 'cash', 'Nómina', '2025-03-08 11:45:05', NULL),
(273, 'Publicidad jesucristo', 320, 'cash', 'Otro', '2025-03-08 11:46:02', NULL),
(274, 'COMAPA Ballerina', 274, 'cash', 'COMAPA', '2025-03-11 16:40:05', NULL),
(275, 'Jesse Nómina (1 día)', 150, 'cash', 'Nómina', '2025-03-12 17:23:23', NULL),
(276, 'Suhey Nómina', 250, 'cash', 'Nómina', '2025-03-12 17:23:34', NULL),
(277, 'Sany Nómina', 150, 'cash', 'Nómina', '2025-03-12 17:23:49', NULL),
(278, 'Nómina profe Carmen 14-03-25', 500, 'cash', 'Nómina', '2025-03-20 16:20:45', NULL),
(279, 'Nómina Odette 15-03-25', 1600, 'cash', 'Nómina', '2025-03-20 16:21:31', NULL),
(280, 'Limpieza sem pasada 14-03-2025', 1000, 'cash', 'Otro', '2025-03-20 16:21:59', NULL),
(281, 'Jesse Nómina 1 día', 150, 'cash', 'Nómina', '2025-03-20 16:22:18', NULL),
(282, 'Suhey Nómina 18-03-2025', 250, 'cash', 'Nómina', '2025-03-20 16:23:26', NULL),
(283, 'Sany Nómina', 150, 'cash', 'Nómina', '2025-03-20 16:25:25', NULL),
(284, 'Julieta nómina', 500, 'cash', 'Nómina', '2025-03-20 16:34:07', NULL),
(285, 'Limpieza', 1000, 'cash', 'Otro', '2025-03-20 17:25:07', NULL),
(286, 'PLAYERAS MIKE', 3238, 'transfer', 'Ropa', '2025-03-20 17:27:11', NULL),
(287, 'Odette nómina', 1600, 'cash', 'Nómina', '2025-03-22 08:54:04', NULL),
(288, 'profe carmen 21-03-25', 500, 'cash', 'Otro', '2025-03-24 18:15:23', NULL),
(289, 'Romina 22-03-25', 500, 'card', 'Otro', '2025-03-24 18:15:58', NULL),
(290, 'PLAYERAS PAGADAS', 1280, 'cash', 'Ropa', '2025-03-24 18:17:43', NULL),
(291, 'LYPRO', 147, 'cash', 'LYPRO', '2025-03-24 18:18:24', NULL),
(292, 'Suhey', 250, 'cash', 'Otro', '2025-03-31 17:52:16', NULL),
(293, 'Sany última nómina', 150, 'cash', 'Nómina', '2025-03-31 17:52:33', NULL),
(294, 'Jesse Nómina', 300, 'cash', 'Nómina', '2025-03-31 17:52:49', NULL),
(295, 'Odette nómina último mes 4 días', 1066, 'cash', 'Nómina', '2025-03-31 17:54:35', NULL),
(296, 'nómina suhey', 250, 'cash', 'Nómina', '2025-04-02 17:09:58', NULL),
(297, 'Sany nómina', 150, 'cash', 'Nómina', '2025-04-02 17:10:22', NULL),
(298, 'Jesse nómina', 150, 'cash', 'Nómina', '2025-04-02 17:10:43', NULL),
(299, 'Julieta nómina', 500, 'cash', 'Nómina', '2025-04-02 17:12:06', NULL),
(300, 'Jaqui última nómina antes vacaciones', 150, 'cash', 'Nómina', '2025-04-08 18:39:54', NULL),
(301, 'Suhey nómina ', 250, 'cash', 'Nómina', '2025-04-08 18:40:16', NULL),
(302, 'Sany nómina', 150, 'cash', 'Nómina', '2025-04-08 18:40:26', NULL),
(303, 'Jesse nómina', 300, 'cash', 'Nómina', '2025-04-08 18:40:39', NULL),
(304, 'agua comapa', 288, 'cash', 'COMAPA', '2025-04-08 18:41:29', NULL),
(305, 'Odette nómina', 1600, 'cash', 'Nómina', '2025-04-08 18:41:53', NULL),
(306, 'Jaqueline nómina', 150, 'cash', 'Nómina', '2025-04-10 17:44:24', NULL),
(307, 'limpieza nómina', 1000, 'cash', 'Nómina', '2025-04-10 17:45:02', NULL),
(308, 'gastos limpieza', 487, 'cash', 'Otro', '2025-04-10 17:46:01', NULL),
(309, 'HEB aromatizante', 68, 'cash', 'Otro', '2025-04-10 17:46:34', NULL),
(310, 'City Club amenidades Masterclass Lola & Laura Cortez', 600, 'cash', 'Otro', '2025-04-10 17:47:32', NULL),
(311, 'nómina Jesse', 300, 'cash', 'Nómina', '2025-04-30 17:55:58', NULL),
(313, 'Gasto de ejemplo 1', 4000, 'cash', 'Nómina', '2025-06-16 17:16:00', '2025-06-16 17:18:33'),
(314, 'Gasto de ejemplo 2', 550, 'card', 'Comida', '2025-06-16 17:17:00', '2025-06-16 17:17:23'),
(315, 'Gasto de ejemplo 3', 1080, 'cash', 'CFE', '2025-06-16 17:17:00', '2025-06-16 17:17:44'),
(316, 'Gasto de ejemplo 4', 320, 'cash', 'COMAPA', '2025-06-16 17:17:00', '2025-06-16 17:18:06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `installments`
--

CREATE TABLE `installments` (
  `id` int(11) NOT NULL,
  `saleId` int(11) DEFAULT NULL,
  `amountPaid` decimal(10,2) DEFAULT NULL,
  `paymentMethod` enum('cash','card','transfer','deposit') DEFAULT NULL,
  `datePaid` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `installments`
--

INSERT INTO `installments` (`id`, `saleId`, `amountPaid`, `paymentMethod`, `datePaid`) VALUES
(409, 402, 600.00, 'cash', '2024-04-02 15:47:13'),
(410, 403, 1400.00, 'cash', '2024-04-02 15:47:56'),
(411, 404, 800.00, 'cash', '2024-04-02 15:58:48'),
(412, 405, 600.00, 'cash', '2024-04-02 15:59:05'),
(413, 406, 800.00, 'cash', '2024-04-03 16:54:38'),
(414, 407, 800.00, 'cash', '2024-04-05 14:59:46'),
(415, 408, 700.00, 'cash', '2024-04-05 15:02:29'),
(416, 409, 800.00, 'cash', '2024-04-05 15:02:50'),
(417, 410, 800.00, 'cash', '2024-04-05 16:05:50'),
(418, 411, 600.00, 'cash', '2024-04-08 14:55:17'),
(419, 412, 600.00, 'cash', '2024-04-08 14:56:38'),
(422, 415, 800.00, 'cash', '2024-04-15 15:02:27'),
(423, 416, 800.00, 'cash', '2024-04-15 15:03:26'),
(424, 417, 1400.00, 'cash', '2024-04-15 15:03:39'),
(425, 418, 600.00, 'cash', '2024-04-15 15:04:13'),
(426, 419, 800.00, 'cash', '2024-04-17 17:21:17'),
(427, 420, 700.00, 'cash', '2024-04-18 14:37:54'),
(428, 421, 600.00, 'cash', '2024-04-22 15:16:27'),
(429, 422, 800.00, 'cash', '2024-05-02 15:21:22'),
(430, 423, 600.00, 'cash', '2024-09-02 16:56:59'),
(432, 425, 600.00, 'cash', '2024-09-02 18:13:52'),
(433, 426, 600.00, 'cash', '2024-09-03 18:35:14'),
(434, 427, 600.00, 'cash', '2024-09-07 09:13:07'),
(436, 429, 600.00, 'cash', '2024-09-09 16:31:42'),
(437, 430, 600.00, 'cash', '2024-09-09 18:33:27'),
(438, 431, 600.00, 'cash', '2024-09-10 17:33:59'),
(439, 432, 300.00, 'cash', '2024-09-10 18:44:42'),
(440, 433, 1000.00, 'cash', '2024-09-11 18:01:46'),
(441, 434, 600.00, 'cash', '2024-09-11 18:02:26'),
(442, 435, 600.00, 'cash', '2024-09-18 15:45:17'),
(443, 436, 600.00, 'cash', '2024-09-18 17:02:15'),
(444, 437, 250.00, 'cash', '2024-09-23 15:06:27'),
(445, 438, 250.00, 'cash', '2024-09-27 19:36:59'),
(446, 439, 600.00, 'cash', '2024-09-28 09:21:53'),
(448, 441, 600.00, 'cash', '2024-10-02 16:44:50'),
(449, 442, 600.00, 'cash', '2024-10-02 17:07:52'),
(450, 443, 600.00, 'cash', '2024-10-05 09:11:57'),
(451, 444, 600.00, 'cash', '2024-10-05 09:20:00'),
(452, 445, 300.00, 'cash', '2024-10-05 09:32:51'),
(453, 446, 600.00, 'cash', '2024-10-05 09:36:08'),
(455, 448, 600.00, 'cash', '2024-10-07 20:09:11'),
(457, 450, 600.00, 'cash', '2024-10-10 18:00:27'),
(458, 451, 600.00, 'cash', '2024-10-11 17:27:41'),
(459, 452, 600.00, 'cash', '2024-10-12 09:18:15'),
(460, 453, 300.00, 'cash', '2024-10-15 15:54:00'),
(461, 454, 600.00, 'cash', '2024-10-16 21:39:52'),
(463, 456, 600.00, 'cash', '2024-11-04 17:32:36'),
(464, 457, 600.00, 'cash', '2024-11-04 17:34:53'),
(465, 458, 600.00, 'cash', '2024-11-04 19:39:43'),
(466, 459, 600.00, 'cash', '2024-11-06 17:55:46'),
(467, 460, 600.00, 'cash', '2024-11-06 19:35:12'),
(468, 461, 600.00, 'cash', '2024-11-09 11:05:24'),
(469, 462, 1000.00, 'cash', '2024-11-09 11:17:39'),
(470, 463, 600.00, 'cash', '2024-11-09 12:36:55'),
(471, 464, 600.00, 'cash', '2024-11-09 12:39:22'),
(472, 465, 600.00, 'cash', '2024-11-09 12:59:52'),
(473, 466, 600.00, 'cash', '2024-11-09 13:12:49'),
(474, 467, 600.00, 'cash', '2024-11-13 18:22:25'),
(475, 468, 600.00, 'cash', '2024-11-13 19:27:25'),
(477, 470, 300.00, 'cash', '2024-12-03 00:00:55'),
(478, 471, 600.00, 'cash', '2024-12-03 00:10:47'),
(479, 472, 600.00, 'cash', '2024-12-03 00:12:02'),
(483, 476, 1400.00, 'cash', '2024-12-03 17:32:52'),
(486, 479, 250.00, 'cash', '2024-12-03 17:44:20'),
(488, 481, 600.00, 'cash', '2024-12-03 17:58:23'),
(489, 482, 1200.00, 'cash', '2024-12-03 18:20:32'),
(491, 484, 600.00, 'cash', '2024-12-04 18:43:40'),
(492, 485, 600.00, 'cash', '2024-12-04 18:56:40'),
(493, 486, 600.00, 'cash', '2024-12-04 19:26:47'),
(494, 487, 600.00, 'cash', '2024-12-04 19:59:46'),
(495, 488, 600.00, 'cash', '2024-12-04 20:03:28'),
(496, 489, 600.00, 'cash', '2024-12-04 20:06:19'),
(497, 490, 600.00, 'cash', '2024-12-05 18:38:34'),
(498, 491, 600.00, 'cash', '2024-12-05 18:39:11'),
(499, 492, 600.00, 'cash', '2024-12-05 19:06:24'),
(500, 493, 600.00, 'cash', '2024-12-05 19:41:57'),
(501, 494, 600.00, 'cash', '2024-12-09 20:05:22'),
(505, 498, 600.00, 'cash', '2025-01-13 18:00:00'),
(506, 499, 600.00, '', '2025-01-23 09:48:00'),
(508, 501, 400.00, 'cash', '2025-01-25 12:11:00'),
(509, 502, 600.00, '', '2025-01-27 17:01:00'),
(510, 503, 600.00, 'transfer', '2025-01-30 17:04:00'),
(511, 504, 1000.00, 'cash', '2025-01-31 19:04:00'),
(512, 505, 600.00, 'card', '2025-01-31 19:15:00'),
(515, 508, 600.00, 'cash', '2025-01-31 19:44:00'),
(517, 510, 600.00, 'cash', '2025-02-11 19:24:00'),
(518, 511, 600.00, 'cash', '2025-02-04 19:21:00'),
(523, 516, 600.00, 'cash', '2025-02-01 17:01:00'),
(524, 517, 600.00, 'cash', '2025-02-17 17:14:00'),
(525, 518, 600.00, 'card', '2025-03-20 11:00:00'),
(526, 519, 600.00, 'cash', '2025-03-19 18:59:00'),
(528, 521, 1200.00, 'card', '2025-05-07 02:00:00'),
(529, 522, 600.00, 'cash', '2025-05-02 14:25:00'),
(531, 524, 600.00, 'cash', '2025-06-03 15:00:00'),
(533, 526, 7580.00, 'cash', '2025-06-17 15:58:00'),
(534, 527, 450.00, 'cash', '2025-06-17 16:23:00'),
(535, 527, 150.00, 'card', '2025-06-17 16:23:00'),
(536, 527, 200.00, 'transfer', '2025-06-17 16:23:00'),
(537, 528, 400.00, 'cash', '2025-06-17 17:49:00'),
(538, 528, 200.00, 'card', '2025-06-17 18:03:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `monthly_fees`
--

CREATE TABLE `monthly_fees` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `month` varchar(10) NOT NULL,
  `year` varchar(10) NOT NULL,
  `cost` float NOT NULL,
  `status` varchar(10) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `monthly_fees`
--

INSERT INTO `monthly_fees` (`id`, `name`, `month`, `year`, `cost`, `status`, `createdAt`, `updatedAt`) VALUES
(56, 'LUNES A VIERNES ', 'Abril', '2024', 800, 'inactive', '2024-03-25 17:52:57', NULL),
(57, 'SABATINO', 'Abril', '2024', 600, 'inactive', '2024-03-25 17:53:12', NULL),
(58, 'HERMANOS LUNES A VIERNES ', 'Abril', '2024', 1400, 'inactive', '2024-03-25 17:53:30', NULL),
(59, 'HERMANOS SABATINO', 'Abril', '2024', 1200, 'inactive', '2024-03-25 17:53:42', NULL),
(60, 'MENSUALIDAD MAYO L-V', 'Mayo', '2024', 800, 'inactive', '2024-04-25 15:52:50', NULL),
(61, 'MENSUALIDAD MAYO SAB', 'Mayo', '2024', 600, 'inactive', '2024-04-25 15:53:10', NULL),
(62, 'MENSUALIDAD HERMANOS MAY L-V', 'Mayo', '2024', 1400, 'inactive', '2024-04-25 15:53:28', NULL),
(63, 'HERMANOS SAB MAY', 'Mayo', '2024', 1200, 'inactive', '2024-04-25 15:53:45', NULL),
(66, 'LUNES - JUEVES', 'Septiembre', '2024', 800, 'inactive', '2024-09-01 18:33:54', NULL),
(67, '1 Disciplina / Clase', 'Septiembre', '2024', 600, 'inactive', '2024-09-01 18:34:50', NULL),
(68, 'HERMANOS / TODAS LAS DISCIPLINAS', 'Septiembre', '2024', 1400, 'inactive', '2024-09-01 18:39:04', NULL),
(69, 'HERMANOS L-J', 'Septiembre', '2024', 1400, 'inactive', '2024-09-03 16:12:36', NULL),
(70, 'HERMANOS 1 DISCIPLINA', 'Septiembre', '2024', 1000, 'inactive', '2024-09-03 16:13:06', NULL),
(71, '1 disciplina', 'Octubre', '2024', 600, 'inactive', '2024-09-30 17:07:33', NULL),
(72, 'LUNES - JUEVES', 'Octubre', '2024', 800, 'inactive', '2024-09-30 17:08:52', NULL),
(73, 'HERMANOS L-J ', 'Octubre', '2024', 1400, 'inactive', '2024-10-02 17:00:05', NULL),
(77, 'HERMANOS 1 disciplina  SAB', 'Octubre', '2024', 1000, 'inactive', '2024-10-05 10:15:18', NULL),
(78, 'Lunes - Jueves', 'Noviembre', '2024', 800, 'inactive', '2024-10-30 16:15:50', NULL),
(79, '1 disciplina', 'Noviembre', '2024', 600, 'inactive', '2024-10-30 16:16:19', NULL),
(80, 'HERMANOS L-J', 'Noviembre', '2024', 1400, 'inactive', '2024-10-30 16:16:45', NULL),
(81, 'HERMANOS 1 disciplina', 'Noviembre', '2024', 1000, 'inactive', '2024-10-30 16:17:05', NULL),
(82, '1 disciplina / ', 'Diciembre', '2024', 600, 'inactive', '2024-12-03 16:57:05', NULL),
(83, 'HERMANOS / 1 disciplina', 'Diciembre', '2024', 1200, 'inactive', '2024-12-03 18:20:00', NULL),
(84, 'HERMANOS / L - J', 'Diciembre', '2024', 1400, 'inactive', '2024-12-03 19:19:52', NULL),
(85, 'L - J ', 'Diciembre', '2024', 800, 'inactive', '2024-12-04 17:00:06', NULL),
(86, 'Lun - Vie', 'Enero', '2025', 800, 'inactive', '2025-01-08 16:22:45', NULL),
(87, '1 disciplina', 'Enero', '2025', 600, 'active', '2025-01-08 16:30:17', NULL),
(88, 'HERMANXS L-V', 'Enero', '2025', 1400, 'active', '2025-01-08 20:10:29', NULL),
(89, 'HERMANXS 1 DISCIPLINA', 'Enero', '2025', 1000, 'active', '2025-01-08 20:10:52', NULL),
(90, '1 disciplina / BECA OXFORD.', 'Enero', '2025', 400, 'active', '2025-01-18 10:19:59', NULL),
(91, '+2 disciplinas / BECA OXFORD.', 'Enero', '2025', 600, 'active', '2025-01-18 10:20:27', NULL),
(92, 'HERMANXS +1 DISCIPLINA :)', 'Febrero', '2025', 1400, 'active', '2025-01-24 18:17:43', NULL),
(93, '+2 disciplinas / BECA OXFORD.', 'Febrero', '2025', 600, 'active', '2025-01-31 19:41:28', NULL),
(94, '1 disciplina / BECA OXFORD.', 'Febrero', '2025', 400, 'active', '2025-01-31 19:41:48', NULL),
(95, 'HERMANXS 1 DISCIPLINA', 'Febrero', '2025', 1000, 'active', '2025-01-31 19:42:06', NULL),
(96, 'HERMANXS L-V', 'Febrero', '2025', 1400, 'active', '2025-01-31 19:42:25', NULL),
(97, '1 disciplina', 'Febrero', '2025', 600, 'active', '2025-01-31 19:42:47', NULL),
(98, 'Lun - Vie', 'Febrero', '2025', 800, 'active', '2025-01-31 19:43:04', NULL),
(99, 'HERMANXS 2+ DISCIPLINAS / BECA OXFORD.', 'Enero', '2025', 1200, 'active', '2025-02-20 19:25:54', NULL),
(100, 'HERMANXS 2+ DISCIPLINAS / BECA OXFORD', 'Febrero', '2025', 1200, 'active', '2025-02-21 13:37:07', NULL),
(101, 'HERMANXS 2+ DISCIPLINAS / BECA OXFORD.', 'Marzo', '2025', 1200, 'active', '2025-03-03 13:14:22', NULL),
(102, 'HERMANXS L-V ', 'Marzo', '2025', 1400, 'active', '2025-03-03 13:14:56', NULL),
(103, 'HERMANXS L-V (dividida)', 'Marzo', '2025', 700, 'active', '2025-03-03 13:15:12', NULL),
(104, '+2 disciplinas / BECA OXFORD.', 'Marzo', '2025', 600, 'active', '2025-03-07 17:55:06', NULL),
(105, '1 disciplina / BECA OXFORD.', 'Marzo', '2025', 400, 'active', '2025-03-07 18:07:40', NULL),
(106, '1 disciplina', 'Marzo', '2025', 600, 'active', '2025-03-07 18:13:55', NULL),
(107, 'L-V', 'Marzo', '2025', 800, 'active', '2025-03-07 18:14:10', NULL),
(108, 'HERMANXS 1 DISCIPLINA', 'Marzo', '2025', 1000, 'active', '2025-03-07 18:15:17', NULL),
(109, 'HERMANXS 2+ DISCIPLINAS', 'Marzo', '2025', 1400, 'active', '2025-03-07 18:15:40', NULL),
(110, '1 disciplina', 'Abril', '2025', 600, 'active', '2025-04-07 18:46:04', NULL),
(111, '1 disciplina / BECA OXFORD.', 'Abril', '2025', 400, 'active', '2025-04-07 19:36:08', NULL),
(112, 'HERMANXS L-V', 'Abril', '2025', 1400, 'active', '2025-04-07 19:36:31', NULL),
(113, 'L-V', 'Abril', '2024', 800, 'inactive', '2025-04-07 19:37:09', NULL),
(114, '+2 disciplinas / BECA OXFORD.', 'Abril', '2025', 600, 'active', '2025-05-01 16:02:50', NULL),
(115, 'Lun - Vie', 'Abril', '2025', 800, 'active', '2025-05-02 17:22:55', NULL),
(116, 'HERMANXS 2+ DISCIPLINAS / BECA OXFORD', 'Abril', '2025', 1200, 'active', '2025-05-02 19:45:25', NULL),
(117, 'HERMANXS +1 DISCIPLINA', 'Abril', '2025', 1200, 'active', '2025-05-05 16:07:54', NULL),
(118, 'Lun - Vie', 'Enero', '2025', 800, 'active', '2025-05-05 18:33:26', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `price` float NOT NULL,
  `stock` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `stock`, `createdAt`, `updatedAt`) VALUES
(2, 'Leotardo Clásico Negro', 'Leotardo elástico de algodón ideal para clases de ballet.', 350, 0, '2025-05-22 10:00:00', NULL),
(3, 'Mallas Rosas para Ballet', 'Mallas suaves y resistentes, talla única para niñas.', 180, 25, '2025-05-22 10:01:00', NULL),
(4, 'Falda de Tul Blanca', 'Falda ligera de tul, ideal para presentaciones de ballet.', 220, 10, '2025-05-22 10:02:00', NULL),
(5, 'Zapatillas de Punta', 'Zapatillas profesionales para ballet clásico.', 520, 8, '2025-05-22 10:03:00', NULL),
(6, 'Botella de Agua Reutilizable', 'Botella de plástico BPA Free con logo de la academia.', 90, 25, '2025-05-22 10:04:00', NULL),
(7, 'Cinta para el Cabello', 'Cinta elástica con diseño elegante para recoger el cabello.', 35, 50, '2025-05-22 10:05:00', NULL),
(8, 'Sudadera con Logo', 'Sudadera ligera con el logo bordado de la academia.', 450, 12, '2025-05-22 10:06:00', NULL),
(9, 'Leggings Deportivos', 'Leggings cómodos y flexibles para danza moderna.', 300, 20, '2025-05-22 10:07:00', NULL),
(10, 'Top Deportivo Rosa', 'Top de tirantes cruzados, ideal para clases de jazz.', 250, 18, '2025-05-22 10:08:00', NULL),
(11, 'Rodilleras Negras', 'Rodilleras acolchadas para proteger durante prácticas intensas.', 110, 25, '2025-05-22 10:09:00', NULL),
(12, 'Toalla de Mano', 'Toalla absorbente personalizada con logo.', 60, 40, '2025-05-22 10:10:00', NULL),
(13, 'Banda de Resistencia', 'Ideal para ejercicios de estiramiento y fuerza.', 95, 0, '2025-05-22 10:11:00', NULL),
(14, 'Maleta de Danza', 'Bolsa espaciosa para llevar todo el equipo de danza.', 520, 5, '2025-05-22 10:12:00', NULL),
(15, 'Desinfectante de Manos', 'Gel antibacterial en presentación de 250 ml.', 40, 45, '2025-05-22 10:13:00', NULL),
(16, 'Playera Básica Blanca', 'Playera de algodón con el logo de la academia.', 150, 22, '2025-05-22 10:14:00', NULL),
(17, 'Zapatillas de Jazz', 'Calzado flexible para danza contemporánea y jazz.', 400, 8, '2025-05-22 10:15:00', NULL),
(18, 'Botines de Danza Moderna', 'Calzado acolchonado para prácticas intensas.', 390, 4, '2025-05-22 10:16:00', NULL),
(19, 'Scrunchies de Tela', 'Paquete de 3 scrunchies color pastel.', 55, 30, '2025-05-22 10:17:00', NULL),
(20, 'Protector de Pies', 'Protege la planta del pie en danza contemporánea.', 130, 16, '2025-05-22 10:18:00', NULL),
(21, 'Pulsera con Logo', 'Pulsera de silicón con el logo de la academia.', 25, 58, '2025-05-22 10:19:00', NULL),
(22, 'Gel Refrescante Muscular', 'Alivia músculos cansados después de clase.', 75, 13, '2025-05-22 10:20:00', NULL),
(23, 'Maquillaje de Escenario', 'Set básico de maquillaje para presentaciones.', 300, 8, '2025-05-22 10:21:00', NULL),
(24, 'Cinta Kinesiológica', 'Cinta para soporte muscular, ideal para prevención.', 120, 11, '2025-05-22 10:22:00', NULL),
(25, 'Camiseta Oversize', 'Camiseta de moda para uso casual o ensayos.', 180, 11, '2025-05-22 10:23:00', NULL),
(26, 'Accesorios para Peinado', 'Kit con peines, pasadores y ligas.', 85, 0, '2025-05-22 10:24:00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sales`
--

CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `studentId` int(11) DEFAULT NULL,
  `monthlyFeeId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `concept` varchar(255) DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `totalAmount` decimal(10,2) DEFAULT NULL,
  `totalPaid` decimal(10,2) NOT NULL,
  `remainingBalance` decimal(10,2) DEFAULT NULL,
  `status` enum('pending','paid','cancelled') DEFAULT NULL,
  `createdAt` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sales`
--

INSERT INTO `sales` (`id`, `studentId`, `monthlyFeeId`, `productId`, `concept`, `quantity`, `totalAmount`, `totalPaid`, `remainingBalance`, `status`, `createdAt`) VALUES
(402, 80, 56, NULL, 'Alba Patricia Torruco Cuevas, Mensualidad: LUNES A VIERNES , Abril 2024', 1, 600.00, 600.00, 200.00, 'pending', '2024-04-02 15:47:13'),
(403, 79, 58, NULL, 'Valentina Arias Garcia, Mensualidad: HERMANOS LUNES A VIERNES , Abril 2024', 1, 1400.00, 1400.00, 0.00, 'paid', '2024-04-02 15:47:56'),
(404, 61, 56, NULL, 'Sofía Vanessa Velázquez Guillén, Mensualidad: LUNES A VIERNES , Abril 2024', 1, 800.00, 800.00, 0.00, 'paid', '2024-04-02 15:58:48'),
(405, 63, 56, NULL, 'Vianey Bautista Martínez, Mensualidad: LUNES A VIERNES , Abril 2024', 1, 600.00, 600.00, 200.00, 'pending', '2024-04-02 15:59:05'),
(406, 84, 56, NULL, 'Cristina Rodriguez Mendoza, Mensualidad: LUNES A VIERNES , Abril 2024', 1, 800.00, 800.00, 0.00, 'paid', '2024-04-03 16:54:38'),
(407, 49, 56, NULL, 'Paola Golpe Malaga, Mensualidad: LUNES A VIERNES , Abril 2024', 1, 800.00, 800.00, 0.00, 'paid', '2024-04-05 14:59:46'),
(408, 110, 56, NULL, 'Angelina Michelle Antunez Sandoval, Mensualidad: LUNES A VIERNES , Abril 2024', 1, 700.00, 700.00, 100.00, 'pending', '2024-04-05 15:02:29'),
(409, 21, 56, NULL, 'Andrea Sofia Sanchez Zavala, Mensualidad: LUNES A VIERNES , Abril 2024', 1, 800.00, 800.00, 0.00, 'paid', '2024-04-05 15:02:50'),
(410, 31, 56, NULL, 'Isabella Avendaño Gallardo, Mensualidad: LUNES A VIERNES , Abril 2024', 1, 800.00, 800.00, 0.00, 'paid', '2024-04-05 16:05:50'),
(411, 52, 57, NULL, 'Regina Coelí Rodríguez Castellano, Mensualidad: SABATINO, Abril 2024', 1, 600.00, 600.00, 0.00, 'paid', '2024-04-08 14:55:17'),
(412, 19, 57, NULL, 'Andrea Melissa De Leon Martinez, Mensualidad: SABATINO, Abril 2024', 1, 600.00, 600.00, 0.00, 'paid', '2024-04-08 14:56:38'),
(415, 50, 56, NULL, 'Paulina Salgado Pedraza, Mensualidad: LUNES A VIERNES , Abril 2024', 1, 800.00, 800.00, 0.00, 'paid', '2024-04-15 15:02:27'),
(416, 65, 56, NULL, 'Victoria Isabel García Constantino, Mensualidad: LUNES A VIERNES , Abril 2024', 1, 800.00, 800.00, 0.00, 'paid', '2024-04-15 15:03:26'),
(417, 33, 58, NULL, 'Jabnia Olivares Quiñones, Mensualidad: HERMANOS LUNES A VIERNES , Abril 2024', 1, 1400.00, 1400.00, 0.00, 'paid', '2024-04-15 15:03:39'),
(418, 62, 57, NULL, 'Thamara Segoviano Monforte, Mensualidad: SABATINO, Abril 2024', 1, 600.00, 600.00, 0.00, 'paid', '2024-04-15 15:04:13'),
(419, 113, 56, NULL, 'Dulce Mareli Arguelles Vera, Mensualidad: LUNES A VIERNES , Abril 2024', 1, 800.00, 800.00, 0.00, 'paid', '2024-04-17 17:21:17'),
(420, 116, 56, NULL, 'Maria Fernanda Hernandez Roman, Mensualidad: LUNES A VIERNES , Abril 2024', 1, 700.00, 700.00, 100.00, 'pending', '2024-04-18 14:37:54'),
(421, 37, 57, NULL, 'Kamilha Zoé Hernández Zamora, Mensualidad: SABATINO, Abril 2024', 1, 600.00, 600.00, 0.00, 'paid', '2024-04-22 15:16:27'),
(422, 32, 56, NULL, 'Ivanna Astrid Navarro Torres, Mensualidad: LUNES A VIERNES , Abril 2024', 1, 800.00, 800.00, 0.00, 'paid', '2024-05-02 15:21:22'),
(423, 140, 67, NULL, 'Andrea González Snell, Mensualidad: 1 Disciplina / Clase, Septiembre 2024', 1, 600.00, 600.00, 0.00, 'paid', '2024-09-02 16:56:59'),
(425, 90, 67, NULL, 'Ileana Treviño Gonzalez, Mensualidad: 1 Disciplina / Clase, Septiembre 2024', 1, 600.00, 600.00, 0.00, 'paid', '2024-09-02 18:13:52'),
(426, 63, 67, NULL, 'Vianey Bautista Martínez, Mensualidad: 1 Disciplina / Clase, Septiembre 2024', 1, 600.00, 600.00, 0.00, 'paid', '2024-09-03 18:35:14'),
(427, 19, 67, NULL, 'Andrea Melissa De Leon Martinez, Mensualidad: 1 Disciplina / Clase, Septiembre 2024', 1, 600.00, 600.00, 0.00, 'paid', '2024-09-07 09:13:07'),
(429, 156, 67, NULL, 'Barbara De León Sánchez, Mensualidad: 1 Disciplina / Clase, Septiembre 2024', 1, 600.00, 600.00, 0.00, 'paid', '2024-09-09 16:31:42'),
(430, 159, 67, NULL, 'Silvia Patricia Orta González, Mensualidad: 1 Disciplina / Clase, Septiembre 2024', 1, 600.00, 600.00, 0.00, 'paid', '2024-09-09 18:33:27'),
(431, 31, 67, NULL, 'Isabella Avendaño Gallardo, Mensualidad: 1 Disciplina / Clase, Septiembre 2024', 1, 600.00, 600.00, 0.00, 'paid', '2024-09-10 17:33:59'),
(432, 30, 67, NULL, 'Galilea Montserrat Plata Hernández, Mensualidad: 1 Disciplina / Clase, Septiembre 2024', 1, 300.00, 300.00, 300.00, 'pending', '2024-09-10 18:44:42'),
(433, 153, 70, NULL, 'Arlette Ramos Galaviz / Ariana Ramos Galaviz, Mensualidad: HERMANOS 1 DISCIPLINA, Septiembre 2024', 1, 1000.00, 1000.00, 0.00, 'paid', '2024-09-11 18:01:46'),
(434, 58, 67, NULL, 'Siomara Valentina De León Navarro, Mensualidad: 1 Disciplina / Clase, Septiembre 2024', 1, 600.00, 600.00, 0.00, 'paid', '2024-09-11 18:02:26'),
(435, 155, 67, NULL, 'Victoria Amaité Del Ángel Vázquez, Mensualidad: 1 Disciplina / Clase, Septiembre 2024', 1, 600.00, 600.00, 0.00, 'paid', '2024-09-18 15:45:17'),
(436, 37, 67, NULL, 'Kamilha Zoé Hernández Zamora, Mensualidad: 1 Disciplina / Clase, Septiembre 2024', 1, 600.00, 600.00, 0.00, 'paid', '2024-09-18 17:02:15'),
(437, 163, 70, NULL, 'Giana Ocañas, Mensualidad: HERMANOS 1 DISCIPLINA, Septiembre 2024', 1, 250.00, 250.00, 750.00, 'pending', '2024-09-23 15:06:27'),
(438, 165, 70, NULL, 'Luciana Ocañas, Mensualidad: HERMANOS 1 DISCIPLINA, Septiembre 2024', 1, 750.00, 250.00, 250.00, 'pending', '2024-09-27 19:36:59'),
(439, 62, 67, NULL, 'Thamara Segoviano Monforte, Mensualidad: 1 Disciplina / Clase, Septiembre 2024', 1, 600.00, 600.00, 0.00, 'paid', '2024-09-28 09:21:53'),
(441, 50, 67, NULL, 'Paulina Salgado Pedraza, Mensualidad: 1 Disciplina / Clase, Septiembre 2024', 1, 600.00, 600.00, 0.00, 'paid', '2024-10-02 16:44:50'),
(442, 84, 71, NULL, 'Cristina Rodriguez Mendoza, Mensualidad: 1 disciplina, Octubre 2024', 1, 600.00, 600.00, 0.00, 'paid', '2024-10-02 17:07:52'),
(443, 62, 71, NULL, 'Thamara Segoviano Monforte, Mensualidad: 1 disciplina, Octubre 2024', 1, 600.00, 600.00, 0.00, 'paid', '2024-10-05 09:11:57'),
(444, 155, 71, NULL, 'Victoria Amaité Del Ángel Vázquez, Mensualidad: 1 disciplina, Octubre 2024', 1, 600.00, 600.00, 0.00, 'paid', '2024-10-05 09:20:00'),
(445, 30, 71, NULL, 'Galilea Montserrat Plata Hernández, Mensualidad: 1 disciplina, Octubre 2024', 1, 600.00, 300.00, 0.00, 'paid', '2024-10-05 09:32:51'),
(446, 63, 71, NULL, 'Vianey Bautista Martínez, Mensualidad: 1 disciplina, Octubre 2024', 1, 600.00, 600.00, 0.00, 'paid', '2024-10-05 09:36:08'),
(448, 113, 71, NULL, 'Dulce Mareli Arguelles Vera, Mensualidad: 1 disciplina, Octubre 2024', 1, 600.00, 600.00, 0.00, 'paid', '2024-10-07 20:09:11'),
(450, 174, 71, NULL, 'Legna Mayte Del Angel Amada, Mensualidad: 1 disciplina, Octubre 2024', 1, 600.00, 600.00, 0.00, 'paid', '2024-10-10 18:00:27'),
(451, 173, 71, NULL, 'María Del Carmen Borja, Mensualidad: 1 disciplina, Octubre 2024', 1, 600.00, 600.00, 0.00, 'paid', '2024-10-11 17:27:41'),
(452, 19, 71, NULL, 'Andrea Melissa De Leon Martinez, Mensualidad: 1 disciplina, Octubre 2024', 1, 600.00, 600.00, 0.00, 'paid', '2024-10-12 09:18:15'),
(453, 31, 71, NULL, 'Isabella Avendaño Gallardo, Mensualidad: 1 disciplina, Octubre 2024', 1, 300.00, 300.00, 300.00, 'pending', '2024-10-15 15:54:00'),
(454, 158, 67, NULL, 'Sofía Herrero Galván, Mensualidad: 1 Disciplina / Clase, Septiembre 2024', 1, 600.00, 600.00, 0.00, 'paid', '2024-10-16 21:39:52'),
(456, 84, 79, NULL, 'Cristina Rodriguez Mendoza, Mensualidad: 1 disciplina, Noviembre 2024', 1, 600.00, 600.00, 0.00, 'paid', '2024-11-04 17:32:36'),
(457, 158, 79, NULL, 'Sofía Herrero Galván, Mensualidad: 1 disciplina, Noviembre 2024', 1, 600.00, 600.00, 0.00, 'paid', '2024-11-04 17:34:53'),
(458, 137, 79, NULL, 'Camila Cantú Beltrán, Mensualidad: 1 disciplina, Noviembre 2024', 1, 600.00, 600.00, 0.00, 'paid', '2024-11-04 19:39:43'),
(459, 173, 79, NULL, 'María Del Carmen Borja, Mensualidad: 1 disciplina, Noviembre 2024', 1, 600.00, 600.00, 0.00, 'paid', '2024-11-06 17:55:46'),
(460, 194, 79, NULL, 'Montserrat Morin Chávez, Mensualidad: 1 disciplina, Noviembre 2024', 1, 600.00, 600.00, 0.00, 'paid', '2024-11-06 19:35:12'),
(461, 19, 79, NULL, 'Andrea Melissa De Leon Martinez, Mensualidad: 1 disciplina, Noviembre 2024', 1, 600.00, 600.00, 0.00, 'paid', '2024-11-09 11:05:24'),
(462, 153, 81, NULL, 'Arlette Ramos Galaviz / Ariana Ramos Galaviz, Mensualidad: HERMANOS 1 disciplina, Noviembre 2024', 1, 1000.00, 1000.00, 0.00, 'paid', '2024-11-09 11:17:39'),
(463, 140, 79, NULL, 'Andrea González Snell, Mensualidad: 1 disciplina, Noviembre 2024', 1, 600.00, 600.00, 0.00, 'paid', '2024-11-09 12:36:55'),
(464, 31, 79, NULL, 'Isabella Avendaño Gallardo, Mensualidad: 1 disciplina, Noviembre 2024', 1, 600.00, 600.00, 0.00, 'paid', '2024-11-09 12:39:22'),
(465, 16, 71, NULL, 'Allison Cruz Mercado, Mensualidad: 1 disciplina, Octubre 2024', 1, 600.00, 600.00, 0.00, 'paid', '2024-11-09 12:59:52'),
(466, 22, 79, NULL, 'Camila Valeria Hernandez Navarro, Mensualidad: 1 disciplina, Noviembre 2024', 1, 600.00, 600.00, 0.00, 'paid', '2024-11-09 13:12:49'),
(467, 62, 79, NULL, 'Thamara Segoviano Monforte, Mensualidad: 1 disciplina, Noviembre 2024', 1, 600.00, 600.00, 0.00, 'paid', '2024-11-13 18:22:25'),
(468, 174, 79, NULL, 'Legna Mayte Del Angel Amada, Mensualidad: 1 disciplina, Noviembre 2024', 1, 600.00, 600.00, 0.00, 'paid', '2024-11-13 19:27:25'),
(470, 30, 79, NULL, 'Galilea Montserrat Plata Hernández, Mensualidad: 1 disciplina, Noviembre 2024', 1, 300.00, 300.00, 300.00, 'pending', '2024-12-03 00:00:55'),
(471, 140, 71, NULL, 'Andrea González Snell, Mensualidad: 1 disciplina, Octubre 2024', 1, 600.00, 600.00, 0.00, 'paid', '2024-12-03 00:10:47'),
(472, 155, 79, NULL, 'Victoria Amaité Del Ángel Vázquez, Mensualidad: 1 disciplina, Noviembre 2024', 1, 600.00, 600.00, 0.00, 'paid', '2024-12-03 00:12:02'),
(476, 80, 68, NULL, 'Alba Patricia Torruco Cuevas, Mensualidad: HERMANOS / TODAS LAS DISCIPLINAS, Septiembre 2024', 1, 1400.00, 1400.00, 0.00, 'paid', '2024-12-03 17:32:52'),
(479, 165, 71, NULL, 'Luciana Ocañas, Mensualidad: 1 disciplina, Octubre 2024', 1, 250.00, 250.00, 350.00, 'pending', '2024-12-03 17:44:20'),
(481, 137, 71, NULL, 'Camila Cantú Beltrán, Mensualidad: 1 disciplina, Octubre 2024', 1, 600.00, 600.00, 0.00, 'paid', '2024-12-03 17:58:23'),
(482, 154, 83, NULL, 'Valeria Rubi Preciado Saldaña / Zulema Mabel Preciado Saldaña., Mensualidad: HERMANOS / 1 disciplina, Diciembre 2024', 1, 1200.00, 1200.00, 0.00, 'paid', '2024-12-03 18:20:32'),
(484, 137, 82, NULL, 'Camila Cantú Beltrán, Mensualidad: 1 disciplina / , Diciembre 2024', 1, 600.00, 600.00, 0.00, 'paid', '2024-12-04 18:43:40'),
(485, 194, 82, NULL, 'Montserrat Morin Chávez, Mensualidad: 1 disciplina / , Diciembre 2024', 1, 600.00, 600.00, 0.00, 'paid', '2024-12-04 18:56:40'),
(486, 19, 82, NULL, 'Andrea Melissa De Leon Martinez, Mensualidad: 1 disciplina / , Diciembre 2024', 1, 600.00, 600.00, 0.00, 'paid', '2024-12-04 19:26:47'),
(487, 90, 82, NULL, 'Ileana Treviño Gonzalez, Mensualidad: 1 disciplina / , Diciembre 2024', 1, 600.00, 600.00, 0.00, 'paid', '2024-12-04 19:59:46'),
(488, 28, 82, NULL, 'Elisa Sisniega Mejía, Mensualidad: 1 disciplina / , Diciembre 2024', 1, 600.00, 600.00, 0.00, 'paid', '2024-12-04 20:03:28'),
(489, 174, 82, NULL, 'Legna Mayte Del Angel Amada, Mensualidad: 1 disciplina / , Diciembre 2024', 1, 600.00, 600.00, 0.00, 'paid', '2024-12-04 20:06:19'),
(490, 16, 82, NULL, 'Allison Cruz Mercado, Mensualidad: 1 disciplina / , Diciembre 2024', 1, 600.00, 600.00, 0.00, 'paid', '2024-12-05 18:38:34'),
(491, 32, 82, NULL, 'Ivanna Astrid Navarro Torres, Mensualidad: 1 disciplina / , Diciembre 2024', 1, 600.00, 600.00, 0.00, 'paid', '2024-12-05 18:39:11'),
(492, 62, 82, NULL, 'Thamara Segoviano Monforte, Mensualidad: 1 disciplina / , Diciembre 2024', 1, 600.00, 600.00, 0.00, 'paid', '2024-12-05 19:06:24'),
(493, 37, 82, NULL, 'Kamilha Zoé Hernández Zamora, Mensualidad: 1 disciplina / , Diciembre 2024', 1, 600.00, 600.00, 0.00, 'paid', '2024-12-05 19:41:57'),
(494, 116, 82, NULL, 'Maria Fernanda Hernandez Roman, Mensualidad: 1 disciplina / , Diciembre 2024', 1, 600.00, 600.00, 0.00, 'paid', '2024-12-09 20:05:22'),
(498, 174, 67, NULL, 'Legna Mayte Del Angel Amada, Mensualidad: 1 Disciplina / Clase, Septiembre 2024', 1, 600.00, 600.00, 0.00, 'paid', '2025-01-13 18:00:00'),
(499, 211, 91, NULL, 'Camila Alizee Barrera Leal, Mensualidad: +2 disciplinas / BECA OXFORD., Enero 2025', 1, 600.00, 600.00, 0.00, 'paid', '2025-01-23 09:48:00'),
(501, 212, 90, NULL, 'Carolina Rodríguez Rodríguez, Mensualidad: 1 disciplina / BECA OXFORD., Enero 2025', 1, 400.00, 400.00, 0.00, 'paid', '2025-01-25 12:11:00'),
(502, 19, 87, NULL, 'Andrea Melissa De Leon Martinez, Mensualidad: 1 disciplina, Enero 2025', 1, 600.00, 600.00, 0.00, 'paid', '2025-01-27 17:01:00'),
(503, 202, 91, NULL, 'Marian Vilaboa Luevano, Mensualidad: +2 disciplinas / BECA OXFORD., Enero 2025', 1, 600.00, 600.00, 0.00, 'paid', '2025-01-30 17:04:00'),
(504, 153, 89, NULL, 'Arlette Ramos Galaviz / Ariana Ramos Galaviz, Mensualidad: HERMANXS 1 DISCIPLINA, Enero 2025', 1, 1000.00, 1000.00, 0.00, 'paid', '2025-01-31 19:04:00'),
(505, 203, 87, NULL, 'Kiara Basilisa Paez Andrade, Mensualidad: 1 disciplina, Enero 2025', 1, 600.00, 600.00, 0.00, 'paid', '2025-01-31 19:15:00'),
(508, 62, 87, NULL, 'Thamara Segoviano Monforte, Mensualidad: 1 disciplina, Enero 2025', 1, 600.00, 600.00, 0.00, 'paid', '2025-01-31 19:44:00'),
(510, 49, 97, NULL, 'Paola Golpe Malaga, Mensualidad: 1 disciplina, Febrero 2025', 1, 600.00, 600.00, 0.00, 'paid', '2025-02-11 19:24:00'),
(511, 207, 87, NULL, 'Anette Carolina López Martínez., Mensualidad: 1 disciplina, Enero 2025', 1, 600.00, 600.00, 0.00, 'paid', '2025-02-04 19:21:00'),
(516, 214, 87, NULL, 'Elsa María Aguilar Rodríguez, Mensualidad: 1 disciplina, Enero 2025', 1, 600.00, 600.00, 0.00, 'paid', '2025-02-01 17:01:00'),
(517, 203, 97, NULL, 'Kiara Basilisa Paez Andrade, Mensualidad: 1 disciplina, Febrero 2025', 1, 600.00, 600.00, 0.00, 'paid', '2025-02-17 17:14:00'),
(518, 202, 104, NULL, 'Marian Vilaboa Luevano, Mensualidad: +2 disciplinas / BECA OXFORD., Marzo 2025', 1, 600.00, 600.00, 0.00, 'paid', '2025-03-20 11:00:00'),
(519, 197, 106, NULL, 'Alix Anette Hernández Salas, Mensualidad: 1 disciplina, Marzo 2025', 1, 600.00, 600.00, 0.00, 'paid', '2025-03-19 18:59:00'),
(521, 201, 116, NULL, 'Adara Guerra Sevilla - Sara Guerra Sevilla, Mensualidad: HERMANXS 2+ DISCIPLINAS / BECA OXFORD, Abril 2025', 1, 1200.00, 1200.00, 0.00, 'paid', '2025-05-07 02:00:00'),
(522, 65, 114, NULL, 'Victoria Isabel García Constantino, Mensualidad: +2 disciplinas / BECA OXFORD., Abril 2025', 1, 600.00, 600.00, 0.00, 'paid', '2025-05-02 14:25:00'),
(524, 19, 110, NULL, 'Andrea Melissa De Leon Martinez, Mensualidad: 1 disciplina, Abril 2025', 1, 600.00, 600.00, 0.00, 'paid', '2025-06-03 15:00:00'),
(526, 243, NULL, NULL, 'Angel Leija - Pago de mensualidad', 1, 7580.00, 7580.00, 0.00, 'paid', '2025-06-17 15:58:00'),
(527, 243, 107, NULL, 'Angel Leija, Mensualidad: L-V, Marzo 2025', 1, 800.00, 800.00, 0.00, 'paid', '2025-06-17 16:23:00'),
(528, 243, 115, NULL, 'Angel Leija, Mensualidad: Lun - Vie, Abril 2025', 1, 800.00, 600.00, 200.00, 'pending', '2025-06-17 17:49:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `tutorName` varchar(100) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `birthday` date DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `students`
--

INSERT INTO `students` (`id`, `name`, `tutorName`, `email`, `password`, `phone`, `birthday`, `createdAt`, `updatedAt`) VALUES
(16, 'Allison Cruz Mercado', 'Victor Hugo Cruz', 'angiemarket8@gmail.com', '$2y$10$kBMSKtYOlAZSZuoIM1iKZu56/smTQBvxEsW86pueSSJXgiJlsBF7W', '8991010215', '2015-09-17', '2023-09-14 16:27:30', NULL),
(19, 'Andrea Melissa De Leon Martinez', 'Cynthia Elizabeth Martinez Mounthon', 'mounthon_love28@hotmail.com', '$2y$10$sBOZmQeZ8b2XC/mu3Yp9p.qV0AaEEXUar6MssbgZpswfoTHpWJP92', '8994217582', '2012-05-30', '2023-09-14 16:30:47', NULL),
(21, 'Andrea Sofia Sanchez Zavala', 'Norma Zavala', 'multiserviciosorce@gmail.com', '$2y$10$MDi/nJKV09iEzHTnBumqTeB69EFmEhAK/tvG4NlVTXtzUtOZgcrB6', '8994678257', '2012-08-05', '2023-09-14 16:32:57', NULL),
(22, 'Camila Valeria Hernandez Navarro', 'Gladys Navarro', 'camilayhn@gmail.com', '$2y$10$skk9yC3IKMyr.7XdN1CZSuJ08rSan9TpJ9HhD179JLumWfvHhhpYe', '8992309690', '2007-01-07', '2023-09-14 16:37:37', NULL),
(25, 'Abdiel Alonso Rodríguez Navarro', 'N/A', 'ALONSO.RODRIGUEZ99@HOTMAIL.COM', '$2y$10$Im8z5HLqjn9a4GpkPPhHxO1J3UWa067azmG9xfSRhMeyM2/yfGBA2', '8994983914', '1999-04-14', '2023-09-20 15:50:33', NULL),
(26, 'Brandon Alexis Sandoval Ruelas', 'N/A', 'BRANDONRUELAS@OUTLOOK.COM', '$2y$10$nMXfK1vL8RQUpyppTV7e6e6svQPAqo/XWg2hJI9lbQv.Baxr5d1qi', '8994198834', '1997-02-15', '2023-09-20 15:59:34', NULL),
(27, 'Edna Sarahí Chávez', 'N/A', 'SARAHICHAVEZ@HOTMAIL.ES', '$2y$10$t3IKM2zbwa40zjtstOqDkeSXQE7jGJP/hlM3Dg3J9WiAvOKaKvt7G', '8991571326', '1997-10-31', '2023-09-20 16:01:38', NULL),
(28, 'Elisa Sisniega Mejía', 'Monica Mejía', 'KOMUNIKO.MEXICO@GMAIL.COM', '$2y$10$nouCZCzjHIJOhDxhnHHuGe1Nl0A86lZzeHg6WgIsBwAHTAObnx/we', '8991631916', '2014-11-19', '2023-09-20 16:02:36', NULL),
(29, 'Fátima Sofía Ortega Rico', 'Carla Sarahí Rico', 'CARLASANMIGUEL@GMAIL.COM', '$2y$10$bCC/kjQUlnCEYfcX/aY9l.jF2JWQ4W9hG8aMppU6dlL6.NBJoL73m', '8992277715', '2016-08-04', '2023-09-20 16:03:42', NULL),
(30, 'Galilea Montserrat Plata Hernández', 'Claudia Ivette Hernández Ramírez', 'GALIPLAT26@GMAIL.COM', '$2y$10$O/eJBYU0wghJn28m9oCbJOeOQVkDgB2343P7uMmGydKhAEOeIq33a', '8991235652', '2004-04-26', '2023-09-20 16:05:12', NULL),
(31, 'Isabella Avendaño Gallardo', 'Brenda Isabel Gallardo Cruz', 'RSBRENDA@HOTMAIL.COM', '$2y$10$.PQM.1NHoibT6/XwS9MvrOqRnXU6J9Qs3eS7Fg3NFaCE1j55ZEOvW', '8991221707', '2013-09-24', '2023-09-20 16:39:33', NULL),
(32, 'Ivanna Astrid Navarro Torres', 'Arely Marlene Torres Berrones', 'mareciita_97@hotmail.com', '$2y$10$hi5cjobFJBDKEOFTiYoUDuClJafWaeHUnu7NpFT1.hBjoFQWgIZPy', '8992506843', '2014-09-27', '2023-09-20 16:41:32', NULL),
(33, 'Jabnia Olivares Quiñones', 'N/A', 'JABNIAOLQQ@GMAIL.COM', '$2y$10$0gdKGU3fe3hljldmylP4KOhNqrvthYwn80TrCGVNtlHNUksRDWB6m', '8126501367', '2005-04-07', '2023-09-20 16:43:30', NULL),
(37, 'Kamilha Zoé Hernández Zamora', 'Ulises Hernández Rosales', 'ULISESHR848@GMAIL.COM', '$2y$10$f3P69DIS.wYhkeiSmAQ7Qe2pZkhEvB2xnrpaogxUw/mapzXU2U/XK', '8993188352', '2011-04-25', '2023-09-20 17:16:04', NULL),
(39, 'Leslie Romina Leija Hernández', 'Eloy Leija Cedillo', 'LESLIELEIJA27@GMAIL.COM', '$2y$10$qMbxfVAPLQjyAasygepNA.Jq0YEP0BHfLdGkTtwF8QCxlr5Koi1zS', '8991163006', '2006-04-27', '2023-09-20 17:22:46', NULL),
(40, 'Luis Ángel Rivera Ibáñez', 'Lili Sbeydi Ibañez Martinez', 'LILIS.IBANEZ44@GMAIL.COM', '$2y$10$GfG.v8DWr20Tq6aRmTAC3uiqW86Krd7unMxNGMM97v65NJYU9FgFC', '8991088617', '2008-03-13', '2023-09-20 17:25:40', NULL),
(41, 'Maria Ester Lerma Briseño', 'N/A', 'MARIALERMA95@HOTMAIL.COM', '$2y$10$dn3JsHlQ2ySVDSetpgRo6eeO85mZeBmBcn5Ab6XEDpWF4dSomQD1K', '8991601553', '1995-12-28', '2023-09-20 17:27:12', NULL),
(45, 'Martha Julieta González Herrera', 'Sergio González', 'SGONZALEZBERRA@GMAIL.COM', '$2y$10$jQ8pEeBicjrxbAcg95uowuRvSyX6kL7rnOFVjEZDTbh.033lFtGF6', '8999562627', '2007-01-05', '2023-09-20 17:34:35', NULL),
(46, 'Miranda García Casillas', 'Cynthia Casillas Peña', 'CYNCAS47@GMAIL.COM', '$2y$10$9hEXTN61kirdZMsf7bqvxuJgBmRiY0hiftOhHmscxeqRLX6nIhQ/O', '8998725017', '2008-05-05', '2023-09-20 17:35:30', NULL),
(47, 'Mya Kathleen Cantero Castellano', 'Adalberto Cantero', 'MYA.CANTERO.CASTELLANO@GMAIL.COM', '$2y$10$x9JxbQ5v29TIuW.VaPVZReyWrTkKKlVoscCXqyHDHicduTpfW5OS6', '8991822140', '2008-09-30', '2023-09-20 17:36:21', NULL),
(48, 'Oscar Antonio Garcia Chavira', 'N/A', 'OSCARGCHAVIRA@OUTLOOK.COM', '$2y$10$ZqfIbH4ZhMsh8eYLCwGYReLENGkWCbb/urJTfIriagWbxeKUTm6Z2', '8992082231', '1989-11-20', '2023-09-20 17:37:28', NULL),
(49, 'Paola Golpe Malaga', 'Germán Rivera Lopez', 'GOLPEPAOLA508@GMAIL.COM', '$2y$10$o6kxvUIuLe4VhWvzpEAb8.WfSO1qzF3FbepJxem5TQk6yXEHPXlAi', '8993169035', '2004-06-18', '2023-09-20 17:38:12', NULL),
(50, 'Paulina Salgado Pedraza', 'Valeria Pedraza', 'DULCEPEDRAZAGRAJEVA@GMAIL.COM', '$2y$10$Twgah0XxvF/9O1KX9vv1H.Dn/OBludnjZ2ge7A1ez8n9AgUbEJhQW', '8991191010', '2017-12-11', '2023-09-20 17:39:31', NULL),
(52, 'Regina Coelí Rodríguez Castellano', 'Cecilia Castellano', 'CECILIACASTELLANO@OUTLOOK.ES', '$2y$10$uPZ2y8.B9x5WeHemIgmzm.780wLpkyN6chKFzg36dvnrR8tlhtcCq', '8998719334', '2018-08-21', '2023-09-20 18:00:22', NULL),
(54, 'Ricardo Xavier Borja Luna', 'Isaura Luna Alvarez', 'BORJALUNARICARDOXAVIER@GMAIL.COM', '$2y$10$87eqEJiHFDAGQZe8gHOtOuR3wvGix9QDuMD8GtlM4JNnvr.FtnR2y', '8999381826', '2007-06-12', '2023-09-20 18:02:11', NULL),
(56, 'Sandra Edith Robledo Escandón', 'Priscila Andrea Escandón Ozuna', 'PRISCILAESCANDON95@GMAIL.COM', '$2y$10$nkecmpFG.dOeKaJQqPir.uUi6ZvWqS.1OzUgVI5q3XEU4LNrynn86', '8993002515', '2018-09-02', '2023-09-20 18:19:56', NULL),
(58, 'Siomara Valentina De León Navarro', 'Maria Idalia Navarro Sánchez', 'VALEDELEONN@GMAIL.COM', '$2y$10$FxNhSxaJc6xsEeoUAgJpVe6iYdn9wlC7vQkvKshoo7JSchGuXHBBi', '8992831912', '2007-10-30', '2023-09-20 18:21:49', NULL),
(61, 'Sofía Vanessa Velázquez Guillén', 'Maria Teresa Guillen Young', 'TERE_GUILLEN@LIVE.COM.MX', '$2y$10$SDbYYQZ8qzoDBxopy75/Dum9R1chutkrasrEq3.GUIDNmNnHQkYtS', '8999686704', '2013-05-21', '2023-09-20 18:39:39', NULL),
(62, 'Thamara Segoviano Monforte', 'Alejandra Monforte', 'ALEJA.MONFORTE@HOTMAIL.COM', '$2y$10$dFY3NPE2Vz0xZsNINBE3Me2GiYD5cQ6MbhiVuE4oFIlN7V9M0QsH.', '8992466606', '2011-09-26', '2023-09-20 18:47:21', NULL),
(63, 'Vianey Bautista Martínez', 'Cristina Martínez Hernández', 'CROSAVI17@GMAIL.COM', '$2y$10$uptIJp7QR8TVJHl/SFPVoewUunmi/ZFZzorlYw7RNzCYPl1J5Tz4C', '8992576684', '2009-05-29', '2023-09-20 18:48:37', NULL),
(65, 'Victoria Isabel García Constantino', 'Paola Constantino García', 'DOCTORACONSTANTINO@HOTMAIL.COM', '$2y$10$e/5cVxPv6vs0o7MQ.beaW.jvprtS.3353Ud3eg6Iguo2FFUImENeW', '8999584269', '2015-04-01', '2023-09-20 19:02:12', NULL),
(69, 'Martha Suhey Hernández Torres', 'N/A', 'SUHEYTORRES07@GMAIL.COM', '$2y$10$dD5c9HO8mQ3JGC050eqYuuls7z3VAb7JWmnpqplyLW8up9ofySyES', '8991705057', '1995-04-23', '2023-09-22 16:46:27', NULL),
(71, 'Alma Hepsiba Bautista', 'Evenezer Bautista Perez', 'MOONKYBAUPE@GMAIL.COM', '$2y$10$BUXj.uy0zSmba.8VVtWx2.ZVhoPsS6RVJEw01SF3iQh1sRqHW651a', '8994994948', '2008-07-03', '2023-10-25 14:22:32', NULL),
(79, 'Valentina Arias Garcia', 'Maribel Garcia', 'AMGG84@GMAIL.COM', '$2y$10$/ZxA1IURr6xrIkA7C1dF6umjykZ1cuTBu11BNP4XxXcLGGAKZ2h/q', '8999595143', '2013-07-04', '2023-10-31 16:22:08', NULL),
(80, 'Alba Patricia Torruco Cuevas', 'Sabino Eriberto Torruco', 'PATRICIACUEVAS1241@GMAIL.COM', '$2y$10$XYSC7fDAeMc5e36ILcXEUecseym68vWs0XwP3KX/GsHNvfY32qr3C', '8999275101', '2016-02-12', '2023-10-31 16:24:39', NULL),
(83, 'America Olivares', 'N/A', 'JABNIAOLQQ@GMAIL.COM', '$2y$10$rJuY/YFGleUNy1YxcLaGUO6bfl7SEmCC0lQLrFGNB/V8IZVNrDxUK', '8994977318', '1998-12-20', '2024-03-25 15:05:55', NULL),
(84, 'Cristina Rodriguez Mendoza', 'N/A', 'cristyred1300@gmail.com', '$2y$10$hoYDwy6k5kLqEipChqdxV.GCoqt.gWeoDkIqz42rYUB0sk2.IQRhm', '8991194800', '2000-12-13', '2024-03-25 15:11:09', NULL),
(88, 'Frida Sofia Rangel Ochoa', 'Marisol Ochoa', 'maissol.8a@hotmail.com', '$2y$10$wu5hNnsZ2MgukmSVQBxhpeC9Q68nnozw26i6idpzuFgUMa8Z37ZoC', '8992912234', '2014-09-26', '2024-03-25 15:24:33', NULL),
(89, 'Hanna Melo Alpirez', 'Iveth Alpirez', 'ivettealpi80@outllok.com', '$2y$10$FnDVCXwFNX/C/rDmjH5u5u8yOKwXJZiNpG25lkvYfnbiQXvJ/R71u', '8992447574', '2008-04-28', '2024-03-25 15:27:10', NULL),
(90, 'Ileana Treviño Gonzalez', 'Rosario Gonzalez', 'rosarioglezz1@gmail.com', '$2y$10$N0i8XYoejB4p2nKUVKJL5uPoBz7k.luT/u/ujmkBCVnMMOM/JxggK', '8993071916', '2010-03-30', '2024-03-25 16:00:11', NULL),
(93, 'Maria Jose Molina Ortiz', 'Maria Jose Ortiz Cruz', 'mariajoseortizcruz@gmail.com', '$2y$10$Q7/mSFa4LDhEdrpcqeDj3ukAg758c5KsbwgB9Ts8RfqI5PQaGYt2W', '899113298', '2015-11-09', '2024-03-25 16:07:04', NULL),
(95, 'Miranda Frenesi Martinez Sandoval', 'Mireya Sandoval', 'martinezsandoval@gmail.com', '$2y$10$.6zllmMoqf1cJz/6e2.XSO6zXT1K7yhJosyhJoZz8vEbrLJhsZR4e', '8993549314', '2008-05-23', '2024-03-25 17:21:27', NULL),
(96, 'Melissa Flores Barcelata', 'Ana Cristina Barcelata', 'memojones08@gmail.com', '$2y$10$mRWJai2kogu/eKpXknpFo.ohgAfDdqYZ7XbgKNeyNRh/F7LF6CHk.', '8991600661', '2009-02-11', '2024-03-25 17:23:08', NULL),
(110, 'Angelina Michelle Antunez Sandoval', 'Mariela Jazmin Ruelas', 'martinezsandovalmirandafrenesi@gmail.com', '$2y$10$uYObOXnPVwDlD4TP2IC5GebUe6X2y4uBbeAWfB.VjoSXZf5HS6tFK', '8994816009', '2006-03-03', '2024-04-05 15:02:07', NULL),
(111, 'Sofia Jerez Gonzalez', 'Edith Gonzalez Mendez', 'edith_gm77@hotmail.com', '$2y$10$qwOTqaoBc/n4aAZ2HksZOeAhTjKV7nM769KFHV2LXVHxHBrn3hgm6', '8991031824', '2016-06-21', '2024-04-15 17:35:38', NULL),
(112, 'Nydia Alejandra Pretelin Morales', 'N/A', 'npretelin@gmail.com', '$2y$10$DggAXZMDvSqbK27bftPJvedqWAVkOK/CDxD01P5H8.J/TcFWEr8cK', '8122014292', '1992-08-25', '2024-04-15 17:49:31', NULL),
(113, 'Dulce Mareli Arguelles Vera', 'N/A', 'dulcemarely_av@hotmail.com', '$2y$10$JPx0fu86YuW0uvwCqCuiEO30RNY4YT/FJWQazpS5UqxWWVnjJUMqS', '2221882832', '1988-06-04', '2024-04-15 17:50:46', NULL),
(116, 'Maria Fernanda Hernandez Roman', 'Juana Roman Diaz', 'j_hernandezb@hotmail.com', '$2y$10$xvfYYhcP4X57TO7wGvGRbedzCUApit8w6mW0u.K16aMLlf.5n6eQm', '8992454973', '2008-07-20', '2024-04-17 18:05:09', NULL),
(119, 'Lucia Garcia Rebolledo', 'Indira Rebolledo Flores', 'indirareflo@gmail.com', '$2y$10$weRFatfIJYzemQ2NN.mf.O3Y2SGXSnH5XqIyjq2HevRvwxyT71tvG', '8999119476', '2015-08-16', '2024-04-18 16:42:57', NULL),
(123, 'Ana Sofia Castorena Vazquez', 'Catarina Vazquez Hernandez', 'memojones08@gmail.com', '$2y$10$AdHv.gajdC93E/ME2Uz/YO8EV8.HFWLvMaGJrvm8/N2z9269yaFqO', '8991116440', '2017-04-15', '2024-04-22 15:18:26', NULL),
(124, 'Michelle Guzman Sobrevilla', 'Karina Sbrevilla', 'karina.sobrevilla@outlook.es', '$2y$10$wNtDJC/KOx1G7kz7CQVcAubNnkn.VfFaNzWwO7UJ7K72KBAy8V.dm', '8994215924', '2015-07-26', '2024-04-22 17:17:14', NULL),
(127, 'Allison Daniela Juarez Hernandez', 'Claudia Hernandez Morales', 'claudia91536@gmail.com', '$2y$10$kT1iVg8vUNVU2i2gRxaWfOT86WKoZzQc9NWKsniFMtLfTlSVWPvLe', '8993327720', '2018-01-03', '2024-08-28 16:42:31', NULL),
(129, 'Summer Marie Silva Gonzalez', 'Mayra Alejandra González Galván', 'mayraglz0504@gmail.com', '$2y$10$Jpp0eTRQsBAJgk2TESWlSeLFPixPl0ODJt/Dk5pr2PIbzkKBXyz56', '8993565318', '2022-07-13', '2024-08-28 18:28:38', NULL),
(130, 'Siria Guzmán Martínez', 'N/a', 'siriaguzman.04@gmail.com', '$2y$10$jewqa8XezLfqiWp.swGxbuHG9e/4w//cKx52d2RM1W88Np.CLcns2', '8992091138', '2003-11-01', '2024-08-28 19:31:01', NULL),
(131, 'Nahima Luna Jerónimo', 'Katia Ivette Jerónimo Perez', 'ivetteperez2908@gmail.com', '$2y$10$yOhdl0Q6aCHIoOzrYjaYh.aOjpiuuBR76smSzEFBNEWUAXChpDuty', '8991464161', '2013-12-05', '2024-08-28 19:32:18', NULL),
(132, 'María Luna Martínez', 'Adylene Espinoza', 'adylene1410@gmail.com', '$2y$10$TsdnSDe1fQxt3StOgtGFyuPuZa/sIXN84aEjsWMefWw4F7xVu3jM6', '956 515 7151', '2022-03-17', '2024-08-29 18:03:37', NULL),
(133, 'Hallie Nataly Torres Medrano', 'Jennifer Medrano Muñoz', 'Jenymunos123@gmail.com', '$2y$10$8XSWhMuNoST7kXp6MJneSO9GliIYG2jnJxLgrBAIqA98PjfAjQ3Se', '899 961 4338', '2017-03-09', '2024-08-29 18:11:10', NULL),
(134, 'Helen Gabina Torres Medrano', 'Jennifer Muñoz', 'Jenymunos123@gmail.com', '$2y$10$kFlspgSHO4wjZWqfQSH5cOVQHOev6s8LsMHR5BdxEpEzAdsTtN7gi', '899 96104338', '2022-09-22', '2024-08-29 18:12:38', NULL),
(135, 'Amsi Naarai Compean López', 'Amsi López', 'amsilopez2001@gmail.com', '$2y$10$Dq2QyuAGn7eIosCklCsjFuU64IaNUzX4kBLiExXdspGUgvul2NkJa', '8997753630', '2020-08-04', '2024-08-29 19:41:52', NULL),
(136, 'Larissa Marcela Pacheco Cabello', 'N/a', 'marcelapacheco9@hotmail.com', '$2y$10$UPwwvP3VZRn3BulcnqnBnesjgNvWTg5fMGxdJed8fSJs4QG3m38G.', '8992147922', '1993-07-09', '2024-08-29 19:54:23', NULL),
(137, 'Camila Cantú Beltrán', 'N/a', 'ballerinadanzayarte@gmail.com', '$2y$10$KFstfB/ZlDoMzQ8rEaiBUu1eE7n1FM3Hm7ibJj87wUGduV8JX7H5e', '8994604066', '2000-11-11', '2024-08-29 20:03:13', NULL),
(138, 'Alyson Victoria Medina Avila', 'Alejandro Medina Briseño', 'alex.m91@live.com', '$2y$10$OzR5xb6g7xGFPgNWRfD10e8XGmGFucjRnEuFTVh68zcTEYpcCBomq', '8992420437', '2012-03-17', '2024-08-30 17:05:27', NULL),
(140, 'Andrea González Snell', 'Brenda Snell Yunes', 'brenda_senuu@hotmail.com', '$2y$10$JqJwIaH5pSRaH6Bm/OX76OQhvfd2uBFUVSuZh7AdEFzEcpoealKq6', '8991220496', '2014-03-12', '2024-09-02 16:40:35', NULL),
(141, 'Mayra Isabel Castillo Ortíz', 'N/a', 'mayra.coo@gmail.com', '$2y$10$F.RZknXp0tSR2EES8yhSPePxxuz2AJgPso0Oy3CHrPkoxsZ4JrVmq', '8994141679', '1991-01-11', '2024-09-02 19:29:33', NULL),
(143, 'Elena Sofía Cardoza Salazar', 'Ruth Minerva Salazar', 'minervasalazarc@hotmail.com', '$2y$10$13OwI8JAvonXTwXPCJZE5.vIN3VeWQUT3EmL2j3kaEN0tEeaLwYTC', '8999565082', '2020-06-20', '2024-09-02 19:38:12', NULL),
(144, 'Natalia Alejandra Rocha Miranda', 'Antonio Salvador Rocha Sondiel', 'alejandra_miranda2@hotmail.com', '$2y$10$vh8lW/tyWbU1.AUgU0XzZePNgQUPBXzbND7tJa98LJWw7l9e/rMS2', '8999593802', '2016-10-06', '2024-09-02 19:39:41', NULL),
(145, 'Rebeca Paola Meza Salinas', 'Claudia Patricia Salinas Hinojosa', 'mezasalinasrebecapaola@gmail.com', '$2y$10$zeiGRpGI/JWcgGfDQacubOHLUPsXja.Z5MtyDpawuB108y4AWExuC', '8991165677', '2007-07-24', '2024-09-03 15:22:33', NULL),
(146, 'Paola V. Martínez Mendez', 'Rocío Del Carmen Méndez O.', 'n/a', '$2y$10$F4RC5V2qaGmG.KKWwqOJuuHvaRHEqLhq2qYKQ9zv3i.ErHQARUgEm', '8992519388', '2013-01-19', '2024-09-03 15:29:21', NULL),
(147, 'Juan Antonio Martínez Méndez', 'N/a', 'pacojones2674@gmail.com', '$2y$10$edI3gWDLSlbLLE248/kPguRAE5H6.Qp5mZcaOJKianxXlA.MymsRe', '899432339', '2008-02-05', '2024-09-03 16:30:40', NULL),
(148, 'Dariana Paulette Guerrero / Mia Alessandra Guerrero', 'Diana Anaid González García', 'anyLG_92@hotmail.com', '$2y$10$Vek55f8UOQ7FleHj4nmXf.0LMJ7IVlBlrO8NqSg9FeFitLE4b/BLa', '8991033651', '2017-01-21', '2024-09-04 19:32:26', NULL),
(149, 'Evie Karely González Díaz', 'Brenda González', 'Brenda.g_10@live.com', '$2y$10$SoW9E67tAyJIFnm2JqOAQ.7azQL5WGanevZryeYfnzWdqQcoxdYI6', '899 912 8965', NULL, '2024-09-04 19:34:45', NULL),
(151, 'Odette Márquez Moreno', 'N/a', 'ballerinadanzayarte@gmail.com', '$2y$10$3OYVU7VCcxoRm20qQsSaneKi9Bvs3/ylxsyFn9JGfjlFoY8cLX0ii', '8999137316', '1999-06-28', '2024-09-06 15:34:40', NULL),
(153, 'Arlette Ramos Galaviz / Ariana Ramos Galaviz', 'Nayeli Galaviz', 'Nayely.gg@hotmail.com', '$2y$10$WEhgbB0Ee.mnpOJTNkhEMObupQ23ZUyuuI46w6CsHAKwgEOznE3ca', '9562702458', '2022-03-29', '2024-09-07 09:48:35', NULL),
(154, 'Valeria Rubi Preciado Saldaña / Zulema Mabel Preciado Saldaña.', 'Rubi Zulema Saldaña', 'mabelita.1314@gmail.com', '$2y$10$VgabfdlSY4E15V9EwA71he6v6boS0naE0ORb3MAf6n6cvzNKyWM8C', '8998993690', '2012-10-11', '2024-09-07 10:05:12', NULL),
(155, 'Victoria Amaité Del Ángel Vázquez', 'Claudia Vázquez', 'cvdelamancha92@gmail.com', '$2y$10$iuCI/mgvLwi28nik2NRDiOMUISCxiMA81w79E9VREzylWrlWhYA8a', '899 218 2732', '2020-12-29', '2024-09-07 10:16:40', NULL),
(156, 'Barbara De León Sánchez', 'Sarahí Sánchez Rubio', 'sarahi.sanchezc@gmail.com', '$2y$10$NagN7HHFCF/vKPR8A8m6UunWwXnJIAhYBujDk4iUQMX1YL/9F6d9a', '8343040814', '2022-11-22', '2024-09-09 16:22:50', NULL),
(157, 'Arantza Silva Delgado', 'Nadia Delgado Lara', 'ballerinadanzayarte@gmail.com', '$2y$10$7wQy10I2vT4W6Z6iCG6lr.77wDX99TiOcZXBSNFCeVnffnWvHk6US', '8991011098', '2009-06-24', '2024-09-09 17:39:37', NULL),
(158, 'Sofía Herrero Galván', 'María Del Rosario Galván Romero', 'galvanrosario@yahoo.com', '$2y$10$ze84f87ynZVAu5gxhEnUV.qo6fmqEJTVRyqRvivYiwnL7FUcXIX9u', '8991221071', '2008-12-15', '2024-09-09 18:09:30', NULL),
(159, 'Silvia Patricia Orta González', 'N/a', 'ballerinadanzayarte@gmail.com', '$2y$10$aLwmhhByilyvdU0rhyTpMe8hzma8b1IzxLnK.irrr02VzYNCV0XbG', '8993526520', '1976-07-03', '2024-09-09 18:33:09', NULL),
(160, 'Silvia Montserrat Ruíz Córdova', 'Marlene Córdova López', 'Marlenecordovalopez773@gmail.com', '$2y$10$n0ZkQRtZ5BYVRdXV6Pz7keptDndp7E8S30xbpvUqORsA24F.j1S.G', '899 494 2840', '2015-11-19', '2024-09-11 17:33:16', NULL),
(162, 'Frida Mayte Bonilla Resendiz / Mia Pamela Bonilla Resendiz', 'Melody Aida Resendiz Cortes', 'melodyaida111@gmail.com', '$2y$10$wKr28j/MHbvx8mGL3VMvq.qqOVH7WYLUOTgHa5R3/Ev5MDObm3z1u', '8992305202', '2009-01-26', '2024-09-18 19:21:21', NULL),
(163, 'Giana Ocañas', 'Ana Laura Ocañas', 'laueacastiyo4@gmail.com', '$2y$10$QgFjDm8UmLWey7bueu0xjuxywiTvcjUysykxogqOYfkyI6TaqrbJK', '9566511955', '2017-04-26', '2024-09-21 10:55:04', NULL),
(165, 'Luciana Ocañas', 'Ana Laura Ocañas', 'lauracastiyo40@gmail.com', '$2y$10$6Wgr7BW90f4ykdTiVACeXO7uq6NHj5tKHAzWHQwsefBw1NtLpeziC', '9566511955', '2020-06-08', '2024-09-21 11:13:34', NULL),
(170, 'María De Jesús Valdez López', 'Alejandra Grazia', 'alejandra.grazia@gmail.com', '$2y$10$ah69jWNjGnKJrXoPOmnqo.Tf16k4ICQVSRClJYucOzse1EyGl1Or6', '8998736929', '2011-12-27', '2024-10-07 16:30:55', NULL),
(171, 'Lucia Isabella Aguirre Silva', 'Edith Silva - Lucia Auces - Javier Aguirre', '-', '$2y$10$PbIJIgIUywr6MMf03157Qumv.8t9CdY.dtlVO4/L2f0kPgpViIkcu', '8999369108', '2019-11-08', '2024-10-07 19:30:25', NULL),
(172, 'Aldo Karim Manzanares Barrera', '-', 'Karimmanzanaresb@gmail.com', '$2y$10$a0gjEnHgcWARhEJKbfuVVOVn2SbJY6UgExDTsBAiwNKWbt3nOitiy', '8994829639', '2005-05-02', '2024-10-10 17:47:12', NULL),
(173, 'María Del Carmen Borja', '-', 'borjamay506@gmail.com', '$2y$10$UaakrPY1YeB3lrMMTFdV5eWsC3LeckD2FNsTUz8zPjnHiUOnso3Cm', '5543534194', '1991-06-05', '2024-10-10 17:51:30', NULL),
(174, 'Legna Mayte Del Angel Amada', '-', 'legnadelangel18@outlok.com', '$2y$10$n8w5WhqgUgy3rH90FYIj9ukYu8NYBOLWUSRX8LHUELbeziQZe20Du', '8991039452', '2004-11-18', '2024-10-10 17:59:41', NULL),
(176, 'Renata Giomara Estrada Garrido', 'Claudia Giomara Garrido', '-', '$2y$10$obWsBGNqI6drkZ57HT6JcuLHprlrsSgGHJcsK8RNwleWctXzd91du', '89994514922', '2014-02-12', '2024-10-15 15:21:36', NULL),
(177, 'Isabella Georgette Mejía Canseco', 'Eleana Isabela Canseco Martínez', 'eleanacanseco@gmail.com', '$2y$10$nQkXb3XSg3wG5GJrS2Eh9emDYYqZO1hqlSkwX1cRNlh25dg1FW4nS', '2881005125', '2017-09-07', '2024-10-16 16:29:11', NULL),
(179, 'Ingrid Abril Cruz Marquez', 'Celia Marquez Del Angel', '-', '$2y$10$JhtlzIJdgcVfA0r.Ml90keS.gTTuvNpIkjuOyxRrhH.5XmH4joFPG', '8994115236', '2015-10-12', '2024-10-19 09:22:56', NULL),
(181, 'Aurora Denisse Salas Correa', 'Diana Karina Correa Hernández', 'Karynacorrea06@gmail.com', '$2y$10$SH7SsYmok2sTKPO6QkCikOp03Anpc2z8nznpScIqSpKhDNpzSK0Fy', '8991208393', '2017-09-09', '2024-10-21 19:09:35', NULL),
(183, 'Frida Isabella Ponce García', 'Damaris García', 'damarisgarcia262@gmail.com', '$2y$10$K8Nbtk1MEXD8MsI4UJ7Zfe.MHDqP.2AwDlAxyYm6zfjOOZBu4olvu', '8991453367', '2017-09-13', '2024-10-21 19:12:46', NULL),
(185, 'Isabella Cisneros Gastelum', 'Noreyda Gastelum', 'marianga1178@gmail.com', '$2y$10$6djXOGN3HmuTgtCCmFsvb.WSQLjsK1sM3ZOPH03r7yZhBXGYPqb6u', '8991191429', '2012-05-03', '2024-10-21 19:19:52', NULL),
(189, 'Rosa Maria Hernández Reyes', '-', 'Selegna217@live.com.mx', '$2y$10$Xr/gwzcTn18Zhw2Y3kGjQ.GUwpCPhcOtYCehBpL9dz4Pz4NT/GJeS', '8994600050', '1998-12-17', '2024-10-21 19:24:53', NULL),
(190, 'Daira Victoria Cavazos Alonso', '-', 'dairavictoriac@gmail.com', '$2y$10$1zzXA/skWcFiHTseILe14uDTTcS1I/15KHF6qrSKn6K5eDeLrOIPi', '8994502321', '2010-12-03', '2024-10-23 18:48:50', NULL),
(191, 'Samara Lopez Tirado', 'Zaida Marisol Tirado Reyes', 'Tiradozaida600@gmail.com', '$2y$10$0qMvVOQj6BkNsdRUwkcvdeNX1uOBpqwinFZO5zKGnWTHZvXl90S0m', '(956) 369-0573', '2020-07-22', '2024-10-25 16:18:12', NULL),
(193, 'Angeles Aurora Gutierrez Urtiz', 'Cinthya Urtiz Sobrevillas', '-', '$2y$10$c0sT2MlsS9cw55FKIwJtMe2dxNjqr4kSLraA1d08KwRMGKWnnGzRy', '8994947718', '2016-12-02', '2024-10-30 16:08:21', NULL),
(194, 'Montserrat Morin Chávez', 'Sandra Chávez Lima', 'sandra_ch@hotmail.com', '$2y$10$nVev9nGXEn26owLTS/IBEuv7cDlDVt/kSbGMUIeWReC4o6cJKgGDO', '8991221356', '2008-08-15', '2024-11-06 19:34:49', NULL),
(195, 'Laisha Georgina Ulloa González', 'Martha González', 'glzmartha@outlook.com', '$2y$10$efgM3dulS/GCy2p7xiwFNOUM354ejeIw7B56WXzwUtFHLDr4/Vi9S', '8998711811', '2015-08-21', '2025-01-08 17:19:26', NULL),
(196, 'Marco Azael Quintero Hernández', '-', 'marcosshdz12@gmail.com', '$2y$10$V2CJatsK325AtvZtBx.cauMsvHkL6iXYAjkbL827hh5aBOBel.YIC', '8995456741', '2001-12-26', '2025-01-08 17:21:22', NULL),
(197, 'Alix Anette Hernández Salas', 'Ricardo Hernández García', 'hernandez.g.ricardo85@gmail.com', '$2y$10$.XorNWiurb5oNkcFR14otOY.4pmARh5hVS7RLqHDiRpmq4MNrEzP2', '8993386533', '2018-01-13', '2025-01-08 19:59:56', NULL),
(198, 'Alondra Stefany Sánchez Alaffita', 'Irene', 'alondrastefanysza@gmail.com', '$2y$10$1bayE0M8BhsmNIz5NtIm5OoWhYblrQUhe2AjUe9YzXhOupx7AFvPq', '8999838035', '2002-12-12', '2025-01-08 20:08:18', NULL),
(199, 'Irene Del Carmen Alaffita Hernández', '-', 'alondrastefanysza@gmail.com', '$2y$10$9xHntZMOdLkGKsclF3vSGO0JQYOyR9BnRj5h9bZHKpo0bgxszzvfO', '8999838035', '1975-03-11', '2025-01-08 20:09:26', NULL),
(200, 'Melany Abigail Garcia Martínez', 'Teresa Abigail Martínez Mounthon', 'Tabimar98@gmail.com', '$2y$10$03KXs.mC3oPVoRNUu8kLYuzT4uKAdlAM4nU/z6hIJNJorMYKIrpxW', '8994650988', '2020-07-16', '2025-01-11 10:57:15', NULL),
(201, 'Adara Guerra Sevilla - Sara Guerra Sevilla', 'Martha Lizeth Sevilla Medina', 'Inca.martha@gmail.com', '$2y$10$M3ksddCXbEgy5kp8tFBHWO9R1T4b/CrQlUX3HzyiNOqpBwuVsw0gK', '8992090138', '2015-07-15', '2025-01-13 18:53:35', NULL),
(202, 'Marian Vilaboa Luevano', 'Laura Aidé Luevano Ramos', 'luevanolaura@gmail.com', '$2y$10$B76QVY25NpGabExIrHPNn.hMdEjL6mRsi/ApBEZZ/7pqCBVTTvpnW', '8993187171', '2012-09-26', '2025-01-14 17:19:25', NULL),
(203, 'Kiara Basilisa Paez Andrade', 'Yazkara Aylin Andrade Rodríguez', 'aylin.rdz1224@gmail.com', '$2y$10$hXXjX4L1.5/Ao1Bv1u87nujcqkVTdi9mUTY1sfKKBR3Bl3hHEzX0G', '8991653113', '2019-03-28', '2025-01-15 19:16:15', NULL),
(204, 'Gloria Natalie Molina Delfin', '-', 'glorianmld@gmail.com', '$2y$10$0bOSW/4ERcwkPZWN9qIy5uxAwolFwhPdiZ8yGrJtoSx/8x3LkqHom', '8994574424', '1999-12-28', '2025-01-15 19:21:44', NULL),
(205, 'Marcela Peña Sanchez', 'Guillermo Sánchez', 'mu2marcelapena@gmail.com', '$2y$10$nI7rEIvViz8sjFM1Tfo67e5l9l/7kZY4M4wGJOuoDXZpKh87EKeeS', '8134734176', '1985-06-05', '2025-01-15 19:27:30', NULL),
(206, 'Jesús Emanuel Márquez Fonseca', '-', 'jes_man_24@outlook.es', '$2y$10$g2VyaQnKNuRxr2gqyV95s.zPkFfCkGsgfZwlaU3aUbxzdpWJHM9UO', '8998585286', '2000-08-24', '2025-01-15 19:51:06', NULL),
(207, 'Anette Carolina López Martínez.', 'Rosangela Martínez Ramírez', 'rosangela_emr@yahoo.com', '$2y$10$N1vh2b/HtSY1jDYSynLBs.1MolTOBDgqDREPhuWBU/7CMVExwAMh2', '8999563309', '2013-05-24', '2025-01-22 20:07:01', NULL),
(208, 'Ángel Ricardo Raymundo Tirado', 'Gabriela Tirado Domínguez.', 'yaelraymundo20@gmail.com', '$2y$10$sA8rFbbQKaHmFST6lVPO/.nsez79quZbfV4uL.nkR9P9UZBdgj4Fy', '8991157888', '2010-05-19', '2025-01-22 20:09:36', NULL),
(209, 'Jese Yael Raymundo Tirado', 'Gabriela Tirado Domínguez.', 'yaelraymundo20@gmail.com', '$2y$10$Js7nOig9.D52z47jP5Z9CudgarV9xM867e2bEckiQTsalRFEOAaa2', '8991157888', '2006-12-20', '2025-01-22 20:10:48', NULL),
(210, 'Zoé Sánchez Cruz.', 'Liliana Cruz Rosales', 'rosalescruz93@gmail.com', '$2y$10$JI2tXii1ryj4DzlhbVYDa.WBDJWN2.5fUhX8ZQc1l.8I6Y/9RJOYO', '8992490403', '2021-07-05', '2025-01-22 20:33:24', NULL),
(211, 'Camila Alizee Barrera Leal', 'Ilse Leal Rodríguez', 'ilse.leal2390@gmail.com', '$2y$10$QU7aNXvjU/5nSB1A2X2HYOV7fwPiXJcfMWAIoka4.Fml40KfFgPmC', '8996473299', '2015-01-26', '2025-01-23 17:58:37', NULL),
(212, 'Carolina Rodríguez Rodríguez', 'Itati Carolina Rodríguez Valencia', 'itatirdzv@gmail.com', '$2y$10$ZmtujnD8z2G8vUdgFnSX0en3h3wWZtHZ.obZUFn51OmUIi4pK5IDK', '8991106062', '2019-10-11', '2025-01-25 12:11:30', NULL),
(213, 'Thisha Elán Cotero Rodríguez', 'Cynthia Rodríguez', '-', '$2y$10$02Y83DdlHNblqwWMfmjQC.7Tifcj622tMjUL0OXRPKPfA80Lko2B6', '8999620082', '2021-09-28', '2025-01-29 18:08:20', NULL),
(214, 'Elsa María Aguilar Rodríguez', 'Dagna Rodríguez Garza.', '-', '$2y$10$uVWO0f2I13wfaFs7XS/jHeQ3DMDTg8vpAZNRyzPzf/zsLJldOZsCK', '8999596444', '2021-11-18', '2025-01-29 18:11:20', NULL),
(215, 'Valentina Garza', 'Valeria D. Espinoza Cruz', 'yeya281@hotmail.com', '$2y$10$vxlIRoz3FMzY0i.uLiR7uOQfyvr7veSnPNwYzEF14l6C4bsdDlPo.', '8341419662', '2019-05-10', '2025-02-04 17:18:51', NULL),
(216, 'Julihanna Armas Bueno', 'Julio César Armas Ramírez', '-', '$2y$10$9REWI.Lk4nEfikhIF/U13ejY9COTrRfshW1PzDd7dOpQw4RcD40IS', '8993295613', '2017-10-05', '2025-02-04 17:21:58', NULL),
(217, 'Aileth Armas Bueno', 'Julio César Armas Ramírez', '-', '$2y$10$BEvQmFfN8M1hUpGWhgXQLOtggQWbeGCbSp9hoZAE.ynrwo4QfQZ8y', '8993295613', '2006-09-16', '2025-02-04 17:22:51', NULL),
(218, 'Luisa Ariadna Contreras Betancourt', '-', 'andaira.ac@gmail.com', '$2y$10$lJroZazlyOVZR8Ub4ceO8evowCoq97WBg.A7DIycQVzd.2rD/0aKe', '8998712797', '1981-09-11', '2025-02-08 10:30:54', NULL),
(219, 'Irina Valentina Gómez González', 'Gabriela González Govea', '-', '$2y$10$stKrStA/1Qvre/yCxvRiTeRducg7aI18f5Y.sDqJS6yyFcwUiV3yC', '8991075253', '2022-11-22', '2025-02-08 12:04:00', NULL),
(220, 'Laura Elena Sánchez Hernández', '-', '-', '$2y$10$7tg50GBs/uEwY/Q2oTIG2O6rpJokF90fAj/rivcoIOKFa5x25cccG', '8999172760', '1970-08-21', '2025-02-08 13:07:49', NULL),
(221, 'Roberto Martínez Pérez', 'Denise Pérez Trejo', 'kittdenn@yahoo.com.mx', '$2y$10$mQAbQ0mJH9gPNjC/K9OHNOpKg1QEYVtMBcJtNqqNtBrxgxrtk5w4S', '8998760250', '2016-02-28', '2025-02-08 13:09:05', NULL),
(222, 'Zoe Atenea Méndez San Martin', 'Frida Sofía San Martín Carmona', '-', '$2y$10$rPftpQZTxs5OmrZ020rA2un1JczsXZuZb8jLum48rmvOZqyvZLkJW', '8995289437', '2021-12-15', '2025-02-17 19:41:11', NULL),
(223, 'Isabella Itzayana Torres Villa', 'Ana Elizabeth Villa Garza', 'vana_elizabeth@hotmail.com', '$2y$10$dVdxz0Km7CqdgunM/VKxSulDJRX8T3RVsiqL/1fVHE5eiHtYudTHC', '8991550339', '2017-11-20', '2025-02-18 17:24:39', NULL),
(224, 'Yvonne Aza Tapia', 'Cynthia Tapia Rodríguez', 'cynthiatapia54@gmail.com', '$2y$10$4IqlhECgNznsGglk9d7LpOnm5VKe.X8uLTP8hOEY/Y80mOCYaU/OK', '8991105909', '2017-01-28', '2025-02-18 18:49:49', NULL),
(225, 'Laura Naian Cortez Sánchez', '-', 'laura.crtz.01@gmail.com', '$2y$10$wlCDq9frG/dUJTS2LZe8AeI82OVQgR7sfkLrR2K5ARZdEejFulgMi', '8991566862', '2001-01-29', '2025-02-19 20:02:44', NULL),
(226, 'Natalia Elizondo Cantu', 'Melissa Cantu Chapa', '-', '$2y$10$vBtyJSxTtcMp3K0IlJYd8uMX1h8.Qy6EE71bJ0Vtjkld4TW/6y7LC', '8991130151', '2010-06-01', '2025-02-21 13:09:32', NULL),
(227, 'Gabriela Tirado Domingues', 'Mamá De Tkd (jesé, Gabriel Y Ricardo Raymundo).', 'gabytyrado@gmail.com', '$2y$10$16x5jpAYyMBWEjb2.BVBw.FoLjP.875YPssuhuxlJG169.mzf6Rg2', '8991157888', '1982-09-17', '2025-02-21 21:30:57', NULL),
(228, 'Romina Paulette Rodríguez García', 'Yanhela Guadalupe García Elizondo', 'yanhela_97@hotmail.com', '$2y$10$SNRjZuhd5mvtssyF8ztdIuQI7eauosnG/D.WBgz7jTX3aMCZT8V7S', '8995018120', '2020-11-19', '2025-02-26 19:50:47', NULL),
(229, 'Alexia Geraldine San Román Aguirre', 'Yocelin Sanromán Rodríguez', 'yocelin5698@gmail.com', '$2y$10$VmFUSfwe3nE96CfhI0Usdu1mLuWBC7peLFg2wcjLJQU/k1xkdZYGq', '8999639669', '2021-01-03', '2025-02-27 18:27:40', NULL),
(230, 'Silvia Paola Palacios Verdines', 'Silvia Verdines', 'silvia_nerver@hotmail.com', '$2y$10$2mXDrzcZw2fo3SeeeMhIwO7hJmW57.Dq3ky0sNqBOyWUXKKDERehW', '8991598836', '2010-02-08', '2025-02-27 19:40:36', NULL),
(231, 'Aranza Romina Torres Hernández', 'Gabriel Torres', 'gabrieltorres.aran@gmail.com', '$2y$10$TQOoiGPA81825KpGu4xIy.UXcg/Izsb/8UUKMvN6G8A6h3./aHFM6', '8991342527', '2019-11-06', '2025-03-01 10:39:31', NULL),
(232, 'Melany Sofía Castellanos Armendáriz', NULL, '-', '$2y$10$kFMc1fqT28o0xc5emQxV3Ox8nI1Dbisj5lE88VpTXCGN7edV1p9Ve', '8991018452', NULL, '2025-03-05 20:19:02', NULL),
(233, 'Marifer Rodriguez Martinez', 'Nereida Martínez', '-', '$2y$10$gQQKolaCg/Cpurxj3gUu7OMAW0eTpmGcB.seunNPuPsxw7829j52y', '8992855515', '2019-12-21', '2025-03-08 11:43:11', NULL),
(234, 'Miranda Salazár Martínez', 'Cynthia Martínez Palacios', 'cyndy76@hotmail.com', '$2y$10$Jr5sOygW8x13NH04sweTueMDlwfpjDfctyTtx//EMcTe0ZuRoAOC.', '8999369147', '2019-09-16', '2025-03-08 12:27:08', NULL),
(235, 'Alexa Fernanda López Betancourt', 'Alejandra López Betancourt', 'alelopez0292@gmail.com', '$2y$10$6fDQW5G7A2UvVIHNOyFle.9Ji8esg9xEbdwQJdunvoG7K2VT9Uiwe', '8992449761', '2014-11-14', '2025-03-18 16:09:13', NULL),
(236, 'Lidia Yamileth Ceballos Guzmán', 'Cinthia Guzmán', 'cinthiadenisse95@gmail.com', '$2y$10$V06ohS6OKGEIFIPzEedJPeVAmBdSVniL/dG8ZTa5rjGpn7JhPNtEu', '8992560632', '2011-07-22', '2025-03-18 16:14:53', NULL),
(237, 'Ilse Anais Villarreal Orozco', 'Elvira Yazbereni Orozco López', '-', '$2y$10$VRKq62OvlIbwjB15SqcU6uQFV4NWz1RXmwQF42IHPxhzPkDd./CTG', '8992391719', '2022-08-31', '2025-03-18 17:20:52', NULL),
(238, 'Emma Marcelina Ceballos Torres', 'Alba Torres', 'd15anna@hotmail.com', '$2y$10$IqwRmR1jqKwUoUsxf7CGBOI5ad/LJjPjekR6ZpMwhgOy2rhHg4ZSS', '+1 (210) 716-8018', '2022-01-26', '2025-03-21 16:32:14', NULL),
(239, 'Mirka Paulett Ramírez Castillo', 'Karla Paola Castillo Limón', 'castillolimonK@gmail.com', '$2y$10$D.Rfm88H7aUnukjGJT3u0.U0dq1971blhPRausEHoKrDqiNXk86O6', '8994958835', '2017-07-10', '2025-03-22 09:49:05', NULL),
(240, 'Jacob Cabello', 'Mama De Jacob?', '-', '$2y$10$REppqdk3PoyiVYY7KQotuun1xH9bQQ04E5YOyaSbVQuwBelkZEFPm', '8998634215, Mama: 89', NULL, '2025-03-23 14:15:07', NULL),
(241, 'Maria Emilia Gomez Mojarro', 'Soledad Mojarro', 'sol_mojarro@hotmail.com', '$2y$10$9VYsXoD3V8rSFeH7Mi4F8.GVLzHN22xjJYcJ9ZaF6rUz7JugHzdpm', '8992175593', '2019-09-02', '2025-05-03 11:05:15', NULL),
(242, 'Jhosmaly Gina Leyva Hernández', 'Teresa Hernández', 'Leyva322@gmail.com', '$2y$10$5JKQN7vyjLmQHcosJLQpOuQw357iVcn1Z8ETqO0DCvLEhzmZjoiUq', '8999104054', NULL, '2025-05-07 17:40:47', NULL),
(243, 'Angel Leija', 'Javier Leija', 'angel.leija@gmail.com', '', '8994585918', '2003-10-22', '2025-05-17 12:35:56', '2025-05-28 01:38:06'),
(244, 'Isabella Reyna', 'Daisy Reyna', '-', '$2y$10$3w9ZGxKSUMFCA2de5gVzeOXtVjzyq8dtJNi3vro5CyMO5aPHg9asi', '8999505990', NULL, '2025-05-27 16:59:07', NULL),
(245, 'Alessa Reyna', 'Daisy Reyna', '-', '$2y$10$V2yOad1hIQOhpT1NbasXV.MiLb7wVPoVDstQVLFhWzmyGCsEZtQgy', '8999505990', NULL, '2025-05-28 16:03:28', NULL),
(247, 'Ximena Parra Cabrera', 'Judith Cabrera', 'judithcabrera8@hotmail.com', '$2y$10$CHfaWoVCS58XMS6Ma0OndewwQj2diAFhwaNYRchlxboAJWfDheTHu', '956-313-1082', NULL, '2025-05-28 17:54:59', NULL),
(248, 'Angela Sofía Zúñiga Azuara', 'Joana Edith Azuara Baez', 'joana0012017@gmail.com', '$2y$10$r2rZT3Jwuc8LkHjPvBR2FukgIMxEfKBTPOGL62TxqctHD3fEfB3ya', '899 103 8781', NULL, '2025-06-02 16:57:29', NULL),
(249, 'Cecilia Tijerina Borja', 'María Borja Melendoz', 'borjamay506@gmail.com', '$2y$10$SyONiOpDimGDlv0PVbItD.HFUsrO5acTaXmEDh/6jEp4RGbcLWMK.', '05543534194', NULL, '2025-06-02 18:56:21', NULL),
(250, 'Daniela Lopez', 'Yessenia Pérez Daniel Lopez', '-', '$2y$10$mV0LPsWT9F9haMLkJa5...m2BKnTxyzK.BjSrRzQbzSrHDjS6vi2S', '8991839940', NULL, '2025-06-02 18:58:00', NULL),
(251, 'Dania Arlenne Zumaya Barrera', 'Hermana De Zulema', 'Daniazumaya1980@gmail.com', '$2y$10$cDtd//dA/GpTGxZwVzH4Eu.PWuETmSSiWNQkf5Cme9tfdpezyGywG', '8992093639', NULL, '2025-06-02 19:10:08', NULL),
(253, 'Ivanna Fuentes Franco', 'Mauren Paola Franco Godoy', 'maurenfranco@outlook.com', '$2y$10$OWTHxs.xvj.8Als225CZieLck.ElNXXyfUtNW7SnRrnRb3UaU11hK', '8999616707', NULL, '2025-06-07 09:52:58', NULL),
(254, 'Morgan Zoe Trejo', 'N/A', '-', '$2y$10$GmYnrJZEfziN5hf/qQ6EKOA1S.vzZ8dHk/khZv97MxVH96MZQPTuS', '-', NULL, '2025-06-09 12:46:24', NULL),
(255, 'Marcela Arguelles De Vazquez', 'N/A', '-', '$2y$10$nGHd6qkhDwGaybWoi3CLCuVCv/1klZFH/EqHOjOIpznSJPqaxas4W', '956-534-6300', NULL, '2025-06-09 12:51:06', NULL),
(256, 'Linda Lopez Hernandez', 'N/A', '-', '$2y$10$mT41FywN.ojk15umsspM0O9mJlU3I3Sdw43Ata3Jw9FVTq5Gw3StS', '899-259-7600', NULL, '2025-06-10 13:50:18', NULL),
(257, 'Nidia Alejandra Pretelin Morales', 'N/A', '-', '$2y$10$.cWhHCcNBpo8TOygCmra6eygLylU0wzhXSSotWqfSj06WorkKA6.O', '81-2201-4292', NULL, '2025-06-10 14:10:50', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrators`
--
ALTER TABLE `administrators`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `employee_payments`
--
ALTER TABLE `employee_payments`
  ADD PRIMARY KEY (`paymentId`),
  ADD KEY `employeeId` (`employeeId`) USING BTREE;

--
-- Indices de la tabla `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `installments`
--
ALTER TABLE `installments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `saleId` (`saleId`);

--
-- Indices de la tabla `monthly_fees`
--
ALTER TABLE `monthly_fees`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `studentId` (`studentId`),
  ADD KEY `monthlyFeeId` (`monthlyFeeId`),
  ADD KEY `productId` (`productId`);

--
-- Indices de la tabla `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administrators`
--
ALTER TABLE `administrators`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `employee_payments`
--
ALTER TABLE `employee_payments`
  MODIFY `paymentId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=317;

--
-- AUTO_INCREMENT de la tabla `installments`
--
ALTER TABLE `installments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=539;

--
-- AUTO_INCREMENT de la tabla `monthly_fees`
--
ALTER TABLE `monthly_fees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=529;

--
-- AUTO_INCREMENT de la tabla `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=258;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `employee_payments`
--
ALTER TABLE `employee_payments`
  ADD CONSTRAINT `employee_payments_ibfk_1` FOREIGN KEY (`employeeId`) REFERENCES `employees` (`id`);

--
-- Filtros para la tabla `installments`
--
ALTER TABLE `installments`
  ADD CONSTRAINT `installments_ibfk_1` FOREIGN KEY (`saleId`) REFERENCES `sales` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`studentId`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`monthlyFeeId`) REFERENCES `monthly_fees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sales_ibfk_3` FOREIGN KEY (`productId`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Base de datos: `old_portal_ballerina_db`
--
CREATE DATABASE IF NOT EXISTS `old_portal_ballerina_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `old_portal_ballerina_db`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrators`
--

CREATE TABLE `administrators` (
  `administrator_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `administrators`
--

INSERT INTO `administrators` (`administrator_id`, `name`, `email`, `password`, `created_at`) VALUES
(7, 'Admin', 'admin@admin.com', '$2y$10$tepEaq/hkGe/Mmeh..Vxa.rFmGAr2ELaFk/MTi.WCmC388Kbo/Foa', '2023-08-23 17:28:35'),
(8, 'Guillermo Sanchez', 'memojones08@gmail.com', '$2y$10$i0RIKqt1UOhebdOz1JRrg.e2LOQpqTCI/QLm2jtqbNdLfM0uWgrFS', '2023-09-13 15:07:43'),
(10, 'VALENTINA ', 'memojones08@gmail.com', '$2y$10$P2wdUIXJD86RriXqcw3wIOpKcqAcKVXUYU7XKFNFn8y64k1ubhlXK', '2024-04-02 17:38:29'),
(11, 'Odette Mqz', 'ballerinadanzayarte@gmail.com', '$2y$10$S8w1WbOB4yxSG0GbfisoEOkj/YKsia7NIfmaqquiu5Vlm7Fw3lpXC', '2024-07-17 20:02:23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `expenses`
--

CREATE TABLE `expenses` (
  `expense_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  `payment_method` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `expenses`
--

INSERT INTO `expenses` (`expense_id`, `description`, `amount`, `payment_method`, `created_at`) VALUES
(2, 'impermeabilizada', 1300, 'card', '2024-07-22 13:12:39'),
(3, 'pago de la pagina angel', 4700, 'cash', '2024-07-22 13:13:22'),
(4, 'papas', 1200, 'transfer', '2024-07-22 13:13:57'),
(5, 'Ballet Shoes', 1606, 'card', '2024-07-22 15:45:29'),
(6, '\r\nlimpieza / impermeabilizada', 3650, 'card', '2024-07-22 15:46:52'),
(7, 'Gastos Willy / comida', 800, 'cash', '2024-07-22 15:47:21'),
(8, 'Impuestos', 2500, 'cash', '2024-07-22 15:47:44'),
(9, 'Nissan Ford Camioneta', 1166, 'cash', '2024-07-22 19:31:38'),
(10, 'remodelacion', 189, 'card', '2024-07-23 14:01:55'),
(11, 'remodelacion', 272, 'card', '2024-07-23 14:02:32'),
(12, 'remodelacion', 5645, 'card', '2024-07-23 14:03:48'),
(13, 'mtto', 1400, 'card', '2024-07-24 15:43:05'),
(15, 'Pago Suhey Curso Aereo ', 9250, 'cash', '2024-07-26 19:29:53'),
(16, 'Nómina Odette', 1600, 'cash', '2024-07-31 16:34:53'),
(17, 'Pago luz CFE', 6732, 'card', '2024-07-31 16:50:24'),
(18, 'Home Depot Willy', 5046, 'card', '2024-07-31 16:51:02'),
(19, 'Soriana Willy', 172, 'card', '2024-07-31 16:51:20'),
(20, 'COMAPA', 274, 'card', '2024-08-09 16:13:47'),
(21, 'Papeleria Hojas Opalina', 124, 'cash', '2024-08-09 16:15:31'),
(22, 'Nómina Odette', 1600, 'cash', '2024-08-09 18:43:15'),
(23, 'Aguas/gatorade Sandra', 130, 'none', '2024-08-09 18:49:55'),
(24, 'Sillas Evento Aereo', 780, 'cash', '2024-08-24 17:21:06'),
(25, 'Utencilios Jesse Clase Baby Ballet', 298, 'card', '2024-08-24 17:21:39'),
(26, 'Playeras', 2804, 'transfer', '2024-08-24 17:22:00'),
(27, 'Sandra Gatorade/aguas', 114, 'cash', '2024-08-24 17:22:20'),
(28, 'letrero / formato inscripcion', 81, 'cash', '2024-08-26 19:59:14'),
(29, 'Nómina Jaqueline Hinojosa ', 150, 'cash', '2024-08-29 16:50:51'),
(30, 'Nómina Suhey', 500, 'cash', '2024-08-29 19:11:52'),
(31, 'Nómina Odette', 1600, 'cash', '2024-08-29 19:13:56'),
(32, 'Nómina Sandra Limpieza', 750, 'cash', '2024-08-31 11:19:28'),
(33, 'Nómina Sany ', 150, 'cash', '2024-08-31 11:19:46'),
(34, 'Romina Regalo de graduación', 3000, 'cash', '2024-09-03 17:43:52'),
(35, 'Willy Empanadas jaja', 90, 'cash', '2024-09-03 17:44:10'),
(36, 'Nómina Semanal Suhey', 500, 'cash', '2024-09-03 17:46:31'),
(37, 'Nómina Sandra limpieza', 750, 'cash', '2024-09-03 17:47:47'),
(38, 'Nómina Sany teatro musical', 150, 'cash', '2024-09-03 17:49:34'),
(39, 'Nómina Jesse Baby Ballet', 300, 'cash', '2024-09-04 15:57:45'),
(40, 'Nómina Jaqueline Lírico', 150, 'cash', '2024-09-06 15:32:58'),
(41, 'Nómina Odette ', 1600, 'cash', '2024-09-06 15:33:41'),
(42, 'Nómina Julieta', 500, 'cash', '2024-09-06 18:10:35'),
(43, 'Lypro', 148, 'cash', '2024-09-07 11:06:30'),
(44, 'Nómina Suhey Semanal', 500, 'cash', '2024-09-10 17:35:47'),
(45, 'Nómina Sany Teatro M', 150, 'cash', '2024-09-10 17:36:00'),
(46, 'COMAPA agua', 563, 'cash', '2024-09-10 18:28:01'),
(47, 'Odette Nómina', 1600, 'cash', '2024-09-17 15:26:04'),
(48, 'Nómina sandra limpieza', 750, 'cash', '2024-09-17 15:26:26'),
(49, 'Halloween deco', 164, 'cash', '2024-09-17 15:28:02'),
(50, 'Lypro', 179, 'cash', '2024-09-17 16:13:17'),
(51, '\r\n\r\nSuhey nómina', 500, 'cash', '2024-09-17 19:07:11'),
(52, 'Jaqui Nómina', 150, 'cash', '2024-09-20 16:41:57'),
(53, 'Jesse Nómina', 300, 'cash', '2024-09-20 16:42:11'),
(54, 'Jesse Nómina (anterior semana)', 300, 'cash', '2024-09-20 16:43:27'),
(55, 'Pablo Comida de mascotas', 477, 'cash', '2024-09-20 16:43:56'),
(57, '7 Leotardo Lesslie ', 1390, 'cash', '2024-09-21 09:18:27'),
(58, 'Nómina Odette', 1600, 'cash', '2024-09-21 09:18:40'),
(59, 'CFE', 1755, 'card', '2024-09-21 09:31:53'),
(60, 'Nómina Suhey', 500, 'cash', '2024-09-25 19:06:45'),
(61, 'Nómina Jesse', 300, 'cash', '2024-09-25 19:07:06'),
(62, 'Nómina Sany', 150, 'cash', '2024-09-25 19:07:16'),
(64, 'Chuleta Quincena 21 septiembre', 500, 'cash', '2024-09-25 19:44:46'),
(65, 'Pago Playeras + Comisión', 1485, 'cash', '2024-09-27 17:17:36'),
(66, 'Sany teatro Nómina (17 de septiembre)', 150, 'cash', '2024-09-27 18:21:57'),
(67, 'Jaqui Nómina (17 de septiembre)', 150, 'cash', '2024-09-27 18:23:09'),
(68, 'Odette nómina', 1600, 'cash', '2024-09-27 18:24:14'),
(69, 'Suhey Nómina', 500, 'cash', '2024-10-01 18:00:39'),
(71, 'Clase Lírico (cubrió Suhey) 27/09/24', 150, 'cash', '2024-10-01 18:02:39'),
(72, 'Nómina Sany', 150, 'cash', '2024-10-01 18:03:24'),
(73, 'Nómina Jesse', 300, 'cash', '2024-10-02 16:00:33'),
(74, 'Lypro (clips, hojas de máquina & mini sharpie)', 89, 'cash', '2024-10-02 16:01:47'),
(75, 'Nómina Romina\r\n2 quincenas', 1000, 'cash', '2024-10-02 17:59:25'),
(76, 'Foco ', 150, 'cash', '2024-10-03 16:26:51'),
(77, 'Sandra Limpieza', 750, 'cash', '2024-10-03 16:28:50'),
(78, 'Jaqui Nómina 03/10/24', 150, 'cash', '2024-10-07 15:31:31'),
(79, 'Julieta Nómina Quincena 05/10/24', 500, 'cash', '2024-10-07 15:31:58'),
(80, 'Romina Nómina Quincena (05/10/24)', 500, 'cash', '2024-10-07 15:32:21'),
(81, 'Odette Nómina ', 1600, 'cash', '2024-10-07 15:42:34'),
(82, 'Suhey NóminA', 500, 'cash', '2024-10-08 19:51:13'),
(83, 'hojas de máquina Lypro', 120, 'cash', '2024-10-09 16:37:44'),
(84, 'COMAPA agua', 259, 'cash', '2024-10-09 16:46:55'),
(85, 'Nómina Jesse ', 300, 'cash', '2024-10-09 16:50:53'),
(86, 'Nómina Sandra', 150, 'cash', '2024-10-09 16:51:13'),
(87, 'Stand Evento KidsFest', 500, 'transfer', '2024-10-09 16:55:01'),
(88, 'Nómina Sandra Limpieza', 750, 'cash', '2024-10-10 15:55:39'),
(89, 'Nómina  Jaqueline Lírico', 150, 'cash', '2024-10-10 15:56:04'),
(90, 'Nómina Odette', 1600, 'cash', '2024-10-11 15:32:23'),
(91, 'Willy Parisina ', 450, 'card', '2024-10-11 15:32:53'),
(92, 'Willy gastos comex ', 160, 'cash', '2024-10-12 12:35:50'),
(94, 'Papeleria', 300, 'cash', '2024-10-12 12:36:11'),
(96, 'Globos Evento', 1000, 'cash', '2024-10-14 16:19:19'),
(97, 'Flyers 250\r\nDulces 250 2 kg', 500, 'cash', '2024-10-14 16:21:38'),
(98, 'Nomina Jesse', 300, 'cash', '2024-10-16 21:11:36'),
(99, 'Leotardos Lesslie ', 2800, 'transfer', '2024-10-16 21:12:01'),
(100, 'Jaqueline Nómina', 150, 'cash', '2024-10-18 16:03:22'),
(101, 'Nómina Suhey', 500, 'cash', '2024-10-18 16:13:21'),
(102, 'Nómina Sany', 150, 'cash', '2024-10-18 16:13:57'),
(104, 'sandra limpieza', 750, 'cash', '2024-10-18 16:14:30'),
(105, 'Willy gastos 17 oct', 380, 'card', '2024-10-18 16:17:07'),
(106, 'Willy gastos 16 oct', 250, 'card', '2024-10-18 16:17:30'),
(107, 'Odette Nómina ', 1600, 'cash', '2024-10-18 16:18:57'),
(108, 'Playeras Mama pelo azul', 1490, 'cash', '2024-10-19 09:57:20'),
(109, 'Romina Nómina', 500, 'cash', '2024-10-19 10:07:36'),
(110, 'Julieta Nómina', 500, 'cash', '2024-10-19 11:16:54'),
(111, 'Nómina Suhey Aéreo', 500, 'cash', '2024-10-23 16:13:31'),
(112, 'Jesse Nómina', 300, 'cash', '2024-10-23 16:16:07'),
(114, 'Nómina Sany Teatro', 150, 'cash', '2024-10-23 16:16:23'),
(115, 'Nómina Jaqui', 150, 'cash', '2024-10-24 15:47:35'),
(117, 'Dogo\r\nFunda 60 cm\r\nEscoba\r\npapel Craft', 217, 'cash', '2024-10-24 15:50:37'),
(118, 'Notas Comprobantes Willy', 700, 'cash', '2024-10-25 15:43:43'),
(119, 'Nómina Odette', 1600, 'cash', '2024-10-25 15:44:01'),
(120, 'Limpieza Sandra', 750, 'cash', '2024-10-25 15:44:25'),
(122, 'Costurera Payasitos', 5100, 'cash', '2024-10-25 18:19:09'),
(124, 'Playeras mama Arantza', 480, 'cash', '2024-10-28 17:54:24'),
(125, 'Costurera ORALDA \r\n', 5000, 'cash', '2024-10-29 16:28:08'),
(126, 'Telas Material Cascanueces', 800, 'card', '2024-10-29 16:34:41'),
(127, 'Jesse Nómina', 300, 'cash', '2024-10-30 17:21:54'),
(128, 'Gastos Willy (puente de McAllen)', 300, 'cash', '2024-10-30 17:22:15'),
(129, 'Suhey Nómina ', 500, 'cash', '2024-10-30 17:56:52'),
(130, 'Sany Nómina', 150, 'cash', '2024-10-30 18:15:20'),
(131, 'Julieta Nómina', 500, 'cash', '2024-10-30 18:17:04'),
(132, 'Romina Nómina', 500, 'cash', '2024-10-30 18:17:15'),
(133, 'Jaqui Nómina', 150, 'cash', '2024-10-31 17:22:50'),
(134, 'Odette Nómina', 1600, 'cash', '2024-11-04 18:35:27'),
(135, 'Playeras pelo azul', 300, 'cash', '2024-11-04 18:35:57'),
(136, 'Paquete Hojas Pastel', 187, 'cash', '2024-11-05 17:19:37'),
(137, 'Cinta', 12, 'cash', '2024-11-05 19:34:55'),
(138, 'Nómina Suhey', 500, 'cash', '2024-11-05 21:31:50'),
(139, 'Sandra Nómina', 150, 'cash', '2024-11-05 21:32:06'),
(140, 'Jesse Nómina', 300, 'cash', '2024-11-06 20:17:35'),
(141, 'Anticipo Playeras Pelo Azul', 4000, 'cash', '2024-11-06 20:18:21'),
(142, 'Pedido Leotardos', 6106, 'card', '2024-11-06 20:19:26'),
(143, 'Shein', 1500, 'card', '2024-11-06 20:20:16'),
(144, 'Temu', 2325, 'card', '2024-11-06 20:20:41'),
(145, 'Publicidad Facebook', 1000, 'card', '2024-11-06 20:21:09'),
(146, 'Publicidad Instagram', 500, 'cash', '2024-11-06 20:21:36'),
(147, 'Amazon', 150, 'card', '2024-11-06 20:21:49'),
(148, 'Jaqueline Nómina', 150, 'cash', '2024-11-08 17:02:21'),
(149, 'Sandra Limpieza', 750, 'cash', '2024-11-08 17:02:37'),
(150, 'Odette Nómina', 1600, 'cash', '2024-11-08 17:02:49'),
(151, 'Agua', 1588, 'card', '2024-11-08 17:06:19'),
(152, 'Nómina Suhey', 500, 'cash', '2024-11-12 20:57:16'),
(153, 'Nómina Jesse', 300, 'cash', '2024-11-13 16:40:03'),
(154, 'Nómina Sany', 150, 'cash', '2024-11-13 16:40:14'),
(156, 'Izzi Internet - Octubre', 610, 'transfer', '2024-11-14 17:14:48'),
(157, 'Nómina Chuleta ', 500, 'cash', '2024-11-14 18:13:03'),
(158, 'Sandra Limpieza', 750, 'cash', '2024-11-14 18:15:39'),
(159, 'Nómina Odette', 1066, 'cash', '2024-11-14 18:25:35'),
(160, 'Sany 08-10-24', 150, 'cash', '2024-11-14 18:34:19'),
(162, 'Sany Nómina', 150, 'cash', '2024-11-19 19:00:32'),
(163, 'Suhey nómina', 500, 'cash', '2024-11-19 19:03:41'),
(164, 'Jesse (ya se pagaron correspondiente, solo no lo había anotado)\r\n07.10.24\r\n14.10.24\r\n21.10.24\r\n28.10.24', 600, 'cash', '2024-11-19 19:17:12'),
(165, 'Costurera Laura PAYASOS', 5100, 'cash', '2024-11-20 19:36:26'),
(166, 'Costurera Laura RENOS\r\n', 3750, 'cash', '2024-11-20 19:36:55'),
(167, 'Costurera Laura', 1840, 'cash', '2024-11-23 13:27:16'),
(168, 'Nómina Odette + 1 día', 1866, 'cash', '2024-11-23 13:27:49'),
(169, 'Limpieza', 750, 'cash', '2024-11-23 13:28:05'),
(170, 'Romina 11 - 14 sem ', 500, 'cash', '2024-11-23 13:28:51'),
(171, 'Jesse nómina', 300, 'cash', '2024-11-23 13:32:18'),
(172, 'CFE nov', 4546, 'card', '2024-11-25 17:22:55'),
(173, 'Cintas', 97, 'cash', '2024-11-25 17:49:32'),
(174, 'Nómina Julieta', 500, 'cash', '2024-11-25 20:31:37'),
(175, 'Pago playeras', 7450, 'cash', '2024-11-26 19:48:00'),
(176, 'Suhey nómina', 500, 'cash', '2024-11-27 21:01:07'),
(177, 'Sany x 4 días', 600, 'cash', '2024-11-27 21:04:25'),
(178, 'Costurera ORALDA \r\n4000 + 2000 material', 6000, 'cash', '2024-11-27 21:07:57'),
(179, 'Playeras Arantza extras :(', 400, 'cash', '2024-12-02 16:55:28'),
(180, 'Mallas Pinky', 5530, 'card', '2024-12-02 17:51:20'),
(181, 'La chula novedades', 316, 'cash', '2024-12-02 18:35:32'),
(182, 'Marcadores', 68, 'cash', '2024-12-02 18:46:26'),
(183, 'COMAPA agua', 563, 'cash', '2024-12-03 16:42:28'),
(184, 'Jesse x 3días ( sem pasada, esta semana)', 450, 'cash', '2024-12-03 17:17:29'),
(185, 'Romina nómina', 500, 'cash', '2024-12-03 20:40:23'),
(186, 'señora oralda costura\r\npendiente $800\r\npendiente moño muñeca', 16050, 'cash', '2024-12-04 20:07:48'),
(187, 'Julieta nómina', 500, 'cash', '2024-12-13 18:55:33'),
(188, 'Señora Valentina Costurera', 2000, 'cash', '2024-12-13 18:55:47'),
(189, 'La Chinita Moños Payasitos', 219, 'cash', '2024-12-13 18:56:19'),
(190, 'Romina Nómina', 500, 'cash', '2024-12-13 19:01:38'),
(191, 'Nómina Suhey', 250, 'cash', '2025-01-09 17:22:05'),
(192, 'Nómina Sany', 150, 'cash', '2025-01-09 17:22:24'),
(195, 'Nómina Jesse 1 día', 150, 'cash', '2025-01-09 17:49:01'),
(196, 'Nómina Jaqueline x 3 días', 450, 'cash', '2025-01-09 18:18:05'),
(197, 'nómina Odette ', 1600, 'cash', '2025-01-09 18:34:35'),
(198, 'Nómina Sandra limpieza', 1000, 'cash', '2025-01-10 17:30:56'),
(199, 'Papelería pluma', 98, 'cash', '2025-01-13 17:20:31'),
(200, 'Nómina Profe Carmen', 500, 'cash', '2025-01-13 17:24:23'),
(201, 'Nómina Julieta semana anterior', 500, 'cash', '2025-01-13 17:24:55'),
(203, 'COMAPA agua', 1588, 'card', '2025-01-13 19:27:07'),
(204, 'luz CFE', 4546, 'card', '2025-01-13 19:29:09'),
(205, 'Nómina Suhey', 250, 'cash', '2025-01-15 19:57:29'),
(206, 'Nómina Jesse', 300, 'cash', '2025-01-15 19:57:46'),
(207, 'Nómina Odette ', 1600, 'cash', '2025-01-15 19:59:31'),
(208, 'Nómina Profe Cármen', 500, 'cash', '2025-01-17 19:17:13'),
(209, 'Jesse Nómina x 2 \r\n(Cubrió a Miranda)', 300, 'cash', '2025-01-22 17:14:02'),
(210, 'Julieta nómina', 500, 'cash', '2025-01-22 17:35:08'),
(211, 'Papelería Sobres', 36, 'cash', '2025-01-22 17:39:21'),
(212, 'Sandra Limpieza Nómina', 1000, 'cash', '2025-01-23 17:34:27'),
(213, 'Jaqueline Nómina', 150, 'cash', '2025-01-23 17:35:07'),
(214, 'Profe Carmen Nómina', 500, 'cash', '2025-01-24 17:26:46'),
(215, 'Odette Nómina', 1600, 'cash', '2025-01-24 17:27:06'),
(216, 'Romina Nómina', 500, 'cash', '2025-01-27 16:41:59'),
(217, 'Suhey nómina', 250, 'cash', '2025-01-29 17:47:45'),
(218, 'Jesse Nómina', 300, 'cash', '2025-01-29 17:47:57'),
(219, 'Sany Nómina', 150, 'cash', '2025-01-29 17:49:29'),
(220, 'Jaqueline Nómina', 150, 'cash', '2025-01-31 17:07:23'),
(221, 'Sandra limpieza', 1000, 'cash', '2025-01-31 17:07:38'),
(222, 'Profe Carmen Nómina', 500, 'cash', '2025-01-31 17:08:00'),
(223, 'Odette Nómina', 1600, 'cash', '2025-01-31 17:08:21'),
(224, 'Convivio Duritos/etc', 338, 'cash', '2025-01-31 17:08:53'),
(225, 'Suhey Nómina', 250, 'cash', '2025-02-04 19:49:08'),
(226, 'Sany Nómina', 150, 'cash', '2025-02-04 19:49:44'),
(227, 'Jesse Nómina', 300, 'cash', '2025-02-05 18:19:05'),
(228, 'Julieta Nómina', 500, 'cash', '2025-02-05 18:21:58'),
(229, 'Odette Nómina', 1600, 'cash', '2025-02-07 18:13:29'),
(230, 'Sandra limpieza', 1000, 'cash', '2025-02-08 09:59:17'),
(231, 'Profe Carmen Nómina', 500, 'cash', '2025-02-08 09:59:33'),
(232, 'COMAPA', 274, 'cash', '2025-02-10 17:33:49'),
(233, 'Playeras Pedido 1 jazz', 2160, 'cash', '2025-02-10 18:54:42'),
(234, 'Nómina Romina sem pasada 08-02-25', 500, 'cash', '2025-02-14 18:40:07'),
(235, 'Suhey Nómina 11-02-25', 250, 'cash', '2025-02-14 18:40:46'),
(236, 'Sany Nómina 11-02-25', 150, 'cash', '2025-02-14 18:41:10'),
(237, 'Jesse Nómina 12-02-25', 300, 'cash', '2025-02-14 18:41:51'),
(238, 'Jaqueline Nómina', 150, 'cash', '2025-02-14 18:42:33'),
(239, 'Profe Carmen Nómina', 500, 'cash', '2025-02-14 18:42:50'),
(240, 'Convivio San Valentin:\r\n- Galletas: $400\r\n- Globos: $450\r\n- Papas y refrescos: $250\r\n- Decoración: $400\r\n- \r\n', 1500, 'cash', '2025-02-14 18:46:49'),
(241, 'Odette Nómina', 1500, 'cash', '2025-02-14 18:47:08'),
(242, 'pago a Pablo', 2000, 'cash', '2025-02-15 10:20:24'),
(243, 'Suhey Nómina', 250, 'cash', '2025-02-19 18:19:24'),
(244, 'Jesse Nómina', 150, 'cash', '2025-02-19 18:25:02'),
(245, 'Julieta Nómina', 500, 'cash', '2025-02-19 18:30:17'),
(246, 'Odette Nómina', 1600, 'cash', '2025-02-19 20:37:14'),
(247, 'Sany NóminA', 150, 'cash', '2025-02-20 17:32:13'),
(248, 'Aseo externo', 300, 'cash', '2025-02-20 17:33:10'),
(249, 'Jaqueline Nómina', 150, 'cash', '2025-02-20 17:33:28'),
(250, 'Profe Carmen Nómina', 500, 'cash', '2025-02-21 20:58:52'),
(251, '4 Leotardos bordados', 1100, 'cash', '2025-02-21 21:00:07'),
(252, 'Romina Nómina', 500, 'cash', '2025-02-22 10:10:07'),
(253, 'playeras Arantza', 1430, 'cash', '2025-02-24 20:12:48'),
(254, 'Nómina Suhey', 250, 'cash', '2025-02-26 20:49:23'),
(255, 'Nómina Sany', 150, 'cash', '2025-02-26 20:49:53'),
(256, 'Nómina Jesse', 300, 'cash', '2025-02-26 20:50:03'),
(257, 'Jaqueline Nómina', 150, 'cash', '2025-02-28 18:14:10'),
(258, 'Nómina Pablo', 2000, 'cash', '2025-02-28 18:14:24'),
(259, 'Aseo Sandra limpieza Nómina', 1000, 'cash', '2025-02-28 18:14:44'),
(260, 'Nómina Profe Carmen', 500, 'cash', '2025-02-28 18:15:02'),
(261, 'Nómina Odette', 1600, 'transfer', '2025-03-01 11:51:15'),
(262, 'Productos de limpieza', 500, 'cash', '2025-03-05 18:11:51'),
(263, 'COMAPA casa willy', 522, 'cash', '2025-03-05 18:12:08'),
(264, 'Nómina Suhey ', 250, 'cash', '2025-03-06 18:12:10'),
(265, 'Nómina Sany', 150, 'cash', '2025-03-06 18:12:20'),
(266, 'Nómina Jesse', 300, 'cash', '2025-03-06 18:12:39'),
(267, 'Nómina Julieta', 500, 'cash', '2025-03-06 18:12:55'),
(268, 'Nómina Jaqueline', 150, 'cash', '2025-03-06 18:13:08'),
(269, 'Nómina Romina', 500, 'cash', '2025-03-06 18:14:13'),
(270, 'Nómina profe Carmen', 500, 'cash', '2025-03-06 18:19:55'),
(271, 'Nómina Romina', 500, 'cash', '2025-03-08 11:44:54'),
(272, 'Nómina Odette', 1600, 'cash', '2025-03-08 11:45:05'),
(273, 'Publicidad jesucristo', 320, 'cash', '2025-03-08 11:46:02'),
(274, 'COMAPA Ballerina', 274, 'cash', '2025-03-11 16:40:05'),
(275, 'Jesse Nómina (1 día)', 150, 'cash', '2025-03-12 17:23:23'),
(276, 'Suhey Nómina', 250, 'cash', '2025-03-12 17:23:34'),
(277, 'Sany Nómina', 150, 'cash', '2025-03-12 17:23:49'),
(278, 'Nómina profe Carmen 14-03-25', 500, 'cash', '2025-03-20 16:20:45'),
(279, 'Nómina Odette 15-03-25', 1600, 'cash', '2025-03-20 16:21:31'),
(280, 'Limpieza sem pasada 14-03-2025', 1000, 'cash', '2025-03-20 16:21:59'),
(281, 'Jesse Nómina 1 día', 150, 'cash', '2025-03-20 16:22:18'),
(282, 'Suhey Nómina 18-03-2025', 250, 'cash', '2025-03-20 16:23:26'),
(283, 'Sany Nómina', 150, 'cash', '2025-03-20 16:25:25'),
(284, 'Julieta nómina', 500, 'cash', '2025-03-20 16:34:07'),
(285, 'Limpieza', 1000, 'cash', '2025-03-20 17:25:07'),
(286, 'PLAYERAS MIKE', 3238, 'transfer', '2025-03-20 17:27:11'),
(287, 'Odette nómina', 1600, 'cash', '2025-03-22 08:54:04'),
(288, 'profe carmen 21-03-25', 500, 'cash', '2025-03-24 18:15:23'),
(289, 'Romina 22-03-25', 500, 'card', '2025-03-24 18:15:58'),
(290, 'PLAYERAS PAGADAS', 1280, 'cash', '2025-03-24 18:17:43'),
(291, 'LYPRO', 147, 'cash', '2025-03-24 18:18:24'),
(292, 'Suhey', 250, 'cash', '2025-03-31 17:52:16'),
(293, 'Sany última nómina', 150, 'cash', '2025-03-31 17:52:33'),
(294, 'Jesse Nómina', 300, 'cash', '2025-03-31 17:52:49'),
(295, 'Odette nómina último mes 4 días', 1066, 'cash', '2025-03-31 17:54:35'),
(296, 'nómina suhey', 250, 'cash', '2025-04-02 17:09:58'),
(297, 'Sany nómina', 150, 'cash', '2025-04-02 17:10:22'),
(298, 'Jesse nómina', 150, 'cash', '2025-04-02 17:10:43'),
(299, 'Julieta nómina', 500, 'cash', '2025-04-02 17:12:06'),
(300, 'Jaqui última nómina antes vacaciones', 150, 'cash', '2025-04-08 18:39:54'),
(301, 'Suhey nómina ', 250, 'cash', '2025-04-08 18:40:16'),
(302, 'Sany nómina', 150, 'cash', '2025-04-08 18:40:26'),
(303, 'Jesse nómina', 300, 'cash', '2025-04-08 18:40:39'),
(304, 'agua comapa', 288, 'cash', '2025-04-08 18:41:29'),
(305, 'Odette nómina', 1600, 'cash', '2025-04-08 18:41:53'),
(306, 'Jaqueline nómina', 150, 'cash', '2025-04-10 17:44:24'),
(307, 'limpieza nómina', 1000, 'cash', '2025-04-10 17:45:02'),
(308, 'gastos limpieza', 487, 'cash', '2025-04-10 17:46:01'),
(309, 'HEB aromatizante', 68, 'cash', '2025-04-10 17:46:34'),
(310, 'City Club amenidades Masterclass Lola & Laura Cortez', 600, 'cash', '2025-04-10 17:47:32'),
(311, 'nómina Jesse', 300, 'cash', '2025-04-30 17:55:58');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `installments`
--

CREATE TABLE `installments` (
  `installment_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `transaction_id` varchar(255) NOT NULL,
  `concept` varchar(255) NOT NULL,
  `type` varchar(50) NOT NULL,
  `total` double NOT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `installments`
--

INSERT INTO `installments` (`installment_id`, `student_id`, `transaction_id`, `concept`, `type`, `total`, `payment_method`, `created_at`) VALUES
(302, 80, 'En sucursal', 'Pago de mensualidad: LUNES A VIERNES  - Abril 2024', 'monthly_fee', 600, NULL, '2024-04-02 15:47:13'),
(304, 79, 'En sucursal', 'Pago de mensualidad: HERMANOS LUNES A VIERNES  - Abril 2024', 'monthly_fee', 1400, NULL, '2024-04-02 15:47:56'),
(305, 61, 'En sucursal', 'Pago de mensualidad: LUNES A VIERNES  - Abril 2024', 'monthly_fee', 800, NULL, '2024-04-02 15:58:48'),
(306, 63, 'En sucursal', 'Pago de mensualidad: LUNES A VIERNES  - Abril 2024', 'monthly_fee', 600, NULL, '2024-04-02 15:59:05'),
(307, 61, 'En sucursal', 'SHREK', 'product', 800, NULL, '2024-04-02 17:08:37'),
(310, 84, 'En sucursal', 'Pago de mensualidad: LUNES A VIERNES  - Abril 2024', 'monthly_fee', 800, NULL, '2024-04-03 16:54:38'),
(316, 49, 'En sucursal', 'Pago de mensualidad: LUNES A VIERNES  - Abril 2024', 'monthly_fee', 800, NULL, '2024-04-05 14:59:46'),
(317, 110, 'En sucursal', 'Pago de mensualidad: LUNES A VIERNES  - Abril 2024', 'monthly_fee', 700, NULL, '2024-04-05 15:02:29'),
(318, 21, 'En sucursal', 'Pago de mensualidad: LUNES A VIERNES  - Abril 2024', 'monthly_fee', 800, NULL, '2024-04-05 15:02:50'),
(319, 31, 'En sucursal', 'Pago de mensualidad: LUNES A VIERNES  - Abril 2024', 'monthly_fee', 800, NULL, '2024-04-05 16:05:50'),
(320, 52, 'En sucursal', 'Pago de mensualidad: SABATINO - Abril 2024', 'monthly_fee', 600, NULL, '2024-04-08 14:55:17'),
(321, 19, 'En sucursal', 'Pago de mensualidad: SABATINO - Abril 2024', 'monthly_fee', 600, NULL, '2024-04-08 14:56:38'),
(323, 16, 'En sucursal', 'Pago de mensualidad: LUNES A VIERNES  - Abril 2024', 'monthly_fee', 850, NULL, '2024-04-08 18:01:07'),
(324, 28, 'En sucursal', 'Pago de mensualidad: LUNES A VIERNES  - Abril 2024', 'monthly_fee', 850, NULL, '2024-04-15 15:01:40'),
(327, 50, 'En sucursal', 'Pago de mensualidad: LUNES A VIERNES  - Abril 2024', 'monthly_fee', 800, NULL, '2024-04-15 15:02:27'),
(328, 21, 'En sucursal', 'SHREK', 'product', 2400, NULL, '2024-04-15 15:02:47'),
(331, 65, 'En sucursal', 'Pago de mensualidad: LUNES A VIERNES  - Abril 2024', 'monthly_fee', 800, NULL, '2024-04-15 15:03:26'),
(332, 33, 'En sucursal', 'Pago de mensualidad: HERMANOS LUNES A VIERNES  - Abril 2024', 'monthly_fee', 1400, NULL, '2024-04-15 15:03:39'),
(333, 62, 'En sucursal', 'Pago de mensualidad: SABATINO - Abril 2024', 'monthly_fee', 600, NULL, '2024-04-15 15:04:13'),
(334, 113, 'En sucursal', 'Pago de mensualidad: LUNES A VIERNES  - Abril 2024', 'monthly_fee', 800, NULL, '2024-04-17 17:21:17'),
(341, 79, 'En sucursal', 'SHREK', 'product', 3400, NULL, '2024-04-17 17:24:09'),
(342, 29, 'En sucursal', 'SHREK', 'product', 2500, NULL, '2024-04-17 17:37:23'),
(345, 116, 'En sucursal', 'Pago de mensualidad: LUNES A VIERNES  - Abril 2024', 'monthly_fee', 700, NULL, '2024-04-18 14:37:54'),
(347, 61, 'En sucursal', 'SHREK', 'product', 500, NULL, '2024-04-18 16:01:30'),
(351, 63, 'En sucursal', 'SHREK', 'product', 2500, NULL, '2024-04-22 15:15:37'),
(352, 95, 'En sucursal', 'SHREK', 'product', 2500, NULL, '2024-04-22 15:15:56'),
(354, 37, 'En sucursal', 'Pago de mensualidad: SABATINO - Abril 2024', 'monthly_fee', 600, NULL, '2024-04-22 15:16:27'),
(355, 52, 'En sucursal', 'SHREK', 'product', 1000, NULL, '2024-04-22 15:16:45'),
(358, 88, 'En sucursal', 'Pago de mensualidad: LUNES A VIERNES  - Abril 2024', 'monthly_fee', 800, NULL, '2024-04-25 15:51:56'),
(360, 32, 'En sucursal', 'Pago de mensualidad: LUNES A VIERNES  - Abril 2024', 'monthly_fee', 800, NULL, '2024-05-02 15:21:22'),
(363, 37, 'En sucursal', 'SHREK', 'product', 3000, NULL, '2024-05-22 16:08:22'),
(364, 80, 'En sucursal', 'SHREK', 'product', 1000, NULL, '2024-05-22 16:08:48'),
(365, 0, 'En sucursal', '', 'product', 460, NULL, '2024-08-05 17:47:26'),
(366, 0, 'En sucursal', '', 'product', 300, NULL, '2024-08-07 17:01:49'),
(367, 0, 'En sucursal', '', 'product', 300, NULL, '2024-08-09 18:18:45'),
(368, 0, 'En sucursal', '', 'product', 460, NULL, '2024-08-09 18:20:17'),
(369, 0, 'En sucursal', '', 'product', 300, NULL, '2024-08-09 18:22:11'),
(370, 0, 'En sucursal', '', 'product', 300, NULL, '2024-08-09 19:19:52'),
(371, 0, 'En sucursal', '', 'product', 450, NULL, '2024-08-26 19:58:15'),
(372, 0, 'En sucursal', '', 'product', 450, NULL, '2024-08-28 19:34:13'),
(373, 0, 'En sucursal', '', 'product', 1210, NULL, '2024-08-28 19:34:43'),
(374, 0, 'En sucursal', '', 'product', 300, NULL, '2024-08-28 19:35:28'),
(377, 137, 'En sucursal', 'Pago de mensualidad: LUNES  -  JUEVES Septiembre', 'monthly_fee', 800, NULL, '2024-09-01 19:48:07'),
(379, 16, 'En sucursal', 'Pago de mensualidad: LUNES  -  JUEVES Septiembre', 'monthly_fee', 800, NULL, '2024-09-02 16:28:07'),
(386, 138, 'En sucursal', 'Pago de mensualidad: LUNES  -  JUEVES Septiembre', 'monthly_fee', 800, NULL, '2024-09-02 16:36:34'),
(387, 140, 'En sucursal', 'Pago de mensualidad: 1 Disciplina / Clase - Septiembre 2024', 'monthly_fee', 600, NULL, '2024-09-02 16:56:59'),
(388, 84, 'En sucursal', 'Pago de mensualidad: 1 Disciplina / Clase - Septiembre 2024', 'monthly_fee', 700, NULL, '2024-09-02 17:04:52'),
(390, 28, 'En sucursal', 'Pago de mensualidad: LUNES  -  JUEVES Septiembre', 'monthly_fee', 800, NULL, '2024-09-02 17:19:32'),
(393, 90, 'En sucursal', 'Pago de mensualidad: 1 Disciplina / Clase - Septiembre 2024', 'monthly_fee', 600, NULL, '2024-09-02 18:13:52'),
(399, 146, 'En sucursal', 'Pago de mensualidad: LUNES  -  JUEVES Septiembre', 'monthly_fee', 800, NULL, '2024-09-03 16:08:36'),
(403, 65, 'En sucursal', 'Pago de mensualidad: LUNES  -  JUEVES Septiembre', 'monthly_fee', 800, NULL, '2024-09-03 16:36:51'),
(404, 0, 'En sucursal', 'Punteras - externo', 'product', 200, NULL, '2024-09-03 16:43:16'),
(406, 63, 'En sucursal', 'Pago de mensualidad: 1 Disciplina / Clase - Septiembre 2024', 'monthly_fee', 600, NULL, '2024-09-03 18:35:14'),
(407, 21, 'En sucursal', 'Pago de mensualidad: LUNES  -  JUEVES Septiembre', 'monthly_fee', 800, NULL, '2024-09-04 18:48:15'),
(408, 113, 'En sucursal', 'Pago de mensualidad: LUNES  -  JUEVES Septiembre', 'monthly_fee', 800, NULL, '2024-09-04 18:49:13'),
(409, 22, 'En sucursal', 'Pago de mensualidad: LUNES  -  JUEVES Septiembre', 'monthly_fee', 800, NULL, '2024-09-04 19:09:32'),
(410, 138, 'En sucursal', 'Playera XL mujer', 'product', 350, NULL, '2024-09-04 19:18:13'),
(414, 88, 'En sucursal', 'Pago de mensualidad: LUNES  -  JUEVES Septiembre', 'monthly_fee', 800, NULL, '2024-09-05 16:00:40'),
(415, 61, 'En sucursal', 'Pago de mensualidad: LUNES  -  JUEVES Septiembre', 'monthly_fee', 800, NULL, '2024-09-05 16:05:29'),
(416, 32, 'En sucursal', 'Pago de mensualidad: HERMANOS L - J Septiembre', 'monthly_fee', 1200, NULL, '2024-09-05 16:25:19'),
(417, 29, 'En sucursal', 'Pago de mensualidad: LUNES  -  JUEVES Septiembre', 'monthly_fee', 800, NULL, '2024-09-05 16:57:20'),
(419, 49, 'En sucursal', 'Pago de mensualidad: LUNES  -  JUEVES Septiembre', 'monthly_fee', 600, NULL, '2024-09-05 18:45:53'),
(421, 151, 'En sucursal', 'Ballerinas', 'product', 450, NULL, '2024-09-06 15:52:55'),
(423, 137, 'En sucursal', 'Mallas', 'product', 300, NULL, '2024-09-06 16:21:11'),
(427, 19, 'En sucursal', 'Pago de mensualidad: 1 Disciplina / Clase - Septiembre 2024', 'monthly_fee', 600, NULL, '2024-09-07 09:13:07'),
(429, 154, 'En sucursal', 'Pago de mensualidad: HERMANOS 1 DISCIPLINA - Septiembre 2024', 'monthly_fee', 1200, NULL, '2024-09-07 10:06:08'),
(430, 155, 'En sucursal', 'Leotardo', 'product', 460, NULL, '2024-09-07 10:24:47'),
(431, 156, 'En sucursal', 'Pago de mensualidad: 1 Disciplina / Clase - Septiembre 2024', 'monthly_fee', 600, NULL, '2024-09-09 16:31:42'),
(435, 158, 'En sucursal', '1 mallas\r\n1 falda', 'product', 600, NULL, '2024-09-09 18:10:14'),
(437, 159, 'En sucursal', 'Pago de mensualidad: 1 Disciplina / Clase - Septiembre 2024', 'monthly_fee', 600, NULL, '2024-09-09 18:33:27'),
(439, 31, 'En sucursal', 'Pago de mensualidad: 1 Disciplina / Clase - Septiembre 2024', 'monthly_fee', 600, NULL, '2024-09-10 17:33:59'),
(440, 30, 'En sucursal', 'Pago de mensualidad: 1 Disciplina / Clase - Septiembre 2024', 'monthly_fee', 300, NULL, '2024-09-10 18:44:42'),
(443, 153, 'En sucursal', 'Pago de mensualidad: HERMANOS 1 DISCIPLINA - Septiembre 2024', 'monthly_fee', 1000, NULL, '2024-09-11 18:01:46'),
(444, 58, 'En sucursal', 'Pago de mensualidad: 1 Disciplina / Clase - Septiembre 2024', 'monthly_fee', 600, NULL, '2024-09-11 18:02:26'),
(446, 16, 'En sucursal', '1 Mallas', 'product', 300, NULL, '2024-09-11 18:24:18'),
(447, 52, 'En sucursal', 'Pago de mensualidad: LUNES  -  JUEVES Septiembre', 'monthly_fee', 800, NULL, '2024-09-14 09:02:56'),
(448, 0, 'En sucursal', 'Ballerinas 14 de sept (sabad)', 'product', 450, NULL, '2024-09-17 15:21:55'),
(449, 0, 'En sucursal', 'Puntas 1/2', 'product', 1000, NULL, '2024-09-17 15:22:13'),
(450, 155, 'En sucursal', 'Pago de mensualidad: 1 Disciplina / Clase - Septiembre 2024', 'monthly_fee', 600, NULL, '2024-09-18 15:45:17'),
(456, 0, 'En sucursal', 'Ballerinas externo', 'product', 450, NULL, '2024-09-18 17:00:20'),
(457, 37, 'En sucursal', 'Pago de mensualidad: 1 Disciplina / Clase - Septiembre 2024', 'monthly_fee', 600, NULL, '2024-09-18 17:02:15'),
(458, 146, 'En sucursal', '1 mallas', 'product', 300, NULL, '2024-09-18 18:21:19'),
(460, 95, 'En sucursal', 'Pago de mensualidad: LUNES  -  JUEVES Septiembre', 'monthly_fee', 700, NULL, '2024-09-19 18:35:02'),
(465, 80, 'En sucursal', 'Pago de mensualidad: HERMANOS L - J Septiembre', 'monthly_fee', 800, NULL, '2024-09-21 10:30:07'),
(467, 163, 'En sucursal', 'Pago de mensualidad: HERMANOS 1 DISCIPLINA - Septiembre 2024', 'monthly_fee', 250, NULL, '2024-09-23 15:06:27'),
(473, 146, 'En sucursal', 'BALLERINAS', 'product', 450, NULL, '2024-09-23 18:23:21'),
(476, 0, 'En sucursal', 'puntas 1/2\r\npend. $200', 'product', 800, NULL, '2024-09-25 16:33:57'),
(478, 146, 'En sucursal', 'ballerinas para ella :-)', 'product', 450, NULL, '2024-09-25 16:37:09'),
(479, 162, 'En sucursal', 'Pago de mensualidad: HERMANOS L - J Septiembre', 'monthly_fee', 700, NULL, '2024-09-25 19:08:03'),
(483, 21, 'En sucursal', 'playera jazz', 'product', 350, NULL, '2024-09-27 17:40:11'),
(485, 165, 'En sucursal', 'Pago de mensualidad: HERMANOS 1 DISCIPLINA - Septiembre 2024', 'monthly_fee', 250, NULL, '2024-09-27 19:36:59'),
(486, 62, 'En sucursal', 'Pago de mensualidad: 1 Disciplina / Clase - Septiembre 2024', 'monthly_fee', 600, NULL, '2024-09-28 09:21:53'),
(487, 163, 'En sucursal', 'ballerinas', 'product', 450, NULL, '2024-09-28 09:57:25'),
(490, 163, 'En sucursal', 'mallas', 'product', 300, NULL, '2024-09-28 10:07:14'),
(492, 165, 'En sucursal', 'mallas', 'product', 300, NULL, '2024-09-28 10:07:31'),
(493, 62, 'En sucursal', 'abono puntas pend. $600', 'product', 1400, NULL, '2024-09-28 11:10:59'),
(494, 116, 'En sucursal', 'Pago de mensualidad: LUNES  -  JUEVES Septiembre', 'monthly_fee', 800, NULL, '2024-09-28 12:07:47'),
(495, 50, 'En sucursal', 'Pago de mensualidad: 1 Disciplina / Clase - Septiembre 2024', 'monthly_fee', 600, NULL, '2024-09-30 16:51:25'),
(502, 80, 'En sucursal', 'Pago de mensualidad: LUNES  -  JUEVES Octubre', 'monthly_fee', 800, NULL, '2024-10-01 16:10:59'),
(504, 65, 'En sucursal', 'Pago de mensualidad: LUNES  -  JUEVES Octubre', 'monthly_fee', 800, NULL, '2024-10-01 16:51:05'),
(505, 140, 'En sucursal', 'Pago de mensualidad: LUNES  -  JUEVES Octubre', 'monthly_fee', 600, NULL, '2024-10-01 17:37:41'),
(506, 33, 'En sucursal', 'mallas', 'product', 300, NULL, '2024-10-01 17:56:54'),
(507, 138, 'En sucursal', 'Ballerinas', 'product', 450, NULL, '2024-10-01 18:56:39'),
(508, 22, 'En sucursal', 'Pago de mensualidad: LUNES  -  JUEVES Octubre', 'monthly_fee', 800, NULL, '2024-10-02 15:37:27'),
(511, 50, 'En sucursal', 'Pago de mensualidad: LUNES  -  JUEVES Octubre', 'monthly_fee', 800, NULL, '2024-10-02 16:44:50'),
(515, 84, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Octubre 2024', 'monthly_fee', 600, NULL, '2024-10-02 17:07:52'),
(516, 28, 'En sucursal', 'Pago de mensualidad: LUNES  -  JUEVES Octubre', 'monthly_fee', 800, NULL, '2024-10-02 17:08:29'),
(518, 28, 'En sucursal', 'falda ballet', 'product', 300, NULL, '2024-10-02 17:08:45'),
(521, 119, 'En sucursal', 'Pago de mensualidad: LUNES  -  JUEVES Septiembre', 'monthly_fee', 800, NULL, '2024-10-02 18:24:09'),
(522, 156, 'En sucursal', 'Pago de mensualidad: LUNES  -  JUEVES Octubre', 'monthly_fee', 700, NULL, '2024-10-02 18:30:34'),
(523, 0, 'En sucursal', 'mallas - externo', 'product', 300, NULL, '2024-10-02 19:54:31'),
(524, 61, 'En sucursal', 'Pago de mensualidad: LUNES  -  JUEVES Octubre', 'monthly_fee', 800, NULL, '2024-10-03 16:29:09'),
(525, 21, 'En sucursal', 'Pago de mensualidad: LUNES  -  JUEVES Octubre', 'monthly_fee', 800, NULL, '2024-10-03 17:27:01'),
(539, 62, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Octubre 2024', 'monthly_fee', 600, NULL, '2024-10-05 09:11:57'),
(540, 90, 'En sucursal', 'Pago de mensualidad: LUNES  -  JUEVES Octubre', 'monthly_fee', 800, NULL, '2024-10-05 09:13:52'),
(541, 52, 'En sucursal', 'Pago de mensualidad: LUNES  -  JUEVES Octubre', 'monthly_fee', 800, NULL, '2024-10-05 09:16:19'),
(542, 116, 'En sucursal', 'Pago de mensualidad: LUNES  -  JUEVES Octubre', 'monthly_fee', 800, NULL, '2024-10-05 09:18:25'),
(543, 155, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Octubre 2024', 'monthly_fee', 600, NULL, '2024-10-05 09:20:00'),
(546, 30, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Octubre 2024', 'monthly_fee', 300, NULL, '2024-10-05 09:32:51'),
(548, 63, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Octubre 2024', 'monthly_fee', 600, NULL, '2024-10-05 09:36:08'),
(551, 153, 'En sucursal', 'Pago de mensualidad: HERMANOS 1 disciplina  SAB - Octubre 2024', 'monthly_fee', 1000, NULL, '2024-10-05 10:15:45'),
(552, 21, 'En sucursal', 'puntas', 'product', 2000, NULL, '2024-10-05 10:40:23'),
(557, 37, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Octubre 2024', 'monthly_fee', 600, NULL, '2024-10-05 11:45:28'),
(564, 113, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Octubre 2024', 'monthly_fee', 600, NULL, '2024-10-07 20:09:11'),
(565, 29, 'En sucursal', 'Pago de mensualidad: LUNES  -  JUEVES Octubre', 'monthly_fee', 850, NULL, '2024-10-08 15:43:17'),
(566, 88, 'En sucursal', 'Pago de mensualidad: LUNES  -  JUEVES Octubre', 'monthly_fee', 850, NULL, '2024-10-08 16:16:47'),
(569, 171, 'En sucursal', 'Pago de mensualidad: LUNES  -  JUEVES Octubre', 'monthly_fee', 1300, NULL, '2024-10-08 16:28:21'),
(570, 158, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Octubre 2024', 'monthly_fee', 600, NULL, '2024-10-08 16:29:10'),
(571, 89, 'En sucursal', 'Pago de mensualidad: LUNES  -  JUEVES Septiembre', 'monthly_fee', 800, NULL, '2024-10-09 18:58:35'),
(572, 110, 'En sucursal', 'Ballerinas', 'product', 450, NULL, '2024-10-09 19:09:40'),
(573, 62, 'En sucursal', 'Puntas liquidado', 'product', 600, NULL, '2024-10-09 19:11:01'),
(574, 28, 'En sucursal', 'Abono vestuario', 'product', 1000, NULL, '2024-10-10 15:56:59'),
(575, 146, 'En sucursal', 'Pago de mensualidad: LUNES  -  JUEVES Octubre', 'monthly_fee', 800, NULL, '2024-10-10 17:15:45'),
(577, 138, 'En sucursal', 'Pago de mensualidad: LUNES  -  JUEVES Octubre', 'monthly_fee', 800, NULL, '2024-10-10 17:19:30'),
(579, 154, 'En sucursal', 'Pago de mensualidad: HERMANOS L - J  Octubre', 'monthly_fee', 1200, NULL, '2024-10-10 17:22:50'),
(580, 16, 'En sucursal', 'Pago de mensualidad: LUNES  -  JUEVES Octubre', 'monthly_fee', 850, NULL, '2024-10-10 17:32:57'),
(581, 174, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Octubre 2024', 'monthly_fee', 600, NULL, '2024-10-10 18:00:27'),
(582, 62, 'En sucursal', 'Mallas', 'product', 300, NULL, '2024-10-11 16:43:10'),
(583, 61, 'En sucursal', 'Abono Vestuario TRANSF', 'product', 500, NULL, '2024-10-11 16:45:36'),
(584, 16, 'En sucursal', 'Abono Vestuario ', 'product', 500, NULL, '2024-10-11 16:46:36'),
(586, 89, 'En sucursal', 'Pago de mensualidad: LUNES  -  JUEVES Octubre', 'monthly_fee', 800, NULL, '2024-10-11 16:53:57'),
(587, 89, 'En sucursal', 'Abono a vestuario', 'product', 500, NULL, '2024-10-11 16:54:22'),
(589, 137, 'En sucursal', 'Anticipo Vestuario', 'product', 500, NULL, '2024-10-11 17:04:20'),
(590, 63, 'En sucursal', 'Anticipo Vestuario', 'product', 500, NULL, '2024-10-11 17:08:22'),
(591, 90, 'En sucursal', 'Abono Vestuario Anticipo', 'product', 500, NULL, '2024-10-11 17:18:39'),
(592, 154, 'En sucursal', 'Abonos puntas 1/2 ', 'product', 2000, NULL, '2024-10-11 17:23:07'),
(593, 173, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Octubre 2024', 'monthly_fee', 600, NULL, '2024-10-11 17:27:41'),
(594, 173, 'En sucursal', 'Abono Vestuario', 'product', 500, NULL, '2024-10-11 17:30:02'),
(595, 19, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Octubre 2024', 'monthly_fee', 600, NULL, '2024-10-12 09:18:15'),
(601, 22, 'En sucursal', 'Anticipo Vestuario', 'product', 500, NULL, '2024-10-14 16:08:23'),
(603, 50, 'En sucursal', 'Anticipo Ambas Cas&Gri', 'product', 500, NULL, '2024-10-14 16:45:51'),
(604, 138, 'En sucursal', '1 playera pend.\r\n1 mallas\r\n1 falda \r\n1 anticipo', 'product', 1250, NULL, '2024-10-14 19:33:38'),
(605, 88, 'En sucursal', 'Anticipo Vestuario Grinch', 'product', 500, NULL, '2024-10-15 15:50:43'),
(606, 31, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Octubre 2024', 'monthly_fee', 300, NULL, '2024-10-15 15:54:00'),
(607, 39, 'En sucursal', 'Puntas Abono 1/4', 'product', 500, NULL, '2024-10-15 16:09:37'),
(608, 52, 'En sucursal', 'Anticipo Vestuario Cascanueces', 'product', 500, NULL, '2024-10-15 17:59:41'),
(615, 171, 'En sucursal', 'Mallas unitalla', 'product', 300, NULL, '2024-10-16 16:30:27'),
(616, 83, 'En sucursal', 'Anticipo Vestuario Grinch', 'product', 500, NULL, '2024-10-16 16:55:55'),
(618, 154, 'En sucursal', 'Puntas liquidado 2/2', 'product', 2000, NULL, '2024-10-16 17:16:44'),
(620, 95, 'En sucursal', 'Pago de mensualidad: LUNES  -  JUEVES Octubre', 'monthly_fee', 700, NULL, '2024-10-16 19:28:49'),
(621, 30, 'En sucursal', 'Anticipo Vestuario', 'product', 500, NULL, '2024-10-16 19:44:47'),
(623, 71, 'En sucursal', 'Anticipo Vestuario Cascanueces', 'product', 500, NULL, '2024-10-16 21:16:30'),
(624, 154, 'En sucursal', 'Anticipo Vestuario\r\n500 c/u', 'product', 1000, NULL, '2024-10-16 21:17:26'),
(625, 33, 'En sucursal', 'Anticipo Vestuario', 'product', 500, NULL, '2024-10-16 21:19:16'),
(627, 80, 'En sucursal', 'Anticipo Vestuario\r\n500 c/u', 'product', 1000, NULL, '2024-10-16 21:20:20'),
(628, 29, 'En sucursal', 'Anticipo Vestuario \r\nAmbas', 'product', 500, NULL, '2024-10-16 21:22:05'),
(629, 65, 'En sucursal', 'Anticipo Vestuario \r\nGrinch', 'product', 500, NULL, '2024-10-16 21:22:56'),
(630, 37, 'En sucursal', 'Anticipo Vestuario\r\nAmbas', 'product', 500, NULL, '2024-10-16 21:23:43'),
(632, 21, 'En sucursal', 'Anticipo vestuario\r\nAmbas', 'product', 500, NULL, '2024-10-16 21:26:20'),
(633, 158, 'En sucursal', 'Pago de mensualidad: 1 Disciplina / Clase - Septiembre 2024', 'monthly_fee', 600, NULL, '2024-10-16 21:39:52'),
(634, 158, 'En sucursal', 'Anticipo Vestuario', 'product', 500, NULL, '2024-10-16 21:40:24'),
(635, 116, 'En sucursal', 'Anticipo Vestuario\r\nCascanueces', 'product', 500, NULL, '2024-10-16 21:41:05'),
(637, 21, 'En sucursal', 'Abono Vestuario ', 'product', 1000, NULL, '2024-10-18 18:37:26'),
(638, 179, 'En sucursal', 'Anticipo Vestuario', 'product', 500, NULL, '2024-10-19 09:30:22'),
(639, 155, 'En sucursal', 'Anticipo de vestuario SAB cascanueces', 'product', 500, NULL, '2024-10-21 16:25:40'),
(640, 156, 'En sucursal', 'Kit de uniforme', 'product', 1100, NULL, '2024-10-21 16:26:35'),
(642, 185, 'En sucursal', 'kit uniforme', 'product', 1100, NULL, '2024-10-21 19:22:44'),
(645, 185, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Octubre 2024', 'monthly_fee', 600, NULL, '2024-10-21 19:27:18'),
(647, 37, 'En sucursal', '1 falda', 'product', 300, NULL, '2024-10-21 19:53:16'),
(654, 171, 'En sucursal', '1 playera jazz', 'product', 350, NULL, '2024-10-21 20:01:42'),
(659, 119, 'En sucursal', 'Pago de mensualidad: LUNES  -  JUEVES Octubre', 'monthly_fee', 800, NULL, '2024-10-22 16:27:35'),
(661, 119, 'En sucursal', 'playera jazz', 'product', 350, NULL, '2024-10-22 16:27:51'),
(663, 16, 'En sucursal', 'playera jazz', 'product', 350, NULL, '2024-10-22 18:32:13'),
(681, 0, 'En sucursal', '1 playera jazz externa', 'product', 350, NULL, '2024-10-23 18:43:27'),
(682, 190, 'En sucursal', 'Pago de mensualidad: LUNES  -  JUEVES Octubre', 'monthly_fee', 800, NULL, '2024-10-23 18:49:59'),
(684, 190, 'En sucursal', 'Anticipo Vestuario Ambos', 'product', 500, NULL, '2024-10-23 18:51:55'),
(688, 190, 'En sucursal', '1 Ballerinas', 'product', 450, NULL, '2024-10-23 19:14:50'),
(691, 171, 'En sucursal', 'Ballerinas Jazz', 'product', 450, NULL, '2024-10-25 16:43:22'),
(693, 119, 'En sucursal', 'Anticipo Falda 1/2 pend. $200', 'product', 100, NULL, '2024-10-25 16:47:22'),
(696, 154, 'En sucursal', 'Abono Vestuario', 'product', 1000, NULL, '2024-10-25 17:50:06'),
(699, 140, 'En sucursal', 'Abono Vestuario', 'product', 1000, NULL, '2024-10-25 17:50:33'),
(701, 140, 'En sucursal', 'Liquidado puntas', 'product', 2000, NULL, '2024-10-25 17:55:03'),
(703, 140, 'En sucursal', 'Ballerinas tela', 'product', 450, NULL, '2024-10-25 17:55:23'),
(706, 19, 'En sucursal', 'Anticipo Vestuario', 'product', 500, NULL, '2024-10-26 09:47:54'),
(711, 32, 'En sucursal', 'Pago de mensualidad: HERMANOS L - J  Octubre', 'monthly_fee', 1250, NULL, '2024-10-26 11:28:49'),
(714, 172, 'En sucursal', 'Abono puntas\r\nPunteras ', 'product', 700, NULL, '2024-10-28 17:26:10'),
(715, 80, 'En sucursal', 'Abono Vestuario', 'product', 1500, NULL, '2024-10-29 16:45:03'),
(719, 84, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Noviembre 2024', 'monthly_fee', 600, NULL, '2024-11-04 17:32:36'),
(722, 158, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Noviembre 2024', 'monthly_fee', 600, NULL, '2024-11-04 17:34:53'),
(723, 137, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Noviembre 2024', 'monthly_fee', 600, NULL, '2024-11-04 19:39:43'),
(724, 119, 'En sucursal', 'Pago de mensualidad: Lunes  -  Jueves Noviembre', 'monthly_fee', 800, NULL, '2024-11-04 20:00:11'),
(725, 154, 'En sucursal', 'Pago de mensualidad: HERMANOS L - J Noviembre', 'monthly_fee', 1200, NULL, '2024-11-04 20:37:30'),
(726, 154, 'En sucursal', 'Abono Vestuario', 'product', 1000, NULL, '2024-11-04 20:37:50'),
(727, 171, 'En sucursal', 'Pago de mensualidad: Lunes  -  Jueves Noviembre', 'monthly_fee', 800, NULL, '2024-11-05 00:21:14'),
(728, 61, 'En sucursal', 'Pago de mensualidad: Lunes  -  Jueves Noviembre', 'monthly_fee', 800, NULL, '2024-11-05 00:33:14'),
(730, 162, 'En sucursal', 'Pago de mensualidad: HERMANOS L - J  Octubre', 'monthly_fee', 700, NULL, '2024-11-05 00:59:34'),
(731, 80, 'En sucursal', 'Ballerinas Jazz', 'product', 450, NULL, '2024-11-05 19:35:19'),
(732, 39, 'En sucursal', 'Abono Puntas, pend, $1000', 'product', 500, NULL, '2024-11-06 15:41:31'),
(733, 173, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Noviembre 2024', 'monthly_fee', 600, NULL, '2024-11-06 17:55:46'),
(734, 65, 'En sucursal', 'Pago de mensualidad: Lunes  -  Jueves Noviembre', 'monthly_fee', 800, NULL, '2024-11-06 18:00:02'),
(736, 194, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Noviembre 2024', 'monthly_fee', 600, NULL, '2024-11-06 19:35:12'),
(740, 19, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Noviembre 2024', 'monthly_fee', 600, NULL, '2024-11-09 11:05:24'),
(742, 153, 'En sucursal', 'Pago de mensualidad: HERMANOS 1 disciplina - Noviembre 2024', 'monthly_fee', 1000, NULL, '2024-11-09 11:17:39'),
(743, 95, 'En sucursal', 'Pago de mensualidad: Lunes  -  Jueves Noviembre', 'monthly_fee', 700, NULL, '2024-11-09 11:48:52'),
(744, 83, 'En sucursal', 'Pago de mensualidad: HERMANOS L - J  Octubre', 'monthly_fee', 700, NULL, '2024-11-09 11:49:17'),
(745, 83, 'En sucursal', 'Pago de mensualidad: HERMANOS L - J Noviembre', 'monthly_fee', 700, NULL, '2024-11-09 11:49:31'),
(746, 138, 'En sucursal', 'Pago de mensualidad: Lunes  -  Jueves Noviembre', 'monthly_fee', 800, NULL, '2024-11-09 11:49:56'),
(747, 52, 'En sucursal', 'Vestuario Abono', 'product', 1000, NULL, '2024-11-09 12:35:11'),
(749, 52, 'En sucursal', 'Pago de mensualidad: Lunes  -  Jueves Noviembre', 'monthly_fee', 800, NULL, '2024-11-09 12:35:51'),
(751, 140, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Noviembre 2024', 'monthly_fee', 600, NULL, '2024-11-09 12:36:55'),
(755, 31, 'En sucursal', 'Anticipo Vestuario', 'product', 500, NULL, '2024-11-09 12:39:12'),
(756, 31, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Noviembre 2024', 'monthly_fee', 600, NULL, '2024-11-09 12:39:22'),
(757, 29, 'En sucursal', 'Pago de mensualidad: Lunes  -  Jueves Noviembre', 'monthly_fee', 800, NULL, '2024-11-09 12:39:46'),
(758, 79, 'En sucursal', 'Anticipo Vestuarios', 'product', 1000, NULL, '2024-11-09 12:47:25'),
(760, 174, 'En sucursal', '1 leotardo', 'product', 460, NULL, '2024-11-09 12:57:18'),
(761, 80, 'En sucursal', 'Pago de mensualidad: Lunes  -  Jueves Noviembre', 'monthly_fee', 800, NULL, '2024-11-09 12:59:28'),
(762, 16, 'En sucursal', 'Pago de mensualidad: Lunes  -  Jueves Noviembre', 'monthly_fee', 800, NULL, '2024-11-09 12:59:52'),
(763, 88, 'En sucursal', 'Pago de mensualidad: Lunes  -  Jueves Noviembre', 'monthly_fee', 800, NULL, '2024-11-09 13:00:45'),
(766, 61, 'En sucursal', 'Abono Vestuario', 'product', 1000, NULL, '2024-11-09 13:11:04'),
(767, 28, 'En sucursal', 'Pago de mensualidad: Lunes  -  Jueves Noviembre', 'monthly_fee', 800, NULL, '2024-11-09 13:11:52'),
(768, 22, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Noviembre 2024', 'monthly_fee', 600, NULL, '2024-11-09 13:12:49'),
(772, 0, 'En sucursal', 'Valentina Costurera Abono', 'product', 4000, NULL, '2024-11-11 18:16:57'),
(773, 190, 'En sucursal', 'Abono Vestuario', 'product', 1500, NULL, '2024-11-12 17:17:56'),
(774, 50, 'En sucursal', 'Pago de mensualidad: Lunes  -  Jueves Noviembre', 'monthly_fee', 850, NULL, '2024-11-13 17:16:37'),
(778, 62, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Noviembre 2024', 'monthly_fee', 600, NULL, '2024-11-13 18:22:25'),
(780, 174, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Noviembre 2024', 'monthly_fee', 600, NULL, '2024-11-13 19:27:25'),
(781, 116, 'En sucursal', 'Pago de mensualidad: Lunes  -  Jueves Noviembre', 'monthly_fee', 800, NULL, '2024-11-13 20:42:24'),
(782, 140, 'En sucursal', 'Anticipo Cascanueces', 'product', 500, NULL, '2024-11-13 20:51:03'),
(784, 31, 'En sucursal', 'Vestuario Liquidado', 'product', 2000, NULL, '2024-11-19 17:23:12'),
(785, 90, 'En sucursal', 'Abono Vestuario pend. $700', 'product', 4000, NULL, '2024-11-19 17:27:12'),
(787, 116, 'En sucursal', 'Abono Vestuario $4200', 'product', 1500, NULL, '2024-11-19 17:29:41'),
(788, 190, 'En sucursal', 'Abono Pend. $1550 (Pend. Copos)', 'product', 3000, NULL, '2024-11-19 17:47:29'),
(789, 58, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Noviembre 2024', 'monthly_fee', 650, NULL, '2024-11-19 18:44:09'),
(790, 58, 'En sucursal', 'Anticipo Vestuario', 'product', 500, NULL, '2024-11-19 18:44:45'),
(791, 174, 'En sucursal', 'Cinta elástica', 'product', 250, NULL, '2024-11-19 18:45:35'),
(792, 37, 'En sucursal', 'Vestuario Liquidado', 'product', 2000, NULL, '2024-11-19 18:58:27'),
(793, 28, 'En sucursal', 'Vestuario Liquidado', 'product', 1500, NULL, '2024-11-19 19:45:33'),
(796, 190, 'En sucursal', 'Vestuarios liquidados!', 'product', 0, NULL, '2024-11-25 19:34:18'),
(797, 88, 'En sucursal', '1 vestuario liquidado', 'product', 2000, NULL, '2024-11-25 19:59:34'),
(798, 137, 'En sucursal', '1Vestuario liquidado\r\n+$150', 'product', 1000, NULL, '2024-11-25 20:27:37'),
(799, 45, 'En sucursal', 'Abono vestuario', 'product', 950, NULL, '2024-11-25 20:28:26'),
(800, 80, 'En sucursal', 'MALLAS NUDE', 'product', 300, NULL, '2024-11-26 16:43:16'),
(801, 158, 'En sucursal', '1 vestuario liquidado (COPOS)\r\npend. Flores+Fiesta', 'product', 2500, NULL, '2024-11-26 16:50:20'),
(803, 16, 'En sucursal', 'Vestuario liquidado (cascanueces)', 'product', 2000, NULL, '2024-11-26 17:57:20'),
(804, 29, 'En sucursal', 'Vestuarios liquidados', 'product', 3350, NULL, '2024-11-26 18:45:37'),
(807, 83, 'En sucursal', 'abono Vestuario pend. $1500', 'product', 500, NULL, '2024-11-26 20:38:37'),
(808, 138, 'En sucursal', 'Vestuario liquidado ', 'product', 2500, NULL, '2024-11-28 16:48:39'),
(809, 79, 'En sucursal', '1 mallas', 'product', 300, NULL, '2024-11-28 17:26:33'),
(810, 62, 'En sucursal', '2 Vestuarios liquidados', 'product', 3850, NULL, '2024-11-28 17:34:45'),
(811, 83, 'En sucursal', 'vestuario liquidado', 'product', 1500, NULL, '2024-11-28 18:16:29'),
(812, 45, 'En sucursal', 'Abono Vestuario', 'product', 250, NULL, '2024-11-29 19:16:40'),
(813, 140, 'En sucursal', '1 vestuario liquidado\r\n1 mallas', 'product', 1300, NULL, '2024-11-29 19:17:58'),
(814, 32, 'En sucursal', '2 vestuario liquidado', 'product', 3850, NULL, '2024-11-29 19:20:02'),
(817, 179, 'En sucursal', 'Vestuario liquidado cascanueces\r\n-500 anticipo', 'product', 750, NULL, '2024-12-02 19:37:12'),
(819, 21, 'En sucursal', 'Pago de mensualidad: Lunes  -  Jueves Noviembre', 'monthly_fee', 800, NULL, '2024-12-02 23:36:01'),
(820, 61, 'En sucursal', '1 ballerinas', 'product', 450, NULL, '2024-12-02 23:38:00'),
(821, 156, 'En sucursal', 'Pago de mensualidad: Lunes  -  Jueves Noviembre', 'monthly_fee', 700, NULL, '2024-12-02 23:38:33'),
(823, 89, 'En sucursal', 'Pago de mensualidad: Lunes  -  Jueves Noviembre', 'monthly_fee', 850, NULL, '2024-12-02 23:57:51'),
(824, 89, 'En sucursal', 'vestuarios liquidados', 'product', 3350, NULL, '2024-12-02 23:59:17'),
(825, 30, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Noviembre 2024', 'monthly_fee', 300, NULL, '2024-12-03 00:00:55'),
(826, 140, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Octubre 2024', 'monthly_fee', 600, NULL, '2024-12-03 00:10:47'),
(827, 155, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Noviembre 2024', 'monthly_fee', 600, NULL, '2024-12-03 00:12:02'),
(828, 63, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Noviembre 2024', 'monthly_fee', 600, NULL, '2024-12-03 00:13:21'),
(834, 50, 'En sucursal', '1 vestuario liquidado\r\npend, $1350', 'product', 2000, NULL, '2024-12-03 00:26:07'),
(835, 162, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Noviembre 2024', 'monthly_fee', 700, NULL, '2024-12-03 00:28:42'),
(836, 162, 'En sucursal', '2 ballerinas', 'product', 900, NULL, '2024-12-03 00:29:57'),
(839, 63, 'En sucursal', 'Pago de mensualidad: 1 disciplina /  - Diciembre 2024', 'monthly_fee', 600, NULL, '2024-12-03 16:58:03'),
(840, 119, 'En sucursal', 'falda liquidada', 'product', 200, NULL, '2024-12-03 17:12:27'),
(841, 80, 'En sucursal', 'Pago de mensualidad: 1 disciplina /  - Diciembre 2024', 'monthly_fee', 600, NULL, '2024-12-03 17:32:52'),
(844, 163, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Octubre 2024', 'monthly_fee', 250, NULL, '2024-12-03 17:43:04'),
(845, 165, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Octubre 2024', 'monthly_fee', 250, NULL, '2024-12-03 17:43:47'),
(846, 165, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Noviembre 2024', 'monthly_fee', 250, NULL, '2024-12-03 17:44:20'),
(847, 163, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Noviembre 2024', 'monthly_fee', 250, NULL, '2024-12-03 17:44:36'),
(849, 163, 'En sucursal', '1 anticipo vestuario', 'product', 500, NULL, '2024-12-03 17:46:27'),
(850, 165, 'En sucursal', '1 anticipo vestuario', 'product', 500, NULL, '2024-12-03 17:46:58'),
(851, 137, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Octubre 2024', 'monthly_fee', 600, NULL, '2024-12-03 17:58:23'),
(852, 154, 'En sucursal', 'Pago de mensualidad: HERMANOS / 1 disciplina - Diciembre 2024', 'monthly_fee', 1200, NULL, '2024-12-03 18:20:32'),
(853, 0, 'En sucursal', 'inscripción de Garedy Walle', 'product', 500, NULL, '2024-12-03 19:01:19'),
(854, 80, 'En sucursal', 'vestuario liquidado albita', 'product', 1350, NULL, '2024-12-03 19:09:35'),
(855, 0, 'En sucursal', 'inscripción de renata estrada', 'product', 500, NULL, '2024-12-03 19:13:00'),
(856, 32, 'En sucursal', 'Pago de mensualidad: HERMANOS 1 disciplina - Noviembre 2024', 'monthly_fee', 1250, NULL, '2024-12-03 19:13:34'),
(857, 79, 'En sucursal', 'Pago de mensualidad: HERMANOS L - J Septiembre', 'monthly_fee', 1400, NULL, '2024-12-03 19:18:25'),
(858, 79, 'En sucursal', 'Pago de mensualidad: HERMANOS L - J  Octubre', 'monthly_fee', 1400, NULL, '2024-12-03 19:18:50'),
(859, 79, 'En sucursal', 'Pago de mensualidad: HERMANOS L - J Noviembre', 'monthly_fee', 1400, NULL, '2024-12-03 19:19:02'),
(860, 79, 'En sucursal', 'Pago de mensualidad: HERMANOS / L  -  J Diciembre', 'monthly_fee', 1400, NULL, '2024-12-03 19:20:17'),
(865, 61, 'En sucursal', 'Pago de mensualidad: L  -  J  Diciembre', 'monthly_fee', 800, NULL, '2024-12-04 18:02:01'),
(866, 172, 'En sucursal', 'puntas y punteras liquidadas', 'product', 1500, NULL, '2024-12-04 18:36:07'),
(867, 137, 'En sucursal', 'Pago de mensualidad: 1 disciplina /  - Diciembre 2024', 'monthly_fee', 600, NULL, '2024-12-04 18:43:40'),
(869, 194, 'En sucursal', 'Pago de mensualidad: 1 disciplina /  - Diciembre 2024', 'monthly_fee', 600, NULL, '2024-12-04 18:56:40'),
(870, 19, 'En sucursal', 'Pago de mensualidad: 1 disciplina /  - Diciembre 2024', 'monthly_fee', 600, NULL, '2024-12-04 19:26:47'),
(871, 90, 'En sucursal', 'Pago de mensualidad: 1 disciplina /  - Diciembre 2024', 'monthly_fee', 600, NULL, '2024-12-04 19:59:46'),
(872, 28, 'En sucursal', 'Pago de mensualidad: 1 disciplina /  - Diciembre 2024', 'monthly_fee', 600, NULL, '2024-12-04 20:03:28'),
(873, 174, 'En sucursal', 'Pago de mensualidad: 1 disciplina /  - Diciembre 2024', 'monthly_fee', 600, NULL, '2024-12-04 20:06:19'),
(874, 174, 'En sucursal', '1 ballerinas', 'product', 450, NULL, '2024-12-04 20:06:34'),
(875, 16, 'En sucursal', 'Pago de mensualidad: 1 disciplina /  - Diciembre 2024', 'monthly_fee', 600, NULL, '2024-12-05 18:38:34'),
(876, 32, 'En sucursal', 'Pago de mensualidad: 1 disciplina /  - Diciembre 2024', 'monthly_fee', 600, NULL, '2024-12-05 18:39:11'),
(877, 62, 'En sucursal', 'Pago de mensualidad: 1 disciplina /  - Diciembre 2024', 'monthly_fee', 600, NULL, '2024-12-05 19:06:24'),
(878, 37, 'En sucursal', 'Pago de mensualidad: 1 disciplina /  - Diciembre 2024', 'monthly_fee', 600, NULL, '2024-12-05 19:41:57'),
(879, 137, 'En sucursal', 'vestuarios liquidados :)', 'product', 2350, NULL, '2024-12-05 19:58:45'),
(881, 116, 'En sucursal', 'vestuarios liquidados ;)', 'product', 4200, NULL, '2024-12-05 20:46:05'),
(884, 171, 'En sucursal', 'Pago de mensualidad: L  -  J  Diciembre', 'monthly_fee', 800, NULL, '2024-12-06 17:26:11'),
(885, 90, 'En sucursal', 'vestuarios liquidados', 'product', 700, NULL, '2024-12-06 18:44:37'),
(886, 88, 'En sucursal', 'Pago de mensualidad: L  -  J  Diciembre', 'monthly_fee', 800, NULL, '2024-12-06 18:48:10'),
(891, 45, 'En sucursal', '1 vestuario', 'product', 1300, NULL, '2024-12-09 18:06:22'),
(894, 116, 'En sucursal', 'Pago de mensualidad: 1 disciplina /  - Diciembre 2024', 'monthly_fee', 600, NULL, '2024-12-09 20:05:22'),
(896, 155, 'En sucursal', 'Pago de mensualidad: 1 disciplina /  - Diciembre 2024', 'monthly_fee', 650, NULL, '2024-12-09 20:23:43'),
(897, 155, 'En sucursal', '1 vestuario abono\r\n1 leotardo', 'product', 1460, NULL, '2024-12-09 20:24:50'),
(900, 116, 'En sucursal', '1 falda', 'product', 300, NULL, '2024-12-11 18:16:31'),
(902, 45, 'En sucursal', 'Vestuario liquidado Tutu', 'product', 350, NULL, '2024-12-13 19:02:56'),
(913, 198, 'En sucursal', 'BALLERINAS', 'product', 450, NULL, '2025-01-08 20:31:21'),
(916, 65, 'En sucursal', 'Pago de mensualidad: 1 disciplina /  - Diciembre 2024', 'monthly_fee', 650, NULL, '2025-01-10 19:11:59'),
(921, 185, 'En sucursal', '1 ballerinas', 'product', 450, NULL, '2025-01-11 12:05:22'),
(925, 28, 'En sucursal', '1 playera jazz', 'product', 350, 'cash', '2025-01-13 18:14:00'),
(927, 171, 'En sucursal', 'Pago de mensualidad: Lun  -  Vie Enero', 'monthly_fee', 800, 'transfer', '2025-01-13 19:10:00'),
(929, 63, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Enero 2025', 'monthly_fee', 600, 'transfer', '2025-01-04 21:11:00'),
(930, 204, 'En sucursal', 'playera jazz', 'product', 350, 'card', '1202-01-15 18:18:00'),
(932, 52, 'En sucursal', '1 leotardo OFERTA', 'product', 350, 'card', '2025-01-18 10:39:00'),
(933, 52, 'En sucursal', '1 playera', 'product', 350, 'card', '2025-01-18 11:58:00'),
(935, 50, 'En sucursal', 'Pago de mensualidad: 1 disciplina /  - Diciembre 2024', 'monthly_fee', 650, 'transfer', '2024-12-13 14:09:00'),
(936, 50, 'En sucursal', 'Pago de mensualidad: Lun  -  Vie Enero', 'monthly_fee', 800, 'cash', '2025-01-13 16:00:00'),
(937, 29, 'En sucursal', 'Pago de mensualidad: Lun  -  Vie Enero', 'monthly_fee', 800, 'cash', '2025-01-13 16:10:00'),
(940, 65, 'En sucursal', 'Pago de mensualidad: +2 disciplinas / BECA OXFORD. - Enero 2025', 'monthly_fee', 600, 'cash', '2025-01-15 16:40:00'),
(941, 174, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Enero 2025', 'monthly_fee', 600, 'cash', '2025-01-13 18:00:00'),
(942, 194, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Enero 2025', 'monthly_fee', 600, 'cash', '2025-01-13 19:00:00'),
(943, 146, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Enero 2025', 'monthly_fee', 600, 'cash', '2025-01-13 19:00:00'),
(946, 140, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Enero 2025', 'monthly_fee', 600, 'Selecciona un metodo de pago', '2025-01-14 18:00:00'),
(947, 31, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Enero 2025', 'monthly_fee', 600, 'Selecciona un metodo de pago', '2025-01-14 18:00:00'),
(948, 61, 'En sucursal', 'Pago de mensualidad: Lun  -  Vie Enero', 'monthly_fee', 800, 'card', '2025-01-14 18:15:00'),
(949, 79, 'En sucursal', 'Pago de mensualidad: HERMANXS L - V Enero', 'monthly_fee', 1400, 'card', '2025-01-14 18:17:00'),
(951, 211, 'En sucursal', 'Pago de mensualidad: +2 disciplinas / BECA OXFORD. - Enero 2025', 'monthly_fee', 600, 'Selecciona un metodo de pago', '2025-01-23 09:48:00'),
(954, 173, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Enero 2025', 'monthly_fee', 600, 'transfer', '2025-01-18 17:00:00'),
(956, 209, 'En sucursal', '4 playera\r\n-descuento de $150', 'product', 1250, 'card', '2025-01-25 10:03:00'),
(957, 212, 'En sucursal', 'Pago de mensualidad: 1 disciplina / BECA OXFORD. - Enero 2025', 'monthly_fee', 400, 'cash', '2025-01-25 12:11:00'),
(958, 212, 'En sucursal', '1 kit de uniforme', 'product', 1100, 'cash', '2025-01-25 12:30:00'),
(959, 16, 'En sucursal', '1 playera de jazz', 'product', 350, 'cash', '2025-01-27 19:06:00'),
(960, 19, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Enero 2025', 'monthly_fee', 600, 'Selecciona un metodo de pago', '2025-01-27 17:01:00'),
(961, 199, 'En sucursal', '1 leotardo talla S mujer', 'product', 460, 'transfer', '2025-01-28 17:12:00'),
(965, 213, 'En sucursal', '1 ballerinas', 'product', 450, 'cash', '2025-01-29 18:11:00'),
(967, 213, 'En sucursal', '1 leotardo', 'product', 460, 'cash', '2025-01-29 18:00:00'),
(968, 202, 'En sucursal', 'Pago de mensualidad: +2 disciplinas / BECA OXFORD. - Enero 2025', 'monthly_fee', 600, 'transfer', '2025-01-30 17:04:00'),
(970, 28, 'En sucursal', 'Pago de mensualidad: Lun  -  Vie Enero', 'monthly_fee', 800, 'cash', '2025-01-31 17:00:00'),
(975, 138, 'En sucursal', 'Pago de mensualidad: Lun  -  Vie Enero', 'monthly_fee', 800, 'cash', '2025-01-31 18:49:00'),
(977, 113, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Enero 2025', 'monthly_fee', 600, 'cash', '2025-01-31 19:00:00'),
(978, 197, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Enero 2025', 'monthly_fee', 600, 'cash', '2025-01-31 18:51:00'),
(979, 153, 'En sucursal', 'Pago de mensualidad: HERMANXS 1 DISCIPLINA - Enero 2025', 'monthly_fee', 1000, 'cash', '2025-01-31 19:04:00'),
(980, 155, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Enero 2025', 'monthly_fee', 600, 'card', '2025-01-31 18:53:00'),
(981, 52, 'En sucursal', 'Pago de mensualidad: Lun  -  Vie Enero', 'monthly_fee', 800, 'card', '2025-01-03 20:01:00'),
(982, 185, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Enero 2025', 'monthly_fee', 600, 'cash', '2025-01-31 18:55:00'),
(984, 16, 'En sucursal', 'Pago de mensualidad: Lun  -  Vie Enero', 'monthly_fee', 800, 'cash', '2025-01-31 20:02:00'),
(987, 203, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Enero 2025', 'monthly_fee', 600, 'card', '2025-01-31 19:15:00'),
(988, 95, 'En sucursal', 'Pago de mensualidad: Lun  -  Vie Enero', 'monthly_fee', 700, 'cash', '2025-01-31 19:19:00'),
(989, 207, 'En sucursal', '1 playera jazz\r\n1 ballerinas', 'product', 800, 'card', '2025-01-31 19:28:00'),
(990, 207, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Enero 2025', 'monthly_fee', 600, 'Selecciona un metodo de pago', '2025-01-31 19:25:00'),
(991, 62, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Enero 2025', 'monthly_fee', 600, 'cash', '2025-01-31 19:39:00'),
(992, 62, 'En sucursal', 'Pago de mensualidad: Lun  -  Vie Febrero', 'monthly_fee', 800, 'cash', '2025-01-31 19:44:00'),
(993, 154, 'En sucursal', 'Pago de mensualidad: HERMANXS 1 DISCIPLINA - Enero 2025', 'monthly_fee', 1000, 'card', '2025-01-23 20:01:00'),
(994, 79, 'En sucursal', 'Pago de mensualidad: HERMANXS L - V Febrero', 'monthly_fee', 1400, 'card', '2025-01-14 19:02:00'),
(995, 49, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Febrero 2025', 'monthly_fee', 600, 'cash', '2025-02-11 19:24:00'),
(996, 62, 'En sucursal', '1 falda', 'product', 300, 'cash', '2025-02-17 19:44:00'),
(997, 162, 'En sucursal', 'pago de 1 vestuario', 'product', 2500, 'cash', '2024-11-19 20:02:00'),
(998, 162, 'En sucursal', '1 abono vestuario', 'product', 1000, 'cash', '2025-01-29 19:18:00'),
(1000, 33, 'En sucursal', 'Pago de mensualidad: HERMANXS L - V Enero', 'monthly_fee', 700, 'cash', '2025-01-30 20:10:00'),
(1001, 197, 'En sucursal', '1 kit de uniforme\r\n', 'product', 1100, 'card', '2025-01-31 20:28:00'),
(1002, 165, 'En sucursal', 'vestuario pagado (cascanueces)', 'product', 2000, 'cash', '2024-12-04 18:46:00'),
(1003, 163, 'En sucursal', 'vestuario pagado (cascanueces)', 'product', 2000, 'cash', '2024-12-06 17:03:00'),
(1006, 225, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Enero 2025', 'monthly_fee', 600, 'cash', '2025-01-08 19:13:00'),
(1007, 201, 'En sucursal', 'Pago de mensualidad: HERMANXS 2+ DISCIPLINAS / BECA OXFORD. - Enero 2025', 'monthly_fee', 1200, 'card', '2025-01-13 19:36:00'),
(1008, 65, 'En sucursal', 'Pago de mensualidad: +2 disciplinas / BECA OXFORD. - Febrero 2025', 'monthly_fee', 600, 'cash', '2025-02-07 12:52:00'),
(1009, 185, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Febrero 2025', 'monthly_fee', 600, 'cash', '2025-02-08 10:00:00'),
(1011, 197, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Febrero 2025', 'monthly_fee', 600, 'transfer', '2025-02-12 17:14:00'),
(1012, 61, 'En sucursal', 'Pago de mensualidad: Lun  -  Vie Febrero', 'monthly_fee', 800, 'transfer', '2025-02-04 18:00:00'),
(1013, 95, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Febrero 2025', 'monthly_fee', 600, 'cash', '2025-02-04 19:01:00'),
(1014, 226, 'En sucursal', 'Pago de mensualidad: Lun  -  Vie Febrero', 'monthly_fee', 800, 'cash', '2025-02-13 19:11:00'),
(1015, 207, 'En sucursal', 'Pago de mensualidad: Lun  -  Vie Febrero', 'monthly_fee', 800, 'cash', '2025-02-04 19:21:00'),
(1016, 140, 'En sucursal', 'Pago de mensualidad: Lun  -  Vie Febrero', 'monthly_fee', 800, 'cash', '2025-02-04 17:01:00'),
(1017, 16, 'En sucursal', 'Pago de mensualidad: Lun  -  Vie Febrero', 'monthly_fee', 800, 'cash', '2025-02-04 19:31:00'),
(1021, 137, 'En sucursal', 'Pago de mensualidad: Lun  -  Vie Febrero', 'monthly_fee', 800, 'cash', '2025-02-04 20:45:00'),
(1022, 156, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Febrero 2025', 'monthly_fee', 600, 'card', '2025-02-05 16:20:00'),
(1024, 113, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Febrero 2025', 'monthly_fee', 600, 'cash', '2025-02-05 18:39:00'),
(1025, 28, 'En sucursal', 'Pago de mensualidad: Lun  -  Vie Febrero', 'monthly_fee', 800, 'cash', '2025-02-05 17:01:00'),
(1026, 201, 'En sucursal', 'Pago de mensualidad: HERMANXS 2+ DISCIPLINAS / BECA OXFORD - Febrero 2025', 'monthly_fee', 1200, 'card', '2025-02-05 13:38:00'),
(1027, 174, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Febrero 2025', 'monthly_fee', 600, 'card', '2025-02-05 20:14:00'),
(1028, 116, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Enero 2025', 'monthly_fee', 600, 'transfer', '2025-01-14 18:50:00'),
(1029, 116, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Febrero 2025', 'monthly_fee', 600, 'cash', '2025-02-05 17:03:00'),
(1030, 211, 'En sucursal', 'Pago de mensualidad: +2 disciplinas / BECA OXFORD. - Febrero 2025', 'monthly_fee', 600, 'cash', '2025-02-06 18:02:00'),
(1032, 50, 'En sucursal', 'Pago de mensualidad: Lun  -  Vie Febrero', 'monthly_fee', 800, 'cash', '2025-02-06 16:01:00'),
(1034, 199, 'En sucursal', 'Pago de mensualidad: Lun  -  Vie Febrero', 'monthly_fee', 800, 'cash', '2025-02-06 19:09:00'),
(1035, 198, 'En sucursal', 'Pago de mensualidad: Lun  -  Vie Enero', 'monthly_fee', 800, 'cash', '2025-01-05 18:00:00'),
(1036, 198, 'En sucursal', 'Pago de mensualidad: Lun  -  Vie Febrero', 'monthly_fee', 800, 'cash', '2025-02-06 16:01:00'),
(1037, 146, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Febrero 2025', 'monthly_fee', 650, 'card', '2025-02-06 18:42:00'),
(1039, 153, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Febrero 2025', 'monthly_fee', 1000, 'cash', '2025-02-01 09:00:00'),
(1043, 216, 'En sucursal', 'Pago de mensualidad: HERMANXS L - V Febrero', 'monthly_fee', 600, 'cash', '2025-02-03 18:00:00'),
(1044, 19, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Febrero 2025', 'monthly_fee', 600, 'card', '2025-02-03 20:00:00'),
(1045, 204, 'En sucursal', 'Pago de mensualidad: +2 disciplinas / BECA OXFORD. - Enero 2025', 'monthly_fee', 600, 'cash', '2025-02-03 19:00:00'),
(1046, 204, 'En sucursal', 'Pago de mensualidad: +2 disciplinas / BECA OXFORD. - Febrero 2025', 'monthly_fee', 600, 'card', '2025-02-03 14:15:00'),
(1047, 29, 'En sucursal', 'Pago de mensualidad: Lun  -  Vie Febrero', 'monthly_fee', 800, 'cash', '2025-02-04 18:02:00'),
(1048, 31, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Febrero 2025', 'monthly_fee', 600, 'cash', '2025-02-04 16:23:00'),
(1052, 212, 'En sucursal', 'Pago de mensualidad: 1 disciplina / BECA OXFORD. - Febrero 2025', 'monthly_fee', 400, 'cash', '2025-02-15 16:01:00'),
(1053, 90, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Febrero 2025', 'monthly_fee', 600, 'card', '2025-02-03 16:00:00'),
(1054, 21, 'En sucursal', 'Pago de mensualidad: Lun  -  Vie Febrero', 'monthly_fee', 800, 'cash', '2025-02-03 18:03:00'),
(1055, 165, 'En sucursal', 'Pago de mensualidad: HERMANXS 1 DISCIPLINA - Febrero 2025', 'monthly_fee', 500, 'cash', '2025-02-08 10:02:00'),
(1056, 163, 'En sucursal', 'Pago de mensualidad: HERMANXS 1 DISCIPLINA - Febrero 2025', 'monthly_fee', 500, 'Selecciona un metodo de pago', '2025-02-08 09:02:00'),
(1057, 227, 'En sucursal', 'Pago de mensualidad: Lun  -  Vie Febrero', 'monthly_fee', 800, 'card', '2025-02-05 21:31:00'),
(1058, 227, 'En sucursal', '1 ballerinas', 'product', 450, 'card', '2025-02-08 18:03:00'),
(1062, 16, 'En sucursal', '1 ballerinas', 'product', 450, 'cash', '2025-02-10 17:00:00'),
(1063, 214, 'En sucursal', '1 playera', 'product', 350, 'cash', '2025-02-12 17:00:00'),
(1064, 201, 'En sucursal', '1 playera', 'product', 350, 'cash', '2025-02-12 11:50:00'),
(1065, 61, 'En sucursal', '1 playera', 'product', 350, 'cash', '2025-02-13 15:01:00'),
(1066, 221, 'En sucursal', '2 playeras - descuento de $100', 'product', 600, 'cash', '2025-02-04 17:00:00'),
(1068, 203, 'En sucursal', '1 leotardo\r\n1 mallas', 'product', 760, 'transfer', '2025-02-05 17:03:00'),
(1069, 213, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Febrero 2025', 'monthly_fee', 600, 'cash', '2025-02-01 16:02:00'),
(1070, 214, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Febrero 2025', 'monthly_fee', 600, 'cash', '2025-02-01 17:01:00'),
(1071, 203, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Febrero 2025', 'monthly_fee', 600, 'cash', '2025-02-17 17:14:00'),
(1072, 213, 'En sucursal', '1 mallas\r\n1 leotardo\r\n1 falda', 'product', 1060, 'cash', '2025-02-05 18:01:00'),
(1075, 138, 'En sucursal', 'Pago de mensualidad: Lun  -  Vie Febrero', 'monthly_fee', 850, 'cash', '2025-02-24 16:42:00'),
(1076, 194, 'En sucursal', '1 mallas', 'product', 300, 'cash', '2025-02-24 20:25:00'),
(1078, 202, 'En sucursal', 'Pago de mensualidad: +2 disciplinas / BECA OXFORD. - Febrero 2025', 'monthly_fee', 600, 'cash', '2025-02-18 17:01:00'),
(1079, 33, 'En sucursal', 'Pago de mensualidad: HERMANXS L - V Febrero', 'monthly_fee', 700, 'cash', '2025-02-25 17:58:00'),
(1081, 223, 'En sucursal', 'Pago de mensualidad: HERMANXS L - V Febrero', 'monthly_fee', 700, 'cash', '2025-02-17 18:00:00'),
(1082, 224, 'En sucursal', 'Pago de mensualidad: HERMANXS L - V Febrero', 'monthly_fee', 700, 'cash', '2025-02-17 15:00:00'),
(1083, 223, 'En sucursal', '1 kit de uniforme', 'product', 1100, 'cash', '2025-02-17 18:01:00'),
(1084, 223, 'En sucursal', 'inscripciones', 'product', 500, 'cash', '2025-02-17 18:01:00'),
(1085, 228, 'En sucursal', 'Abono Kit de Uniforme\r\npend. $600', 'product', 500, 'cash', '2025-02-26 17:47:00'),
(1086, 229, 'En sucursal', '1 abono kit de uniforme\r\npend. $500', 'product', 600, 'cash', '2025-02-26 18:27:00'),
(1089, 83, 'En sucursal', 'Pago de mensualidad: HERMANXS L - V Enero', 'monthly_fee', 700, 'cash', '2025-01-08 12:42:00'),
(1090, 83, 'En sucursal', 'Pago de mensualidad: HERMANXS L - V Febrero', 'monthly_fee', 700, 'transfer', '2025-02-08 12:44:00'),
(1091, 232, 'En sucursal', 'Pago de mensualidad: L - V Marzo', 'monthly_fee', 800, 'card', '2025-03-01 12:46:00'),
(1094, 155, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Marzo 2025', 'monthly_fee', 600, 'cash', '2025-03-01 10:00:00'),
(1095, 212, 'En sucursal', 'Pago de mensualidad: 1 disciplina / BECA OXFORD. - Marzo 2025', 'monthly_fee', 400, 'cash', '2025-03-01 09:54:00'),
(1096, 165, 'En sucursal', '1 mallas', 'product', 300, 'card', '2025-03-01 11:00:00'),
(1097, 163, 'En sucursal', '1 mallas', 'product', 300, 'cash', '2025-03-01 10:03:00'),
(1098, 165, 'En sucursal', 'Pago de mensualidad: HERMANXS 1 DISCIPLINA - Marzo 2025', 'monthly_fee', 500, 'cash', '2025-03-01 11:11:00');
INSERT INTO `installments` (`installment_id`, `student_id`, `transaction_id`, `concept`, `type`, `total`, `payment_method`, `created_at`) VALUES
(1099, 163, 'En sucursal', 'Pago de mensualidad: HERMANXS 1 DISCIPLINA - Marzo 2025', 'monthly_fee', 500, 'cash', '2025-03-01 11:00:00'),
(1101, 62, 'En sucursal', 'Pago de mensualidad: L - V Marzo', 'monthly_fee', 800, 'cash', '2025-03-01 13:19:00'),
(1102, 214, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Marzo 2025', 'monthly_fee', 600, 'cash', '2025-03-03 17:43:00'),
(1103, 88, 'En sucursal', 'Pago de mensualidad: +2 disciplinas / BECA OXFORD. - Marzo 2025', 'monthly_fee', 600, 'cash', '2025-03-03 17:11:00'),
(1104, 113, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Marzo 2025', 'monthly_fee', 600, 'cash', '2025-03-03 19:09:00'),
(1105, 154, 'En sucursal', 'Pago de mensualidad: HERMANXS 1 DISCIPLINA - Marzo 2025', 'monthly_fee', 1200, 'cash', '2025-03-03 18:01:00'),
(1106, 174, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Marzo 2025', 'monthly_fee', 600, 'card', '2025-03-03 19:40:00'),
(1107, 61, 'En sucursal', 'Pago de mensualidad: L - V Marzo', 'monthly_fee', 800, 'transfer', '2025-03-03 17:06:00'),
(1108, 84, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Enero 2025', 'monthly_fee', 600, 'transfer', '2025-01-21 17:32:00'),
(1109, 84, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Febrero 2025', 'monthly_fee', 600, 'transfer', '2025-02-03 17:24:00'),
(1110, 84, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Marzo 2025', 'monthly_fee', 600, 'transfer', '2025-03-03 17:21:00'),
(1111, 137, 'En sucursal', 'Pago de mensualidad: L - V Marzo', 'monthly_fee', 800, 'card', '2025-03-03 19:00:00'),
(1112, 19, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Marzo 2025', 'monthly_fee', 600, 'cash', '2025-03-03 19:00:00'),
(1113, 173, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Marzo 2025', 'monthly_fee', 600, 'transfer', '2025-03-03 17:37:00'),
(1114, 194, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Febrero 2025', 'monthly_fee', 600, 'cash', '2025-02-02 17:39:00'),
(1115, 194, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Marzo 2025', 'monthly_fee', 600, 'cash', '2025-03-03 18:01:00'),
(1119, 223, 'En sucursal', 'Pago de mensualidad: HERMANXS L - V (dividida) Marzo', 'monthly_fee', 700, 'card', '2025-03-04 19:01:00'),
(1120, 140, 'En sucursal', 'Pago de mensualidad: L - V Marzo', 'monthly_fee', 800, 'cash', '2025-03-04 19:51:00'),
(1121, 31, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Marzo 2025', 'monthly_fee', 600, 'cash', '2025-03-04 17:00:00'),
(1122, 228, 'En sucursal', 'kit liquidado', 'product', 600, 'card', '2025-03-10 16:59:00'),
(1123, 228, 'En sucursal', '1 abono leotardo rosa', 'product', 230, 'card', '2025-03-10 17:01:00'),
(1124, 228, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Marzo 2025', 'monthly_fee', 600, 'card', '2025-03-10 17:03:00'),
(1125, 229, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Marzo 2025', 'monthly_fee', 600, 'cash', '2025-03-10 17:58:00'),
(1126, 185, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Marzo 2025', 'monthly_fee', 650, 'cash', '2025-03-08 14:11:00'),
(1131, 137, 'En sucursal', '1 playera JSE', 'product', 250, 'cash', '2025-03-17 19:01:00'),
(1132, 234, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Marzo 2025', 'monthly_fee', 600, 'cash', '2025-03-08 12:09:00'),
(1133, 233, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Marzo 2025', 'monthly_fee', 600, 'card', '2025-03-08 11:12:00'),
(1134, 233, 'En sucursal', 'inscripción sabados\r\n\r\n', 'product', 300, 'card', '2025-03-08 10:01:00'),
(1136, 153, 'En sucursal', 'Pago de mensualidad: HERMANXS 1 DISCIPLINA - Marzo 2025', 'monthly_fee', 1050, 'cash', '2025-03-08 09:59:00'),
(1137, 211, 'En sucursal', 'Pago de mensualidad: +2 disciplinas / BECA OXFORD. - Marzo 2025', 'monthly_fee', 650, 'cash', '2025-03-07 16:01:00'),
(1138, 213, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Marzo 2025', 'monthly_fee', 600, 'cash', '2025-03-05 17:00:00'),
(1139, 146, 'En sucursal', 'Pago de mensualidad: L - V Marzo', 'monthly_fee', 800, 'cash', '2025-03-04 15:25:00'),
(1140, 221, 'En sucursal', 'Pago de mensualidad: HERMANXS 1 DISCIPLINA - Febrero 2025', 'monthly_fee', 500, 'cash', '2025-02-08 18:00:00'),
(1141, 221, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Marzo 2025', 'monthly_fee', 600, 'cash', '2025-03-04 17:30:00'),
(1142, 204, 'En sucursal', 'Pago de mensualidad: +2 disciplinas / BECA OXFORD. - Marzo 2025', 'monthly_fee', 600, 'card', '2025-03-04 18:00:00'),
(1143, 49, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Marzo 2025', 'monthly_fee', 600, 'cash', '2025-03-04 19:00:00'),
(1146, 28, 'En sucursal', 'Pago de mensualidad: L - V Marzo', 'monthly_fee', 800, 'cash', '2025-03-04 18:00:00'),
(1147, 224, 'En sucursal', 'Pago de mensualidad: HERMANXS L - V (dividida) Marzo', 'monthly_fee', 700, 'card', '2025-03-04 18:03:00'),
(1149, 119, 'En sucursal', 'Pago de mensualidad: L - V Marzo', 'monthly_fee', 800, 'cash', '2025-03-04 17:58:00'),
(1150, 190, 'En sucursal', 'Pago de mensualidad: L - V Marzo', 'monthly_fee', 800, 'cash', '2025-03-04 17:53:00'),
(1152, 203, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Marzo 2025', 'monthly_fee', 600, 'card', '2025-03-12 17:12:00'),
(1153, 52, 'En sucursal', '1 ballerinas', 'product', 450, 'cash', '2025-03-11 17:59:00'),
(1156, 207, 'En sucursal', 'Pago de mensualidad: L - V Marzo', 'monthly_fee', 800, 'Selecciona un metodo de pago', '2025-03-11 17:00:00'),
(1157, 237, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Marzo 2025', 'monthly_fee', 600, 'card', '2025-03-15 10:00:00'),
(1158, 237, 'En sucursal', '1 inscripcion', 'product', 300, 'card', '2025-03-15 10:02:00'),
(1159, 236, 'En sucursal', '1 kit de uniforme', 'product', 1100, 'card', '2025-03-15 12:19:00'),
(1160, 236, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Marzo 2025', 'monthly_fee', 600, 'Selecciona un metodo de pago', '2025-03-15 10:00:00'),
(1161, 236, 'En sucursal', '1 inscripcion', 'product', 300, 'card', '2025-03-15 11:01:00'),
(1162, 233, 'En sucursal', '1 kit de uniforme', 'product', 1100, 'cash', '2025-03-14 13:03:00'),
(1163, 226, 'En sucursal', 'Pago de mensualidad: L - V Marzo', 'monthly_fee', 800, 'card', '2025-03-13 19:00:00'),
(1164, 234, 'En sucursal', '1 kit de uniforme', 'product', 1100, 'card', '2025-03-12 18:00:00'),
(1165, 213, 'En sucursal', '1 leotardo', 'product', 460, 'cash', '2025-03-12 18:00:00'),
(1166, 201, 'En sucursal', 'Pago de mensualidad: HERMANXS 2+ DISCIPLINAS / BECA OXFORD. - Marzo 2025', 'monthly_fee', 1250, 'card', '2025-03-12 18:00:00'),
(1167, 83, 'En sucursal', 'Pago de mensualidad: HERMANXS L - V (dividida) Marzo', 'monthly_fee', 700, 'cash', '2025-02-27 19:15:00'),
(1168, 240, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Marzo 2025', 'monthly_fee', 300, 'cash', '2025-02-27 21:00:00'),
(1169, 156, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Marzo 2025', 'monthly_fee', 600, 'card', '2025-03-12 17:01:00'),
(1170, 228, 'En sucursal', '1 mallas 4-6 a;os rosas', 'product', 300, 'card', '2025-03-12 17:58:00'),
(1171, 235, 'En sucursal', 'Pago de mensualidad: L - V Marzo', 'monthly_fee', 400, 'cash', '2025-03-18 17:27:00'),
(1172, 235, 'En sucursal', 'inscripcion de clases L-V ', 'product', 500, 'cash', '2025-03-18 17:53:00'),
(1173, 235, 'En sucursal', '1 KIT DE UNIFORME', 'product', 1100, 'cash', '2025-03-18 18:01:00'),
(1174, 202, 'En sucursal', 'Pago de mensualidad: +2 disciplinas / BECA OXFORD. - Marzo 2025', 'monthly_fee', 600, 'card', '2025-03-20 11:00:00'),
(1175, 138, 'En sucursal', 'Pago de mensualidad: L - V Marzo', 'monthly_fee', 850, 'transfer', '2025-03-18 19:00:00'),
(1176, 197, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Marzo 2025', 'monthly_fee', 600, 'cash', '2025-03-19 18:59:00'),
(1178, 90, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Marzo 2025', 'monthly_fee', 650, 'card', '2025-03-19 19:00:00'),
(1179, 37, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Enero 2025', 'monthly_fee', 600, 'transfer', '2025-01-13 12:49:00'),
(1180, 37, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Febrero 2025', 'monthly_fee', 650, 'cash', '2025-02-10 19:12:00'),
(1181, 37, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Marzo 2025', 'monthly_fee', 650, 'transfer', '2025-03-10 18:45:00'),
(1182, 37, 'En sucursal', '1 puntas', 'product', 2500, 'cash', '2025-03-21 19:01:00'),
(1183, 238, 'En sucursal', '1 mallas\r\n1 leotardo', 'product', 760, 'cash', '2025-03-21 10:00:00'),
(1184, 228, 'En sucursal', '1 abono playera', 'product', 200, 'cash', '2025-03-24 17:38:00'),
(1185, 137, 'En sucursal', '1 mallas', 'product', 300, 'card', '2025-03-20 17:27:00'),
(1186, 239, 'En sucursal', '1/2 inscripción', 'product', 300, 'card', '2025-03-22 18:56:00'),
(1187, 239, 'En sucursal', '1 kit de uniforme', 'product', 1100, 'card', '2025-03-22 19:00:00'),
(1188, 238, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Marzo 2025', 'monthly_fee', 600, 'card', '2025-03-21 16:00:00'),
(1189, 238, 'En sucursal', '1 inscripción', 'product', 300, 'card', '2025-03-21 19:01:00'),
(1190, 140, 'En sucursal', '1 recargo', 'product', 50, 'cash', '2025-03-18 17:00:00'),
(1191, 89, 'En sucursal', '1 playera', 'product', 350, 'card', '2025-04-11 14:30:00'),
(1192, 113, 'En sucursal', '1 falda liquidación', 'product', 250, 'cash', '2025-04-28 19:12:00'),
(1193, 0, 'En sucursal', '1 ballerinas', 'product', 450, 'card', '2025-04-30 16:55:00'),
(1195, 174, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Abril 2025', 'monthly_fee', 600, 'card', '2025-04-07 17:00:00'),
(1196, 65, 'En sucursal', 'Pago de mensualidad: +2 disciplinas / BECA OXFORD. - Marzo 2025', 'monthly_fee', 600, 'cash', '2025-03-01 16:58:00'),
(1197, 83, 'En sucursal', '1 mallas', 'product', 300, 'card', '2025-04-03 17:29:00'),
(1198, 162, 'En sucursal', '1 abono vestuario', 'product', 1000, 'cash', '2025-03-31 18:14:00'),
(1199, 197, 'En sucursal', '1 mallas 7-9 años', 'product', 300, 'cash', '2025-03-26 18:01:00'),
(1200, 65, 'En sucursal', 'Pago de mensualidad: +2 disciplinas / BECA OXFORD. - Abril 2025', 'monthly_fee', 600, 'cash', '2025-04-07 18:19:00'),
(1201, 29, 'En sucursal', 'Pago de mensualidad: Lun  -  Vie Abril', 'monthly_fee', 800, 'cash', '2025-04-07 20:05:00'),
(1203, 214, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Abril 2025', 'monthly_fee', 600, 'cash', '2025-04-07 16:01:00'),
(1207, 137, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Abril 2025', 'monthly_fee', 600, 'card', '2025-04-03 17:00:00'),
(1208, 235, 'En sucursal', 'Pago de mensualidad: Lun  -  Vie Abril', 'monthly_fee', 800, 'card', '2025-04-03 17:00:00'),
(1209, 119, 'En sucursal', 'Pago de mensualidad: Lun  -  Vie Abril', 'monthly_fee', 800, 'cash', '2025-04-03 15:00:00'),
(1210, 50, 'En sucursal', 'Pago de mensualidad: L - V Marzo', 'monthly_fee', 800, 'cash', '2025-04-03 17:01:00'),
(1211, 50, 'En sucursal', 'Pago de mensualidad: Lun  -  Vie Abril', 'monthly_fee', 800, 'cash', '2025-04-03 17:00:00'),
(1212, 194, 'En sucursal', 'Pago de mensualidad: Lun  -  Vie Abril', 'monthly_fee', 600, 'card', '2025-04-02 17:00:00'),
(1213, 201, 'En sucursal', 'Pago de mensualidad: HERMANXS 2+ DISCIPLINAS / BECA OXFORD - Abril 2025', 'monthly_fee', 1200, 'cash', '2025-04-02 20:45:00'),
(1215, 154, 'En sucursal', 'Pago de mensualidad: HERMANXS +1 DISCIPLINA - Abril 2025', 'monthly_fee', 1200, 'card', '2025-04-05 18:52:00'),
(1216, 80, 'En sucursal', 'Pago de mensualidad: Lun  -  Vie Enero', 'monthly_fee', 800, 'transfer', '2025-01-13 19:33:00'),
(1217, 241, 'En sucursal', '1 ballerinas', 'product', 450, 'card', '2025-05-17 10:12:00'),
(1218, 226, 'En sucursal', 'Pago de mensualidad: Todas las disciplinas - Mayo 2025', 'monthly_fee', 850, 'cash', '2025-05-08 18:00:00'),
(1219, 140, 'En sucursal', '1 PLAYERA', 'product', 350, 'cash', '2025-05-09 15:00:00'),
(1221, 28, 'En sucursal', 'Pago de mensualidad: Lun  -  Vie Abril', 'monthly_fee', 800, 'cash', '2025-04-01 17:53:00'),
(1222, 19, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Abril 2025', 'monthly_fee', 600, 'cash', '2025-04-01 15:00:00'),
(1223, 80, 'En sucursal', 'Pago de mensualidad: Lun  -  Vie Abril', 'monthly_fee', 800, 'cash', '2025-04-01 15:01:00'),
(1224, 154, 'En sucursal', 'Mabel 1 punteras', 'product', 200, 'cash', '2025-06-02 19:34:00'),
(1225, 80, 'En sucursal', 'Pago de mensualidad: Lun  -  Vie Febrero', 'monthly_fee', 800, 'transfer', '2025-02-05 16:55:00'),
(1226, 80, 'En sucursal', 'Pago de mensualidad: L - V Marzo', 'monthly_fee', 800, 'transfer', '2025-03-05 15:00:00'),
(1227, 80, 'En sucursal', 'Pago de mensualidad: Todas las disciplinas - Mayo 2025', 'monthly_fee', 800, 'transfer', '2025-05-05 13:01:00'),
(1228, 171, 'En sucursal', 'Pago de mensualidad: Lun  -  Vie Febrero', 'monthly_fee', 800, 'transfer', '2025-02-03 16:58:00'),
(1229, 171, 'En sucursal', 'Pago de mensualidad: L - V Marzo', 'monthly_fee', 800, 'transfer', '2025-03-05 14:00:00'),
(1230, 29, 'En sucursal', 'Pago de mensualidad: L - V Marzo', 'monthly_fee', 850, 'transfer', '2025-03-08 15:00:00'),
(1231, 21, 'En sucursal', 'Pago de mensualidad: L - V Marzo', 'monthly_fee', 800, 'transfer', '2025-03-04 17:14:00'),
(1232, 21, 'En sucursal', 'Pago de mensualidad: Lun  -  Vie Abril', 'monthly_fee', 800, 'transfer', '2025-04-07 15:00:00'),
(1233, 21, 'En sucursal', 'Pago de mensualidad: Todas las disciplinas - Mayo 2025', 'monthly_fee', 800, 'transfer', '2025-05-05 15:01:00'),
(1234, 155, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Febrero 2025', 'monthly_fee', 600, 'transfer', '2025-02-06 17:01:00'),
(1235, 155, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Abril 2025', 'monthly_fee', 600, 'transfer', '2025-04-02 15:00:00'),
(1236, 63, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Febrero 2025', 'monthly_fee', 600, 'transfer', '2025-02-04 15:00:00'),
(1237, 63, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Marzo 2025', 'monthly_fee', 600, 'transfer', '2025-03-04 14:00:00'),
(1238, 63, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Abril 2025', 'monthly_fee', 600, 'transfer', '2025-04-05 15:00:00'),
(1239, 63, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Mayo 2025', 'monthly_fee', 600, 'transfer', '2025-05-06 17:00:00'),
(1240, 116, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Marzo 2025', 'monthly_fee', 600, 'transfer', '2025-03-05 15:00:00'),
(1241, 95, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Marzo 2025', 'monthly_fee', 600, 'card', '2025-03-08 15:00:00'),
(1242, 199, 'En sucursal', 'Pago de mensualidad: HERMANXS L - V (dividida) Marzo', 'monthly_fee', 700, 'transfer', '2025-03-08 17:00:00'),
(1243, 50, 'En sucursal', 'Pago de mensualidad: Todas las disciplinas - Mayo 2025', 'monthly_fee', 800, 'transfer', '2025-05-05 18:31:00'),
(1244, 223, 'En sucursal', 'Pago de mensualidad: HERMANXS L - V Abril', 'monthly_fee', 700, 'cash', '2025-04-08 11:18:00'),
(1245, 221, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Abril 2025', 'monthly_fee', 600, 'card', '2025-04-08 18:00:00'),
(1246, 16, 'En sucursal', 'Pago de mensualidad: L - V Marzo', 'monthly_fee', 800, 'cash', '2025-03-06 16:00:00'),
(1247, 16, 'En sucursal', 'Pago de mensualidad: Lun  -  Vie Abril', 'monthly_fee', 800, 'cash', '2025-04-05 16:00:00'),
(1248, 213, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Abril 2025', 'monthly_fee', 600, 'cash', '2025-04-09 15:00:00'),
(1249, 235, 'En sucursal', '1 mallas', 'product', 300, 'cash', '2025-04-10 16:00:00'),
(1250, 162, 'En sucursal', '1mensualidad liquidada\r\n1 vestuario liquidado', 'product', 3000, 'cash', '2025-04-10 15:00:00'),
(1251, 227, 'En sucursal', '3 playeras', 'product', 750, 'card', '2025-04-10 16:00:00'),
(1252, 79, 'En sucursal', '1 playera\r\n1 ballerinas', 'product', 800, 'cash', '2025-04-11 16:00:00'),
(1253, 33, 'En sucursal', 'Pago de mensualidad: HERMANXS L - V (dividida) Marzo', 'monthly_fee', 700, 'cash', '2025-03-05 15:01:00'),
(1254, 33, 'En sucursal', 'Pago de mensualidad: HERMANXS L - V Abril', 'monthly_fee', 700, 'cash', '2025-04-01 16:00:00'),
(1255, 83, 'En sucursal', 'Pago de mensualidad: HERMANXS L - V Abril', 'monthly_fee', 700, 'card', '2025-04-01 15:00:00'),
(1256, 83, 'En sucursal', '1 playera', 'product', 250, 'card', '2025-04-01 16:00:00'),
(1257, 61, 'En sucursal', 'Pago de mensualidad: Lun  -  Vie Abril', 'monthly_fee', 800, 'transfer', '2025-04-09 12:41:00'),
(1258, 29, 'En sucursal', 'Pago de mensualidad: 1 disciplina /  - Diciembre 2024', 'monthly_fee', 600, 'cash', '2024-12-01 12:48:00'),
(1259, 198, 'En sucursal', 'Pago de mensualidad: HERMANXS +1 DISCIPLINA - Abril 2025', 'monthly_fee', 600, 'transfer', '2025-04-06 14:00:00'),
(1260, 199, 'En sucursal', 'Pago de mensualidad: HERMANXS +1 DISCIPLINA - Abril 2025', 'monthly_fee', 600, 'transfer', '2025-04-06 13:00:00'),
(1261, 198, 'En sucursal', 'Pago de mensualidad: HERMANXS L - V (dividida) Marzo', 'monthly_fee', 700, 'transfer', '2025-03-06 15:00:00'),
(1262, 198, 'En sucursal', 'Pago de mensualidad: HERMANXS 2+ DISCIPLINAS - Mayo 2025', 'monthly_fee', 700, 'transfer', '2025-05-20 14:00:00'),
(1263, 199, 'En sucursal', 'Pago de mensualidad: HERMANXS 2+ DISCIPLINAS - Mayo 2025', 'monthly_fee', 700, 'transfer', '2025-05-20 14:00:00'),
(1264, 199, 'En sucursal', '1 playera talla s dance dance ', 'product', 350, 'transfer', '2025-05-15 12:00:00'),
(1265, 198, 'En sucursal', '1 playera', 'product', 350, 'transfer', '2025-05-15 14:01:00'),
(1266, 224, 'En sucursal', 'Pago de mensualidad: HERMANXS L - V Abril', 'monthly_fee', 700, 'cash', '2025-04-08 13:20:00'),
(1267, 213, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Mayo 2025', 'monthly_fee', 650, 'card', '2025-05-07 13:25:00'),
(1268, 201, 'En sucursal', 'Pago de mensualidad: HERMANXS 2+ DISCIPLINAS / BECA OXFORD - Junio 2025', 'monthly_fee', 1250, 'card', '2025-05-07 02:00:00'),
(1269, 242, 'En sucursal', 'pend. $100\r\n1 kit de uniforme', 'product', 1000, 'cash', '2025-05-07 13:27:00'),
(1270, 90, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Abril 2025', 'monthly_fee', 650, 'card', '2025-04-28 13:00:00'),
(1271, 249, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Mayo 2025', 'monthly_fee', 500, 'card', '2025-05-01 17:00:00'),
(1272, 249, 'En sucursal', '1 mallas', 'product', 250, 'cash', '2025-05-01 16:01:00'),
(1273, 173, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Abril 2025', 'monthly_fee', 650, 'transfer', '2025-04-07 14:00:00'),
(1274, 173, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Mayo 2025', 'monthly_fee', 500, 'card', '2025-05-01 13:44:00'),
(1275, 254, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Mayo 2025', 'monthly_fee', 600, 'card', '2025-05-01 13:46:00'),
(1276, 254, 'En sucursal', '1 inscripcion', 'product', 300, 'card', '2025-05-01 17:59:00'),
(1277, 19, 'En sucursal', '', 'Selecciona una tipo de importe', 600, 'cash', '2025-05-05 18:01:00'),
(1278, 255, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Mayo 2025', 'monthly_fee', 300, 'card', '2025-05-06 13:51:00'),
(1279, 255, 'En sucursal', '1 inscripcion', 'product', 300, 'card', '2025-05-06 15:00:00'),
(1280, 204, 'En sucursal', 'Pago de mensualidad: +2 disciplinas / BECA OXFORD. - Mayo 2025', 'monthly_fee', 600, 'card', '2025-05-06 14:04:00'),
(1281, 221, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Mayo 2025', 'monthly_fee', 600, 'cash', '2025-05-06 18:00:00'),
(1282, 234, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Abril 2025', 'monthly_fee', 600, 'transfer', '2025-04-05 13:00:00'),
(1283, 234, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Mayo 2025', 'monthly_fee', 600, 'cash', '2025-05-05 15:00:00'),
(1284, 227, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Marzo 2025', 'monthly_fee', 600, 'cash', '2025-03-03 16:00:00'),
(1285, 227, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Abril 2025', 'monthly_fee', 600, 'card', '2025-05-03 18:00:00'),
(1286, 227, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Mayo 2025', 'monthly_fee', 600, 'card', '2025-05-03 18:01:00'),
(1287, 241, 'En sucursal', 'Pago de mensualidad: 1 disciplina / BECA OXFORD. - Mayo 2025', 'monthly_fee', 400, 'cash', '2025-05-03 13:00:00'),
(1288, 241, 'En sucursal', '1 inscripcion', 'product', 300, 'cash', '2025-05-03 15:00:00'),
(1289, 65, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Mayo 2025', 'monthly_fee', 600, 'cash', '2025-05-02 14:25:00'),
(1290, 239, 'En sucursal', '1 ballerina', 'product', 450, 'cash', '2025-05-03 14:29:00'),
(1291, 238, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Mayo 2025', 'monthly_fee', 600, 'cash', '2025-05-03 16:01:00'),
(1292, 236, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Mayo 2025', 'monthly_fee', 600, 'cash', '2025-05-03 15:00:00'),
(1293, 113, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Mayo 2025', 'monthly_fee', 600, 'cash', '2025-05-03 15:00:00'),
(1294, 140, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Abril 2025', 'monthly_fee', 600, 'cash', '2025-04-04 16:00:00'),
(1295, 140, 'En sucursal', 'Pago de mensualidad: Todas las disciplinas - Mayo 2025', 'monthly_fee', 800, 'cash', '2025-05-02 16:00:00'),
(1296, 243, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Mayo 2025', 'monthly_fee', 600, 'card', '2025-05-05 14:41:00'),
(1297, 194, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Mayo 2025', 'monthly_fee', 600, 'card', '2025-05-05 17:00:00'),
(1298, 194, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Junio 2025', 'monthly_fee', 600, 'card', '2025-05-05 17:00:00'),
(1299, 235, 'En sucursal', 'Pago de mensualidad: Todas las disciplinas - Mayo 2025', 'monthly_fee', 800, 'cash', '2025-05-05 17:00:00'),
(1300, 16, 'En sucursal', 'Pago de mensualidad: Todas las disciplinas - Mayo 2025', 'monthly_fee', 800, 'cash', '2025-05-05 16:01:00'),
(1301, 28, 'En sucursal', 'Pago de mensualidad: Todas las disciplinas - Mayo 2025', 'monthly_fee', 800, 'cash', '2025-05-05 17:00:00'),
(1302, 119, 'En sucursal', 'Pago de mensualidad: 1 disciplina /  - Diciembre 2024', 'monthly_fee', 600, 'cash', '2025-05-05 15:00:00'),
(1303, 49, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Mayo 2025', 'monthly_fee', 600, 'cash', '2025-05-06 15:00:00'),
(1304, 156, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Mayo 2025', 'monthly_fee', 600, 'card', '2025-05-05 15:00:00'),
(1305, 248, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Junio 2025', 'monthly_fee', 600, 'cash', '2025-06-02 15:02:00'),
(1306, 248, 'En sucursal', '1 inscripcion', 'product', 300, 'cash', '2025-06-02 13:00:00'),
(1307, 138, 'En sucursal', 'Pago de mensualidad: Lun  -  Vie Abril', 'monthly_fee', 800, 'card', '2025-05-12 18:42:00'),
(1308, 138, 'En sucursal', 'Pago de mensualidad: Todas las disciplinas - Mayo 2025', 'monthly_fee', 800, 'card', '2025-05-12 15:00:00'),
(1309, 52, 'En sucursal', 'Pago de mensualidad: 1 disciplina /  - Diciembre 2024', 'monthly_fee', 650, 'card', '2024-12-05 13:00:00'),
(1311, 52, 'En sucursal', 'Pago de mensualidad: Lun  -  Vie Febrero', 'monthly_fee', 800, 'cash', '2025-02-02 15:00:00'),
(1312, 52, 'En sucursal', 'Pago de mensualidad: L - V Marzo', 'monthly_fee', 800, 'cash', '2025-03-03 13:00:00'),
(1313, 52, 'En sucursal', 'Pago de mensualidad: Lun  -  Vie Abril', 'monthly_fee', 800, 'cash', '2025-04-04 14:00:00'),
(1314, 52, 'En sucursal', 'Pago de mensualidad: Todas las disciplinas - Mayo 2025', 'monthly_fee', 850, 'card', '2025-05-13 14:00:00'),
(1315, 228, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Abril 2025', 'monthly_fee', 600, 'cash', '2025-04-05 19:56:00'),
(1316, 228, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Mayo 2025', 'monthly_fee', 650, 'cash', '2025-05-14 15:00:00'),
(1317, 84, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Abril 2025', 'monthly_fee', 600, 'transfer', '2025-04-02 13:00:00'),
(1318, 84, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Mayo 2025', 'monthly_fee', 600, 'transfer', '2025-05-02 14:00:00'),
(1319, 84, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Junio 2025', 'monthly_fee', 600, 'cash', '2025-05-14 13:00:00'),
(1320, 185, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Abril 2025', 'monthly_fee', 600, 'cash', '2025-04-04 13:00:00'),
(1321, 185, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Mayo 2025', 'monthly_fee', 650, 'cash', '2025-05-17 14:00:00'),
(1322, 32, 'En sucursal', 'Pago de mensualidad: HERMANXS 1 DISCIPLINA - Enero 2025', 'monthly_fee', 1200, 'cash', '2025-05-20 13:00:00'),
(1323, 32, 'En sucursal', 'Pago de mensualidad: HERMANXS +1 DISCIPLINA :) - Febrero 2025', 'monthly_fee', 1200, 'cash', '2025-05-20 14:00:00'),
(1324, 32, 'En sucursal', 'Pago de mensualidad: HERMANXS 1 DISCIPLINA - Marzo 2025', 'monthly_fee', 1200, 'cash', '2025-05-20 14:00:00'),
(1325, 202, 'En sucursal', 'Pago de mensualidad: +2 disciplinas / BECA OXFORD. - Abril 2025', 'monthly_fee', 600, 'cash', '2025-04-15 15:00:00'),
(1326, 202, 'En sucursal', 'Pago de mensualidad: +2 disciplinas / BECA OXFORD. - Mayo 2025', 'monthly_fee', 600, 'card', '2025-05-20 13:00:00'),
(1327, 256, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Mayo 2025', 'monthly_fee', 300, 'cash', '2025-05-20 14:50:00'),
(1328, 256, 'En sucursal', 'inscripcion', 'product', 300, 'cash', '2025-05-20 15:00:00'),
(1329, 154, 'En sucursal', 'Pago de mensualidad: HERMANXS +1 DISCIPLINA - Mayo 2025', 'monthly_fee', 1050, 'cash', '2025-05-21 11:00:00'),
(1330, 245, 'En sucursal', '1 kit de uniforme ', 'product', 1100, 'cash', '2025-05-23 14:57:00'),
(1331, 244, 'En sucursal', 'Pago de mensualidad: HERMANXS 2+ DISCIPLINAS / BECA OXFORD - Mayo 2025', 'monthly_fee', 600, 'cash', '2025-05-23 14:00:00'),
(1332, 245, 'En sucursal', 'Pago de mensualidad: HERMANXS 2+ DISCIPLINAS / BECA OXFORD - Mayo 2025', 'monthly_fee', 600, 'cash', '2025-05-23 14:00:00'),
(1333, 244, 'En sucursal', '1 inscripcion', 'product', 300, 'cash', '2025-05-23 11:00:00'),
(1334, 245, 'En sucursal', '1 inscripcion', 'product', 300, 'cash', '2025-05-23 14:01:00'),
(1335, 257, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Junio 2025', 'monthly_fee', 600, 'card', '2025-05-24 15:11:00'),
(1336, 247, 'En sucursal', 'Pago de mensualidad: Todas las disciplinas - Mayo 2025', 'monthly_fee', 800, 'cash', '2025-05-12 15:12:00'),
(1337, 251, 'En sucursal', '1 playera', 'product', 350, 'transfer', '2025-05-27 15:17:00'),
(1338, 250, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Junio 2025', 'monthly_fee', 600, 'card', '2025-05-28 16:47:00'),
(1339, 250, 'En sucursal', '1 inscripcion', 'product', 300, 'card', '2025-05-28 14:00:00'),
(1340, 58, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Junio 2025', 'monthly_fee', 600, 'transfer', '2025-05-29 16:51:00'),
(1341, 237, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Abril 2025', 'monthly_fee', 600, 'card', '2025-04-01 16:53:00'),
(1342, 237, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Mayo 2025', 'monthly_fee', 600, 'transfer', '2025-05-02 13:00:00'),
(1343, 237, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Junio 2025', 'monthly_fee', 600, 'cash', '2025-05-31 15:00:00'),
(1344, 236, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Junio 2025', 'monthly_fee', 600, 'cash', '2025-05-31 15:00:00'),
(1345, 236, 'En sucursal', '1 ballerinas', 'product', 450, 'cash', '2025-05-31 15:00:00'),
(1346, 243, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Junio 2025', 'monthly_fee', 600, 'card', '2025-06-02 15:00:00'),
(1347, 243, 'En sucursal', '1 leotardo rosa 4-5', 'product', 400, 'card', '2025-06-02 15:00:00'),
(1348, 234, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Junio 2025', 'monthly_fee', 600, 'card', '2025-06-02 14:00:00'),
(1349, 247, 'En sucursal', 'Pago de mensualidad: Todas las disciplinas - Junio 2025', 'monthly_fee', 800, 'cash', '2025-06-02 14:00:00'),
(1350, 247, 'En sucursal', '1 inscripcion', 'product', 500, 'cash', '2025-06-02 14:01:00'),
(1351, 29, 'En sucursal', 'mallas', 'product', 300, 'cash', '2025-05-10 17:47:00'),
(1353, 245, 'En sucursal', '1 mallas', 'product', 300, 'Selecciona un metodo de pago', '2025-05-12 17:00:00'),
(1354, 204, 'En sucursal', 'Pago de mensualidad: +2 disciplinas / BECA OXFORD. - Junio 2025', 'monthly_fee', 650, 'card', '2025-06-09 20:31:00'),
(1355, 207, 'En sucursal', 'Pago de mensualidad: Lun  -  Vie Abril', 'monthly_fee', 800, 'cash', '2025-04-04 15:00:00'),
(1356, 207, 'En sucursal', 'Pago de mensualidad: Todas las disciplinas - Mayo 2025', 'monthly_fee', 800, 'cash', '2025-05-05 14:00:00'),
(1357, 207, 'En sucursal', 'Pago de mensualidad: Todas las disciplinas - Junio 2025', 'monthly_fee', 800, 'cash', '2025-05-29 13:00:00'),
(1358, 19, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Mayo 2025', 'monthly_fee', 600, 'transfer', '2025-05-05 20:51:00'),
(1359, 19, 'En sucursal', 'Pago de mensualidad: 1 disciplina - Junio 2025', 'monthly_fee', 600, 'cash', '2025-06-02 14:01:00'),
(1360, 19, 'En sucursal', 'Pago de mensualidad: Todas las disciplinas - Junio 2025', 'monthly_fee', 800, 'cash', '2025-06-03 15:00:00'),
(1361, 83, 'En sucursal', 'Pago de mensualidad: HERMANXS 2+ DISCIPLINAS - Mayo 2025', 'monthly_fee', 750, 'cash', '2025-05-29 16:50:00'),
(1362, 88, 'En sucursal', 'Pago de mensualidad: +2 disciplinas / BECA OXFORD. - Junio 2025', 'monthly_fee', 600, 'cash', '2025-06-09 18:18:00'),
(1363, 211, 'En sucursal', 'Pago de mensualidad: +2 disciplinas / BECA OXFORD. - Abril 2025', 'monthly_fee', 600, 'transfer', '2025-04-04 14:01:00'),
(1364, 211, 'En sucursal', 'Pago de mensualidad: +2 disciplinas / BECA OXFORD. - Mayo 2025', 'monthly_fee', 650, 'cash', '2025-06-03 14:00:00'),
(1365, 211, 'En sucursal', 'Pago de mensualidad: +2 disciplinas / BECA OXFORD. - Junio 2025', 'monthly_fee', 600, 'cash', '2025-06-03 14:01:00'),
(1366, 253, 'En sucursal', 'Pago de mensualidad: Todas las disciplinas - Junio 2025', 'monthly_fee', 800, 'card', '2025-06-03 14:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `monthly_fees`
--

CREATE TABLE `monthly_fees` (
  `monthly_fee_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `month` varchar(10) NOT NULL,
  `year` varchar(10) NOT NULL,
  `cost` double NOT NULL,
  `state` varchar(10) NOT NULL,
  `income` double NOT NULL,
  `date_last_income` datetime NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `monthly_fees`
--

INSERT INTO `monthly_fees` (`monthly_fee_id`, `name`, `month`, `year`, `cost`, `state`, `income`, `date_last_income`, `created_at`) VALUES
(56, 'LUNES A VIERNES ', 'Abril', '2024', 800, 'false', 0, '2024-03-25 17:52:57', '2024-03-25 17:52:57'),
(57, 'SABATINO', 'Abril', '2024', 600, 'false', 0, '2024-03-25 17:53:12', '2024-03-25 17:53:12'),
(58, 'HERMANOS LUNES A VIERNES ', 'Abril', '2024', 1400, 'false', 0, '2024-03-25 17:53:30', '2024-03-25 17:53:30'),
(59, 'HERMANOS SABATINO', 'Abril', '2024', 1200, 'false', 0, '2024-03-25 17:53:42', '2024-03-25 17:53:42'),
(60, 'MENSUALIDAD MAYO L-V', 'Mayo', '2024', 800, 'false', 0, '2024-04-25 15:52:50', '2024-04-25 15:52:50'),
(61, 'MENSUALIDAD MAYO SAB', 'Mayo', '2024', 600, 'false', 0, '2024-04-25 15:53:10', '2024-04-25 15:53:10'),
(62, 'MENSUALIDAD HERMANOS MAY L-V', 'Mayo', '2024', 1400, 'false', 0, '2024-04-25 15:53:28', '2024-04-25 15:53:28'),
(63, 'HERMANOS SAB MAY', 'Mayo', '2024', 1200, 'false', 0, '2024-04-25 15:53:45', '2024-04-25 15:53:45'),
(66, 'LUNES - JUEVES', 'Septiembre', '2024', 800, 'false', 0, '2024-09-01 18:33:54', '2024-09-01 18:33:54'),
(67, '1 Disciplina / Clase', 'Septiembre', '2024', 600, 'false', 0, '2024-09-01 18:34:50', '2024-09-01 18:34:50'),
(68, 'HERMANOS / TODAS LAS DISCIPLINAS', 'Septiembre', '2024', 1400, 'false', 0, '2024-09-01 18:39:04', '2024-09-01 18:39:04'),
(69, 'HERMANOS L-J', 'Septiembre', '2024', 1400, 'false', 0, '2024-09-03 16:12:36', '2024-09-03 16:12:36'),
(70, 'HERMANOS 1 DISCIPLINA', 'Septiembre', '2024', 1000, 'false', 0, '2024-09-03 16:13:06', '2024-09-03 16:13:06'),
(71, '1 disciplina', 'Octubre', '2024', 600, 'false', 0, '2024-09-30 17:07:33', '2024-09-30 17:07:33'),
(72, 'LUNES - JUEVES', 'Octubre', '2024', 800, 'false', 0, '2024-09-30 17:08:52', '2024-09-30 17:08:52'),
(73, 'HERMANOS L-J ', 'Octubre', '2024', 1400, 'false', 0, '2024-10-02 17:00:05', '2024-10-02 17:00:05'),
(77, 'HERMANOS 1 disciplina  SAB', 'Octubre', '2024', 1000, 'false', 0, '2024-10-05 10:15:18', '2024-10-05 10:15:18'),
(78, 'Lunes - Jueves', 'Noviembre', '2024', 800, 'false', 0, '2024-10-30 16:15:50', '2024-10-30 16:15:50'),
(79, '1 disciplina', 'Noviembre', '2024', 600, 'false', 0, '2024-10-30 16:16:19', '2024-10-30 16:16:19'),
(80, 'HERMANOS L-J', 'Noviembre', '2024', 1400, 'false', 0, '2024-10-30 16:16:45', '2024-10-30 16:16:45'),
(81, 'HERMANOS 1 disciplina', 'Noviembre', '2024', 1000, 'false', 0, '2024-10-30 16:17:05', '2024-10-30 16:17:05'),
(82, '1 disciplina / ', 'Diciembre', '2024', 600, 'false', 0, '2024-12-03 16:57:05', '2024-12-03 16:57:05'),
(83, 'HERMANOS / 1 disciplina', 'Diciembre', '2024', 1200, 'false', 0, '2024-12-03 18:20:00', '2024-12-03 18:20:00'),
(84, 'HERMANOS / L - J', 'Diciembre', '2024', 1400, 'false', 0, '2024-12-03 19:19:52', '2024-12-03 19:19:52'),
(85, 'L - J ', 'Diciembre', '2024', 800, 'false', 0, '2024-12-04 17:00:06', '2024-12-04 17:00:06'),
(86, 'Lun - Vie', 'Enero', '2025', 800, 'false', 0, '2025-01-08 16:22:45', '2025-01-08 16:22:45'),
(87, '1 disciplina', 'Enero', '2025', 600, 'true', 0, '2025-01-08 16:30:17', '2025-01-08 16:30:17'),
(88, 'HERMANXS L-V', 'Enero', '2025', 1400, 'true', 0, '2025-01-08 20:10:29', '2025-01-08 20:10:29'),
(89, 'HERMANXS 1 DISCIPLINA', 'Enero', '2025', 1000, 'true', 0, '2025-01-08 20:10:52', '2025-01-08 20:10:52'),
(90, '1 disciplina / BECA OXFORD.', 'Enero', '2025', 400, 'true', 0, '2025-01-18 10:19:59', '2025-01-18 10:19:59'),
(91, '+2 disciplinas / BECA OXFORD.', 'Enero', '2025', 600, 'true', 0, '2025-01-18 10:20:27', '2025-01-18 10:20:27'),
(92, 'HERMANXS +1 DISCIPLINA :)', 'Febrero', '2025', 1400, 'true', 0, '2025-01-24 18:17:43', '2025-01-24 18:17:43'),
(93, '+2 disciplinas / BECA OXFORD.', 'Febrero', '2025', 600, 'true', 0, '2025-01-31 19:41:28', '2025-01-31 19:41:28'),
(94, '1 disciplina / BECA OXFORD.', 'Febrero', '2025', 400, 'true', 0, '2025-01-31 19:41:48', '2025-01-31 19:41:48'),
(95, 'HERMANXS 1 DISCIPLINA', 'Febrero', '2025', 1000, 'true', 0, '2025-01-31 19:42:06', '2025-01-31 19:42:06'),
(96, 'HERMANXS L-V', 'Febrero', '2025', 1400, 'true', 0, '2025-01-31 19:42:25', '2025-01-31 19:42:25'),
(97, '1 disciplina', 'Febrero', '2025', 600, 'true', 0, '2025-01-31 19:42:47', '2025-01-31 19:42:47'),
(98, 'Lun - Vie', 'Febrero', '2025', 800, 'true', 0, '2025-01-31 19:43:04', '2025-01-31 19:43:04'),
(99, 'HERMANXS 2+ DISCIPLINAS / BECA OXFORD.', 'Enero', '2025', 1200, 'true', 0, '2025-02-20 19:25:54', '2025-02-20 19:25:54'),
(100, 'HERMANXS 2+ DISCIPLINAS / BECA OXFORD', 'Febrero', '2025', 1200, 'true', 0, '2025-02-21 13:37:07', '2025-02-21 13:37:07'),
(101, 'HERMANXS 2+ DISCIPLINAS / BECA OXFORD.', 'Marzo', '2025', 1200, 'true', 0, '2025-03-03 13:14:22', '2025-03-03 13:14:22'),
(102, 'HERMANXS L-V ', 'Marzo', '2025', 1400, 'true', 0, '2025-03-03 13:14:56', '2025-03-03 13:14:56'),
(103, 'HERMANXS L-V (dividida)', 'Marzo', '2025', 700, 'true', 0, '2025-03-03 13:15:12', '2025-03-03 13:15:12'),
(104, '+2 disciplinas / BECA OXFORD.', 'Marzo', '2025', 600, 'true', 0, '2025-03-07 17:55:06', '2025-03-07 17:55:06'),
(105, '1 disciplina / BECA OXFORD.', 'Marzo', '2025', 400, 'true', 0, '2025-03-07 18:07:40', '2025-03-07 18:07:40'),
(106, '1 disciplina', 'Marzo', '2025', 600, 'true', 0, '2025-03-07 18:13:55', '2025-03-07 18:13:55'),
(107, 'L-V', 'Marzo', '2025', 800, 'true', 0, '2025-03-07 18:14:10', '2025-03-07 18:14:10'),
(108, 'HERMANXS 1 DISCIPLINA', 'Marzo', '2025', 1000, 'true', 0, '2025-03-07 18:15:17', '2025-03-07 18:15:17'),
(109, 'HERMANXS 2+ DISCIPLINAS', 'Marzo', '2025', 1400, 'true', 0, '2025-03-07 18:15:40', '2025-03-07 18:15:40'),
(110, '1 disciplina', 'Abril', '2025', 600, 'true', 0, '2025-04-07 18:46:04', '2025-04-07 18:46:04'),
(111, '1 disciplina / BECA OXFORD.', 'Abril', '2025', 400, 'true', 0, '2025-04-07 19:36:08', '2025-04-07 19:36:08'),
(112, 'HERMANXS L-V', 'Abril', '2025', 1400, 'true', 0, '2025-04-07 19:36:31', '2025-04-07 19:36:31'),
(113, 'L-V', 'Abril', '2024', 800, 'false', 0, '2025-04-07 19:37:09', '2025-04-07 19:37:09'),
(114, '+2 disciplinas / BECA OXFORD.', 'Abril', '2025', 600, 'true', 0, '2025-05-01 16:02:50', '2025-05-01 16:02:50'),
(115, 'Lun - Vie', 'Abril', '2025', 800, 'true', 0, '2025-05-02 17:22:55', '2025-05-02 17:22:55'),
(116, 'HERMANXS 2+ DISCIPLINAS / BECA OXFORD', 'Abril', '2025', 1200, 'true', 0, '2025-05-02 19:45:25', '2025-05-02 19:45:25'),
(117, 'HERMANXS +1 DISCIPLINA', 'Abril', '2025', 1200, 'true', 0, '2025-05-05 16:07:54', '2025-05-05 16:07:54'),
(118, 'Lun - Vie', 'Enero', '2025', 800, 'true', 0, '2025-05-05 18:33:26', '2025-05-05 18:33:26'),
(119, 'Todas las disciplinas', 'Mayo', '2025', 800, 'true', 0, '2025-05-09 18:16:49', '2025-05-09 18:16:49'),
(120, '1 disciplina', 'Mayo', '2025', 600, 'true', 0, '2025-05-09 18:17:02', '2025-05-09 18:17:02'),
(121, '1 disciplina 2 hermanos', 'Mayo', '2025', 1200, 'true', 0, '2025-05-09 18:23:29', '2025-05-09 18:23:29'),
(122, 'HERMANXS 2+ DISCIPLINAS', 'Mayo', '2025', 1400, 'true', 0, '2025-05-12 18:44:48', '2025-05-12 18:44:48'),
(123, '1 disciplina / BECA OXFORD.', 'Mayo', '2025', 400, 'true', 0, '2025-05-12 18:45:17', '2025-05-12 18:45:17'),
(124, '+2 disciplinas / BECA OXFORD.', 'Mayo', '2025', 600, 'true', 0, '2025-05-12 18:45:31', '2025-05-12 18:45:31'),
(125, 'HERMANXS 2+ DISCIPLINAS / BECA OXFORD', 'Mayo', '2025', 1200, 'true', 0, '2025-05-12 18:46:04', '2025-05-12 18:46:04'),
(126, 'HERMANXS +1 DISCIPLINA', 'Mayo', '2025', 1200, 'true', 0, '2025-05-26 18:27:24', '2025-05-26 18:27:24'),
(127, 'HERMANXS 2+ DISCIPLINAS / BECA OXFORD', 'Junio', '2025', 1200, 'true', 0, '2025-05-26 18:28:16', '2025-05-26 18:28:16'),
(128, 'Todas las disciplinas', 'Junio', '2025', 800, 'true', 0, '2025-05-26 18:29:01', '2025-05-26 18:29:01'),
(129, '1 disciplina', 'Junio', '2025', 600, 'true', 0, '2025-05-26 18:30:24', '2025-05-26 18:30:24'),
(130, 'HERMANXS 1 DISCIPLINA', 'Junio', '2025', 1000, 'true', 0, '2025-05-26 18:42:14', '2025-05-26 18:42:14'),
(131, 'HERMANXS 2+ DISCIPLINAS', 'Junio', '2025', 1400, 'true', 0, '2025-05-26 18:43:55', '2025-05-26 18:43:55'),
(132, '1 disciplina / BECA OXFORD.', 'Junio', '2025', 400, 'true', 0, '2025-06-11 19:28:17', '2025-06-11 19:28:17'),
(133, '+2 disciplinas / BECA OXFORD.', 'Junio', '2025', 600, 'true', 0, '2025-06-11 19:28:47', '2025-06-11 19:28:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notifications`
--

CREATE TABLE `notifications` (
  `notification_id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `state` varchar(6) NOT NULL,
  `type` varchar(25) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `notifications`
--

INSERT INTO `notifications` (`notification_id`, `title`, `description`, `state`, `type`, `created_at`) VALUES
(1, 'Juan Lopez ha realizado un abono', 'Juan Lopez ha realizado un abono por la cantidad de $100 en la mensualidad de Enero 2023.', 'seen', 'success-money', '2023-08-06 01:19:40'),
(2, 'Jose Luis no ha pagado su mensualidad', 'Jose Luis no ha pagado su mensualidad del mes de Febrero 2023', 'seen', 'warning-alert', '2023-08-06 17:08:11'),
(3, 'example', 'example', 'seen', 'danger-alert', '2023-08-08 03:38:28'),
(4, 'example 1', 'example 1', 'seen', 'success-money', '2023-08-08 04:03:41'),
(5, 'exmaple-2', 'example-2', 'seen', 'warning-money', '2023-08-08 04:03:41');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `students`
--

CREATE TABLE `students` (
  `student_id` int(11) NOT NULL,
  `student_name` varchar(100) NOT NULL,
  `student_birthday` varchar(15) NOT NULL,
  `student_siblings` varchar(255) DEFAULT NULL,
  `tutor_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `students`
--

INSERT INTO `students` (`student_id`, `student_name`, `student_birthday`, `student_siblings`, `tutor_name`, `email`, `password`, `phone_number`, `created_at`) VALUES
(0, 'Sucursal', '', NULL, '', '', '', '', '0000-00-00 00:00:00'),
(16, 'ALLISON CRUZ MERCADO', '17-09-2015', NULL, 'VICTOR HUGO CRUZ', 'angiemarket8@gmail.com', '$2y$10$kBMSKtYOlAZSZuoIM1iKZu56/smTQBvxEsW86pueSSJXgiJlsBF7W', '8991010215', '2023-09-14 16:27:30'),
(19, 'ANDREA MELISSA DE LEON MARTINEZ', '30-05-2012', NULL, 'CYNTHIA ELIZABETH MARTINEZ MOUNTHON', 'mounthon_love28@hotmail.com', '$2y$10$sBOZmQeZ8b2XC/mu3Yp9p.qV0AaEEXUar6MssbgZpswfoTHpWJP92', '8994217582', '2023-09-14 16:30:47'),
(21, 'ANDREA SOFIA SANCHEZ ZAVALA', '05-08-2012', NULL, 'NORMA ZAVALA', 'multiserviciosorce@gmail.com', '$2y$10$MDi/nJKV09iEzHTnBumqTeB69EFmEhAK/tvG4NlVTXtzUtOZgcrB6', '8994678257', '2023-09-14 16:32:57'),
(22, 'CAMILA VALERIA HERNANDEZ NAVARRO', '07-01-2007', NULL, 'GLADYS NAVARRO', 'camilayhn@gmail.com', '$2y$10$skk9yC3IKMyr.7XdN1CZSuJ08rSan9TpJ9HhD179JLumWfvHhhpYe', '8992309690', '2023-09-14 16:37:37'),
(25, 'ABDIEL ALONSO RODRÍGUEZ NAVARRO', '14-04-1999', NULL, '', 'ALONSO.RODRIGUEZ99@HOTMAIL.COM', '$2y$10$Im8z5HLqjn9a4GpkPPhHxO1J3UWa067azmG9xfSRhMeyM2/yfGBA2', '8994983914', '2023-09-20 15:50:33'),
(26, 'BRANDON ALEXIS SANDOVAL RUELAS', '15-02-1997', NULL, '', 'BRANDONRUELAS@OUTLOOK.COM', '$2y$10$nMXfK1vL8RQUpyppTV7e6e6svQPAqo/XWg2hJI9lbQv.Baxr5d1qi', '8994198834', '2023-09-20 15:59:34'),
(27, 'EDNA SARAHÍ CHÁVEZ', '31-10-1997', NULL, '', 'SARAHICHAVEZ@HOTMAIL.ES', '$2y$10$t3IKM2zbwa40zjtstOqDkeSXQE7jGJP/hlM3Dg3J9WiAvOKaKvt7G', '8991571326', '2023-09-20 16:01:38'),
(28, 'ELISA SISNIEGA MEJÍA', '19-11-2014', NULL, 'MONICA MEJÍA', 'KOMUNIKO.MEXICO@GMAIL.COM', '$2y$10$nouCZCzjHIJOhDxhnHHuGe1Nl0A86lZzeHg6WgIsBwAHTAObnx/we', '8991631916', '2023-09-20 16:02:36'),
(29, 'FÁTIMA SOFÍA ORTEGA RICO', '04-08-2016', NULL, 'CARLA SARAHÍ RICO', 'CARLASANMIGUEL@GMAIL.COM', '$2y$10$bCC/kjQUlnCEYfcX/aY9l.jF2JWQ4W9hG8aMppU6dlL6.NBJoL73m', '8992277715', '2023-09-20 16:03:42'),
(30, 'GALILEA MONTSERRAT PLATA HERNÁNDEZ', '26-04-2004', NULL, 'CLAUDIA IVETTE HERNÁNDEZ RAMÍREZ', 'GALIPLAT26@GMAIL.COM', '$2y$10$O/eJBYU0wghJn28m9oCbJOeOQVkDgB2343P7uMmGydKhAEOeIq33a', '8991235652', '2023-09-20 16:05:12'),
(31, 'ISABELLA AVENDAÑO GALLARDO', '24-09-2013', NULL, 'BRENDA ISABEL GALLARDO CRUZ', 'RSBRENDA@HOTMAIL.COM', '$2y$10$.PQM.1NHoibT6/XwS9MvrOqRnXU6J9Qs3eS7Fg3NFaCE1j55ZEOvW', '8991221707', '2023-09-20 16:39:33'),
(32, 'IVANNA ASTRID NAVARRO TORRES', '27-09-2014', NULL, 'ARELY MARLENE TORRES BERRONES', 'mareciita_97@hotmail.com', '$2y$10$hi5cjobFJBDKEOFTiYoUDuClJafWaeHUnu7NpFT1.hBjoFQWgIZPy', '8992506843', '2023-09-20 16:41:32'),
(33, 'JABNIA OLIVARES QUIÑONES', '07-04-2005', NULL, '', 'JABNIAOLQQ@GMAIL.COM', '$2y$10$0gdKGU3fe3hljldmylP4KOhNqrvthYwn80TrCGVNtlHNUksRDWB6m', '8126501367', '2023-09-20 16:43:30'),
(37, 'KAMILHA ZOÉ HERNÁNDEZ ZAMORA', '25-04-2011', NULL, 'ULISES HERNÁNDEZ ROSALES', 'ULISESHR848@GMAIL.COM', '$2y$10$f3P69DIS.wYhkeiSmAQ7Qe2pZkhEvB2xnrpaogxUw/mapzXU2U/XK', '8993188352', '2023-09-20 17:16:04'),
(39, 'LESLIE ROMINA LEIJA HERNÁNDEZ', '27-04-2006', NULL, 'ELOY LEIJA CEDILLO', 'LESLIELEIJA27@GMAIL.COM', '$2y$10$qMbxfVAPLQjyAasygepNA.Jq0YEP0BHfLdGkTtwF8QCxlr5Koi1zS', '8991163006', '2023-09-20 17:22:46'),
(45, 'MARTHA JULIETA GONZÁLEZ HERRERA', '05-01-2007', NULL, 'SERGIO GONZÁLEZ', 'SGONZALEZBERRA@GMAIL.COM', '$2y$10$jQ8pEeBicjrxbAcg95uowuRvSyX6kL7rnOFVjEZDTbh.033lFtGF6', '8999562627', '2023-09-20 17:34:35'),
(46, 'MIRANDA GARCÍA CASILLAS', '05-05-2008', NULL, 'CYNTHIA CASILLAS PEÑA', 'CYNCAS47@GMAIL.COM', '$2y$10$9hEXTN61kirdZMsf7bqvxuJgBmRiY0hiftOhHmscxeqRLX6nIhQ/O', '8998725017', '2023-09-20 17:35:30'),
(47, 'MYA KATHLEEN CANTERO CASTELLANO', '30-09-2008', NULL, 'ADALBERTO CANTERO', 'MYA.CANTERO.CASTELLANO@GMAIL.COM', '$2y$10$x9JxbQ5v29TIuW.VaPVZReyWrTkKKlVoscCXqyHDHicduTpfW5OS6', '8991822140', '2023-09-20 17:36:21'),
(48, 'OSCAR ANTONIO GARCIA CHAVIRA', '20-11-1989', NULL, '', 'OSCARGCHAVIRA@OUTLOOK.COM', '$2y$10$ZqfIbH4ZhMsh8eYLCwGYReLENGkWCbb/urJTfIriagWbxeKUTm6Z2', '8992082231', '2023-09-20 17:37:28'),
(49, 'PAOLA GOLPE MALAGA', '18-06-2004', NULL, 'GERMÁN RIVERA LOPEZ', 'GOLPEPAOLA508@GMAIL.COM', '$2y$10$o6kxvUIuLe4VhWvzpEAb8.WfSO1qzF3FbepJxem5TQk6yXEHPXlAi', '8993169035', '2023-09-20 17:38:12'),
(50, 'PAULINA SALGADO PEDRAZA', '11-12-2017', NULL, 'VALERIA PEDRAZA', 'DULCEPEDRAZAGRAJEVA@GMAIL.COM', '$2y$10$Twgah0XxvF/9O1KX9vv1H.Dn/OBludnjZ2ge7A1ez8n9AgUbEJhQW', '8991191010', '2023-09-20 17:39:31'),
(52, 'REGINA COELÍ RODRÍGUEZ CASTELLANO', '21-08-2018', NULL, 'CECILIA CASTELLANO', 'CECILIACASTELLANO@OUTLOOK.ES', '$2y$10$uPZ2y8.B9x5WeHemIgmzm.780wLpkyN6chKFzg36dvnrR8tlhtcCq', '8998719334', '2023-09-20 18:00:22'),
(58, 'SIOMARA VALENTINA DE LEÓN NAVARRO', '30-10-2007', NULL, 'MARIA IDALIA NAVARRO SÁNCHEZ', 'VALEDELEONN@GMAIL.COM', '$2y$10$FxNhSxaJc6xsEeoUAgJpVe6iYdn9wlC7vQkvKshoo7JSchGuXHBBi', '8992831912', '2023-09-20 18:21:49'),
(61, 'SOFÍA VANESSA VELÁZQUEZ GUILLÉN', '21-05-2013', NULL, 'MARIA TERESA GUILLEN YOUNG', 'TERE_GUILLEN@LIVE.COM.MX', '$2y$10$SDbYYQZ8qzoDBxopy75/Dum9R1chutkrasrEq3.GUIDNmNnHQkYtS', '8999686704', '2023-09-20 18:39:39'),
(62, 'THAMARA SEGOVIANO MONFORTE', '26-09-2011', NULL, 'ALEJANDRA MONFORTE', 'ALEJA.MONFORTE@HOTMAIL.COM', '$2y$10$dFY3NPE2Vz0xZsNINBE3Me2GiYD5cQ6MbhiVuE4oFIlN7V9M0QsH.', '8992466606', '2023-09-20 18:47:21'),
(63, 'VIANEY BAUTISTA MARTÍNEZ', '29-05-2009', NULL, 'CRISTINA MARTÍNEZ HERNÁNDEZ', 'CROSAVI17@GMAIL.COM', '$2y$10$uptIJp7QR8TVJHl/SFPVoewUunmi/ZFZzorlYw7RNzCYPl1J5Tz4C', '8992576684', '2023-09-20 18:48:37'),
(65, 'VICTORIA ISABEL GARCÍA CONSTANTINO', '01-04-2015', NULL, 'PAOLA CONSTANTINO GARCÍA', 'DOCTORACONSTANTINO@HOTMAIL.COM', '$2y$10$e/5cVxPv6vs0o7MQ.beaW.jvprtS.3353Ud3eg6Iguo2FFUImENeW', '8999584269', '2023-09-20 19:02:12'),
(69, 'MARTHA SUHEY HERNÁNDEZ TORRES', '23-04-1995', NULL, '', 'SUHEYTORRES07@GMAIL.COM', '$2y$10$dD5c9HO8mQ3JGC050eqYuuls7z3VAb7JWmnpqplyLW8up9ofySyES', '8991705057', '2023-09-22 16:46:27'),
(71, 'ALMA HEPSIBA BAUTISTA', '03-07-2008', NULL, 'EVENEZER BAUTISTA PEREZ', 'MOONKYBAUPE@GMAIL.COM', '$2y$10$BUXj.uy0zSmba.8VVtWx2.ZVhoPsS6RVJEw01SF3iQh1sRqHW651a', '8994994948', '2023-10-25 14:22:32'),
(79, 'VALENTINA ARIAS GARCIA', '04-07-2013', 'VICTORIA ARIAS GARCIA', 'MARIBEL GARCIA', 'AMGG84@GMAIL.COM', '$2y$10$/ZxA1IURr6xrIkA7C1dF6umjykZ1cuTBu11BNP4XxXcLGGAKZ2h/q', '8999595143', '2023-10-31 16:22:08'),
(80, 'ALBA PATRICIA TORRUCO CUEVAS', '12-02-2016', 'HECTOR ERIBERTO TORRUCO CUEVAS', 'SABINO ERIBERTO TORRUCO', 'PATRICIACUEVAS1241@GMAIL.COM', '$2y$10$XYSC7fDAeMc5e36ILcXEUecseym68vWs0XwP3KX/GsHNvfY32qr3C', '8999275101', '2023-10-31 16:24:39'),
(83, 'AMERICA OLIVARES ', '20-12-1998', 'JABNIA OLIVARES ', '', 'JABNIAOLQQ@GMAIL.COM', '$2y$10$rJuY/YFGleUNy1YxcLaGUO6bfl7SEmCC0lQLrFGNB/V8IZVNrDxUK', '8994977318', '2024-03-25 15:05:55'),
(84, 'CRISTINA RODRIGUEZ MENDOZA ', '13-12-2000', NULL, '', 'cristyred1300@gmail.com', '$2y$10$hoYDwy6k5kLqEipChqdxV.GCoqt.gWeoDkIqz42rYUB0sk2.IQRhm', '8991194800', '2024-03-25 15:11:09'),
(88, 'FRIDA SOFIA RANGEL OCHOA ', '26-09-2014', NULL, 'MARISOL OCHOA ', 'maissol.8a@hotmail.com', '$2y$10$wu5hNnsZ2MgukmSVQBxhpeC9Q68nnozw26i6idpzuFgUMa8Z37ZoC', '8992912234', '2024-03-25 15:24:33'),
(89, 'HANNA MELO ALPIREZ', '28-04-2008', NULL, 'IVETH ALPIREZ', 'ivettealpi80@outllok.com', '$2y$10$FnDVCXwFNX/C/rDmjH5u5u8yOKwXJZiNpG25lkvYfnbiQXvJ/R71u', '8992447574', '2024-03-25 15:27:10'),
(90, 'ILEANA TREVIÑO GONZALEZ', '30-03-2010', NULL, 'ROSARIO GONZALEZ ', 'rosarioglezz1@gmail.com', '$2y$10$N0i8XYoejB4p2nKUVKJL5uPoBz7k.luT/u/ujmkBCVnMMOM/JxggK', '8993071916', '2024-03-25 16:00:11'),
(95, 'MIRANDA FRENESI MARTINEZ SANDOVAL', '23-05-2008', NULL, 'MIREYA SANDOVAL', 'martinezsandoval@gmail.com', '$2y$10$.6zllmMoqf1cJz/6e2.XSO6zXT1K7yhJosyhJoZz8vEbrLJhsZR4e', '8993549314', '2024-03-25 17:21:27'),
(110, 'ANGELINA MICHELLE ANTUNEZ SANDOVAL', '03-03-2006', NULL, 'MARIELA JAZMIN RUELAS ', 'martinezsandovalmirandafrenesi@gmail.com', '$2y$10$uYObOXnPVwDlD4TP2IC5GebUe6X2y4uBbeAWfB.VjoSXZf5HS6tFK', '8994816009', '2024-04-05 15:02:07'),
(113, 'DULCE MARELI ARGUELLES VERA', '04-06-1988', NULL, '', 'dulcemarely_av@hotmail.com', '$2y$10$JPx0fu86YuW0uvwCqCuiEO30RNY4YT/FJWQazpS5UqxWWVnjJUMqS', '2221882832', '2024-04-15 17:50:46'),
(116, 'MARIA FERNANDA HERNANDEZ ROMAN', '20-07-2008', NULL, 'JUANA ROMAN DIAZ', 'j_hernandezb@hotmail.com', '$2y$10$xvfYYhcP4X57TO7wGvGRbedzCUApit8w6mW0u.K16aMLlf.5n6eQm', '8992454973', '2024-04-17 18:05:09'),
(119, 'LUCIA GARCIA REBOLLEDO', '16-08-2015', 'INDIRA GARCIA REBOLLEDO', 'INDIRA REBOLLEDO FLORES ', 'indirareflo@gmail.com', '$2y$10$weRFatfIJYzemQ2NN.mf.O3Y2SGXSnH5XqIyjq2HevRvwxyT71tvG', '8999119476', '2024-04-18 16:42:57'),
(137, 'Camila Cantú Beltrán', '11-11-2000', NULL, 'N/A', 'ballerinadanzayarte@gmail.com', '$2y$10$KFstfB/ZlDoMzQ8rEaiBUu1eE7n1FM3Hm7ibJj87wUGduV8JX7H5e', '8994604066', '2024-08-29 20:03:13'),
(138, 'Alyson Victoria Medina Avila', '17-03-2012', NULL, 'Alejandro Medina Briseño', 'alex.m91@live.com', '$2y$10$OzR5xb6g7xGFPgNWRfD10e8XGmGFucjRnEuFTVh68zcTEYpcCBomq', '8992420437', '2024-08-30 17:05:27'),
(140, 'Andrea González Snell', '12-03-2014', NULL, 'Brenda Snell Yunes', 'brenda_senuu@hotmail.com', '$2y$10$JqJwIaH5pSRaH6Bm/OX76OQhvfd2uBFUVSuZh7AdEFzEcpoealKq6', '8991220496', '2024-09-02 16:40:35'),
(146, 'Paola V. Martínez Mendez', '19-01-2013', NULL, 'Rocío Del Carmen Méndez O.', 'n/a', '$2y$10$F4RC5V2qaGmG.KKWwqOJuuHvaRHEqLhq2qYKQ9zv3i.ErHQARUgEm', '8992519388', '2024-09-03 15:29:21'),
(147, 'Juan Antonio Martínez Méndez', '05-02-2008', NULL, 'N/A', 'pacojones2674@gmail.com', '$2y$10$edI3gWDLSlbLLE248/kPguRAE5H6.Qp5mZcaOJKianxXlA.MymsRe', '899432339', '2024-09-03 16:30:40'),
(151, 'Odette Márquez Moreno', '28-06-1999', NULL, 'N/A', 'ballerinadanzayarte@gmail.com', '$2y$10$3OYVU7VCcxoRm20qQsSaneKi9Bvs3/ylxsyFn9JGfjlFoY8cLX0ii', '8999137316', '2024-09-06 15:34:40'),
(153, 'Arlette Ramos Galaviz / Ariana Ramos Galaviz', '29-03-2022', NULL, 'Nayeli Galaviz', 'Nayely.gg@hotmail.com', '$2y$10$WEhgbB0Ee.mnpOJTNkhEMObupQ23ZUyuuI46w6CsHAKwgEOznE3ca', '9562702458', '2024-09-07 09:48:35'),
(154, 'Valeria Rubi Preciado Saldaña / Zulema Mabel Preciado Saldaña.', '11-10-2012     ', NULL, 'Rubi Zulema Saldaña', 'mabelita.1314@gmail.com', '$2y$10$VgabfdlSY4E15V9EwA71he6v6boS0naE0ORb3MAf6n6cvzNKyWM8C', '8998993690', '2024-09-07 10:05:12'),
(155, 'Victoria Amaité Del Ángel Vázquez', '29-12-2020', NULL, 'Claudia Vázquez', 'cvdelamancha92@gmail.com', '$2y$10$iuCI/mgvLwi28nik2NRDiOMUISCxiMA81w79E9VREzylWrlWhYA8a', '899 218 2732', '2024-09-07 10:16:40'),
(156, 'Barbara De León Sánchez ', '22-11-2022', NULL, 'Sarahí Sánchez Rubio', 'sarahi.sanchezc@gmail.com', '$2y$10$NagN7HHFCF/vKPR8A8m6UunWwXnJIAhYBujDk4iUQMX1YL/9F6d9a', '8343040814', '2024-09-09 16:22:50'),
(158, 'Sofía Herrero Galván', '15-12-2008', NULL, 'María Del Rosario Galván Romero', 'galvanrosario@yahoo.com', '$2y$10$ze84f87ynZVAu5gxhEnUV.qo6fmqEJTVRyqRvivYiwnL7FUcXIX9u', '8991221071', '2024-09-09 18:09:30'),
(159, 'Silvia Patricia Orta González', '03-07-1976', NULL, 'N/A', 'ballerinadanzayarte@gmail.com', '$2y$10$aLwmhhByilyvdU0rhyTpMe8hzma8b1IzxLnK.irrr02VzYNCV0XbG', '8993526520', '2024-09-09 18:33:09'),
(162, 'Frida Mayte Bonilla Resendiz / Mia Pamela Bonilla Resendiz', '26-01-2009     ', NULL, 'Melody Aida Resendiz Cortes', 'melodyaida111@gmail.com', '$2y$10$wKr28j/MHbvx8mGL3VMvq.qqOVH7WYLUOTgHa5R3/Ev5MDObm3z1u', '8992305202', '2024-09-18 19:21:21'),
(163, 'Giana Ocañas', '26-04-2017', NULL, 'Ana Laura Ocañas', 'laueacastiyo4@gmail.com', '$2y$10$QgFjDm8UmLWey7bueu0xjuxywiTvcjUysykxogqOYfkyI6TaqrbJK', '9566511955', '2024-09-21 10:55:04'),
(165, 'Luciana Ocañas', '08-06-2020', NULL, 'Ana Laura Ocañas', 'lauracastiyo40@gmail.com', '$2y$10$6Wgr7BW90f4ykdTiVACeXO7uq6NHj5tKHAzWHQwsefBw1NtLpeziC', '9566511955', '2024-09-21 11:13:34'),
(171, 'Lucia Isabella Aguirre Silva', '08-11-2019', NULL, 'Edith Silva - Lucia Auces - Javier Aguirre', '-', '$2y$10$PbIJIgIUywr6MMf03157Qumv.8t9CdY.dtlVO4/L2f0kPgpViIkcu', '8999369108', '2024-10-07 19:30:25'),
(172, 'Aldo Karim Manzanares Barrera', '02-05-2005', NULL, '-', 'Karimmanzanaresb@gmail.com', '$2y$10$a0gjEnHgcWARhEJKbfuVVOVn2SbJY6UgExDTsBAiwNKWbt3nOitiy', '8994829639', '2024-10-10 17:47:12'),
(173, 'María Del Carmen Borja', '05-06-1991', NULL, '-', 'borjamay506@gmail.com', '$2y$10$UaakrPY1YeB3lrMMTFdV5eWsC3LeckD2FNsTUz8zPjnHiUOnso3Cm', '5543534194', '2024-10-10 17:51:30'),
(174, 'Legna Mayte Del Angel Amada', '18-11-2004', NULL, '-', 'legnadelangel18@outlok.com', '$2y$10$n8w5WhqgUgy3rH90FYIj9ukYu8NYBOLWUSRX8LHUELbeziQZe20Du', '8991039452', '2024-10-10 17:59:41'),
(179, 'Ingrid Abril Cruz Marquez', '12-10-2015', NULL, 'Celia Marquez Del Angel', '-', '$2y$10$JhtlzIJdgcVfA0r.Ml90keS.gTTuvNpIkjuOyxRrhH.5XmH4joFPG', '8994115236', '2024-10-19 09:22:56'),
(185, 'Isabella Cisneros Gastelum', '03-05-2012', NULL, 'Noreyda Gastelum', 'marianga1178@gmail.com', '$2y$10$6djXOGN3HmuTgtCCmFsvb.WSQLjsK1sM3ZOPH03r7yZhBXGYPqb6u', '8991191429', '2024-10-21 19:19:52'),
(190, 'Daira Victoria Cavazos Alonso', '03-12-2010', NULL, '-', 'dairavictoriac@gmail.com', '$2y$10$1zzXA/skWcFiHTseILe14uDTTcS1I/15KHF6qrSKn6K5eDeLrOIPi', '8994502321', '2024-10-23 18:48:50'),
(194, 'Montserrat Morin Chávez', '15-08-2008', NULL, 'Sandra Chávez Lima', 'sandra_ch@hotmail.com', '$2y$10$nVev9nGXEn26owLTS/IBEuv7cDlDVt/kSbGMUIeWReC4o6cJKgGDO', '8991221356', '2024-11-06 19:34:49'),
(196, 'Marco Azael Quintero Hernández', '26-12-2001', NULL, '-', 'marcosshdz12@gmail.com', '$2y$10$V2CJatsK325AtvZtBx.cauMsvHkL6iXYAjkbL827hh5aBOBel.YIC', '8995456741', '2025-01-08 17:21:22'),
(197, 'Alix Anette Hernández Salas', '13-01-2018', NULL, 'Ricardo Hernández García', 'hernandez.g.ricardo85@gmail.com', '$2y$10$.XorNWiurb5oNkcFR14otOY.4pmARh5hVS7RLqHDiRpmq4MNrEzP2', '8993386533', '2025-01-08 19:59:56'),
(198, 'Alondra Stefany Sánchez Alaffita', '12-12-2002', NULL, 'Irene', 'alondrastefanysza@gmail.com', '$2y$10$1bayE0M8BhsmNIz5NtIm5OoWhYblrQUhe2AjUe9YzXhOupx7AFvPq', '8999838035', '2025-01-08 20:08:18'),
(199, 'Irene Del Carmen Alaffita Hernández', '11-03-1975', NULL, '-', 'alondrastefanysza@gmail.com', '$2y$10$9xHntZMOdLkGKsclF3vSGO0JQYOyR9BnRj5h9bZHKpo0bgxszzvfO', '8999838035', '2025-01-08 20:09:26'),
(201, 'Adara Guerra Sevilla - Sara Guerra Sevilla', '15-07-2015    3', NULL, 'Martha Lizeth Sevilla Medina', 'Inca.martha@gmail.com', '$2y$10$M3ksddCXbEgy5kp8tFBHWO9R1T4b/CrQlUX3HzyiNOqpBwuVsw0gK', '8992090138', '2025-01-13 18:53:35'),
(202, 'Marian Vilaboa Luevano', '26-09-2012', NULL, 'Laura Aidé Luevano Ramos', 'luevanolaura@gmail.com', '$2y$10$B76QVY25NpGabExIrHPNn.hMdEjL6mRsi/ApBEZZ/7pqCBVTTvpnW', '8993187171', '2025-01-14 17:19:25'),
(203, 'Kiara Basilisa Paez Andrade', '28-03-2019', NULL, 'Yazkara Aylin Andrade Rodríguez', 'aylin.rdz1224@gmail.com', '$2y$10$hXXjX4L1.5/Ao1Bv1u87nujcqkVTdi9mUTY1sfKKBR3Bl3hHEzX0G', '8991653113', '2025-01-15 19:16:15'),
(204, 'Gloria Natalie Molina Delfin', '28-12-1999', NULL, '-', 'glorianmld@gmail.com', '$2y$10$0bOSW/4ERcwkPZWN9qIy5uxAwolFwhPdiZ8yGrJtoSx/8x3LkqHom', '8994574424', '2025-01-15 19:21:44'),
(206, 'Jesús Emanuel Márquez Fonseca', '24-08-2000', NULL, '-', 'jes_man_24@outlook.es', '$2y$10$g2VyaQnKNuRxr2gqyV95s.zPkFfCkGsgfZwlaU3aUbxzdpWJHM9UO', '8998585286', '2025-01-15 19:51:06'),
(207, 'Anette Carolina López Martínez.', '24-05-2013', NULL, 'Rosangela Martínez Ramírez', 'rosangela_emr@yahoo.com', '$2y$10$N1vh2b/HtSY1jDYSynLBs.1MolTOBDgqDREPhuWBU/7CMVExwAMh2', '8999563309', '2025-01-22 20:07:01'),
(208, 'Ángel Ricardo Raymundo Tirado', '19-05-2010', NULL, 'Gabriela Tirado Domínguez.', 'yaelraymundo20@gmail.com', '$2y$10$sA8rFbbQKaHmFST6lVPO/.nsez79quZbfV4uL.nkR9P9UZBdgj4Fy', '8991157888', '2025-01-22 20:09:36'),
(209, 'Jese Yael Raymundo Tirado', '20-12-2006', NULL, 'Gabriela Tirado Domínguez.', 'yaelraymundo20@gmail.com', '$2y$10$Js7nOig9.D52z47jP5Z9CudgarV9xM867e2bEckiQTsalRFEOAaa2', '8991157888', '2025-01-22 20:10:48'),
(211, 'Camila Alizee Barrera Leal', '26-01-2015', NULL, 'Ilse Leal Rodríguez', 'ilse.leal2390@gmail.com', '$2y$10$QU7aNXvjU/5nSB1A2X2HYOV7fwPiXJcfMWAIoka4.Fml40KfFgPmC', '8996473299', '2025-01-23 17:58:37'),
(212, 'Carolina Rodríguez Rodríguez', '11-10-2019', NULL, 'Itati Carolina Rodríguez Valencia', 'itatirdzv@gmail.com', '$2y$10$ZmtujnD8z2G8vUdgFnSX0en3h3wWZtHZ.obZUFn51OmUIi4pK5IDK', '8991106062', '2025-01-25 12:11:30'),
(213, 'Thisha Elán Cotero Rodríguez', '28-09-2021', NULL, 'Cynthia Rodríguez', '-', '$2y$10$02Y83DdlHNblqwWMfmjQC.7Tifcj622tMjUL0OXRPKPfA80Lko2B6', '8999620082', '2025-01-29 18:08:20'),
(214, 'Elsa María Aguilar Rodríguez', '18-11-2021', NULL, 'Dagna Rodríguez Garza.', '-', '$2y$10$uVWO0f2I13wfaFs7XS/jHeQ3DMDTg8vpAZNRyzPzf/zsLJldOZsCK', '8999596444', '2025-01-29 18:11:20'),
(216, 'Julihanna Armas Bueno', '05-10-2017', NULL, 'Julio César Armas Ramírez', '-', '$2y$10$9REWI.Lk4nEfikhIF/U13ejY9COTrRfshW1PzDd7dOpQw4RcD40IS', '8993295613', '2025-02-04 17:21:58'),
(221, 'Roberto Martínez Pérez', '28-02-2016', NULL, 'Denise Pérez Trejo', 'kittdenn@yahoo.com.mx', '$2y$10$mQAbQ0mJH9gPNjC/K9OHNOpKg1QEYVtMBcJtNqqNtBrxgxrtk5w4S', '8998760250', '2025-02-08 13:09:05'),
(223, 'Isabella Itzayana Torres Villa', '20-11-2017', NULL, 'Ana Elizabeth Villa Garza', 'vana_elizabeth@hotmail.com', '$2y$10$dVdxz0Km7CqdgunM/VKxSulDJRX8T3RVsiqL/1fVHE5eiHtYudTHC', '8991550339', '2025-02-18 17:24:39'),
(224, 'Yvonne Aza Tapia', '28-01-2017', NULL, 'Cynthia Tapia Rodríguez', 'cynthiatapia54@gmail.com', '$2y$10$4IqlhECgNznsGglk9d7LpOnm5VKe.X8uLTP8hOEY/Y80mOCYaU/OK', '8991105909', '2025-02-18 18:49:49'),
(225, 'Laura Naian Cortez Sánchez', '29-01-2001', NULL, '-', 'laura.crtz.01@gmail.com', '$2y$10$wlCDq9frG/dUJTS2LZe8AeI82OVQgR7sfkLrR2K5ARZdEejFulgMi', '8991566862', '2025-02-19 20:02:44'),
(226, 'Natalia Elizondo Cantu', '01-06-2010', NULL, 'Melissa Cantu Chapa', '-', '$2y$10$vBtyJSxTtcMp3K0IlJYd8uMX1h8.Qy6EE71bJ0Vtjkld4TW/6y7LC', '8991130151', '2025-02-21 13:09:32'),
(227, 'Gabriela Tirado Domingues', '17-09-1982', NULL, 'Mamá de tkd (Jesé, Gabriel y Ricardo Raymundo).', 'gabytyrado@gmail.com', '$2y$10$16x5jpAYyMBWEjb2.BVBw.FoLjP.875YPssuhuxlJG169.mzf6Rg2', '8991157888', '2025-02-21 21:30:57'),
(228, 'Romina Paulette Rodríguez García', '19-11-2020', NULL, 'Yanhela Guadalupe García Elizondo', 'yanhela_97@hotmail.com', '$2y$10$SNRjZuhd5mvtssyF8ztdIuQI7eauosnG/D.WBgz7jTX3aMCZT8V7S', '8995018120', '2025-02-26 19:50:47'),
(229, 'Alexia Geraldine San Román Aguirre', '03-01-2021', NULL, 'Yocelin Sanromán Rodríguez', 'yocelin5698@gmail.com', '$2y$10$VmFUSfwe3nE96CfhI0Usdu1mLuWBC7peLFg2wcjLJQU/k1xkdZYGq', '8999639669', '2025-02-27 18:27:40'),
(232, 'Melany Sofía Castellanos Armendáriz', 'Rosalinda Armen', NULL, '22-12-2015', '-', '$2y$10$kFMc1fqT28o0xc5emQxV3Ox8nI1Dbisj5lE88VpTXCGN7edV1p9Ve', '8991018452', '2025-03-05 20:19:02'),
(233, 'Marifer Rodriguez Martinez', '21-12-2019', NULL, 'Nereida Martínez', '-', '$2y$10$gQQKolaCg/Cpurxj3gUu7OMAW0eTpmGcB.seunNPuPsxw7829j52y', '8992855515', '2025-03-08 11:43:11'),
(234, 'Miranda Salazár Martínez', '16-09-2019', NULL, 'Cynthia Martínez Palacios', 'cyndy76@hotmail.com', '$2y$10$Jr5sOygW8x13NH04sweTueMDlwfpjDfctyTtx//EMcTe0ZuRoAOC.', '8999369147', '2025-03-08 12:27:08'),
(235, 'Alexa Fernanda López Betancourt', '14-11-2014', NULL, 'Alejandra López Betancourt', 'alelopez0292@gmail.com', '$2y$10$6fDQW5G7A2UvVIHNOyFle.9Ji8esg9xEbdwQJdunvoG7K2VT9Uiwe', '8992449761', '2025-03-18 16:09:13'),
(236, 'Lidia Yamileth Ceballos Guzmán', '22-07-2011', NULL, 'Cinthia Guzmán', 'cinthiadenisse95@gmail.com', '$2y$10$V06ohS6OKGEIFIPzEedJPeVAmBdSVniL/dG8ZTa5rjGpn7JhPNtEu', '8992560632', '2025-03-18 16:14:53'),
(237, 'Ilse Anais Villarreal Orozco', '31-08-2022', NULL, 'Elvira Yazbereni Orozco López', '-', '$2y$10$VRKq62OvlIbwjB15SqcU6uQFV4NWz1RXmwQF42IHPxhzPkDd./CTG', '8992391719', '2025-03-18 17:20:52'),
(238, 'Emma Marcelina Ceballos Torres', '26-01-2022', NULL, 'Alba Torres', 'd15anna@hotmail.com', '$2y$10$IqwRmR1jqKwUoUsxf7CGBOI5ad/LJjPjekR6ZpMwhgOy2rhHg4ZSS', '+1 (210) 716-8018', '2025-03-21 16:32:14'),
(239, 'Mirka Paulett Ramírez Castillo', '10-07-2017', NULL, 'Karla Paola Castillo Limón', 'castillolimonK@gmail.com', '$2y$10$D.Rfm88H7aUnukjGJT3u0.U0dq1971blhPRausEHoKrDqiNXk86O6', '8994958835', '2025-03-22 09:49:05'),
(240, 'Jacob Cabello', '11/10/2011', NULL, 'Mama de jacob?', 'numero de mama: 899 149 2673', '$2y$10$REppqdk3PoyiVYY7KQotuun1xH9bQQ04E5YOyaSbVQuwBelkZEFPm', '8998634215', '2025-03-23 14:15:07'),
(241, 'Maria Emilia Gomez Mojarro', '02-09-2019', NULL, 'Soledad Mojarro', 'sol_mojarro@hotmail.com', '$2y$10$9VYsXoD3V8rSFeH7Mi4F8.GVLzHN22xjJYcJ9ZaF6rUz7JugHzdpm', '8992175593', '2025-05-03 11:05:15'),
(242, 'Jhosmaly Gina Leyva Hernández', '09-06-2022', NULL, 'Teresa Hernández', 'Leyva322@gmail.com', '$2y$10$LKg2Nq2.N1ovHPH0Hdt/i.OdR8WtgKwHuTqn664ULaFO0Bat8dJJq', '8999104054', '2025-05-07 17:40:47'),
(243, 'Lucía Emilia Coronado', '17-09-2021', NULL, 'Yuliana Galván', '-', '$2y$10$7LfSVsLxK0l40jo58ulJ2.4wYUw3YvSf5Akpm4S/WjSsAuDmzIzFW', '8999452425', '2025-05-14 15:49:40'),
(244, 'Isabella Reyna', ' 12-08-2016', NULL, 'Daisy Reyna', '-', '$2y$10$3w9ZGxKSUMFCA2de5gVzeOXtVjzyq8dtJNi3vro5CyMO5aPHg9asi', '8999505990', '2025-05-27 16:59:07'),
(245, 'Alessa Reyna', '17-11-2021', NULL, 'Daisy Reyna', '-', '$2y$10$V2yOad1hIQOhpT1NbasXV.MiLb7wVPoVDstQVLFhWzmyGCsEZtQgy', '8999505990', '2025-05-28 16:03:28'),
(246, 'Zulema Zumaya', '09-07', NULL, 'hermana de Dania Arlenne', '-', '$2y$10$tHaABWyQkTO/oyKy.4a66esyUvpK2k1.H9B.TIpGrFuNEem4dwLu2', '8991076480', '2025-05-28 17:51:12'),
(247, 'Ximena Parra Cabrera', '07-06-2012', NULL, 'Judith Cabrera', 'judithcabrera8@hotmail.com', '$2y$10$CHfaWoVCS58XMS6Ma0OndewwQj2diAFhwaNYRchlxboAJWfDheTHu', '956-313-1082', '2025-05-28 17:54:59'),
(248, 'Angela Sofía Zúñiga  azuara ', '04-03-2021', NULL, 'Joana Edith Azuara baez ', 'joana0012017@gmail.com', '$2y$10$r2rZT3Jwuc8LkHjPvBR2FukgIMxEfKBTPOGL62TxqctHD3fEfB3ya', '899 103 8781', '2025-06-02 16:57:29'),
(249, 'Cecilia Tijerina Borja', '22-09-2021', NULL, 'María Borja Melendoz', 'borjamay506@gmail.com', '$2y$10$SyONiOpDimGDlv0PVbItD.HFUsrO5acTaXmEDh/6jEp4RGbcLWMK.', '05543534194', '2025-06-02 18:56:21'),
(250, 'Daniela Lopez', '14-05-2012', NULL, 'Yessenia Pérez Daniel Lopez', '-', '$2y$10$mV0LPsWT9F9haMLkJa5...m2BKnTxyzK.BjSrRzQbzSrHDjS6vi2S', '8991839940', '2025-06-02 18:58:00'),
(251, 'Dania Arlenne Zumaya Barrera', '12-10-1980', NULL, 'hermana de Zulema', 'Daniazumaya1980@gmail.com', '$2y$10$cDtd//dA/GpTGxZwVzH4Eu.PWuETmSSiWNQkf5Cme9tfdpezyGywG', '8992093639', '2025-06-02 19:10:08'),
(252, 'Sol Aurora Estrada Espejel', '28-03-2023', NULL, 'Jessica Paola Espejel González', 'jessica.paola.espejel@gmail.com', '$2y$10$RZ7RP7qUeXux6W.R4sf9MuoAs8NCFs.8P03Na5ieVpvuJOMpTjF8i', '8997410587', '2025-06-04 18:54:07'),
(253, 'Ivanna Fuentes Franco', '04-08-2025', NULL, 'Mauren Paola Franco Godoy', 'maurenfranco@outlook.com', '$2y$10$OWTHxs.xvj.8Als225CZieLck.ElNXXyfUtNW7SnRrnRb3UaU11hK', '8999616707', '2025-06-07 09:52:58'),
(254, 'Morgan Zoe Trejo', '00-00-0000', NULL, 'YA NO ASISTE', '-', '$2y$10$GmYnrJZEfziN5hf/qQ6EKOA1S.vzZ8dHk/khZv97MxVH96MZQPTuS', '-', '2025-06-09 12:46:24'),
(255, 'Marcela Arguelles De Vazquez', 'pendiente', NULL, 'adulta', 'pendiente', '$2y$10$nGHd6qkhDwGaybWoi3CLCuVCv/1klZFH/EqHOjOIpznSJPqaxas4W', '956-534-6300', '2025-06-09 12:51:06'),
(256, 'Linda Lopez Hernandez', '08-01-1999', NULL, 'adulto', '-', '$2y$10$mT41FywN.ojk15umsspM0O9mJlU3I3Sdw43Ata3Jw9FVTq5Gw3StS', '899-259-7600', '2025-06-10 13:50:18'),
(257, 'Nidia Alejandra Pretelin Morales', '0-00-0000', NULL, 'adulto', '-', '$2y$10$.cWhHCcNBpo8TOygCmra6eygLylU0wzhXSSotWqfSj06WorkKA6.O', '81-2201-4292', '2025-06-10 14:10:50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `students_monthly_fees`
--

CREATE TABLE `students_monthly_fees` (
  `student_monthly_fee_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `monthly_fee_id` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `balance` double NOT NULL,
  `state` varchar(50) NOT NULL,
  `total_last_installment` double NOT NULL,
  `date_last_installment` datetime NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `students_monthly_fees`
--

INSERT INTO `students_monthly_fees` (`student_monthly_fee_id`, `student_id`, `monthly_fee_id`, `total`, `balance`, `state`, `total_last_installment`, `date_last_installment`, `created_at`) VALUES
(187, 80, 56, 600, 200, 'pending', 600, '2024-04-02 15:47:13', '2024-04-02 15:47:13'),
(189, 79, 58, 1400, 0, 'paid', 1400, '2024-04-02 15:47:56', '2024-04-02 15:47:56'),
(190, 61, 56, 800, 0, 'paid', 800, '2024-04-02 15:58:48', '2024-04-02 15:58:48'),
(191, 63, 56, 600, 200, 'pending', 600, '2024-04-02 15:59:05', '2024-04-02 15:59:05'),
(194, 84, 56, 800, 0, 'paid', 800, '2024-04-03 16:54:38', '2024-04-03 16:54:38'),
(200, 49, 56, 800, 0, 'paid', 800, '2024-04-05 14:59:46', '2024-04-05 14:59:46'),
(201, 110, 56, 700, 100, 'pending', 700, '2024-04-05 15:02:29', '2024-04-05 15:02:29'),
(202, 21, 56, 800, 0, 'paid', 800, '2024-04-05 15:02:50', '2024-04-05 15:02:50'),
(203, 31, 56, 800, 0, 'paid', 800, '2024-04-05 16:05:50', '2024-04-05 16:05:50'),
(204, 52, 57, 600, 0, 'paid', 600, '2024-04-08 14:55:17', '2024-04-08 14:55:17'),
(205, 19, 57, 600, 0, 'paid', 600, '2024-04-08 14:56:38', '2024-04-08 14:56:38'),
(207, 16, 56, 850, -50, 'pending', 850, '2024-04-08 18:01:07', '2024-04-08 18:01:07'),
(208, 28, 56, 850, -50, 'pending', 850, '2024-04-15 15:01:40', '2024-04-15 15:01:40'),
(211, 50, 56, 800, 0, 'paid', 800, '2024-04-15 15:02:27', '2024-04-15 15:02:27'),
(213, 88, 56, 1600, -800, 'pending', 800, '2024-04-25 15:51:56', '2024-04-15 15:03:11'),
(214, 65, 56, 800, 0, 'paid', 800, '2024-04-15 15:03:26', '2024-04-15 15:03:26'),
(215, 33, 58, 1400, 0, 'paid', 1400, '2024-04-15 15:03:39', '2024-04-15 15:03:39'),
(216, 62, 57, 600, 0, 'paid', 600, '2024-04-15 15:04:13', '2024-04-15 15:04:13'),
(217, 113, 56, 800, 0, 'paid', 800, '2024-04-17 17:21:17', '2024-04-17 17:21:17'),
(224, 116, 56, 700, 100, 'pending', 700, '2024-04-18 14:37:54', '2024-04-18 14:37:54'),
(227, 37, 57, 600, 0, 'paid', 600, '2024-04-22 15:16:27', '2024-04-22 15:16:27'),
(231, 32, 56, 800, 0, 'paid', 800, '2024-05-02 15:21:22', '2024-05-02 15:21:22'),
(238, 140, 67, 600, 0, 'paid', 600, '2024-09-02 16:56:59', '2024-09-02 16:56:59'),
(239, 84, 67, 700, -100, 'pending', 700, '2024-09-02 17:04:52', '2024-09-02 17:04:52'),
(240, 90, 67, 600, 0, 'paid', 600, '2024-09-02 18:13:52', '2024-09-02 18:13:52'),
(244, 63, 67, 600, 0, 'paid', 600, '2024-09-03 18:35:14', '2024-09-03 18:35:14'),
(246, 19, 67, 600, 0, 'paid', 600, '2024-09-07 09:13:07', '2024-09-07 09:13:07'),
(247, 154, 70, 2400, -1400, 'pending', 1200, '2024-09-07 10:06:08', '2024-09-07 10:06:08'),
(248, 156, 67, 600, 0, 'paid', 600, '2024-09-09 16:31:42', '2024-09-09 16:31:42'),
(250, 159, 67, 600, 0, 'paid', 600, '2024-09-09 18:33:27', '2024-09-09 18:33:27'),
(251, 31, 67, 600, 0, 'paid', 600, '2024-09-10 17:33:59', '2024-09-10 17:33:59'),
(252, 30, 67, 300, 300, 'pending', 300, '2024-09-10 18:44:42', '2024-09-10 18:44:42'),
(253, 153, 70, 1000, 0, 'paid', 1000, '2024-09-11 18:01:46', '2024-09-11 18:01:46'),
(254, 58, 67, 600, 0, 'paid', 600, '2024-09-11 18:02:26', '2024-09-11 18:02:26'),
(256, 155, 67, 600, 0, 'paid', 600, '2024-09-18 15:45:17', '2024-09-18 15:45:17'),
(257, 37, 67, 600, 0, 'paid', 600, '2024-09-18 17:02:15', '2024-09-18 17:02:15'),
(259, 163, 70, 250, 750, 'pending', 250, '2024-09-23 15:06:27', '2024-09-23 15:06:27'),
(260, 165, 70, 750, 250, 'pending', 250, '2024-09-27 19:36:59', '2024-09-23 15:06:39'),
(261, 62, 67, 600, 0, 'paid', 600, '2024-09-28 09:21:53', '2024-09-28 09:21:53'),
(262, 50, 67, 600, 0, 'paid', 600, '2024-09-30 16:51:25', '2024-09-30 16:51:25'),
(266, 84, 71, 600, 0, 'paid', 600, '2024-10-02 17:07:53', '2024-10-02 17:07:53'),
(268, 62, 71, 600, 0, 'paid', 600, '2024-10-05 09:11:57', '2024-10-05 09:11:57'),
(269, 155, 71, 600, 0, 'paid', 600, '2024-10-05 09:20:00', '2024-10-05 09:20:00'),
(270, 158, 71, 1200, -600, 'pending', 600, '2024-10-08 16:29:10', '2024-10-05 09:28:52'),
(272, 30, 71, 600, 0, 'paid', 300, '2024-10-05 09:32:51', '2024-10-05 09:32:51'),
(273, 63, 71, 600, 0, 'paid', 600, '2024-10-05 09:36:09', '2024-10-05 09:36:09'),
(277, 37, 71, 1200, -600, 'pending', 600, '2024-10-05 11:45:29', '2024-10-05 11:45:28'),
(279, 113, 71, 600, 0, 'paid', 600, '2024-10-07 20:09:11', '2024-10-07 20:09:11'),
(280, 174, 71, 600, 0, 'paid', 600, '2024-10-10 18:00:27', '2024-10-10 18:00:27'),
(281, 173, 71, 600, 0, 'paid', 600, '2024-10-11 17:27:41', '2024-10-11 17:27:41'),
(282, 19, 71, 600, 0, 'paid', 600, '2024-10-12 09:18:15', '2024-10-12 09:18:15'),
(284, 31, 71, 300, 300, 'pending', 300, '2024-10-15 15:54:00', '2024-10-15 15:54:00'),
(285, 158, 67, 600, 0, 'paid', 600, '2024-10-16 21:39:52', '2024-10-16 21:39:52'),
(286, 185, 71, 1200, -600, 'pending', 600, '2024-10-21 19:27:18', '2024-10-21 19:27:18'),
(289, 84, 79, 600, 0, 'paid', 600, '2024-11-04 17:32:36', '2024-11-04 17:32:36'),
(291, 158, 79, 600, 0, 'paid', 600, '2024-11-04 17:34:53', '2024-11-04 17:34:53'),
(292, 137, 79, 600, 0, 'paid', 600, '2024-11-04 19:39:43', '2024-11-04 19:39:43'),
(294, 173, 79, 600, 0, 'paid', 600, '2024-11-06 17:55:46', '2024-11-06 17:55:46'),
(295, 194, 79, 600, 0, 'paid', 600, '2024-11-06 19:35:12', '2024-11-06 19:35:12'),
(298, 19, 79, 600, 0, 'paid', 600, '2024-11-09 11:05:24', '2024-11-09 11:05:24'),
(299, 153, 81, 1000, 0, 'paid', 1000, '2024-11-09 11:17:39', '2024-11-09 11:17:39'),
(300, 140, 79, 600, 0, 'paid', 600, '2024-11-09 12:36:55', '2024-11-09 12:36:55'),
(302, 31, 79, 600, 0, 'paid', 600, '2024-11-09 12:39:22', '2024-11-09 12:39:22'),
(304, 22, 79, 600, 0, 'paid', 600, '2024-11-09 13:12:49', '2024-11-09 13:12:49'),
(305, 165, 81, 500, 500, 'pending', 500, '2024-11-11 17:31:46', '2024-11-11 17:31:46'),
(306, 163, 81, 500, 500, 'pending', 500, '2024-11-11 17:32:06', '2024-11-11 17:32:06'),
(308, 62, 79, 600, 0, 'paid', 600, '2024-11-13 18:22:25', '2024-11-13 18:22:25'),
(309, 16, 71, 600, 0, 'paid', 600, '2024-11-13 18:55:56', '2024-11-13 18:55:56'),
(310, 174, 79, 600, 0, 'paid', 600, '2024-11-13 19:27:25', '2024-11-13 19:27:25'),
(311, 58, 79, 650, -50, 'pending', 650, '2024-11-19 18:44:09', '2024-11-19 18:44:09'),
(312, 30, 79, 300, 300, 'pending', 300, '2024-12-03 00:00:55', '2024-12-03 00:00:55'),
(313, 140, 71, 600, 0, 'paid', 600, '2024-12-03 00:10:47', '2024-12-03 00:10:47'),
(314, 155, 79, 600, 0, 'paid', 600, '2024-12-03 00:12:02', '2024-12-03 00:12:02'),
(315, 63, 79, 1200, -600, 'pending', 600, '2024-12-03 00:14:23', '2024-12-03 00:13:21'),
(318, 162, 79, 700, -100, 'pending', 700, '2024-12-03 00:28:42', '2024-12-03 00:28:42'),
(320, 80, 68, 1400, 0, 'paid', 1400, '2024-12-03 00:42:25', '2024-12-03 00:42:25'),
(321, 63, 82, 600, 0, 'paid', 600, '2024-12-03 16:58:03', '2024-12-03 16:58:03'),
(322, 80, 82, 600, 0, 'paid', 600, '2024-12-03 17:32:52', '2024-12-03 17:32:52'),
(323, 163, 79, 850, -250, 'pending', 250, '2024-12-03 17:44:36', '2024-12-03 17:40:52'),
(324, 163, 71, 850, -250, 'pending', 250, '2024-12-03 17:43:04', '2024-12-03 17:41:30'),
(325, 165, 71, 250, 350, 'pending', 250, '2024-12-03 17:43:47', '2024-12-03 17:43:47'),
(326, 165, 79, 250, 350, 'pending', 250, '2024-12-03 17:44:20', '2024-12-03 17:44:20'),
(327, 137, 71, 600, 0, 'paid', 600, '2024-12-03 17:58:23', '2024-12-03 17:58:23'),
(328, 154, 83, 1200, 0, 'paid', 1200, '2024-12-03 18:20:32', '2024-12-03 18:20:32'),
(329, 32, 81, 1250, -250, 'pending', 1250, '2024-12-03 19:13:34', '2024-12-03 19:13:34'),
(334, 137, 82, 600, 0, 'paid', 600, '2024-12-04 18:43:40', '2024-12-04 18:43:40'),
(336, 194, 82, 600, 0, 'paid', 600, '2024-12-04 18:56:40', '2024-12-04 18:56:40'),
(337, 19, 82, 600, 0, 'paid', 600, '2024-12-04 19:26:47', '2024-12-04 19:26:47'),
(338, 90, 82, 600, 0, 'paid', 600, '2024-12-04 19:59:46', '2024-12-04 19:59:46'),
(339, 28, 82, 600, 0, 'paid', 600, '2024-12-04 20:03:28', '2024-12-04 20:03:28'),
(340, 174, 82, 600, 0, 'paid', 600, '2024-12-04 20:06:19', '2024-12-04 20:06:19'),
(341, 16, 82, 600, 0, 'paid', 600, '2024-12-05 18:38:34', '2024-12-05 18:38:34'),
(342, 32, 82, 600, 0, 'paid', 600, '2024-12-05 18:39:11', '2024-12-05 18:39:11'),
(343, 62, 82, 600, 0, 'paid', 600, '2024-12-05 19:06:24', '2024-12-05 19:06:24'),
(344, 37, 82, 600, 0, 'paid', 600, '2024-12-05 19:41:57', '2024-12-05 19:41:57'),
(349, 116, 82, 600, 0, 'paid', 600, '2024-12-09 20:05:22', '2024-12-09 20:05:22'),
(350, 155, 82, 650, -50, 'pending', 650, '2024-12-09 20:23:43', '2024-12-09 20:23:43'),
(351, 197, 87, 1200, -600, 'pending', 600, '2025-01-31 18:52:22', '2025-01-08 20:02:57'),
(352, 113, 87, 1200, -600, 'pending', 600, '2025-01-31 18:51:23', '2025-01-08 20:03:08'),
(354, 138, 87, 600, 0, 'paid', 600, '2025-01-08 20:03:47', '2025-01-08 20:03:47'),
(357, 28, 87, 600, 0, 'paid', 600, '2025-01-08 20:04:56', '2025-01-08 20:04:56'),
(359, 52, 82, 1300, -700, 'pending', 650, '2025-06-09 18:51:46', '2025-01-10 19:08:56'),
(361, 65, 82, 650, -50, 'pending', 650, '2025-01-10 19:11:59', '2025-01-10 19:11:59'),
(363, 185, 87, 1200, -600, 'pending', 600, '2025-01-31 19:16:00', '2025-01-11 10:38:51'),
(364, 155, 87, 1200, -600, 'pending', 600, '2025-01-31 18:54:47', '2025-01-11 10:58:57'),
(365, 174, 67, 600, 0, 'paid', 600, '2025-01-13 18:54:34', '2025-01-13 18:54:34'),
(366, 173, 87, 1200, -600, 'pending', 600, '2025-01-25 10:02:51', '2025-01-13 19:59:26'),
(367, 63, 87, 600, 0, 'paid', 600, '2025-01-13 20:01:20', '2025-01-13 20:01:20'),
(368, 204, 87, 600, 0, 'paid', 600, '2025-01-16 16:32:11', '2025-01-16 16:32:11'),
(369, 50, 82, 650, -50, 'pending', 650, '2025-01-24 17:38:00', '2025-01-24 17:38:00'),
(370, 65, 91, 600, 0, 'paid', 600, '2025-01-24 18:07:04', '2025-01-24 18:07:04'),
(371, 174, 87, 600, 0, 'paid', 600, '2025-01-24 18:08:20', '2025-01-24 18:08:20'),
(372, 194, 87, 600, 0, 'paid', 600, '2025-01-24 18:09:14', '2025-01-24 18:09:14'),
(373, 146, 87, 600, 0, 'paid', 600, '2025-01-24 18:10:02', '2025-01-24 18:10:02'),
(375, 140, 87, 600, 0, 'paid', 600, '2025-01-24 18:13:53', '2025-01-24 18:13:53'),
(376, 31, 87, 600, 0, 'paid', 600, '2025-01-24 18:14:32', '2025-01-24 18:14:32'),
(377, 211, 91, 600, 0, 'paid', 600, '2025-01-25 09:50:06', '2025-01-25 09:50:06'),
(378, 154, 89, 2000, -1000, 'pending', 1000, '2025-01-31 19:51:13', '2025-01-25 09:52:56'),
(380, 212, 90, 400, 0, 'paid', 400, '2025-01-25 12:11:53', '2025-01-25 12:11:53'),
(381, 19, 87, 600, 0, 'paid', 600, '2025-01-27 19:21:34', '2025-01-27 19:21:34'),
(382, 213, 87, 1200, -600, 'pending', 600, '2025-01-29 18:09:38', '2025-01-29 18:08:44'),
(383, 214, 87, 600, 0, 'paid', 600, '2025-01-29 18:11:45', '2025-01-29 18:11:45'),
(384, 202, 91, 600, 0, 'paid', 600, '2025-01-30 17:05:00', '2025-01-30 17:05:00'),
(388, 153, 89, 1000, 0, 'paid', 1000, '2025-01-31 18:53:02', '2025-01-31 18:53:02'),
(389, 204, 91, 7200, -6600, 'pending', 600, '2025-02-21 14:12:54', '2025-01-31 19:18:07'),
(390, 203, 87, 600, 0, 'paid', 600, '2025-01-31 19:19:28', '2025-01-31 19:19:28'),
(391, 207, 87, 600, 0, 'paid', 600, '2025-01-31 19:30:53', '2025-01-31 19:30:53'),
(392, 62, 87, 600, 0, 'paid', 600, '2025-01-31 19:40:55', '2025-01-31 19:40:55'),
(393, 49, 97, 600, 0, 'paid', 600, '2025-02-13 19:25:05', '2025-02-13 19:25:05'),
(394, 165, 89, 500, 500, 'pending', 500, '2025-02-20 18:53:01', '2025-02-20 18:53:01'),
(395, 163, 89, 500, 500, 'pending', 500, '2025-02-20 18:53:48', '2025-02-20 18:53:48'),
(396, 225, 87, 600, 0, 'paid', 600, '2025-02-20 19:13:53', '2025-02-20 19:13:53'),
(397, 201, 99, 1200, 0, 'paid', 1200, '2025-02-20 19:36:59', '2025-02-20 19:36:59'),
(398, 65, 93, 600, 0, 'paid', 600, '2025-02-21 12:51:37', '2025-02-21 12:51:37'),
(399, 185, 97, 600, 0, 'paid', 600, '2025-02-21 12:54:05', '2025-02-21 12:54:05'),
(401, 197, 97, 600, 0, 'paid', 600, '2025-02-21 13:03:35', '2025-02-21 13:03:35'),
(402, 95, 97, 600, 0, 'paid', 600, '2025-02-21 13:08:12', '2025-02-21 13:08:12'),
(403, 221, 89, 500, 500, 'pending', 500, '2025-02-21 13:17:42', '2025-02-21 13:17:42'),
(404, 156, 97, 600, 0, 'paid', 600, '2025-02-21 13:23:04', '2025-02-21 13:23:04'),
(406, 113, 97, 600, 0, 'paid', 600, '2025-02-21 13:24:34', '2025-02-21 13:24:34'),
(407, 201, 100, 1200, 0, 'paid', 1200, '2025-02-21 13:39:11', '2025-02-21 13:39:11'),
(408, 174, 97, 600, 0, 'paid', 600, '2025-02-21 13:46:07', '2025-02-21 13:46:07'),
(409, 116, 87, 600, 0, 'paid', 600, '2025-02-21 13:47:03', '2025-02-21 13:47:03'),
(410, 116, 97, 600, 0, 'paid', 600, '2025-02-21 13:47:25', '2025-02-21 13:47:25'),
(411, 211, 93, 600, 0, 'paid', 600, '2025-02-21 13:48:08', '2025-02-21 13:48:08'),
(413, 146, 97, 650, -50, 'pending', 650, '2025-02-21 14:01:07', '2025-02-21 14:01:07'),
(414, 153, 97, 1600, -1000, 'pending', 1000, '2025-02-21 14:03:06', '2025-02-21 14:02:20'),
(417, 19, 97, 600, 0, 'paid', 600, '2025-02-21 14:11:11', '2025-02-21 14:11:11'),
(418, 204, 93, 600, 0, 'paid', 600, '2025-02-21 14:14:36', '2025-02-21 14:14:36'),
(419, 31, 97, 600, 0, 'paid', 600, '2025-02-21 14:18:04', '2025-02-21 14:18:04'),
(420, 212, 97, 600, 0, 'paid', 600, '2025-02-21 14:21:12', '2025-02-21 14:21:12'),
(421, 212, 94, 400, 0, 'paid', 400, '2025-02-21 14:22:34', '2025-02-21 14:22:34'),
(422, 90, 97, 600, 0, 'paid', 600, '2025-02-21 14:23:13', '2025-02-21 14:23:13'),
(423, 165, 95, 500, 500, 'pending', 500, '2025-02-21 14:25:19', '2025-02-21 14:25:19'),
(424, 163, 95, 500, 500, 'pending', 500, '2025-02-21 14:26:02', '2025-02-21 14:26:02'),
(426, 213, 97, 600, 0, 'paid', 600, '2025-02-22 12:06:43', '2025-02-22 12:06:43'),
(427, 214, 97, 600, 0, 'paid', 600, '2025-02-22 12:07:22', '2025-02-22 12:07:22'),
(428, 203, 97, 600, 0, 'paid', 600, '2025-02-22 12:17:10', '2025-02-22 12:17:10'),
(429, 202, 93, 600, 0, 'paid', 600, '2025-02-24 20:57:35', '2025-02-24 20:57:35'),
(432, 155, 106, 600, 0, 'paid', 600, '2025-03-08 12:54:16', '2025-03-08 12:54:16'),
(433, 212, 105, 400, 0, 'paid', 400, '2025-03-08 12:55:03', '2025-03-08 12:55:03'),
(434, 165, 108, 500, 500, 'pending', 500, '2025-03-08 13:05:11', '2025-03-08 13:05:11'),
(435, 163, 108, 500, 500, 'pending', 500, '2025-03-08 13:05:42', '2025-03-08 13:05:42'),
(437, 214, 106, 600, 0, 'paid', 600, '2025-03-10 19:51:55', '2025-03-10 19:51:55'),
(438, 88, 104, 600, 0, 'paid', 600, '2025-03-10 19:52:32', '2025-03-10 19:52:32'),
(439, 113, 106, 600, 0, 'paid', 600, '2025-03-10 19:54:27', '2025-03-10 19:54:27'),
(440, 154, 108, 2400, -1400, 'pending', 1200, '2025-05-02 19:51:47', '2025-03-10 19:58:02'),
(441, 174, 106, 600, 0, 'paid', 600, '2025-03-10 19:58:53', '2025-03-10 19:58:53'),
(442, 84, 87, 600, 0, 'paid', 600, '2025-03-12 16:32:47', '2025-03-12 16:32:47'),
(443, 84, 97, 600, 0, 'paid', 600, '2025-03-12 16:33:18', '2025-03-12 16:33:18'),
(444, 84, 106, 600, 0, 'paid', 600, '2025-03-12 16:33:51', '2025-03-12 16:33:51'),
(445, 19, 106, 600, 0, 'paid', 600, '2025-03-12 16:37:32', '2025-03-12 16:37:32'),
(446, 173, 106, 600, 0, 'paid', 600, '2025-03-12 16:38:17', '2025-03-12 16:38:17'),
(447, 194, 97, 600, 0, 'paid', 600, '2025-03-12 16:39:49', '2025-03-12 16:39:49'),
(448, 194, 106, 600, 0, 'paid', 600, '2025-03-12 16:40:18', '2025-03-12 16:40:18'),
(449, 31, 106, 600, 0, 'paid', 600, '2025-03-12 18:53:18', '2025-03-12 18:53:18'),
(450, 228, 106, 600, 0, 'paid', 600, '2025-03-17 17:57:26', '2025-03-17 17:57:26'),
(451, 229, 106, 600, 0, 'paid', 600, '2025-03-17 18:11:00', '2025-03-17 18:11:00'),
(452, 185, 106, 650, -50, 'pending', 650, '2025-03-17 18:13:01', '2025-03-17 18:13:01'),
(454, 234, 106, 600, 0, 'paid', 600, '2025-03-22 14:10:56', '2025-03-22 14:10:56'),
(455, 233, 106, 600, 0, 'paid', 600, '2025-03-22 14:13:25', '2025-03-22 14:13:25'),
(456, 153, 108, 2050, -1050, 'pending', 1050, '2025-03-22 14:15:35', '2025-03-22 14:14:53'),
(457, 211, 104, 650, -50, 'pending', 650, '2025-03-22 14:16:35', '2025-03-22 14:16:35'),
(458, 213, 106, 600, 0, 'paid', 600, '2025-03-22 14:25:30', '2025-03-22 14:25:30'),
(459, 221, 95, 500, 500, 'pending', 500, '2025-03-22 14:29:36', '2025-03-22 14:29:36'),
(460, 221, 106, 600, 0, 'paid', 600, '2025-03-22 14:31:01', '2025-03-22 14:31:01'),
(461, 204, 104, 600, 0, 'paid', 600, '2025-03-22 14:32:12', '2025-03-22 14:32:12'),
(462, 49, 106, 600, 0, 'paid', 600, '2025-03-22 14:41:54', '2025-03-22 14:41:54'),
(465, 203, 106, 600, 0, 'paid', 600, '2025-03-22 14:56:40', '2025-03-22 14:56:40'),
(468, 237, 106, 600, 0, 'paid', 600, '2025-03-22 15:13:56', '2025-03-22 15:13:56'),
(469, 236, 106, 600, 0, 'paid', 600, '2025-03-22 15:24:14', '2025-03-22 15:24:14'),
(470, 201, 101, 1250, -50, 'pending', 1250, '2025-03-22 15:56:19', '2025-03-22 15:56:19'),
(471, 240, 106, 300, 300, 'pending', 300, '2025-03-23 14:18:21', '2025-03-23 14:18:21'),
(472, 156, 106, 600, 0, 'paid', 600, '2025-03-23 14:22:17', '2025-03-23 14:22:17'),
(473, 202, 104, 600, 0, 'paid', 600, '2025-03-23 14:35:26', '2025-03-23 14:35:26'),
(474, 197, 106, 600, 0, 'paid', 600, '2025-03-23 14:42:04', '2025-03-23 14:42:04'),
(475, 90, 106, 1250, -650, 'pending', 650, '2025-03-23 14:43:29', '2025-03-23 14:42:45'),
(476, 37, 87, 600, 0, 'paid', 600, '2025-03-23 14:50:18', '2025-03-23 14:50:18'),
(477, 37, 97, 650, -50, 'pending', 650, '2025-03-23 14:53:06', '2025-03-23 14:53:06'),
(478, 37, 106, 650, -50, 'pending', 650, '2025-03-23 14:55:40', '2025-03-23 14:55:40'),
(479, 238, 106, 600, 0, 'paid', 600, '2025-03-31 17:59:47', '2025-03-31 17:59:47'),
(481, 174, 110, 600, 0, 'paid', 600, '2025-05-01 15:58:21', '2025-05-01 15:58:21'),
(482, 65, 104, 600, 0, 'paid', 600, '2025-05-01 15:59:24', '2025-05-01 15:59:24'),
(483, 65, 114, 600, 0, 'paid', 600, '2025-05-02 17:20:54', '2025-05-02 17:20:54'),
(484, 214, 110, 600, 0, 'paid', 600, '2025-05-02 19:07:35', '2025-05-02 19:07:35'),
(488, 137, 110, 600, 0, 'paid', 600, '2025-05-02 19:37:59', '2025-05-02 19:37:59'),
(489, 201, 116, 1200, 0, 'paid', 1200, '2025-05-02 19:46:34', '2025-05-02 19:46:34'),
(490, 154, 117, 1200, 0, 'paid', 1200, '2025-05-05 18:12:15', '2025-05-05 18:12:15'),
(491, 226, 119, 850, -50, 'pending', 850, '2025-05-27 16:27:51', '2025-05-27 16:27:51'),
(492, 19, 110, 600, 0, 'paid', 600, '2025-05-30 16:59:24', '2025-05-30 16:59:24'),
(493, 80, 119, 800, 0, 'paid', 800, '2025-06-05 15:57:26', '2025-06-05 15:57:26'),
(494, 21, 119, 800, 0, 'paid', 800, '2025-06-05 16:16:40', '2025-06-05 16:16:40'),
(495, 155, 97, 600, 0, 'paid', 600, '2025-06-05 16:29:25', '2025-06-05 16:29:25'),
(496, 155, 110, 600, 0, 'paid', 600, '2025-06-05 16:30:17', '2025-06-05 16:30:17'),
(497, 63, 97, 600, 0, 'paid', 600, '2025-06-05 16:33:02', '2025-06-05 16:33:02'),
(498, 63, 106, 600, 0, 'paid', 600, '2025-06-05 16:33:37', '2025-06-05 16:33:37'),
(499, 63, 110, 600, 0, 'paid', 600, '2025-06-05 16:34:46', '2025-06-05 16:34:46'),
(500, 63, 120, 600, 0, 'paid', 600, '2025-06-05 16:35:30', '2025-06-05 16:35:30'),
(501, 116, 106, 600, 0, 'paid', 600, '2025-06-05 17:14:13', '2025-06-05 17:14:13'),
(502, 95, 106, 600, 0, 'paid', 600, '2025-06-05 17:15:17', '2025-06-05 17:15:17'),
(503, 50, 119, 800, 0, 'paid', 800, '2025-06-05 17:32:12', '2025-06-05 17:32:12'),
(504, 221, 110, 600, 0, 'paid', 600, '2025-06-07 11:32:01', '2025-06-07 11:32:01'),
(505, 213, 110, 600, 0, 'paid', 600, '2025-06-07 11:48:48', '2025-06-07 11:48:48'),
(506, 29, 82, 600, 0, 'paid', 600, '2025-06-09 11:53:29', '2025-06-09 11:53:29'),
(507, 198, 117, 600, 600, 'pending', 600, '2025-06-09 11:56:45', '2025-06-09 11:56:45'),
(508, 199, 117, 600, 600, 'pending', 600, '2025-06-09 11:57:19', '2025-06-09 11:57:19'),
(509, 198, 122, 700, 700, 'pending', 700, '2025-06-09 12:03:12', '2025-06-09 12:03:12'),
(510, 199, 122, 700, 700, 'pending', 700, '2025-06-09 12:03:51', '2025-06-09 12:03:51'),
(511, 213, 120, 650, -50, 'pending', 650, '2025-06-09 12:25:39', '2025-06-09 12:25:39'),
(512, 201, 127, 1250, -50, 'pending', 1250, '2025-06-09 12:26:58', '2025-06-09 12:26:58'),
(513, 90, 110, 650, -50, 'pending', 650, '2025-06-09 12:32:58', '2025-06-09 12:32:58'),
(514, 249, 120, 500, 100, 'pending', 500, '2025-06-09 12:34:33', '2025-06-09 12:34:33'),
(515, 173, 110, 650, -50, 'pending', 650, '2025-06-09 12:37:07', '2025-06-09 12:37:07'),
(516, 173, 120, 500, 100, 'pending', 500, '2025-06-09 12:45:01', '2025-06-09 12:45:01'),
(517, 254, 120, 600, 0, 'paid', 600, '2025-06-09 12:46:58', '2025-06-09 12:46:58'),
(518, 255, 120, 300, 300, 'pending', 300, '2025-06-09 12:52:05', '2025-06-09 12:52:05'),
(519, 204, 124, 600, 0, 'paid', 600, '2025-06-09 13:04:47', '2025-06-09 13:04:47'),
(520, 221, 120, 600, 0, 'paid', 600, '2025-06-09 13:09:08', '2025-06-09 13:09:08'),
(521, 234, 110, 600, 0, 'paid', 600, '2025-06-09 13:10:35', '2025-06-09 13:10:35'),
(522, 234, 120, 600, 0, 'paid', 600, '2025-06-09 13:11:15', '2025-06-09 13:11:15'),
(523, 227, 106, 600, 0, 'paid', 600, '2025-06-09 13:12:10', '2025-06-09 13:12:10'),
(524, 227, 110, 600, 0, 'paid', 600, '2025-06-09 13:12:51', '2025-06-09 13:12:51'),
(525, 227, 120, 600, 0, 'paid', 600, '2025-06-09 13:13:21', '2025-06-09 13:13:21'),
(526, 241, 123, 400, 0, 'paid', 400, '2025-06-09 13:14:39', '2025-06-09 13:14:39'),
(527, 65, 120, 600, 0, 'paid', 600, '2025-06-09 13:27:33', '2025-06-09 13:27:33'),
(528, 238, 120, 600, 0, 'paid', 600, '2025-06-09 13:34:52', '2025-06-09 13:34:52'),
(529, 236, 120, 600, 0, 'paid', 600, '2025-06-09 13:37:08', '2025-06-09 13:37:08'),
(530, 113, 120, 600, 0, 'paid', 600, '2025-06-09 13:38:13', '2025-06-09 13:38:13'),
(531, 140, 110, 600, 0, 'paid', 600, '2025-06-09 13:39:49', '2025-06-09 13:39:49'),
(532, 140, 119, 800, 0, 'paid', 800, '2025-06-09 13:40:41', '2025-06-09 13:40:41'),
(533, 243, 120, 600, 0, 'paid', 600, '2025-06-09 13:41:50', '2025-06-09 13:41:50'),
(534, 194, 120, 600, 0, 'paid', 600, '2025-06-09 13:44:21', '2025-06-09 13:44:21'),
(535, 194, 129, 600, 0, 'paid', 600, '2025-06-09 13:45:03', '2025-06-09 13:45:03'),
(536, 235, 119, 800, 0, 'paid', 800, '2025-06-09 13:46:36', '2025-06-09 13:46:36'),
(537, 16, 119, 800, 0, 'paid', 800, '2025-06-09 13:48:36', '2025-06-09 13:48:36'),
(538, 28, 119, 800, 0, 'paid', 800, '2025-06-09 13:49:24', '2025-06-09 13:49:24'),
(539, 119, 82, 600, 0, 'paid', 600, '2025-06-09 13:56:38', '2025-06-09 13:56:38'),
(540, 49, 120, 600, 0, 'paid', 600, '2025-06-09 13:57:39', '2025-06-09 13:57:39'),
(541, 156, 120, 600, 0, 'paid', 600, '2025-06-09 13:58:24', '2025-06-09 13:58:24'),
(542, 248, 129, 600, 0, 'paid', 600, '2025-06-09 14:04:25', '2025-06-09 14:04:25'),
(543, 138, 119, 800, 0, 'paid', 800, '2025-06-09 18:49:00', '2025-06-09 18:49:00'),
(544, 52, 119, 850, -50, 'pending', 850, '2025-06-09 18:54:15', '2025-06-09 18:54:15'),
(545, 228, 110, 600, 0, 'paid', 600, '2025-06-09 19:00:53', '2025-06-09 19:00:53'),
(546, 228, 120, 650, -50, 'pending', 650, '2025-06-09 19:01:16', '2025-06-09 19:01:16'),
(547, 84, 110, 600, 0, 'paid', 600, '2025-06-09 19:02:24', '2025-06-09 19:02:24'),
(548, 84, 120, 600, 0, 'paid', 600, '2025-06-09 19:02:53', '2025-06-09 19:02:53'),
(549, 84, 129, 600, 0, 'paid', 600, '2025-06-09 19:14:53', '2025-06-09 19:14:53'),
(550, 185, 110, 600, 0, 'paid', 600, '2025-06-09 19:16:53', '2025-06-09 19:16:53'),
(551, 185, 120, 650, -50, 'pending', 650, '2025-06-09 19:17:16', '2025-06-09 19:17:16'),
(552, 32, 89, 1200, -200, 'pending', 1200, '2025-06-09 19:19:24', '2025-06-09 19:19:24'),
(553, 32, 92, 1200, 200, 'pending', 1200, '2025-06-09 19:19:51', '2025-06-09 19:19:51'),
(554, 32, 108, 1200, -200, 'pending', 1200, '2025-06-09 19:20:17', '2025-06-09 19:20:17'),
(555, 202, 114, 600, 0, 'paid', 600, '2025-06-09 19:24:54', '2025-06-09 19:24:54'),
(556, 202, 124, 600, 0, 'paid', 600, '2025-06-09 19:25:36', '2025-06-09 19:25:36'),
(557, 256, 120, 300, 300, 'pending', 300, '2025-06-10 13:51:00', '2025-06-10 13:51:00'),
(558, 154, 126, 1050, 150, 'pending', 1050, '2025-06-10 13:55:13', '2025-06-10 13:55:13'),
(559, 244, 125, 600, 600, 'pending', 600, '2025-06-10 14:03:42', '2025-06-10 14:03:42'),
(560, 245, 125, 600, 600, 'pending', 600, '2025-06-10 14:04:12', '2025-06-10 14:04:12'),
(561, 257, 129, 600, 0, 'paid', 600, '2025-06-10 14:11:38', '2025-06-10 14:11:38'),
(562, 247, 119, 800, 0, 'paid', 800, '2025-06-10 14:15:48', '2025-06-10 14:15:48'),
(563, 250, 129, 600, 0, 'paid', 600, '2025-06-10 15:48:25', '2025-06-10 15:48:25'),
(564, 58, 129, 600, 0, 'paid', 600, '2025-06-10 15:51:39', '2025-06-10 15:51:39'),
(565, 237, 110, 600, 0, 'paid', 600, '2025-06-10 15:53:43', '2025-06-10 15:53:43'),
(566, 237, 120, 600, 0, 'paid', 600, '2025-06-10 15:54:19', '2025-06-10 15:54:19'),
(567, 237, 129, 600, 0, 'paid', 600, '2025-06-10 15:57:27', '2025-06-10 15:57:27'),
(568, 236, 129, 600, 0, 'paid', 600, '2025-06-10 15:58:01', '2025-06-10 15:58:01'),
(569, 243, 129, 600, 0, 'paid', 600, '2025-06-10 15:59:22', '2025-06-10 15:59:22'),
(570, 234, 129, 600, 0, 'paid', 600, '2025-06-10 16:03:27', '2025-06-10 16:03:27'),
(571, 247, 128, 800, 0, 'paid', 800, '2025-06-10 16:05:11', '2025-06-10 16:05:11'),
(572, 204, 133, 650, -50, 'pending', 650, '2025-06-11 19:37:08', '2025-06-11 19:37:08'),
(573, 207, 119, 800, 0, 'paid', 800, '2025-06-11 19:43:11', '2025-06-11 19:43:11'),
(574, 207, 128, 800, 0, 'paid', 800, '2025-06-11 19:44:19', '2025-06-11 19:44:19'),
(575, 19, 120, 600, 0, 'paid', 600, '2025-06-11 19:52:15', '2025-06-11 19:52:15'),
(576, 19, 129, 600, 0, 'paid', 600, '2025-06-11 19:53:08', '2025-06-11 19:53:08'),
(577, 19, 128, 800, 0, 'paid', 800, '2025-06-11 19:54:12', '2025-06-11 19:54:12'),
(578, 83, 122, 750, 650, 'pending', 750, '2025-06-13 17:00:02', '2025-06-13 17:00:02'),
(579, 88, 133, 600, 0, 'paid', 600, '2025-06-13 17:21:12', '2025-06-13 17:21:12'),
(580, 211, 114, 600, 0, 'paid', 600, '2025-06-13 17:22:29', '2025-06-13 17:22:29'),
(581, 211, 124, 650, -50, 'pending', 650, '2025-06-13 17:23:07', '2025-06-13 17:23:07'),
(582, 211, 133, 600, 0, 'paid', 600, '2025-06-13 17:23:37', '2025-06-13 17:23:37'),
(583, 253, 128, 800, 0, 'paid', 800, '2025-06-13 17:25:31', '2025-06-13 17:25:31');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrators`
--
ALTER TABLE `administrators`
  ADD PRIMARY KEY (`administrator_id`);

--
-- Indices de la tabla `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`expense_id`);

--
-- Indices de la tabla `installments`
--
ALTER TABLE `installments`
  ADD PRIMARY KEY (`installment_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indices de la tabla `monthly_fees`
--
ALTER TABLE `monthly_fees`
  ADD PRIMARY KEY (`monthly_fee_id`);

--
-- Indices de la tabla `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notification_id`);

--
-- Indices de la tabla `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_id`);

--
-- Indices de la tabla `students_monthly_fees`
--
ALTER TABLE `students_monthly_fees`
  ADD PRIMARY KEY (`student_monthly_fee_id`),
  ADD KEY `idx_student_id` (`student_id`),
  ADD KEY `idx_monthly_fee_id` (`monthly_fee_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administrators`
--
ALTER TABLE `administrators`
  MODIFY `administrator_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `expenses`
--
ALTER TABLE `expenses`
  MODIFY `expense_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=312;

--
-- AUTO_INCREMENT de la tabla `installments`
--
ALTER TABLE `installments`
  MODIFY `installment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1367;

--
-- AUTO_INCREMENT de la tabla `monthly_fees`
--
ALTER TABLE `monthly_fees`
  MODIFY `monthly_fee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;

--
-- AUTO_INCREMENT de la tabla `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `students`
--
ALTER TABLE `students`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=258;

--
-- AUTO_INCREMENT de la tabla `students_monthly_fees`
--
ALTER TABLE `students_monthly_fees`
  MODIFY `student_monthly_fee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=584;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `installments`
--
ALTER TABLE `installments`
  ADD CONSTRAINT `installments_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `students_monthly_fees`
--
ALTER TABLE `students_monthly_fees`
  ADD CONSTRAINT `students_monthly_fees_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `students_monthly_fees_ibfk_2` FOREIGN KEY (`monthly_fee_id`) REFERENCES `monthly_fees` (`monthly_fee_id`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Base de datos: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Volcado de datos para la tabla `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"clini_plas\",\"table\":\"user\"},{\"db\":\"clini_plas\",\"table\":\"user_memberships\"},{\"db\":\"clini_plas\",\"table\":\"empleado\"},{\"db\":\"clini_plas\",\"table\":\"ventas\"},{\"db\":\"clini_plas\",\"table\":\"payments\"},{\"db\":\"clini_plas\",\"table\":\"pagos\"},{\"db\":\"clini_plas\",\"table\":\"usuarios_ventas\"},{\"db\":\"clini_plas\",\"table\":\"ventas_membresias\"},{\"db\":\"clini_plas\",\"table\":\"ventas_payments\"},{\"db\":\"clini_plas\",\"table\":\"role\"}]');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Volcado de datos para la tabla `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2025-06-26 01:34:55', '{\"Console\\/Mode\":\"collapse\",\"lang\":\"es\"}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indices de la tabla `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indices de la tabla `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indices de la tabla `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indices de la tabla `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indices de la tabla `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indices de la tabla `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indices de la tabla `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indices de la tabla `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indices de la tabla `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indices de la tabla `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indices de la tabla `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indices de la tabla `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indices de la tabla `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Base de datos: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
