-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Vært: 127.0.0.1
-- Genereringstid: 17. 01 2018 kl. 14:09:15
-- Serverversion: 10.1.26-MariaDB
-- PHP-version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `undervisning`
--

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `link` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Data dump for tabellen `menu`
--

INSERT INTO `menu` (`id`, `name`, `link`) VALUES
(1, 'Forside', 'forside'),
(2, 'Omkring', 'omkring'),
(3, 'Kontakt', 'kontakt'),
(4, 'Logind', 'logind');

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `email` varchar(65) NOT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `product_number` varchar(6) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Data dump for tabellen `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `product_number`, `description`) VALUES
(1, 'Test', '400.00', '58AE77', 'Vi tester produkter!'),
(2, 'Test V2', '259.00', 'H7JJ98', 'Woop si dasse!');

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `site_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Data dump for tabellen `settings`
--

INSERT INTO `settings` (`id`, `site_name`) VALUES
(1, 'Dynamisk Menu /m OOP');

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `userrole`
--

CREATE TABLE `userrole` (
  `id` int(11) NOT NULL,
  `name` varchar(15) DEFAULT NULL,
  `niveau` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Data dump for tabellen `userrole`
--

INSERT INTO `userrole` (`id`, `name`, `niveau`) VALUES
(1, 'Super Admin', 99),
(2, 'Admin', 90),
(3, 'Bruger', 50);

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `address` varchar(100) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `email` varchar(126) NOT NULL,
  `fk_userrole` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Data dump for tabellen `users`
--

INSERT INTO `users` (`id`, `username`, `firstname`, `lastname`, `password`, `address`, `phone`, `avatar`, `email`, `fk_userrole`) VALUES
(1, 'Mcarpens', 'Marc', 'Carpens', '$2y$12$gYrRIkZv6XsWu9DHKYfnJug/EbaQSrqfneXBEhM2OeSx/2D3FMvWK', 'Bumsevej 14', '50432210', '0221.jpg', 'super@test.com', 3),
(19, 'Lolita', 'Test', 'Bruger', '$2y$12$tpm7aSX0C4MBuhiQtmx/8uoXsgyJP2SpXJ0iOz/34zJ01VW80JnWu', 'Supervej 14', '54230095', '0221.jpg', 'super@test.com', 3),
(20, 'Marc', 'Test', 'Bruger', '$2y$12$apPqIWLfeycHVIyu9VjGieiwgX7o6UQBBwvNJpy5Qp7ehI04TAfja', 'Woopvej 23', '45339800', '0221.jpg', 'super@test.com', 2),
(21, 'LolitaMarc', 'Test', 'Bruger', '$2y$12$/SQqX42Aoi48ppkDsW97e.sBTsll3k7vNTncbS6ac3J/VNkGHfN62', 'hula bula 34', '54009211', '0221.jpg', 'super@test.com', 3),
(22, 'MrSatanel', 'Mikkel Staal', 'Alstrup Olsen', '$2y$12$eYeBpvpCyyRcnFW5ty9xCODP5nKhJnhB/72iHbHHJnZIU3AhEfRa6', 'Møllehusene 16, 1-35', '50421403', '0221.jpg', 'Staal.Mikkel@gmail.com', 1);

--
-- Begrænsninger for dumpede tabeller
--

--
-- Indeks for tabel `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indeks for tabel `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indeks for tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indeks for tabel `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indeks for tabel `userrole`
--
ALTER TABLE `userrole`
  ADD PRIMARY KEY (`id`);

--
-- Indeks for tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_userrole` (`fk_userrole`);

--
-- Brug ikke AUTO_INCREMENT for slettede tabeller
--

--
-- Tilføj AUTO_INCREMENT i tabel `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Tilføj AUTO_INCREMENT i tabel `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- Tilføj AUTO_INCREMENT i tabel `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Tilføj AUTO_INCREMENT i tabel `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Tilføj AUTO_INCREMENT i tabel `userrole`
--
ALTER TABLE `userrole`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Tilføj AUTO_INCREMENT i tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- Begrænsninger for dumpede tabeller
--

--
-- Begrænsninger for tabel `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`fk_userrole`) REFERENCES `userrole` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
