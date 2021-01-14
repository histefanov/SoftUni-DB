/*CREATE DATABASE CarRental*/

CREATE TABLE Categories
(
	Id INT PRIMARY KEY IDENTITY,
	CategoryName VARCHAR(50) NOT NULL,
	DailyRate DECIMAL(18,2) NOT NULL,
	WeeklyRate DECIMAL(18,2) NOT NULL,
	MonthlyRate DECIMAL(18,2) NOT NULL,
	WeekendRate DECIMAL(18,2) NOT NULL,
)

INSERT INTO Categories(CategoryName, DailyRate, WeeklyRate, MonthlyRate, WeekendRate) VALUES
('Regular', 29.99, 189.99, 649.99, 54.99),
('Premium', 45, 300, 1190, 80),
('Deluxe', 100, 650, 2750, 190)

CREATE TABLE Cars
(
	Id INT PRIMARY KEY IDENTITY,
	PlateNumber VARCHAR(10) NOT NULL,
	Manufacturer VARCHAR(30) NOT NULL,
	Model VARCHAR(30) NOT NULL,
	CarYear SMALLINT,
	CategoryId INT,
	Doors TINYINT,
	Picture NVARCHAR(MAX),
	Condition VARCHAR(200),
	Available BIT NOT NULL
)

INSERT INTO Cars (PlateNumber, Manufacturer, Model, CarYear, CategoryId, Doors, Picture, Condition, Available) VALUES
('CA6788CB', 'Skoda', 'Fabia', 2018, 1, 5, 'icorental.bg/regular/fabia.jpg', 'Mint', 1),
('CA1221AK', 'VW', 'Passat', 2019, 2, 5, 'icorental.bg/premium/passat.jpg', 'Excellent', 1),
('CC777777', 'Mercedes', 'S63 AMG', 2020, 3, 5, 'icorental.bg/deluxe/s-class.png', 'Brand new', 0)

CREATE TABLE Employees
(
	Id INT PRIMARY KEY IDENTITY,
	FirstName NVARCHAR(50) NOT NULL,
	LastName NVARCHAR(50) NOT NULL,
	Title VARCHAR(50) NOT NULL,
	Notes NVARCHAR(MAX)
)

INSERT INTO Employees(FirstName, LastName, Title, Notes) VALUES
('Goshko', 'Peshov', 'Rental Assistant', 'Still doing a 6 month trial period'),
('Pesho', 'Goshov', 'Office Manager', 'To be promoted within 8 weeks.'),
('Ico', 'Pirona', 'CEO', 'Young millionaire')


CREATE TABLE Customers
(
	Id INT PRIMARY KEY IDENTITY,
	DriverLicenseNumber VARCHAR(20) NOT NULL,
	FullName NVARCHAR(200) NOT NULL,
	[Address] NVARCHAR(300) NOT NULL,
	City NVARCHAR(50) NOT NULL,
	ZIPCode NVARCHAR(20) NOT NULL,
	Notes NVARCHAR(MAX)
)

INSERT INTO Customers(DriverLicenseNumber, FullName, [Address], City, ZIPCode, Notes) VALUES
('88843423', 'Mitko Hristov', 'ul. Bezbog 66', 'Srebarna', '7553', 'Mo6enik'),
('48840353', 'Didaka', 'ul. Pichovska', 'Varna', '5000', 'Top klientela'),
('19465375', 'Mitaka', 'ul. VSilistra', 'Silistra', '7500', 'Redoven klient')

CREATE TABLE RentalOrders
(
	Id INT PRIMARY KEY IDENTITY,
	EmployeeId INT NOT NULL,
	CustomerId INT NOT NULL,
	CarId INT NOT NULL,
	TankLevel TINYINT NOT NULL,
	KilometrageStart INT NOT NULL,
	KilometrageEnd INT NOT NULL,
	TotalKilometrage INT NOT NULL,
	StartDate DATE NOT NULL,
	EndDate DATE NOT NULL,
	TotalDays INT NOT NULL,
	RateApplied DECIMAL(18,2) NOT NULL,
	TaxRate DECIMAL(18,2) NOT NULL,
	OrderStatus BIT NOT NULL,
	Notes NVARCHAR(MAX)
)

INSERT INTO RentalOrders (EmployeeId, CustomerId, CarId, 
						  TankLevel, KilometrageStart, KilometrageEnd, 
						  TotalKilometrage, StartDate, EndDate, TotalDays,
						  RateApplied, TaxRate, OrderStatus, Notes)
VALUES
(1, 2, 3, 50, 850, 8993, 8993 - 850, '2020-12-12', '2021-01-14', 33, 100, 20, 1, NULL),
(2, 3, 1, 30, 16000, 17550, 1550, '2020-12-14', '2021-01-17', 3, 45, 20, 1, NULL),
(3, 1, 2, 25, 53000, 53890, 890, '2020-12-19', '2020-12-21', 2, 29.99, 20, 1, NULL)