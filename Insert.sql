use Azienda_DB;


/* =====================================================
1. REPARTI
Inseriamo 10 reparti aziendali.
===================================================== */


INSERT INTO Reparti
(NomeReparto, Descrizone, Sede)
VALUES
(N'Amministrazione', N'Gestione amministrativa e contabile', N'Bologna'),
(N'Informatica', N'Sviluppo software e sistemi informatici', N'Bologna'),
(N'Risorse Umane', N'Gestione del personale e selezione', N'Milano'),
(N'Commerciale', N'Gestione clienti e vendite', N'Bologna'),
(N'Marketing', N'Promozione e comunicazione aziendale', N'Milano'),
(N'Assistenza Tecnica', N'Supporto tecnico ai clienti', N'Bologna'),
(N'Logistica', N'Gestione spedizioni e magazzino', N'Modena'),
(N'Acquisti', N'Gestione fornitori e approvvigionamenti', N'Modena'),
(N'Finanza', N'Gestione finanziaria e pagamenti', N'Milano'),
(N'Direzione', N'Coordinamento e direzione aziendale', N'Bologna');


/* =====================================================
2. DIPENDENTI
I primi 5 dipendenti sono responsabili.
Gli altri dipendenti fanno riferimento ai responsabili.
===================================================== */

INSERT INTO Dipendenti
(
Nome, Cognome, CodiceFiscale, DataNascita,
Sesso, Email, Telefono, Indirizzo, Citta,
DataAssunzione, Stipendio, RepartoId,
ResponsabileId, Stato
)
VALUES
(N'Marco', N'Rossi', 'RSSMRC80101H501A', '1980-01-01', 'M', N'marco.rossi@azienda.it', N'3331000001', N'Via Roma 10', N'Bologna', '2015-03-10', 4200.00, 10, NULL, N'Attivo'),
(N'Laura', N'Bianchi', 'BNCLRA80215F205B', '1982-02-15', 'F', N'laura.bianchi@azienda.it', N'3331000002', N'Via Milano 20', N'Milano', '2016-05-12', 3500.00, 2, NULL, N'Attivo'),
(N'Giuseppe', N'Verdi', 'VRDGPP70320A944C', '1979-03-20', 'M', N'giuseppe.verdi@azienda.it', N'3331000003', N'Via Garibaldi 5', N'Modena', '2017-01-15', 3300.00, 4, NULL, N'Attivo'),
(N'Sara', N'Ferrari', 'FRRSRA85010D612D', '1985-04-10', 'F', N'sara.ferrari@azienda.it', N'3331000004', N'Via Dante 15', N'Bologna', '2018-02-01', 3200.00, 6, NULL, N'Attivo'),
(N'Andrea', N'Conti', 'CNTNDR78025F257E', '1978-05-25', 'M', N'andrea.conti@azienda.it', N'3331000005', N'Via Torino 30', N'Milano', '2014-09-01', 3900.00, 1, NULL, N'Attivo'),

(N'Paolo', N'Ricci', 'RCCPLA90060A944F', '1990-06-01', 'M', N'paolo.ricci@azienda.it', N'3331000006', N'Via Verdi 2', N'Bologna', '2020-01-10', 2600.00, 2, 2, N'Attivo'),
(N'Elena', N'Marino', 'MRNLNE91072F205G', '1991-07-02', 'F', N'elena.marino@azienda.it', N'3331000007', N'Via Mazzini 8', N'Milano', '2021-03-15', 2500.00, 2, 2, N'Attivo'),
(N'Francesco', N'Gallo', 'GLLFNC80803H501H', '1988-08-03', 'M', N'francesco.gallo@azienda.it', N'3331000008', N'Via Emilia 12', N'Modena', '2019-04-20', 2800.00, 2, 2, N'Attivo'),
(N'Chiara', N'Fontana', 'FNTCHR92004A944I', '1992-09-04', 'F', N'chiara.fontana@azienda.it', N'3331000009', N'Via Roma 22', N'Bologna', '2022-02-10', 2400.00, 3, 1, N'Attivo'),
(N'Luca', N'Moretti', 'MRTLUC87010F205J', '1987-01-05', 'M', N'luca.moretti@azienda.it', N'3331000010', N'Via Milano 9', N'Milano', '2018-06-12', 2700.00, 4, 3, N'Attivo'),

