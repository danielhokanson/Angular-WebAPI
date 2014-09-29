CREATE PROCEDURE [dbo].[ClearExpiredSession]
AS
DELETE FROM UserSession
OUTPUT deleted.* INTO UserSessionArchive
WHERE GETUTCDATE() >= DateToExpire
