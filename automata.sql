-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-03-2018 a las 05:40:27
-- Versión del servidor: 10.1.31-MariaDB
-- Versión de PHP: 5.6.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `automata`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_bodegas`
--

CREATE TABLE `app_bodegas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `ciudad` varchar(45) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `telefono` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `app_bodegas`
--

INSERT INTO `app_bodegas` (`id`, `nombre`, `ciudad`, `direccion`, `telefono`) VALUES
(1, 'BARRANQUILLA', 'BARRANQUILLA', 'CLUB EL NOGAL 21', '3323232');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_clientes`
--

CREATE TABLE `app_clientes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `cedula` bigint(20) NOT NULL,
  `clase` int(1) NOT NULL,
  `nit` int(11) NOT NULL,
  `telefono` varchar(45) NOT NULL,
  `celular` varchar(45) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `credito` int(1) NOT NULL DEFAULT '0',
  `direccion` varchar(45) NOT NULL,
  `tipo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `app_clientes`
--

INSERT INTO `app_clientes` (`id`, `nombre`, `apellido`, `cedula`, `clase`, `nit`, `telefono`, `celular`, `correo`, `credito`, `direccion`, `tipo`) VALUES
(1, 'SANTA BODA', '', 0, 1, 2147483647, '2312222', '2314232323', 'sistemas@compuelectronicsltda.com', 1, 'calle 14 n 211 12', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_cotizaciones`
--

