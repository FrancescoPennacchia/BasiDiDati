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
-- Table structure for table `impiegato`
--

DROP TABLE IF EXISTS `impiegato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `impiegato` (
  `codPersonale` varchar(20) NOT NULL,
  `idSede` int(11) NOT NULL,
  `trasferta` tinyint(1) NOT NULL,
  `dataInizio` date NOT NULL,
  `dataFine` date DEFAULT NULL,
  PRIMARY KEY (`codPersonale`,`idSede`,`dataInizio`),
  KEY `idSede` (`idSede`),
  CONSTRAINT `impiegato_ibfk_1` FOREIGN KEY (`codPersonale`) REFERENCES `personale` (`cod`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `impiegato_ibfk_2` FOREIGN KEY (`idSede`) REFERENCES `sedi` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `impiegato`
--

LOCK TABLES `impiegato` WRITE;
/*!40000 ALTER TABLE `impiegato` DISABLE KEYS */;
INSERT INTO `impiegato` VALUES ('P1',1,0,'2002-04-09',NULL),('P1',3,1,'2004-04-09','2004-05-10'),('P1',3,1,'2006-07-08','2007-05-10'),('P2',1,0,'2001-07-08',NULL),('P2',1,1,'2009-12-03','2010-10-16'),('P3',3,0,'2010-12-03','2015-10-16'),('P3',3,1,'2012-04-02','2012-07-06'),('P7',3,1,'2013-06-22',NULL),('P7',4,0,'2012-04-02',NULL);
/*!40000 ALTER TABLE `impiegato` ENABLE KEYS */;
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
