CREATE FUNCTION udf_AllUserCommits(@username VARCHAR(30))
RETURNS INT
AS
BEGIN
	RETURN
		(SELECT Count(*)
		 FROM Commits c
			JOIN Users u ON c.ContributorId = u.Id
		 WHERE u.Username = @username)
END