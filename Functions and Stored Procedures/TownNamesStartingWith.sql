CREATE PROC usp_GetTownsStartingWith (@FirstPart NVARCHAR(MAX))
AS
	SELECT [Name]
		FROM Towns
		WHERE [Name] LIKE @FirstPart + '%'