﻿CREATE FUNCTION [dbo].[Hash]
(
	@salt NVARCHAR(255),
	@password NVARCHAR(255)
)
RETURNS NVARCHAR
AS
BEGIN
	RETURN HASHBYTES('SHA2_512', @salt + @password + @salt)
END
