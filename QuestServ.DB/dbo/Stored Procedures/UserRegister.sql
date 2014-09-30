CREATE PROC [UserRegister] (@email NVARCHAR(255), @password NVARCHAR(255))
AS
INSERT INTO [User](Email, Password)
VALUES (@email, dbo.[Hash](@email, @password))