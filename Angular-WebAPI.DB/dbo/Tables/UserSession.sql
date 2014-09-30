/*
The database must have a MEMORY_OPTIMIZED_DATA filegroup
before the memory optimized object can be created.

The bucket count should be set to about two times the 
maximum expected number of distinct values in the 
index key, rounded up to the nearest power of two.
*/

CREATE TABLE [dbo].[UserSession]
(
	[Id] BIGINT NOT NULL PRIMARY KEY NONCLUSTERED IDENTITY(1,1),
	UserId BIGINT NULL,
	SessionKey UNIQUEIDENTIFIER NOT NULL,
	UserAgent NVARCHAR(500) NULL,
	UserIp NVARCHAR(255) NULL,
	DateCreated DATETIME DEFAULT(GETUTCDATE()) NOT NULL,
    [DateLastUpdated] DATETIME NOT NULL DEFAULT (GETUTCDATE()),
    [DateToExpire] DATETIME NOT NULL DEFAULT (DATEADD(minute, 15, GETUTCDATE())),
    [SessionData] VARBINARY(MAX) NULL,
	CONSTRAINT FK_UserSession_User FOREIGN KEY (UserId) REFERENCES [dbo].[User] (Id)
)