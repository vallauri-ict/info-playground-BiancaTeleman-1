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