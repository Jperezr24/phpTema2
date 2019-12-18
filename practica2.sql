-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-12-2019 a las 20:31:27
-- Versión del servidor: 10.4.8-MariaDB
-- Versión de PHP: 7.1.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `practica2`
--
CREATE DATABASE IF NOT EXISTS `practica2` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish2_ci;
USE `practica2`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `juguetes`
--

CREATE TABLE `juguetes` (
  `idJuguete` int(11) NOT NULL,
  `nombreJuguete` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `precioJuguete` decimal(10,2) NOT NULL,
  `idReyMagoFK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `juguetes`
--

INSERT INTO `juguetes` (`idJuguete`, `nombreJuguete`, `precioJuguete`, `idReyMagoFK`) VALUES
(1, 'Aula de ciencia: Robot Mini ERP', '159.95', 1),
(2, 'Carbón', '0.00', 2),
(3, 'Cochecito Classic', '99.95', 3),
(4, 'Consola PS4 1 TB', '349.90', 3),
(5, 'Lego Villa familiar modular', '64.99', 2),
(6, 'Magia Borrás Clásica 150 trucos con luz', '32.95', 1),
(7, 'Meccano Excavadora construcción', '30.99', 1),
(8, 'Telescopio astronómico terrestre', '72.00', 1),
(9, 'Nenuco Hace pompas', '29.00', 2),
(10, 'Peluche delfín rosa', '34.00', 3),
(11, 'Twister', '17.95', 1),
(12, 'Pequeordenador', '22.95', 3),
(13, 'Robot Coji', '69.95', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ninos`
--

CREATE TABLE `ninos` (
  `idNino` int(11) NOT NULL,
  `nombreNino` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `apellidosNino` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `fechaNacimientoNino` date NOT NULL,
  `buenoSiNo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `ninos`
--

INSERT INTO `ninos` (`idNino`, `nombreNino`, `apellidosNino`, `fechaNacimientoNino`, `buenoSiNo`) VALUES
(1, 'Juan', 'Cabrera', '1996-06-07', 0),
(2, 'Jorge', 'Ponce', '1998-03-11', 1),
(3, 'Carlos', 'Crepo', '1998-12-01', 1),
(4, 'María', 'Pérez', '1992-07-12', 0),
(5, 'Ana', 'Valle', '2000-11-14', 1),
(6, 'Francisca', 'Atienza', '1990-07-28', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `idNinoFK` int(11) NOT NULL,
  `idJugueteFK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`idNinoFK`, `idJugueteFK`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(1, 7),
(2, 8),
(3, 9),
(4, 10),
(5, 11),
(6, 12),
(1, 13);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reyesmagos`
--

CREATE TABLE `reyesmagos` (
  `idReyMago` int(11) NOT NULL,
  `nombreReyMago` varchar(45) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `reyesmagos`
--

INSERT INTO `reyesmagos` (`idReyMago`, `nombreReyMago`) VALUES
(1, 'Melchor'),
(2, 'Gaspar'),
(3, 'Baltasar');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `juguetes`
--
ALTER TABLE `juguetes`
  ADD PRIMARY KEY (`idJuguete`),
  ADD KEY `idReyMagoFK` (`idReyMagoFK`);

--
-- Indices de la tabla `ninos`
--
ALTER TABLE `ninos`
  ADD PRIMARY KEY (`idNino`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD KEY `idJugueteFK` (`idJugueteFK`),
  ADD KEY `idNinoFK` (`idNinoFK`);

--
-- Indices de la tabla `reyesmagos`
--
ALTER TABLE `reyesmagos`
  ADD PRIMARY KEY (`idReyMago`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `juguetes`
--
ALTER TABLE `juguetes`
  MODIFY `idJuguete` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `ninos`
--
ALTER TABLE `ninos`
  MODIFY `idNino` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `reyesmagos`
--
ALTER TABLE `reyesmagos`
  MODIFY `idReyMago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `juguetes`
--
ALTER TABLE `juguetes`
  ADD CONSTRAINT `juguetes_ibfk_1` FOREIGN KEY (`idReyMagoFK`) REFERENCES `reyesmagos` (`idReyMago`);

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`idJugueteFK`) REFERENCES `juguetes` (`idJuguete`),
  ADD CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`idNinoFK`) REFERENCES `ninos` (`idNino`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
