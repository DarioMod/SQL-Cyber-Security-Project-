use Azienda_DB;

--Visualizzazione di tutte le tabelle
SELECT
TABLE_SCHEMA AS SchemaNome,
TABLE_NAME AS NomeTabella
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'
ORDER BY TABLE_NAME;
GO


-- Per controllare il numero delle tabelle:
SELECT
COUNT(*) AS TotaleTabelle
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';
GO


SELECT * from Dipendenti;

--Restituire il nome completo del dipendente e il CF

SELECT Nome,Cognome,CodiceFiscale from Dipendenti;


-- BRANCHE -> modifCol <-> segnor 
SELECT 
Nome + ' ' + Cognome AS 'Nome completo',
CodiceFiscale
FROM Dipendenti;

SELECT 
Nome + ' ' + Cognome AS [Nome completo],
CodiceFiscale
FROM Dipendenti 
WHERE Citta = 'Bologna';

SELECT 
Nome + ' ' + Cognome AS [Nome completo],
CodiceFiscale
FROM Dipendenti 
WHERE ResponsabileId IS NULL;


-- Distinct ci permette di eliminare le dupplicate dirante la visualizzazione dei dati
select Distinct Nome, CodiceFiscale from Dipendenti;

-- Restituire 5 prime dighe 
SELECT TOP 6 * FROM Fornitori;

SELECT * 
FROM Dipendenti
ORDER BY Nome ASC 

SELECT * 
FROM Dipendenti
WHERE ResponsabileId > 1
ORDER BY Nome DESC;

SELECT *
FROM Dipendenti 
Where ResponsabileId BETWEEN 1 AND 2
ORDER BY Nome Desc;


SELECT * FROM Fornitori 
where Ragionesociale in ('Digital Components S.p.A.', 'Computer World S.p.A.', 'Accessori PC S.r.l.');



/*
JOIN (inner join) 
FELT join (parte da Sinistra  
RIGHT join (parte da Destra 
  
SELECT 
T1.colonne1 as <nuovo nome della colonna colonna>
T1.colonne2 as <nuovo nome della colonna colonna>
T2.colonne3 as <nuovo nome della colonna colonna>
col....
FROM Tabella1 as T1
INNER JOIN Tabella2 as T2
ON T1.Chiave = T2.Chiave

*/
-- Esemipo 1: Dipendenti con il nom del reparto
SELECT 
d.Nome + ' ' + d.Cognome AS Dipendente,
d.CodiceFiscale AS CF,
r.NomeReparto as Reparto
FROM Dipendenti as d
JOIN Reparti as r
ON r.RepartoId = d.RepartoId
WHERE r.NomeReparto = 'informatica';


-- Restiture la lista dei deipendenti ordinati nome per reparto
-- Nome, cognome, NomeReparto

SELECT 
d.Nome + ' ' + d.Cognome AS Dipendente,
r.NomeReparto as Reparto
FROM Dipendenti as d
JOIN Reparti as r
ON r.RepartoId = d.RepartoId
ORDER BY r.NomeReparto ASC;


-- Esempio 2: Restiture la lista dei deipendenti ordinati  per nome del reparto
SELECT
    d.Nome,
    d.Cognome,
    r.NomeReparto
FROM Dipendenti AS d
INNER JOIN Reparti AS r
    ON r.RepartoId = r.RepartoId
ORDER BY r.NomeReparto ASC;






select * from Reparti;
select * from Dipendenti;


-- Like 
-- a% => Restituisce tutti i nome che cominciano con la lettera a
-- %i => Restituisce tutti i nome che finiscono con la lettera i
-- %a% => Restituisce tutti i nome che contiene una a

SELECT * 
FROM Prodotti where NomeProdotto LIKE 'o%';

SELECT * 
FROM Prodotti where NomeProdotto LIKE '%te';


SELECT * 
FROM Prodotti where NomeProdotto LIKE '%tt%';


select * from Ordini;

SELECT
    d.Nome,
    d.Cognome,
    r.NomeReparto
FROM Dipendenti AS d
INNER JOIN Reparti AS r
    ON r.RepartoId = r.RepartoId
INNER JOIN Ordini AS o
    ON d.DipendenteId = o.DipendenteId
ORDER BY o.DataOrdine ASC;


SELECT * FROM Fornitori; -- 1
SELECT * FROM DettagliOrdine;
SELECT * FROM Clienti; -- 1
SELECT * FROM Categorie; --1 

SELECT *
FROM  Ordini
WHERE DataOrdine BETWEEN '2026-11-01' AND '2026-11-12';

SELECT
    CodiceProdotto,
    NomeProdotto,
    CategoriaId,
    PrezzoVendita
FROM Prodotti
WHERE PrezzoVendita BETWEEN 50 AND 500
ORDER BY PrezzoVendita ASC;

SELECT TOP 1 *
FROM dbo.Fornitori
ORDER BY DataInserimento DESC;




