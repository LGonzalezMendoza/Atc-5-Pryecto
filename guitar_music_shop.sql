-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-12-2023 a las 18:36:15
-- Versión del servidor: 10.1.28-MariaDB
-- Versión de PHP: 5.6.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `guitar_music_shop`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(4) NOT NULL,
  `email` varchar(100) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `a_paterno` varchar(100) NOT NULL,
  `a_materno` varchar(100) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `producto` varchar(30) NOT NULL,
  `direccion` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `email`, `nombre`, `a_paterno`, `a_materno`, `telefono`, `producto`, `direccion`) VALUES
(14, 'leoninsano@gmail.com', 'Leo', 'Gonzalez', 'Mendoza', '6561871231', 'Acordeon', 'Torres Norte'),
(15, 'Andrea@gmail.com', 'Andrea', 'Gonzalez', 'Mendoza', '6567479593', 'Bateria', 'Pico Helado'),
(16, 'neto@gmail.com', 'Ernesto', 'Gonzalez', 'De Santiago', '6566090804', 'Guitarra de 6 Cuerdas', 'Usa'),
(17, 'Navaweb@gmail.com', 'Ramiro', 'nava', 'Castillo', '6569299593', 'acordeon', 'canada'),
(18, 'capis@gmail.com', 'Raul ', 'Jimenez', 'Canilla', '6567329593', 'Tekamine p-JJ', 'Arena selvatica');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracion`
--

CREATE TABLE `configuracion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `telefono` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `direccion` text COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `configuracion`
--

INSERT INTO `configuracion` (`id`, `nombre`, `telefono`, `email`, `direccion`) VALUES
(1, 'Leonardo gonzalez', '6567479593', 'leonardoperz04@gmail.com', 'Neartico 3024');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_permisos`
--

CREATE TABLE `detalle_permisos` (
  `id` int(11) NOT NULL,
  `id_permiso` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `detalle_permisos`
--

INSERT INTO `detalle_permisos` (`id`, `id_permiso`, `id_usuario`) VALUES
(19, 1, 9),
(20, 2, 9),
(21, 3, 9),
(22, 4, 9),
(23, 5, 9),
(24, 6, 9),
(25, 7, 9),
(26, 8, 9),
(27, 9, 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_temp`
--

CREATE TABLE `detalle_temp` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `descuento` decimal(10,2) NOT NULL DEFAULT '0.00',
  `precio_venta` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id_empleado` int(4) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `puesto` varchar(50) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `edad` int(2) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `hora_entrada` varchar(20) NOT NULL,
  `sueldo` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id_empleado`, `nombre`, `puesto`, `direccion`, `edad`, `telefono`, `hora_entrada`, `sueldo`) VALUES
(5, 'Leonin', 'Gerente', 'Cd Juarez Vegas 0911', 21, '6567479789', '10:00', 100),
(6, 'Manuel', 'Gerente', 'Cd Juarez Pradera 3289', 19, '6562844235', '7:00', 100),
(7, 'Diego Emanuel Ramirez', 'Gerente', 'Cd Juarez Nuevo 0654', 32, '6568764567', '10:00', 100),
(8, 'david', 'Gerente', 'Cd Juarez Francisco Imadero 9098', 27, '&564347275', '7:00', 100),
(9, 'Jorge', 'Gerente', 'Cd Juarez Zulema 9098', 22, '6569039493', '10:00', 100);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`id`, `nombre`) VALUES
(1, 'configuración'),
(2, 'usuarios'),
(3, 'clientes'),
(4, 'vendedor'),
(5, 'ventas'),
(6, 'nueva_venta'),
(7, 'productos'),
(8, 'presentacion'),
(9, 'lugar');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL,
  `nom_producto` varchar(50) NOT NULL,
  `color` varchar(30) NOT NULL,
  `precio` int(5) NOT NULL,
  `modelo` varchar(20) NOT NULL,
  `tipo_instrumento` varchar(50) NOT NULL,
  `equipamiento` varchar(20) NOT NULL,
  `marca` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `nom_producto`, `color`, `precio`, `modelo`, `tipo_instrumento`, `equipamiento`, `marca`) VALUES
(3, 'Corona 2', 'Rojo', 500000, 'Masters ', 'Aire', 'Mochila Honer', 'Honer'),
(4, 'Panther', 'Negro', 18000, 'Novatos', 'Aire', 'Mochila Honer', 'Honer'),
(5, 'P-JJ', 'Madera', 48000, 'Series Ultimate', 'Guitarra de 12 cuerdas', 'Carcasa tekamine', 'Tekamine'),
(6, 'Legacy', 'rojo', 45000, 'Series Ultimate 2', 'Guitarra de 6 cuerdas', 'Carcasa tekamine', 'Tekamine'),
(7, 'Bateria', 'Naranja', 38000, 'Kids Gun', 'Tambores', 'Mochila Individual', 'Dump');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id_proveedor` int(4) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `precio` int(10) NOT NULL,
  `costo_envio` int(10) NOT NULL,
  `marca` varchar(10) NOT NULL,
  `ubicacion` varchar(30) NOT NULL,
  `tipo_producto` varchar(20) NOT NULL,
  `nom_producto` varchar(30) NOT NULL,
  `tipo_fragil` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`id_proveedor`, `telefono`, `precio`, `costo_envio`, `marca`, `ubicacion`, `tipo_producto`, `nom_producto`, `tipo_fragil`) VALUES
(13, '6567479593', 15000, 200, 'Honer', 'Francia', 'Acordeon de aire', 'Panther', 'Fragil'),
(14, '6569999593', 40000, 200, 'Tekamine', 'USA', 'Guitarra de 6 Cuerda', 'Legacy', 'Fragil'),
(15, '6569999593', 48000, 200, 'Tekamine', 'Usa Perris', 'Guitarra de 12 Cuerd', 'P-JJ', 'Fragil'),
(16, '6567479593', 50000, 200, 'Honer', 'Francia Paris', 'Acordeon ', 'Corona 2', 'Fragil'),
(17, '6567479592', 22000, 200, 'Dump', 'Canada', 'Bateria Completa', 'Bateria', 'Fragil');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tienda`
--

