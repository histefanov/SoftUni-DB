/*CREATE DATABASE Hotel*/

CREATE TABLE Employees
(
	Id INT PRIMARY KEY IDENTITY,
	FirstName VARCHAR(30) NOT NULL,
	LastName VARCHAR(30) NOT NULL,
	Title VARCHAR(80) NOT NULL,
	Notes VARCHAR(500)
)

INSERT INTO Employees(FirstName, LastName, Title, Notes) VALUES
	('Ico', 'Icov', 'Picolo', 'mnoo ba4ka'),
	('Gosho', 'Goshkov', 'Desk', 'lafi qko'),
	('Dido', 'Didkov', 'Barista', 'burka kokteili')

CREATE TABLE Customers
(
	Id INT PRIMARY KEY IDENTITY,
	FirstName VARCHAR(30) NOT NULL,
	LastName VARCHAR(30) NOT NULL,
	PhoneNumber VARCHAR(20) NOT NULL,
	EmergencyName VARCHAR(80) NOT NULL,
	EmergencyNumber VARCHAR(20) NOT NULL,
	Notes VARCHAR(500)
)

INSERT INTO Customers(FirstName, LastName, PhoneNumber, EmergencyName, EmergencyNumber, Notes) VALUES
	('Barack', 'Obama', '0889696969', 'Michelle Obama', '+4472504233', 'prezidentski apartament!'),
	('KSI', 'OlajideBT', '+447448443445', 'Deji', '+4000040004', NULL),
	('Geri', 'Nikol', '086969420', 'Ico', '0889252525', 'taino si pada po ico')

CREATE TABLE RoomStatus
(
	RoomStatus VARCHAR(30) PRIMARY KEY,
	Notes VARCHAR(500)
)

INSERT INTO RoomStatus(RoomStatus, Notes) VALUES
	('Free', NULL),
	('Occupied', NULL),
	('Unavailable', NULL)

CREATE TABLE RoomTypes
(
	RoomType VARCHAR(50) PRIMARY KEY,
	Notes VARCHAR(500)
)

INSERT INTO RoomTypes(RoomType, Notes) VALUES
	('Studio Apt.', 'smol'),
	('Two Bedroom Apt.', 'aight'),
	('Presidential Suite', 'big boi')

CREATE TABLE BedTypes
(
	BedType VARCHAR(50) PRIMARY KEY,
	Notes VARCHAR(500)
)

INSERT INTO BedTypes(BedType, Notes) VALUES
	('Kingsize', 'biggg'),
	('Single bed', 'smol'),
	('Waterbed', 'wtf')

CREATE TABLE Rooms
(
	RoomNumber SMALLINT PRIMARY KEY,
	RoomType VARCHAR(50) FOREIGN KEY REFERENCES RoomTypes(RoomType) NOT NULL,
	BedType VARCHAR(50) FOREIGN KEY REFERENCES BedTypes(BedType),
	Rate DECIMAL(6,2) NOT NULL,
	RoomStatus VARCHAR(30) FOREIGN KEY REFERENCES RoomStatus(RoomStatus),
	Notes VARCHAR(500)
)

INSERT INTO Rooms(RoomNumber, RoomType, BedType, Rate, RoomStatus, Notes) VALUES
	(101, 'Studio Apt.', 'Single bed', 49.99, 'Occupied', 'Loud couple'),
	(213, 'Two Bedroom Apt.', 'Kingsize', 119.49, 'Free', 'Overrated'),
	(444, 'Presidential Suite', 'Waterbed', 300, 'Free', 'imam pari ugajdam si')

CREATE TABLE Payments
(
	Id INT PRIMARY KEY IDENTITY,
	EmployeeId INT FOREIGN KEY REFERENCES Employees(Id) NOT NULL,
	PaymentDate SMALLDATETIME NOT NULL,
	AccountNumber VARCHAR(50) NOT NULL,
	FirstDateOccupied DATE NOT NULL,
	LastDateOccupied DATE NOT NULL,
	TotalDays SMALLINT NOT NULL,
	AmountCharged DECIMAL(7,2) NOT NULL,
	TaxRate DECIMAL(5,2) NOT NULL,
	TaxAmount DECIMAL(6,2) NOT NULL,
	PaymentTotal DECIMAL(7,2) NOT NULL,
	Notes VARCHAR(500)
)

INSERT INTO Payments (
			EmployeeId, PaymentDate, AccountNumber, 
			FirstDateOccupied, LastDateOccupied, TotalDays, 
			AmountCharged, TaxRate, TaxAmount, PaymentTotal, Notes)
				VALUES
					(1, '2020-12-23', '555443053043', '2020-12-23', '2020-12-26', 4, 199.96, 20, 40, 239.96, NULL),
					(2, '2020-12-24', '554261774443', '2020-12-28', '2021-01-03', 7, 2100, 20, 420, 2520.00, NULL),
					(3, '2020-12-22', '555559776143', '2020-12-30', '2020-01-01', 3, 360, 20, 72, 432, NULL)

CREATE TABLE Occupancies
(
	Id INT PRIMARY KEY IDENTITY,
	EmployeeId INT FOREIGN KEY REFERENCES Employees(Id) NOT NULL,
	DateOccupied DATE NOT NULL,
	AccountNumber VARCHAR(50) NOT NULL,
	RoomNumber SMALLINT FOREIGN KEY REFERENCES Rooms(RoomNumber) NOT NULL,
	RateApplied DECIMAL(7,2) NOT NULL,
	PhoneCharge DECIMAL(5,2),
	Notes VARCHAR(500)
)

INSERT INTO Occupancies(EmployeeId, DateOccupied, AccountNumber, RoomNumber, RateApplied, PhoneCharge, Notes) VALUES
	(1, '2020-12-22', '42199599534', 213, 119.49, 13.43, 'noice'),
	(2, '2020-12-13', '42386775534', 101, 49.99, 3.24, 'noicee'),
	(3, '2020-12-31', '42199599534', 444, 300, 0, 'noiceeeee')