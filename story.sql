-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-06-2024 a las 17:24:39
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
-- Base de datos: `story`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `interactions`
--

CREATE TABLE `interactions` (
  `Id` int(11) NOT NULL,
  `description` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preferences`
--

CREATE TABLE `preferences` (
  `Id` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stories`
--

CREATE TABLE `stories` (
  `Id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `Description` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `story_interactions`
--

CREATE TABLE `story_interactions` (
  `Id` int(11) NOT NULL,
  `stories_Id` int(11) DEFAULT NULL,
  `Interactions_Id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `Id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_preferences`
--

CREATE TABLE `user_preferences` (
  `Id` int(11) NOT NULL,
  `preferences_Id` int(11) DEFAULT NULL,
  `users_Id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_stories`
--

CREATE TABLE `user_stories` (
  `Id` int(11) NOT NULL,
  `users_Id` int(11) DEFAULT NULL,
  `stories_Id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `interactions`
--
ALTER TABLE `interactions`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `preferences`
--
ALTER TABLE `preferences`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `stories`
--
ALTER TABLE `stories`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `story_interactions`
--
ALTER TABLE `story_interactions`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `fk_story_interactions_Interactions` (`Interactions_Id`),
  ADD KEY `fk_story_interactions_stories` (`stories_Id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `user_preferences`
--
ALTER TABLE `user_preferences`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `fk_user_preferences_preferences` (`preferences_Id`),
  ADD KEY `fk_user_preferences_users` (`users_Id`);

--
-- Indices de la tabla `user_stories`
--
ALTER TABLE `user_stories`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `fk_user_stories_stories` (`stories_Id`),
  ADD KEY `fk_user_stories_users` (`users_Id`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `story_interactions`
--
ALTER TABLE `story_interactions`
  ADD CONSTRAINT `fk_story_interactions_Interactions` FOREIGN KEY (`Interactions_Id`) REFERENCES `interactions` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_story_interactions_stories` FOREIGN KEY (`stories_Id`) REFERENCES `stories` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `user_preferences`
--
ALTER TABLE `user_preferences`
  ADD CONSTRAINT `fk_user_preferences_preferences` FOREIGN KEY (`preferences_Id`) REFERENCES `preferences` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_preferences_users` FOREIGN KEY (`users_Id`) REFERENCES `users` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `user_stories`
--
ALTER TABLE `user_stories`
  ADD CONSTRAINT `fk_user_stories_stories` FOREIGN KEY (`stories_Id`) REFERENCES `stories` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_stories_users` FOREIGN KEY (`users_Id`) REFERENCES `users` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
