-- Procedure delle query richieste
USE anhandforhumanityDB;
delimiter |


-- 1) Lista movimenti bancari relativi a un particolare collaboratore
drop procedure if exists MovimentiBancariCollaboratore|

create procedure MovimentiBancariCollaboratore(IN nome VARCHAR(35)) 
begin

	SELECT m.descrizione, m.giorno, m.momento, m.importo FROM MovimentiBancari as m JOIN Collaboratori AS c ON (m.codCollaboratore = c.cod) JOIN Partner AS p ON (c.cod = p.cod) WHERE p.nome = nome 
UNION
SELECT m.descrizione, m.giorno, m.momento, m.importo FROM MovimentiBancari as m JOIN Collaboratori AS c ON (m.codCollaboratore = c.cod) JOIN ditteesterne AS p ON (c.cod = p.cod) WHERE p.ragioneSociale = nome 
UNION 
SELECT m.descrizione, m.giorno, m.momento, m.importo FROM MovimentiBancari as m JOIN Collaboratori AS c ON (m.codCollaboratore = c.cod) JOIN personale AS p ON (c.cod = p.cod) WHERE p.nome = nome 
UNION 
SELECT m.descrizione, m.giorno, m.momento, m.importo FROM MovimentiBancari as m JOIN Collaboratori AS c ON (m.codCollaboratore = c.cod) JOIN civili AS p ON (c.cod = p.cod) WHERE p.nome = nome;

    
end|
call MovimentiBancariCollaboratore('unicef')|


-- 2) Lista movimenti bancari ordinati da un membro specifico del personale
drop procedure if exists MovimentiBancariPersonale|

create procedure MovimentiBancariPersonale(IN nome VARCHAR(35), IN cognome VARCHAR(35)) 
begin

	 SELECT m.descrizione, m.giorno, m.momento, m.importo FROM MovimentiBancari as m JOIN Personale AS p ON (m.codTesoriere = p.cod) WHERE p.nome = nome AND p.cognome = cognome; 
    
end|
call MovimentiBancariPersonale('Tonio', 'Cartonio')|

-- 3) Numero di membri del personale che hanno effettuato movimenti bancari a favore di un certo collaboratore
drop procedure if exists MBPersonaleVersoCollaboratori|
create procedure MBPersonaleVersoCollaboratori(IN nome VARCHAR(35)) 
begin

	SELECT COUNT(DISTINCT pe.cod) AS Numero FROM personale AS pe JOIN movimentibancari AS mb ON (pe.cod = mb.codTesoriere) JOIN Collaboratori AS c ON (mb.codCollaboratore = c.cod) JOIN Partner AS p ON (c.cod = p.cod) WHERE p.nome = nome AND mb.importo < 0
	UNION
	SELECT COUNT(DISTINCT pe.cod) AS Numero FROM personale AS pe JOIN movimentibancari AS mb ON (pe.cod = mb.codTesoriere) JOIN Collaboratori AS c ON (mb.codCollaboratore = c.cod) JOIN ditteesterne AS p ON (c.cod = p.cod) WHERE p.ragioneSociale = nome AND mb.importo < 0
	UNION
	SELECT COUNT(DISTINCT pe.cod) AS Numero FROM personale AS pe JOIN movimentibancari AS mb ON (pe.cod = mb.codTesoriere) JOIN Collaboratori AS c ON (mb.codCollaboratore = c.cod) JOIN personale AS p ON (c.cod = p.cod) WHERE p.nome = nome AND mb.importo < 0
	UNION
	SELECT COUNT(DISTINCT pe.cod) AS Numero FROM personale AS pe JOIN movimentibancari AS mb ON (pe.cod = mb.codTesoriere) JOIN Collaboratori AS c ON (mb.codCollaboratore = c.cod) JOIN civili AS p ON (c.cod = p.cod) WHERE p.nome = nome AND mb.importo < 0;
    
end|
call MBPersonaleVersoCollaboratori('WWF')|

-- 4) Importo totale versato ad un collaboratore in un intervallo di anni
drop procedure if exists VersatoIntervalloAnni|

create procedure VersatoIntervalloAnni(IN nome VARCHAR(35),IN cognome VARCHAR(35), IN DataIn DATE, IN DataFi DATE) 
begin

	SELECT SUM(mb.importo) AS TotaleVersato FROM movimentibancari AS mb JOIN personale AS p ON(p.cod = mb.codCollaboratore) WHERE mb.importo < 0 AND p.nome = nome AND p.cognome = cognome AND mb.giorno > DataIn AND mb.giorno < DataFi;
    
end|
call VersatoIntervalloAnni('Tonio', 'Cartonio', '2016-01-01', '2017-12-31')|