(N'Anna', N'Barbieri', 'BRBNNA93026H501K', '1993-02-06', 'F', N'anna.barbieri@azienda.it', N'3331000011', N'Via Indipendenza 3', N'Bologna', '2023-01-15', 2300.00, 5, 3, N'Attivo'),
(N'Matteo', N'Rinaldi', 'RNLMTT89307A944L', '1989-03-07', 'M', N'matteo.rinaldi@azienda.it', N'3331000012', N'Via Po 14', N'Modena', '2020-08-01', 2600.00, 6, 4, N'Attivo'),
(N'Federica', N'Caruso', 'CRSFRC9408F205M', '1994-04-08', 'F', N'federica.caruso@azienda.it', N'3331000013', N'Via Napoli 7', N'Bologna', '2024-02-01', 2200.00, 6, 4, N'Attivo'),
(N'Davide', N'Leone', 'LNEDVD86059H501N', '1986-05-09', 'M', N'davide.leone@azienda.it', N'3331000014', N'Via Torino 18', N'Milano', '2017-07-10', 2900.00, 7, 1, N'Attivo'),
(N'Giulia', N'Greco', 'GRCGLI95060A944O', '1995-06-10', 'F', N'giulia.greco@azienda.it', N'3331000015', N'Via Firenze 11', N'Modena', '2024-03-01', 2100.00, 8, 1, N'Attivo'),

(N'Simone', N'Riva', 'RVASMN910711205P', '1991-07-11', 'M', N'simone.riva@azienda.it', N'3331000016', N'Via Roma 19', N'Bologna', '2021-09-15', 2500.00, 9, 5, N'Attivo'),
(N'Valentina', N'Costa', 'CSTVNT96812H501Q', '1996-08-12', 'F', N'valentina.costa@azienda.it', N'3331000017', N'Via Verdi 25', N'Milano', '2024-01-10', 2200.00, 1, 5, N'Attivo'),
(N'Roberto', N'Giordano', 'GRDRRT80913A944R', '1985-09-13', 'M', N'roberto.giordano@azienda.it', N'3331000018', N'Via Emilia 40', N'Modena', '2016-11-01', 3000.00, 7, 1, N'Attivo'),
(N'Claudia', N'Mancini', 'MNCCLD97114F205S', '1997-10-14', 'F', N'claudia.mancini@azienda.it', N'3331000019', N'Via Dante 16', N'Bologna', '2025-01-15', 2050.00, 3, 1, N'Attivo'),
(N'Nicola', N'Rizzo', 'RZZNCL881115501T', '1988-11-15', 'M', N'nicola.rizzo@azienda.it', N'3331000020', N'Via Milano 31', N'Milano', '2019-10-01', 2750.00, 4, 3, N'Attivo'),

(N'Elisa', N'Lombardi', 'LMBLSE98116A944U', '1998-12-16', 'F', N'elisa.lombardi@azienda.it', N'3331000021', N'Via Roma 45', N'Modena', '2025-02-01', 2000.00, 5, 3, N'Attivo'),
(N'Fabio', N'Colombo', 'CLMFBA83017F205V', '1983-01-17', 'M', N'fabio.colombo@azienda.it', N'3331000022', N'Via Garibaldi 21', N'Bologna', '2015-12-01', 3100.00, 8, 1, N'Attivo'),
(N'Noemi', N'Galli', 'GLLNMO990218501W', '1999-02-18', 'F', N'noemi.galli@azienda.it', N'3331000023', N'Via Torino 6', N'Milano', '2025-03-01', 1950.00, 9, 5, N'Attivo'),
(N'Enrico', N'Villa', 'VLLNRC80031A944X', '1980-03-19', 'M', N'enrico.villa@azienda.it', N'3331000024', N'Via Emilia 55', N'Modena', '2014-05-01', 3400.00, 10, 1, N'Attivo'),
(N'Marta', N'Ferri', 'FRRMRT900420205Y', '1990-04-20', 'F', N'marta.ferri@azienda.it', N'3331000025', N'Via Dante 27', N'Bologna', '2020-06-01', 2550.00, 2, 2, N'Attivo'),

