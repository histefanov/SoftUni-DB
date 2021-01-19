--CREATE DATABASE University
--USE University

CREATE TABLE Subjects
(
	SubjectID INT IDENTITY PRIMARY KEY,
	SubjectName VARCHAR(100) NOT NULL
)

CREATE TABLE Majors
(
	MajorID INT IDENTITY PRIMARY KEY,
	[Name] VARCHAR(100) NOT NULL
)

CREATE TABLE Students
(
	StudentID INT IDENTITY PRIMARY KEY,
	StudentNumber CHAR(6) NOT NULL,
	StudentName VARCHAR(100) NOT NULL,
	MajorID INT FOREIGN KEY REFERENCES Majors(MajorID) NOT NULL
)

CREATE TABLE Payments
(
	PaymentID INT IDENTITY PRIMARY KEY,
	PaymentDate DATE NOT NULL,
	PaymentAmount DECIMAL(8,2) NOT NULL,
	StudentID INT FOREIGN KEY REFERENCES Students(StudentID) NOT NULL
)

CREATE TABLE Agenda
(
	StudentID INT FOREIGN KEY REFERENCES Students(StudentID),
	SubjectID INT FOREIGN KEY REFERENCES Subjects(SubjectID),
	PRIMARY KEY(StudentID, SubjectID)
)