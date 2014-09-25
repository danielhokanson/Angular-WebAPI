CREATE TABLE [dbo].[UserLoginActivityIX] (
    [Id]         BIGINT IDENTITY (1, 1) NOT NULL,
    [UserId]     BIGINT NOT NULL,
    [ActivityId] BIGINT NOT NULL,
    [isFailure]  BIT    NOT NULL,
    CONSTRAINT [PK_UserLoginActivityIX] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_UserLoginActivityIX_Activity] FOREIGN KEY ([ActivityId]) REFERENCES [dbo].[Activity] ([Id]),
    CONSTRAINT [FK_UserLoginActivityIX_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
);

