use Azienda_DB;

-- Creazione della tabelle Reparti
CREATE TABLE Reparti(
	RepartoId INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	NomeReparto NVARCHAR(50) NOT NULL,
	Descrizone NVARCHAR(250) NOT NULL,
	Sede NVARCHAR(100) NULL,
	DataCreazione DATETIME2 NOT NULL
		CONSTRAINT DF_Reparti_DataCreazione
		DEFAULT SYSDATETIME(),

	CONSTRAINT UQ_Reparti_NomeReparto
		UNIQUE (NomeReparto)
);


-- Creazione della Tabella Dipendenti
CREATE TABLE Dipendenti(
	DipendenteId INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	Nome NVARCHAR(50) NOT NULL,
	Cognome NVARCHAR(50) NOT NULL,
	CodiceFiscale CHAR(16) UNIQUE NOT NULL,
	DataNascita Date NULL,
	Sesso CHAR(1),
	Email NVARCHAR(100) NOT NULL,
	Telefono NVARCHAR(25) NULL,
	Indirizzo NVARCHAR(100) NULL,
	Citta NVARCHAR(100) NULL,
	DataAssunzione DATE DEFAULT GETDATE(),
	Stipendio DECIMAL(12,5) NOT NULL,

	-- colonna per Relazione fra tabelle 
	RepartoId INT NOT NULL,
	ResponsabileId INT NULL,

	Stato NVARCHAR(20) NOT NULL
		CONSTRAINT DF_Dipendenti_Stato
		DEFAULT N'Attivo',

	DataCreazione DATETIME2 NOT NULL
		CONSTRAINT DF_Dipendenti_DataCreazione
		DEFAULT SYSDATETIME(),

	CONSTRAINT UQ_Dipendenti_Email
		UNIQUE (Email),

	CONSTRAINT CK_Dipendenti_Dtipendio
			CHECK (Stipendio >= 0),
	
	CONSTRAINT CK_Dipendenti_Sesso
		CHECK (
			Sesso IS NULL
			OR Sesso IN ('M', 'F', 'A')
		),

	CONSTRAINT FK_Dipendenti_Reparti
        FOREIGN KEY (RepartoId) REFERENCES Reparti(RepartoId),
    CONSTRAINT FK_Dipendenti_Respoinsabile 
        FOREIGN KEY (ResponsabileId) REFERENCES Dipendenti(DipendenteId)
);

-- Creazione della tabelle Clienti
CREATE TABLE Clienti(
	ClienteId INT PRIMARY KEY IDENTITY(1,1),
	TipoCLiente NVARCHAR(20) NOT NULL
		CONSTRAINT DF_Cliente_Tipo
		DEFAULT N'Privato',
	Nome NVARCHAR(50) NULL,
	Cognome NVARCHAR(50) NULL,
	RagioneSociale NVARCHAR(150) NOT NULL,
	Partita_IVA CHAR(11) UNIQUE NOT NULL,
	Email NVARCHAR(150) UNIQUE NOT NULL,
	Indirizzo NVARCHAR(200) NULL,
	CAP NVARCHAR(10) NULL,
	Citta NVARCHAR(100) NULL,
	Povincia NVARCHAR(50) NULL,
	Paese NVARCHAR(50) NOT NULL
		CONSTRAINT DF_Clienti_Paese
		DEFAULT N'Italia',
	DataRegistrazione DATETIME2 NOT NULL
        CONSTRAINT DF_Clienti_DataRegistrazione
        DEFAULT SYSDATETIME(),

    Stato NVARCHAR(20) NOT NULL
        CONSTRAINT DF_Clienti_Stato
        DEFAULT N'Attivo',

    CONSTRAINT CK_Clienti_Tipo
        CHECK (
            TipoCliente IN (N'Privato', N'Azienda')
        ),

    CONSTRAINT CK_Clienti_Stato
        CHECK (
            Stato IN (N'Attivo', N'Inattivo')
        ),

    CONSTRAINT CK_Clienti_Anagrafica
        CHECK (
            (TipoCliente = N'Privato'
                AND Nome IS NOT NULL
                AND Cognome IS NOT NULL)
            OR
            (TipoCliente = N'Azienda'
                AND RagioneSociale IS NOT NULL)
        )
);


