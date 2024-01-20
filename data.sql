CREATE DATABASE  IF NOT EXISTS `clinica_salud` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `clinica_salud`;
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: clinica_salud
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `cita`
--

DROP TABLE IF EXISTS `cita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cita` (
  `cod_cit` int NOT NULL AUTO_INCREMENT,
  `pac_cit` varchar(45) DEFAULT NULL,
  `med_cit` varchar(45) DEFAULT NULL,
  `obs_cit` varchar(45) DEFAULT NULL,
  `fec_cit` date NOT NULL,
  `cod_hora` int DEFAULT NULL,
  PRIMARY KEY (`cod_cit`),
  KEY `cod_hora_idx` (`cod_hora`),
  CONSTRAINT `cod_hora` FOREIGN KEY (`cod_hora`) REFERENCES `hora` (`cod_hora`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cita`
--

LOCK TABLES `cita` WRITE;
/*!40000 ALTER TABLE `cita` DISABLE KEYS */;
INSERT INTO `cita` VALUES (1,'JUAN','LUIS','NINGUNA','2022-11-04',3);
/*!40000 ALTER TABLE `cita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamento` (
  `cod_depa` int NOT NULL AUTO_INCREMENT,
  `nom_depa` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cod_depa`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES (1,'lima'),(2,'Huanuco'),(3,'cusco'),(4,'callao');
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `cod_emp` int NOT NULL AUTO_INCREMENT,
  `nom_emp` varchar(45) DEFAULT NULL,
  `pat_emp` varchar(45) DEFAULT NULL,
  `mat_emp` varchar(45) DEFAULT NULL,
  `cargo_emp` varchar(45) DEFAULT NULL,
  `cel_emp` varchar(12) DEFAULT NULL,
  `cod_depa` int DEFAULT NULL,
  `cod_sede` int DEFAULT NULL,
  PRIMARY KEY (`cod_emp`),
  KEY `cod_depa_idx` (`cod_depa`),
  KEY `cod_sede_idx` (`cod_sede`),
  CONSTRAINT `cod_depa` FOREIGN KEY (`cod_depa`) REFERENCES `departamento` (`cod_depa`),
  CONSTRAINT `cod_sede` FOREIGN KEY (`cod_sede`) REFERENCES `sede` (`cod_sede`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,'DIEGO','RICALDI','CORNEJO','','999521001',2,1),(2,'IVÁN','GARCÍA','CHAVEZ','','999123556',3,2),(3,'SARA','ROSADO','TORRES','','991567202',1,6),(4,'ANDREA','SALAS','ROBLES','','998103548',2,2),(5,'JHON','AREVALO','SILVA','','991098921',4,4),(6,'ERICK','FLORES','DIASA','CIRUJANO','987874533',1,1),(7,'MARIA','FLORES','LOPEZ','CIRUJANA','934567898',1,2);
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genero`
--

DROP TABLE IF EXISTS `genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genero` (
  `cod_gene` int NOT NULL AUTO_INCREMENT,
  `nom_gene` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cod_gene`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genero`
--

LOCK TABLES `genero` WRITE;
/*!40000 ALTER TABLE `genero` DISABLE KEYS */;
INSERT INTO `genero` VALUES (1,'MASCULINO'),(2,'FEMENINO');
/*!40000 ALTER TABLE `genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hora`
--

DROP TABLE IF EXISTS `hora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hora` (
  `cod_hora` int NOT NULL AUTO_INCREMENT,
  `nom_hora` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cod_hora`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hora`
--

LOCK TABLES `hora` WRITE;
/*!40000 ALTER TABLE `hora` DISABLE KEYS */;
INSERT INTO `hora` VALUES (1,'8:30 AM a 09:00 AM'),(2,'9:30 AM a 10:00 AM'),(3,'10:00 AM a 11:00 AM'),(4,'11:00 AM a 12:00 PM'),(5,'12:00 PM a 13:00 PM');
/*!40000 ALTER TABLE `hora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paciente`
--

DROP TABLE IF EXISTS `paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paciente` (
  `cod_pac` int NOT NULL AUTO_INCREMENT,
  `dni_pac` varchar(8) DEFAULT NULL,
  `nom_pac` varchar(45) DEFAULT NULL,
  `pat_pac` varchar(45) DEFAULT NULL,
  `mat_pac` varchar(45) DEFAULT NULL,
  `cod_gene` int DEFAULT NULL,
  `edad_pac` varchar(45) DEFAULT NULL,
  `tele_pac` varchar(12) DEFAULT NULL,
  `dire_pac` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cod_pac`),
  KEY `cod_gene_idx` (`cod_gene`),
  CONSTRAINT `cod_gene` FOREIGN KEY (`cod_gene`) REFERENCES `genero` (`cod_gene`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente`
--

LOCK TABLES `paciente` WRITE;
/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;
INSERT INTO `paciente` VALUES (1,'87463789','MARIA','PERES','INGA',2,'19','963237876','rosales'),(2,'74645653','JUANITA','LAOS','JASSAA',2,'22','967637456','av lima'),(3,'76364789','RODOLFO','JARA','LOPEZ',1,'18','92637345','av lima'),(4,'76787678','JUAN','PERES','RAZA',1,'22','967637456','rosales'),(5,'87536748','ALEXA','ROSAA','DWNN',2,'19','963778432','callao'),(6,'76337289','ARECIO','LAOS','CHALCO',1,'23','947344565','callao'),(7,'45634245','ERICK','LAOS','LOPEZ',1,'22','92637345','av lima');
/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sede`
--

DROP TABLE IF EXISTS `sede`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sede` (
  `cod_sede` int NOT NULL AUTO_INCREMENT,
  `nom_sede` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cod_sede`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sede`
--

LOCK TABLES `sede` WRITE;
/*!40000 ALTER TABLE `sede` DISABLE KEYS */;
INSERT INTO `sede` VALUES (1,'BREÑA'),(2,'MIRAFLORES'),(3,'LOS OLIVOS'),(4,'RIMAC'),(5,'PUENTE PIEDRA'),(6,'LA MOLINA');
/*!40000 ALTER TABLE `sede` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_usuarios`
--

DROP TABLE IF EXISTS `tb_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_usuarios` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `usuario` varchar(10) NOT NULL,
  `clave` char(10) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_usuarios`
--

LOCK TABLES `tb_usuarios` WRITE;
/*!40000 ALTER TABLE `tb_usuarios` DISABLE KEYS */;
INSERT INTO `tb_usuarios` VALUES (1,'RODOLFO','JARA LOPEZ','JARA','12345'),(2,'MARIA','DIAS','MARIA','12345'),(3,'JUANITO','DAZA','JUANITO1','12345');
/*!40000 ALTER TABLE `tb_usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'clinica_salud'
--

--
-- Dumping routines for database 'clinica_salud'
--
/*!50003 DROP PROCEDURE IF EXISTS `usp_iniciarSesion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_iniciarSesion`(usr char(45), pas char(5))
BEGIN
select * from tb_usuarios  where usuario=usr and clave = pas;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-27 23:57:31
