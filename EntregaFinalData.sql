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
-- Dumping data for table `animal`
--

LOCK TABLES `animal` WRITE;
/*!40000 ALTER TABLE `animal` DISABLE KEYS */;
INSERT INTO `animal` VALUES (1,'vigotes','gato','egipcio','ok','buenardo',2,'lele pancha'),(2,'copito','gato',NULL,'ok','buenardo',3,'dolor de panza'),(3,'bicho','gato','siames','enfermo','lindo gato',22,'dolor en la pata'),(4,'pichu','perro','caniche','ok','es muy activo',23,'revision normal'),(5,'lionel','loro',NULL,'basado','verde brilante',10,'no para de hablar'),(6,'tobi','perro','bulldog','dolor de panza','chiquito de color marron',23,'esta gordo'),(7,'july','gato',NULL,'vomitos','blanca con manchas negras',32,'indigestion'),(8,'macaron','lagarto',NULL,'sin apetito','verde-amarillento',5,'decaido'),(9,'lucifer','gato',NULL,'pata derecha lastimada','negro puro',23,'con dolor para caminar'),(10,'fiumba','gato','lampiño','ok','gato barato',44,'come toda la comida'),(25,'ciro','perro','galgo','lastimado','color marron',12,'herida cerca del ojo'),(26,'coscu','loro','','ok','loro verde marron',17,'muy hablador');
/*!40000 ALTER TABLE `animal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `citas`
--

LOCK TABLES `citas` WRITE;
/*!40000 ALTER TABLE `citas` DISABLE KEYS */;
INSERT INTO `citas` VALUES (1,3,3,'2023-08-20 23:19:11','ninguna','pendiente'),(2,2,1,'2023-08-20 12:00:00','urgente','pendiente'),(3,2,6,'2023-08-24 15:00:00','rutina','cancelada'),(4,6,9,'2023-08-18 19:00:00','lleva bozal','terminado');
/*!40000 ALTER TABLE `citas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'carlos','estrada','dni','229018381'),(2,'jorge','vila','dni','229018441'),(3,'maria','mamani','dni','229018312'),(4,'Eliana Kramer','Leblanc','DNI','64797408'),(5,'Graham Carney','Morrison','DNI','49410967'),(6,'Jane Sparks','Sawyer','DNI','76653954'),(7,'Chelsea Reyes','Ruiz','DNI','21978572'),(8,'Stephanie Dillard','Byers','DNI','20862220'),(9,'Mechelle Hammond','Bishop','DNI','65368725'),(10,'Christian Herring','Roberts','DNI','66193845'),(11,'Beatrice Stevens','Ortiz','DNI','16844883'),(12,'Larissa Riggs','Solis','DNI','91541684'),(13,'Autumn Holt','Richmond','DNI','75682886'),(15,'Pepe','Argento','DNI','12345678');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cliente_contacto`
--

LOCK TABLES `cliente_contacto` WRITE;
/*!40000 ALTER TABLE `cliente_contacto` DISABLE KEYS */;
INSERT INTO `cliente_contacto` VALUES (1,1,'cliente1@email.com',54,45617890,'Calle A 1','CABA',NULL,'Argentina',1234),(2,2,'cliente2@email.com',54,98762543,'Calle B 2','CABA',NULL,'Argentina',1235),(3,3,'cliente3@email.com',54,55544344,'Calle C 3','CABA',NULL,'Argentina',1237),(4,4,'cliente4@email.com',54,22211141,'Calle D 4','CABA',NULL,'Argentina',1523),(5,5,'cliente5@email.com',54,88899995,'Calle E 5','CABA',NULL,'Argentina',5555),(6,6,'cliente6@email.com',54,33322226,'Calle F 6','CABA',NULL,'Argentina',2342),(7,7,'cliente7@email.com',54,44455557,'Calle G 7','CABA',NULL,'Argentina',3456),(8,8,'cliente8@email.com',54,77766866,'Calle H 8','CABA',NULL,'Argentina',4567),(9,9,'cliente9@email.com',54,11122292,'Calle I 9','CABA',NULL,'Argentina',5678),(10,10,'cliente10@email.com',54,99988188,'Calle J 10','CABA',NULL,'Argentina',6789),(11,11,'cliente11@email.com',54,33344424,'Calle K 11','CABA',NULL,'Argentina',7890),(12,12,'cliente12@email.com',54,66655553,'Calle L 12','CABA',NULL,'Argentina',8901),(13,13,'cliente13@email.com',54,44433334,'Calle M 13','CABA',NULL,'Argentina',9012),(14,15,'cliente14@email.com',54,11223344,'Calle O 14','CABA',NULL,'Argentinca',1406);
/*!40000 ALTER TABLE `cliente_contacto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `especialidades`
--

LOCK TABLES `especialidades` WRITE;
/*!40000 ALTER TABLE `especialidades` DISABLE KEYS */;
INSERT INTO `especialidades` VALUES (1,'cardiologia','experto en el uso de aparatos cardiovasculares'),(2,'etologia','estudio de comportamineto animal'),(3,'ortopedia','especialidad médica que involucra el tratamiento del sistema musculoesquelético'),(4,'estetica canina',' mensajes relajantes, baños personalizados y arreglo en general'),(5,'cardioterapeuta','especialista en problemas de corazon'),(6,'oftamologia','especialista en el cuidado de los ojos'),(7,'dermatologia','especialista en el cuidado de la piel'),(8,'cirujano','cirujano general de animales'),(9,'medice general','atiende consultas en general sobre los animales');
/*!40000 ALTER TABLE `especialidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `especialidades_trabajador`
--

LOCK TABLES `especialidades_trabajador` WRITE;
/*!40000 ALTER TABLE `especialidades_trabajador` DISABLE KEYS */;
INSERT INTO `especialidades_trabajador` VALUES (1,1,1),(2,4,2),(3,5,7),(4,5,3),(5,5,3),(6,10,8),(7,2,3),(8,8,9),(9,1,2),(10,10,1),(11,4,2),(12,7,3),(13,2,2),(14,1,6),(15,1,3),(16,7,4);
/*!40000 ALTER TABLE `especialidades_trabajador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `historial_tratamientos`
--

LOCK TABLES `historial_tratamientos` WRITE;
/*!40000 ALTER TABLE `historial_tratamientos` DISABLE KEYS */;
INSERT INTO `historial_tratamientos` VALUES (2,6,7,'2023-06-04','04:18:08'),(3,7,9,'2023-06-12','19:57:11'),(8,10,26,'2023-08-25','17:46:03'),(9,11,3,'2023-08-25','19:10:11');
/*!40000 ALTER TABLE `historial_tratamientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `log_actualizacion_de_precios_mercaderia`
--

LOCK TABLES `log_actualizacion_de_precios_mercaderia` WRITE;
/*!40000 ALTER TABLE `log_actualizacion_de_precios_mercaderia` DISABLE KEYS */;
INSERT INTO `log_actualizacion_de_precios_mercaderia` VALUES (1,5,400.00,338.32,'2023-07-12','22:43:21'),(2,11,139.45,139.45,'2023-08-15','21:10:27'),(3,20,260.00,262.91,'2023-08-15','21:18:27');
/*!40000 ALTER TABLE `log_actualizacion_de_precios_mercaderia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `log_nuevos_animales`
--

LOCK TABLES `log_nuevos_animales` WRITE;
/*!40000 ALTER TABLE `log_nuevos_animales` DISABLE KEYS */;
INSERT INTO `log_nuevos_animales` VALUES (5,'ciro','perro',12),(6,'coscu','loro',17);
/*!40000 ALTER TABLE `log_nuevos_animales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `log_nuevos_clientes`
--

LOCK TABLES `log_nuevos_clientes` WRITE;
/*!40000 ALTER TABLE `log_nuevos_clientes` DISABLE KEYS */;
INSERT INTO `log_nuevos_clientes` VALUES (3,15,'2023-08-15','19:59:56','Pepe');
/*!40000 ALTER TABLE `log_nuevos_clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `log_nuevos_mercaderia`
--

LOCK TABLES `log_nuevos_mercaderia` WRITE;
/*!40000 ALTER TABLE `log_nuevos_mercaderia` DISABLE KEYS */;
INSERT INTO `log_nuevos_mercaderia` VALUES (1,2,220.50,'8','2023-07-19','18:27:08',21,'Galletitas Kitty'),(2,20,300.00,'6','2023-08-15','20:03:44',21,'Galletitas Kitty'),(3,10,320.00,'8','2023-08-16','20:48:48',22,'Huesito Joy');
/*!40000 ALTER TABLE `log_nuevos_mercaderia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `log_ticket_nuevo`
--

LOCK TABLES `log_ticket_nuevo` WRITE;
/*!40000 ALTER TABLE `log_ticket_nuevo` DISABLE KEYS */;
INSERT INTO `log_ticket_nuevo` VALUES (9,400.00,84.00,'2023-08-15','20:19:11',484.00,123316),(10,541.06,113.61,'2023-08-15','21:19:43',654.67,123317),(11,2500.00,525.00,'2023-08-15','21:20:47',3025.00,123318),(12,1241.06,260.61,'2023-08-15','21:39:34',1501.67,123319),(13,400.00,84.00,'2023-08-15','23:25:36',484.00,123320),(14,1492.82,313.53,'2023-08-15','23:44:05',1806.35,123321),(15,0.00,0.00,'2023-08-15','23:44:55',0.00,123322),(16,700.00,147.00,'2023-08-15','23:48:17',847.00,123323),(17,700.00,147.00,'2023-08-16','00:28:24',847.00,123324),(18,1082.12,227.22,'2023-08-16','18:59:53',1309.34,123325),(19,1520.00,319.20,'2023-08-20','22:55:49',1839.20,123326),(20,1280.00,268.80,'2023-08-20','22:58:26',1548.80,123327),(21,682.15,143.22,'2023-08-20','23:02:51',825.37,123328),(22,0.00,0.00,'2023-08-20','23:52:09',0.00,123331),(23,2500.00,525.00,'2023-08-20','23:52:47',3025.00,123332),(24,400.00,84.00,'2023-08-25','18:08:24',484.00,123333);
/*!40000 ALTER TABLE `log_ticket_nuevo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `log_venta_mercaderia`
--

LOCK TABLES `log_venta_mercaderia` WRITE;
/*!40000 ALTER TABLE `log_venta_mercaderia` DISABLE KEYS */;
INSERT INTO `log_venta_mercaderia` VALUES (87,5,400.00,1,484.00,84.00,'2023-08-15','20:19:11'),(88,17,541.06,1,654.67,113.61,'2023-08-15','21:19:43'),(89,17,541.06,1,654.67,113.61,'2023-08-15','21:39:34'),(90,5,400.00,1,484.00,84.00,'2023-08-15','23:25:35'),(91,16,746.41,2,1806.35,313.53,'2023-08-15','23:44:05'),(92,17,541.06,2,1309.34,227.22,'2023-08-16','18:59:53'),(93,20,260.00,2,629.20,109.20,'2023-08-20','22:55:48'),(94,22,320.00,4,1548.80,268.80,'2023-08-20','22:58:26'),(95,18,682.15,1,825.37,143.22,'2023-08-20','23:02:51'),(96,5,400.00,1,484.00,84.00,'2023-08-25','18:08:24');
/*!40000 ALTER TABLE `log_venta_mercaderia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `log_venta_tratamiento`
--

LOCK TABLES `log_venta_tratamiento` WRITE;
/*!40000 ALTER TABLE `log_venta_tratamiento` DISABLE KEYS */;
INSERT INTO `log_venta_tratamiento` VALUES (48,9,2500.00,'2023-08-15','21:20:47'),(49,6,700.00,'2023-08-15','21:39:34'),(50,6,700.00,'2023-08-15','23:48:17'),(51,6,700.00,'2023-08-16','00:28:24'),(52,7,1000.00,'2023-08-20','22:55:48'),(53,9,2500.00,'2023-08-20','23:52:47');
/*!40000 ALTER TABLE `log_venta_tratamiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `mascotas`
--

LOCK TABLES `mascotas` WRITE;
/*!40000 ALTER TABLE `mascotas` DISABLE KEYS */;
INSERT INTO `mascotas` VALUES (1,2,1),(2,3,3),(3,2,6),(4,6,9),(5,1,7),(6,5,7);
/*!40000 ALTER TABLE `mascotas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `mercaderia`
--

LOCK TABLES `mercaderia` WRITE;
/*!40000 ALTER TABLE `mercaderia` DISABLE KEYS */;
INSERT INTO `mercaderia` VALUES (5,'Donec',9,'scelerisque mollis. Phasellus libero mauris, aliquam eu, accumsan sed, facilisis',400.00,1),(11,'molestie',8,'velit in aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod',139.45,1),(12,'diam',5,'aliquet. Proin velit. Sed malesuada augue ut lacus. Nulla tincidunt,',18.44,1),(14,'orci',10,'metus urna convallis erat, eget tincidunt dui augue eu tellus.',952.21,4),(16,'purus.',6,'Ut sagittis lobortis mauris. Suspendisse aliquet molestie tellus. Aenean egestas',746.41,4),(17,'tortor,',3,'Sed congue, elit sed consequat auctor, nunc nulla vulputate dui,',541.06,4),(18,'sem',2,'fringilla euismod enim. Etiam gravida molestie arcu. Sed eu nibh',682.15,1),(19,'interdum.',1,'dolor quam, elementum at, egestas a, scelerisque sed, sapien. Nunc',178.52,4),(20,'magnis',4,'magnis pelotas',260.00,4),(21,'Galletitas Kitty',15,'galletas para gatos',300.00,6),(22,'Huesito Joy',6,'huesito de plastico para perro',320.00,8);
/*!40000 ALTER TABLE `mercaderia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `personal_tratamiento`
--

LOCK TABLES `personal_tratamiento` WRITE;
/*!40000 ALTER TABLE `personal_tratamiento` DISABLE KEYS */;
INSERT INTO `personal_tratamiento` VALUES (2,6,4),(3,7,5),(5,9,8),(6,7,10),(7,11,2);
/*!40000 ALTER TABLE `personal_tratamiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `provedor`
--

LOCK TABLES `provedor` WRITE;
/*!40000 ALTER TABLE `provedor` DISABLE KEYS */;
INSERT INTO `provedor` VALUES (1,'gato barato','comida para gato, gato barato dura un buen rato','2023-01-22'),(4,'Emery Hobbs','risus. Nulla eget metus eu erat semper rutrum. Fusce dolor','2022-03-08'),(6,'Harding Roth','tempor erat neque non quam. Pellentesque habitant morbi tristique senectus','2022-02-19'),(8,'Oleg Cohen','taciti sociosqu ad litora torquent per conubia nostra, per inceptos','2024-12-24'),(9,'Clementine Mills','rutrum. Fusce dolor quam, elementum at, egestas a, scelerisque sed,','2023-12-12');
/*!40000 ALTER TABLE `provedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `provedor_contacto`
--

LOCK TABLES `provedor_contacto` WRITE;
/*!40000 ALTER TABLE `provedor_contacto` DISABLE KEYS */;
INSERT INTO `provedor_contacto` VALUES (1,1,'correo1@ejemplo.com',54,12345671,'calle falsa 1','CABA',NULL,'Argentina','1007'),(2,4,'correo2@ejemplo.com',54,12345672,'calle falsa 2','CABA',NULL,'Argentina','1007'),(3,6,'correo3@ejemplo.com',54,12345673,'calle falsa 3','CABA',NULL,'Argentina','1007'),(4,8,'correo4@ejemplo.com',54,12345674,'calle falsa 4','CABA',NULL,'Argentina','1007'),(5,9,'correo5@ejemplo.com',54,12345675,'calle falsa 5','CABA',NULL,'Argentina','1007');
/*!40000 ALTER TABLE `provedor_contacto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (123316,1,400.00,84.00,484.00,'2023-08-15 23:19:11',1),(123317,1,541.06,113.61,654.67,'2023-08-16 00:19:43',1),(123318,1,2500.00,525.00,3025.00,'2023-08-16 00:20:46',2),(123319,1,1241.06,260.61,1501.67,'2023-08-16 00:39:34',1),(123320,2,400.00,84.00,484.00,'2023-08-16 02:25:35',1),(123321,1,1492.82,313.53,1806.35,'2023-08-16 02:44:05',1),(123322,1,0.00,0.00,0.00,'2023-08-16 02:44:55',1),(123323,7,700.00,147.00,847.00,'2023-08-16 02:48:17',1),(123324,7,700.00,147.00,847.00,'2023-08-16 03:28:24',2),(123325,7,1082.12,227.22,1309.34,'2023-08-16 21:59:53',4),(123326,11,1520.00,319.20,1839.20,'2023-08-21 01:55:48',7),(123327,15,1280.00,268.80,1548.80,'2023-08-21 01:58:26',8),(123328,8,682.15,143.22,825.37,'2023-08-21 02:02:51',8),(123331,8,0.00,0.00,0.00,'2023-08-21 02:52:09',11),(123332,1,2500.00,525.00,3025.00,'2023-08-21 02:52:47',5),(123333,1,400.00,84.00,484.00,'2023-08-25 21:08:23',1);
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ticket_mercaderia`
--

LOCK TABLES `ticket_mercaderia` WRITE;
/*!40000 ALTER TABLE `ticket_mercaderia` DISABLE KEYS */;
INSERT INTO `ticket_mercaderia` VALUES (110,123316,5,400.00,1,484.00,84.00,1,400.00),(111,123317,17,541.06,1,654.67,113.61,1,541.06),(112,123319,17,541.06,1,654.67,113.61,1,541.06),(113,123320,5,400.00,1,484.00,84.00,1,400.00),(114,123321,16,746.41,2,1806.35,313.53,1,1492.82),(115,123325,17,541.06,2,1309.34,227.22,4,1082.12),(116,123326,20,260.00,2,629.20,109.20,7,520.00),(117,123327,22,320.00,4,1548.80,268.80,8,1280.00),(118,123328,18,682.15,1,825.37,143.22,8,682.15),(119,123333,5,400.00,1,484.00,84.00,1,400.00);
/*!40000 ALTER TABLE `ticket_mercaderia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ticket_tratamiento`
--

LOCK TABLES `ticket_tratamiento` WRITE;
/*!40000 ALTER TABLE `ticket_tratamiento` DISABLE KEYS */;
INSERT INTO `ticket_tratamiento` VALUES (63,123318,9,2500.00,2),(64,123319,6,700.00,1),(65,123323,6,700.00,1),(66,123324,6,700.00,2),(67,123326,7,1000.00,7),(68,123332,9,2500.00,5);
/*!40000 ALTER TABLE `ticket_tratamiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ticket_venta_temporal`
--

LOCK TABLES `ticket_venta_temporal` WRITE;
/*!40000 ALTER TABLE `ticket_venta_temporal` DISABLE KEYS */;
INSERT INTO `ticket_venta_temporal` VALUES (167,8,21,5,NULL);
/*!40000 ALTER TABLE `ticket_venta_temporal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `trabajadores`
--

LOCK TABLES `trabajadores` WRITE;
/*!40000 ALTER TABLE `trabajadores` DISABLE KEYS */;
INSERT INTO `trabajadores` VALUES (1,'ari','peres','lunes y jueves',35000.00),(2,'Kellie Pruitt','Hooper','martes y miercoles',33000.00),(3,'Uma Glass','Pearson','martes y miercoles',36000.00),(4,'Dexter Weaver','Higgins','viernes y sabados',40000.00),(5,'William Rivera','Barr','martes y miercoles',30000.00),(6,'Blake Mckinney','Phelps','martes y miercoles',32000.00),(7,'Evangeline Dean','Gibbs','martes y miercoles',34000.00),(8,'Katelyn Pitts','Hull','martes y miercoles',34000.00),(9,'Fatima Daniel','Chen','viernes y sabados',31000.00),(10,'Kelly Glass','Mays','martes y miercoles',29000.00),(11,'Cooper Pace','Santana','viernes y sabados',35500.00);
/*!40000 ALTER TABLE `trabajadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `trabajadores_contacto`
--

LOCK TABLES `trabajadores_contacto` WRITE;
/*!40000 ALTER TABLE `trabajadores_contacto` DISABLE KEYS */;
INSERT INTO `trabajadores_contacto` VALUES (1,1,'trabajador1@email.com',54,12345678,'Calle A 123','CABA',NULL,'Argentina','1234'),(2,2,'trabajador2@email.com',54,98765432,'Calle B 456','CABA',NULL,'Argentina','2345'),(3,3,'trabajador3@email.com',54,55544443,'Calle C 789','CABA',NULL,'Argentina','3456'),(4,4,'trabajador4@email.com',54,22211112,'Calle D 012','CABA',NULL,'Argentina','4567'),(5,5,'trabajador5@email.com',54,88899991,'Calle E 345','CABA',NULL,'Argentina','5678'),(6,6,'trabajador6@email.com',54,33322224,'Calle F 678','CABA',NULL,'Argentina','6789'),(7,7,'trabajador7@email.com',54,44455553,'Calle G 901','CABA',NULL,'Argentina','7890'),(8,8,'trabajador8@email.com',54,77766662,'Calle H 234','CABA',NULL,'Argentina','8901'),(9,9,'trabajador9@email.com',54,11122221,'Calle I 567','CABA',NULL,'Argentina','9012'),(10,10,'trabajador10@email.com',54,99988883,'Calle J 890','CABA',NULL,'Argentina','123'),(11,11,'trabajador12@email.com',54,33344449,'Calle K 123','CABA',NULL,'Argentina','1234');
/*!40000 ALTER TABLE `trabajadores_contacto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `trabajadores_pago`
--

LOCK TABLES `trabajadores_pago` WRITE;
/*!40000 ALTER TABLE `trabajadores_pago` DISABLE KEYS */;
INSERT INTO `trabajadores_pago` VALUES (1,1,35000.00,1,291.66,'2023-07-18'),(2,1,35000.00,1,35291.66,'2023-07-18'),(3,3,36000.00,4,37200.00,'2023-08-15'),(4,4,40000.00,2,40666.68,'2023-08-15'),(5,5,30000.00,0,30000.00,'2023-08-15'),(6,6,32000.00,5,33333.30,'2023-08-15'),(7,7,34000.00,1,34283.34,'2023-08-15'),(8,8,34000.00,2,34566.68,'2023-08-15'),(9,9,31000.00,1,31258.34,'2023-08-15'),(10,10,29000.00,3,29724.98,'2023-08-15'),(11,11,35500.00,1,35795.84,'2023-08-15');
/*!40000 ALTER TABLE `trabajadores_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tratamiento`
--

LOCK TABLES `tratamiento` WRITE;
/*!40000 ALTER TABLE `tratamiento` DISABLE KEYS */;
INSERT INTO `tratamiento` VALUES (6,'tramiento a base de pastillas','pastillaz de inflavet para el dolor',700.00,2,7),(7,'enyesamiento','se pondra un lleso en la para lastimada',1000.00,3,9),(9,'control de conducta','conducta anormal en el animal, seguimiento',2500.00,5,5),(10,'control ','Control rutinario',1000.00,6,26),(11,'Parasitos','Desparatizacion del animal',1200.00,11,3);
/*!40000 ALTER TABLE `tratamiento` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-25 22:30:30
