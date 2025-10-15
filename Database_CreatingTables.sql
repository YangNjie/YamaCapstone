USE MASTER;
DROP DATABASE IF EXISTS CapstoneAdvising;
CREATE DATABASE CapstoneAdvising;
USE CapstoneAdvising;

---Advisor table---
CREATE TABLE Advisor(
	AdvisorID INT,
	FirstName VARCHAR(50),
	LastName VARCHAR(50),
PRIMARY KEY (AdvisorID)
);
---put it Advisor content---
INSERT INTO Advisor(AdvisorID, FirstName, LastName)VALUES
(101, 'Tracy','Hofman'),
(202, 'Jerry', 'Khan'),
(303, 'Julie', 'Mayer'),
(404, 'Lisa', 'w');

---Creat a course Table---
CREATE TABLE Course(
	CourseID VARCHAR(10) NOT NULL,
	CourseName VARCHAR(100),
	Credits INT,
	
	
PRIMARY KEY(CourseID)
);

INSERT INTO Course(CourseID, CourseName, Credits) VALUES
---sEMESTER 1---
('BDAT1005', 'Data Analysis', 2),
('ITEC1011', 'Programming Logic and Design', 4),
('ITEC1003', 'Networking Fundamentals', 2),
('ITEC1016', 'Web Development Technologies', 4),
('TLIT1005', 'Technology Fundamentals', 3),
--SEMESTER 2--
('ITEC2105', 'Java Programming', 4),
('ITEC2700', 'Artificial Intelligence', 4),
('ITEC2340', 'Scripting Languages', 4),
('ITEC2317', 'Web Interactivty Tools', 4),
('ITEC2520', 'Mobile Development', 4),
('ITEC 2215', 'Linux/Web Server Admin', 4),
('ITEC 2411', 'Networking Scripting', 2),
('ITEC 2440', 'DS/IPS and Auditing', 4),
('BDAT', 'Data Visualization', 5),
('BDAT1010', 'Integ Bus SW', 3),
('PHIL1200', 'Technology Ethics', 3),
('ITEC2120', 'Database Design and SQL', 4);
---remaining semester and Gen Ed to be added---



--Create degree table--

CREATE TABLE Degree(
	DegreeID INT,
	DegreeName VARCHAR(50),
PRIMARY KEY (DegreeID)
);

---insert specific degrees----- 
INSERT INTO Degree(DegreeID, DegreeName) VALUES
(100, 'Software Development'),
(200, 'Web Development'),
(300, 'Network Management & Security'),
(400, 'Business Data Analysis');

--Student Table--

CREATE TABLE Student (
	StudentID INT NOT NULL,
	FirstName VARCHAR(50),
	LastName VARCHAR(50),
		AdvisorID int,
	PRIMARY KEY (StudentID),
	CONSTRAINT FK_StudentAdvisor FOREIGN KEY (AdvisorID) REFERENCES Advisor(AdvisorID)

);
--put in individual student values--
INSERT INTO  Student(StudentID, FirstName, LastName, AdvisorID) VALUES
	(1, 'John', 'Doe', 101),
	(2, 'John', 'Doe', 202),
	(3, 'John', 'Doe', 101),
	(4, 'John', 'Doe', 101);
	
	
	--Student To Course Table--
CREATE TABLE Student_To_Course(
	StudentID INT,
	CourseID VARCHAR(10),
	Semester VARCHAR(10),
	Year INT,
	Grade VARCHAR (2),
	PRIMARY KEY(StudentID, CourseID,Semester, Year),
  CONSTRAINT FK_Student FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
  CONSTRAINT FK_CourseID FOREIGN KEY (CourseID) REFERENCES Course(CourseID)

);

---student to degree table-- --

INSERT INTO Student_To_Course(StudentID, CourseID, Semester, Year, Grade) VALUES
(1, 'BDAT1005', 'Fall', 2020, 'A'),
(1, 'ITEC2120', 'Spring', 2025, null);

CREATE TABLE Student_To_Degree(
	StudentID INT,
	DegreeID INT,

PRIMARY KEY (StudentID, DegreeID),
FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
FOREIGN KEY (DegreeID) REFERENCES Degree(DegreeID)

);
 
---insert the values studentID and DegreeID---
INSERT INTO Student_To_Degree(StudentID, DegreeID) VALUES
(1, 100),
(2, 200),
(3, 300),
(4, 400);

--- Course_To_Degree Table---
CREATE  TABLE Course_To_Degree(
	CourseID VARCHAR(10),
	DegreeID INT,
PRIMARY KEY (CourseID, DegreeID),
FOREIGN KEY (CourseID) REFERENCES Course(CourseID),
FOREIGN KEY (DegreeID) REFERENCES Degree(DegreeID)
);

---Put in course to degree---
INSERT INTO Course_To_Degree(CourseID, DegreeID) VALUES
('BDAT1005', 100),
('BDAT1005', 200),
('BDAT1005', 300),
('ITEC1003', 400);

---Advisors_Notes table---
CREATE TABLE Advisor_Notes(
	AdvisorNotesID INT,
	AdvisorID INT,
	StudentID INT,
	Notes TEXT,
	
PRIMARY KEY (AdvisorNotesID),
FOREIGN KEY (AdvisorID) REFERENCES Advisor(AdvisorID),
FOREIGN KEY (StudentID) REFERENCES Student(StudentID)
);

--- insert advisors actual notes---
INSERT INTO Advisor_Notes(AdvisorNotesID, AdvisorID,StudentID,Notes) VALUES
(1, 101, 1, 'David would like to switch to BDAT'),
(3, 202, 2, 'Cedric is taking e electives next semester'),
(6, 303, 3, 'Mariama completed all majors'),
(9, 303, 3, 'Mariama is up for graduation'),
(12, 404, 4, 'Docas need 20 more credits to complete second semester');