(N'Alessandro', N'Pellegrini', 'PLLSN870521H501Z', '1987-05-21', 'M', N'alessandro.pellegrini@azienda.it', N'3331000026', N'Via Roma 50', N'Milano', '2018-03-01', 2800.00, 6, 4, N'Attivo'),
(N'Ilaria', N'Romano', 'RMNLRI92062A944A', '1992-06-22', 'F', N'ilaria.romano@azienda.it', N'3331000027', N'Via Verdi 32', N'Bologna', '2022-07-01', 2450.00, 4, 3, N'Attivo'),
(N'Giorgio', N'Esposito', 'SPSGRG80723F205B', '1985-07-23', 'M', N'giorgio.esposito@azienda.it', N'3331000028', N'Via Milano 44', N'Modena', '2017-08-01', 2950.00, 7, 1, N'Attivo'),
(N'Beatrice', N'Fabbri', 'FBBBRC96824H501C', '1996-08-24', 'F', N'beatrice.fabbri@azienda.it', N'3331000029', N'Via Napoli 15', N'Bologna', '2024-06-01', 2150.00, 3, 1, N'Attivo'),
(N'Riccardo', N'Longo', 'LNGRCR89025A944D', '1989-09-25', 'M', N'riccardo.longo@azienda.it', N'3331000030', N'Via Firenze 29', N'Milano', '2020-09-01', 2650.00, 8, 1, N'Attivo');


/* =====================================================
3. CLIENTI
20 privati e 10 aziende.
===================================================== */

INSERT INTO dbo.Clienti
(
TipoCLiente, Nome, Cognome, RagioneSociale,
Partita_IVA, Email, Indirizzo, CAP,
Citta, Povincia, Paese, Stato
)
VALUES
(N'Privato', N'Antonio', N'Bassi', N'Antonio Bassi', '10000000001', N'antonio.bassi@email.it', N'Via Roma 1', N'40121', N'Bologna', N'BO', N'Italia', N'Attivo'),
(N'Privato', N'Maria', N'Rossi', N'Maria Rossi', '10000000002', N'maria.rossi@email.it', N'Via Milano 2', N'20121', N'Milano', N'MI', N'Italia', N'Attivo'),
(N'Privato', N'Luigi', N'Costa', N'Luigi Costa', '10000000003', N'luigi.costa@email.it', N'Via Emilia 3', N'41121', N'Modena', N'MO', N'Italia', N'Attivo'),
(N'Privato', N'Elena', N'Galli', N'Elena Galli', '10000000004', N'elena.galli@email.it', N'Via Dante 4', N'40122', N'Bologna', N'BO', N'Italia', N'Attivo'),
(N'Privato', N'Paolo', N'Conti', N'Paolo Conti', '10000000005', N'paolo.conti@email.it', N'Via Verdi 5', N'20122', N'Milano', N'MI', N'Italia', N'Attivo'),
(N'Privato', N'Giulia', N'Riva', N'Giulia Riva', '10000000006', N'giulia.riva@email.it', N'Via Roma 6', N'41122', N'Modena', N'MO', N'Italia', N'Attivo'),
(N'Privato', N'Marco', N'Villa', N'Marco Villa', '10000000007', N'marco.villa@email.it', N'Via Torino 7', N'40123', N'Bologna', N'BO', N'Italia', N'Attivo'),
(N'Privato', N'Sara', N'Leone', N'Sara Leone', '10000000008', N'sara.leone@email.it', N'Via Napoli 8', N'20123', N'Milano', N'MI', N'Italia', N'Attivo'),
(N'Privato', N'Fabio', N'Greco', N'Fabio Greco', '10000000009', N'fabio.greco@email.it', N'Via Firenze 9', N'41123', N'Modena', N'MO', N'Italia', N'Attivo'),
(N'Privato', N'Anna', N'Moretti', N'Anna Moretti', '10000000010', N'anna.moretti@email.it', N'Via Mazzini 10', N'40124', N'Bologna', N'BO', N'Italia', N'Attivo'),
(N'Privato', N'Roberto', N'Ferri', N'Roberto Ferri', '10000000011', N'roberto.ferri@email.it', N'Via Po 11', N'20124', N'Milano', N'MI', N'Italia', N'Attivo'),
(N'Privato', N'Claudia', N'Romano', N'Claudia Romano', '10000000012', N'claudia.romano@email.it', N'Via Garibaldi 12', N'41124', N'Modena', N'MO', N'Italia', N'Attivo'),
(N'Privato', N'Davide', N'Fontana', N'Davide Fontana', '10000000013', N'davide.fontana@email.it', N'Via Indipendenza 13', N'40125', N'Bologna', N'BO', N'Italia', N'Attivo'),
(N'Privato', N'Chiara', N'Barbieri', N'Chiara Barbieri', '10000000014', N'chiara.barbieri@email.it', N'Via Roma 14', N'20125', N'Milano', N'MI', N'Italia', N'Attivo'),
(N'Privato', N'Andrea', N'Rinaldi', N'Andrea Rinaldi', '10000000015', N'andrea.rinaldi@email.it', N'Via Emilia 15', N'41125', N'Modena', N'MO', N'Italia', N'Attivo'),
(N'Privato', N'Federica', N'Mancini', N'Federica Mancini', '10000000016', N'federica.mancini@email.it', N'Via Dante 16', N'40126', N'Bologna', N'BO', N'Italia', N'Attivo'),
(N'Privato', N'Matteo', N'Colombo', N'Matteo Colombo', '10000000017', N'matteo.colombo@email.it', N'Via Milano 17', N'20126', N'Milano', N'MI', N'Italia', N'Attivo'),
(N'Privato', N'Valentina', N'Caruso', N'Valentina Caruso', '10000000018', N'valentina.caruso@email.it', N'Via Torino 18', N'41126', N'Modena', N'MO', N'Italia', N'Attivo'),
(N'Privato', N'Nicola', N'Gallo', N'Nicola Gallo', '10000000019', N'nicola.gallo@email.it', N'Via Verdi 19', N'40127', N'Bologna', N'BO', N'Italia', N'Attivo'),
(N'Privato', N'Elisa', N'Rizzo', N'Elisa Rizzo', '10000000020', N'elisa.rizzo@email.it', N'Via Roma 20', N'20127', N'Milano', N'MI', N'Italia', N'Attivo'),

