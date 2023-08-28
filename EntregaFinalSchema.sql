CREATE DATABASE  IF NOT EXISTS `primera_entrega` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `primera_entrega`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: primera_entrega
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `animal`
--

DROP TABLE IF EXISTS `animal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `animal` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) DEFAULT NULL,
  `tipo` varchar(30) DEFAULT NULL,
  `raza` varchar(30) DEFAULT NULL,
  `estado` varchar(30) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `edad_meses` int DEFAULT NULL,
  `malestar` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `log_ingreso_animal` AFTER INSERT ON `animal` FOR EACH ROW INSERT INTO log_nuevos_animales(nombre,tipo,edad_meses)
VALUES (NEW.nombre,NEW.tipo,NEW.edad_meses) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `citas`
--

DROP TABLE IF EXISTS `citas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `citas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int NOT NULL,
  `id_animal` int NOT NULL,
  `fecha_cita` timestamp NOT NULL,
  `observaciones` varchar(200) DEFAULT NULL,
  `estado` varchar(20) DEFAULT 'pendiente',
  PRIMARY KEY (`id`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_animal` (`id_animal`),
  CONSTRAINT `citas_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`),
  CONSTRAINT `citas_ibfk_2` FOREIGN KEY (`id_animal`) REFERENCES `animal` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `tipo_de_documento` varchar(30) NOT NULL,
  `N_documento` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `log_ingreso_cliente` AFTER INSERT ON `cliente` FOR EACH ROW INSERT INTO log_nuevos_clientes(id_cliente,nombre,fecha,hora)
VALUES (NEW.id,NEW.nombre,CURRENT_DATE(),CURRENT_TIME()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `cliente_contacto`
--

DROP TABLE IF EXISTS `cliente_contacto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente_contacto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int NOT NULL,
  `email` varchar(50) NOT NULL,
  `numero_area` int NOT NULL DEFAULT '54',
  `numero` int NOT NULL,
  `direccion` varchar(40) NOT NULL,
  `ciudad` varchar(40) NOT NULL,
  `provincia` varchar(40) DEFAULT NULL,
  `pais` varchar(40) NOT NULL,
  `codigo_postal` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `cliente_contacto_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `especialidades`
--

DROP TABLE IF EXISTS `especialidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `especialidades` (
  `id` int NOT NULL AUTO_INCREMENT,
  `especialidad` varchar(40) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `especialidades_trabajador`
--

DROP TABLE IF EXISTS `especialidades_trabajador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `especialidades_trabajador` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_trabajador` int NOT NULL,
  `id_especialidad` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_trabajador` (`id_trabajador`),
  KEY `id_especialidad` (`id_especialidad`),
  CONSTRAINT `especialidades_trabajador_ibfk_1` FOREIGN KEY (`id_trabajador`) REFERENCES `trabajadores` (`id`),
  CONSTRAINT `especialidades_trabajador_ibfk_2` FOREIGN KEY (`id_especialidad`) REFERENCES `especialidades` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `historial_tratamientos`
--

DROP TABLE IF EXISTS `historial_tratamientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial_tratamientos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_tratamiento` int NOT NULL,
  `id_animal` int NOT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `historial_tratamientos_ibfk_1` (`id_tratamiento`),
  KEY `historial_tratamientos_ibfk_2` (`id_animal`),
  CONSTRAINT `historial_tratamientos_ibfk_1` FOREIGN KEY (`id_tratamiento`) REFERENCES `tratamiento` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `historial_tratamientos_ibfk_2` FOREIGN KEY (`id_animal`) REFERENCES `animal` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_actualizacion_de_precios_mercaderia`
--

DROP TABLE IF EXISTS `log_actualizacion_de_precios_mercaderia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_actualizacion_de_precios_mercaderia` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_mercaderia` int DEFAULT NULL,
  `precio_nuevo` decimal(7,2) NOT NULL,
  `precio_viejo` decimal(7,2) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_nuevos_animales`
--

DROP TABLE IF EXISTS `log_nuevos_animales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_nuevos_animales` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `tipo` varchar(50) NOT NULL,
  `edad_meses` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_nuevos_clientes`
--

DROP TABLE IF EXISTS `log_nuevos_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_nuevos_clientes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `nombre` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_nuevos_mercaderia`
--

DROP TABLE IF EXISTS `log_nuevos_mercaderia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_nuevos_mercaderia` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cantidad_ingresada` int DEFAULT NULL,
  `precio` decimal(9,2) DEFAULT NULL,
  `provedor` varchar(50) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `id_mercaderia` int DEFAULT NULL,
  `mercaderia` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_ticket_nuevo`
--

DROP TABLE IF EXISTS `log_ticket_nuevo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_ticket_nuevo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `subtotal` decimal(9,2) DEFAULT NULL,
  `iva` decimal(9,2) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `total` decimal(9,2) DEFAULT NULL,
  `id_ticket` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_venta_mercaderia`
--

DROP TABLE IF EXISTS `log_venta_mercaderia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_venta_mercaderia` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_mercaderia` int NOT NULL,
  `precio_unidad` decimal(9,2) NOT NULL,
  `cantidad` int NOT NULL,
  `precio_total` decimal(9,2) NOT NULL,
  `iva` decimal(9,2) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_venta_tratamiento`
--

DROP TABLE IF EXISTS `log_venta_tratamiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_venta_tratamiento` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_tratamiento` int NOT NULL,
  `precio` decimal(9,2) DEFAULT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mascotas`
--

DROP TABLE IF EXISTS `mascotas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mascotas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int NOT NULL,
  `id_animal` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_animal` (`id_animal`),
  KEY `mascotas_ibfk_1` (`id_cliente`),
  CONSTRAINT `mascotas_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`),
  CONSTRAINT `mascotas_ibfk_2` FOREIGN KEY (`id_animal`) REFERENCES `animal` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mercaderia`
--

DROP TABLE IF EXISTS `mercaderia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mercaderia` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `stock` int NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `precio` decimal(9,2) NOT NULL,
  `provedor` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `provedor` (`provedor`),
  CONSTRAINT `mercaderia_ibfk_1` FOREIGN KEY (`provedor`) REFERENCES `provedor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `log_nuevos_mercaderia` AFTER INSERT ON `mercaderia` FOR EACH ROW INSERT INTO log_nuevos_mercaderia(id,id_mercaderia,mercaderia,cantidad_ingresada,precio,provedor,fecha,hora)
