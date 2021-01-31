SELECT TOP(5) CountryName, r.RiverName
FROM Countries c
	LEFT JOIN CountriesRivers cr ON c.CountryCode = cr.CountryCode
	LEFT JOIN Rivers r ON cr.RiverId = r.Id
WHERE ContinentCode = 'AF'
ORDER BY CountryName