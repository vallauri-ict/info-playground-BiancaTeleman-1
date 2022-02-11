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
	CREATE TRIGGER [dbo].[TriggerUpdateNew]
	ON [dbo].[Driver]
	AFTER UPDATE
	AS BEGIN
		SET NoCount ON

		DECLARE @currDate DATETIME
		SET @currDate=CURRENT_TIMESTAMP

		INSERT INTO StoricoAggiornamenti(
		number,
		full_name,
		country,
		date_birth,
		team_id,
		podiums_number,
		numerNew,
		full_nameNew,
		countryNew,
		date_birthNew,
		team_idNew,
		podiums_numberNew,
		data)
		SELECT d.*,i.*
		FROM deleted d,inserted i
		WHERE d.number=i.number
		)