-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Czas generowania: 31 Sty 2017, 19:15
-- Wersja serwera: 10.1.13-MariaDB
-- Wersja PHP: 7.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `risenet`
--
CREATE DATABASE IF NOT EXISTS `risenet` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `risenet`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `passengers`
--

CREATE TABLE `passengers` (
  `id` int(11) NOT NULL,
  `plane_id` int(11) NOT NULL,
  `age` int(11) NOT NULL,
  `sex` enum('m','f') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `passengers`
--

INSERT INTO `passengers` (`id`, `plane_id`, `age`, `sex`) VALUES
(1, 4, 26, 'm'),
(2, 5, 19, 'f'),
(3, 5, 54, 'f'),
(4, 5, 36, 'm'),
(5, 6, 56, 'm'),
(6, 2, 58, 'm'),
(7, 3, 15, 'f'),
(8, 4, 25, 'm'),
(9, 4, 23, 'm'),
(10, 7, 29, 'f'),
(11, 7, 12, 'm'),
(12, 2, 18, 'f'),
(13, 3, 19, 'm'),
(14, 7, 17, 'f'),
(15, 2, 54, 'm'),
(16, 2, 52, 'f');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `planes`
--

CREATE TABLE `planes` (
  `id` int(11) NOT NULL,
  `name` varchar(56) NOT NULL,
  `flight_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `planes`
--

INSERT INTO `planes` (`id`, `name`, `flight_date`) VALUES
(1, 'Bell P-39', '2012-01-03'),
(2, 'Brewster F2A', '2011-05-18'),
(3, 'Curtiss C-46', '2011-07-05'),
(4, 'Vought F4U', '2011-09-30'),
(5, 'Boeing B-17', '2011-12-06'),
(6, 'Stinson L-5', '2011-12-28'),
(7, 'McDonnell F-4', '2011-11-16');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indexes for table `passengers`
--
ALTER TABLE `passengers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plane_id` (`plane_id`);

--
-- Indexes for table `planes`
--
ALTER TABLE `planes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `passengers`
--
ALTER TABLE `passengers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT dla tabeli `planes`
--
ALTER TABLE `planes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `passengers`
--
ALTER TABLE `passengers`
  ADD CONSTRAINT `passengers_ibfk_1` FOREIGN KEY (`plane_id`) REFERENCES `planes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