-- Creazione della tabelle Fornitori
CREATE TABLE Fornitori
(
    FornitoreId INT PRIMARY KEY IDENTITY(1,1) NOT NULL,

    RagioneSociale NVARCHAR(150) NOT NULL,

    PartitaIVA CHAR(11) NOT NULL,

    Email NVARCHAR(150) NOT NULL,

    Telefono NVARCHAR(25) NULL,

    Indirizzo NVARCHAR(200) NULL,

    CAP NVARCHAR(10) NULL,

    Citta NVARCHAR(100) NULL,

    Paese NVARCHAR(100) NOT NULL
        CONSTRAINT DF_Fornitori_Paese
        DEFAULT N'Italia',

    DataRegistrazione DATETIME2 NOT NULL
        CONSTRAINT DF_Fornitori_DataRegistrazione
        DEFAULT SYSDATETIME(),

    Stato NVARCHAR(20) NOT NULL
        CONSTRAINT DF_Fornitori_Stato
        DEFAULT N'Attivo',

    CONSTRAINT UQ_Fornitori_PartitaIVA
        UNIQUE (PartitaIVA),

    CONSTRAINT UQ_Fornitori_Email
        UNIQUE (Email),

    CONSTRAINT CK_Fornitori_Stato
        CHECK (
            Stato IN (N'Attivo', N'Inattivo')
        )
);

-- Creazione della tabella Categorie 
CREATE TABLE Categorie(
	CategoriaId INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	NomeCategoria NVARCHAR(100) NOT NULL,
	Descrizione NVARCHAR(MAX) NULL,
	CategoriaPadreId INT NULL,
	Stato NVARCHAR(20) NOT NULL
    
	CONSTRAINT DF_Categorie_Stato
        DEFAULT N'Attivo',
	CONSTRAINT UQ_Categorie_Nome_Padre
		UNIQUE (NomeCategoria, CategoriaPadreId),
	CONSTRAINT CK_Categorie_Stato
        CHECK (
            Stato IN (N'Attivo', N'Inattivo')
        ),
	CONSTRAINT CK_Categorie_Padre
		CHECK (
			CategoriaPadreId IS NULL
			OR CategoriaPadreId <> CategoriaId
		),
	CONSTRAINT FK_Categorie_Padre
		FOREIGN KEY(CategoriaPadreId) REFERENCES Categorie(CategoriaId)
);

-- Creazione della tabella Prodotti
CREATE TABLE Prodotti(
	ProdottoId INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	CodiceProdotto NVARCHAR(30) UNIQUE NOT NULL,
	NomeProdotto NVARCHAR(150) NOT NULL,
	Descrizione NVARCHAR(500) NULL,
	CategoriaId INT NOT NULL,
	PrezzoAquisto DECIMAL(12,2) NOT NULL,
	PrezzoVendita DECIMAL(12,2) NOT NULL,
	AliquotaIVA DECIMAL(5,2) NOT NULL
		CONSTRAINT DF_Prodotti_IVA 
		DEFAULT 22.00,
	UnitaMisura NVARCHAR(20) NOT NULL
		CONSTRAINT DF_Prodotti_UnitaMisura
		DEFAULT N'Prezzo',
	DataInserimento DATETIME2 NOT NULL
        CONSTRAINT DF_Prodotti_DataInserimento
        DEFAULT SYSDATETIME(),
	Stato NVARCHAR(20) NOT NULL
        CONSTRAINT DF_Prodotti_Stato
        DEFAULT N'Attivo',
	CONSTRAINT CK_Prodotti_Prezzo
		CHECK (
			PrezzoAquisto >= 0 AND PrezzoVendita >= 0
		),
	CONSTRAINT CK_Prodotti_IVA 
		CHECK (AliquotaIVA BETWEEN 0 AND 100),
	CONSTRAINT CK_Prodotti_Stato
        CHECK (
            Stato IN (N'Attivo', N'Inattivo')
        ),

	CONSTRAINT FK_Prodotti_Categorie
		FOREIGN KEY (CategoriaId) REFERENCES Categorie(CategoriaId)
);

