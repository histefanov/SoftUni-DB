SELECT Count(*) as [Count] 
FROM Countries
WHERE CountryCode NOT IN
	(
	SELECT CountryCode
	FROM MountainsCountries
	)