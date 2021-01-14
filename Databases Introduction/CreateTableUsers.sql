CREATE TABLE Users
(
	Id BIGINT IDENTITY PRIMARY KEY NOT NULL,
	Username VARCHAR(30) NOT NULL,
	[Password] VARCHAR(26) NOT NULL,
	ProfilePicture VARCHAR(MAX),
	LastLoginTime DATETIME,
	IsDeleted BIT
)

INSERT INTO Users(Username, [Password], ProfilePicture, LastLoginTime, IsDeleted) VALUES
('Pesho', 'Peshkata123', 'nqkakuvlink.com', '2021-01-14 15:45:55', 0),
('Ico', 'bestPass333', 'linkchezaprofilna.net/snimka.jpg', '2021-01-12', 1),
('Ivan', 'vankataEvro6969', 'pics.bg/snimka.jpg', '2021-01-10', 0),
('CecoSokola', 'sOkOlOv_42', 'facebook.com/cecosokolov.jpg',' 2021-01-14 11:23:14', 0),
('Teodor4o', 'tedkoto000', 'tinyurl.org/tedito.png', '2021-01-13 14:33', 0)

SELECT * FROM Users