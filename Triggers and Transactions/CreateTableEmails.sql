CREATE TRIGGER tr_CreateEmail
ON Logs AFTER INSERT
AS
BEGIN
	INSERT INTO NotificationEmails(Recipient, [Subject], Body)
		SELECT
			AccountId,
			'Balance change for account: ' + CAST(AccountId AS NVARCHAR(10)),
			CONCAT('On ', CONVERT(VARCHAR, GETDATE(), 0), ' your balance was changed from ', 
				   CAST(OldSum AS VARCHAR(20)), ' to ', CAST(NewSum AS VARCHAR(20)), '.')
		FROM inserted
END