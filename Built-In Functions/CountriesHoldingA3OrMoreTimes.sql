SELECT [CountryName], [IsoCode] AS [ISO Code]
	FROM Countries
	WHERE (LEN([CountryName]) - LEN(REPLACE([CountryName], 'a', ''))) > 2
		--Alternatively: WHERE [CountryName] LIKE '%a%a%a%'
	ORDER BY [ISO Code]

