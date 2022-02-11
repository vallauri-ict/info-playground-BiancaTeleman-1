CREATE TABLE [dbo].[Driver] (
    [number]         INT           NOT NULL,
    [full_name]      VARCHAR (100) NULL,
    [country]        CHAR (2)      NOT NULL,
    [date_birth]     DATE          NULL,
    [team_id]        INT           NULL,
    [podiums_number] INT           NULL,
    PRIMARY KEY CLUSTERED ([number] ASC)
);


GO
CREATE TRIGGER [TriggerUpdate]
	ON [dbo].[Driver]
	AFTER UPDATE
	AS BEGIN
		DECLARE @number int
		DECLARE @numberNew int
		DECLARE @fullName varchar(100)
		DECLARE @fullNameNew varchar(100)
		DECLARE @Country char(2)
		DECLARE @CountryNew char(2)
		DECLARE @dateBirth date
		DECLARE @dateBirthNew date
		DECLARE @teamId int
		DECLARE @teamIdNew int
		DECLARE @podiumsNumber int
		DECLARE @podiumsNumberNew int
		DECLARE @data datetime

		SET @number = (SELECT number FROM deleted)
		SET @numberNew = (SELECT number FROM inserted)
		SET @fullName = (SELECT full_name FROM deleted)
		SET @fullNameNew = (SELECT full_name FROM inserted)
		SET @Country = (SELECT country FROM deleted)
		SET @CountryNew = (SELECT country FROM inserted)
		SET @dateBirth = (SELECT date_birth FROM deleted)
		SET @dateBirthNew = (SELECT date_birth FROM inserted)
		SET @teamId = (SELECT team_id FROM deleted)
		SET @teamIdNew = (SELECT team_id FROM inserted)
		SET @podiumsNumber = (SELECT podiums_number FROM deleted)
		SET @podiumsNumberNew = (SELECT podiums_number FROM inserted)
		SET @data = GETDATE()

		insert into StoricoAggiornamenti values(@number, @fullName, @Country, @dateBirth, @teamId, @podiumsNumber, @numberNew, @fullNameNew, @CountryNew, @dateBirthNew, @teamIdNew, @podiumsNumberNew, @data)
	END
GO
CREATE TRIGGER [Trigger]
	ON [dbo].[Driver]
	AFTER DELETE
	AS BEGIN
		DECLARE @number int
		DECLARE @fullName varchar(100)
		DECLARE @country char(2)
		DECLARE @dateBirth date
		DECLARE @teamId int
		DECLARE @podiumsNumber int
		DECLARE @date datetime

		SET @number = (SELECT number FROM deleted)
		SET @fullName = (SELECT full_name FROM deleted)
		SET @country = (SELECT country FROM deleted)
		SET @dateBirth = (SELECT date_birth FROM deleted)
		SET @teamId = (SELECT team_id FROM deleted)
		SET @podiumsNumber = (SELECT podiums_number FROM deleted)
		SET @date = GETDATE()

		insert into StoricoCancellazioni values(@number, @fullName, @country, @dateBirth, @teamId, @podiumsNumber, @date)
	END
GO

CREATE TRIGGER [StoricoDeleteNew]
	ON [dbo].[Driver]
	FOR DELETE
	AS BEGIN
		DECLARE @currDate DATETIME
		SET @currDate=CURRENT_TIMESTAMP

		insert into StoricoCancellazioni values(number,full_name,country,date_birth,team_id,podiums_number,data)
		select d.number,d.full_name,d.country,d.date_birth,d.team_id,d.podiums_number
		from deleted d
	END
GO
