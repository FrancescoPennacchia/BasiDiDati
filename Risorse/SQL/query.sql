USE anhandforhumanityDB;

-- 1) Estrarre il personale che lavora attualmente in ogni sede, escluso il personale in trasferta
 SELECT p.nome, p.cognome, p.dataNascita, p.luogoNascita, s.nome, n.nazione FROM Personale AS p JOIN Impiegato as i ON (p.cod = i.codPersonale) JOIN Sedi AS s ON (i.idSede = s.id) JOIN Nazioni AS n ON (s.idNazione = n.id) WHERE i.dataFine IS NULL AND i.trasferta = 0;

-- 2) Contare il personale che lavora attualmente in ogni sede, escluso il personale in trasferta
 SELECT s.nome, n.nazione, COUNT(*) AS N_dipendenti FROM Personale AS p JOIN Impiegato as i ON (p.cod = i.codPersonale) JOIN Sedi AS s ON (i.idSede = s.id) JOIN Nazioni AS n ON (s.idNazione = n.id) WHERE i.dataFine IS NULL AND i.trasferta = 0 GROUP BY s.nome, n.nazione;

-- 3) Contare quanti dipendenti attualmente lavorano nella sede “una mano per l’umanità”, non in trasferta
 SELECT s.nome, n.nazione, COUNT(*) AS N_dipendenti FROM Personale AS p JOIN Impiegato as i ON (p.cod = i.codPersonale) JOIN Sedi AS s ON (i.idSede = s.id) JOIN Nazioni AS n ON (s.idNazione = n.id) WHERE i.dataFine IS NULL AND i.trasferta = 0 AND s.nome = "una mano per l'umanita'" GROUP BY s.nome, n.nazione;

-- 4) Estrarre il personale che lavora attualmente nella sede “una mano per l’umanità”, escluso il personale in trasferta
 SELECT p.nome, p.cognome, p.dataNascita, p.luogoNascita FROM Personale AS p JOIN Impiegato as i ON (p.cod = i.codPersonale) JOIN Sedi AS s ON (i.idSede = s.id) WHERE i.dataFine IS NULL AND i.trasferta = 0 AND s.nome = "una mano per l'umanita'";

-- 5) Contare le trasferte effettuate da ogni membro del personale
 SELECT p.nome, p.cognome, p.dataNascita, p.luogoNascita, COUNT(*) AS NumeroTrasferte FROM Personale AS p JOIN Impiegato as i ON (p.cod = i.codPersonale) WHERE i.trasferta = 1 GROUP BY p.cod;

-- 6) Estrarre le generalità delle persone che non lavorano più per l'organizzazione
 SELECT DISTINCT p.nome, p.cognome, p.dataNascita, p.luogoNascita FROM Personale AS p JOIN Impiegato AS i ON (p.cod = i.codPersonale) WHERE p.cod NOT IN(SELECT p1.cod FROM Personale AS p1 JOIN Impiegato AS i1 ON (p1.cod = i1.codPersonale) WHERE i1.dataFine IS NULL);

-- 7) Estrarre le generalità del personale in trasferta nella sede di "i ka lima no ka mea"
 SELECT p.nome, p.cognome, p.dataNascita, p.luogoNascita FROM Personale AS p JOIN Impiegato as i ON (p.cod = i.codPersonale) JOIN Sedi AS s ON (i.idSede = s.id) WHERE i.trasferta = 1 AND s.nome = 'i ka lima no ka mea' AND i.dataFine IS NULL;

-- 8) Estratte il codice di chiunque abbia partecipato a qualunque mansione "soup kitchen"
 SELECT c.cod FROM Collaboratori AS c JOIN collabora AS co ON (co.codCollaboratore = c.cod) JOIN Mansioni as m ON (m.id = co.idMansione) WHERE m.descrizione = 'soup kitchen';

