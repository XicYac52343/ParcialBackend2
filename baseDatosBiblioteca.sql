-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-04-2025 a las 18:28:04
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
-- Base de datos: `biblioteca`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `ID` int(11) NOT NULL,
  `ANIO` varchar(255) DEFAULT NULL,
  `AUTOR` varchar(255) DEFAULT NULL,
  `DISPONIBILIDAD` tinyint(1) DEFAULT 0,
  `GENERO` varchar(255) DEFAULT NULL,
  `ISBN` int(11) DEFAULT NULL,
  `TITULO` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`ID`, `ANIO`, `AUTOR`, `DISPONIBILIDAD`, `GENERO`, `ISBN`, `TITULO`) VALUES
(51, '2002', 'Gabril', 1, 'Terrpr', 58, 'Cien'),
(151, '1995', 'Pablo Neruda', 0, 'Amor', 98, '20 Poemas de Amor'),
(152, '2005', 'Yo', 0, 'Comedia', 47, 'El principito');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamos`
--

CREATE TABLE `prestamos` (
  `ID` int(11) NOT NULL,
  `ESTADO` varchar(255) DEFAULT NULL,
  `FECHA_DEVOLUCION` date DEFAULT NULL,
  `FECHA_PRESTAMO` date DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `UNLIBRO_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `prestamos`
--

INSERT INTO `prestamos` (`ID`, `ESTADO`, `FECHA_DEVOLUCION`, `FECHA_PRESTAMO`, `usuario_id`, `UNLIBRO_ID`) VALUES
(53, 'devuelto', '2025-05-07', '2025-04-23', 52, 51),
(201, 'devuelto', '2025-05-07', '2025-04-23', 52, 151),
(202, 'devuelto', '2025-05-07', '2025-04-23', 101, 152),
(251, 'devuelto', '2025-05-07', '2025-04-23', 101, 152),
(301, 'devuelto', '2025-05-07', '2025-04-23', 52, 151),
(351, 'noDevuelto', '2025-05-07', '2025-04-23', 101, 151),
(352, 'prestado', '2025-05-07', '2025-04-23', 101, 152);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sequence`
--

CREATE TABLE `sequence` (
  `SEQ_NAME` varchar(50) NOT NULL,
  `SEQ_COUNT` decimal(38,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sequence`
--

INSERT INTO `sequence` (`SEQ_NAME`, `SEQ_COUNT`) VALUES
('SEQ_GEN', 400);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `ID` int(11) NOT NULL,
  `APELLIDO` varchar(255) DEFAULT NULL,
  `CONTRASENIA` varchar(255) DEFAULT NULL,
  `CORREO` varchar(255) DEFAULT NULL,
  `NOMBRE` varchar(255) DEFAULT NULL,
  `ROL` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`ID`, `APELLIDO`, `CONTRASENIA`, `CORREO`, `NOMBRE`, `ROL`) VALUES
(1, 'master', '1', 'admin@gmail.com', 'admin', 'admin'),
(52, 'Vega', '1', 'david@gmail.com', 'David', 'estandar'),
(101, 'Perez', '1', 'hola@gmail.com', 'Esteffi', 'estandar');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_PRESTAMOS_usuario_id` (`usuario_id`),
  ADD KEY `FK_PRESTAMOS_UNLIBRO_ID` (`UNLIBRO_ID`);

--
-- Indices de la tabla `sequence`
--
ALTER TABLE `sequence`
  ADD PRIMARY KEY (`SEQ_NAME`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`ID`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD CONSTRAINT `FK_PRESTAMOS_UNLIBRO_ID` FOREIGN KEY (`UNLIBRO_ID`) REFERENCES `libros` (`ID`),
  ADD CONSTRAINT `FK_PRESTAMOS_usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
