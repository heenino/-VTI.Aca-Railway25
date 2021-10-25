DROP DATABASE IF EXISTS Testing_System_Assignment_1;
CREATE DATABASE Testing_System_Assignment_1;
USE Testing_System_Assignment_1;

-- create table: Department
CREATE TABLE Department (
DepartmentID		TINYINT , 
DepartmentName		VARCHAR(50)
);

-- create table: Position
CREATE TABLE Position (
PositionID			TINYINT,
PositionName		ENUM ('DEV','Test','Scrum Master','PM')
);

-- create table: Account
CREATE TABLE `Account` (
AccountID			TINYINT,
Email				VARCHAR(100),
Username 			CHAR(12) ,
fullname 			VARCHAR(50),
DepartmentID		TINYINT,
PositionID			TINYINT,
CreateDate			DATETIME DEFAULT NOW()
);

-- create table: Group
CREATE TABLE `Group`	(
GroupID				TINYINT,
GroupName			VARCHAR(50),
CreatorID			TINYINT,
CreateDate			DATETIME DEFAULT NOW()
);

-- create table: GroupAccount
CREATE TABLE GroupAccount(
GroupID				TINYINT,	
AccountID			TINYINT,
JoinDate			DATE
);


CREATE TABLE TypeQuestion(
TypeID				TINYINT,
TypeName			ENUM ('Essay','Multiple-Choice' )
);

-- create table: CategoryQuestion
CREATE TABLE CategoryQuestion(
CategoryID			TINYINT,
CategoryName		VARCHAR(50)
);

-- create table: Question
CREATE TABLE Question(
QuestionID			SMALLINT,
Content				VARCHAR(200),
CategoryID			TINYINT,
TypeID				TINYINT,
CreatorID			TINYINT,
createdate			DATETIME DEFAULT NOW()
);

-- create table: Answer
CREATE TABLE Answer(
AnswerID			TINYINT,
Content				VARCHAR(200),
QuestionID			TINYINT UNSIGNED,
isCorrect			ENUM('TRUE','FALSE')
);

-- create table: Exam
CREATE TABLE Exam(
ExamID				TINYINT,	
Codee				CHAR(6),
Title				VARCHAR(100),
CategoryID			TINYINT,
Duration			CHAR(3),
CreatorID			TINYINT,
CreateDate			DATETIME DEFAULT NOW()
);


CREATE TABLE ExamQuestion(
ExamID				TINYINT,
QuestionID			TINYINT
);