-- 9) Estrarre le generalità del personale che ha partecipato a qualunque mansione "soup kitchen"
 SELECT DISTINCT p.nome, p.cognome, p.dataNascita, p.luogoNascita FROM Personale AS p JOIN Collaboratori AS co ON(p.cod = co.cod) JOIN Collabora AS c ON(co.cod = c.codCollaboratore) JOIN Mansioni AS m ON(c.idMansione = m.id) WHERE m.descrizione = 'soup kitchen';

-- 10) Estrarre il nome dei partner che hanno partecipato a qualunque mansione "soup kitchen"
 SELECT DISTINCT pa.nome  FROM Partner AS pa JOIN Collaboratori AS co ON(pa.cod = co.cod) JOIN Collabora AS c ON(co.cod = c.codCollaboratore) JOIN Mansioni AS m ON(c.idMansione = m.id) WHERE m.descrizione = 'soup kitchen';

-- 11) Estrarre la ragione sociale delle ditte che hanno partecipato a qualunque mansione "soup kitchen"
 SELECT DISTINCT d.ragioneSociale FROM DitteEsterne AS d JOIN Collaboratori AS co ON(d.cod = co.cod) JOIN Collabora AS c ON(co.cod = c.codCollaboratore) JOIN Mansioni AS m ON(c.idMansione = m.id) WHERE m.descrizione = 'soup kitchen';

-- 12) Estrarre le generalità dei volontari che hanno partecipato a qualunque mansione "soup kitchen"
 SELECT DISTINCT ci.nome, ci.cognome, ci.dataNascita, ci.luogoNascita FROM Civili AS ci JOIN Collaboratori AS co ON(ci.cod = co.cod) JOIN Collabora AS c ON(co.cod = c.codCollaboratore) JOIN Mansioni AS m ON(c.idMansione = m.id) WHERE m.descrizione = 'soup kitchen';

-- 13) Estrarre i movimenti bancari effettuati da "Tonio Cartonio"
 SELECT m.descrizione, m.giorno, m.momento, m.importo FROM MovimentiBancari as m JOIN Personale AS p ON (m.codTesoriere = p.cod) WHERE p.nome = 'Tonio' AND p.cognome = 'Cartonio';

-- 14) Contare il numero di stipendi dati ad ogni singolo membro del personale
 SELECT p.nome, p.cognome, p.dataNascita, p.luogoNascita, COUNT(*) as n_stipendi FROM Personale AS p JOIN Collaboratori AS c ON (p.cod = c.cod) JOIN MovimentiBancari AS m ON (m.codCollaboratore = c.cod) WHERE m.descrizione LIKE '%salary payment%' GROUP BY c.cod;

-- 15) Estrarre gli stipendi percepiti da P1 in trasferta
 SELECT m.descrizione, m.importo, m.giorno, m.momento FROM Personale AS p JOIN Collaboratori AS c ON (p.cod = c.cod) JOIN MovimentiBancari AS m ON (m.codCollaboratore = c.cod) WHERE p.cod = 'P1' AND m.descrizione = 'salary payment in transfer';

-- 16) Visualizzare tutti i movimenti bancari effettuati nel 2016
 SELECT descrizione, importo, giorno, momento FROM MovimentiBancari WHERE year(giorno) = 2016;

-- 17) Da quale sede proviene il tesoriere che ha effettuato il movimento numero 1
 SELECT s.nome AS nome_sede FROM Sedi AS s JOIN Impiegato AS i ON (i.idSede = s.id) JOIN Personale AS p ON (i.codPersonale = p.cod) JOIN MovimentiBancari as m ON (m.codTesoriere = p.cod) WHERE m.id = 1;

-- 18) Visualizzare tutte le mansioni svolte in Irlanda
 SELECT m.descrizione, m.dataInizio, m.dataFine, m.provincia, m.citta FROM Mansioni AS m JOIN Nazioni AS n ON (m.idNazione = n.id) WHERE n.nazione = 'Ireland';

