CREATE TABLE Impiegato(
nome varchar(30) PRIMARY KEY,
titolo varchar(50),
eta int NOT NULL,
salario decimal(12,2),
dip char(1));

CREATE TABLE [dbo].[Cliente]
(
	[IdCliente] INT NOT NULL PRIMARY KEY IDENTITY, 
    [nome] VARCHAR(30) NOT NULL, 
    [cognome] VARCHAR(50) NOT NULL, 
    [citta] VARCHAR(50) NOT NULL, 
    [stato] VARCHAR(3) NOT NULL
);

CREATE TABLE [dbo].[Acquisto]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [IdCliente] INT NOT NULL, 
    [dataDiOrdinazione] DATE NOT NULL, 
    [item] INT NOT NULL, 
    [quantita] INT NOT NULL, 
    [prezzo] DECIMAL(12, 2) NOT NULL
)

