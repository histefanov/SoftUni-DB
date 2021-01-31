SELECT 
	mc.CountryCode,
	COUNT(*) AS MountainRanges
FROM MountainsCountries mc
	LEFT JOIN Mountains m ON m.Id = mc.MountainId
	WHERE mc.CountryCode IN ('US', 'BG', 'RU')
	GROUP BY CountryCode
