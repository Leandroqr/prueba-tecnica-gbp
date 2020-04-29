-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 24-02-2020 a las 15:44:10
-- Versión del servidor: 5.7.28-0ubuntu0.18.04.4-log
-- Versión de PHP: 7.2.24-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `prueba_back`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aa_duplicar`
--

CREATE TABLE `aa_duplicar` (
  `id` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bodegas`
--

CREATE TABLE `bodegas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `id_responsable` int(11) NOT NULL,
  `estado` tinyint(1) NOT NULL COMMENT '0=Inactivo 1=Activo',
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `bodegas`
--

INSERT INTO `bodegas` (`id`, `nombre`, `id_responsable`, `estado`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Bucaramanga', 2, 1, NULL, NULL, '2020-02-21 19:34:03', '2020-02-21 19:34:03', NULL),
(2, 'Bogotá', 7, 1, NULL, NULL, '2020-02-21 19:34:03', '2020-02-21 19:34:03', NULL),
(3, 'Medellín', 4, 0, NULL, NULL, '2020-02-21 19:34:28', '2020-02-21 19:34:28', NULL),
(4, 'Neiva', 5, 0, NULL, NULL, '2020-02-21 19:34:28', '2020-02-21 19:34:28', NULL),
(5, 'Barranquilla', 3, 1, NULL, NULL, '2020-02-21 19:35:04', '2020-02-21 19:35:04', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historiales`
--

CREATE TABLE `historiales` (
  `id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `id_bodega_origen` int(11) DEFAULT NULL COMMENT 'Null si es ingreso normal',
  `id_bodega_destino` int(11) NOT NULL,
  `id_inventario` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventarios`
--

CREATE TABLE `inventarios` (
  `id` int(11) NOT NULL,
  `id_bodega` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `inventarios`
--

INSERT INTO `inventarios` (`id`, `id_bodega`, `id_producto`, `cantidad`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 5, 2, 200, NULL, NULL, '2020-02-21 19:43:26', '2020-02-21 19:43:26', NULL),
(2, 4, 1, 500, NULL, NULL, '2020-02-21 19:43:26', '2020-02-21 19:43:26', NULL),
(3, 2, 6, 250, NULL, NULL, '2020-02-21 19:44:03', '2020-02-21 19:44:03', NULL),
(4, 1, 6, 1000, NULL, NULL, '2020-02-21 19:44:03', '2020-02-21 19:44:03', NULL),
(5, 2, 3, 600, NULL, NULL, '2020-02-21 19:44:25', '2020-02-21 19:44:25', NULL),
(6, 2, 4, 10, NULL, NULL, '2020-02-21 19:44:25', '2020-02-21 19:44:25', NULL),
(7, 1, 1, 99, NULL, NULL, '2020-02-21 19:44:43', '2020-02-21 19:44:43', NULL),
(8, 3, 2, 800, NULL, NULL, '2020-02-21 19:44:43', '2020-02-21 19:44:43', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `estado` tinyint(1) NOT NULL COMMENT '0=Inactivo 1=Activo',
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `estado`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Licuadora', 'Destroyer máxima velocidad', 1, NULL, NULL, '2020-02-21 19:36:23', '2020-02-21 19:36:23', NULL),
(2, 'Nevera', 'Refrigerador no Frost', 0, NULL, NULL, '2020-02-21 19:36:23', '2020-02-21 19:36:23', NULL),
(3, 'Lavadora', 'Para lavar la Ropa', 1, NULL, NULL, '2020-02-21 19:37:09', '2020-02-21 19:37:09', NULL),
(4, 'Estufa', 'Para hacer el almuerzo', 1, NULL, NULL, '2020-02-21 19:37:09', '2020-02-21 19:37:09', NULL),
(5, 'Televisor', 'La Rosa de Guadalupe', 0, NULL, NULL, '2020-02-21 19:40:39', '2020-02-21 19:40:39', NULL),
(6, 'Computador', 'Backend y Frontend', 1, NULL, NULL, '2020-02-21 19:40:39', '2020-02-21 19:40:39', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `foto` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `estado` tinyint(1) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `nombre`, `foto`, `estado`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Cristiano Ronaldo', 'img/usuarios/anni.jpg', 1, NULL, NULL, '2020-02-21 19:30:45', '2020-02-21 19:30:45', NULL),
(2, 'Lionel Messi', 'img/usuarios/brad.jpg', 1, NULL, NULL, '2020-02-21 19:30:45', '2020-02-21 19:30:45', NULL),
(3, 'Carlos Valderrama', NULL, 0, NULL, NULL, '2020-02-21 19:31:20', '2020-02-21 19:31:20', NULL),
(4, 'René Higuita', 'img/usuarios/emma.jpg', 1, NULL, NULL, '2020-02-21 19:31:20', '2020-02-21 19:31:20', NULL),
(5, 'Edson Pelé', 'img/usuarios/james.jpg', 1, NULL, NULL, '2020-02-21 19:31:58', '2020-02-21 19:31:58', NULL),
(6, 'Diego Maradona', 'img/usuarios/jim-carrey.jpg', 1, NULL, NULL, '2020-02-21 19:31:58', '2020-02-21 19:31:58', NULL),
(7, 'Kylian Mbappé', NULL, 0, NULL, NULL, '2020-02-21 19:33:02', '2020-02-21 19:33:02', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `aa_duplicar`
--
ALTER TABLE `aa_duplicar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indices de la tabla `bodegas`
--
ALTER TABLE `bodegas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `id_responsable` (`id_responsable`);

--
-- Indices de la tabla `historiales`
--
ALTER TABLE `historiales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `id_bodega_origen` (`id_bodega_origen`),
  ADD KEY `id_bodega_destino` (`id_bodega_destino`),
  ADD KEY `id_inventario` (`id_inventario`);

--
-- Indices de la tabla `inventarios`
--
ALTER TABLE `inventarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_bodega_2` (`id_bodega`,`id_producto`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `id_bodega` (`id_bodega`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `aa_duplicar`
--
ALTER TABLE `aa_duplicar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `bodegas`
--
ALTER TABLE `bodegas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `historiales`
--
ALTER TABLE `historiales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inventarios`
--
ALTER TABLE `inventarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `bodegas`
--
ALTER TABLE `bodegas`
  ADD CONSTRAINT `bodegas_ibfk_1` FOREIGN KEY (`id_responsable`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `historiales`
--
ALTER TABLE `historiales`
  ADD CONSTRAINT `historiales_ibfk_1` FOREIGN KEY (`id_bodega_destino`) REFERENCES `bodegas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `historiales_ibfk_2` FOREIGN KEY (`id_bodega_origen`) REFERENCES `bodegas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `historiales_ibfk_3` FOREIGN KEY (`id_inventario`) REFERENCES `inventarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `inventarios`
--
ALTER TABLE `inventarios`
  ADD CONSTRAINT `inventarios_ibfk_1` FOREIGN KEY (`id_bodega`) REFERENCES `bodegas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `inventarios_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
