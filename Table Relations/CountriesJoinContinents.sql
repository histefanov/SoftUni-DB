SELECT Countries.CountryName, Countries.Capital, Countries.Population, Continents.ContinentName
	FROM Countries 
	JOIN Continents ON Countries.ContinentCode = Continents.ContinentCode
	ORDER BY Countries.CountryName