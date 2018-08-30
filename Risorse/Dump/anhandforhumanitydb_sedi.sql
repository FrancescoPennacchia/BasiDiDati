-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: anhandforhumanitydb
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.13-MariaDB

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
-- Table structure for table `sedi`
--

DROP TABLE IF EXISTS `sedi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sedi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `idNazione` int(11) NOT NULL,
  `provincia` varchar(30) NOT NULL,
  `citta` varchar(20) NOT NULL,
  `CAP` varchar(10) DEFAULT NULL,
  `via` varchar(30) NOT NULL,
  `nCivico` int(11) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `idNazione` (`idNazione`),
  CONSTRAINT `sedi_ibfk_1` FOREIGN KEY (`idNazione`) REFERENCES `nazioni` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sedi`
--

LOCK TABLES `sedi` WRITE;
/*!40000 ALTER TABLE `sedi` DISABLE KEYS */;
INSERT INTO `sedi` VALUES (1,'una mano per l\'umanita\'',110,'Frosinone','Atina','03042','Via dei Sanniti',NULL,'0776443221','atina_it@anhandforhumanity.org'),(2,'una mano para la humanidad',68,'Asturie','Oviedo',NULL,'via de la murte',NULL,'0223443221','oviedo_sp@anhandforhumanity.org'),(3,'i ka lima no ka mea',233,'Hawaii','Honolulu',NULL,'Halemanu st',NULL,'022143221','honolulu_usa@anhandforhumanity.org'),(4,'an hand for humanity',233,'Alaska','Juneau',NULL,'cold st',NULL,'099143221','alaska_usa@anhandforhumanity.org');
/*!40000 ALTER TABLE `sedi` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-30 11:13:12
