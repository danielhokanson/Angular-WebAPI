CREATE TABLE [dbo].[Activity] (
    [Id]        BIGINT   IDENTITY (1, 1) NOT NULL,
    [StartDate] DATETIME NOT NULL,
    [EndDate]   DATETIME NULL,
    [isActive]  AS       (case when getutcdate()>=[StartDate] AND getutcdate()<=coalesce([EndDate],dateadd(day,(1),getutcdate())) then (1) else (0) end),
    CONSTRAINT [PK_Activity] PRIMARY KEY CLUSTERED ([Id] ASC)
);