(N'Azienda', NULL, NULL, N'Tech Solutions S.r.l.', '20000000001', N'info@techsolutions.it', N'Via Industria 1', N'40128', N'Bologna', N'BO', N'Italia', N'Attivo'),
(N'Azienda', NULL, NULL, N'Innova Digital S.p.A.', '20000000002', N'info@innovadigital.it', N'Via Innovazione 2', N'20128', N'Milano', N'MI', N'Italia', N'Attivo'),
(N'Azienda', NULL, NULL, N'Emilia Informatica S.r.l.', '20000000003', N'info@emiliainformatica.it', N'Via Emilia 3', N'41128', N'Modena', N'MO', N'Italia', N'Attivo'),
(N'Azienda', NULL, NULL, N'Global Network S.r.l.', '20000000004', N'info@globalnetwork.it', N'Via Rete 4', N'40129', N'Bologna', N'BO', N'Italia', N'Attivo'),
(N'Azienda', NULL, NULL, N'Computer Center S.r.l.', '20000000005', N'info@computercenter.it', N'Via Computer 5', N'20129', N'Milano', N'MI', N'Italia', N'Attivo'),
(N'Azienda', NULL, NULL, N'Cloud Services Italia S.r.l.', '20000000006', N'info@cloudservices.it', N'Via Cloud 6', N'41129', N'Modena', N'MO', N'Italia', N'Attivo'),
(N'Azienda', NULL, NULL, N'Web Factory S.r.l.', '20000000007', N'info@webfactory.it', N'Via Web 7', N'40130', N'Bologna', N'BO', N'Italia', N'Attivo'),
(N'Azienda', NULL, NULL, N'Security Lab S.r.l.', '20000000008', N'info@securitylab.it', N'Via Sicurezza 8', N'20130', N'Milano', N'MI', N'Italia', N'Attivo'),
(N'Azienda', NULL, NULL, N'Data Systems S.r.l.', '20000000009', N'info@datasystems.it', N'Via Dati 9', N'41130', N'Modena', N'MO', N'Italia', N'Attivo'),
(N'Azienda', NULL, NULL, N'Office Technology S.r.l.', '20000000010', N'info@officetechnology.it', N'Via Uffici 10', N'40131', N'Bologna', N'BO', N'Italia', N'Attivo');