CREATE TABLE `tienda` (
  `id_sucursal` int(4) NOT NULL,
  `ubicacion` varchar(50) NOT NULL,
  `num_empleados` int(4) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `ventas` int(10) NOT NULL,
  `inventario` int(10) NOT NULL,
  `color` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tienda`
--

INSERT INTO `tienda` (`id_sucursal`, `ubicacion`, `num_empleados`, `nombre`, `telefono`, `ventas`, `inventario`, `color`) VALUES
(4, 'Cd Juarez Uva 2342', 12, 'Guitar Music Shop1', '6562844234', 3502, 2422, 'Verde'),
(5, 'Cd Juarez calle 24', 12, 'Guitar Music Shop 2', '656098752', 3523, 2987, 'Verde'),
(6, 'Cd Juarez Artico 2243', 12, 'Guitar Music Shop 3', '6562345760', 3321, 2231, 'Azul'),
(7, 'Cd Juarez Pilas 9843', 12, 'Guitar Music Shop 4', '656768090', 3893, 2734, 'Azul'),
(8, 'Cd Juarez ponciano 4825', 12, 'Guitar Music Shop 5', '6562345760', 2345, 1431, 'verde'),
(9, 'Cd Juarez La cuesta 3289', 12, 'Guitar Music Shop ', '6562844235', 3502, 2422, 'Azul');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL,
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `correo` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `usuario` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `clave` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idusuario`, `nombre`, `correo`, `usuario`, `clave`) VALUES
(1, 'Sistemas Free', 'ana.info1999@gmail.com', 'admin', '21232f297a57a5a743894a0e4a801fc3'),
(9, 'Maria Sanchez', 'maria@gmail.com', 'maria', '263bce650e68ab4e23f28263760b9fa5'),
(13, 'Leonardo', 'leonardo@gmail.com', 'Leonin', '54de734bc460bd404caee618007c6be6');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` int(11) NOT NULL,
  `nom_cliente` varchar(40) NOT NULL,
  `num_celular` varchar(10) NOT NULL,
  `direccion` varchar(20) NOT NULL,
  `precio_producto` int(6) NOT NULL,
  `costo_envio` int(5) NOT NULL,
  `email` varchar(30) NOT NULL,
  `nom_producto` varchar(30) NOT NULL,
  `total` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id`, `nom_cliente`, `num_celular`, `direccion`, `precio_producto`, `costo_envio`, `email`, `nom_producto`, `total`) VALUES
(12, 'Leo', '6561871231', 'Torres Norte', 500000, 200, 'leoninsano@gmail.com', 'Corona 2', 0),
(13, 'Andrea', '6567479593', 'Pico Helado', 38000, 1, 'Andrea@gmail.com', 'Bateria', 0),
(14, 'Ernesto', '6566090804', 'Usa', 45000, 200, 'neto@gmail.com', 'Legacy', 0),
(15, 'Raul ', '6567329593', 'Arena selvatica', 18000, 200, 'capis@gmail.com', 'Panther', 0),
(16, 'Ramiro', '6569299593', 'canada', 48000, 200, 'Navaweb@gmail.com', 'P-JJ', 0),
(17, 'Ramiro', '6569299593', 'canada', 18000, 200, 'Navaweb@gmail.com', 'Panther', 0),
(18, 'Leo', '6561871231', 'Torres Norte', 500000, 1, 'leoninsano@gmail.com', 'Corona 2', 0),
(19, 'Ernesto', '6566090804', 'Usa', 500000, 200, 'neto@gmail.com', 'Corona 2', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalle_permisos`
--
ALTER TABLE `detalle_permisos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_permiso` (`id_permiso`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `detalle_temp`
--
ALTER TABLE `detalle_temp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id_empleado`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id_proveedor`);

--
-- Indices de la tabla `tienda`
--
ALTER TABLE `tienda`
  ADD PRIMARY KEY (`id_sucursal`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `detalle_permisos`
--
ALTER TABLE `detalle_permisos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `detalle_temp`
--
ALTER TABLE `detalle_temp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id_empleado` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id_proveedor` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `tienda`
--
ALTER TABLE `tienda`
  MODIFY `id_sucursal` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_permisos`
--
ALTER TABLE `detalle_permisos`
  ADD CONSTRAINT `detalle_permisos_ibfk_1` FOREIGN KEY (`id_permiso`) REFERENCES `permisos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalle_permisos_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
