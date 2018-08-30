DROP DATABASE IF EXISTS anhandforhumanityDB;
CREATE SCHEMA IF NOT EXISTS anhandforhumanityDB;
USE anhandforhumanityDB;

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


-- -----------------------------------------------------
-- Table 'OrganizzazioneUmanitaria'.'NAZIONI'
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Nazioni
(
	id INT NOT NULL AUTO_INCREMENT,
    nazione VARCHAR(45) NOT NULL,
    
    UNIQUE(id, nazione),
    
    PRIMARY KEY (id)
);

-- -----------------------------------------------------
-- Table 'OrganizzazioneUmanitaria'.'COLLABORATORI'
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Collaboratori 
(
  cod VARCHAR(20) NOT NULL,
  
  UNIQUE(cod),
  
  PRIMARY KEY (cod)
);

-- -----------------------------------------------------
-- Table 'OrganizzazioneUmanitaria'.'Personale'
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Personale 
(
	cod VARCHAR(20) NOT NULL,
	nome VARCHAR(30) NOT NULL,
	cognome VARCHAR(35) NOT NULL,
    dataNascita DATE NOT NULL,
    luogoNascita VARCHAR(20) NOT NULL,
	nDocumento VARCHAR(15) NOT NULL,
	idNazione INT NOT NULL,
	provincia VARCHAR(30) NULL,
	citta VARCHAR(20) NOT NULL,
	CAP VARCHAR(10) NULL,
	via VARCHAR(30) NULL,
	nCivico INT NULL,
	telefono VARCHAR(15) NULL,
	email VARCHAR(40) NULL,
	pass VARCHAR(20) NULL,
	descrizioneQualifiche VARCHAR(140) NULL,
	ruolo VARCHAR(60) NULL,
	stipendioNominale FLOAT NULL,
	
    UNIQUE(cod, nDocumento),
  
    PRIMARY KEY (cod),
    FOREIGN KEY (idNazione) REFERENCES Nazioni(id) ON DELETE NO ACTION ON UPDATE CASCADE
);

-- -----------------------------------------------------
-- Table 'OrganizzazioneUmanitaria'.'SEDI'
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Sedi 
(
	id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL,
    idNazione INT NOT NULL,
    provincia VARCHAR(30) NOT NULL,
    citta VARCHAR(20) NOT NULL,
    CAP VARCHAR(10) NULL,
    via VARCHAR(30) NOT NULL,
    nCivico INT NULL,
    telefono VARCHAR(15) NULL,
    email VARCHAR(40) NULL,
    
    UNIQUE(id),
    
	PRIMARY KEY (id),
    FOREIGN KEY (idNazione) REFERENCES Nazioni(id) ON DELETE NO ACTION ON UPDATE CASCADE
);

-- -----------------------------------------------------
-- Table 'OrganizzazioneUmanitaria'.'MANSIONI'
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Mansioni 
(
	id INT NOT NULL AUTO_INCREMENT,
	descrizione VARCHAR(200) NOT NULL,
	dataInizio DATE NOT NULL,
	dataFine DATE NULL,
	idNazione INT NOT NULL,
	provincia VARCHAR(30) NULL,
    citta VARCHAR(20) NULL,
    CAP VARCHAR(10) NULL,
    via VARCHAR(30) NULL,
    nCivico INT NULL,
  
	UNIQUE(id),
  
	PRIMARY KEY (id),
    FOREIGN KEY (idNazione) REFERENCES Nazioni(id) ON DELETE NO ACTION ON UPDATE CASCADE
);

-- -----------------------------------------------------
-- Table 'OrganizzazioneUmanitaria'.'MovimentiBancari'
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS MovimentiBancari
(
	id INT NOT NULL AUTO_INCREMENT,
	descrizione VARCHAR(200) NOT NULL,
	giorno DATE NOT NULL,
    momento TIME NOT NULL,
	importo FLOAT NOT NULL,
	codTesoriere VARCHAR(20) NULL,
	codCollaboratore VARCHAR(20) NULL,
	
    UNIQUE(id),
    
    PRIMARY KEY (id),
    FOREIGN KEY (codCollaboratore) REFERENCES Collaboratori(cod) ON DELETE NO ACTION ON UPDATE CASCADE,
    FOREIGN KEY (codTesoriere) REFERENCES Personale(cod) ON DELETE NO ACTION ON UPDATE CASCADE
);

-- -----------------------------------------------------
-- Table 'OrganizzazioneUmanitaria'.'DITTE ESTERNE'
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS DitteEsterne
(
	cod VARCHAR(20) NOT NULL,
	ragioneSociale VARCHAR(30) NOT NULL,
	descrizione VARCHAR(100) NULL,
	sitoWeb VARCHAR(30) NULL,
	telefono VARCHAR(15) NULL,
	email VARCHAR(40) NULL,
  
	UNIQUE(cod, ragioneSociale),
  
	PRIMARY KEY (cod)
);