VALUES (NULL,NEW.id,NEW.nombre, NEW.stock,NEW.precio, NEW.provedor, CURRENT_DATE(),CURRENT_TIME()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `log_actualizacion_precio` BEFORE UPDATE ON `mercaderia` FOR EACH ROW BEGIN
    IF NEW.precio <> OLD.precio THEN
        INSERT INTO log_actualizacion_de_precios_mercaderia (id_mercaderia, precio_nuevo, precio_viejo, fecha, hora)
        VALUES (NEW.id, NEW.precio, OLD.precio, CURRENT_DATE(), CURRENT_TIME());
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `personal_tratamiento`
--

DROP TABLE IF EXISTS `personal_tratamiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_tratamiento` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_tratamiento` int NOT NULL,
  `id_trabajador` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `personal_tratamiento_ibfk_2` (`id_tratamiento`),
  KEY `personal_tratamiento_ibfk_3` (`id_trabajador`),
  CONSTRAINT `personal_tratamiento_ibfk_2` FOREIGN KEY (`id_tratamiento`) REFERENCES `tratamiento` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `personal_tratamiento_ibfk_3` FOREIGN KEY (`id_trabajador`) REFERENCES `trabajadores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `provedor`
--

DROP TABLE IF EXISTS `provedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provedor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `fecha_relacion` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `provedor_contacto`
--

DROP TABLE IF EXISTS `provedor_contacto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provedor_contacto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_provedor` int NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `numero_area` int NOT NULL DEFAULT '54',
  `numero` int DEFAULT NULL,
  `direccion` varchar(40) NOT NULL,
  `ciudad` varchar(40) NOT NULL,
  `provincia` varchar(40) DEFAULT NULL,
  `pais` varchar(40) NOT NULL,
  `codigo_postal` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_provedor` (`id_provedor`),
  CONSTRAINT `provedor_contacto_ibfk_1` FOREIGN KEY (`id_provedor`) REFERENCES `provedor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cliente` int DEFAULT NULL,
  `subtotal` decimal(9,2) DEFAULT NULL,
  `iva` decimal(9,2) DEFAULT NULL,
  `total` decimal(9,2) DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT NULL,
  `id_trabajador` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_id_trabajador_ticket` (`id_trabajador`),
  KEY `ticket_ibfk_1` (`cliente`),
  CONSTRAINT `FK_id_trabajador_ticket` FOREIGN KEY (`id_trabajador`) REFERENCES `trabajadores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`cliente`) REFERENCES `cliente` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=123336 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `log_ticket_nuevo` AFTER UPDATE ON `ticket` FOR EACH ROW BEGIN
    INSERT INTO log_ticket_nuevo(id,subtotal,iva,fecha,hora,total,id_ticket)
    VALUES (NULL,NEW.subtotal,NEW.iva,CURRENT_DATE(),CURRENT_TIME(),NEW.total, NEW.id);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ticket_mercaderia`
--

DROP TABLE IF EXISTS `ticket_mercaderia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_mercaderia` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_ticket` int NOT NULL,
  `id_mercaderia` int NOT NULL,
  `precio_unidad` decimal(9,2) NOT NULL,
  `cantidad` int NOT NULL,
  `precio_total` decimal(9,2) NOT NULL,
  `iva` decimal(9,2) NOT NULL,
  `id_trabajador` int NOT NULL,
  `subtotal` decimal(9,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_mercaderia` (`id_mercaderia`),
  KEY `ticket_mercaderia_ibfk_3_idx` (`id_trabajador`),
  KEY `ticket_mercaderia_ibfk_2` (`id_ticket`),
  CONSTRAINT `FK_id_trabajador` FOREIGN KEY (`id_trabajador`) REFERENCES `trabajadores` (`id`),
  CONSTRAINT `ticket_mercaderia_ibfk_1` FOREIGN KEY (`id_mercaderia`) REFERENCES `mercaderia` (`id`),
  CONSTRAINT `ticket_mercaderia_ibfk_2` FOREIGN KEY (`id_ticket`) REFERENCES `ticket` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `log_ticket_mercaderia` AFTER INSERT ON `ticket_mercaderia` FOR EACH ROW INSERT INTO log_venta_mercaderia(id_mercaderia,precio_unidad,cantidad,precio_total,iva,fecha,hora)
VALUES (NEW.id_mercaderia,NEW.precio_unidad,NEW.cantidad,NEW.precio_total,NEW.iva, CURRENT_DATE(),CURRENT_TIME()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ticket_tratamiento`
--

DROP TABLE IF EXISTS `ticket_tratamiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_tratamiento` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_ticket` int NOT NULL,
  `id_tratamiento` int NOT NULL,
  `precio_unidad` decimal(9,2) NOT NULL,
  `id_trabajador` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_id_trabajador_tratamiento` (`id_trabajador`),
  KEY `ticket_tratamiento_ibfk_1` (`id_tratamiento`),
  KEY `ticket_tratamiento_ibfk_2` (`id_ticket`),
  CONSTRAINT `FK_id_trabajador_tratamiento` FOREIGN KEY (`id_trabajador`) REFERENCES `trabajadores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ticket_tratamiento_ibfk_1` FOREIGN KEY (`id_tratamiento`) REFERENCES `tratamiento` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ticket_tratamiento_ibfk_2` FOREIGN KEY (`id_ticket`) REFERENCES `ticket` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `log_ticket_tratamiento` AFTER INSERT ON `ticket_tratamiento` FOR EACH ROW INSERT INTO log_venta_tratamiento(id_tratamiento,precio,fecha,hora)
VALUES (NEW.id_tratamiento,NEW.precio_unidad,CURRENT_DATE(),CURRENT_TIME()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ticket_venta_temporal`
--

DROP TABLE IF EXISTS `ticket_venta_temporal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_venta_temporal` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_trabajador` int DEFAULT NULL,
  `id_mercaderia` int DEFAULT NULL,
  `cantidad` int DEFAULT '1',
  `id_tratamiento` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_mercaderia_ventas` (`id_mercaderia`),
  KEY `fk_trabajador_ventas` (`id_trabajador`),
  KEY `fk_tratamiento_ventas` (`id_tratamiento`),
  CONSTRAINT `fk_mercaderia_ventas` FOREIGN KEY (`id_mercaderia`) REFERENCES `mercaderia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_trabajador_ventas` FOREIGN KEY (`id_trabajador`) REFERENCES `trabajadores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tratamiento_ventas` FOREIGN KEY (`id_tratamiento`) REFERENCES `tratamiento` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=172 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trabajadores`
--

DROP TABLE IF EXISTS `trabajadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trabajadores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `horarios` varchar(30) NOT NULL,
  `sueldo` decimal(7,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trabajadores_contacto`
--

DROP TABLE IF EXISTS `trabajadores_contacto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trabajadores_contacto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_trabajador` int NOT NULL,
  `email` varchar(50) NOT NULL,
  `numero_area` int NOT NULL DEFAULT '54',
  `numero` int NOT NULL,
  `direccion` varchar(40) NOT NULL,
  `ciudad` varchar(40) NOT NULL,
  `provincia` varchar(40) DEFAULT NULL,
  `pais` varchar(40) NOT NULL,
  `codigo_postal` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_trabajador` (`id_trabajador`),
  CONSTRAINT `trabajadores_contacto_ibfk_1` FOREIGN KEY (`id_trabajador`) REFERENCES `trabajadores` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trabajadores_pago`
--

DROP TABLE IF EXISTS `trabajadores_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trabajadores_pago` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_trabajador` int NOT NULL,
  `sueldo` decimal(9,2) NOT NULL,
  `hora_extra` int NOT NULL,
  `pago_total` decimal(9,2) NOT NULL,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_trabajador` (`id_trabajador`),
  CONSTRAINT `trabajadores_pago_ibfk_1` FOREIGN KEY (`id_trabajador`) REFERENCES `trabajadores` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tratamiento`
--

DROP TABLE IF EXISTS `tratamiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tratamiento` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(30) NOT NULL,
  `descripcion` varchar(300) NOT NULL,
  `costo` decimal(9,2) NOT NULL,
  `id_personal` int DEFAULT NULL,
  `id_animal` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tratamiento_ibfk_1` (`id_animal`),
  CONSTRAINT `tratamiento_ibfk_1` FOREIGN KEY (`id_animal`) REFERENCES `animal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `log_historial_tratamiento` AFTER INSERT ON `tratamiento` FOR EACH ROW INSERT INTO historial_tratamientos(id_tratamiento,id_animal,fecha,hora)
VALUES (NEW.id, NEW.id_animal, CURRENT_DATE(), CURRENT_TIME()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `view_animales_cliente`
--

DROP TABLE IF EXISTS `view_animales_cliente`;
/*!50001 DROP VIEW IF EXISTS `view_animales_cliente`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_animales_cliente` AS SELECT 
 1 AS `nombre`,
 1 AS `cantidad_mascotas`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_mercaderia`
--

DROP TABLE IF EXISTS `view_mercaderia`;
/*!50001 DROP VIEW IF EXISTS `view_mercaderia`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_mercaderia` AS SELECT 
 1 AS `producto`,
 1 AS `stock_total`,
 1 AS `precio_total`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_productos_vendidos`
--

DROP TABLE IF EXISTS `view_productos_vendidos`;
/*!50001 DROP VIEW IF EXISTS `view_productos_vendidos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_productos_vendidos` AS SELECT 
 1 AS `id_producto`,
 1 AS `nombre`,
 1 AS `veces_vendido`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_tickets_mercaderia`
--

DROP TABLE IF EXISTS `view_tickets_mercaderia`;
/*!50001 DROP VIEW IF EXISTS `view_tickets_mercaderia`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_tickets_mercaderia` AS SELECT 
 1 AS `mercaderia`,
 1 AS `cliente`,
 1 AS `nombe`,
 1 AS `total`,
 1 AS `cantidad_comprada`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_tickets_tratamiento`
--

DROP TABLE IF EXISTS `view_tickets_tratamiento`;
/*!50001 DROP VIEW IF EXISTS `view_tickets_tratamiento`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_tickets_tratamiento` AS SELECT 
 1 AS `id_tratamiento`,
 1 AS `id_cliente`,
 1 AS `nombre`,
 1 AS `veces_usado_el_tratamiento`,
 1 AS `total`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_total_cliente`
--

DROP TABLE IF EXISTS `view_total_cliente`;
/*!50001 DROP VIEW IF EXISTS `view_total_cliente`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_total_cliente` AS SELECT 
 1 AS `id_cliente`,
 1 AS `nombre`,
 1 AS `precio_total`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_tratamiento_mascota`
--

DROP TABLE IF EXISTS `view_tratamiento_mascota`;
/*!50001 DROP VIEW IF EXISTS `view_tratamiento_mascota`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_tratamiento_mascota` AS SELECT 
 1 AS `nombre`,
 1 AS `tipo`,
 1 AS `descripcion`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_animal_edades`
--

DROP TABLE IF EXISTS `vw_animal_edades`;
/*!50001 DROP VIEW IF EXISTS `vw_animal_edades`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_animal_edades` AS SELECT 
 1 AS `nombre`,
 1 AS `tipo`,
 1 AS `años`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'primera_entrega'
--

--
-- Dumping routines for database 'primera_entrega'
--
/*!50003 DROP FUNCTION IF EXISTS `edad_anos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `edad_anos`(meses INT) RETURNS decimal(9,2)
    DETERMINISTIC
BEGIN
DECLARE anos INT;
DECLARE anos_totales DECIMAL(9,1);
SET anos= 12;
SET anos_totales = 0;
SELECT meses / anos INTO anos_totales;
RETURN anos_totales;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `horas_extras_pago` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `horas_extras_pago`(id_trabajador INT,horas_extras INT) RETURNS decimal(9,2)
    DETERMINISTIC
BEGIN
DECLARE pago_extra DECIMAL(9,2);
DECLARE sueldo_x_hora DECIMAL(9,2);
SET sueldo_x_hora = ((SELECT sueldo FROM trabajadores WHERE id = id_trabajador)/30)/8;
SET pago_extra = ( (sueldo_x_hora * horas_extras)*2);
RETURN pago_extra;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `iva` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `iva`(monto DECIMAL) RETURNS decimal(9,2)
    DETERMINISTIC
BEGIN
DECLARE total,iva DECIMAL(9,2);
SET total = 0.00;
SET iva= 0.21;
SELECT monto * iva INTO total;
RETURN total;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `precio_total` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `precio_total`(subtotal DECIMAL(9,2)) RETURNS decimal(9,2)
    DETERMINISTIC
BEGIN
DECLARE iva DECIMAL(9,2);
DECLARE total DECIMAL (9,2);
SET total = subtotal + iva(subtotal);
RETURN total;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `agregar_animal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_animal`(IN nombre CHAR(20), IN tipo CHAR(20), IN raza CHAR(20),IN estado CHAR(20), IN descripcion CHAR(100), IN edad_meses INT, IN malestar CHAR(200))
BEGIN

IF nombre = ''  THEN
SET nombre = NULL;
END IF;
IF raza = ''  THEN
SET raza = NULL;
END IF;
IF malestar = '' THEN
SET malestar = NULL;
END IF;

INSERT INTO animal(nombre,tipo,raza,estado,descripcion,edad_meses,malestar)
VALUES(nombre , tipo , raza , estado , descripcion , edad_meses , malestar);
SELECT * FROM animal;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `quitar_animal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `quitar_animal`(IN id_animal INT)
BEGIN
DELETE FROM animal WHERE id = id_animal; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_paga_trabajadores` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_paga_trabajadores`(IN in_id_trabajador INT,  IN in_horas_extras INT)
BEGIN
DECLARE var_sueldo DECIMAL(9,2);
SELECT sueldo FROM trabajadores WHERE id = in_id_trabajador INTO @var_sueldo;

IF in_id_trabajador <= 0 OR in_horas_extras < 0 THEN
	SIGNAL SQLSTATE "42000"
	SET MESSAGE_TEXT = "todos los campos son requeridos";
ELSE
INSERT INTO trabajadores_pago
VALUES(NULL,in_id_trabajador,@var_sueldo,in_horas_extras, horas_extras_pago(in_id_trabajador,in_horas_extras) + @var_sueldo ,current_date());
END IF;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_venta_temporal_ticket_mercederia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_venta_temporal_ticket_mercederia`(IN in_id_trabajador INT, IN in_id_mercaderia INT,IN in_cantidad INT)
BEGIN
DECLARE m_stock INT;

SELECT stock INTO m_stock
FROM mercaderia
WHERE in_id_mercaderia = id;
    
IF in_id_trabajador <= 0 OR in_id_mercaderia <=0 OR in_cantidad <= 0 THEN
	SIGNAL SQLSTATE "42000"
	SET MESSAGE_TEXT = "todos los campos son requeridos";
    
ELSEIF in_cantidad > m_stock THEN
	SIGNAL SQLSTATE "42000"
	SET MESSAGE_TEXT = "la cantidad deseada supera a la disponible";
ELSE

UPDATE mercaderia
SET stock = stock - in_cantidad
WHERE id= in_id_mercaderia;


INSERT INTO ticket_venta_temporal (id_trabajador, id_mercaderia,cantidad)
VALUES(in_id_trabajador,in_id_mercaderia,in_cantidad);


END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_venta_temporal_ticket_tratamiento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_venta_temporal_ticket_tratamiento`(IN in_id_trabajador INT, IN in_id_tratamiento INT)
BEGIN
IF in_id_trabajador <= 0 OR in_id_tratamiento <= 0 THEN
	SIGNAL SQLSTATE "42000"
	SET MESSAGE_TEXT = "todos los campos son requeridos";
ELSE
INSERT INTO ticket_venta_temporal (id_trabajador, id_tratamiento)
VALUES(in_id_trabajador,in_id_tratamiento);
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_venta_ticket` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_venta_ticket`(IN in_id_cliente INT, IN in_id_trabajador INT)
BEGIN
DECLARE id_factura INT;
DECLARE subtotal, iva, total DECIMAL (9,2);

DECLARE precio_total_variable DECIMAL(10,2);
DECLARE precio_total_variable2 DECIMAL(10,2);


IF in_id_trabajador <= 0 OR in_id_cliente <=0 THEN
	SIGNAL SQLSTATE "42000"
	SET MESSAGE_TEXT = "todos los campos son requeridos";
ELSE
	INSERT INTO ticket
    VALUES (NULL,in_id_cliente,NULL,NULL,NULL,CURRENT_TIMESTAMP(),in_id_trabajador);

SET @id_factura = LAST_INSERT_ID();

INSERT INTO ticket_mercaderia (id_ticket,id_mercaderia,precio_unidad,cantidad,precio_total,iva,id_trabajador,subtotal)
SELECT @id_factura,
		vt.id_mercaderia,
        m.precio,
        vt.cantidad,
        precio_total(vt.cantidad * m.precio),
        iva(vt.cantidad * m.precio),
        in_id_trabajador,
        vt.cantidad * m.precio
        
FROM ticket_venta_temporal AS vt
JOIN mercaderia AS m ON vt.id_mercaderia = m.id
WHERE vt.id_trabajador = in_id_trabajador;

INSERT INTO ticket_tratamiento (id_ticket,id_tratamiento,precio_unidad,id_trabajador)
SELECT @id_factura,
		vt.id_tratamiento,
        t.costo,
        in_id_trabajador
        
FROM ticket_venta_temporal AS vt
JOIN tratamiento AS t ON vt.id_tratamiento = t.id
WHERE vt.id_trabajador = in_id_trabajador;

DELETE FROM ticket_venta_temporal WHERE id_trabajador = in_id_trabajador;

CALL suma_totales_tablas('ticket_mercaderia', "subtotal", @id_factura);
SET precio_total_variable = @precio_total;
IF (precio_total_variable IS NULL) THEN 
SET precio_total_variable = 0;
END IF;


CALL suma_totales_tablas("ticket_tratamiento","precio_unidad",@id_factura);
SET precio_total_variable2 = @precio_total;
IF (precio_total_variable2 IS NULL) THEN 
SET precio_total_variable2 = 0;
END IF;

SELECT (precio_total_variable + precio_total_variable2)INTO @subtotal;
UPDATE ticket SET subtotal = @subtotal, iva = iva(@subtotal), total = precio_total(@subtotal) WHERE id = @id_factura;

END IF;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `st_paga_trabajadores` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `st_paga_trabajadores`(IN in_id_trabajador INT,  IN in_horas_extras INT)
BEGIN
DECLARE var_sueldo DECIMAL(9,2);
SELECT sueldo FROM trabajadores WHERE id = in_id_trabajador INTO @var_sueldo;

IF in_id_trabajador <= 0 OR in_horas_extras < 0 THEN
	SIGNAL SQLSTATE "42000"
	SET MESSAGE_TEXT = "todos los campos son requeridos";
ELSE
INSERT INTO trabajadores_pago
VALUES(NULL,in_id_trabajador,@var_sueldo,in_horas_extras, horas_extras_pago(in_id_trabajador,in_horas_extras) + @var_sueldo ,current_date());
END IF;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `suma_totales_tablas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `suma_totales_tablas`(tabla VARCHAR(30), columna VARCHAR(30), id_ticket_activo INT)
BEGIN
IF tabla = "" OR columna = "" OR id_ticket_activo <= 0 THEN
SIGNAL SQLSTATE "42000"
	SET MESSAGE_TEXT = "todos los campos son requeridos";
ELSE
	SET @sql = CONCAT('SELECT SUM(', columna, ') INTO @precio_total FROM ', tabla, ' WHERE id_ticket = ', id_ticket_activo);
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
	SELECT COALESCE(@precio_total, 0) AS precio_total;
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `view_animales_cliente`
--

/*!50001 DROP VIEW IF EXISTS `view_animales_cliente`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_animales_cliente` AS select `c`.`nombre` AS `nombre`,count(`m`.`id_animal`) AS `cantidad_mascotas` from ((`cliente` `c` join `mascotas` `m` on((`c`.`id` = `m`.`id_cliente`))) join `animal` `a` on((`a`.`id` = `m`.`id_animal`))) group by `c`.`nombre` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_mercaderia`
--

/*!50001 DROP VIEW IF EXISTS `view_mercaderia`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_mercaderia` AS select `m`.`nombre` AS `producto`,sum(`m`.`stock`) AS `stock_total`,sum((`m`.`precio` * `m`.`stock`)) AS `precio_total` from `mercaderia` `m` group by `m`.`nombre` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_productos_vendidos`
--

/*!50001 DROP VIEW IF EXISTS `view_productos_vendidos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_productos_vendidos` AS select `m`.`id` AS `id_producto`,`m`.`nombre` AS `nombre`,sum(`tm`.`cantidad`) AS `veces_vendido` from (`ticket_mercaderia` `tm` join `mercaderia` `m` on((`tm`.`id_mercaderia` = `m`.`id`))) group by `m`.`id`,`tm`.`id_mercaderia` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_tickets_mercaderia`
--

/*!50001 DROP VIEW IF EXISTS `view_tickets_mercaderia`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_tickets_mercaderia` AS select `tt`.`id_mercaderia` AS `mercaderia`,`t`.`cliente` AS `cliente`,`c`.`nombre` AS `nombe`,sum(`t`.`total`) AS `total`,sum(`tt`.`cantidad`) AS `cantidad_comprada` from ((`ticket` `t` join `ticket_mercaderia` `tt` on((`t`.`id` = `tt`.`id_ticket`))) join `cliente` `c` on((`c`.`id` = `t`.`cliente`))) group by `t`.`cliente`,`tt`.`id_mercaderia` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_tickets_tratamiento`
--

/*!50001 DROP VIEW IF EXISTS `view_tickets_tratamiento`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_tickets_tratamiento` AS select `tt`.`id_tratamiento` AS `id_tratamiento`,`t`.`cliente` AS `id_cliente`,`c`.`nombre` AS `nombre`,count(`t`.`id`) AS `veces_usado_el_tratamiento`,sum(`t`.`total`) AS `total` from ((`ticket` `t` join `ticket_tratamiento` `tt` on((`t`.`id` = `tt`.`id_ticket`))) join `cliente` `c` on((`c`.`id` = `t`.`cliente`))) group by `tt`.`id_tratamiento`,`t`.`cliente` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_total_cliente`
--

/*!50001 DROP VIEW IF EXISTS `view_total_cliente`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_total_cliente` AS select `c`.`id` AS `id_cliente`,`c`.`nombre` AS `nombre`,sum(`t`.`total`) AS `precio_total` from (`cliente` `c` join `ticket` `t` on((`c`.`id` = `t`.`cliente`))) group by `c`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_tratamiento_mascota`
--

/*!50001 DROP VIEW IF EXISTS `view_tratamiento_mascota`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_tratamiento_mascota` AS select `a`.`nombre` AS `nombre`,`t`.`tipo` AS `tipo`,`a`.`descripcion` AS `descripcion` from (`animal` `a` join `tratamiento` `t` on((`a`.`id` = `t`.`id_animal`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_animal_edades`
--

/*!50001 DROP VIEW IF EXISTS `vw_animal_edades`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_animal_edades` AS select `animal`.`nombre` AS `nombre`,`animal`.`tipo` AS `tipo`,`edad_anos`(`animal`.`edad_meses`) AS `años` from `animal` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-28  1:34:28
