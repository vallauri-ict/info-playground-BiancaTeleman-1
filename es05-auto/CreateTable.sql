CREATE TABLE [dbo].[Proprietari]
(
	[CodF] INT PRIMARY KEY IDENTITY(1,1), 
    [Nome] VARCHAR(20) NOT NULL, 
    [Residenza] VARCHAR(50) NOT NULL,

)

CREATE TABLE [dbo].[Assicurazioni]
(
	[CodAss] INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    [Nome] VARCHAR(30) NOT NULL, 
    [Sede] VARCHAR(30) NOT NULL
)

CREATE TABLE [dbo].[Auto]
(
	[Targa] varchar(10) NOT NULL PRIMARY KEY,
	[Marca] varchar(20) NOT NULL,
	[Cilindrata] int NOT NULL,
	[Potenza] int NOT NULL, 
   /* [CodF] int NOT NULL,
    [CodAss] int NOT NULL, */
	CodF int FOREIGN KEY REFERENCES Proprietari(CodF) NOT NULL,
	CodAss int FOREIGN KEY REFERENCES Assicurazioni(CodAss) NOT NULL
    /*CONSTRAINT [FK_Auto_ToTable] FOREIGN KEY ([CodF]) REFERENCES [Proprietari]([CodF]), 
    CONSTRAINT [FK_Auto_ToTable_1] FOREIGN KEY ([CodAss]) REFERENCES [Assicurazioni]([CodAss])*/
)




CREATE TABLE [dbo].[Sinistro]
(
	[CodS] INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    [Localita] VARCHAR(30) NOT NULL, 
    [Data] DATE NOT NULL

)

CREATE TABLE [dbo].[Autocoinvolte] (
    [CodS]            INT          NOT NULL,
    [Targa]           VARCHAR (10) NOT NULL,
    [ImportoDellAnno] INT          NOT NULL,
    PRIMARY KEY CLUSTERED ([CodS] ASC, [Targa] ASC),
    FOREIGN KEY ([CodS]) REFERENCES [dbo].[Sinistro] ([CodS]),
    FOREIGN KEY ([Targa]) REFERENCES [dbo].[Auto] ([Targa])
)