/* =====================================================
4. FORNITORI
===================================================== */

INSERT INTO dbo.Fornitori
(
RagioneSociale, PartitaIVA, Email, Telefono,
Indirizzo, CAP, Citta, Paese, Stato
)
VALUES
(N'Hardware Italia S.r.l.', '30000000001', N'ordini@hardwareitalia.it', N'0511000001', N'Via Industria 1', N'40128', N'Bologna', N'Italia', N'Attivo'),
(N'Digital Components S.p.A.', '30000000002', N'info@digitalcomponents.it', N'0211000002', N'Via Tecnica 2', N'20128', N'Milano', N'Italia', N'Attivo'),
(N'Network Pro S.r.l.', '30000000003', N'info@networkpro.it', N'0591000003', N'Via Reti 3', N'41128', N'Modena', N'Italia', N'Attivo'),
(N'Office Supply S.r.l.', '30000000004', N'info@officesupply.it', N'0511000004', N'Via Uffici 4', N'40129', N'Bologna', N'Italia', N'Attivo'),
(N'Computer World S.p.A.', '30000000005', N'info@computerworld.it', N'0211000005', N'Via Computer 5', N'20129', N'Milano', N'Italia', N'Attivo'),
(N'Software House S.r.l.', '30000000006', N'info@softwarehouse.it', N'0591000006', N'Via Software 6', N'41129', N'Modena', N'Italia', N'Attivo'),
(N'Secure Tech S.r.l.', '30000000007', N'info@securetech.it', N'0511000007', N'Via Sicurezza 7', N'40130', N'Bologna', N'Italia', N'Attivo'),
(N'Cloud Market S.p.A.', '30000000008', N'info@cloudmarket.it', N'0211000008', N'Via Cloud 8', N'20130', N'Milano', N'Italia', N'Attivo'),
(N'Print Solutions S.r.l.', '30000000009', N'info@printsolutions.it', N'0591000009', N'Via Stampa 9', N'41130', N'Modena', N'Italia', N'Attivo'),
(N'Elettro Distribuzione S.r.l.', '30000000010', N'info@elettrodistribuzione.it', N'0511000010', N'Via Elettrica 10', N'40131', N'Bologna', N'Italia', N'Attivo'),
(N'Global IT Components S.r.l.', '30000000011', N'info@globalit.it', N'0211000011', N'Via Globale 11', N'20131', N'Milano', N'Italia', N'Attivo'),
(N'Logistica Digitale S.r.l.', '30000000012', N'info@logisticadigitale.it', N'0591000012', N'Via Trasporti 12', N'41131', N'Modena', N'Italia', N'Attivo'),
(N'Licenze Software Italia S.r.l.', '30000000013', N'info@licenzesoftware.it', N'0511000013', N'Via Licenze 13', N'40132', N'Bologna', N'Italia', N'Attivo'),
(N'Accessori PC S.r.l.', '30000000014', N'info@accessoripc.it', N'0211000014', N'Via Accessori 14', N'20132', N'Milano', N'Italia', N'Attivo'),
(N'Forniture Aziendali S.r.l.', '30000000015', N'info@fornitureaziendali.it', N'0591000015', N'Via Aziende 15', N'41132', N'Modena', N'Italia', N'Attivo');



/* =====================================================
5. CATEGORIE
Prima le categorie principali, poi le sottocategorie.
===================================================== */

INSERT INTO dbo.Categorie (NomeCategoria, Descrizione)
VALUES
(N'Hardware', N'Componenti fisici e dispositivi informatici'),
(N'Software', N'Programmi, applicazioni e licenze'),
(N'Reti', N'Apparati e componenti di rete'),
(N'Accessori', N'Accessori per computer e ufficio'),
(N'Sicurezza', N'Soluzioni per la sicurezza informatica');

