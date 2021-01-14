CREATE TABLE Directors
(
	Id INT PRIMARY KEY IDENTITY,
	DirectorName NVARCHAR(200) NOT NULL,
	Notes NVARCHAR(MAX)
)

INSERT INTO Directors (DirectorName, Notes) VALUES
('Quentin Tarantino', NULL),
('Steven Spielberg', NULL),
('Christopher Nolan', NULL),
('Woody Allen', NULL),
('David Fincher', NULL)

CREATE TABLE Genres
(
	Id INT PRIMARY KEY IDENTITY,
	GenreName VARCHAR(40) NOT NULL,
	Notes NVARCHAR(MAX)
)

INSERT INTO Genres (GenreName, Notes) VALUES
('Drama', NULL),
('Comedy', NULL),
('Action', NULL),
('Thriller', NULL),
('Sci-Fi', Null)

CREATE TABLE Categories
(
	Id INT PRIMARY KEY IDENTITY,
	CategoryName VARCHAR(40) NOT NULL,
	Notes VARCHAR(MAX)
)

INSERT INTO Categories (CategoryName, Notes) VALUES
('Kids', NULL),
('Family', NULL),
('Adult', NULL),
('Sensitive', NULL),
('Pornography', NULL)

CREATE TABLE Movies
(
	Id INT PRIMARY KEY IDENTITY,
	Title NVARCHAR(200) NOT NULL,
	DirectorId INT NOT NULL,
	CopyrightYear INT NOT NULL,
	[Length] SMALLINT NOT NULL,
	GenreId INT NOT NULL,
	CategoryId INT NOT NULL,
	Rating DECIMAL(3,1) CHECK(Rating >= 1 AND Rating <= 10) NOT NULL,
	Notes VARCHAR(MAX)
)

INSERT INTO Movies (Title, DirectorId, CopyrightYear, [Length], GenreId, CategoryId, Rating, Notes) VALUES
('Interstellar', 3, 2013, 180, 5, 3, 8.5, 'Best space movie ever'),
('The Hateful Eight', 1, 2015, 193, 4, 4, 8.2, 'Keeps you on your toes for three hours'),
('Midnight in Paris', 4, 2011, 135, 1, 2, 7.9, 'Famous Woody Allen movie'),
('Se7en', 5, 1995, 146, 4, 4, 8.5, 'One of my all time favourites'),
('Jaws', 2, 1975, 130, 4, 3, 7.8, 'Kind of overrated imo')