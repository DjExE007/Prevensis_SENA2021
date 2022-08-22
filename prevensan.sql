-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-08-2022 a las 02:45:42
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `prevensan`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idcliente` int(12) NOT NULL,
  `CliIdentificacion_cliente` varchar(12) NOT NULL,
  `Cliempresa` varchar(30) NOT NULL COMMENT 'Nombre de la empresa o Cliente',
  `Clirepresentante` varchar(50) NOT NULL,
  `CliVinculoServicios` varchar(30) DEFAULT NULL,
  `CliTelcel` int(12) NOT NULL,
  `CliTel_local` int(14) NOT NULL,
  `CliDireccion` varchar(30) NOT NULL,
  `CliCorreo` varchar(30) DEFAULT NULL,
  `CliSitioWeb` varchar(70) DEFAULT NULL,
  `CliSectordelmercado` varchar(15) DEFAULT NULL,
  `CliObservaciones` varchar(70) DEFAULT NULL COMMENT 'Informacion relevante del cliente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idcliente`, `CliIdentificacion_cliente`, `Cliempresa`, `Clirepresentante`, `CliVinculoServicios`, `CliTelcel`, `CliTel_local`, `CliDireccion`, `CliCorreo`, `CliSitioWeb`, `CliSectordelmercado`, `CliObservaciones`) VALUES
