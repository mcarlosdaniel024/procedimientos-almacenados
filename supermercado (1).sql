-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-03-2025 a las 21:24:51
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
-- Base de datos: `supermercado`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `nombre`) VALUES
(1, 'Productos lácteos'),
(2, 'Frutos del mar'),
(3, 'Frutas y verduras'),
(4, 'Cereales y legumbres\r\n'),
(5, 'Carnes y embutidos\r\n');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `categoria_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `nombre`, `descripcion`, `precio`, `stock`, `categoria_id`) VALUES
(1, 'Leche Entera', 'Leche de vaca pasteurizada', 3.50, 50, 1),
(2, 'Salmón Fresco', 'Filete de salmón del Atlántico', 15.99, 20, 2),
(3, 'Manzanas Rojas', 'Manzanas frescas y jugosas', 2.99, 100, 3),
(4, 'Lentejas', 'Lentejas secas en paquete de 500g', 1.50, 80, 4),
(5, 'Pechuga de Pollo', 'Pechuga de pollo sin hueso', 5.99, 30, 5);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_cantidad_por_categoria`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_cantidad_por_categoria` (
`categoria` varchar(100)
,`cantidad_productos` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_productos_caros`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_productos_caros` (
`id_producto` int(11)
,`nombre` varchar(100)
,`descripcion` text
,`precio` decimal(10,2)
,`stock` int(11)
,`categoria_id` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_productos_categorias`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_productos_categorias` (
`id_producto` int(11)
,`nombre` varchar(100)
,`descripcion` text
,`precio` decimal(10,2)
,`stock` int(11)
,`categoria` varchar(100)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_productos_ordenados`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_productos_ordenados` (
`id_producto` int(11)
,`nombre` varchar(100)
,`descripcion` text
,`precio` decimal(10,2)
,`stock` int(11)
,`categoria_id` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_stock_total`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_stock_total` (
`total_stock` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_cantidad_por_categoria`
--
DROP TABLE IF EXISTS `vista_cantidad_por_categoria`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_cantidad_por_categoria`  AS SELECT `c`.`nombre` AS `categoria`, count(`p`.`id_producto`) AS `cantidad_productos` FROM (`categorias` `c` left join `productos` `p` on(`c`.`id_categoria` = `p`.`categoria_id`)) GROUP BY `c`.`nombre` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_productos_caros`
--
DROP TABLE IF EXISTS `vista_productos_caros`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_productos_caros`  AS SELECT `productos`.`id_producto` AS `id_producto`, `productos`.`nombre` AS `nombre`, `productos`.`descripcion` AS `descripcion`, `productos`.`precio` AS `precio`, `productos`.`stock` AS `stock`, `productos`.`categoria_id` AS `categoria_id` FROM `productos` WHERE `productos`.`precio` > 10 ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_productos_categorias`
--
DROP TABLE IF EXISTS `vista_productos_categorias`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_productos_categorias`  AS SELECT `p`.`id_producto` AS `id_producto`, `p`.`nombre` AS `nombre`, `p`.`descripcion` AS `descripcion`, `p`.`precio` AS `precio`, `p`.`stock` AS `stock`, `c`.`nombre` AS `categoria` FROM (`productos` `p` join `categorias` `c` on(`p`.`categoria_id` = `c`.`id_categoria`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_productos_ordenados`
--
DROP TABLE IF EXISTS `vista_productos_ordenados`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_productos_ordenados`  AS SELECT `productos`.`id_producto` AS `id_producto`, `productos`.`nombre` AS `nombre`, `productos`.`descripcion` AS `descripcion`, `productos`.`precio` AS `precio`, `productos`.`stock` AS `stock`, `productos`.`categoria_id` AS `categoria_id` FROM `productos` ORDER BY `productos`.`precio` DESC ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_stock_total`
--
DROP TABLE IF EXISTS `vista_stock_total`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_stock_total`  AS SELECT sum(`productos`.`stock`) AS `total_stock` FROM `productos` ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `categoria_id` (`categoria_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id_categoria`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
