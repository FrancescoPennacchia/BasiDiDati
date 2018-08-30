-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versione server:              5.7.11-log - MySQL Community Server (GPL)
-- S.O. server:                  Win64
-- HeidiSQL Versione:            9.1.0.4867
-- --------------------------------------------------------


-- Dump della struttura del database anhandforhumanity
DROP DATABASE IF EXISTS `anhandforhumanity`;
CREATE DATABASE IF NOT EXISTS `anhandforhumanity`;
USE `anhandforhumanity`;

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
--  $$$$$$\                                          $$\                                     $$$$$$$$\        $$\                 $$\ $$\           
-- $$  __$$\                                         \__|                                    \__$$  __|       $$ |                $$ |$$ |          
-- $$ /  \__| $$$$$$\   $$$$$$\   $$$$$$\  $$$$$$$$\ $$\  $$$$$$\  $$$$$$$\   $$$$$$\           $$ | $$$$$$\  $$$$$$$\   $$$$$$\  $$ |$$ | $$$$$$\  
-- $$ |      $$  __$$\ $$  __$$\  \____$$\ \____$$  |$$ |$$  __$$\ $$  __$$\ $$  __$$\          $$ | \____$$\ $$  __$$\ $$  __$$\ $$ |$$ |$$  __$$\ 
-- $$ |      $$ |  \__|$$$$$$$$ | $$$$$$$ |  $$$$ _/ $$ |$$ /  $$ |$$ |  $$ |$$$$$$$$ |         $$ | $$$$$$$ |$$ |  $$ |$$$$$$$$ |$$ |$$ |$$$$$$$$ |
-- $$ |  $$\ $$ |      $$   ____|$$  __$$ | $$  _/   $$ |$$ |  $$ |$$ |  $$ |$$   ____|         $$ |$$  __$$ |$$ |  $$ |$$   ____|$$ |$$ |$$   ____|
-- \$$$$$$  |$$ |      \$$$$$$$\ \$$$$$$$ |$$$$$$$$\ $$ |\$$$$$$  |$$ |  $$ |\$$$$$$$\          $$ |\$$$$$$$ |$$$$$$$  |\$$$$$$$\ $$ |$$ |\$$$$$$$\ 
--  \______/ \__|       \_______| \_______|\________|\__| \______/ \__|  \__| \_______|         \__| \_______|\_______/  \_______|\__|\__| \_______|
-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Dump della struttura di tabella anhandforhumanity.civili
CREATE TABLE IF NOT EXISTS `civili` (
  `cod` varchar(20) COLLATE utf8_estonian_ci NOT NULL,
  `nome` varchar(30) COLLATE utf8_estonian_ci NOT NULL,
  `cognome` varchar(35) COLLATE utf8_estonian_ci NOT NULL,
  `dataNascita` date NOT NULL,
  `luogoNascita` varchar(20) COLLATE utf8_estonian_ci NOT NULL,
  `nDocumento` varchar(15) COLLATE utf8_estonian_ci DEFAULT NULL,
  `idNazione` int(11) NOT NULL,
  `provincia` varchar(30) COLLATE utf8_estonian_ci DEFAULT NULL,
  `citta` varchar(20) COLLATE utf8_estonian_ci DEFAULT NULL,
  `CAP` varchar(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `via` varchar(30) COLLATE utf8_estonian_ci DEFAULT NULL,
  `nCivico` int(11) DEFAULT NULL,
  `telefono` varchar(15) COLLATE utf8_estonian_ci NOT NULL,
  `email` varchar(40) COLLATE utf8_estonian_ci DEFAULT NULL,
  `titoloDiStudo` varchar(45) COLLATE utf8_estonian_ci DEFAULT NULL,
  `pass` varchar(30) COLLATE utf8_estonian_ci DEFAULT NULL,
  PRIMARY KEY (`cod`),
  UNIQUE KEY `cod` (`cod`,`nDocumento`),
  KEY `IdNazione` (`idNazione`),
  CONSTRAINT `cUbicato` FOREIGN KEY (`idNazione`) REFERENCES `nazioni` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

-- Dump della struttura di tabella anhandforhumanity.collabora
CREATE TABLE IF NOT EXISTS `collabora` (
  `codCollaboratore` varchar(20) COLLATE utf8_estonian_ci NOT NULL,
  `idMansione` int(11) NOT NULL,
  `descrizione` varchar(500) COLLATE utf8_estonian_ci DEFAULT NULL,
  PRIMARY KEY (`codCollaboratore`,`idMansione`),
  KEY `idMansione` (`idMansione`),
  CONSTRAINT `FK_collabora_collaboratori` FOREIGN KEY (`codCollaboratore`) REFERENCES `collaboratori` (`cod`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_collabora_mansioni` FOREIGN KEY (`idMansione`) REFERENCES `mansioni` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

-- Dump della struttura di tabella anhandforhumanity.collaboratori
CREATE TABLE IF NOT EXISTS `collaboratori` (
  `cod` varchar(20) COLLATE utf8_estonian_ci NOT NULL,
  PRIMARY KEY (`cod`),
  UNIQUE KEY `cod` (`cod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

-- Dump della struttura di tabella anhandforhumanity.ditteesterne
CREATE TABLE IF NOT EXISTS `ditteesterne` (
  `cod` varchar(20) COLLATE utf8_estonian_ci NOT NULL,
  `ragioneSociale` varchar(30) COLLATE utf8_estonian_ci NOT NULL,
  `descrizione` varchar(100) COLLATE utf8_estonian_ci DEFAULT NULL,
  `sitoWeb` varchar(30) COLLATE utf8_estonian_ci DEFAULT NULL,
  `telefono` varchar(15) COLLATE utf8_estonian_ci DEFAULT NULL,
  `email` varchar(40) COLLATE utf8_estonian_ci DEFAULT NULL,
  PRIMARY KEY (`cod`),
  UNIQUE KEY `cod` (`cod`,`ragioneSociale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

-- Dump della struttura di tabella anhandforhumanity.impiegato
CREATE TABLE IF NOT EXISTS `impiegato` (
  `codPersonale` varchar(20) COLLATE utf8_estonian_ci NOT NULL,
  `idSede` int(11) NOT NULL,
  `trasferta` tinyint(1) NOT NULL,
  `dataInizio` date NOT NULL,
  `dataFine` date DEFAULT NULL,
  PRIMARY KEY (`codPersonale`,`idSede`,`dataInizio`),
  KEY `idSede` (`idSede`),
  CONSTRAINT `FK_impiegato_personale` FOREIGN KEY (`codPersonale`) REFERENCES `personale` (`cod`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_impiegato_sedi` FOREIGN KEY (`idSede`) REFERENCES `sedi` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

-- Dump della struttura di tabella anhandforhumanity.mansioni
CREATE TABLE IF NOT EXISTS `mansioni` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descrizione` varchar(200) COLLATE utf8_estonian_ci NOT NULL,
  `dataInizio` date NOT NULL,
  `dataFine` date DEFAULT NULL,
  `idNazione` int(11) NOT NULL,
  `provincia` varchar(30) COLLATE utf8_estonian_ci DEFAULT NULL,
  `citta` varchar(20) COLLATE utf8_estonian_ci DEFAULT NULL,
  `CAP` varchar(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `via` varchar(30) COLLATE utf8_estonian_ci DEFAULT NULL,
  `nCivico` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `IdNazione` (`idNazione`),
  CONSTRAINT `mUbicata` FOREIGN KEY (`idNazione`) REFERENCES `nazioni` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

-- Dump della struttura di tabella anhandforhumanity.movimentibancari
CREATE TABLE IF NOT EXISTS `movimentibancari` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descrizione` varchar(200) COLLATE utf8_estonian_ci NOT NULL,
  `giorno` date NOT NULL,
  `momento` time NOT NULL,
  `importo` float NOT NULL,
  `codTesoriere` varchar(20) COLLATE utf8_estonian_ci DEFAULT NULL,
  `codCollaboratore` varchar(20) COLLATE utf8_estonian_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `codTesoriere` (`codTesoriere`),
  KEY `codCollaboratore` (`codCollaboratore`),
  CONSTRAINT `Gestisce` FOREIGN KEY (`codTesoriere`) REFERENCES `personale` (`cod`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `Transazione` FOREIGN KEY (`codCollaboratore`) REFERENCES `collaboratori` (`cod`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

-- Dump della struttura di tabella anhandforhumanity.nazioni
CREATE TABLE IF NOT EXISTS `nazioni` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nazione` varchar(45) COLLATE utf8_estonian_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`,`nazione`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

-- Dump della struttura di tabella anhandforhumanity.partner
CREATE TABLE IF NOT EXISTS `partner` (
  `cod` varchar(20) COLLATE utf8_estonian_ci NOT NULL,
  `nome` varchar(45) COLLATE utf8_estonian_ci NOT NULL,
  `descrizione` varchar(100) COLLATE utf8_estonian_ci DEFAULT NULL,
  `sitoWeb` varchar(30) COLLATE utf8_estonian_ci DEFAULT NULL,
  `telefono` varchar(15) COLLATE utf8_estonian_ci DEFAULT NULL,
  `email` varchar(40) COLLATE utf8_estonian_ci DEFAULT NULL,
  PRIMARY KEY (`cod`),
  UNIQUE KEY `cod` (`cod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

-- Dump della struttura di tabella anhandforhumanity.personale
CREATE TABLE IF NOT EXISTS `personale` (
  `cod` varchar(20) COLLATE utf8_estonian_ci NOT NULL,
  `nome` varchar(30) COLLATE utf8_estonian_ci NOT NULL,
  `cognome` varchar(35) COLLATE utf8_estonian_ci NOT NULL,
  `dataNascita` date NOT NULL,
  `luogoNascita` varchar(20) COLLATE utf8_estonian_ci NOT NULL,
  `nDocumento` varchar(15) COLLATE utf8_estonian_ci NOT NULL,
  `idNazione` int(11) NOT NULL,
  `provincia` varchar(30) COLLATE utf8_estonian_ci DEFAULT NULL,
  `citta` varchar(20) COLLATE utf8_estonian_ci NOT NULL,
  `CAP` varchar(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `via` varchar(30) COLLATE utf8_estonian_ci DEFAULT NULL,
  `nCivico` int(11) DEFAULT NULL,
  `telefono` varchar(15) COLLATE utf8_estonian_ci DEFAULT NULL,
  `email` varchar(40) COLLATE utf8_estonian_ci DEFAULT NULL,
  `pass` varchar(20) COLLATE utf8_estonian_ci DEFAULT NULL,
  `descrizioneQualifiche` varchar(140) COLLATE utf8_estonian_ci DEFAULT NULL,
  `ruolo` varchar(60) COLLATE utf8_estonian_ci DEFAULT NULL,
  `stipendioNominale` float DEFAULT NULL,
  PRIMARY KEY (`cod`),
  UNIQUE KEY `cod` (`cod`,`nDocumento`),
  KEY `IdNazione` (`idNazione`),
  CONSTRAINT `pUbicato` FOREIGN KEY (`idNazione`) REFERENCES `nazioni` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

-- Dump della struttura di tabella anhandforhumanity.sedi
CREATE TABLE IF NOT EXISTS `sedi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) COLLATE utf8_estonian_ci NOT NULL,
  `idNazione` int(11) NOT NULL,
  `provincia` varchar(30) COLLATE utf8_estonian_ci NOT NULL,
  `citta` varchar(20) COLLATE utf8_estonian_ci NOT NULL,
  `CAP` varchar(10) COLLATE utf8_estonian_ci DEFAULT NULL,
  `via` varchar(30) COLLATE utf8_estonian_ci NOT NULL,
  `nCivico` int(11) DEFAULT NULL,
  `telefono` varchar(15) COLLATE utf8_estonian_ci DEFAULT NULL,
  `email` varchar(40) COLLATE utf8_estonian_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `IdNazione` (`idNazione`),
  CONSTRAINT `sUbicata` FOREIGN KEY (`idNazione`) REFERENCES `nazioni` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
--   $$\               $$\                                                   
--   $$ |              \__|                                                  
-- $$$$$$\    $$$$$$\  $$\  $$$$$$\   $$$$$$\   $$$$$$\   $$$$$$\   $$$$$$$\ 
-- \_$$  _|  $$  __$$\ $$ |$$  __$$\ $$  __$$\ $$  __$$\ $$  __$$\ $$  _____|
--   $$ |    $$ |  \__|$$ |$$ /  $$ |$$ /  $$ |$$$$$$$$ |$$ |  \__|\$$$$$$\  
--   $$ |$$\ $$ |      $$ |$$ |  $$ |$$ |  $$ |$$   ____|$$ |       \____$$\ 
--   \$$$$  |$$ |      $$ |\$$$$$$$ |\$$$$$$$ |\$$$$$$$\ $$ |      $$$$$$$  |
--    \____/ \__|      \__| \____$$ | \____$$ | \_______|\__|      \_______/ 
--                         $$\   $$ |$$\   $$ |                              
--                         \$$$$$$  |\$$$$$$  |                              
--                          \______/  \______/                              
-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Dump della struttura di trigger anhandforhumanity.cod_civile
DELIMITER //
CREATE TRIGGER `cod_civile` BEFORE INSERT ON `civili` FOR EACH ROW BEGIN

INSERT INTO Collaboratori SET Collaboratori.cod = NEW.cod;

END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


-- Dump della struttura di trigger anhandforhumanity.cod_ditta
-- SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `cod_ditta` BEFORE INSERT ON `ditteesterne` FOR EACH ROW BEGIN

INSERT INTO Collaboratori SET Collaboratori.cod = NEW.cod;

END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


-- Dump della struttura di trigger anhandforhumanity.cod_partner
-- SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `cod_partner` BEFORE INSERT ON `partner` FOR EACH ROW BEGIN

INSERT INTO Collaboratori SET Collaboratori.cod = NEW.cod;

END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


-- Dump della struttura di trigger anhandforhumanity.cod_personale
-- SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `cod_personale` BEFORE INSERT ON `personale` FOR EACH ROW BEGIN

INSERT INTO Collaboratori SET Collaboratori.cod = NEW.cod;

END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


-- Dump della struttura di trigger anhandforhumanity.inserimento_movimento
DELIMITER //
CREATE TRIGGER `inserimento_movimento` BEFORE INSERT ON `movimentibancari` FOR EACH ROW BEGIN

IF (SELECT ruolo FROM Personale WHERE cod = new.codTesoriere) <> "tesoriere"
THEN
	signal sqlstate '45000';
    
	ELSE
		IF (NEW.giorno = '0000-00-00') 
        THEN
			SET NEW.giorno = current_date;
		END IF;
        
        IF (NEW.momento = '00:00:00')
        THEN
			SET NEW.momento = current_time;
		END IF;

END IF;
END//
DELIMITER ; 

SET SQL_MODE=@OLDTMP_SQL_MODE;