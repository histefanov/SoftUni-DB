CREATE TABLE People
(
	Id INT PRIMARY KEY IDENTITY,
	[Name] NVARCHAR(200) NOT NULL,
	Picture VARCHAR(MAX),
	Height DECIMAL(5,2),
	[Weight] DECIMAL(5,2),
	Gender CHAR(1) NOT NULL,
	Birthdate DATE NOT NULL,
	Biography NVARCHAR(MAX)
)

INSERT INTO People ([Name], Picture, Height, [Weight], Gender, Birthdate, Biography) VALUES
('Hristiyan', 'snim4ici.com/ico.jpg', 184, 77, 'm', '1996-04-01', 'Lentqistva cql jivot'),
('Mitko', 'snim4ici.com/mitko.jpg', 178, 80, 'm', '1990-11-17', '4i4o doktor'),
('Ivan', 'snim4ici.com/vankata.jpg', 178, 76, 'm', '1988-06-09', 'Pojarnikar'),
('Ediz', 'snim4ici.com/edopedo.jpg', 172, 95, 'm', '1996-09-24', 'gospodin seo'),
('Simonka', 'sni4ici.com/monka.jpg', 160, 53, 'f', '1998-02-03', 'gospojica masajistkata')