-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-09-2024 a las 16:59:09
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `farmaciadb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblcategorias`
--

CREATE TABLE `tblcategorias` (
  `CatCodigo` int(10) NOT NULL,
  `CatNombre` varchar(100) NOT NULL,
  `CatDescripcion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tblcategorias`
--

INSERT INTO `tblcategorias` (`CatCodigo`, `CatNombre`, `CatDescripcion`) VALUES
(1, 'anti asepticos', 'Productos para desinfectar y prevenir infecciones.'),
(2, 'antibioticos cutaneos', 'Medicamentos aplicados en la piel para tratar infecciones bacterianas.'),
(3, 'anticonceptivos', 'Productos utilizados para prevenir el embarazo.'),
(4, 'antigripales', 'Medicamentos para aliviar los síntomas del resfriado y la gripe.'),
(5, 'vitaminas', 'Suplementos para mejorar la salud y cubrir deficiencias nutricionales.'),
(6, 'anti-diarreica', 'Medicamentos para tratar la diarrea.'),
(7, 'antipirectico', 'Medicamentos utilizados para reducir la fiebre.'),
(8, 'desinflamatorio', 'Medicamentos para reducir la inflamación.'),
(9, 'sales de rehidratacion', 'Soluciones para reponer líquidos y electrolitos en el cuerpo.'),
(10, 'sistema digestivo y metabolico', 'Productos para tratar y apoyar la salud digestiva y metabólica.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbldetallesdepedidos`
--

CREATE TABLE `tbldetallesdepedidos` (
  `DpdCodigo` int(10) NOT NULL,
  `tblProducto` int(10) DEFAULT NULL,
  `tblPedido` int(10) DEFAULT NULL,
  `DpdCantidad` int(10) NOT NULL,
  `DpdPrecioTotal` int(50) NOT NULL,
  `DpdNombreProducto` varchar(100) NOT NULL,
  `DpdPrecioUnitario` int(100) NOT NULL,
  `DpdFecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbldetallesdepedidos`
--

INSERT INTO `tbldetallesdepedidos` (`DpdCodigo`, `tblProducto`, `tblPedido`, `DpdCantidad`, `DpdPrecioTotal`, `DpdNombreProducto`, `DpdPrecioUnitario`, `DpdFecha`) VALUES
(1, 1, 1, 2, 200, 'anti asepticos', 100, '2024-08-23'),
(2, 2, 2, 1, 150, 'antibioticos cutaneos', 150, '2024-08-23'),
(3, 3, 3, 3, 450, 'anticonceptivos', 150, '2024-08-23'),
(4, 4, 1, 5, 500, 'antigripales', 100, '2024-08-23'),
(5, 5, 2, 2, 300, 'vitaminas', 150, '2024-08-23'),
(6, 1, 4, 1, 6500, 'Floratil', 6500, '2024-09-10'),
(7, 1, 5, 1, 6500, 'Floratil', 6500, '2024-09-10'),
(8, 2, 6, 1, 2500, 'Krodex F Compuesto', 2500, '2024-09-10'),
(9, 1, 7, 1, 9000, 'Floratil', 6500, '2024-09-10'),
(10, 2, 7, 1, 9000, 'Krodex F Compuesto', 2500, '2024-09-10'),
(11, 1, 8, 1, 9000, 'Floratil', 6500, '2024-09-10'),
(12, 2, 8, 1, 9000, 'Krodex F Compuesto', 2500, '2024-09-10');

--
-- Disparadores `tbldetallesdepedidos`
--
DELIMITER $$
CREATE TRIGGER `actualizar_provendido` AFTER INSERT ON `tbldetallesdepedidos` FOR EACH ROW BEGIN
    -- Actualiza el campo ProVendido en la tabla tblproductos
    UPDATE `tblproductos`
    SET `ProVendido` = `ProVendido` + NEW.`DpdCantidad`
    WHERE `ProCodigo` = NEW.`tblProducto`;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `actualizar_stock` AFTER INSERT ON `tbldetallesdepedidos` FOR EACH ROW BEGIN
    -- Actualiza el stock en la tabla tblproductos
    UPDATE `tblproductos`
    SET `ProStock` = `ProStock` - NEW.`DpdCantidad`
    WHERE `ProCodigo` = NEW.`tblProducto`;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblpedidos`
--

CREATE TABLE `tblpedidos` (
  `PedCodigo` int(10) NOT NULL,
  `tblUsuarios` int(10) DEFAULT NULL,
  `PedFormaDePago` varchar(50) NOT NULL,
  `PedFecha` date NOT NULL,
  `PedTotal` decimal(10,2) NOT NULL,
  `PedEstado` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tblpedidos`
--

INSERT INTO `tblpedidos` (`PedCodigo`, `tblUsuarios`, `PedFormaDePago`, `PedFecha`, `PedTotal`, `PedEstado`) VALUES
(1, 1, 'Tarjeta de Crédito', '2024-08-22', 150.75, 'enviado'),
(2, 2, 'Transferencia Bancaria', '2024-08-21', 75.50, 'Completado'),
(3, 3, 'Efectivo', '2024-08-20', 200.00, 'enviado'),
(4, 10, 'Efectivo', '2024-09-10', 6500.00, 'en proceso'),
(5, 10, 'Efectivo', '2024-09-10', 6500.00, 'en proceso'),
(6, 10, 'Efectivo', '2024-09-10', 2500.00, 'en proceso'),
(7, 10, 'Efectivo', '2024-09-10', 9000.00, 'en proceso'),
(8, 10, 'Efectivo', '2024-09-10', 9000.00, 'en proceso');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblpqr`
--

CREATE TABLE `tblpqr` (
  `PQRCodigo` int(10) NOT NULL,
  `tblUsuID` int(10) NOT NULL,
  `PQRFecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `PQRNombre` varchar(100) NOT NULL,
  `PQRCorreo` varchar(200) NOT NULL,
  `PQRtelefono` int(10) NOT NULL,
  `PQRTipo` varchar(20) NOT NULL,
  `PQRDescripcion` text NOT NULL,
  `PQREstado` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tblpqr`
--

INSERT INTO `tblpqr` (`PQRCodigo`, `tblUsuID`, `PQRFecha`, `PQRNombre`, `PQRCorreo`, `PQRtelefono`, `PQRTipo`, `PQRDescripcion`, `PQREstado`) VALUES
(1, 1, '2024-08-26 13:08:32', '', '', 0, 'Queja', '0', 'Pendiente'),
(2, 2, '2024-08-26 13:08:32', '', '', 0, 'Peticion', '0', 'Resuelto'),
(3, 3, '2024-08-26 13:08:32', '', '', 0, 'Reclamo', '0', 'En proceso'),
(4, 6632734, '2024-08-26 13:50:09', 'Dariana', 'dar@gmail.com', 2147483647, 'complaint', 'medicamento erroneo', 'Pendiente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblproductos`
--

CREATE TABLE `tblproductos` (
  `ProCodigo` int(10) NOT NULL,
  `tblProveedores` int(10) DEFAULT NULL,
  `ProPrecio` int(100) NOT NULL,
  `ProDescuento` varchar(50) NOT NULL,
  `ProMarca` varchar(50) NOT NULL,
  `ProNombre` varchar(100) NOT NULL,
  `ProFoto` varchar(255) DEFAULT NULL,
  `ProDescripcion` varchar(255) DEFAULT NULL,
  `ProFechaVencimiento` date DEFAULT NULL,
  `ProStock` int(10) NOT NULL DEFAULT 0,
  `ProVendido` int(200) NOT NULL,
  `tblcategorias` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tblproductos`
--

INSERT INTO `tblproductos` (`ProCodigo`, `tblProveedores`, `ProPrecio`, `ProDescuento`, `ProMarca`, `ProNombre`, `ProFoto`, `ProDescripcion`, `ProFechaVencimiento`, `ProStock`, `ProVendido`, `tblcategorias`) VALUES
(1, 1, 6500, '15%', 'AxonPharma', 'Floratil', 'Imagenes/antidiarreica/floratil.png', 'Tratamiento antidiarreico natural.', '2030-12-31', 6, 2, 6),
(2, 1, 2500, '15%', 'MedicBrand', 'Krodex F Compuesto', 'Imagenes/antidiarreica/krodexfcompuesto.png', 'Comprimidos para digestion.', '2030-12-31', 12, 3, 6),
(3, 1, 6500, '15%', 'IPSEN', 'Smecta', 'Imagenes/antidiarreica/smecta.png', 'Alivio de diarrea y malestar.', '2030-12-31', 20, 0, 6),
(4, 2, 8000, '15%', 'Ecar', 'Metronidazol', 'Imagenes/antidiarreica/metronidazol.png', 'Antibiotico para infecciones digestivas.', '2030-12-31', 30, 0, 6),
(5, 2, 600, '15%', 'Laproff', 'Loperamida', 'Imagenes/antidiarreica/loperamida.png', 'Regula transito intestinal.', '2030-12-31', 50, 0, 6),
(6, 2, 4500, '', 'Laproff', 'Acetaminofen Jarabe', 'Imagenes/antipirectico/acetaminofen.png', 'Jarabe para fiebre infantil.', '2030-12-31', 40, 0, 7),
(7, 3, 18000, '', 'NovaMed', 'Chiquident', 'Imagenes/antipirectico/Chiquident1.png', 'Gel dental para niños.', '2030-12-31', 25, 0, 7),
(8, 3, 18000, '', 'Dolex', 'Dolex kids', 'Imagenes/antipirectico/dolexkid.png', 'Alivio de fiebre y dolor infantil.', '2030-12-31', 15, 0, 7),
(9, 2, 8000, '', 'SiegFried', 'Noxpirin', 'Imagenes/antipirectico/noxpirin.png', 'Alivia sintomas de gripe.', '2030-12-31', 30, 0, 7),
(10, 2, 5000, '', 'Procaps S.A.', 'Dolofen', 'Imagenes/antipirectico/dolofenkid.png', 'Alivio de fiebre y dolor.', '2030-12-31', 50, 0, 7),
(11, 1, 3000, '', 'Genfar', 'Naproxeno', 'Imagenes/desinflamatorio/naproxeno1.png', 'Anti-inflamatorio para dolor articular.', '2030-12-31', 100, 0, 8),
(12, 2, 2000, '', 'Bayer', 'Apronax', 'Imagenes/desinflamatorio/apronaxgel1.png', 'Naproxeno para dolor e inflamacion.', '2030-12-31', 75, 0, 8),
(13, 1, 2000, '', 'Abbott', 'Lumbal', 'Imagenes/desinflamatorio/lumbalforte1.png', 'Anti-inflamatorio para dolor lumbar.', '2030-12-31', 60, 0, 8),
(14, 1, 1500, '', 'Laproff', 'Dicoflenaco', 'Imagenes/desinflamatorio/diclofenaco1.png', 'Anti-inflamatorio para inflamacion.', '2030-12-31', 85, 0, 8),
(15, 2, 1500, '', 'Genfar', 'Ibuprofeno', 'Imagenes/desinflamatorio/ibuprofenogenfar1.png', 'Analgesico y anti-inflamatorio general.', '2030-12-31', 100, 0, 8),
(16, 2, 8000, '', 'Electrolit', 'Electrolit', 'Imagenes/salesderehidratacion/electrolit.png', 'Solucion para rehidratacion oral.', '2030-12-31', 200, 0, 9),
(17, 2, 10000, '', 'Tecnofar', 'Hidraplus', 'Imagenes/salesderehidratacion/hidraplus.png', 'Bebida rehidratante.', '2030-12-31', 150, 0, 9),
(18, 3, 20000, '', 'Quibi', 'Venovit', 'Imagenes/salesderehidratacion/venovit.png', 'Rehidratacion oral de electrolitos.', '2030-12-31', 75, 0, 9),
(19, 3, 1500, '', 'Quibi', 'PediaSol', 'Imagenes/salesderehidratacion/pediasol.png', 'Rehidratante para infantes.', '2030-12-31', 100, 0, 9),
(20, 1, 1700, '', 'Sanfer', 'SolHidrex', 'Imagenes/salesderehidratacion/solhidrex.png', 'Solucion para rehidratar.', '2030-12-31', 120, 0, 9),
(21, 3, 2000, '', 'EuroFarma', 'Ditopax', 'Imagenes/sistemadigestivoymetabolico/ditopax.png', 'Suplemento digestivo y metabolico.', '2030-12-31', 80, 0, 10),
(22, 2, 1500, '', 'Abbott', 'Finigax', 'Imagenes/sistemadigestivoymetabolico/finigax.png', 'Suplemento para digestion.', '2030-12-31', 70, 0, 10),
(23, 1, 1500, '', 'Grunenthal', 'Zaldiar', 'Imagenes/sistemadigestivoymetabolico/zaldiar.png', 'Analgesico combinado para dolor.', '2030-12-31', 90, 0, 10),
(24, 1, 1500, '', 'Sanofi', 'Pepsamar', 'Imagenes/sistemadigestivoymetabolico/pepsamar.png', 'Alivia acidez estomacal.', '2030-12-31', 60, 0, 10),
(25, 3, 2000, '', 'NovaMed', 'Dimoflax', 'Imagenes/sistemadigestivoymetabolico/dimoflax.png', 'Suplemento digestivo y metabolico.', '2030-12-31', 100, 0, 10),
(26, 1, 1500, '', 'MK', 'Alcohol', 'Imagenes/antiaseptico/alcohol.png', 'Antiseptico para heridas.', '2030-12-31', 150, 0, 1),
(27, 1, 3000, '', 'MK', 'Vita_C', 'Imagenes/vitaminas/vitac.png', 'Vitamina C para salud general.', '2030-12-31', 120, 0, 5),
(28, 2, 1500, '', 'JGB', 'Dioxogen', 'Imagenes/antiaseptico/dioxogen.png', 'Desinfecta heridas y piel.', '2030-12-31', 200, 0, 1),
(29, 2, 1500, '', 'Laproff', 'Acido_Fusidico', 'Imagenes/antibioticoscutaneos/acidofusidico.png', 'Antibotico topico para piel.', '2030-12-31', 130, 0, 2),
(30, 2, 1500, '', 'Sanfer', 'Isodine', 'Imagenes/antiaseptico/isodine.png', 'Antiseptico para heridas.', '2030-12-31', 170, 0, 1),
(31, 3, 1000, '', 'Biupen', 'Menticol', 'Imagenes/antiaseptico/menticol.png', 'Desinfecta piel y heridas.', '2030-12-31', 100, 0, 1),
(32, 1, 1000, '', 'FuesFarma', 'Activa_21', 'Imagenes/anticonceptivos/activa21.png', 'Anticonceptivo oral.', '2030-12-31', 50, 0, 3),
(33, 1, 1500, '', 'Abbott', 'Bellaface', 'Imagenes/anticonceptivos/bellaface.png', 'Anticonceptivo para regular ciclo.', '2030-12-31', 75, 0, 3),
(34, 2, 1500, '', 'TecnoFarma', 'Microgynon', 'Imagenes/anticonceptivos/microgynon.png', 'Prevencion de embarazo.', '2030-12-31', 50, 0, 3),
(35, 2, 1500, '', 'La Franco SAS', 'Nofertyl', 'Imagenes/anticonceptivos/nofertyl.png', 'Anticonceptivo oral diario.', '2030-12-31', 40, 0, 3),
(36, 1, 1500, '', 'Abbott', 'Sinovul', 'Imagenes/anticonceptivos/sinovul.png', 'Anticonceptivo para ciclo menstrual.', '2030-12-31', 60, 0, 3),
(37, 1, 1000, '', 'MedicBrand', 'Dermaskin', 'Imagenes/antibioticoscutaneos/dermaskin.png', 'Antibiotico para infecciones cutaneas.', '2030-12-31', 120, 0, 2),
(38, 2, 1500, '', 'Freshly', 'Mieltertos', 'Imagenes/antigripales/mieltertos.png', 'Antibiotico topico para piel.', '2030-12-31', 80, 0, 4),
(39, 1, 1500, '', 'AngloPharma', 'MucoTrop', 'Imagenes/antigripales/mucotrop.png', 'Alivia tos y sintomas gripales.', '2030-12-31', 50, 0, 4),
(40, 2, 1500, '', 'Freshly', 'Paratos', 'Imagenes/antigripales/paratos.png', 'Alivia resfriado y gripe.', '2030-12-31', 90, 0, 4),
(41, 3, 1500, '', 'PF Consumer HealthCuere', 'Robitussin', 'Imagenes/antigripales/robitussin.png', 'Medicamento para tos.', '2030-12-31', 40, 0, 4),
(42, 3, 1500, '', 'CoasPharma', 'Tukol-D', 'Imagenes/antigripales/tukold.png', 'Alivio de tos y resfriado.', '2030-12-31', 120, 0, 4),
(43, 1, 1500, '', 'Memphis', 'Idrocortisona', 'Imagenes/antibioticoscutaneos/idrocortisona.png', 'Anti-inflamatorio para piel.', '2030-12-31', 70, 0, 2),
(44, 1, 1500, '', 'Genfar', 'Sulfadiazina de plata', 'Imagenes/antibioticoscutaneos/sulfatodeplata.png', 'Antibiotico para quemaduras.', '2030-12-31', 50, 0, 2),
(45, 2, 1500, '', 'Profma', 'Timicort', 'Imagenes/antibioticoscutaneos/timicort.png', 'Antibiotico para piel.', '2030-12-31', 60, 0, 2),
(46, 1, 1500, '', 'HumaPharmaseutica', 'Bedoyecta', 'Imagenes/vitaminas/bedoyecta.png', 'Vitamina B para salud nerviosa.', '2030-12-31', 30, 0, 5),
(47, 2, 1500, '', 'Incobra', 'Fosforovitam', 'Imagenes/vitaminas/fosforovitam.png', 'Suplemento vitaminico general.', '2030-12-31', 100, 0, 5),
(48, 2, 1500, '', 'Laboratorios Lebrios SAS', 'Orocal', 'Imagenes/vitaminas/orocal.png', 'Suplemento de calcio.', '2030-12-31', 80, 0, 5),
(49, 3, 1500, '', 'Laproff', 'Sulfato Ferroso', 'Imagenes/vitaminas/sulfatoferroso.png', 'Suplemento de hierro.', '2030-12-31', 90, 0, 5),
(50, 1, 1700, '', 'Sanfer', 'SolHidrex', 'Imagenes/salesderehidratacion/solhidrex.png', 'Solucion para rehidratar.', '2030-12-31', 120, 0, 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblproveedores`
--

CREATE TABLE `tblproveedores` (
  `ID` int(10) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Direccion` varchar(255) NOT NULL,
  `Ciudad` varchar(50) NOT NULL,
  `Correo` varchar(100) NOT NULL,
  `Telefono` varchar(20) DEFAULT NULL,
  `Contacto` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tblproveedores`
--

INSERT INTO `tblproveedores` (`ID`, `Nombre`, `Direccion`, `Ciudad`, `Correo`, `Telefono`, `Contacto`) VALUES
(1, 'Proveedora S.A.', 'Calle de la Industria 45', 'Ciudad Central', 'contacto@proveedora.com', '555-1234', 'Laura Pérez'),
(2, 'Distribuciones Globales', 'Avenida Comercio 78', 'Metropolis', 'ventas@distribucionesglobales.com', '555-5678', 'Roberto Gómez'),
(3, 'Servicios Técnicos Ltda.', 'Boulevard de la Tecnología 23', 'TechCity', 'info@serviciostecnicos.com', '555-8765', 'Ana Morales');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblusuarios`
--

CREATE TABLE `tblusuarios` (
  `UsuID` int(10) NOT NULL,
  `UsuUsuarioTipo` varchar(20) NOT NULL,
  `UsuUsuario` varchar(50) NOT NULL,
  `UsuNombre` varchar(200) NOT NULL,
  `UsuApellido` varchar(20) NOT NULL,
  `UsuCorreo` varchar(50) NOT NULL,
  `UsuContrasena` varchar(200) NOT NULL,
  `UsuTelefono` varchar(10) NOT NULL,
  `UsuDireccion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tblusuarios`
--

INSERT INTO `tblusuarios` (`UsuID`, `UsuUsuarioTipo`, `UsuUsuario`, `UsuNombre`, `UsuApellido`, `UsuCorreo`, `UsuContrasena`, `UsuTelefono`, `UsuDireccion`) VALUES
(1, 'Administrador', 'abel123', 'Abel', 'Mattos', 'martinezmattosabeljesus5@gmail.com', 'macgyverparzival', '3243316646', 'Cra 2g #51c36'),
(2, 'Administrador', 'samuel123', 'Samuel', 'Buzon', 'samuelbuzon@gmail.com', 'samuel', '2147483647', 'Avenida Siempre Viva 742'),
(3, 'Administrador', 'cortezano24', 'Luis', 'Cortezano', 'luiscortezano@gmail.com', 'cortezano', '2147483647', 'Boulevard de los Sueños Rotos 456'),
(4, 'Cliente', 'dari123', 'Dariana', 'Ruiz', 'darianaruiz@gmail.com', 'dariana', '2147483647', 'Cra 2b #23c34'),
(10, 'Usuario', 'abel123', 'Abel', 'Mattos', 'martinezmattosabeljesus5@gmail.com', '$2a$10$MAhCB52IjcIgG/EtMifXfuwwWv0c7LYnk66EktJfxuVKvIbTlivda', '3234455678', 'Cra 2g 43c 33'),
(6632734, 'Administrador', 'darrz', 'Dariana', 'ruiz', 'dar@gmail.com', '$2a$10$gNtpgc8lnp6Gcis2Rv2bEuO9VY7d.ldekp.SMPhp7jnG48ClJ7v2q', '3024567898', 'calle #64 3-43');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tblcategorias`
--
ALTER TABLE `tblcategorias`
  ADD PRIMARY KEY (`CatCodigo`);

--
-- Indices de la tabla `tbldetallesdepedidos`
--
ALTER TABLE `tbldetallesdepedidos`
  ADD PRIMARY KEY (`DpdCodigo`),
  ADD KEY `tblProducto` (`tblProducto`),
  ADD KEY `tblPedido` (`tblPedido`);

--
-- Indices de la tabla `tblpedidos`
--
ALTER TABLE `tblpedidos`
  ADD PRIMARY KEY (`PedCodigo`),
  ADD KEY `tblUsuarios` (`tblUsuarios`);

--
-- Indices de la tabla `tblpqr`
--
ALTER TABLE `tblpqr`
  ADD PRIMARY KEY (`PQRCodigo`),
  ADD KEY `tblUsuarios` (`tblUsuID`);

--
-- Indices de la tabla `tblproductos`
--
ALTER TABLE `tblproductos`
  ADD PRIMARY KEY (`ProCodigo`),
  ADD KEY `tblProveedores` (`tblProveedores`),
  ADD KEY `fk_categoria` (`tblcategorias`);

--
-- Indices de la tabla `tblproveedores`
--
ALTER TABLE `tblproveedores`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Correo` (`Correo`);

--
-- Indices de la tabla `tblusuarios`
--
ALTER TABLE `tblusuarios`
  ADD PRIMARY KEY (`UsuID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tblcategorias`
--
ALTER TABLE `tblcategorias`
  MODIFY `CatCodigo` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `tbldetallesdepedidos`
--
ALTER TABLE `tbldetallesdepedidos`
  MODIFY `DpdCodigo` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `tblpedidos`
--
ALTER TABLE `tblpedidos`
  MODIFY `PedCodigo` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `tblpqr`
--
ALTER TABLE `tblpqr`
  MODIFY `PQRCodigo` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tblproductos`
--
ALTER TABLE `tblproductos`
  MODIFY `ProCodigo` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de la tabla `tblproveedores`
--
ALTER TABLE `tblproveedores`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tblusuarios`
--
ALTER TABLE `tblusuarios`
  MODIFY `UsuID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6632735;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbldetallesdepedidos`
--
ALTER TABLE `tbldetallesdepedidos`
  ADD CONSTRAINT `tbldetallesdepedidos_ibfk_3` FOREIGN KEY (`tblProducto`) REFERENCES `tblproductos` (`ProCodigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbldetallesdepedidos_ibfk_4` FOREIGN KEY (`tblPedido`) REFERENCES `tblpedidos` (`PedCodigo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tblpedidos`
--
ALTER TABLE `tblpedidos`
  ADD CONSTRAINT `tblpedidos_ibfk_1` FOREIGN KEY (`tblUsuarios`) REFERENCES `tblusuarios` (`UsuID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tblpqr`
--
ALTER TABLE `tblpqr`
  ADD CONSTRAINT `tblpqr_ibfk_1` FOREIGN KEY (`tblUsuID`) REFERENCES `tblusuarios` (`UsuID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tblproductos`
--
ALTER TABLE `tblproductos`
  ADD CONSTRAINT `tblproductos_ibfk_1` FOREIGN KEY (`tblProveedores`) REFERENCES `tblproveedores` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tblproductos_ibfk_2` FOREIGN KEY (`tblcategorias`) REFERENCES `tblcategorias` (`CatCodigo`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
