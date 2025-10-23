USE MASTER;
GO

 DROP DATABASE IF EXISTS [CapstoneAdvising];
	GO
CREATE DATABASE [CapstoneAdvising];
GO 
USE [CapstoneAdvising]
GO 

---Advisor table--S
CREATE TABLE Advisor(
	AdvisorID INT,
	FirstName VARCHAR(50),
	LastName VARCHAR(50),
	UserName VARCHAR(50) UNIQUE,
	Password VARCHAR (50), 
	
PRIMARY KEY (AdvisorID)
);
---put it Advisor content---
INSERT INTO Advisor(AdvisorID, FirstName, LastName, UserName, Password) VALUES
(101, 'Tracy','Hofman', 'tfhmann', '#happyspring69'),
(202, 'Jerry', 'Khan', 'khjerry', 'cool%winte89'),
(303, 'Julie', 'Mayer', 'mayerjuly', 'Sprin2020ever');


---Creat a course Table---
CREATE TABLE Course(
	CourseID VARCHAR(10) NOT NULL,
	CourseName VARCHAR(100),
	Credits INT,
	IsGenEd BIT,
	
	
PRIMARY KEY(CourseID)
);

INSERT INTO Course(CourseID, CourseName, Credits, IsGenEd) VALUES
---sEMESTER 1(spring)---
('BDAT1005', 'Data Analysis',  2, 0),
('ITEC1011', 'Programming Logic and Design', 4, 0),
('ITEC1003', 'Networking Fundamentals', 2, 0),
('ITEC1016', 'Web Development Technologies', 4, 0),
('TLIT1005', 'Technology Fundamentals', 3, 0),
--SEMESTER 2, (fall)--
('ITEC2105', 'Java Programming', 4, 0),
('ITEC2700', 'Artificial Intelligence', 4, 0),
('ITEC2340', 'Scripting Languages', 4, 0),
('ITEC2317', 'Web Interactivty Tools', 4, 0),
('ITEC2520', 'Mobile Development', 4, 0),
('ITEC 2215', 'Linux/Web Server Admin', 4, 0),
('ITEC 2411', 'Networking Scripting', 2, 0),
('ITEC 2440', 'DS/IPS and Auditing', 4, 0),
('BDAT', 'Data Visualization', 5, 0),
('BDAT1010', 'Integ Bus SW', 3, 0),
--Semester 3---
('ITEC2120', 'Database Design and SQL', 4, 0),
('ENGL1150', 'Multicultural Literature',  4, 0),
('ITEC2311', 'User Interface Experience', 4, 0),
('BDAT1025', 'Data Prep', 3, 0),
('MATH1550', 'Intro to Stats', 4, 0),
('BDAT2140', 'Business Intelligence', 4, 0),
---Semester 4----
('ITEC1025', 'Project Management', 4, 0),
('ITEC1035','Documentaion Standards', 2, 0),
('ITEC2901', 'Integrated Capstone',	4, 0),
---Gen Ed to be---
--Goal area 1--
('COMM1055','Strengths & Wellness', 3, 1),
('ENGL1107','Composition I', 4, 1),
('ENGL1110', 'Research Project', 1, 1),
('ENGL2105', 'Business & Technical Writing', 4, 1),
('SPCH1120', 'Public Speaking', 3, 1),
('SPCH1200', 'Interpersonal Communication', 3, 1),
('SPCH1500', 'Intercultural Communication', 3, 1),
---Goal Area 2---
('BIOL1106','Principles of Biology', 4, 1),
('BIOL1130', 'Human Biology', 4, 1),
('BIOL1200', 'Anatomy & Physiology I', 4, 1),
('BIOL2106', 'Microbiology', 4, 1),
('BIOL2200', 'Anatomy & Physiology II', 4, 1),
('INTS1000','Critical Thinking Applications for College', 3, 1),
('INTS1010', 'College and Career Success', 1, 1),
---Goal Area3---
('NSCI1020', 'Plant Science', 3, 1),
('NSIC1030', 'Introduction to Environmental Science', 3, 1),
--Goal Area 4--
('MATH1500', 'Mathematical Ideas', 3, 1),
('MATH1600',  'College Algebra', 4, 1),
('MATH1650', 'College Trigonometry', 3, 1),
('MATH 1700',	'Pre-Calculus' , 5, 1),
---Goal area 5---
('PSYC1406', 'General Psychology', 4, 1),
('PSYC1506','Lifespan Development', 4, 1),
('PSYC1605', 'Abnormal Psychology', 4, 1),
('SOSC1010', 'Introduction to Sociology', 3, 1),
('SOSC2000', 'Sociology of Work', 4, 1),
---Goal Area 6---
('ENGL2110', 'Literature and the Environment', 4, 1),
--Goal area 7--
('ASL1000',	'ASL Deaf Studies/Culture', 4, 1),
--Goal area 8--
('ASL1100',	'American Sign Language !', 3, 1),
--Goal Area 9--
('PHIL1200', 'Technology, Ethics & Society', 3, 1),
--Goal Area 10--
('NSCI1030', 'Introduction to Environmental Science', 3 , 1);


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
	PRIMARY KEY (StudentID)
	
);
--put in individual student values--
INSERT INTO  Student(StudentID, FirstName, LastName) VALUES
	(1, 'John', 'Doe'),
	(2, 'Ann', 'Silver'),
	(3, 'Greta', 'Ebrahim'),
	(4, 'Annabell', 'Fatty');
	
	
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

