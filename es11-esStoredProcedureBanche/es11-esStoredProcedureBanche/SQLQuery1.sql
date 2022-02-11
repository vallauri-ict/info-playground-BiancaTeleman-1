CREATE TABLE [dbo].[banche] (
    [Id]    INT          IDENTITY (1, 1) NOT NULL,
    [Nome]  VARCHAR (50) NULL,
    [Citta] VARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

CREATE TABLE [dbo].[filiali] (
    [Id]      INT          IDENTITY (1, 1) NOT NULL,
    [IdBanca] INT          NULL,
    [Citta]   VARCHAR (50) NULL,
    [Numero]  INT          NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_filiali_banche] FOREIGN KEY ([IdBanca]) REFERENCES [dbo].[banche] ([Id])
);



CREATE TABLE [dbo].[ContaFiliali] (
    [Id]     INT IDENTITY (1, 1) NOT NULL,
    [numero] INT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);