-- -----------------------------------------------------
-- Table 'OrganizzazioneUmanitaria'.'PARTNER'
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Partner
(
	cod VARCHAR(20) NOT NULL,
	nome VARCHAR(45) NOT NULL,
	descrizione VARCHAR(100) NULL,
	sitoWeb VARCHAR(30) NULL,
    telefono VARCHAR(15) NULL,
    email VARCHAR(40) NULL,
  
	UNIQUE(cod),
  
	PRIMARY KEY (cod)
);

-- -----------------------------------------------------
-- Table 'OrganizzazioneUmanitaria'.'CIVILI'
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Civili
(
	cod VARCHAR(20) NOT NULL,
	nome VARCHAR(30) NOT NULL,
	cognome VARCHAR(35) NOT NULL,
    dataNascita DATE NOT NULL,
    luogoNascita VARCHAR(20) NOT NULL,
	nDocumento VARCHAR(15) NULL,
	idNazione INT NOT NULL,
	provincia VARCHAR(30) NULL,
	citta VARCHAR(20) NULL,
	CAP VARCHAR(10) NULL,
	via VARCHAR(30) NULL,
	nCivico INT NULL,
	telefono VARCHAR(15) NOT NULL,
	email VARCHAR(40) NULL,
	titoloDiStudo VARCHAR(45) NULL,
	pass VARCHAR(30) NULL,
  
	UNIQUE(cod, nDocumento),
  
	PRIMARY KEY (cod),
    FOREIGN KEY (idNazione) REFERENCES Nazioni(id) ON DELETE NO ACTION ON UPDATE CASCADE
);

-- -----------------------------------------------------
-- Table 'OrganizzazioneUmanitaria'.'COLLABORA'
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS Collabora 
(
	codCollaboratore VARCHAR(20) NOT NULL,
	idMansione INT NOT NULL,
	descrizione VARCHAR(500),
	
    PRIMARY KEY (codCollaboratore, idMansione),

   FOREIGN KEY (codCollaboratore) REFERENCES Collaboratori(cod) ON DELETE NO ACTION ON UPDATE CASCADE,   
   FOREIGN KEY (idMansione) REFERENCES Mansioni(id) ON DELETE NO ACTION ON UPDATE CASCADE
);

-- -----------------------------------------------------
-- Table 'OrganizzazioneUmanitaria'.'IMPIEGATO'
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Impiegato
(
	codPersonale VARCHAR(20) NOT NULL,
	idSede INT NOT NULL,
	trasferta TINYINT(1) NOT NULL,
	dataInizio DATE NOT NULL,
	dataFine DATE NULL,
    
    PRIMARY KEY (codPersonale, idSede, dataInizio),
	FOREIGN KEY (codPersonale) REFERENCES Personale(cod) ON DELETE NO ACTION ON UPDATE CASCADE,
	FOREIGN KEY (idSede) REFERENCES Sedi(id) ON DELETE NO ACTION ON UPDATE CASCADE
);

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


-- -----------------------------------------------------
-- Trigger Personale
-- -----------------------------------------------------
delimiter |
CREATE TRIGGER cod_personale BEFORE INSERT ON Personale
FOR EACH ROW BEGIN

INSERT INTO Collaboratori SET Collaboratori.cod = NEW.cod;

END|

-- -----------------------------------------------------
-- Trigger Ditte
-- -----------------------------------------------------
delimiter |
CREATE TRIGGER cod_ditta BEFORE INSERT ON DitteEsterne
FOR EACH ROW BEGIN

INSERT INTO Collaboratori SET Collaboratori.cod = NEW.cod;

END|

-- -----------------------------------------------------
-- Trigger Partner
-- -----------------------------------------------------
delimiter |
CREATE TRIGGER cod_partner BEFORE INSERT ON Partner
FOR EACH ROW BEGIN

INSERT INTO Collaboratori SET Collaboratori.cod = NEW.cod;

END|

-- -----------------------------------------------------
-- Trigger Civili
-- -----------------------------------------------------
delimiter |
CREATE TRIGGER cod_civile BEFORE INSERT ON Civili
FOR EACH ROW BEGIN

INSERT INTO Collaboratori SET Collaboratori.cod = NEW.cod;

END|

-- -----------------------------------------------------
-- Trigger inserimento movimento
-- -----------------------------------------------------
delimiter |
CREATE TRIGGER inserimento_movimento BEFORE INSERT ON MovimentiBancari
FOR EACH ROW BEGIN

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
END|