/* --- Course_To_Degree Table
CREATE  TABLE Course_To_Degree(
	CourseID VARCHAR(10),
	DegreeID INT,
PRIMARY KEY (CourseID, DegreeID),
FOREIGN KEY (CourseID) REFERENCES Course(CourseID),
FOREIGN KEY (DegreeID) REFERENCES Degree(DegreeID)
); */
---
--- Course_To_Degree Table---

CREATE TABLE Degree_Plan_Specific (
  DegreeID INT NOT NULL,
  StartSemester CHAR(1) NOT NULL,
  Semester VARCHAR(10) NOT NULL,
  CourseID VARCHAR(10) NOT NULL,
  PRIMARY KEY (DegreeID, StartSemester, Semester, CourseID),
  FOREIGN KEY (CourseID) REFERENCES Course(CourseID),
  FOREIGN KEY (DegreeID) REFERENCES Degree(DegreeID)
  );
  --Enter Degree_Plan_Specific--
  INSERT INTO Degree_Plan_Specific(DegreeID, StartSemester, Semester, CourseID) VALUES
  (100, 'S', 'Fall', 'ITEC2105'),
  (200, 'F', 'Spring', 'ITEC2520'),
  (300, 'F', 'Fall', 'ITEC1025'),
  (400, 'S', 'Spring',  'ITEC2120');
 
CREATE TABLE Degree_Plan_General (
  DegreeID INT NOT NULL,
  StartSemester VARCHAR(10) NOT NULL,
  Semester VARCHAR(10) NOT NULL,
  GenEdCredits TINYINT NOT NULL,
  PRIMARY KEY (DegreeID, StartSemester, Semester),
  FOREIGN KEY (DegreeID) REFERENCES Degree(DegreeID)
  );
  
   INSERT INTO Degree_Plan_General(DegreeID, StartSemester, Semester, GenEdCredits) VALUES
   (100, 'S', 'Fall', 15),
   (200, 'F', 'Spring', 15),
   (300, 'F', 'Fall', 15),
   (400, 'S', 'Spring',  3);

/* ---Put in course to degree---
INSERT INTO Course_To_Degree(CourseID, DegreeID) VALUES
('BDAT1005', 100),
('BDAT1005', 200),
('BDAT1005', 300),
('ITEC1003', 400); */

---Advisors_Notes table---
CREATE TABLE Student_To_Advisor(
	
	AdvisorID INT,
	StudentID INT,
	Notes TEXT,
	
PRIMARY KEY (AdvisorID, StudentID),
FOREIGN KEY (AdvisorID) REFERENCES Advisor(AdvisorID),
FOREIGN KEY (StudentID) REFERENCES Student(StudentID)
);

--- insert advisors actual notes---
INSERT INTO Student_To_Advisor(AdvisorID,StudentID, Notes) VALUES
(101, 1, 'David would like to switch to BDAT'),
(202, 2, 'Cedric is taking e electives next semester'),
(303, 3, 'Mariama is up for graduation');

	


