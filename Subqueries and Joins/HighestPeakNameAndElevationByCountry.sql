SELECT TOP(5)
	Country, [Highest Peak Name], [Highest Peak Elevation], Mountain
FROM
(SELECT 
	c.CountryName AS Country,
	ISNULL(p.PeakName, '(no highest peak)') AS [Highest Peak Name],
	MAX(ISNULL(p.Elevation, 0)) AS [Highest Peak Elevation],
	ISNULL(m.MountainRange, '(no mountain)') AS Mountain,
	DENSE_RANK() OVER(PARTITION BY c.CountryName ORDER BY MAX(p.Elevation) DESC) AS [Rank]
FROM Countries c
	LEFT JOIN MountainsCountries mc ON c.CountryCode = mc.CountryCode
	LEFT JOIN Mountains m ON mc.MountainId = m.Id
	LEFT JOIN Peaks p ON m.Id = p.MountainId
	GROUP BY c.CountryName, p.PeakName, m.MountainRange
) AS sq
WHERE [Rank] = 1
ORDER BY Country, [Highest Peak Name]