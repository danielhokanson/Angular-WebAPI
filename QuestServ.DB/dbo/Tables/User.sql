CREATE TABLE [dbo].[User] (
    [Id]              BIGINT         IDENTITY (1, 1) NOT NULL,
    [Email]           NVARCHAR (255) NOT NULL,
    [Password]        NVARCHAR (500) NOT NULL,
    [FirstName]       NVARCHAR (255) NULL,
    [LastName]        NVARCHAR (255) NULL,
    [MobilePhoneId]   NCHAR (10)     NULL,
    [IsAttemptLocked] AS             ([dbo].[isAttemptLocked]([Id])),
    CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED ([Id] ASC)
);