INSERT INTO dbo.Categorie (NomeCategoria, Descrizione, CategoriaPadreId)
VALUES
(N'Computer', N'Computer desktop e workstation', 1),
(N'Notebook', N'Computer portatili', 1),
(N'Monitor', N'Monitor e schermi', 1),
(N'Storage', N'Dischi e unità di archiviazione', 1),
(N'Componenti PC', N'Componenti interni per computer', 1),
(N'Sistemi operativi', N'Licenze dei sistemi operativi', 2),
(N'Produttività', N'Software per ufficio', 2),
(N'Sviluppo', N'Strumenti per sviluppatori', 2),
(N'Switch', N'Switch di rete', 3),
(N'Router', N'Router e gateway', 3),
(N'Cavi', N'Cavi e collegamenti', 3),
(N'Tastiere e mouse', N'Dispositivi di input', 4),
(N'Stampanti', N'Stampanti e multifunzione', 4),
(N'Antivirus', N'Software antivirus', 5),
(N'Firewall', N'Apparati e soluzioni firewall', 5);


/* =====================================================
6. PRODOTTI
40 prodotti con prezzi e categorie differenti.
===================================================== */

INSERT INTO dbo.Prodotti
(
CodiceProdotto, NomeProdotto, Descrizione,
CategoriaId, PrezzoAquisto, PrezzoVendita,
AliquotaIVA, UnitaMisura, Stato
)
VALUES
(N'PC001', N'PC Desktop Business', N'Computer desktop per ufficio', 6, 450.00, 649.00, 22, N'Pezzo', N'Attivo'),
(N'PC002', N'Workstation Pro', N'Workstation professionale', 6, 900.00, 1299.00, 22, N'Pezzo', N'Attivo'),
(N'NB001', N'Notebook 15 Business', N'Notebook aziendale 15 pollici', 7, 520.00, 749.00, 22, N'Pezzo', N'Attivo'),
(N'NB002', N'Notebook Pro 16', N'Notebook professionale 16 pollici', 7, 800.00, 1149.00, 22, N'Pezzo', N'Attivo'),
(N'MO001', N'Monitor LED 24', N'Monitor Full HD 24 pollici', 8, 100.00, 159.00, 22, N'Pezzo', N'Attivo'),
(N'MO002', N'Monitor 27 QHD', N'Monitor QHD 27 pollici', 8, 180.00, 269.00, 22, N'Pezzo', N'Attivo'),
(N'ST001', N'SSD 500 GB', N'Unità SSD 500 GB', 9, 35.00, 59.00, 22, N'Pezzo', N'Attivo'),
(N'ST002', N'SSD 1 TB', N'Unità SSD 1 TB', 9, 65.00, 99.00, 22, N'Pezzo', N'Attivo'),
(N'ST003', N'Hard Disk 2 TB', N'Disco rigido esterno 2 TB', 9, 55.00, 89.00, 22, N'Pezzo', N'Attivo'),
(N'CP001', N'Memoria RAM 16 GB', N'Modulo RAM DDR4 16 GB', 10, 30.00, 49.00, 22, N'Pezzo', N'Attivo'),
(N'CP002', N'Memoria RAM 32 GB', N'Modulo RAM DDR5 32 GB', 10, 65.00, 99.00, 22, N'Pezzo', N'Attivo'),
(N'CP003', N'Processore Intel i5', N'Processore per PC desktop', 10, 130.00, 189.00, 22, N'Pezzo', N'Attivo'),
(N'SW001', N'Windows Pro', N'Licenza sistema operativo professionale', 11, 90.00, 139.00, 22, N'Licenza', N'Attivo'),
(N'SW002', N'Office Business', N'Licenza software produttività', 12, 110.00, 169.00, 22, N'Licenza', N'Attivo'),
(N'SW003', N'Visual Studio Professional', N'Ambiente di sviluppo professionale', 13, 250.00, 349.00, 22, N'Licenza', N'Attivo'),
(N'SW004', N'SQL Server Standard', N'Licenza database relazionale', 13, 700.00, 950.00, 22, N'Licenza', N'Attivo'),
(N'NW001', N'Switch 8 porte', N'Switch Ethernet 8 porte', 14, 35.00, 59.00, 22, N'Pezzo', N'Attivo'),
(N'NW002', N'Switch 24 porte', N'Switch Ethernet 24 porte', 14, 110.00, 169.00, 22, N'Pezzo', N'Attivo'),
(N'NW003', N'Router Business', N'Router per rete aziendale', 15, 75.00, 119.00, 22, N'Pezzo', N'Attivo'),
(N'NW004', N'Router WiFi 6', N'Router wireless WiFi 6', 15, 95.00, 149.00, 22, N'Pezzo', N'Attivo'),
(N'NW005', N'Cavo Ethernet 5 m', N'Cavo di rete categoria 6', 16, 3.00, 7.00, 22, N'Pezzo', N'Attivo'),
(N'NW006', N'Cavo Ethernet 20 m', N'Cavo di rete categoria 6 da 20 metri', 16, 8.00, 15.00, 22, N'Pezzo', N'Attivo'),
(N'AC001', N'Tastiera USB', N'Tastiera cablata USB', 17, 8.00, 15.00, 22, N'Pezzo', N'Attivo'),
(N'AC002', N'Mouse Wireless', N'Mouse senza fili', 17, 10.00, 19.00, 22, N'Pezzo', N'Attivo'),
(N'AC003', N'Tastiera e Mouse Kit', N'Kit tastiera e mouse wireless', 17, 18.00, 29.00, 22, N'Pezzo', N'Attivo'),
(N'PR001', N'Stampante Laser', N'Stampante laser monocromatica', 18, 120.00, 179.00, 22, N'Pezzo', N'Attivo'),
(N'PR002', N'Stampante Multif funzione', N'Stampante multifunzione', 18, 170.00, 249.00, 22, N'Pezzo', N'Attivo'),
(N'AV001', N'Antivirus 1 dispositivo', N'Licenza antivirus annuale', 19, 15.00, 29.00, 22, N'Licenza', N'Attivo'),
(N'AV002', N'Antivirus 10 dispositivi', N'Licenza antivirus per dieci dispositivi', 19, 75.00, 119.00, 22, N'Licenza', N'Attivo'),
(N'FW001', N'Firewall Hardware', N'Firewall per piccole aziende', 20, 180.00, 279.00, 22, N'Pezzo', N'Attivo'),
(N'FW002', N'Firewall Enterprise', N'Firewall per infrastrutture aziendali', 20, 650.00, 899.00, 22, N'Pezzo', N'Attivo'),
(N'AC004', N'Webcam HD', N'Webcam USB ad alta definizione', 4, 22.00, 39.00, 22, N'Pezzo', N'Attivo'),
(N'AC005', N'Headset USB', N'Cuffie con microfono USB', 4, 18.00, 32.00, 22, N'Pezzo', N'Attivo'),
(N'AC006', N'Hub USB-C', N'Hub multiporta USB-C', 4, 20.00, 35.00, 22, N'Pezzo', N'Attivo'),
(N'AC007', N'Docking Station', N'Docking station per notebook', 4, 75.00, 119.00, 22, N'Pezzo', N'Attivo'),
(N'AC008', N'UPS 800 VA', N'Gruppo di continuità', 4, 65.00, 99.00, 22, N'Pezzo', N'Attivo'),
(N'AC009', N'Adattatore USB-C', N'Adattatore USB-C multiuso', 4, 9.00, 17.00, 22, N'Pezzo', N'Attivo'),
(N'AC010', N'Borsa Notebook', N'Borsa per notebook fino a 15 pollici', 4, 15.00, 27.00, 22, N'Pezzo', N'Attivo'),
(N'AC011', N'Supporto Monitor', N'Supporto ergonomico per monitor', 4, 25.00, 42.00, 22, N'Pezzo', N'Attivo'),
(N'AC012', N'Licenza Backup', N'Software di backup aziendale', 2, 40.00, 69.00, 22, N'Licenza', N'Attivo');


