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
-- Table structure for table `personale`
--

DROP TABLE IF EXISTS `personale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personale` (
  `cod` varchar(20) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `cognome` varchar(35) NOT NULL,
  `dataNascita` date NOT NULL,
  `luogoNascita` varchar(20) NOT NULL,
  `nDocumento` varchar(15) NOT NULL,
  `idNazione` int(11) NOT NULL,
  `provincia` varchar(30) DEFAULT NULL,
  `citta` varchar(20) NOT NULL,
  `CAP` varchar(10) DEFAULT NULL,
  `via` varchar(30) DEFAULT NULL,
  `nCivico` int(11) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `pass` varchar(20) DEFAULT NULL,
  `descrizioneQualifiche` varchar(140) DEFAULT NULL,
  `ruolo` varchar(60) DEFAULT NULL,
  `stipendioNominale` float DEFAULT NULL,
  PRIMARY KEY (`cod`),
  UNIQUE KEY `cod` (`cod`,`nDocumento`),
  KEY `idNazione` (`idNazione`),
  CONSTRAINT `personale_ibfk_1` FOREIGN KEY (`idNazione`) REFERENCES `nazioni` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personale`
--

LOCK TABLES `personale` WRITE;
/*!40000 ALTER TABLE `personale` DISABLE KEYS */;
INSERT INTO `personale` VALUES ('P1','Pippo','Laurenti','1985-01-01','Sora','AS444R',110,'Frosinone','Sora',NULL,NULL,NULL,'99933044','pippo.laurenti@gmail.com','trottolino','diploma in biologia, laurea in biologia','personale',1200),('P10','Danny','Williams','1991-04-16','Juneau','AA344F',233,'Alaska','Juneau',NULL,NULL,NULL,'9667788','danno@apple.me','cold','licensa media','tesoriere',600),('P11','Steven','Seguall','1976-05-22','Juneau','AA366F',233,'Alaska','Juneau',NULL,NULL,NULL,'9669988','stevs@gmail.com','verycold','licensa media, attestato istruttore arti marziali','personale',600),('P12','Jean Claude','Van Damme','1984-08-18','Juneau','AA388F',233,'Alaska','Juneau',NULL,NULL,NULL,'9897788','jcvd@yahoo.com','veryverycold','diploma alberghiero','amministratore',600),('P2','Tonio','Cartonio','1970-12-23','Cassino','AS655R',110,'Frosinone','Alvito',NULL,NULL,NULL,'8893244','tonio.cartonio@libero.it','ciccino','diploma in ragioneria, laurea in economia','tesoriere',1300),('P3','Pasquale','Benedetti','2000-06-01','Atina','AS635R',110,'Frosinone','Casalattico',NULL,NULL,NULL,'8223244','pbenedetti@gmail.com','ciccetto','licenza media','amministratore',1500),('P4','Antonio','Banderas','1985-01-01','Oviedo','SF121V',68,'Asturie','Oviedo',NULL,NULL,NULL,'8232244','a_banderas@hotmail.com','rosita','diploma istituto tecnico, laurea in recitazione drammatica','amministratore',1450),('P5','Penelope','Cruz','1960-07-22','Oviedo','SF123V',68,'Asturie','Oviedo',NULL,NULL,NULL,'82377744','cruz.penelope@gmail.com','rosetta','diploma liceo classico, laurea in recitazione drammatica','tesoriere',1350),('P6','Fulvios','Rodriguez','1995-06-30','Oviedo','SF333V',68,'Asturie','Oviedo',NULL,NULL,NULL,'82377554','frod@gmail.com','rosalinda','diploma istituto tecnico','personale',1250),('P7','Chin','O\'Kelly','1990-10-02','Honolulu','HH897S',233,'Hawaii','Honolulu',NULL,NULL,NULL,'8000044','chino@apple.me','aloha','diploma liceo scientifico, scuola di polizia','personale',1600),('P8','Kono','kalakaua','1955-09-05','Honolulu','HH844S',233,'Hawaii','Honolulu',NULL,NULL,NULL,'8111144','konokalakaua@yahoo.com','alohaola','diploma liceo classico','tesoriere',1800),('P9','Kame','Kona','1985-01-06','Honolulu','HH999S',233,'Hawaii','Honolulu',NULL,NULL,NULL,'8222244','kamekona@yahoo.com','alohaolaola','diploma alberghiero','amministratore',1600);
/*!40000 ALTER TABLE `personale` ENABLE KEYS */;
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
