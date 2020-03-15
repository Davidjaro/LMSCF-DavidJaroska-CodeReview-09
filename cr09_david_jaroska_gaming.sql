-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 15. Mrz 2020 um 23:56
-- Server-Version: 10.4.11-MariaDB
-- PHP-Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cr09_david_jaroska_gaming`
--
CREATE DATABASE IF NOT EXISTS `cr09_david_jaroska_gaming` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `cr09_david_jaroska_gaming`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `first_name` varchar(40) DEFAULT NULL,
  `last_name` varchar(40) DEFAULT NULL,
  `fk_customer_info_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `customer`
--

INSERT INTO `customer` (`customer_id`, `first_name`, `last_name`, `fk_customer_info_id`) VALUES
(1, 'David', 'Jaroska', 1),
(2, 'Adrian', 'Romba', 2),
(3, 'Marcel', 'Arnot', 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customer_adress`
--

CREATE TABLE `customer_adress` (
  `customer_adress_id` int(11) NOT NULL,
  `adress` varchar(40) DEFAULT NULL,
  `country` varchar(40) DEFAULT NULL,
  `zip_code` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `customer_adress`
--

INSERT INTO `customer_adress` (`customer_adress_id`, `adress`, `country`, `zip_code`) VALUES
(1, 'Ausserpühret 47', 'Austria/Lower Austria', 2544),
(2, 'Mariatal 49', 'Austria/Lower Austria', 4291),
(3, 'Kelsenstrasse 56', 'Austria/Carinthia', 9753);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customer_info`
--

CREATE TABLE `customer_info` (
  `customer_info_id` int(11) NOT NULL,
  `fk_customer_adress_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `customer_info`
--

INSERT INTO `customer_info` (`customer_info_id`, `fk_customer_adress_id`) VALUES
(1, 1),
(2, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `game`
--

CREATE TABLE `game` (
  `game_id` int(11) NOT NULL,
  `fk_game_info_id` int(11) DEFAULT NULL,
  `fk_publisher_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `game`
--

INSERT INTO `game` (`game_id`, `fk_game_info_id`, `fk_publisher_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `game_info`
--

CREATE TABLE `game_info` (
  `game_info_id` int(11) NOT NULL,
  `game_name` varchar(60) DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `game_genre` varchar(50) DEFAULT NULL,
  `game_desc` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `game_info`
--

INSERT INTO `game_info` (`game_info_id`, `game_name`, `release_date`, `game_genre`, `game_desc`) VALUES
(1, 'Ori and the Will of the Wisps', '2020-03-11', 'Single-Player', 'The little spirit Ori is no stranger to peril, but when a fateful flight puts the owlet Ku in harm’s way, it will take more than bravery to bring a family back together, heal a broken land, and discover Ori’s true destiny.'),
(2, 'Ori and the Blind Forest', '2020-03-10', 'Single-Player', 'The forest of Nibel is dying. After a powerful storm sets a series of devastating events in motion, an unlikely hero must journey to find his courage and confront a dark nemesis to save his home.'),
(3, 'DOOM Eternal', '2020-03-20', 'FPS', 'Hell’s armies have invaded Earth. Become the Slayer in an epic single-player campaign to conquer demons across dimensions and stop the final destruction of humanity.');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `order`
--

CREATE TABLE `order` (
  `order_id` int(11) NOT NULL,
  `fk_customer_id` int(11) DEFAULT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_order_item_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `order`
--

INSERT INTO `order` (`order_id`, `fk_customer_id`, `order_date`, `fk_order_item_id`) VALUES
(1, 1, '2020-03-15 21:42:02', 1),
(2, 1, '2020-03-15 21:42:11', 2),
(3, 2, '2020-03-15 21:42:18', 3),
(4, 3, '2020-03-15 21:42:24', 2),
(5, 3, '2020-03-15 21:42:30', 3),
(6, 3, '2020-03-15 21:42:36', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `order_item`
--

CREATE TABLE `order_item` (
  `order_item_id` int(11) NOT NULL,
  `fk_game_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `order_item`
--

INSERT INTO `order_item` (`order_item_id`, `fk_game_id`) VALUES
(1, 1),
(2, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `publisher`
--

CREATE TABLE `publisher` (
  `publisher_id` int(11) NOT NULL,
  `publisher_name` varchar(50) DEFAULT NULL,
  `fk_publisher_adress_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `publisher`
--

INSERT INTO `publisher` (`publisher_id`, `publisher_name`, `fk_publisher_adress_id`) VALUES
(1, 'Xbox Game Studios', 1),
(2, 'Bethesda Softworks', 2),
(3, 'Ubisoft Montreal', 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `publisher_adress`
--

CREATE TABLE `publisher_adress` (
  `publisher_adress_id` int(11) NOT NULL,
  `adress` varchar(40) DEFAULT NULL,
  `country` varchar(40) DEFAULT NULL,
  `zip_code` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `publisher_adress`
--

INSERT INTO `publisher_adress` (`publisher_adress_id`, `adress`, `country`, `zip_code`) VALUES
(1, NULL, 'USA/Washington', 98053),
(2, '1370 Piccard Dr #120', 'USA/Rockville', 20850),
(3, '5505 Boul St-Laurent', 'Canada/Montreal', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `store`
--

CREATE TABLE `store` (
  `store_id` int(11) NOT NULL,
  `fk_store_info_id` int(11) DEFAULT NULL,
  `fk_order_id` int(11) DEFAULT NULL,
  `fk_game_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `store`
--

INSERT INTO `store` (`store_id`, `fk_store_info_id`, `fk_order_id`, `fk_game_id`) VALUES
(1, 1, 1, NULL),
(2, 2, 4, NULL),
(3, 3, 6, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `store_info`
--

CREATE TABLE `store_info` (
  `store_info_id` int(11) NOT NULL,
  `store_adress` varchar(128) DEFAULT NULL,
  `store_name` varchar(70) DEFAULT NULL,
  `country` varchar(25) DEFAULT NULL,
  `zip_code` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `store_info`
--

INSERT INTO `store_info` (`store_info_id`, `store_adress`, `store_name`, `country`, `zip_code`) VALUES
(1, 'Gablenzgasse 11', 'GameStop', 'Austria/Vienna', 1150),
(2, 'Mantlergasse 34-36 Rosenarcade', 'Media Markt Vienna Hietzing', 'Austria/Vienna', 1130),
(3, NULL, 'Steam', NULL, NULL);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `fk_customer_info_id` (`fk_customer_info_id`);

--
-- Indizes für die Tabelle `customer_adress`
--
ALTER TABLE `customer_adress`
  ADD PRIMARY KEY (`customer_adress_id`);

--
-- Indizes für die Tabelle `customer_info`
--
ALTER TABLE `customer_info`
  ADD PRIMARY KEY (`customer_info_id`),
  ADD KEY `fk_customer_adress_id` (`fk_customer_adress_id`);

--
-- Indizes für die Tabelle `game`
--
ALTER TABLE `game`
  ADD PRIMARY KEY (`game_id`),
  ADD KEY `fk_game_info_id` (`fk_game_info_id`),
  ADD KEY `fk_publisher_id` (`fk_publisher_id`);

--
-- Indizes für die Tabelle `game_info`
--
ALTER TABLE `game_info`
  ADD PRIMARY KEY (`game_info_id`);

--
-- Indizes für die Tabelle `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`),
  ADD KEY `fk_order_item_id` (`fk_order_item_id`);

--
-- Indizes für die Tabelle `order_item`
--
ALTER TABLE `order_item`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `fk_game_id` (`fk_game_id`);

--
-- Indizes für die Tabelle `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`publisher_id`),
  ADD KEY `fk_publisher_adress_id` (`fk_publisher_adress_id`);

--
-- Indizes für die Tabelle `publisher_adress`
--
ALTER TABLE `publisher_adress`
  ADD PRIMARY KEY (`publisher_adress_id`);

--
-- Indizes für die Tabelle `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`store_id`),
  ADD KEY `fk_store_info_id` (`fk_store_info_id`),
  ADD KEY `fk_order_id` (`fk_order_id`),
  ADD KEY `fk_game_id` (`fk_game_id`);

--
-- Indizes für die Tabelle `store_info`
--
ALTER TABLE `store_info`
  ADD PRIMARY KEY (`store_info_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `customer_adress`
--
ALTER TABLE `customer_adress`
  MODIFY `customer_adress_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `customer_info`
--
ALTER TABLE `customer_info`
  MODIFY `customer_info_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `game`
--
ALTER TABLE `game`
  MODIFY `game_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `game_info`
--
ALTER TABLE `game_info`
  MODIFY `game_info_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `order`
--
ALTER TABLE `order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `order_item`
--
ALTER TABLE `order_item`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `publisher`
--
ALTER TABLE `publisher`
  MODIFY `publisher_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `publisher_adress`
--
ALTER TABLE `publisher_adress`
  MODIFY `publisher_adress_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `store`
--
ALTER TABLE `store`
  MODIFY `store_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `store_info`
--
ALTER TABLE `store_info`
  MODIFY `store_info_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`fk_customer_info_id`) REFERENCES `customer_info` (`customer_info_id`);

--
-- Constraints der Tabelle `customer_info`
--
ALTER TABLE `customer_info`
  ADD CONSTRAINT `customer_info_ibfk_1` FOREIGN KEY (`fk_customer_adress_id`) REFERENCES `customer_adress` (`customer_adress_id`);

--
-- Constraints der Tabelle `game`
--
ALTER TABLE `game`
  ADD CONSTRAINT `game_ibfk_1` FOREIGN KEY (`fk_game_info_id`) REFERENCES `game_info` (`game_info_id`),
  ADD CONSTRAINT `game_ibfk_2` FOREIGN KEY (`fk_publisher_id`) REFERENCES `publisher` (`publisher_id`);

--
-- Constraints der Tabelle `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `order_ibfk_2` FOREIGN KEY (`fk_order_item_id`) REFERENCES `order_item` (`order_item_id`);

--
-- Constraints der Tabelle `order_item`
--
ALTER TABLE `order_item`
  ADD CONSTRAINT `order_item_ibfk_1` FOREIGN KEY (`fk_game_id`) REFERENCES `game` (`game_id`);

--
-- Constraints der Tabelle `publisher`
--
ALTER TABLE `publisher`
  ADD CONSTRAINT `publisher_ibfk_1` FOREIGN KEY (`fk_publisher_adress_id`) REFERENCES `publisher_adress` (`publisher_adress_id`);

--
-- Constraints der Tabelle `store`
--
ALTER TABLE `store`
  ADD CONSTRAINT `store_ibfk_1` FOREIGN KEY (`fk_store_info_id`) REFERENCES `store_info` (`store_info_id`),
  ADD CONSTRAINT `store_ibfk_2` FOREIGN KEY (`fk_order_id`) REFERENCES `order` (`order_id`),
  ADD CONSTRAINT `store_ibfk_3` FOREIGN KEY (`fk_game_id`) REFERENCES `game` (`game_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
