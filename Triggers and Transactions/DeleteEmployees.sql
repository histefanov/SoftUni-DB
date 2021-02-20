CREATE TABLE Deleted_Employees
(
	EmployeeId INT PRIMARY KEY,
	FirstName VARCHAR(50) NOT NULL,
	LastName VARCHAR(50) NOT NULL,
	MiddleName VARCHAR(50),
	JobTitle VARCHAR(50) NOT NULL,
	DepartmentId INT FOREIGN KEY REFERENCES Departments(DepartmentId),
	Salary MONEY NOT NULL
)

CREATE TRIGGER tr_InsertDeletedEmployeeRecords
ON Employees AFTER DELETE
AS
BEGIN
	INSERT INTO Deleted_Employees
		SELECT
			EmployeeID, FirstName, LastName, MiddleName, JobTitle, DepartmentID, Salary
		FROM deleted
END