/* =====================================================
7. FORNITORIPRODOTTI
Ogni fornitore viene collegato a 3 prodotti.
===================================================== */

INSERT INTO dbo.FornitoriProdotti
(
FornitoreId, ProdottoId, PrezzoFornitura,
TempoConsegnaGiorni, CodiceProdottoFornitore
)
SELECT
F.FornitoreId,
P.ProdottoId,
P.PrezzoAquisto,
3 + ((F.FornitoreId + X.Numero) % 8),
CONCAT(N'FOR-', F.FornitoreId, N'-PROD-', P.ProdottoId)
FROM dbo.Fornitori AS F
CROSS JOIN (VALUES (1), (2), (3)) AS X(Numero)
INNER JOIN dbo.Prodotti AS P
ON P.ProdottoId = ((F.FornitoreId * 3 + X.Numero) % 40) + 1;




INSERT INTO Ordini
(
NumeroOrdine,
ClienteId,
DipendenteId,
DataOrdine,
DataConsegnaPrevista,
StatoOrdine,
Note
)
VALUES
(N'ORD-2026-001', 1, 1, '2026-11-01', '2026-11-08', N'In lavorazione', N'Ordine online'),
(N'ORD-2026-002', 2, 2, '2026-11-02', '2026-11-09', N'Spedito', N'Consegna standard'),
(N'ORD-2026-003', 3, 3, '2026-11-03', '2026-11-10', N'Consegnato', N'Consegna completata'),
(N'ORD-2026-004', 4, 4, '2026-11-04', '2026-11-11', N'In lavorazione', N'Ordine telefonico'),
(N'ORD-2026-005', 5, 5, '2026-11-05', '2026-11-12', N'Annullato', N'Ordine annullato');

