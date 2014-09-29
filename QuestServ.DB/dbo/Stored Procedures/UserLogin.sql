CREATE PROCEDURE [dbo].[UserLogin]
	@email NVARCHAR(255),
	@password NVARCHAR(255)
AS
	DECLARE @userId BIGINT = (SELECT ID FROM [User] WHERE email = @email)

	INSERT INTO Activity(StartDate, EndDate)
	SELECT GETUTCDATE(), GETUTCDATE()

	DECLARE @ActivityId BIGINT = SCOPE_IDENTITY()
	DECLARE @loginFailed BIT = 1

	SELECT @loginFailed = 0 FROM [User]
	WHERE IsAttemptLocked = 0
	AND Id = @userId
	AND Password = dbo.[HASH](@email, @password)

	INSERT INTO UserLoginActivityIX(UserId, ActivityId, isFailure)
	VALUES(@userId, @ActivityId, @loginFailed)


RETURN 0
