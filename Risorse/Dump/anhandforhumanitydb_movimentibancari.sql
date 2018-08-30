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
-- Table structure for table `movimentibancari`
--

DROP TABLE IF EXISTS `movimentibancari`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movimentibancari` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descrizione` varchar(200) NOT NULL,
  `giorno` date NOT NULL,
  `momento` time NOT NULL,
  `importo` float NOT NULL,
  `codTesoriere` varchar(20) DEFAULT NULL,
  `codCollaboratore` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `codCollaboratore` (`codCollaboratore`),
  KEY `codTesoriere` (`codTesoriere`),
  CONSTRAINT `movimentibancari_ibfk_1` FOREIGN KEY (`codCollaboratore`) REFERENCES `collaboratori` (`cod`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `movimentibancari_ibfk_2` FOREIGN KEY (`codTesoriere`) REFERENCES `personale` (`cod`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimentibancari`
--

LOCK TABLES `movimentibancari` WRITE;
/*!40000 ALTER TABLE `movimentibancari` DISABLE KEYS */;
INSERT INTO `movimentibancari` VALUES (1,'salary payment','2016-01-01','14:40:32',-1200,'P2','P1'),(2,'salary payment in transfer','2006-08-08','14:32:55',-1250,'P2','P1'),(3,'salary payment in transfer','2007-01-21','14:54:12',-1300,'P2','P1'),(4,'salary payment','2016-04-01','14:54:12',-1300,'P2','P2'),(5,'salary payment','2016-07-01','14:54:12',-1400,'P2','P2'),(6,'salary payment','2016-02-01','14:54:12',-1750,'P5','P6'),(7,'salary payment','2016-01-01','14:54:12',-1300,'P5','P7'),(8,'salary payment','2016-01-01','14:54:12',-1300,'P5','P7'),(9,'anonymus donation','0000-00-00','00:00:00',1000,NULL,NULL),(10,'donation','0000-00-00','00:00:00',350,NULL,'P6'),(11,'Contribution','2018-08-08','11:40:32',10200,NULL,'PA2'),(12,'Support','2018-08-10','16:22:45',-1577,'P2','PA1'),(13,'Contribution','2018-08-10','11:40:32',-500,'P5','PA1'),(14,'Contribution','2018-08-11','12:30:12',-500,'P5','PA1'),(15,'Contribution','2015-08-11','12:30:12',-500,'P2','PA1'),(16,'Contribution','2018-08-11','18:30:12',-500,'P2','PA1'),(17,'salary payment','2017-07-01','12:54:12',-1400,'P2','P2'),(18,'salary payment','2015-07-01','12:54:12',-1400,'P2','P2');
/*!40000 ALTER TABLE `movimentibancari` ENABLE KEYS */;
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
