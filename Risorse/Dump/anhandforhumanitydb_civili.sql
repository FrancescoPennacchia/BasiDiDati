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
-- Table structure for table `civili`
--

DROP TABLE IF EXISTS `civili`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `civili` (
  `cod` varchar(20) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `cognome` varchar(35) NOT NULL,
  `dataNascita` date NOT NULL,
  `luogoNascita` varchar(20) NOT NULL,
  `nDocumento` varchar(15) DEFAULT NULL,
  `idNazione` int(11) NOT NULL,
  `provincia` varchar(30) DEFAULT NULL,
  `citta` varchar(20) DEFAULT NULL,
  `CAP` varchar(10) DEFAULT NULL,
  `via` varchar(30) DEFAULT NULL,
  `nCivico` int(11) DEFAULT NULL,
  `telefono` varchar(15) NOT NULL,
  `email` varchar(40) DEFAULT NULL,
  `titoloDiStudo` varchar(45) DEFAULT NULL,
  `pass` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`cod`),
  UNIQUE KEY `cod` (`cod`,`nDocumento`),
  KEY `idNazione` (`idNazione`),
  CONSTRAINT `civili_ibfk_1` FOREIGN KEY (`idNazione`) REFERENCES `nazioni` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `civili`
--

LOCK TABLES `civili` WRITE;
/*!40000 ALTER TABLE `civili` DISABLE KEYS */;
INSERT INTO `civili` VALUES ('C1','Geltrude','Tommaselli','1972-05-22','Pisa','FF452',110,NULL,NULL,NULL,NULL,NULL,'4443332','ger.tom@libero.it',NULL,'1234'),('C2','Danny','Trejo','1963-08-23','Mexico City','FF222',233,NULL,NULL,NULL,NULL,NULL,'44455532','machete@gmail.com',NULL,'asd123'),('C3','Chuck','Norris','1954-02-02','Houston','CN452',110,NULL,NULL,NULL,NULL,NULL,'4443332','chuck.norris@chuck.norris',NULL,'chucknorris');
/*!40000 ALTER TABLE `civili` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-30 11:13:11