-- 5) Sedi dalle quali sono partiti i trasferimenti più ingenti (verso qualsiasi collaboratore)
drop procedure if exists SediTrasferimentiIngenti|

create procedure SediTrasferimentiIngenti() 
begin
	
    SELECT s.nome, SUM(mb.importo) AS Trasferimenti FROM movimentibancari AS mb JOIN personale AS p ON(mb.codTesoriere = p.cod) JOIN impiegato AS i ON(p.cod = i.codPersonale) JOIN sedi AS s ON(i.idSede = s.id) WHERE mb.importo < 0 GROUP BY s.id;
    
end|
call SediTrasferimentiIngenti()|

-- 6) Somme totali pagate in un certo periodo di tempo (intervallo di date) suddivise in base al tipo di collaboratore che le ha ricevute
drop procedure if exists SommePagate|

create procedure SommePagate(IN DataIn DATE, IN DataFi DATE) 
begin
	
    SELECT SUM(mb.importo) AS importo, p.nome AS NomeCollaboratore FROM movimentibancari AS mb JOIN collaboratori AS c ON(mb.codCollaboratore = c.cod) JOIN personale AS p ON(c.cod = p.cod) WHERE mb.importo < 0 AND mb.giorno > DataIn AND mb.giorno < DataFi GROUP BY c.cod
	UNION
	SELECT SUM(mb.importo) AS importo, pa.nome AS NomeCollaboratore FROM movimentibancari AS mb JOIN collaboratori AS c ON(mb.codCollaboratore = c.cod) JOIN partner AS pa ON(c.cod = pa.cod) WHERE mb.importo < 0 AND mb.giorno > DataIn AND mb.giorno < DataFi GROUP BY c.cod
	UNION
	SELECT SUM(mb.importo) AS importo, de.ragioneSociale  AS NomeCollaboratore FROM movimentibancari AS mb JOIN collaboratori AS c ON(mb.codCollaboratore = c.cod) JOIN ditteesterne AS de ON(c.cod = de.cod) WHERE mb.importo < 0 AND mb.giorno > DataIn AND mb.giorno < DataFi GROUP BY c.cod
	UNION
	SELECT SUM(mb.importo) AS importo, p.nome AS NomeCollaboratore FROM movimentibancari AS mb JOIN collaboratori AS c ON(mb.codCollaboratore = c.cod) JOIN civili AS p ON(c.cod = p.cod) WHERE mb.importo < 0 AND mb.giorno > DataIn AND mb.giorno < DataFi GROUP BY c.cod;
    
end|
call SommePagate('2016-01-01','2018-12-31')|

-- 7) Lista delle nazioni in cui l'organizzazione opera, e numero collaboratori operanti in ciascuna di esse
drop procedure if exists NazioniCollaboratori|

create procedure NazioniCollaboratori() 
begin
	
    SELECT n.nazione, COUNT(co.cod) AS NumeroDiCollaboratori FROM nazioni AS n JOIN mansioni AS m ON(n.id = m.id) JOIN collabora AS c ON(m.id = c.idMansione) JOIN collaboratori AS co ON(c.codCollaboratore = co.cod) GROUP BY n.nazione;
    
end|
call NazioniCollaboratori()|

-- 8) Lista temporale ordinata delle trasferte di un membro del personale
drop procedure if exists TasfertePersonale|

create procedure TasfertePersonale(IN nome VARCHAR(35), IN cognome VARCHAR(35)) 
begin

	 SELECT i.dataInizio AS DataInizio, i.dataFine AS DataFine FROM personale AS p JOIN impiegato AS i ON(p.cod = i.codPersonale) WHERE p.nome = nome AND p.cognome = cognome AND i.trasferta = 1 ORDER BY i.dataInizio;
    
end|
call TasfertePersonale('Pippo', 'Laurenti')|

-- 9) Sedi presso le quali vengono fatte le trasferte più lunghe
drop procedure if exists SediTrasferteLunghe|

create procedure SediTrasferteLunghe() 
begin
	
    SELECT s.nome AS NomeSede, MAX(DATEDIFF(i.dataFine,i.dataInizio)) AS Durata FROM sedi AS s JOIN impiegato AS i ON(s.id = i.idSede) WHERE i.trasferta = 1 GROUP BY s.id ORDER BY Durata DESC;
    
end|
call SediTrasferteLunghe()|

-- 10) Nazioni dalle quali provengono i membri del personale e numero degli stessi
drop procedure if exists NazioniProvenienzaPersonale|

create procedure NazioniProvenienzaPersonale() 
begin
	
    SELECT n.nazione, COUNT(p.cod) AS NumeroPersonalePerNazione FROM nazioni AS n JOIN personale AS p ON (n.id = p.idNazione) GROUP BY n.id;
    
end|
call NazioniProvenienzaPersonale()|