-- 19) Visualizzare l'ammontare totale delle donazioni
 SELECT sum(importo) AS totale_donazioni FROM MovimentiBancari WHERE descrizione LIKE '%donation%';

-- 20) Calcolare la media di danaro ricevuto dalle donazioni
 SELECT avg(importo) AS media_donazioni FROM MovimentiBancari WHERE descrizione LIKE '%donation%';


-- QUERY RICHIESTE DAL PROFESSORE --
-- 1) Lista movimenti bancari relativi a un particolare collaboratore
 SELECT m.descrizione, m.giorno, m.momento, m.importo FROM MovimentiBancari as m JOIN Collaboratori AS c ON (m.codCollaboratore = c.cod) JOIN Partner AS p ON (c.cod = p.cod) WHERE p.nome = 'unicef' 
 UNION
 SELECT m.descrizione, m.giorno, m.momento, m.importo FROM MovimentiBancari as m JOIN Collaboratori AS c ON (m.codCollaboratore = c.cod) JOIN ditteesterne AS p ON (c.cod = p.cod) WHERE p.ragioneSociale = 'unicef' 
 UNION 
 SELECT m.descrizione, m.giorno, m.momento, m.importo FROM MovimentiBancari as m JOIN Collaboratori AS c ON (m.codCollaboratore = c.cod) JOIN personale AS p ON (c.cod = p.cod) WHERE p.nome = 'unicef' 
 UNION 
 SELECT m.descrizione, m.giorno, m.momento, m.importo FROM MovimentiBancari as m JOIN Collaboratori AS c ON (m.codCollaboratore = c.cod) JOIN civili AS p ON (c.cod = p.cod) WHERE p.nome = 'unicef' ;


-- 2) Lista movimenti bancari ordinati da un membro specifico del personale
 SELECT m.descrizione, m.giorno, m.momento, m.importo FROM MovimentiBancari as m JOIN Personale AS p ON (m.codTesoriere = p.cod) WHERE p.nome = 'Tonio' AND p.cognome = 'Cartonio';

-- 3) Numero di membri del personale che hanno effettuato movimenti bancari a favore di un certo collaboratore
 SELECT COUNT(DISTINCT pe.cod) AS Numero FROM personale AS pe JOIN movimentibancari AS mb ON (pe.cod = mb.codTesoriere) JOIN Collaboratori AS c ON (mb.codCollaboratore = c.cod) JOIN Partner AS p ON (c.cod = p.cod) WHERE p.nome = 'WWF' AND mb.importo < 0
 UNION
 SELECT COUNT(DISTINCT pe.cod) AS Numero FROM personale AS pe JOIN movimentibancari AS mb ON (pe.cod = mb.codTesoriere) JOIN Collaboratori AS c ON (mb.codCollaboratore = c.cod) JOIN ditteesterne AS p ON (c.cod = p.cod) WHERE p.ragioneSociale = 'WWF' AND mb.importo < 0
 UNION
 SELECT COUNT(DISTINCT pe.cod) AS Numero FROM personale AS pe JOIN movimentibancari AS mb ON (pe.cod = mb.codTesoriere) JOIN Collaboratori AS c ON (mb.codCollaboratore = c.cod) JOIN personale AS p ON (c.cod = p.cod) WHERE p.nome = 'WWF' AND mb.importo < 0
 UNION
 SELECT COUNT(DISTINCT pe.cod) AS Numero FROM personale AS pe JOIN movimentibancari AS mb ON (pe.cod = mb.codTesoriere) JOIN Collaboratori AS c ON (mb.codCollaboratore = c.cod) JOIN civili AS p ON (c.cod = p.cod) WHERE p.nome = 'WWF' AND mb.importo < 0;

-- 4) Importo totale versato ad un collaboratore in un intervallo di anni
 SELECT SUM(mb.importo) AS TotaleVersato FROM movimentibancari AS mb JOIN personale AS p ON(p.cod = mb.codCollaboratore) WHERE mb.importo < 0 AND p.nome = 'Tonio' AND p.cognome = 'Cartonio' AND mb.giorno > '2016-01-01' AND mb.giorno < '2017-12-31';