(2, '900090296-2', 'Edificio Palma Real III', 'Don Jaime', 'Extintores, CiP, venta insumos', 0, 0, 'Cl 159 # 20-28', NULL, NULL, 'Conjuntos apart', NULL),
(1, '900365205-4', 'Prosalon distribuciones', 'Desconocido', 'Multiservicios, extintores, de', 0, 7455947, 'Cra 19a # 84-14', 'laura.garzon@prosalon.com.co', 'https://www.cromantic.com/\r\nhttps://www.blind.com.co/', 'Belleza', 'Manejan las compañias Cromantic Y Blind Altamente delicado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `costo_de_servicio_o_operacion`
--

CREATE TABLE `costo_de_servicio_o_operacion` (
  `idCostos_Operacion` int(15) NOT NULL,
  `CosMoneda_Colombiana` int(15) NOT NULL,
  `CosCostos_Transporte` int(15) DEFAULT NULL,
  `CosValor_Insumos` int(15) DEFAULT NULL,
  `CosSumatoria_costos_insumo` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `idFactura` int(4) NOT NULL,
  `FacPlantilla_Diseñada` varchar(10) NOT NULL,
  `FacFecha` date NOT NULL,
  `FacPais_destino` varchar(10) NOT NULL,
  `FacCiudad_destino` varchar(50) NOT NULL,
  `FacDatos_cliente` varchar(500) NOT NULL,
  `FacDetalles_cobros` varchar(700) NOT NULL,
  `FacValores_cobros_monCol` int(15) NOT NULL,
  `FacValor_Total` int(15) NOT NULL,
  `FacGen_docs` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `generadoralertas`
--

CREATE TABLE `generadoralertas` (
  `GenFechaVencimiento` date DEFAULT NULL,
  `GenCalendarioReal` date DEFAULT NULL,
  `GenAvisoTipoOperacion` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `generador_de_documentos`
--

CREATE TABLE `generador_de_documentos` (
  `idGenerador_Documentos` int(15) NOT NULL,
  `GedValor_OPS` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `margen_de_ganancia`
--

CREATE TABLE `margen_de_ganancia` (
  `idMargen_Ganancia` int(15) NOT NULL,
  `MarValor_Operacion_Mercado` int(15) DEFAULT NULL,
  `MarMoneda_colombiana` int(15) DEFAULT NULL,
  `MarResta_Valor_Op_MercadomenosCostos_Servicio` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `operadorsi`
--

CREATE TABLE `operadorsi` (
  `idOperadorSi` int(12) NOT NULL,
  `OpeContraseña` varchar(10) NOT NULL,
  `Opecliente` int(12) DEFAULT NULL,
  `OpeIdentificacion` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programadordeoperaciones`
--

CREATE TABLE `programadordeoperaciones` (
  `idOperacion` int(10) NOT NULL COMMENT 'Dato automatico contiene el numero de operacion que se efectuara',
  `ProClienteSolicitante` varchar(20) NOT NULL,
  `ProTipoOperacion` varchar(20) NOT NULL,
  `ProCantidades` int(4) NOT NULL COMMENT 'Cantidad de extintores, cantidad de elementos. Solo si aplica',
  `ProIntroduccirNuevaOperacion` varchar(20) DEFAULT NULL,
  `ProFechadeEjecucion` date DEFAULT NULL,
  `ProFechaVencimiento` date DEFAULT NULL COMMENT 'Fecha en la que se vence el elemento, solo si aplica fecha de vencimiento',
  `ProEditarOperacion` varchar(20) DEFAULT NULL,
  `ProRecargadeExtintor` varchar(20) DEFAULT NULL,
  `ProPinturaExtintor` varchar(20) DEFAULT NULL,
  `ProResuministroExtintor` varchar(20) DEFAULT NULL,
  `ProMantenimientoExtintor` varchar(20) DEFAULT NULL,
  `ProDesinfexion` varchar(20) DEFAULT NULL,
  `ProFumigacion` varchar(20) DEFAULT NULL,
  `ProPlandeSaneamiento` varchar(20) DEFAULT NULL,
  `ProLavadodeTanques` varchar(20) DEFAULT NULL,
  `ProCapacitacionSeguridad` varchar(20) DEFAULT NULL,
  `ProManipulacionAlimentos` varchar(20) DEFAULT NULL,
  `ProCarnetizacion` varchar(20) DEFAULT NULL,
  `ProVentaInsumos` varchar(20) DEFAULT NULL,
  `ProObservaciones` varchar(360) DEFAULT NULL COMMENT 'Se coloca información relevante a la operación a programar ej: 1 extintor por piso, se prestan tantos extintores, etc.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `programadordeoperaciones`
--

INSERT INTO `programadordeoperaciones` (`idOperacion`, `ProClienteSolicitante`, `ProTipoOperacion`, `ProCantidades`, `ProIntroduccirNuevaOperacion`, `ProFechadeEjecucion`, `ProFechaVencimiento`, `ProEditarOperacion`, `ProRecargadeExtintor`, `ProPinturaExtintor`, `ProResuministroExtintor`, `ProMantenimientoExtintor`, `ProDesinfexion`, `ProFumigacion`, `ProPlandeSaneamiento`, `ProLavadodeTanques`, `ProCapacitacionSeguridad`, `ProManipulacionAlimentos`, `ProCarnetizacion`, `ProVentaInsumos`, `ProObservaciones`) VALUES
(1, '900365205-4', 'recarga extintor', 2, NULL, '2022-08-11', '2023-08-11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'abc multi'),
(2, '900365205-4', 'Recarga de extintor', 4, NULL, '2022-08-12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bogota Cromantic Titan Plaza, ABC Multiproposito'),
(3, '900365205-4', 'Recarga de extintor', 4, NULL, '2022-08-12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bogota Cromantic Titan Plaza, ABC Multiproposito'),
(17, '900365205-4', 'Recarga de extintor', 7, NULL, '2022-08-15', '2023-08-15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Edificio Fenicia EXTINTORES co2'),
(18, '900365205-4', 'Recarga de extintor', 7, NULL, '2022-08-15', '2023-08-15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Edificio Fenicia EXTINTORES co2'),
(25, '900090296-2', 'Recarga de extintor', 9, NULL, '2022-08-22', '2023-08-22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bogota Blind Unicentro, extintores ABC Multiproposito 20 LB'),
(26, '900090296-2', 'Recarga de extintor', 5, NULL, '2022-08-19', '2023-08-19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '5 ABC multiproposito de 20 Lbs\r\nEdificio Palma Real');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `remision`
--

CREATE TABLE `remision` (
  `idRemision` int(4) NOT NULL,
  `RemPlantilla_diseñada` varchar(10) NOT NULL,
  `RemFecha` date NOT NULL,
  `RemPais_destino` varchar(10) NOT NULL,
  `RemCiudad_de_destino` varchar(10) NOT NULL,
  `RemDatos_cliente` varchar(500) NOT NULL,
  `RemDetalles_servicio` varchar(300) NOT NULL,
  `RemGen_docs` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `totales_del_mes`
--

CREATE TABLE `totales_del_mes` (
  `idTotales_del_mes` int(15) NOT NULL,
  `TotMoneda_Colombiana` int(15) DEFAULT NULL,
  `TotValores_servicios_mes` int(15) DEFAULT NULL,
  `TotSumatoria_todos_servicios_mes` int(15) DEFAULT NULL,
  `TotValores_Generales` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `totales_historicos`
--

CREATE TABLE `totales_historicos` (
  `idTotales_Historicos` date NOT NULL,
  `HisMoneda_colombiana_año` int(15) DEFAULT NULL,
  `HisMoneda_colombiana_actual` int(15) DEFAULT NULL,
  `HisFiltrar_año` date DEFAULT NULL,
  `HisFiltrar_mes` date DEFAULT NULL,
  `HisSumatoria_Todos_Servicios_filtro` int(15) DEFAULT NULL,
  `HisTotales_mes` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `valores_generales`
--

CREATE TABLE `valores_generales` (
  `iDValores_Generales` int(15) NOT NULL,
  `VagMoneda_Colombiana` int(15) DEFAULT NULL,
  `VagValorServicioOP` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `valor_servicio_o_operacion`
--

CREATE TABLE `valor_servicio_o_operacion` (
  `idValor_Servicio_o_Operacion` int(15) NOT NULL,
  `VasMargen_Ganancia` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`CliIdentificacion_cliente`),
  ADD KEY `idcliente` (`idcliente`) USING BTREE;

--
-- Indices de la tabla `costo_de_servicio_o_operacion`
--
ALTER TABLE `costo_de_servicio_o_operacion`
  ADD PRIMARY KEY (`idCostos_Operacion`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`idFactura`),
  ADD KEY `FacGen_docs` (`FacGen_docs`);

--
-- Indices de la tabla `generadoralertas`
--
ALTER TABLE `generadoralertas`
  ADD PRIMARY KEY (`GenAvisoTipoOperacion`);

--
-- Indices de la tabla `generador_de_documentos`
--
ALTER TABLE `generador_de_documentos`
  ADD PRIMARY KEY (`idGenerador_Documentos`),
  ADD KEY `GedValor_OPS` (`GedValor_OPS`);

--
-- Indices de la tabla `margen_de_ganancia`
--
ALTER TABLE `margen_de_ganancia`
  ADD PRIMARY KEY (`idMargen_Ganancia`);

--
-- Indices de la tabla `operadorsi`
--
ALTER TABLE `operadorsi`
  ADD PRIMARY KEY (`idOperadorSi`),
  ADD UNIQUE KEY `idOperadorSi` (`idOperadorSi`),
  ADD UNIQUE KEY `OpeIdentificacion` (`OpeIdentificacion`),
  ADD UNIQUE KEY `OpeContraseña` (`OpeContraseña`),
  ADD KEY `Opecliente` (`Opecliente`);

--
-- Indices de la tabla `programadordeoperaciones`
--
ALTER TABLE `programadordeoperaciones`
  ADD PRIMARY KEY (`idOperacion`),
  ADD KEY `ProClienteSolicitante` (`ProClienteSolicitante`);

--
-- Indices de la tabla `remision`
--
ALTER TABLE `remision`
  ADD PRIMARY KEY (`idRemision`),
  ADD KEY `RemGen_docs` (`RemGen_docs`);

--
-- Indices de la tabla `totales_del_mes`
--
ALTER TABLE `totales_del_mes`
  ADD PRIMARY KEY (`idTotales_del_mes`),
  ADD KEY `TotValores_Generales` (`TotValores_Generales`);

--
-- Indices de la tabla `totales_historicos`
--
ALTER TABLE `totales_historicos`
  ADD PRIMARY KEY (`idTotales_Historicos`),
  ADD KEY `HisTotales_mes` (`HisTotales_mes`);

--
-- Indices de la tabla `valores_generales`
--
ALTER TABLE `valores_generales`
  ADD PRIMARY KEY (`iDValores_Generales`),
  ADD KEY `VagValorServicioOP` (`VagValorServicioOP`);

--
-- Indices de la tabla `valor_servicio_o_operacion`
--
ALTER TABLE `valor_servicio_o_operacion`
  ADD PRIMARY KEY (`idValor_Servicio_o_Operacion`),
  ADD KEY `VasMargen_Ganancia` (`VasMargen_Ganancia`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idcliente` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `idFactura` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `generador_de_documentos`
--
ALTER TABLE `generador_de_documentos`
  MODIFY `idGenerador_Documentos` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `margen_de_ganancia`
--
ALTER TABLE `margen_de_ganancia`
  MODIFY `idMargen_Ganancia` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `operadorsi`
--
ALTER TABLE `operadorsi`
  MODIFY `idOperadorSi` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `programadordeoperaciones`
--
ALTER TABLE `programadordeoperaciones`
  MODIFY `idOperacion` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Dato automatico contiene el numero de operacion que se efectuara', AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `remision`
--
ALTER TABLE `remision`
  MODIFY `idRemision` int(4) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`FacGen_docs`) REFERENCES `generador_de_documentos` (`idGenerador_Documentos`);

--
-- Filtros para la tabla `generador_de_documentos`
--
ALTER TABLE `generador_de_documentos`
  ADD CONSTRAINT `generador_de_documentos_ibfk_1` FOREIGN KEY (`GedValor_OPS`) REFERENCES `valor_servicio_o_operacion` (`idValor_Servicio_o_Operacion`);

--
-- Filtros para la tabla `operadorsi`
--
ALTER TABLE `operadorsi`
  ADD CONSTRAINT `operadorsi_ibfk_1` FOREIGN KEY (`Opecliente`) REFERENCES `cliente` (`idcliente`);

--
-- Filtros para la tabla `programadordeoperaciones`
--
ALTER TABLE `programadordeoperaciones`
  ADD CONSTRAINT `programadordeoperaciones_ibfk_1` FOREIGN KEY (`ProClienteSolicitante`) REFERENCES `cliente` (`CliIdentificacion_cliente`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `remision`
--
ALTER TABLE `remision`
  ADD CONSTRAINT `remision_ibfk_1` FOREIGN KEY (`RemGen_docs`) REFERENCES `generador_de_documentos` (`idGenerador_Documentos`);

--
-- Filtros para la tabla `totales_del_mes`
--
ALTER TABLE `totales_del_mes`
  ADD CONSTRAINT `totales_del_mes_ibfk_1` FOREIGN KEY (`TotValores_Generales`) REFERENCES `valores_generales` (`iDValores_Generales`);

--
-- Filtros para la tabla `totales_historicos`
--
ALTER TABLE `totales_historicos`
  ADD CONSTRAINT `totales_historicos_ibfk_1` FOREIGN KEY (`HisTotales_mes`) REFERENCES `totales_del_mes` (`idTotales_del_mes`);

--
-- Filtros para la tabla `valores_generales`
--
ALTER TABLE `valores_generales`
  ADD CONSTRAINT `valores_generales_ibfk_1` FOREIGN KEY (`VagValorServicioOP`) REFERENCES `valor_servicio_o_operacion` (`idValor_Servicio_o_Operacion`);

--
-- Filtros para la tabla `valor_servicio_o_operacion`
--
ALTER TABLE `valor_servicio_o_operacion`
  ADD CONSTRAINT `valor_servicio_o_operacion_ibfk_1` FOREIGN KEY (`VasMargen_Ganancia`) REFERENCES `margen_de_ganancia` (`idMargen_Ganancia`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
