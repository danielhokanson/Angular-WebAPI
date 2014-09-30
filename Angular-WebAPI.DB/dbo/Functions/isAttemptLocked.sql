CREATE FUNCTION isAttemptLocked(@UserId BIGINT)
RETURNS BIT
AS
BEGIN
DECLARE @isLocked BIT = 0
SELECT @isLocked = 1
WHERE EXISTS (SELECT usrAct.UserId FROM UserLoginActivityIX usrAct
				CROSS APPLY (SELECT TOP 5 act.* FROM Activity act 
							WHERE act.Id = usrAct.ActivityId 
								AND act.StartDate >= DATEADD(minute,-5,GETUTCDATE())
							ORDER BY act.StartDate DESC) act
				WHERE usrAct.UserId = @UserId
			 GROUP BY usrAct.UserId
			  HAVING SUM(CONVERT(INT,usrAct.isFailure)) >= 5)
RETURN @isLocked
				
END