-- 5) Sedi dalle quali sono partiti i trasferimenti più ingenti (verso qualsiasi collaboratore)
 SELECT s.nome, SUM(mb.importo) AS Trasferimenti FROM movimentibancari AS mb JOIN personale AS p ON(mb.codTesoriere = p.cod) JOIN impiegato AS i ON(p.cod = i.codPersonale) JOIN sedi AS s ON(i.idSede = s.id) WHERE mb.importo < 0 GROUP BY s.id;

-- 6) Somme totali pagate in un certo periodo di tempo (intervallo di date) suddivise in base al tipo di collaboratore che le ha ricevute
 SELECT SUM(mb.importo) AS importo, p.nome AS NomeCollaboratore FROM movimentibancari AS mb JOIN collaboratori AS c ON(mb.codCollaboratore = c.cod) JOIN personale AS p ON(c.cod = p.cod) WHERE mb.importo < 0 AND mb.giorno > '2016-01-01' AND mb.giorno < '2018-12-31' GROUP BY c.cod
 UNION
 SELECT SUM(mb.importo) AS importo, pa.nome AS NomeCollaboratore FROM movimentibancari AS mb JOIN collaboratori AS c ON(mb.codCollaboratore = c.cod) JOIN partner AS pa ON(c.cod = pa.cod) WHERE mb.importo < 0 AND mb.giorno > '2016-01-01' AND mb.giorno < '2018-12-31' GROUP BY c.cod
 UNION
 SELECT SUM(mb.importo) AS importo, de.ragioneSociale  AS NomeCollaboratore FROM movimentibancari AS mb JOIN collaboratori AS c ON(mb.codCollaboratore = c.cod) JOIN ditteesterne AS de ON(c.cod = de.cod) WHERE mb.importo < 0 AND mb.giorno > '2016-01-01' AND mb.giorno < '2018-12-31' GROUP BY c.cod
 UNION
 SELECT SUM(mb.importo) AS importo, p.nome AS NomeCollaboratore FROM movimentibancari AS mb JOIN collaboratori AS c ON(mb.codCollaboratore = c.cod) JOIN civili AS p ON(c.cod = p.cod) WHERE mb.importo < 0 AND mb.giorno > '2016-01-01' AND mb.giorno < '2018-12-31' GROUP BY c.cod;

-- 7) Lista delle nazioni in cui l'organizzazione opera, e numero collaboratori operanti in ciascuna di esse
 SELECT n.nazione, COUNT(co.cod) AS NumeroDiCollaboratori FROM nazioni AS n JOIN mansioni AS m ON(n.id = m.id) JOIN collabora AS c ON(m.id = c.idMansione) JOIN collaboratori AS co ON(c.codCollaboratore = co.cod) GROUP BY n.nazione;

-- 8) Lista temporale ordinata delle trasferte di un membro del personale
 SELECT i.dataInizio AS DataInizio, i.dataFine AS DataFine FROM personale AS p JOIN impiegato AS i ON(p.cod = i.codPersonale) WHERE p.nome = 'Pippo' AND p.cognome = 'Laurenti' AND i.trasferta = 1 ORDER BY i.dataInizio;

-- 9) Sedi presso le quali vengono fatte le trasferte più lunghe
 SELECT s.nome AS NomeSede, MAX(DATEDIFF(i.dataFine,i.dataInizio)) AS Durata FROM sedi AS s JOIN impiegato AS i ON(s.id = i.idSede) WHERE i.trasferta = 1 GROUP BY s.id ORDER BY Durata DESC;

-- 10) Nazioni dalle quali provengono i membri del personale e numero degli stessi
 SELECT n.nazione, COUNT(p.cod) AS NumeroPersonalePerNazione FROM nazioni AS n JOIN personale AS p ON (n.id = p.idNazione) GROUP BY n.id;

