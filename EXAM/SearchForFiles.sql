CREATE PROC usp_SearchForFiles(@fileExtension VARCHAR(10))
AS
BEGIN
	SELECT 
		Id, 
		[Name], 
		CONCAT(CAST(Size AS VARCHAR(MAX)), 'KB') AS Size
	FROM Files f
	WHERE [Name] LIKE ('%' + @fileExtension)
	ORDER BY Id, [Name], f.Size DESC
END