SELECT *
FROM Ordini;




INSERT INTO DettagliOrdine
(
OrdineId,
ProdottoId,
Quantita,
PrezzoUnitario,
Sconto
)
VALUES
(1, 1, 2, 100.00, 0),
(1, 2, 1, 250.00, 10),
(1, 3, 3, 50.00, 5),
(2, 1, 1, 100.00, 0),
(2, 4, 2, 150.00, 10),
(3, 2, 2, 250.00, 5),
(3, 5, 1, 300.00, 0),
(4, 3, 5, 50.00, 0),
(4, 6, 2, 200.00, 15),
(5, 1, 1, 100.00, 0);


SELECT * FROM DettagliOrdine;


INSERT INTO Magazzino
(
ProdottoId,
QuantitaDisponibile,
ScortaMinima,
ScortaMassima
)
VALUES
(1, 100, 10, 200),
(2, 50, 5, 100),
(3, 200, 20, 300),
(4, 15, 10, 100),
(5, 8, 10, 80),
(6, 0, 5, 50),
(7, 75, 10, 150),
(8, 120, 20, 200),
(9, 30, 5, 100),
(10, 60, 10, 120);


SELECT * FROM Magazzino;

INSERT INTO Pagamenti
(
OrdineId,
DataPagamento,
Importo,
MetodoPagamento,
StatoPagamento,
RiferimentoTransazione,
Note
)
VALUES
(1, '2026-11-01', 595.00, N'Carta', N'Completato', N'TRX-001', N'Pagamento con carta'),
(2, '2026-11-02', 400.00, N'Bonifico', N'Completato', N'TRX-002', N'Bonifico bancario'),
(3, '2026-11-03', 800.00, N'PayPal', N'Completato', N'TRX-003', N'Pagamento PayPal'),
(4, '2026-11-04', 200.00, N'Contanti', N'In attesa', N'TRX-004', N'Pagamento da verificare'),
(5, '2026-11-05', 100.00, N'Carta', N'Rimborsato', N'TRX-005', N'Pagamento rimborsato');


SELECT * FROM Pagamenti;


SELECT 
    Nome + ' ' + Cognome AS [Nome completo],
    CodiceFiscale,
    Stipendio
FROM Dipendenti
WHERE Stipendio BETWEEN 2000 AND 4000
AND Stato = 'Attivo'
ORDER BY Stipendio DESC;

