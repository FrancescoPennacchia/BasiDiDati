USE anhandforhumanityDB;

CREATE USER 'Ospite'@'localhost' IDENTIFIED BY 'passOspite';
CREATE USER 'Personale'@'localhost' IDENTIFIED BY 'passPersonale';
CREATE USER 'Tesoriere'@'localhost' IDENTIFIED BY 'passTesoriere';
CREATE USER 'Amministratore'@'localhost' IDENTIFIED BY 'passAmministratore';

GRANT SELECT ON Nazioni TO 'Ospite'@'localhost';
GRANT SELECT ON Sedi TO 'Ospite'@'localhost';
GRANT SELECT ON Mansioni TO 'Ospite'@'localhost';
GRANT SELECT, UPDATE ON Civili TO 'Ospite'@'localhost';
GRANT SELECT ON Personale TO 'Ospite'@'localhost';
GRANT SELECT ON MovimentiBancari TO 'Ospite'@'localhost';

GRANT INSERT ON MovimentiBancari TO 'Ospite'@'localhost', 'Personale'@'localhost', 'Tesoriere'@'localhost', 'Amministratore'@'localhost';

GRANT SELECT ON * TO 'Personale'@'localhost', 'Tesoriere'@'localhost', 'Amministratore'@'localhost';
GRANT UPDATE ON Personale TO 'Personale'@'localhost', 'Tesoriere'@'localhost', 'Amministratore'@'localhost';
GRANT INSERT, UPDATE ON Collabora TO 'Personale'@'localhost', 'Tesoriere'@'localhost', 'Amministratore'@'localhost';

GRANT UPDATE ON MovimentiBancari TO 'Tesoriere'@'localhost';

GRANT INSERT ON Personale TO 'Amministratore'@'localhost';
GRANT INSERT, UPDATE ON Impiegato TO 'Amministratore'@'localhost';
GRANT INSERT, UPDATE ON DitteEsterne TO 'Amministratore'@'localhost';
GRANT INSERT, UPDATE ON Partner TO 'Amministratore'@'localhost';
GRANT INSERT, UPDATE ON Civili TO 'Amministratore'@'localhost';
GRANT UPDATE ON Sedi TO 'Amministratore'@'localhost';