/* ============================================================
   8. TABELLA FORNITORIPRODOTTI
   Relazione molti-a-molti:
   Fornitori N:M Prodotti
   ============================================================ */

-- Creazione della tabella Fornitori dei Prodotti
CREATE TABLE FornitoriProdotti
(
    FornitoreId INT NOT NULL,

    ProdottoId INT NOT NULL,

    PrezzoFornitura DECIMAL(12,2) NOT NULL,

    TempoConsegnaGiorni INT NULL,

    CodiceProdottoFornitore NVARCHAR(50) NULL,

    DataUltimoAggiornamento DATETIME2 NOT NULL
        CONSTRAINT DF_FP_DataAggiornamento
        DEFAULT SYSDATETIME(),

    CONSTRAINT PK_FornitoriProdotti
        PRIMARY KEY (FornitoreId, ProdottoId),

    CONSTRAINT CK_FP_Prezzo
        CHECK (PrezzoFornitura >= 0),

    CONSTRAINT CK_FP_Tempo
        CHECK (
            TempoConsegnaGiorni IS NULL
            OR TempoConsegnaGiorni >= 0
        ),

    CONSTRAINT FK_FP_Fornitori
        FOREIGN KEY (FornitoreId)
        REFERENCES dbo.Fornitori(FornitoreId),

    CONSTRAINT FK_FP_Prodotti
        FOREIGN KEY (ProdottoId)
        REFERENCES dbo.Prodotti(ProdottoId)
);

-- creazione della Tabella degli Ordini
CREATE TABLE Ordini
(
    OrdineId INT PRIMARY KEY IDENTITY(1,1) NOT NULL,

    NumeroOrdine NVARCHAR(30) NOT NULL,

    ClienteId INT NOT NULL,

    DipendenteId INT NULL,

    DataOrdine DATETIME2 NOT NULL
        CONSTRAINT DF_Ordini_Data
        DEFAULT SYSDATETIME(),

    DataConsegnaPrevista DATE NULL,

    StatoOrdine NVARCHAR(30) NOT NULL
        CONSTRAINT DF_Ordini_Stato
        DEFAULT N'In lavorazione',

    Note NVARCHAR(500) NULL,

    CONSTRAINT UQ_Ordini_Numero
        UNIQUE (NumeroOrdine),

    CONSTRAINT CK_Ordini_Stato
        CHECK (
            StatoOrdine IN (
                N'In lavorazione',
                N'Spedito',
                N'Consegnato',
                N'Annullato'
            )
        ),

    CONSTRAINT FK_Ordini_Clienti
        FOREIGN KEY (ClienteId)
        REFERENCES dbo.Clienti(ClienteId),

    CONSTRAINT FK_Ordini_Dipendenti
        FOREIGN KEY (DipendenteId)
        REFERENCES dbo.Dipendenti(DipendenteId)
);

-- CREAZIONDE DELLA TABELLA DETTAGLIORDINE
CREATE TABLE DettagliOrdine
(
    DettaglioId INT PRIMARY KEY IDENTITY(1,1) NOT NULL,

    OrdineId INT NOT NULL,

    ProdottoId INT NOT NULL,

    Quantita INT NOT NULL,

    PrezzoUnitario DECIMAL(12,2) NOT NULL,

    Sconto DECIMAL(5,2) NOT NULL
        CONSTRAINT DF_Dettagli_Sconto
        DEFAULT 0,

    CONSTRAINT UQ_Dettagli_Ordine_Prodotto
        UNIQUE (OrdineId, ProdottoId),

    CONSTRAINT CK_Dettagli_Quantita
        CHECK (Quantita > 0),

    CONSTRAINT CK_Dettagli_Prezzo
        CHECK (PrezzoUnitario >= 0),

    CONSTRAINT CK_Dettagli_Sconto
        CHECK (Sconto BETWEEN 0 AND 100),

    CONSTRAINT FK_Dettagli_Ordini
        FOREIGN KEY (OrdineId)
        REFERENCES dbo.Ordini(OrdineId),

    CONSTRAINT FK_Dettagli_Prodotti
        FOREIGN KEY (ProdottoId)
        REFERENCES dbo.Prodotti(ProdottoId)
);


