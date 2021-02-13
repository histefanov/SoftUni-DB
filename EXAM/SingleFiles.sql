SELECT 
	fp.Id,
	fp.[Name],
	CONCAT(CAST(fp.Size AS VARCHAR(MAX)), 'KB') AS Size
FROM Files f
	RIGHT JOIN Files fp ON f.ParentId = fp.Id
WHERE f.ParentId IS NULL
ORDER BY Id, fp.[Name], fp.Size
