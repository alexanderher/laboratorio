-- MySQL dump 10.19  Distrib 10.3.34-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 172.17.0.3    Database: medical
-- ------------------------------------------------------
-- Server version	10.6.4-MariaDB-1:10.6.4+maria~focal

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `config_riesgo`
--

DROP TABLE IF EXISTS `config_riesgo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config_riesgo` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `risk_level` varchar(15) COLLATE latin1_general_ci NOT NULL,
  `sugar_min` decimal(5,2) NOT NULL,
  `sugar_max` decimal(5,2) NOT NULL,
  `fat_min` decimal(5,2) NOT NULL,
  `fat_max` decimal(5,2) NOT NULL,
  `oxygen_min` decimal(5,2) NOT NULL,
  `oxygen_max` decimal(5,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_riesgo`
--

LOCK TABLES `config_riesgo` WRITE;
/*!40000 ALTER TABLE `config_riesgo` DISABLE KEYS */;
INSERT INTO `config_riesgo` VALUES (1,'ALTO',70.00,100.00,88.50,100.00,0.00,60.00),(2,'BAJO',0.00,50.00,0.00,62.20,70.00,100.00),(3,'MEDIO',50.00,70.00,62.20,88.50,60.00,70.00);
/*!40000 ALTER TABLE `config_riesgo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hemograma`
--

DROP TABLE IF EXISTS `hemograma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hemograma` (
  `id` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `name` varchar(200) COLLATE latin1_general_ci NOT NULL,
  `type` varchar(45) COLLATE latin1_general_ci DEFAULT NULL,
  `sugar` decimal(5,2) DEFAULT NULL,
  `fat` decimal(5,2) DEFAULT NULL,
  `oxygen` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hemograma`
--

LOCK TABLES `hemograma` WRITE;
/*!40000 ALTER TABLE `hemograma` DISABLE KEYS */;
INSERT INTO `hemograma` VALUES ('1020110536','Valeria','A',60.00,70.00,40.00),('12345','Selena Gomez','A',50.00,50.00,50.00),('234234','NATY','A',0.00,0.00,0.00),('23423423','PAOLA REY','A',100.00,100.00,100.00),('76543','becky G','A',0.00,0.00,100.00),('98764534','Alex hernandez','A',80.00,99.00,60.00);
/*!40000 ALTER TABLE `hemograma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `risk_factors`
--

DROP TABLE IF EXISTS `risk_factors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `risk_factors` (
  `risk_factor` varchar(15) COLLATE latin1_general_ci NOT NULL,
  `sugar_level` double(3,1) NOT NULL,
  `fat_level` double(3,1) NOT NULL,
  `oxygen_level` double(3,1) NOT NULL,
  PRIMARY KEY (`risk_factor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `risk_factors`
--

LOCK TABLES `risk_factors` WRITE;
/*!40000 ALTER TABLE `risk_factors` DISABLE KEYS */;
INSERT INTO `risk_factors` VALUES ('HIGH',70.0,88.5,60.0),('LOW',0.0,0.0,0.0),('MEDIUM',50.0,62.2,70.0);
/*!40000 ALTER TABLE `risk_factors` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-02 14:34:39