-- Creazione della tabella Pagamenti
CREATE TABLE Pagamenti
(
    PagamentoId INT PRIMARY KEY IDENTITY(1,1) NOT NULL,

    OrdineId INT NOT NULL,

    DataPagamento DATETIME2 NOT NULL
        CONSTRAINT DF_Pagamenti_Data
        DEFAULT SYSDATETIME(),

    Importo DECIMAL(12,2) NOT NULL,

    MetodoPagamento NVARCHAR(30) NOT NULL,

    StatoPagamento NVARCHAR(20) NOT NULL
        CONSTRAINT DF_Pagamenti_Stato
        DEFAULT N'Completato',

    RiferimentoTransazione NVARCHAR(100) NULL,

    Note NVARCHAR(500) NULL,

    CONSTRAINT CK_Pagamenti_Importo
        CHECK (Importo > 0),

    CONSTRAINT CK_Pagamenti_Metodo
        CHECK (
            MetodoPagamento IN (
                N'Contanti',
                N'Carta',
                N'Bonifico',
                N'PayPal'
            )
        ),

    CONSTRAINT CK_Pagamenti_Stato
        CHECK (
            StatoPagamento IN (
                N'Completato',
                N'In attesa',
                N'Fallito',
                N'Rimborsato'
            )
        ),

    CONSTRAINT FK_Pagamenti_Ordini
        FOREIGN KEY (OrdineId)
        REFERENCES dbo.Ordini(OrdineId)
);

-- Creazione della tabella Magazzino
CREATE TABLE Magazzino
(
    MagazzinoId INT PRIMARY KEY IDENTITY(1,1) NOT NULL,

    ProdottoId INT NOT NULL,

    QuantitaDisponibile INT NOT NULL
        CONSTRAINT DF_Magazzino_Quantita
        DEFAULT 0,

    ScortaMinima INT NOT NULL
        CONSTRAINT DF_Magazzino_Minima
        DEFAULT 5,

    ScortaMassima INT NULL,

    UltimoAggiornamento DATETIME2 NOT NULL
        CONSTRAINT DF_Magazzino_Aggiornamento
        DEFAULT SYSDATETIME(),


    CONSTRAINT UQ_Magazzino_Prodotto
        UNIQUE (ProdottoId),

    CONSTRAINT CK_Magazzino_Quantita
        CHECK (QuantitaDisponibile >= 0),

    CONSTRAINT CK_Magazzino_Minima
        CHECK (ScortaMinima >= 0),

    CONSTRAINT CK_Magazzino_Massima
        CHECK (
            ScortaMassima IS NULL
            OR ScortaMassima >= ScortaMinima
        ),

    CONSTRAINT FK_Magazzino_Prodotti
        FOREIGN KEY (ProdottoId)
        REFERENCES dbo.Prodotti(ProdottoId)
);

/* ============================================================
   13. CREAZIONE INDICI
   Gli indici aiutano a velocizzare le ricerche e i JOIN.
   ============================================================ */

CREATE INDEX IX_Dipendenti_RepartoId
ON dbo.Dipendenti(RepartoId);
GO

CREATE INDEX IX_Ordini_ClienteId
ON dbo.Ordini(ClienteId);
GO

CREATE INDEX IX_Ordini_DipendenteId
ON dbo.Ordini(DipendenteId);
GO

CREATE INDEX IX_Ordini_DataOrdine
ON dbo.Ordini(DataOrdine);
GO

CREATE INDEX IX_DettagliOrdine_ProdottoId
ON dbo.DettagliOrdine(ProdottoId);
GO

CREATE INDEX IX_Pagamenti_OrdineId
ON dbo.Pagamenti(OrdineId);
GO

CREATE INDEX IX_Prodotti_CategoriaId
ON dbo.Prodotti(CategoriaId);
GO

CREATE INDEX IX_FP_ProdottoId
ON dbo.FornitoriProdotti(ProdottoId);
GO