CREATE TABLE `app_cotizaciones` (
  `id` int(11) NOT NULL,
  `desde` datetime NOT NULL,
  `hasta` datetime NOT NULL,
  `cliente` int(11) NOT NULL,
  `recepcion` varchar(150) NOT NULL,
  `producto` text NOT NULL,
  `cantidad` text NOT NULL,
  `bodega` int(11) NOT NULL,
  `estado` int(2) NOT NULL,
  `concepto_descuento` text NOT NULL,
  `descuento` text NOT NULL,
  `concepto_impuesto` text NOT NULL,
  `impuesto` text NOT NULL,
  `fecha_evento` datetime NOT NULL,
  `iva` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `app_cotizaciones`
--

INSERT INTO `app_cotizaciones` (`id`, `desde`, `hasta`, `cliente`, `recepcion`, `producto`, `cantidad`, `bodega`, `estado`, `concepto_descuento`, `descuento`, `concepto_impuesto`, `impuesto`, `fecha_evento`, `iva`) VALUES
(1, '2017-07-12 00:00:00', '2017-07-21 23:05:00', 1, 'calle 14 n 211 12', '1806', '2', 1, 1, '', '0', '', '0', '0000-00-00 00:00:00', 1),
(2, '2017-07-12 00:00:00', '2017-07-21 23:05:00', 1, 'calle 14 n 211 12', '1806', '2', 1, 1, '', '0', '', '0', '0000-00-00 00:00:00', 1),
(3, '2017-07-12 00:00:00', '2017-07-14 23:05:00', 1, 'calle 122 n 33-45', '1015,1609,1003,1112,1222,1205,1718', '1,1,1,1,1,1,1', 1, 1, '', '0', '', '0', '0000-00-00 00:00:00', 0),
(4, '2017-07-27 00:00:00', '2017-07-29 23:05:00', 1, 'cra 15 n 116-36', '1230,1503', '10,5', 1, 1, '', '0', '', '0', '2017-08-03 07:22:00', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_facturaciones`
--

CREATE TABLE `app_facturaciones` (
  `id` int(11) NOT NULL,
  `id_reserva` int(11) NOT NULL,
  `total_facturado` bigint(20) NOT NULL,
  `abono` int(11) NOT NULL,
  `total_abonado` bigint(20) NOT NULL,
  `total_restante` bigint(11) NOT NULL,
  `concepto_descuentos` text NOT NULL,
  `descuentos` text NOT NULL,
  `concepto_impuestos` text NOT NULL,
  `impuestos` text NOT NULL,
  `fecha_abono` datetime NOT NULL,
  `iva` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `app_facturaciones`
--

INSERT INTO `app_facturaciones` (`id`, `id_reserva`, `total_facturado`, `abono`, `total_abonado`, `total_restante`, `concepto_descuentos`, `descuentos`, `concepto_impuestos`, `impuestos`, `fecha_abono`, `iva`) VALUES
(1, 1, 20000, 100000, 100000, -76200, '', '0', '', '0', '2017-07-12 10:27:54', 1),
(2, 1, 20000, -77000, 23000, 800, ',', '0,0', ',', '0,0', '2017-07-12 15:31:05', 1),
(3, 1, 20000, 0, 23000, 65060, 'pronto pago,pronto pago2,,', '1000,10000,0,0', 'transporte,refrigerio,regreos,,', '20000,30000,15000,0,0', '2017-08-08 01:20:12', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_generales`
--

CREATE TABLE `app_generales` (
  `id` int(11) NOT NULL,
  `logo` text NOT NULL,
  `color` varchar(10) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `app_generales`
--

INSERT INTO `app_generales` (`id`, `logo`, `color`, `nombre`) VALUES
(1, 'logo.png', '#a80f1b', 'OCLOCK EVENTOS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_movimientos`
--

CREATE TABLE `app_movimientos` (
  `id` int(11) NOT NULL,
  `id_m` int(11) NOT NULL,
  `producto_id` text NOT NULL,
  `item` int(11) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `cantidad` text NOT NULL,
  `bodega` int(11) NOT NULL,
  `bodega_entrada` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `creado` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `app_movimientos`
--

INSERT INTO `app_movimientos` (`id`, `id_m`, `producto_id`, `item`, `descripcion`, `cantidad`, `bodega`, `bodega_entrada`, `total`, `creado`) VALUES
(1, 1, '1806', 1, 'entran por compra\r\n', '100', 1, 0, 100, '2017-07-12 10:08:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_productos`
--

CREATE TABLE `app_productos` (
  `id` int(11) NOT NULL,
  `codigo` int(5) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `imagen` varchar(200) NOT NULL,
  `vl_minorista` int(11) NOT NULL,
  `vl_mayorista` int(11) NOT NULL,
  `categoria` int(3) NOT NULL DEFAULT '0',
  `vl_unitario` bigint(21) NOT NULL,
  `fecha_registro` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `app_productos`
--

INSERT INTO `app_productos` (`id`, `codigo`, `nombre`, `descripcion`, `imagen`, `vl_minorista`, `vl_mayorista`, `categoria`, `vl_unitario`, `fecha_registro`) VALUES
(1, 2301, '	Camion	', '', '0', 0, 0, 23, 60000000, '2017-07-12'),
(2, 1000, '	Abanico	', '', '0', 0, 0, 10, 6000, '2017-07-12'),
(3, 1100, '	Aditamentos para carpa	', '', '0', 0, 0, 11, 20000, '2017-07-12'),
(4, 1001, '	Antorchas oxidadas	', '', '0', 0, 0, 10, 30000, '2017-07-12'),
(5, 1002, '	Apotecario/dispensador 11,0L	', '', '0', 0, 0, 10, 337000, '2017-07-12'),
(6, 1003, '	Apotecario/dispensador 3,63L doble con tapa metalica	', '', '0', 0, 0, 10, 135000, '2017-07-12'),
(7, 1200, '	Arbol metalico blanco	', '', '0', 0, 0, 12, 120000, '2017-07-12'),
(8, 1201, '	Arco metalico oxidado	', '', '0', 0, 0, 12, 400000, '2017-07-12'),
(9, 1202, '	Aviso de paso 2,0m guayacan oscuro	', '', '0', 0, 0, 12, 80000, '2017-07-12'),
(10, 1203, '	Aviso de paso 2,6m guayacan oscuro	', '', '0', 0, 0, 12, 100000, '2017-07-12'),
(11, 1204, '	Aviso de señalizacion de tres letreros	', '', '0', 0, 0, 12, 160000, '2017-07-12'),
(12, 1004, '	Balde ovalado liso de laton	', '', '0', 0, 0, 10, 157000, '2017-07-12'),
(13, 1005, '	Balde ovalado martillado de laton	', '', '0', 0, 0, 10, 157000, '2017-07-12'),
(14, 1205, '	Balsas de guadua	', '', '0', 0, 0, 12, 35000, '2017-07-12'),
(15, 1300, '	Banca country de iglesia con espaldar sin tapizar	', '', '0', 0, 0, 13, 350000, '2017-07-12'),
(16, 1301, '	Banca country rectangular tapizado beige	', '', '0', 0, 0, 13, 80000, '2017-07-12'),
(17, 1302, '	Banca country sin espaldar sin tapizar	', '', '0', 0, 0, 13, 100000, '2017-07-12'),
(18, 1303, '	Banca doble en decape blanco sin tapizar	', '', '0', 0, 0, 13, 60000, '2017-07-12'),
(19, 1006, '	Bandeja antideslizante rectangular	', '', '0', 0, 0, 10, 35000, '2017-07-12'),
(20, 1007, '	Bandeja antideslizante redonda	', '', '0', 0, 0, 10, 25000, '2017-07-12'),
(21, 1008, '	Bandeja en madera blanca doble manija 40cm	', '', '0', 0, 0, 10, 20000, '2017-07-12'),
(22, 1009, '	Bandeja en madera blanca doble manija 45cm	', '', '0', 0, 0, 10, 22000, '2017-07-12'),
(23, 1010, '	Bandeja porcelana cuadrada doble manija blanca	', '', '0', 0, 0, 10, 45000, '2017-07-12'),
(24, 1011, '	Bandeja porcelana cuadrada grande blanca	', '', '0', 0, 0, 10, 60000, '2017-07-12'),
(25, 1012, '	Bandeja porcelana rectangular blanca con divisiones	', '', '0', 0, 0, 10, 50000, '2017-07-12'),
(26, 1013, '	Bandeja porcelana rectangular de dos manijas blanca	', '', '0', 0, 0, 10, 40000, '2017-07-12'),
(27, 1014, '	Bandeja porcelana rectangular grande blanca	', '', '0', 0, 0, 10, 40000, '2017-07-12'),
(28, 1015, '	Bandeja porcelana rectangular mediana blanca	', '', '0', 0, 0, 10, 35000, '2017-07-12'),
(29, 1016, '	Bandeja porcelana rectangular pequeña blanca	', '', '0', 0, 0, 10, 30000, '2017-07-12'),
(30, 1101, '	Baranda metalica negra	', '', '0', 0, 0, 11, 40000, '2017-07-12'),
(31, 1206, '	Barril de madera guayacan	', '', '0', 0, 0, 12, 200000, '2017-07-12'),
(32, 1017, '	Base cuadradas en papel parafinado	', '', '0', 0, 0, 10, 8000, '2017-07-12'),
(33, 1018, '	Base de vidrio grande, manija de cabulla con leyenda	', '', '0', 0, 0, 10, 45000, '2017-07-12'),
(34, 1019, '	Base de vidrio pequeña, manija de cabulla con leyenda	', '', '0', 0, 0, 10, 35000, '2017-07-12'),
(35, 1020, '	Base ovalada plateada para florero	', '', '0', 0, 0, 10, 70000, '2017-07-12'),
(36, 1021, '	Base para antorcha	', '', '0', 0, 0, 10, 20000, '2017-07-12'),
(37, 1022, '	Batea de madera natural	', '', '0', 0, 0, 10, 25000, '2017-07-12'),
(38, 1023, '	Batea madera country	', '', '0', 0, 0, 10, 25000, '2017-07-12'),
(39, 1024, '	Batea redonda en madera color naranja	', '', '0', 0, 0, 10, 80000, '2017-07-12'),
(40, 1025, '	Batea redonda en madera color rojo	', '', '0', 0, 0, 10, 80000, '2017-07-12'),
(41, 1026, '	Batea redonda en madera color verde	', '', '0', 0, 0, 10, 80000, '2017-07-12'),
(42, 1207, '	Bicicleta vintage aguamarina	', '', '0', 0, 0, 12, 1200000, '2017-07-12'),
(43, 1027, '	Bolsa de papel parafinado con figura	', '', '0', 0, 0, 10, 15000, '2017-07-12'),
(44, 1600, '	Bombillo inalambrico LED	', '', '0', 0, 0, 16, 4000, '2017-07-12'),
(45, 1601, '	Bombillo largo de filamento	', '', '0', 0, 0, 16, 15000, '2017-07-12'),
(46, 1602, '	Bombillo ping pong 15W	', '', '0', 0, 0, 16, 1200, '2017-07-12'),
(47, 1603, '	Bombillo redondo de filamento	', '', '0', 0, 0, 16, 30000, '2017-07-12'),
(48, 1028, '	Botella verde con cabulla	', '', '0', 0, 0, 10, 3000, '2017-07-12'),
(49, 1029, '	Bowl de vidrio transparente	', '', '0', 0, 0, 10, 50000, '2017-07-12'),
(50, 1030, '	Bowl ovalado transparente borde rojo	', '', '0', 0, 0, 10, 30000, '2017-07-12'),
(51, 1031, '	Bowl porcelana piramide blanco	', '', '0', 0, 0, 10, 45000, '2017-07-12'),
(52, 1032, '	Bowl porcelana redondo blanco	', '', '0', 0, 0, 10, 45000, '2017-07-12'),
(53, 1033, '	Bowl porcelana triangular curvo blanco	', '', '0', 0, 0, 10, 45000, '2017-07-12'),
(54, 1304, '	Butaco de bar country	', '', '0', 0, 0, 13, 35000, '2017-07-12'),
(55, 1305, '	Butaco de bar decape blanco	', '', '0', 0, 0, 13, 35000, '2017-07-12'),
(56, 1208, '	Buzon country	', '', '0', 0, 0, 12, 45000, '2017-07-12'),
(57, 1209, '	Buzon en decape blanco	', '', '0', 0, 0, 12, 45000, '2017-07-12'),
(58, 1604, '	Cable de poder para luz LED	', '', '0', 0, 0, 16, 30000, '2017-07-12'),
(59, 1605, '	Cable de señal para luz LED	', '', '0', 0, 0, 16, 30000, '2017-07-12'),
(60, 1034, '	Estacion de cafe de goteo doble cromada	', '', '0', 0, 0, 10, 250000, '2017-07-12'),
(61, 1035, '	Cajon 12 huecos country	', '', '0', 0, 0, 10, 30000, '2017-07-12'),
(62, 1036, '	Cajon de madera con 9 divisiones para dulces	', '', '0', 0, 0, 10, 30000, '2017-07-12'),
(63, 1606, '	Cajon para LED 110cm	', '', '0', 0, 0, 16, 80000, '2017-07-12'),
(64, 1607, '	Cajon para LED 80cm	', '', '0', 0, 0, 16, 80000, '2017-07-12'),
(65, 1037, '	Cajon rectangular vintage	', '', '0', 0, 0, 10, 20000, '2017-07-12'),
(66, 1500, '	Calentador a gas cuadrado con tubo de vidrio	', '', '0', 0, 0, 15, 1650000, '2017-07-12'),
(67, 1501, '	Calentador cilindrico tipo hongo a gas en acero inoxidable	', '', '0', 0, 0, 15, 450000, '2017-07-12'),
(68, 1502, '	Calentador de mesa con llama en el centro en madera	', '', '0', 0, 0, 15, 1250000, '2017-07-12'),
(69, 1503, '	Calentador de mesa con llama en el centro en metal	', '', '0', 0, 0, 15, 2272000, '2017-07-12'),
(70, 1504, '	Calentador hongo a gas en color negro	', '', '0', 0, 0, 15, 0, '2017-07-12'),
(71, 1505, '	Calentador triangular	', '', '0', 0, 0, 15, 0, '2017-07-12'),
(72, 1038, '	Camino de yute con borde en encaje blanco	', '', '0', 0, 0, 10, 112000, '2017-07-12'),
(73, 1102, '	Canal blanca 12m	', '', '0', 0, 0, 11, 140000, '2017-07-12'),
(74, 1103, '	Canal blanca 18m	', '', '0', 0, 0, 11, 180000, '2017-07-12'),
(75, 1104, '	Canal blanca 4m	', '', '0', 0, 0, 11, 50000, '2017-07-12'),
(76, 1105, '	Canal blanca 6m	', '', '0', 0, 0, 11, 70000, '2017-07-12'),
(77, 1106, '	Canal transparente 12m	', '', '0', 0, 0, 11, 120000, '2017-07-12'),
(78, 1039, '	Canasta de mimbre oscuro ovalada doble manija	', '', '0', 0, 0, 10, 20000, '2017-07-12'),
(79, 1040, '	Canasta rectangular de mimbre con una manija	', '', '0', 0, 0, 10, 15000, '2017-07-12'),
(80, 1041, '	Canasta redonda para picada de mimbre	', '', '0', 0, 0, 10, 8000, '2017-07-12'),
(81, 1210, '	Canasta/huacal country	', '', '0', 0, 0, 12, 20000, '2017-07-12'),
(82, 1211, '	Canasta/huacal decape blanco	', '', '0', 0, 0, 12, 20000, '2017-07-12'),
(83, 1042, '	Candelabro Mercury glass de vidrio 11cm	', '', '0', 0, 0, 10, 50000, '2017-07-12'),
(84, 1043, '	Candelabro Mercury glass de vidrio 18cm	', '', '0', 0, 0, 10, 58000, '2017-07-12'),
(85, 1044, '	Candelabro Mercury glass de vidrio 19cm	', '', '0', 0, 0, 10, 60000, '2017-07-12'),
(86, 1045, '	Candelabro Mercury glass de vidrio 26cm	', '', '0', 0, 0, 10, 70000, '2017-07-12'),
(87, 1046, '	Candelabro plateado de vidrio 17cm	', '', '0', 0, 0, 10, 35000, '2017-07-12'),
(88, 1047, '	Candelabro plateado de vidrio 21cm	', '', '0', 0, 0, 10, 45000, '2017-07-12'),
(89, 1048, '	Candelabro plateado de vidrio 25cm	', '', '0', 0, 0, 10, 55000, '2017-07-12'),
(90, 1049, '	Candelabro solitario plateado de vidrio 24cm	', '', '0', 0, 0, 10, 45000, '2017-07-12'),
(91, 1050, '	Candelabro solitario plateado de vidrio 32cm	', '', '0', 0, 0, 10, 58000, '2017-07-12'),
(92, 1212, '	Candy bar country	', '', '0', 0, 0, 12, 700000, '2017-07-12'),
(93, 1213, '	Candy bar decape blanco	', '', '0', 0, 0, 12, 700000, '2017-07-12'),
(94, 1051, '	Canoa de porcelana forma triangular	', '', '0', 0, 0, 10, 30000, '2017-07-12'),
(95, 1214, '	Canoa para bebidas	', '', '0', 0, 0, 12, 600000, '2017-07-12'),
(96, 1052, '	Canorta larga de porcelana para postres blanca	', '', '0', 0, 0, 10, 30000, '2017-07-12'),
(97, 1107, '	Carpa blanca 4m x 6m	', '', '0', 0, 0, 11, 2000000, '2017-07-12'),
(98, 1108, '	Carpa blanca 6m x 12m	', '', '0', 0, 0, 11, 2400000, '2017-07-12'),
(99, 1109, '	Carpa blanca 6m x 6m a dos aguas	', '', '0', 0, 0, 11, 2000000, '2017-07-12'),
(100, 1110, '	Carpa camino blanca 2m x 5m	', '', '0', 0, 0, 11, 1500000, '2017-07-12'),
(101, 1111, '	CARPA IMPORTADA BLANCA 18M X 30M	', '', '', 2500000, 2000000, 11, 120000000, '2017-07-12'),
(102, 1112, '	Carpa importada traslucida 13,7m x 25,5m	', '', '0', 0, 0, 11, 100000000, '2017-07-12'),
(103, 1113, '	Carpa pagoda 6m x 6m	', '', '0', 0, 0, 11, 2000000, '2017-07-12'),
(104, 1114, '	Carpa transparente 3m x 12m	', '', '0', 0, 0, 11, 1800000, '2017-07-12'),
(105, 1115, '	Carpa transparente 6m x 12m	', '', '0', 0, 0, 11, 2200000, '2017-07-12'),
(106, 1116, '	Carpa transparente 6m x 6m	', '', '0', 0, 0, 11, 2000000, '2017-07-12'),
(107, 1215, '	Carreta country de ruedas gruesas	', '', '0', 0, 0, 12, 200000, '2017-07-12'),
(108, 1216, '	Carrete decape blanco 100cm	', '', '0', 0, 0, 12, 40000, '2017-07-12'),
(109, 1217, '	Carrete decape blanco 80cm	', '', '0', 0, 0, 12, 30000, '2017-07-12'),
(110, 1218, '	Carrete natural 100cm	', '', '0', 0, 0, 12, 40000, '2017-07-12'),
(111, 1219, '	Carrete natural 80cm	', '', '0', 0, 0, 12, 30000, '2017-07-12'),
(112, 1220, '	Carretilla con ruedas de bicicleta color decape aguamarina	', '', '0', 0, 0, 12, 500000, '2017-07-12'),
(113, 1221, '	Carretilla con ruedas de bicicleta color decape blanca	', '', '0', 0, 0, 12, 500000, '2017-07-12'),
(114, 1222, '	Carretilla con ruedas de bicicleta color guayacan oscura	', '', '0', 0, 0, 12, 500000, '2017-07-12'),
(115, 1053, '	Carro de algodones rosado	', '', '0', 0, 0, 10, 700000, '2017-07-12'),
(116, 1054, '	Carro de maiz pira rojo	', '', '0', 0, 0, 10, 700000, '2017-07-12'),
(117, 1055, '	Carro de perros calientes rojo	', '', '0', 0, 0, 10, 1000000, '2017-07-12'),
(118, 1056, '	Carro de raspados azul	', '', '0', 0, 0, 10, 700000, '2017-07-12'),
(119, 1223, '	Cenicero de pie cromado	', '', '0', 0, 0, 12, 60000, '2017-07-12'),
(120, 1506, '	Cilindro de gas 5kg/11lb	', '', '0', 0, 0, 15, 20000, '2017-07-12'),
(121, 1507, '	Cilindro de gas 9kg/20lb	', '', '0', 0, 0, 15, 30000, '2017-07-12'),
(122, 1057, '	Cocota de porcelana grande blanca	', '', '0', 0, 0, 10, 4000, '2017-07-12'),
(123, 1058, '	Cocota de porcelana pequeña blanca	', '', '0', 0, 0, 10, 3500, '2017-07-12'),
(124, 1306, '	Cojin azul aguamarina para silla Tiffany/inglesa	', '', '0', 0, 0, 13, 20000, '2017-07-12'),
(125, 1307, '	Cojin beige para silla Tiffany/Chivary/Inglesa	', '', '0', 0, 0, 13, 20000, '2017-07-12'),
(126, 1308, '	Cojin blanco para silla Tiffany/Chivary/Inglesa	', '', '0', 0, 0, 13, 20000, '2017-07-12'),
(127, 1309, '	Cojin fucsia para silla Tiffany/Chivary/Inglesa	', '', '0', 0, 0, 13, 20000, '2017-07-12'),
(128, 1310, '	Cojin gris raton para silla Tiffany/Chivary/Inglesa	', '', '0', 0, 0, 13, 20000, '2017-07-12'),
(129, 1311, '	Cojin magenta para silla Tiffany/Chivary/Inglesa	', '', '0', 0, 0, 13, 20000, '2017-07-12'),
(130, 1312, '	Cojin morado para silla Tiffany/Chivary/Inglesa	', '', '0', 0, 0, 13, 20000, '2017-07-12'),
(131, 1313, '	Cojin naranja para silla Tiffany/Chivary/Inglesa	', '', '0', 0, 0, 13, 20000, '2017-07-12'),
(132, 1314, '	Cojin negro para silla Tiffany/Chivary/Inglesa	', '', '0', 0, 0, 13, 20000, '2017-07-12'),
(133, 1315, '	Cojin plateado para silla Tiffany/Chivary/Inglesa	', '', '0', 0, 0, 13, 20000, '2017-07-12'),
(134, 1316, '	Cojin verde manzana para silla Tiffany/Chivary/Inglesa	', '', '0', 0, 0, 13, 20000, '2017-07-12'),
(135, 1059, '	Cojines decorativos de yute	', '', '0', 0, 0, 10, 35000, '2017-07-12'),
(136, 1224, '	Columpio rojo	', '', '0', 0, 0, 12, 50000, '2017-07-12'),
(137, 1060, '	Concha de porcelana tipo ostra	', '', '0', 0, 0, 10, 4000, '2017-07-12'),
(138, 1061, '	Concha marina grande	', '', '0', 0, 0, 10, 12000, '2017-07-12'),
(139, 1062, '	Concha marina mediana	', '', '0', 0, 0, 10, 6000, '2017-07-12'),
(140, 1063, '	Cono de polvora	', '', '0', 0, 0, 10, 12000, '2017-07-12'),
(141, 1608, '	Control remoto de bombillo LED	', '', '0', 0, 0, 16, 10000, '2017-07-12'),
(142, 1064, '	Copa de aguardiente	', '', '0', 0, 0, 10, 2500, '2017-07-12'),
(143, 1065, '	Copa de helado	', '', '0', 0, 0, 10, 4000, '2017-07-12'),
(144, 1066, '	Copa Mercury para centro de mesa tipo flor	', '', '0', 0, 0, 10, 35000, '2017-07-12'),
(145, 1067, '	Copon de ostia	', '', '0', 0, 0, 10, 45000, '2017-07-12'),
(146, 1117, '	Cortina blanca 12m 	', '', '0', 0, 0, 11, 900000, '2017-07-12'),
(147, 1118, '	Cortina blanca 4m	', '', '0', 0, 0, 11, 400000, '2017-07-12'),
(148, 1119, '	Cortina blanca 6m	', '', '0', 0, 0, 11, 480000, '2017-07-12'),
(149, 1120, '	Cortina transparente 12m	', '', '0', 0, 0, 11, 850000, '2017-07-12'),
(150, 1121, '	Cortina transparente 3m	', '', '0', 0, 0, 11, 300000, '2017-07-12'),
(151, 1122, '	Cortina transparente 6m	', '', '0', 0, 0, 11, 400000, '2017-07-12'),
(152, 1068, '	Cubo de espejos 13cm	', '', '0', 0, 0, 10, 35000, '2017-07-12'),
(153, 1069, '	Cubo de espejos 22cm	', '', '0', 0, 0, 10, 40000, '2017-07-12'),
(154, 1070, '	Cubo de espejos 32cm	', '', '0', 0, 0, 10, 60000, '2017-07-12'),
(155, 1071, '	Cubo de espejos 54cm	', '', '0', 0, 0, 10, 70000, '2017-07-12'),
(156, 1072, '	Cubo de espejos 65cm	', '', '0', 0, 0, 10, 80000, '2017-07-12'),
(157, 1073, '	Cubo de espejos 75cm	', '', '0', 0, 0, 10, 90000, '2017-07-12'),
(158, 1074, '	Cuchara de melamina blanca	', '', '0', 0, 0, 10, 3500, '2017-07-12'),
(159, 1075, '	Cuchara de mini platinium	', '', '0', 0, 0, 10, 250, '2017-07-12'),
(160, 1076, '	Cuchara de servicio de lujo	', '', '0', 0, 0, 10, 12000, '2017-07-12'),
(161, 1077, '	Cuchara salsera con pata curva	', '', '0', 0, 0, 10, 7000, '2017-07-12'),
(162, 1078, '	Cuchara salsera lisa	', '', '0', 0, 0, 10, 7000, '2017-07-12'),
(163, 1079, '	Cuchillo mantequillero	', '', '0', 0, 0, 10, 10000, '2017-07-12'),
(164, 1080, '	Delantal/peto negro para mesero	', '', '0', 0, 0, 10, 20000, '2017-07-12'),
(165, 1081, '	Deposito/tarro/envase para antorcha	', '', '0', 0, 0, 10, 2000, '2017-07-12'),
(166, 1609, '	Dimer	', '', '0', 0, 0, 16, 15000, '2017-07-12'),
(167, 2100, '	Divan/chaise longue blanco tapizado color champagne	', '', '0', 0, 0, 21, 150000, '2017-07-12'),
(168, 1610, '	Encendedor de polvora	', '', '0', 0, 0, 16, 1000, '2017-07-12'),
(169, 1225, '	Escalera con entrepaños color decape blanco	', '', '0', 0, 0, 12, 150000, '2017-07-12'),
(170, 1226, '	Escalera con entrepaños country	', '', '0', 0, 0, 12, 150000, '2017-07-12'),
(171, 1227, '	Escalera LOVE blanca	', '', '0', 0, 0, 12, 250000, '2017-07-12'),
(172, 2000, '	Escalera para tarima	', '', '0', 0, 0, 20, 80000, '2017-07-12'),
(173, 1228, '	Escritorio aguamarina grande	', '', '0', 0, 0, 12, 120000, '2017-07-12'),
(174, 1229, '	Escritorio aguamarina pequeño	', '', '0', 0, 0, 12, 100000, '2017-07-12'),
(175, 1082, '	Espada de rodizio	', '', '0', 0, 0, 10, 15000, '2017-07-12'),
(176, 1083, '	Espatula/pala cuchillo	', '', '0', 0, 0, 10, 25000, '2017-07-12'),
(177, 1084, '	Espejo biselado cuadrado 4mm	', '', '0', 0, 0, 10, 10000, '2017-07-12'),
(178, 1085, '	Espejo rectangular	', '', '0', 0, 0, 10, 60000, '2017-07-12'),
(179, 1123, '	Estructura 6m x 12m	', '', '0', 0, 0, 11, 1800000, '2017-07-12'),
(180, 1124, '	Estructura 6m x 6m	', '', '0', 0, 0, 11, 1500000, '2017-07-12'),
(181, 1125, '	Estructura pagoda 6m x 6m	', '', '0', 0, 0, 11, 1500000, '2017-07-12'),
(182, 1230, '	Estructura tipo huppa metalica para mesa	', '', '0', 0, 0, 12, 600000, '2017-07-12'),
(183, 1086, '	Expimidor verde	', '', '0', 0, 0, 10, 3000, '2017-07-12'),
(184, 1611, '	Extension 10m blanca de bombillo ping pong	', '', '0', 0, 0, 16, 60000, '2017-07-12'),
(185, 1612, '	Extension 10m negra de bombillo ping pong	', '', '0', 0, 0, 16, 60000, '2017-07-12'),
(186, 1613, '	Extension 30m de cobre con luz LED	', '', '0', 0, 0, 16, 270000, '2017-07-12'),
(187, 1614, '	Extension 5m de cobre con luz LED	', '', '0', 0, 0, 16, 125000, '2017-07-12'),
(188, 1615, '	Extension 8m de flores (24 bombillos cada extension)	', '', '0', 0, 0, 16, 20000, '2017-07-12'),
(189, 1616, '	Extension 8m granito de arroz color amarillo	', '', '0', 0, 0, 16, 9000, '2017-07-12'),
(190, 1617, '	Extension 8m granito de arroz color calido	', '', '0', 0, 0, 16, 9000, '2017-07-12'),
(191, 1087, '	Farol acero pequeño	', '', '0', 0, 0, 10, 170000, '2017-07-12'),
(192, 1088, '	Farol bronce grande	', '', '0', 0, 0, 10, 110000, '2017-07-12'),
(193, 1089, '	Farol bronce pequeño	', '', '0', 0, 0, 10, 83000, '2017-07-12'),
(194, 1090, '	Farol cuadrado color madera	', '', '0', 0, 0, 10, 135000, '2017-07-12'),
(195, 1091, '	Farol acero grande	', '', '0', 0, 0, 10, 200000, '2017-07-12'),
(196, 1092, '	Farol cuadrado grande vintage	', '', '0', 0, 0, 10, 200000, '2017-07-12'),
(197, 1093, '	Farol hexagonal vintage pequeño	', '', '0', 0, 0, 10, 30000, '2017-07-12'),
(198, 1094, '	Farol ovalado para tres velas	', '', '0', 0, 0, 10, 131000, '2017-07-12'),
(199, 1317, '	Forro para silla Tiffany/medallon/palitos	', '', '0', 0, 0, 13, 20000, '2017-07-12'),
(200, 1231, '	Freezer o cooler table	', '', '0', 0, 0, 12, 1200000, '2017-07-12'),
(201, 1095, '	Globo chino amarillo	', '', '0', 0, 0, 10, 10000, '2017-07-12'),
(202, 1096, '	Globo chino azul 35cm	', '', '0', 0, 0, 10, 10000, '2017-07-12'),
(203, 1097, '	Globo chino azul 39cm	', '', '0', 0, 0, 10, 10000, '2017-07-12'),
(204, 1098, '	Globo chino blanco 35cm	', '', '0', 0, 0, 10, 10000, '2017-07-12'),
(205, 1099, '	Globo chino blanco 39cm	', '', '0', 0, 0, 10, 10000, '2017-07-12'),
(206, 10100, '	Globo chino fucsia	', '', '0', 0, 0, 10, 10000, '2017-07-12'),
(207, 10101, '	Globo chino naranja	', '', '0', 0, 0, 10, 10000, '2017-07-12'),
(208, 10102, '	Globo chino rojo	', '', '0', 0, 0, 10, 10000, '2017-07-12'),
(209, 10103, '	Globo chino verde 35cm	', '', '0', 0, 0, 10, 10000, '2017-07-12'),
(210, 10104, '	Globo chino verde 39cm	', '', '0', 0, 0, 10, 10000, '2017-07-12'),
(211, 10105, '	Globo cuadrado beige 	', '', '0', 0, 0, 10, 20000, '2017-07-12'),
(212, 10106, '	Globo de papel	', '', '0', 0, 0, 10, 3000, '2017-07-12'),
(213, 10107, '	Hoja metalica verde	', '', '0', 0, 0, 10, 40000, '2017-07-12'),
(214, 1232, '	Huppa bambu (diez varas)	', '', '0', 0, 0, 12, 80000, '2017-07-12'),
(215, 1233, '	Huppa metalica color marron	', '', '0', 0, 0, 12, 350000, '2017-07-12'),
(216, 1618, '	Instalacion multitomas para luces LED	', '', '0', 0, 0, 16, 20000, '2017-07-12'),
(217, 10108, '	Jarron opalizado	', '', '0', 0, 0, 10, 60000, '2017-07-12'),
(218, 10109, '	Jaula hexagonal blanca	', '', '0', 0, 0, 10, 156000, '2017-07-12'),
(219, 2001, '	Lamina de piso 1,20m x 2,40m color madera	', '', '0', 0, 0, 20, 80000, '2017-07-12'),
(220, 1619, '	Lampara de cristal grande 12bombillos dos hileras	', '', '0', 0, 0, 16, 900000, '2017-07-12'),
(221, 1620, '	Lampara de cristal pequeña 5bombillos una hilera	', '', '0', 0, 0, 16, 560000, '2017-07-12'),
(222, 1621, '	Lampara de madera con seis luces colgantes	', '', '0', 0, 0, 16, 80000, '2017-07-12'),
(223, 1622, '	Lampara de pie	', '', '0', 0, 0, 16, 25000, '2017-07-12'),
(224, 10110, '	Lampara flotante	', '', '0', 0, 0, 10, 8000, '2017-07-12'),
(225, 1623, '	Lamparas en acrilico (juego de tres 1,2-1,4-1,6m)	', '', '0', 0, 0, 16, 150000, '2017-07-12'),
(227, 10111, '	Lechera de vaca	', '', '0', 0, 0, 10, 8000, '2017-07-12'),
(228, 1700, '	Letra & 55cm	', '', '0', 0, 0, 17, 200000, '2017-07-12'),
(229, 1701, '	Letra & 75cm	', '', '0', 0, 0, 17, 200000, '2017-07-12'),
(230, 1702, '	Letra A 90cm	', '', '0', 0, 0, 17, 200000, '2017-07-12'),
(231, 1703, '	Letra A arabesca	', '', '0', 0, 0, 17, 200000, '2017-07-12'),
(232, 1704, '	Letra B 90cm	', '', '0', 0, 0, 17, 200000, '2017-07-12'),
(233, 1705, '	Letra B arabesca	', '', '0', 0, 0, 17, 200000, '2017-07-12'),
(234, 1706, '	Letra C 90cm	', '', '0', 0, 0, 17, 200000, '2017-07-12'),
(235, 1707, '	Letra D 90cm	', '', '0', 0, 0, 17, 200000, '2017-07-12'),
(236, 1708, '	Letra E 110cm	', '', '0', 0, 0, 17, 200000, '2017-07-12'),
(237, 1709, '	Letra E 90cm	', '', '0', 0, 0, 17, 200000, '2017-07-12'),
(238, 1710, '	Letra G 90cm	', '', '0', 0, 0, 17, 200000, '2017-07-12'),
(239, 1711, '	Letra H 90cm	', '', '0', 0, 0, 17, 200000, '2017-07-12'),
(240, 1712, '	Letra I 90cm	', '', '0', 0, 0, 17, 200000, '2017-07-12'),
(241, 1713, '	Letra J 90cm	', '', '0', 0, 0, 17, 200000, '2017-07-12'),
(242, 1714, '	Letra K 90cm	', '', '0', 0, 0, 17, 200000, '2017-07-12'),
(243, 1715, '	Letra L 110cm	', '', '0', 0, 0, 17, 200000, '2017-07-12'),
(244, 1716, '	Letra L 90cm	', '', '0', 0, 0, 17, 200000, '2017-07-12'),
(245, 1717, '	Letra M 90cm	', '', '0', 0, 0, 17, 200000, '2017-07-12'),
(246, 1718, '	Letra N 90cm	', '', '0', 0, 0, 17, 200000, '2017-07-12'),
(247, 1719, '	Letra O 110cm	', '', '0', 0, 0, 17, 200000, '2017-07-12'),
(248, 1720, '	Letra O 90cm	', '', '0', 0, 0, 17, 200000, '2017-07-12'),
(249, 1721, '	Letra P 90cm	', '', '0', 0, 0, 17, 200000, '2017-07-12'),
(250, 1722, '	Letra R 90cm	', '', '0', 0, 0, 17, 200000, '2017-07-12'),
(251, 1723, '	Letra R arabesca	', '', '0', 0, 0, 17, 200000, '2017-07-12'),
(252, 1724, '	Letra S 90cm	', '', '0', 0, 0, 17, 200000, '2017-07-12'),
(253, 1725, '	Letra T 90cm	', '', '0', 0, 0, 17, 200000, '2017-07-12'),
(254, 1726, '	Letra U 90cm	', '', '0', 0, 0, 17, 200000, '2017-07-12'),
(255, 1727, '	Letra V 110cm	', '', '0', 0, 0, 17, 200000, '2017-07-12'),
(256, 1728, '	Letra V 90cm	', '', '0', 0, 0, 17, 200000, '2017-07-12'),
(257, 1729, '	Letra W 90cm	', '', '0', 0, 0, 17, 200000, '2017-07-12'),
(258, 1730, '	Letra Y 90cm	', '', '0', 0, 0, 17, 200000, '2017-07-12'),
(259, 1731, '	Letrero LOVE gigante blanco	', '', '0', 0, 0, 17, 700000, '2017-07-12'),
(260, 1624, '	Luz LED alargada	', '', '0', 0, 0, 16, 150000, '2017-07-12'),
(261, 1625, '	Luz LED rectangular extraplana	', '', '0', 0, 0, 16, 150000, '2017-07-12'),
(262, 1626, '	Luz LED redonda cromada (vieja)	', '', '0', 0, 0, 16, 100000, '2017-07-12'),
(263, 1627, '	Luz LED redonda negra	', '', '0', 0, 0, 16, 100000, '2017-07-12'),
(264, 1234, '	Marco para fotos 1,8m x 2,2m decape blanco	', '', '0', 0, 0, 12, 70000, '2017-07-12'),
(265, 1235, '	Matera decape blanco	', '', '0', 0, 0, 12, 120000, '2017-07-12'),
(266, 1236, '	Matera negra	', '', '0', 0, 0, 12, 120000, '2017-07-12'),
(267, 1126, '	Medialuna para carpa 6m x 12m	', '', '0', 0, 0, 11, 0, '2017-07-12'),
(268, 1127, '	Medialuna para carpa 6m x 6m	', '', '0', 0, 0, 11, 0, '2017-07-12'),
(269, 1800, '	Mesa coctelera de herradura blanca	', '', '0', 0, 0, 18, 120000, '2017-07-12'),
(270, 1801, '	Mesa coctelera de jardin rectangular country	', '', '0', 0, 0, 18, 180000, '2017-07-12'),
(271, 1802, '	Mesa coctelera redonda country	', '', '0', 0, 0, 18, 40000, '2017-07-12'),
(272, 1803, '	Mesa coctelera redonda de vidrio con base en acero inoxidable	', '', '0', 0, 0, 18, 160000, '2017-07-12'),
(273, 1804, '	Mesa coctelera redonda decape blanco	', '', '0', 0, 0, 18, 40000, '2017-07-12'),
(274, 1805, '	Mesa cuadrada doble vidrio 1,40-1,50	', '', '0', 0, 0, 18, 600000, '2017-07-12'),
(275, 1806, '	TAPA PARA MESA DE BARRIL WENGUE	', '', '', 12000, 10000, 18, 80000, '2017-07-12'),
(276, 1807, '	Mesa de espejos	', '', '0', 0, 0, 18, 1600000, '2017-07-12'),
(277, 1808, '	Mesa de gusano doble vidrio	', '', '0', 0, 0, 18, 180000, '2017-07-12'),
(278, 1809, '	Mesa de notario ovalada blanca	', '', '0', 0, 0, 18, 300000, '2017-07-12'),
(279, 1810, '	Mesa de notario rectangular blanca	', '', '0', 0, 0, 18, 400000, '2017-07-12'),
(280, 1811, '	Mesa de notario rectangular country	', '', '0', 0, 0, 18, 400000, '2017-07-12'),
(281, 1812, '	Mesa ovalada wengue con patas torneadas blancas	', '', '0', 0, 0, 18, 1200000, '2017-07-12'),
(282, 1813, '	Mesa plegable cuadrada 1,50m	', '', '0', 0, 0, 18, 250000, '2017-07-12'),
(283, 1814, '	Mesa plegable rectangular	', '', '0', 0, 0, 18, 300000, '2017-07-12'),
(284, 1815, '	Mesa plegable redonda 120cm	', '', '0', 0, 0, 18, 200000, '2017-07-12'),
(285, 1816, '	Mesa plegable redonda 150cm	', '', '0', 0, 0, 18, 250000, '2017-07-12'),
(286, 1817, '	Mesa rectangular blanca en decape	', '', '0', 0, 0, 18, 1200000, '2017-07-12'),
(287, 1818, '	Mesa rectangular con labrado o moldura blanca	', '', '0', 0, 0, 18, 1200000, '2017-07-12'),
(288, 1819, '	Mesa rectangular guayacan aguamarina	', '', '0', 0, 0, 18, 800000, '2017-07-12'),
(289, 1820, '	Mesa rectangular guayacan clara	', '', '0', 0, 0, 18, 800000, '2017-07-12'),
(290, 1821, '	Mesa rectangular guayacan oscura	', '', '0', 0, 0, 18, 1000000, '2017-07-12'),
(291, 1822, '	Mesa rectangular para niños en decape blanco	', '', '0', 0, 0, 18, 600000, '2017-07-12'),
(292, 1823, '	Mesa redonda blanca en decape blanco 120cm	', '', '0', 0, 0, 18, 800000, '2017-07-12'),
(293, 1824, '	Mesa redonda blanca en decape blanco 150cm	', '', '0', 0, 0, 18, 800000, '2017-07-12'),
(294, 1825, '	Mesa redonda con parasol country	', '', '0', 0, 0, 18, 700000, '2017-07-12'),
(295, 1628, '	Metro de cable Centelsa 2x12 blanco	', '', '0', 0, 0, 16, 0, '2017-07-12'),
(296, 1629, '	Metro de cable duplex 2x12 blanco	', '', '0', 0, 0, 16, 0, '2017-07-12'),
(297, 1630, '	Metro de cable duplex 2x12 blanco	', '', '0', 0, 0, 16, 854, '2017-07-12'),
(298, 2002, '	Metro de pista de baile blanca	', '', '0', 0, 0, 20, 400000, '2017-07-12'),
(299, 2003, '	Metro de pista de baile negra	', '', '0', 0, 0, 20, 400000, '2017-07-12'),
(300, 2004, '	Metro de pista decape blanco	', '', '0', 0, 0, 20, 1264000, '2017-07-12'),
(301, 2005, '	Metros de estructura para tarima	', '', '0', 0, 0, 20, 0, '2017-07-12'),
(302, 1400, '	Modulo de bar circular guayacan	', '', '0', 0, 0, 14, 500000, '2017-07-12'),
(303, 1401, '	Modulo de bar cuadrado tipo isla en decape blanco	', '', '0', 0, 0, 14, 1500000, '2017-07-12'),
(304, 1402, '	Modulo de bar de tablas cuadrado 60cm decape blanco	', '', '0', 0, 0, 14, 100000, '2017-07-12'),
(305, 1403, '	Modulo de bar de tablas cuadrado 60cm wengue	', '', '0', 0, 0, 14, 100000, '2017-07-12'),
(306, 1404, '	Modulo de bar de tablas rectangular 200cm decape blanco	', '', '0', 0, 0, 14, 350000, '2017-07-12'),
(307, 1405, '	Modulo de bar de tablas rectangular 200cm wengue	', '', '0', 0, 0, 14, 350000, '2017-07-12'),
(308, 1406, '	Modulo de bar rectangular con figuras en madera	', '', '0', 0, 0, 14, 600000, '2017-07-12'),
(309, 1407, '	Modulo de bar rectangular luminoso	', '', '0', 0, 0, 14, 300000, '2017-07-12'),
(310, 1408, '	Modulo de bar rectangular negro con acrilico luminoso 200cm	', '', '0', 0, 0, 14, 250000, '2017-07-12'),
(311, 1409, '	Modulo de bar rectangular negro con acrilico luminoso 240cm	', '', '0', 0, 0, 14, 350000, '2017-07-12'),
(312, 1410, '	Modulo de bar semicircular acrilico blanco luminoso	', '', '0', 0, 0, 14, 450000, '2017-07-12'),
(313, 1411, '	Modulo de bar tapizado en terciopelo champagne	', '', '0', 0, 0, 14, 400000, '2017-07-12'),
(314, 10112, '	Molde de cocina plastico rosado	', '', '0', 0, 0, 10, 2000, '2017-07-12'),
(315, 1900, '	Numero 0 55cm	', '', '0', 0, 0, 19, 150000, '2017-07-12'),
(316, 1901, '	Numero 1 55cm	', '', '0', 0, 0, 19, 150000, '2017-07-12'),
(317, 1902, '	Numero 1 90cm	', '', '0', 0, 0, 19, 150000, '2017-07-12'),
(318, 1903, '	Numero 2 55cm	', '', '0', 0, 0, 19, 150000, '2017-07-12'),
(319, 1904, '	Numero 5 90cm	', '', '0', 0, 0, 19, 150000, '2017-07-12'),
(320, 1905, '	Numero 6 55cm	', '', '0', 0, 0, 19, 150000, '2017-07-12'),
(321, 10113, '	Olla bruja	', '', '0', 0, 0, 10, 120000, '2017-07-12'),
(322, 1237, '	Palos de bambu para jupas	', '', '0', 0, 0, 12, 100000, '2017-07-12'),
(323, 10114, '	Paquete de palillos de punta de concha x 100 unidades	', '', '0', 0, 0, 10, 40000, '2017-07-12'),
(324, 10115, '	Paquete de servilletas Familia	', '', '0', 0, 0, 10, 1000, '2017-07-12'),
(325, 10116, '	Paraguas blanco	', '', '0', 0, 0, 10, 20000, '2017-07-12'),
(326, 1238, '	Pared blanca en decapé 2x2m	', '', '0', 0, 0, 12, 250000, '2017-07-12'),
(327, 1631, '	Pila bombillo LED	', '', '0', 0, 0, 16, 1104, '2017-07-12'),
(328, 10117, '	Pinza de lujo doble	', '', '0', 0, 0, 10, 12000, '2017-07-12'),
(329, 10118, '	Pinza de lujo sencilla	', '', '0', 0, 0, 10, 80000, '2017-07-12'),
(330, 10119, '	Pitillo azul aguamarina	', '', '0', 0, 0, 10, 500, '2017-07-12'),
(331, 10120, '	Pitillo rosa	', '', '0', 0, 0, 10, 500, '2017-07-12'),
(332, 10121, '	Pitillo verde	', '', '0', 0, 0, 10, 500, '2017-07-12'),
(333, 10122, '	Plato base en madera country	', '', '0', 0, 0, 10, 12000, '2017-07-12'),
(334, 10123, '	Plato base en ratan	', '', '0', 0, 0, 10, 22500, '2017-07-12'),
(335, 10124, '	Plato base en tiza	', '', '0', 0, 0, 10, 12000, '2017-07-12'),
(336, 10125, '	Plato base en vidrio borde dorado	', '', '0', 0, 0, 10, 67200, '2017-07-12'),
(337, 10126, '	Plato base en vidrio perlado borde ondulado	', '', '0', 0, 0, 10, 56250, '2017-07-12'),
(338, 10127, '	Plato base metálico de encaje	', '', '0', 0, 0, 10, 40000, '2017-07-12'),
(339, 1239, '	Portalechera	', '', '0', 0, 0, 12, 15000, '2017-07-12'),
(340, 1240, '	Puerta arco de madera cedro con vidrios	', '', '0', 0, 0, 12, 300000, '2017-07-12'),
(341, 1241, '	Puerta decape blanco	', '', '0', 0, 0, 12, 200000, '2017-07-12'),
(342, 1242, '	Reclinatorio para iglesia blancos con cojin beige	', '', '0', 0, 0, 12, 150000, '2017-07-12'),
(343, 1632, '	Reflector LED 50W	', '', '0', 0, 0, 16, 60000, '2017-07-12'),
(344, 2101, '	Sala de estibas para 8 personas	', '', '0', 0, 0, 21, 1600000, '2017-07-12'),
(345, 2102, '	Sala en hierro forjado tapiceria azul cielo	', '', '0', 0, 0, 21, 1200000, '2017-07-12'),
(346, 2103, '	Sala lounge en cuero blanco	', '', '0', 0, 0, 21, 1200000, '2017-07-12'),
(347, 2104, '	Sala ratan	', '', '0', 0, 0, 21, 2000000, '2017-07-12'),
(348, 2105, '	Sala victoriana blanca tapizado color champagne	', '', '0', 0, 0, 21, 1500000, '2017-07-12'),
(349, 2106, '	Sala victoriana blanca tapizado color negro	', '', '0', 0, 0, 21, 1500000, '2017-07-12'),
(350, 10128, '	Salsera porcelana ovalada dos manijas (tipo paila)	', '', '0', 0, 0, 10, 6000, '2017-07-12'),
(351, 10129, '	Salsera porcelana redonda una manija (tipo sarten)	', '', '0', 0, 0, 10, 6000, '2017-07-12'),
(352, 1318, '	Silla blanca de bar en pasta y base en acero inoxidable	', '', '0', 0, 0, 13, 90000, '2017-07-12'),
(353, 1319, '	Silla Chateau dorada	', '', '0', 0, 0, 13, 160000, '2017-07-12'),
(354, 1320, '	Silla de medallon/espaldar redondo/Luis XV en decape blanco	', '', '0', 0, 0, 13, 160000, '2017-07-12'),
(355, 1321, '	Silla de palitos azul aguamarina	', '', '0', 0, 0, 13, 100000, '2017-07-12'),
(356, 1322, '	Silla de palitos decape blanco	', '', '0', 0, 0, 13, 150000, '2017-07-12'),
(357, 1323, '	Silla de palitos/guayacan country	', '', '0', 0, 0, 13, 150000, '2017-07-12'),
(358, 1324, '	Silla en madera cross back color azul	', '', '0', 0, 0, 13, 160000, '2017-07-12'),
(359, 1325, '	Silla en madera cross back color mostaza	', '', '0', 0, 0, 13, 160000, '2017-07-12'),
(360, 1326, '	Silla en madera natural cross back	', '', '0', 0, 0, 13, 160000, '2017-07-12'),
(361, 1327, '	Silla importada de medallon con mimbre	', '', '0', 0, 0, 13, 180000, '2017-07-12'),
(362, 1328, '	Silla negra de bar en pasta y base en acero inoxidable	', '', '0', 0, 0, 13, 90000, '2017-07-12'),
(363, 1329, '	Silla para bebe en madera natural	', '', '0', 0, 0, 13, 90000, '2017-07-12'),
(364, 1330, '	Silla plegable blanca	', '', '0', 0, 0, 13, 130000, '2017-07-12'),
(365, 1331, '	Silla plegable guayacan o country	', '', '0', 0, 0, 13, 130000, '2017-07-12'),
(366, 1332, '	Silla Tiffany/Chivary/Inglesa blanca	', '', '0', 0, 0, 13, 100000, '2017-07-12'),
(367, 1333, '	Silla Tiffany/Chivary/Inglesa dorada	', '', '0', 0, 0, 13, 100000, '2017-07-12'),
(368, 1334, '	Silla Tiffany/Chivary/Inglesa ocre	', '', '0', 0, 0, 13, 100000, '2017-07-12'),
(369, 1335, '	Silla Tiffany/Chivary/Inglesa plateada	', '', '0', 0, 0, 13, 100000, '2017-07-12'),
(370, 1336, '	Silla Versalles	', '', '0', 0, 0, 13, 180000, '2017-07-12'),
(371, 1243, '	Tablero de tiza grandes negro con bases	', '', '0', 0, 0, 12, 180000, '2017-07-12'),
(372, 1244, '	Tablero de tiza verde sin bases	', '', '0', 0, 0, 12, 80000, '2017-07-12'),
(373, 1826, '	Tapa de mesa para barril guayacan	', '', '0', 0, 0, 18, 80000, '2017-07-12'),
(374, 1633, '	Tapa dimer	', '', '0', 0, 0, 16, 0, '2017-07-12'),
(375, 10130, '	Tapa para canasta rectangular de mimbre con una manija	', '', '0', 0, 0, 10, 0, '2017-07-12'),
(376, 2006, '	Tapete color hueso 20m de largo y 1,7m de ancho	', '', '0', 0, 0, 20, 2500000, '2017-07-12'),
(377, 10131, '	Tenedor de lujo	', '', '0', 0, 0, 10, 8000, '2017-07-12'),
(378, 10132, '	Tenedor mini platinum	', '', '0', 0, 0, 10, 180, '2017-07-12'),
(379, 1128, '	Toldillo en madera 4m x 4m	', '', '0', 0, 0, 11, 600000, '2017-07-12'),
(380, 10133, '	Tronco plateado base para espejo biselado 15cm	', '', '0', 0, 0, 10, 2000, '2017-07-12'),
(381, 10134, '	Tronco plateado base para espejo biselado 20cm	', '', '0', 0, 0, 10, 30000, '2017-07-12'),
(382, 10135, '	Vaso acrilico de 1.5oz	', '', '0', 0, 0, 10, 300, '2017-07-12'),
(383, 10136, '	Vaso acrilico de 3.5oz	', '', '0', 0, 0, 10, 300, '2017-07-12'),
(384, 10137, '	Vaso de vela flor en vidrio	', '', '0', 0, 0, 10, 12000, '2017-07-12'),
(385, 10138, '	Vaso de vela liso Mercury en vidrio	', '', '0', 0, 0, 10, 12000, '2017-07-12'),
(386, 10139, '	Vela de LED pequeña	', '', '0', 0, 0, 10, 7650, '2017-07-12'),
(387, 10140, '	Vela de LED grande	', '', '0', 0, 0, 10, 30000, '2017-07-12'),
(388, 10141, '	Vela media esfera	', '', '0', 0, 0, 10, 1500, '2017-07-12'),
(389, 10142, '	Vela para faroles 12cm	', '', '0', 0, 0, 10, 3500, '2017-07-12'),
(390, 10143, '	Vela para faroles 17cm	', '', '0', 0, 0, 10, 4500, '2017-07-12'),
(391, 10144, '	Vela para vaso Mercury	', '', '0', 0, 0, 10, 700, '2017-07-12'),
(392, 1129, '	Velo para carpa 4m x 6m	', '', '0', 0, 0, 11, 0, '2017-07-12'),
(393, 1130, '	Velo para carpa 6m x 12m	', '', '0', 0, 0, 11, 0, '2017-07-12'),
(394, 1131, '	Velo para carpa 6m x 6m	', '', '0', 0, 0, 11, 0, '2017-07-12'),
(395, 1245, '	Velos para huppa 3m x 3m	', '', '0', 0, 0, 12, 0, '2017-07-12'),
(396, 1246, '	Velos para huppa 3m x 50cm	', '', '0', 0, 0, 12, 0, '2017-07-12'),
(397, 1247, '	Ventanal blanco de seis vidrios 	', '', '0', 0, 0, 12, 250000, '2017-07-12'),
(398, 1827, '	Mesa redonda con parasol country	', '', '0', 0, 0, 18, 1000000, '2017-07-12'),
(399, 1337, '	Silla plegable guayacan o country	', '', '0', 0, 0, 13, 90000, '2017-07-12'),
(400, 10145, '	Vela para vaso Mercury	', '', '0', 0, 0, 10, 700, '2017-07-12'),
(401, 1634, '	Pila bombillo LED	', '', '0', 0, 0, 16, 1104, '2017-07-12'),
(402, 1635, '	Extension para 25 bombillos en caida individual de 2 y 3 metros	', '', '0', 0, 0, 16, 340000, '2017-07-12'),
(403, 1248, '	Estructura para mesas en hierro patinado	', '', '0', 0, 0, 12, 400000, '2017-07-12'),
(404, 10146, '	Plato base en tiza	', '', '0', 0, 0, 10, 4000, '2017-07-12'),
(405, 10147, '	Plato base metálico de encaje	', '', '0', 0, 0, 10, 40000, '2017-07-12'),
(406, 1338, '	Silla Versalles	', '', '0', 0, 0, 13, 180000, '2017-07-12'),
(407, 10148, '	Guaya por metro	', '', '0', 0, 0, 10, 0, '2017-07-12'),
(408, 10149, '	Guaya por metro	', '', '0', 0, 0, 10, 0, '2017-07-12'),
(409, 10150, '	Plato base en vidrio con bolitas plateadas	', '', '0', 0, 0, 10, 65250, '2017-07-12'),
(410, 10151, '	Plato base en vidrio con bolitas doradas	', '', '0', 0, 0, 10, 65250, '2017-07-12'),
(411, 1828, '	Mesa rectangular guayacan aguamarina	', '', '0', 0, 0, 18, 0, '2017-07-12'),
(412, 1829, '	Mesa rectangular guayacan clara	', '', '0', 0, 0, 18, 0, '2017-07-12'),
(413, 10152, '	Guaya por metro	', '', '0', 0, 0, 10, 0, '2017-07-12'),
(414, 2302, '	Cadena por metro	', '', '0', 0, 0, 23, 0, '2017-07-12'),
(415, 10153, '	Guaya por metro	', '', '0', 0, 0, 10, 0, '2017-07-12'),
(416, 10154, '	Guaya por metro	', '', '0', 0, 0, 10, 0, '2017-07-12'),
(417, 10155, '	Guaya por metro	', '', '0', 0, 0, 10, 0, '2017-07-12'),
(418, 10156, '	Candelabro plateado de vidrio 25cm	', '', '0', 0, 0, 10, 55000, '2017-07-12'),
(419, 10157, '	Candelabro solitario plateado de vidrio 24cm	', '', '0', 0, 0, 10, 45000, '2017-07-12'),
(420, 10158, '	Candelabro solitario plateado de vidrio 32cm	', '', '0', 0, 0, 10, 58000, '2017-07-12'),
(421, 10159, '	Apotecario/dispensador 3,63L doble con tapa metalica	', '', '0', 0, 0, 10, 80000, '2017-07-12'),
(422, 1636, '	Bombillo ping pong 15W	', '', '0', 0, 0, 16, 1000, '2017-07-12'),
(423, 2303, '	Extintor	', '', '0', 0, 0, 23, 45000, '2017-07-12'),
(424, 2304, '	Camilla	', '', '0', 0, 0, 23, 107000, '2017-07-12'),
(425, 2305, '	Botiquin	', '', '0', 0, 0, 23, 100000, '2017-07-12'),
(426, 2306, '	Señal acrilico	', '', '0', 0, 0, 23, 3000, '2017-07-12'),
(427, 2307, '	Extractor axial de 20	', '', '0', 0, 0, 23, 936000, '2017-07-12'),
(428, 2308, '	Extractor axial de 14	', '', '0', 0, 0, 23, 468000, '2017-07-12'),
(429, 1637, '	Reflector LED 50W	', '', '0', 0, 0, 16, 60000, '2017-07-12'),
(430, 1249, '	Backing de fotos tiza	', '', '0', 0, 0, 12, 600000, '2017-07-12'),
(431, 10160, '	Candelabro Mercury glass de vidrio 11cm	', '', '0', 0, 0, 10, 50000, '2017-07-12'),
(432, 1638, '	Bombillo ping pong 15W	', '', '0', 0, 0, 16, 1500, '2017-07-12'),
(433, 1639, '	Bombillo ping pong 15W	', '', '0', 0, 0, 16, 2000, '2017-07-12'),
(434, 1640, '	Bombillo ping pong 15W	', '', '0', 0, 0, 16, 1000, '2017-07-12'),
(435, 10161, '	Vela para vaso Mercury	', '', '0', 0, 0, 10, 700, '2017-07-12'),
(436, 10162, '	Vela para vaso Mercury	', '', '0', 0, 0, 10, 700, '2017-07-12'),
(437, 10163, '	Vela para vaso Mercury	', '', '0', 0, 0, 10, 700, '2017-07-12'),
(438, 10164, '	Vela para vaso Mercury	', '', '0', 0, 0, 10, 700, '2017-07-12'),
(439, 10165, '	Vela para vaso Mercury	', '', '0', 0, 0, 10, 700, '2017-07-12'),
(440, 10166, '	Vela media esfera	', '', '0', 0, 0, 10, 1000, '2017-07-12'),
(441, 10167, '	Vela para faroles 17cm	', '', '0', 0, 0, 10, 4500, '2017-07-12'),
(442, 10168, '	Vela para faroles 17cm	', '', '0', 0, 0, 10, 4500, '2017-07-12'),
(443, 10169, '	Pitillo azul aguamarina	', '', '0', 0, 0, 10, 500, '2017-07-12'),
(444, 10170, '	Pitillo rosa	', '', '0', 0, 0, 10, 500, '2017-07-12'),
(445, 1641, '	Bombillo largo de filamento	', '', '0', 0, 0, 16, 15000, '2017-07-12'),
(446, 1642, '	Bombillo redondo de filamento	', '', '0', 0, 0, 16, 30000, '2017-07-12'),
(447, 1643, '	Bombillo largo de filamento	', '', '0', 0, 0, 16, 15000, '2017-07-12'),
(448, 1644, '	Reflector LED 50W	', '', '0', 0, 0, 16, 60000, '2017-07-12'),
(449, 10171, '	Candelabro plateado de vidrio 25cm	', '', '0', 0, 0, 10, 55000, '2017-07-12'),
(450, 1645, '	Metro de cable duplex 2x12 blanco	', '', '0', 0, 0, 16, 0, '2017-07-12'),
(451, 10172, '	Cubo de espejos 13cm	', '', '0', 0, 0, 10, 70000, '2017-07-12'),
(452, 1339, '	Silla blanca de bar en pasta y base en acero inoxidable	', '', '0', 0, 0, 13, 80000, '2017-07-12'),
(453, 1340, '	Silla negra de bar en pasta y base en acero inoxidable	', '', '0', 0, 0, 13, 80000, '2017-07-12'),
(454, 10173, '	Bandeja antideslizante redonda	', '', '0', 0, 0, 10, 35000, '2017-07-12'),
(455, 1646, '	Reflector LED 50W	', '', '0', 0, 0, 16, 60000, '2017-07-12'),
(456, 10174, '	Vaso de vela liso Mercury en vidrio	', '', '0', 0, 0, 10, 12000, '2017-07-12'),
(457, 10175, '	Vaso de vela flor en vidrio	', '', '0', 0, 0, 10, 12000, '2017-07-12'),
(458, 10176, '	Cuchara de melamina blanca	', '', '0', 0, 0, 10, 6500, '2017-07-12'),
(459, 10177, '	Concha marina mediana	', '', '0', 0, 0, 10, 6500, '2017-07-12'),
(460, 1647, '	Extension minigranito de arroz 3m	', '', '0', 0, 0, 16, 10000, '2017-07-12'),
(461, 1341, '	Silla cross para niños	', '', '0', 0, 0, 13, 130000, '2017-07-12'),
(462, 1342, '	Silla de medallon para niños	', '', '0', 0, 0, 13, 0, '2017-07-12'),
(463, 10178, '	Concha marina mediana	', '', '0', 0, 0, 10, 5000, '2017-07-12'),
(464, 1648, '	Bombillo ping pong 15W	', '', '0', 0, 0, 16, 1000, '2017-07-12'),
(465, 1649, '	Metro de cable duplex 2x12 blanco	', '', '0', 0, 0, 16, 0, '2017-07-12'),
(466, 10179, '	Vela para vaso Mercury	', '', '0', 0, 0, 10, 700, '2017-07-12'),
(467, 1650, '	Bombillo ping pong 15W	', '', '0', 0, 0, 16, 0, '2017-07-12'),
(468, 10180, '	Vela para vaso Mercury	', '', '0', 0, 0, 10, 700, '2017-07-12'),
(469, 10181, '	Vela para vaso Mercury	', '', '0', 0, 0, 10, 700, '2017-07-12'),
(470, 10182, '	Vela para vaso Mercury	', '', '0', 0, 0, 10, 700, '2017-07-12'),
(471, 10183, '	Vaso de vela flor en vidrio	', '', '0', 0, 0, 10, 12000, '2017-07-12'),
(472, 10184, '	Base de vidrio grande, manija de cabulla con leyenda	', '', '0', 0, 0, 10, 35000, '2017-07-12'),
(473, 10185, '	Copa Mercury para centro de mesa tipo flor	', '', '0', 0, 0, 10, 35000, '2017-07-12'),
(474, 10186, '	Copa Mercury para centro de mesa tipo flor	', '', '0', 0, 0, 10, 35000, '2017-07-12'),
(475, 10187, '	Vaso de vela flor en vidrio	', '', '0', 0, 0, 10, 12000, '2017-07-12'),
(476, 1651, '	Metro de cable Centelsa 2x12 blanco	', '', '0', 0, 0, 16, 2000, '2017-07-12'),
(477, 1652, '	Metro de cable duplex 2x12 blanco	', '', '0', 0, 0, 16, 790, '2017-07-12'),
(478, 1653, '	Bombillo ping pong 15W	', '', '0', 0, 0, 16, 1000, '2017-07-12'),
(479, 1654, '	Extension 10m negra de bombillo ping pong	', '', '0', 0, 0, 16, 60000, '2017-07-12'),
(480, 10188, '	Bandeja antideslizante rectangular	', '', '0', 0, 0, 10, 33698, '2017-07-12'),
(481, 10189, '	Plato base en vidrio borde dorado	', '', '0', 0, 0, 10, 60000, '2017-07-12'),
(482, 1343, '	Silla en madera natural cross back	', '', '0', 0, 0, 13, 200000, '2017-07-12'),
(483, 10190, '	Plato base en ratan	', '', '0', 0, 0, 10, 30000, '2017-07-12'),
(484, 10191, '	Deposito/tarro/envase para antorcha	', '', '0', 0, 0, 10, 5000, '2017-07-12'),
(485, 10192, '	Copa Mercury para centro de mesa tipo flor	', '', '0', 0, 0, 10, 35000, '2017-07-12'),
(486, 1830, '	Mesa rectangular guayacan para niños	', '', '0', 0, 0, 18, 500000, '2017-07-12'),
(487, 10193, '	Copa de aguardiente	', '', '0', 0, 0, 10, 2500, '2017-07-12'),
(488, 10194, '	Bandeja antideslizante redonda	', '', '0', 0, 0, 10, 35000, '2017-07-12'),
(489, 10195, '	Balde ovalado liso de laton	', '', '0', 0, 0, 10, 157000, '2017-07-12'),
(490, 10196, '	Balde ovalado martillado de laton	', '', '0', 0, 0, 10, 157000, '2017-07-12'),
(491, 10197, '	Copon de ostia	', '', '0', 0, 0, 10, 45000, '2017-07-12'),
(492, 1655, '	Bombillo largo de filamento	', '', '0', 0, 0, 16, 30000, '2017-07-12'),
(493, 1656, '	Bombillo redondo de filamento	', '', '0', 0, 0, 16, 15000, '2017-07-12'),
(494, 10198, '	Apotecario/dispensador 11,0L	', '', '0', 0, 0, 10, 377000, '2017-07-12'),
(495, 10199, '	Espejo rectangular	', '', '0', 0, 0, 10, 60000, '2017-07-12'),
(496, 10200, '	Bandeja antideslizante rectangular	', '', '0', 0, 0, 10, 35000, '2017-07-12'),
(497, 10201, '	Cuchara de melamina blanca	', '', '0', 0, 0, 10, 3500, '2017-07-12'),
(498, 10202, '	Copa de aguardiente	', '', '0', 0, 0, 10, 2500, '2017-07-12'),
(499, 1344, '	Silla de mimbre	', '', '0', 0, 0, 13, 0, '2017-07-12'),
(500, 1831, '	Mesa coctelera de jardin rectangular decape	', '', '0', 0, 0, 18, 0, '2017-07-12'),
(501, 1832, '	Mesa coctelera de jardin rectangular country	', '', '0', 0, 0, 18, 0, '2017-07-12'),
(502, 1833, '	Mesa coctelera de jardin rectangular decape	', '', '0', 0, 0, 18, 0, '2017-07-12'),
(503, 1834, '	Mesa coctelera de jardin rectangular decape	', '', '0', 0, 0, 18, 0, '2017-07-12'),
(504, 10203, '	Canoas cuadradas de madera	', '', '0', 0, 0, 10, 0, '2017-07-12'),
(505, 1345, '	Banca country sin espaldar sin tapizar	', '', '0', 0, 0, 13, 0, '2017-07-12'),
(506, 10204, '	Dispensador 5L	', '', '0', 0, 0, 10, 0, '2017-07-12'),
(507, 10205, '	Balde ovalado liso de laton	', '', '0', 0, 0, 10, 0, '2017-07-12'),
(508, 1508, '	Calentador a gas cuadrado con tubo de vidrio	', '', '0', 0, 0, 15, 0, '2017-07-12'),
(509, 10206, '	Vaso mercury grande	', '', '0', 0, 0, 10, 0, '2017-07-12'),
(510, 10207, '	Cuchara de servicio de lujo	', '', '0', 0, 0, 10, 12000, '2017-07-12'),
(511, 1346, '	Silla Versalles	', '', '0', 0, 0, 13, 180000, '2017-07-12'),
(512, 1132, '	Maceta para carpa	', '', '0', 0, 0, 11, 59900, '2017-07-12'),
(513, 1657, '	Metro de cable Centelsa 2x12 blanco	', '', '0', 0, 0, 16, 2000, '2017-07-12'),
(514, 1658, '	Bombillo ping pong 15W	', '', '0', 0, 0, 16, 1000, '2017-07-12'),
(515, 1659, '	Bombillo ping pong 15W	', '', '0', 0, 0, 16, 1000, '2017-07-12'),
(516, 1347, '	Silla en madera natural cross back	', '', '0', 0, 0, 13, 160000, '2017-07-12'),
(517, 10208, '	Candelabro plateado de vidrio 25cm	', '', '0', 0, 0, 10, 55000, '2017-07-12'),
(518, 1660, '	Metro de cable Centelsa 2x12 blanco	', '', '0', 0, 0, 16, 215000, '2017-07-12'),
(519, 1661, '	Extension 8m granito de arroz color amarillo	', '', '0', 0, 0, 16, 9000, '2017-07-12'),
(520, 1348, '	Cojin blanco para silla Tiffany/Chivary/Inglesa	', '', '0', 0, 0, 13, 25000, '2017-07-12'),
(521, 1349, '	Silla Tiffany/Chivary/Inglesa plateada	', '', '0', 0, 0, 13, 120000, '2017-07-12'),
(522, 1350, '	Forro para silla Tiffany/medallon/palitos	', '', '0', 0, 0, 13, 25000, '2017-07-12'),
(523, 1662, '	Extension 10m negra de bombillo ping pong	', '', '0', 0, 0, 16, 60000, '2017-07-12'),
(524, 10209, '	Vela de LED pequeña	', '', '0', 0, 0, 10, 0, '2017-07-12'),
(525, 10210, '	Vela de LED grande	', '', '0', 0, 0, 10, 0, '2017-07-12'),
(526, 10211, '	Espejo rectangular	', '', '0', 0, 0, 10, 120000, '2017-07-12'),
(527, 10212, '	Paraguas blanco	', '', '0', 0, 0, 10, 0, '2017-07-12'),
(528, 10213, '	Globo chino blanco 39cm	', '', '0', 0, 0, 10, 0, '2017-07-12'),
(529, 10214, '	Copa de aguardiente	', '', '0', 0, 0, 10, 0, '2017-07-12'),
(530, 10215, '	Vaso de vela liso Mercury en vidrio	', '', '0', 0, 0, 10, 0, '2017-07-12'),
(531, 10216, '	Globo chino blanco 39cm	', '', '0', 0, 0, 10, 0, '2017-07-12'),
(532, 2007, '	Tapete negro 110x60cm	', '', '0', 0, 0, 20, 0, '2017-07-12'),
(533, 2008, '	Tapete beige 110x60cm	', '', '0', 0, 0, 20, 0, '2017-07-12'),
(534, 2009, '	Tapete cafe 110x60cm	', '', '0', 0, 0, 20, 0, '2017-07-12'),
(535, 10217, '	Bandeja antideslizante rectangular	', '', '0', 0, 0, 10, 35000, '2017-07-12'),
(536, 1250, '	Cenicero de pie cromado	', '', '0', 0, 0, 12, 0, '2017-07-12'),
(537, 10218, '	Plato base en vidrio perlado borde ondulado	', '', '0', 0, 0, 10, 0, '2017-07-12'),
(538, 1663, '	Metro de cable duplex 2x12 blanco	', '', '0', 0, 0, 16, 0, '2017-07-12'),
(539, 1664, '	Bombillo ping pong 15W	', '', '0', 0, 0, 16, 1000, '2017-07-12'),
(540, 10219, '	Bandeja antideslizante rectangular	', '', '0', 0, 0, 10, 35000, '2017-07-12'),
(541, 1665, '	Lampara de cristal grande 12bombillos dos hileras	', '', '0', 0, 0, 16, 800000, '2017-07-12'),
(542, 1666, '	Metro de cable duplex 2x12 blanco	', '', '0', 0, 0, 16, 1600, '2017-07-12'),
(543, 1351, '	Silla en madera natural cross back	', '', '0', 0, 0, 13, 200000, '2017-07-12'),
(544, 10220, '	Bandeja antideslizante rectangular	', '', '0', 0, 0, 10, 35000, '2017-07-12'),
(545, 10221, '	Cuchara de servicio de lujo	', '', '0', 0, 0, 10, 20000, '2017-07-12'),
(546, 10222, '	Cuchara de melamina blanca	', '', '0', 0, 0, 10, 6000, '2017-07-12'),
(547, 10223, '	Vaso de vela flor en vidrio	', '', '0', 0, 0, 10, 12000, '2017-07-12'),
(548, 10224, '	Vaso de vela liso Mercury en vidrio	', '', '0', 0, 0, 10, 12000, '2017-07-12'),
(549, 10225, '	Candelabro Mercury glass de vidrio 26cm	', '', '0', 0, 0, 10, 70000, '2017-07-12'),
(550, 10226, '	Candelabro Mercury glass de vidrio 18cm	', '', '0', 0, 0, 10, 58000, '2017-07-12'),
(551, 10227, '	Candelabro plateado de vidrio 17cm	', '', '0', 0, 0, 10, 35000, '2017-07-12'),
(552, 1835, '	Mesa plegable rectangular	', '', '0', 0, 0, 18, 250000, '2017-07-12'),
(553, 1352, '	Silla de mimbre	', '', '0', 0, 0, 13, 180000, '2017-07-12'),
(554, 10228, '	Base ovalada plateada para florero	', '', '0', 0, 0, 10, 35000, '2017-07-12'),
(555, 10229, '	Vaso de vela liso Mercury en vidrio	', '', '0', 0, 0, 10, 12000, '2017-07-12'),
(556, 10230, '	Candelabro solitario plateado de vidrio 24cm	', '', '0', 0, 0, 10, 45000, '2017-07-12'),
(557, 10231, '	Vaso mercury grande	', '', '0', 0, 0, 10, 0, '2017-07-12'),
(558, 10232, '	Copon de ostia	', '', '0', 0, 0, 10, 35000, '2017-07-12'),
(559, 1353, '	Silla Versalles	', '', '0', 0, 0, 13, 150000, '2017-07-12'),
(560, 1354, '	Silla Versalles	', '', '0', 0, 0, 13, 150000, '2017-07-12'),
(561, 10233, '	Bandeja antideslizante rectangular	', '', '0', 0, 0, 10, 35000, '2017-07-12'),
(562, 10234, '	Bandeja antideslizante redonda	', '', '0', 0, 0, 10, 35000, '2017-07-12'),
(563, 10235, '	Plato base en vidrio borde dorado	', '', '0', 0, 0, 10, 60000, '2017-07-12'),
(564, 10236, '	Globo chino blanco 39cm	', '', '0', 0, 0, 10, 9000, '2017-07-12'),
(565, 10237, '	Copa Mercury para centro de mesa tipo flor	', '', '0', 0, 0, 10, 35000, '2017-07-12'),
(566, 10238, '	Vela para vaso Mercury	', '', '0', 0, 0, 10, 700, '2017-07-12'),
(567, 10239, '	Vela para vaso Mercury	', '', '0', 0, 0, 10, 700, '2017-07-12'),
(568, 10240, '	Vela para vaso Mercury	', '', '0', 0, 0, 10, 700, '2017-07-12'),
(569, 1667, '	Extension 10m negra de bombillo ping pong	', '', '0', 0, 0, 16, 0, '2017-07-12'),
(570, 1668, '	Extension 10m negra de bombillo ping pong	', '', '0', 0, 0, 16, 0, '2017-07-12'),
(571, 10241, '	Plato base en vidrio borde dorado	', '', '0', 0, 0, 10, 0, '2017-07-12'),
(572, 10242, '	Vela para vaso Mercury	', '', '0', 0, 0, 10, 700, '2017-07-12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_reservas`
--

CREATE TABLE `app_reservas` (
  `id` int(11) NOT NULL,
  `desde` datetime NOT NULL,
  `hasta` datetime NOT NULL,
  `cliente` int(11) NOT NULL,
  `recepcion` varchar(150) NOT NULL,
  `fecha_evento` datetime NOT NULL,
  `producto` varchar(255) NOT NULL,
  `cantidad` varchar(255) NOT NULL,
  `bodega` int(11) NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `app_reservas`
--

INSERT INTO `app_reservas` (`id`, `desde`, `hasta`, `cliente`, `recepcion`, `fecha_evento`, `producto`, `cantidad`, `bodega`, `estado`) VALUES
(1, '2017-08-01 05:00:00', '2017-08-05 14:59:00', 1, 'calle 14 n 211 12', '2017-08-03 20:00:00', '1806,1001', '2,3', 1, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_seguimiento`
--

CREATE TABLE `app_seguimiento` (
  `id` int(11) NOT NULL,
  `usuario` int(3) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `bodega` int(3) NOT NULL,
  `clase` int(3) NOT NULL,
  `caso` int(3) NOT NULL,
  `identificador` int(11) NOT NULL,
  `ubicacion` varchar(45) NOT NULL,
  `descripcion` text NOT NULL,
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `app_seguimiento`
--

INSERT INTO `app_seguimiento` (`id`, `usuario`, `nombre`, `bodega`, `clase`, `caso`, `identificador`, `ubicacion`, `descripcion`, `fecha`) VALUES
(1, 1, 'JESUS LEIRA', 1, 2, 1, 1, '10.922383799999999,	-74.79061329999999', 'nombre= BARRANQUILLA,ciudad = BARRANQUILLA, direccion = CLUB EL NOGAL 21, telefono = 3323232', '2017-07-12 08:45:08'),
(2, 1, 'JESUS LEIRA', 1, 6, 1, 2, '10.922383799999999,   -74.79061329999999', 'nombre = Ricardo, pass = 123456, id_perfil = adminbodega, telefono = 2147483647, email = j@gmail.com, bodega_id = BARRANQUILLA', '2017-07-12 08:47:14'),
(3, 1, 'administrador', 0, 1, 1, 1, '10.9223082,	-74.79053329999999', 'nombre = SANTA BODA, apellido = , clase = 1, nit = 91201212832, cedula = , telefono = 2312, celular = 2314232323, correo = sistemas@compuelectronicsltda.com, direccion = calle 14 n 211 12, tipo = 2, credito = 1', '2017-07-12 10:07:54'),
(4, 1, 'administrador', 0, 5, 1, 1, '10.9223082,	-74.79053329999999', 'idmovimiento = 1, item = 1, descripcion = entran por compra\r\n', '2017-07-12 10:08:59'),
(5, 1, 'administrador', 0, 4, 2, 275, '10.9223961,-74.7906253', 'nombre = 	TAPA PARA MESA DE BARRIL WENGUE	, codigo = 1806, categoria = 18, descripcion = , vl_mayorista = 10000, vl_minorista = 12000, imagen = ', '2017-07-12 10:27:27'),
(6, 1, 'administrador', 0, 7, 1, 1, '10.9223961,	-74.7906253', 'fecha_evento = 07/13/2017 10:26 AMdesde = 2017-07-12 00::0:00, hasta = 2017-07-21 23:59:00, producto = 1806, cantidad = 2, bodega = 1, estado= PENDIENTE, recepcion = calle 14 n 211 12, cliente =  SANTA BODA , id_reserva = 1 , concepto_descuentos = , descuentos = 0, concepto_impuestos = , impuestos = 0, fecha_abono = 2017-07-12 10:27:54, total_abonado = 100000, abono = 100000, total_facturado = 20000, total_restante = -76200, iva =1', '2017-07-12 10:27:54'),
(7, 1, 'administrador', 0, 7, 2, 1, '0,0', 'id_reserva = 1, concepto_descuentos = ,, descuentos = 0,0,concepto_impuestos = ,, impuestos = 0,0, fecha_abono = 2017-07-12 15:31:05, total_abonado = 23000, abono = -77000, total_facturado = 20000, total_restante = 800', '2017-07-12 15:31:05'),
(8, 1, 'administrador', 0, 7, 2, 1, '0,0', 'id_reserva = 1, concepto_descuentos = pronto pago,pronto pago2,,, descuentos = 1000,10000,0,0,concepto_impuestos = transporte,refrigerio,regreos,,, impuestos = 20000,30000,15000,0,0, fecha_abono = 2017-08-08 01:20:12, total_abonado = 23000, abono = 0, total_facturado = 20000, total_restante = 65060', '2017-08-08 01:20:12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_tipo_lista`
--

CREATE TABLE `app_tipo_lista` (
  `id_item` int(11) NOT NULL,
  `tipo_lista` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `app_tipo_lista`
--

INSERT INTO `app_tipo_lista` (`id_item`, `tipo_lista`) VALUES
(1, 'Item_movimiento'),
(2, 'PERFILUSUARIO'),
(3, 'TIPO_CLIENTE'),
(4, 'CATEGORIAS'),
(5, 'item_cliente'),
(6, 'ESTADOS_DE_PEDIDOS'),
(7, 'caso (ejemplo editar eliminar crear)'),
(8, 'clase (clientes,bodegas,pedidos )');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `referencia` varchar(45) NOT NULL,
  `descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `id_categoria`, `id_empresa`, `nombre`, `referencia`, `descripcion`) VALUES
(1, 0, 1, 'Salchichas', 'SALCH01', 'Todo tipo de embutido utilizado para cocinar, se miden por lo general en unidades o peso');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresas`
--

CREATE TABLE `empresas` (
  `id_empresa` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `empresas`
--

INSERT INTO `empresas` (`id_empresa`, `nombre`) VALUES
(1, 'Piolin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `listas`
--

CREATE TABLE `listas` (
  `id_lista` int(11) NOT NULL,
  `id_tipo` int(11) NOT NULL,
  `valor_item` varchar(45) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `valor_lista` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `perfiles` varchar(99) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bodega_id` int(11) NOT NULL,
  `telefono` int(11) NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `id_empresa`, `password`, `perfiles`, `bodega_id`, `telefono`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'jesus leira', 'jesusleira2011@gmail.com', 1, '$2y$10$9jVRDGlZxpwMtWd6Kt2ctuC2lMONPQW2rV3PSrYKqUX.0e1qHQBve', '1,2,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20', 0, 0, NULL, '2018-03-27 07:48:45', '2018-03-27 07:48:45');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `app_bodegas`
--
ALTER TABLE `app_bodegas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `app_clientes`
--
ALTER TABLE `app_clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `app_cotizaciones`
--
ALTER TABLE `app_cotizaciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `app_facturaciones`
--
ALTER TABLE `app_facturaciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `app_generales`
--
ALTER TABLE `app_generales`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `app_movimientos`
--
ALTER TABLE `app_movimientos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `app_productos`
--
ALTER TABLE `app_productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `app_reservas`
--
ALTER TABLE `app_reservas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `app_seguimiento`
--
ALTER TABLE `app_seguimiento`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `app_tipo_lista`
--
ALTER TABLE `app_tipo_lista`
  ADD UNIQUE KEY `unico` (`id_item`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `empresas`
--
ALTER TABLE `empresas`
  ADD PRIMARY KEY (`id_empresa`);

--
-- Indices de la tabla `listas`
--
ALTER TABLE `listas`
  ADD PRIMARY KEY (`id_lista`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `app_bodegas`
--
ALTER TABLE `app_bodegas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `app_clientes`
--
ALTER TABLE `app_clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `app_cotizaciones`
--
ALTER TABLE `app_cotizaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `app_facturaciones`
--
ALTER TABLE `app_facturaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `app_movimientos`
--
ALTER TABLE `app_movimientos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `app_productos`
--
ALTER TABLE `app_productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=573;

--
-- AUTO_INCREMENT de la tabla `app_reservas`
--
ALTER TABLE `app_reservas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `app_seguimiento`
--
ALTER TABLE `app_seguimiento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `app_tipo_lista`
--
ALTER TABLE `app_tipo_lista`
  MODIFY `id_item` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `empresas`
--
ALTER TABLE `empresas`
  MODIFY `id_empresa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `listas`
--
ALTER TABLE `listas`
  MODIFY `id_lista` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
