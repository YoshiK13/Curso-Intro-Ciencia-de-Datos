-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-09-2026 a las 15:55:00
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";
SET FOREIGN_KEY_CHECKS = 0;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `fifa_world_cup`
--
CREATE DATABASE IF NOT EXISTS `fifa_world_cup` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `fifa_world_cup`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `confederation`
--

DROP TABLE IF EXISTS `confederation`;
CREATE TABLE `confederation` (
  `confederation_id` varchar(10) NOT NULL,
  `confederation_name` varchar(100) NOT NULL,
  `confederation_code` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `region`
--

DROP TABLE IF EXISTS `region`;
CREATE TABLE `region` (
  `region_id` int(11) NOT NULL,
  `region_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `country`
--

DROP TABLE IF EXISTS `country`;
CREATE TABLE `country` (
  `country_id` int(11) NOT NULL,
  `country_name` varchar(100) NOT NULL,
  `region_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `federation`
--

DROP TABLE IF EXISTS `federation`;
CREATE TABLE `federation` (
  `federation_id` int(11) NOT NULL,
  `federation_name` varchar(100) NOT NULL,
  `confederation_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `city`
--

DROP TABLE IF EXISTS `city`;
CREATE TABLE `city` (
  `city_id` int(11) NOT NULL,
  `city_name` varchar(100) NOT NULL,
  `country_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stadium`
--

DROP TABLE IF EXISTS `stadium`;
CREATE TABLE `stadium` (
  `stadium_id` varchar(20) NOT NULL,
  `stadium_name` varchar(100) NOT NULL,
  `city_id` int(11) NOT NULL,
  `stadium_capacity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `team`
--

DROP TABLE IF EXISTS `team`;
CREATE TABLE `team` (
  `team_id` varchar(10) NOT NULL,
  `team_name` varchar(100) NOT NULL,
  `team_code` varchar(10) NOT NULL,
  `mens_team` tinyint(1) NOT NULL DEFAULT 1,
  `womens_team` tinyint(1) NOT NULL DEFAULT 0,
  `federation_id` int(11) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `confederation_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tournament`
--

DROP TABLE IF EXISTS `tournament`;
CREATE TABLE `tournament` (
  `tournament_id` varchar(10) NOT NULL,
  `tournament_name` varchar(100) NOT NULL,
  `year` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `host_country` varchar(100) NOT NULL,
  `winner` varchar(100) NOT NULL,
  `host_won` tinyint(1) NOT NULL DEFAULT 0,
  `count_teams` int(11) NOT NULL,
  `group_stage` tinyint(1) NOT NULL DEFAULT 0,
  `second_group_stage` tinyint(1) NOT NULL DEFAULT 0,
  `final_round` tinyint(1) NOT NULL DEFAULT 0,
  `round_of_16` tinyint(1) NOT NULL DEFAULT 0,
  `quarter_finals` tinyint(1) NOT NULL DEFAULT 0,
  `semi_finals` tinyint(1) NOT NULL DEFAULT 0,
  `third_place_match` tinyint(1) NOT NULL DEFAULT 0,
  `final` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `position`
--

DROP TABLE IF EXISTS `position`;
CREATE TABLE `position` (
  `position_code` varchar(10) NOT NULL,
  `position_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `player`
--

DROP TABLE IF EXISTS `player`;
CREATE TABLE `player` (
  `player_id` varchar(10) NOT NULL,
  `family_name` varchar(100) NOT NULL,
  `given_name` varchar(100) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `female` tinyint(1) NOT NULL DEFAULT 0,
  `goal_keeper` tinyint(1) NOT NULL DEFAULT 0,
  `defender` tinyint(1) NOT NULL DEFAULT 0,
  `midfielder` tinyint(1) NOT NULL DEFAULT 0,
  `forward` tinyint(1) NOT NULL DEFAULT 0,
  `count_tournaments` int(11) NOT NULL DEFAULT 1,
  `list_tournaments` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `matches`
--

DROP TABLE IF EXISTS `matches`;
CREATE TABLE `matches` (
  `tournament_id` varchar(10) NOT NULL,
  `match_id` varchar(20) NOT NULL,
  `match_name` varchar(100) NOT NULL,
  `stage_name` varchar(50) NOT NULL,
  `group_name` varchar(50) DEFAULT NULL,
  `group_stage` tinyint(1) NOT NULL DEFAULT 0,
  `knockout_stage` tinyint(1) NOT NULL DEFAULT 0,
  `replayed` tinyint(1) NOT NULL DEFAULT 0,
  `replay` tinyint(1) NOT NULL DEFAULT 0,
  `match_date` date NOT NULL,
  `match_time` varchar(10) DEFAULT NULL,
  `stadium_id` varchar(20) NOT NULL,
  `home_team_id` varchar(10) NOT NULL,
  `away_team_id` varchar(10) NOT NULL,
  `score` varchar(20) NOT NULL,
  `home_team_score` int(11) NOT NULL DEFAULT 0,
  `away_team_score` int(11) NOT NULL DEFAULT 0,
  `home_team_score_margin` int(11) NOT NULL DEFAULT 0,
  `away_team_score_margin` int(11) NOT NULL DEFAULT 0,
  `extra_time` tinyint(1) NOT NULL DEFAULT 0,
  `penalty_shootout` tinyint(1) NOT NULL DEFAULT 0,
  `score_penalties` varchar(20) DEFAULT NULL,
  `home_team_score_penalties` int(11) DEFAULT 0,
  `away_team_score_penalties` int(11) DEFAULT 0,
  `result` varchar(50) NOT NULL,
  `home_team_win` tinyint(1) NOT NULL DEFAULT 0,
  `away_team_win` tinyint(1) NOT NULL DEFAULT 0,
  `draw` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `player_appearance`
--

DROP TABLE IF EXISTS `player_appearance`;
CREATE TABLE `player_appearance` (
  `player_appearance_id` int(11) NOT NULL,
  `tournament_id` varchar(10) NOT NULL,
  `match_id` varchar(20) NOT NULL,
  `team_id` varchar(10) NOT NULL,
  `home_team` tinyint(1) NOT NULL DEFAULT 0,
  `away_team` tinyint(1) NOT NULL DEFAULT 0,
  `player_id` varchar(10) NOT NULL,
  `position_code` varchar(10) NOT NULL,
  `starter` tinyint(1) NOT NULL DEFAULT 0,
  `substitute` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `goal`
--

DROP TABLE IF EXISTS `goal`;
CREATE TABLE `goal` (
  `goal_id` varchar(20) NOT NULL,
  `tournament_id` varchar(10) NOT NULL,
  `match_id` varchar(20) NOT NULL,
  `team_id` varchar(10) NOT NULL,
  `home_team` tinyint(1) NOT NULL DEFAULT 0,
  `away_team` tinyint(1) NOT NULL DEFAULT 0,
  `player_id` varchar(10) NOT NULL,
  `player_team_id` varchar(10) NOT NULL,
  `minute_label` varchar(20) NOT NULL,
  `match_period` varchar(50) NOT NULL,
  `own_goal` tinyint(1) NOT NULL DEFAULT 0,
  `penalty` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `award`
--

DROP TABLE IF EXISTS `award`;
CREATE TABLE `award` (
  `award_id` varchar(10) NOT NULL,
  `award_name` varchar(100) NOT NULL,
  `award_description` text DEFAULT NULL,
  `year_introduced` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `award_winner`
--

DROP TABLE IF EXISTS `award_winner`;
CREATE TABLE `award_winner` (
  `award_winner_id` int(11) NOT NULL,
  `tournament_id` varchar(10) NOT NULL,
  `award_id` varchar(10) NOT NULL,
  `shared` tinyint(1) NOT NULL DEFAULT 0,
  `player_id` varchar(10) NOT NULL,
  `team_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------
--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `confederation`
--
ALTER TABLE `confederation`
  ADD PRIMARY KEY (`confederation_id`),
  ADD UNIQUE KEY `uk_confederation_name` (`confederation_name`),
  ADD UNIQUE KEY `uk_confederation_code` (`confederation_code`);

--
-- Indices de la tabla `region`
--
ALTER TABLE `region`
  ADD PRIMARY KEY (`region_id`),
  ADD UNIQUE KEY `uk_region_name` (`region_name`);

--
-- Indices de la tabla `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`country_id`),
  ADD UNIQUE KEY `uk_country_name` (`country_name`),
  ADD KEY `idx_country_region` (`region_id`);

--
-- Indices de la tabla `federation`
--
ALTER TABLE `federation`
  ADD PRIMARY KEY (`federation_id`),
  ADD UNIQUE KEY `uk_federation_name` (`federation_name`),
  ADD KEY `idx_federation_confederation` (`confederation_id`);

--
-- Indices de la tabla `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`city_id`),
  ADD UNIQUE KEY `uk_city_country` (`city_name`, `country_id`),
  ADD KEY `idx_city_country` (`country_id`);

--
-- Indices de la tabla `stadium`
--
ALTER TABLE `stadium`
  ADD PRIMARY KEY (`stadium_id`),
  ADD KEY `idx_stadium_city` (`city_id`);

--
-- Indices de la tabla `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`team_id`),
  ADD UNIQUE KEY `uk_team_name` (`team_name`),
  ADD KEY `idx_team_code` (`team_code`),
  ADD KEY `idx_team_federation` (`federation_id`),
  ADD KEY `idx_team_country` (`country_id`),
  ADD KEY `idx_team_confederation` (`confederation_id`);

--
-- Indices de la tabla `tournament`
--
ALTER TABLE `tournament`
  ADD PRIMARY KEY (`tournament_id`),
  ADD UNIQUE KEY `uk_tournament_name` (`tournament_name`);

--
-- Indices de la tabla `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`position_code`),
  ADD UNIQUE KEY `uk_position_name` (`position_name`);

--
-- Indices de la tabla `player`
--
ALTER TABLE `player`
  ADD PRIMARY KEY (`player_id`);

--
-- Indices de la tabla `matches`
--
ALTER TABLE `matches`
  ADD PRIMARY KEY (`match_id`),
  ADD KEY `idx_matches_tournament` (`tournament_id`),
  ADD KEY `idx_matches_stadium` (`stadium_id`),
  ADD KEY `idx_matches_home_team` (`home_team_id`),
  ADD KEY `idx_matches_away_team` (`away_team_id`);

--
-- Indices de la tabla `player_appearance`
--
ALTER TABLE `player_appearance`
  ADD PRIMARY KEY (`player_appearance_id`),
  ADD UNIQUE KEY `uk_match_player` (`match_id`, `player_id`),
  ADD KEY `idx_pa_tournament` (`tournament_id`),
  ADD KEY `idx_pa_team` (`team_id`),
  ADD KEY `idx_pa_player` (`player_id`),
  ADD KEY `idx_pa_position` (`position_code`);

--
-- Indices de la tabla `goal`
--
ALTER TABLE `goal`
  ADD PRIMARY KEY (`goal_id`),
  ADD KEY `idx_goal_tournament` (`tournament_id`),
  ADD KEY `idx_goal_match` (`match_id`),
  ADD KEY `idx_goal_team` (`team_id`),
  ADD KEY `idx_goal_player` (`player_id`),
  ADD KEY `idx_goal_player_team` (`player_team_id`);

--
-- Indices de la tabla `award`
--
ALTER TABLE `award`
  ADD PRIMARY KEY (`award_id`),
  ADD UNIQUE KEY `uk_award_name` (`award_name`);

--
-- Indices de la tabla `award_winner`
--
ALTER TABLE `award_winner`
  ADD PRIMARY KEY (`award_winner_id`),
  ADD UNIQUE KEY `uk_award_winner_player` (`tournament_id`, `award_id`, `player_id`),
  ADD KEY `idx_aw_award` (`award_id`),
  ADD KEY `idx_aw_player` (`player_id`),
  ADD KEY `idx_aw_team` (`team_id`);
--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `region`
--
ALTER TABLE `region`
  MODIFY `region_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `country`
--
ALTER TABLE `country`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `federation`
--
ALTER TABLE `federation`
  MODIFY `federation_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `city`
--
ALTER TABLE `city`
  MODIFY `city_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `player_appearance`
--
ALTER TABLE `player_appearance`
  MODIFY `player_appearance_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `award_winner`
--
ALTER TABLE `award_winner`
  MODIFY `award_winner_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `country`
--
ALTER TABLE `country`
  ADD CONSTRAINT `fk_country_region` FOREIGN KEY (`region_id`) REFERENCES `region` (`region_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `federation`
--
ALTER TABLE `federation`
  ADD CONSTRAINT `fk_federation_confederation` FOREIGN KEY (`confederation_id`) REFERENCES `confederation` (`confederation_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `city`
--
ALTER TABLE `city`
  ADD CONSTRAINT `fk_city_country` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `stadium`
--
ALTER TABLE `stadium`
  ADD CONSTRAINT `fk_stadium_city` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `team`
--
ALTER TABLE `team`
  ADD CONSTRAINT `fk_team_confederation` FOREIGN KEY (`confederation_id`) REFERENCES `confederation` (`confederation_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_team_country` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_team_federation` FOREIGN KEY (`federation_id`) REFERENCES `federation` (`federation_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `matches`
--
ALTER TABLE `matches`
  ADD CONSTRAINT `fk_matches_away_team` FOREIGN KEY (`away_team_id`) REFERENCES `team` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_matches_home_team` FOREIGN KEY (`home_team_id`) REFERENCES `team` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_matches_stadium` FOREIGN KEY (`stadium_id`) REFERENCES `stadium` (`stadium_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_matches_tournament` FOREIGN KEY (`tournament_id`) REFERENCES `tournament` (`tournament_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `player_appearance`
--
ALTER TABLE `player_appearance`
  ADD CONSTRAINT `fk_pa_match` FOREIGN KEY (`match_id`) REFERENCES `matches` (`match_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_pa_player` FOREIGN KEY (`player_id`) REFERENCES `player` (`player_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_pa_position` FOREIGN KEY (`position_code`) REFERENCES `position` (`position_code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_pa_team` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_pa_tournament` FOREIGN KEY (`tournament_id`) REFERENCES `tournament` (`tournament_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `goal`
--
ALTER TABLE `goal`
  ADD CONSTRAINT `fk_goal_match` FOREIGN KEY (`match_id`) REFERENCES `matches` (`match_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_goal_player` FOREIGN KEY (`player_id`) REFERENCES `player` (`player_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_goal_player_team` FOREIGN KEY (`player_team_id`) REFERENCES `team` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_goal_team` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_goal_tournament` FOREIGN KEY (`tournament_id`) REFERENCES `tournament` (`tournament_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `award_winner`
--
ALTER TABLE `award_winner`
  ADD CONSTRAINT `fk_aw_award` FOREIGN KEY (`award_id`) REFERENCES `award` (`award_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_aw_player` FOREIGN KEY (`player_id`) REFERENCES `player` (`player_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_aw_team` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_aw_tournament` FOREIGN KEY (`tournament_id`) REFERENCES `tournament` (`tournament_id`) ON DELETE CASCADE ON UPDATE CASCADE;
SET FOREIGN_KEY_CHECKS = 1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
