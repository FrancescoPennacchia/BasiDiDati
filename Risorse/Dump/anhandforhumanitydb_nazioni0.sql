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
-- Table structure for table `nazioni`
--

DROP TABLE IF EXISTS `nazioni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nazioni` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nazione` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`,`nazione`)
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nazioni`
--

LOCK TABLES `nazioni` WRITE;
/*!40000 ALTER TABLE `nazioni` DISABLE KEYS */;
INSERT INTO `nazioni` VALUES (1,'Andorra'),(2,'United Arab Emirates'),(3,'Afghanistan'),(4,'Antigua and Barbuda'),(5,'Anguilla'),(6,'Albania'),(7,'Armenia'),(8,'Angola'),(9,'Antarctica'),(10,'Argentina'),(11,'American Samoa'),(12,'Austria'),(13,'Australia'),(14,'Aruba'),(15,'aland'),(16,'Azerbaijan'),(17,'Bosnia and Herzegovina'),(18,'Barbados'),(19,'Bangladesh'),(20,'Belgium'),(21,'Burkina Faso'),(22,'Bulgaria'),(23,'Bahrain'),(24,'Burundi'),(25,'Benin'),(26,'Saint Barthelemy'),(27,'Bermuda'),(28,'Brunei'),(29,'Bolivia'),(30,'Bonaire'),(31,'Brazil'),(32,'Bahamas'),(33,'Bhutan'),(34,'Bouvet Island'),(35,'Botswana'),(36,'Belarus'),(37,'Belize'),(38,'Canada'),(39,'Cocos [Keeling] Islands'),(40,'Democratic Republic of the Congo'),(41,'Central African Republic'),(42,'Republic of the Congo'),(43,'Switzerland'),(44,'Ivory Coast'),(45,'Cook Islands'),(46,'Chile'),(47,'Cameroon'),(48,'China'),(49,'Colombia'),(50,'Costa Rica'),(51,'Cuba'),(52,'Cape Verde'),(53,'Curacao'),(54,'Christmas Island'),(55,'Cyprus'),(56,'Czech Republic'),(57,'Germany'),(58,'Djibouti'),(59,'Denmark'),(60,'Dominica'),(61,'Dominican Republic'),(62,'Algeria'),(63,'Ecuador'),(64,'Estonia'),(65,'Egypt'),(66,'Western Sahara'),(67,'Eritrea'),(68,'Spain'),(69,'Ethiopia'),(70,'Finland'),(71,'Fiji'),(72,'Falkland Islands'),(73,'Micronesia'),(74,'Faroe Islands'),(75,'France'),(76,'Gabon'),(77,'United Kingdom'),(78,'Grenada'),(79,'Georgia'),(80,'French Guiana'),(81,'Guernsey'),(82,'Ghana'),(83,'Gibraltar'),(84,'Greenland'),(85,'Gambia'),(86,'Guinea'),(87,'Guadeloupe'),(88,'Equatorial Guinea'),(89,'Greece'),(90,'South Georgia and the South Sandwich Islands'),(91,'Guatemala'),(92,'Guam'),(93,'Guinea-Bissau'),(94,'Guyana'),(95,'Hong Kong'),(96,'Heard Island and McDonald Islands'),(97,'Honduras'),(98,'Croatia'),(99,'Haiti'),(100,'Hungary'),(101,'Indonesia'),(102,'Ireland'),(103,'Israel'),(104,'Isle of Man'),(105,'India'),(106,'British Indian Ocean Territory'),(107,'Iraq'),(108,'Iran'),(109,'Iceland'),(110,'Italy'),(111,'Jersey'),(112,'Jamaica'),(113,'Jordan'),(114,'Japan'),(115,'Kenya'),(116,'Kyrgyzstan'),(117,'Cambodia'),(118,'Kiribati'),(119,'Comoros'),(120,'Saint Kitts and Nevis'),(121,'North Korea'),(122,'South Korea'),(123,'Kuwait'),(124,'Cayman Islands'),(125,'Kazakhstan'),(126,'Laos'),(127,'Lebanon'),(128,'Saint Lucia'),(129,'Liechtenstein'),(130,'Sri Lanka'),(131,'Liberia'),(132,'Lesotho'),(133,'Lithuania'),(134,'Luxembourg'),(135,'Latvia'),(136,'Libya'),(137,'Morocco'),(138,'Monaco'),(139,'Moldova'),(140,'Montenegro'),(141,'Saint Martin'),(142,'Madagascar'),(143,'Marshall Islands'),(144,'Macedonia'),(145,'Mali'),(146,'Myanmar [Burma]'),(147,'Mongolia'),(148,'Macao'),(149,'Northern Mariana Islands'),(150,'Martinique'),(151,'Mauritania'),(152,'Montserrat'),(153,'Malta'),(154,'Mauritius'),(155,'Maldives'),(156,'Malawi'),(157,'Mexico'),(158,'Malaysia'),(159,'Mozambique'),(160,'Namibia'),(161,'New Caledonia'),(162,'Niger'),(163,'Norfolk Island'),(164,'Nigeria'),(165,'Nicaragua'),(166,'Netherlands'),(167,'Norway'),(168,'Nepal'),(169,'Nauru'),(170,'Niue'),(171,'New Zealand'),(172,'Oman'),(173,'Panama'),(174,'Peru'),(175,'French Polynesia'),(176,'Papua New Guinea'),(177,'Philippines'),(178,'Pakistan'),(179,'Poland'),(180,'Saint Pierre and Miquelon'),(181,'Pitcairn Islands'),(182,'Puerto Rico'),(183,'Palestine'),(184,'Portugal'),(185,'Palau'),(186,'Paraguay'),(187,'Qatar'),(188,'Reunion'),(189,'Romania'),(190,'Serbia'),(191,'Russia'),(192,'Rwanda'),(193,'Saudi Arabia'),(194,'Solomon Islands'),(195,'Seychelles'),(196,'Sudan'),(197,'Sweden'),(198,'Singapore'),(199,'Saint Helena'),(200,'Slovenia'),(201,'Svalbard and Jan Mayen'),(202,'Slovakia'),(203,'Sierra Leone'),(204,'San Marino'),(205,'Senegal'),(206,'Somalia'),(207,'Suriname'),(208,'South Sudan'),(209,'Sao Tome and Principe'),(210,'El Salvador'),(211,'Sint Maarten'),(212,'Syria'),(213,'Swaziland'),(214,'Turks and Caicos Islands'),(215,'Chad'),(216,'French Southern Territories'),(217,'Togo'),(218,'Thailand'),(219,'Tajikistan'),(220,'Tokelau'),(221,'East Timor'),(222,'Turkmenistan'),(223,'Tunisia'),(224,'Tonga'),(225,'Turkey'),(226,'Trinidad and Tobago'),(227,'Tuvalu'),(228,'Taiwan'),(229,'Tanzania'),(230,'Ukraine'),(231,'Uganda'),(232,'U.S. Minor Outlying Islands'),(233,'United States'),(234,'Uruguay'),(235,'Uzbekistan'),(236,'Vatican City'),(237,'Saint Vincent and the Grenadines'),(238,'Venezuela'),(239,'British Virgin Islands'),(240,'U.S. Virgin Islands'),(241,'Vietnam'),(242,'Vanuatu'),(243,'Wallis and Futuna'),(244,'Samoa'),(245,'Kosovo'),(246,'Yemen'),(247,'Mayotte'),(248,'South Africa'),(249,'Zambia'),(250,'Zimbabwe');
/*!40000 ALTER TABLE `nazioni` ENABLE KEYS */;
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
