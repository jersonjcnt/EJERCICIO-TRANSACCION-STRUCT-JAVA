-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: mantenimiento_autos
-- ------------------------------------------------------
-- Server version	5.7.17-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auto`
--

DROP TABLE IF EXISTS `auto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auto` (
  `idauto` int(11) NOT NULL AUTO_INCREMENT,
  `placa` varchar(45) NOT NULL,
  `modelo` varchar(45) NOT NULL,
  `foto` text NOT NULL,
  PRIMARY KEY (`idauto`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto`
--

LOCK TABLES `auto` WRITE;
/*!40000 ALTER TABLE `auto` DISABLE KEYS */;
INSERT INTO `auto` VALUES (1,'1321331-2','hyundai','/images/1321331-2.jpg'),(2,'3553531-2','nissan','/images/3553531-2.jpg'),(3,'2133333-3','toyota','/images/2133333-3.jpg'),(4,'7553553-1','jeep','/images/7553553-1.jpg'),(5,'7533212-1','BMW','/images/7533212-1.jpg');
/*!40000 ALTER TABLE `auto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `idcliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `dni` varchar(45) NOT NULL,
  PRIMARY KEY (`idcliente`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'daniel perez espinoza','37521321'),(2,'miguel rodriguez curu','22232111'),(3,'juan perez villavicencio','12351731'),(4,'almir ramirez leyva','12357772'),(5,'jerson jacinto blas','12357213');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revision`
--

DROP TABLE IF EXISTS `revision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `revision` (
  `idrevision` int(11) NOT NULL AUTO_INCREMENT,
  `idcliente` int(11) NOT NULL,
  `fechaRevision` datetime NOT NULL,
  `dias` int(11) DEFAULT NULL,
  PRIMARY KEY (`idrevision`),
  KEY `idcliente` (`idcliente`),
  CONSTRAINT `revision_ibfk_1` FOREIGN KEY (`idcliente`) REFERENCES `cliente` (`idcliente`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revision`
--

LOCK TABLES `revision` WRITE;
/*!40000 ALTER TABLE `revision` DISABLE KEYS */;
INSERT INTO `revision` VALUES (1,1,'2018-06-01 00:00:00',12),(2,2,'2018-06-10 00:00:00',12),(3,3,'2018-06-10 00:00:00',11),(4,4,'2018-06-12 00:00:00',23),(5,5,'2018-06-13 00:00:00',55),(15,1,'2018-06-29 00:00:00',12),(17,5,'2018-06-29 00:00:00',120),(18,1,'2018-06-29 00:00:00',22),(19,2,'2018-06-30 00:00:00',0),(20,2,'2018-06-30 00:00:00',0);
/*!40000 ALTER TABLE `revision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revision_has_auto`
--

DROP TABLE IF EXISTS `revision_has_auto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `revision_has_auto` (
  `idrevision` int(11) NOT NULL AUTO_INCREMENT,
  `idauto` int(11) NOT NULL,
  `descripcion` text NOT NULL,
  PRIMARY KEY (`idrevision`),
  KEY `idauto` (`idauto`),
  CONSTRAINT `revision_has_auto_ibfk_1` FOREIGN KEY (`idrevision`) REFERENCES `revision` (`idrevision`),
  CONSTRAINT `revision_has_auto_ibfk_2` FOREIGN KEY (`idauto`) REFERENCES `auto` (`idauto`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revision_has_auto`
--

LOCK TABLES `revision_has_auto` WRITE;
/*!40000 ALTER TABLE `revision_has_auto` DISABLE KEYS */;
INSERT INTO `revision_has_auto` VALUES (1,1,'text'),(2,2,'text'),(3,3,'text'),(4,4,'text'),(5,5,'text'),(17,1,'ewfwef'),(18,1,'fefef\r\n'),(19,1,''),(20,2,'');
/*!40000 ALTER TABLE `revision_has_auto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'mantenimiento_autos'
--
/*!50003 DROP PROCEDURE IF EXISTS `BUSCAR_AUTO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `BUSCAR_AUTO`(IN param1 VARCHAR(100))
BEGIN
    IF (param1 != '') THEN
        SELECT * FROM auto where  `placa`  like param1  OR 
        `modelo`  like concat('%',param1,'%');
	ELSE
        SELECT * FROM auto;

    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BUSCAR_CLIENTE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `BUSCAR_CLIENTE`(IN param1 VARCHAR(100))
BEGIN
    IF (param1 != '') THEN

        SELECT * FROM cliente where `dni`  like param1  OR  
									`nombre` like concat('%',param1,'%');
                                    
	ELSE
        SELECT * FROM cliente;

    END IF;
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

-- Dump completed on 2018-06-30  5:31:38
