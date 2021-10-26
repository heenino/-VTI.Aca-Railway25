DROP DATABASE IF EXISTS Testing_System_Assignment_1;
CREATE DATABASE Testing_System_Assignment_1;
USE Testing_System_Assignment_1;

-- create table: Department
CREATE TABLE Department (
Department_ID		TINYINT , 
Department_Name		VARCHAR(50)
);

-- create table: Position
CREATE TABLE Position (
Position_ID			TINYINT,
Position_Name		ENUM ('DEV','Test','Scrum Master','PM')
);

-- create table: Account
CREATE TABLE `Account` (
Account_ID			TINYINT,
Email				VARCHAR(100),
User_name 			CHAR(12) ,
full_name 			VARCHAR(50),
Department_ID		TINYINT,
Position_ID			TINYINT,
Create_Date			DATETIME DEFAULT NOW()
);

-- create table: Group
CREATE TABLE `Group`	(
Group_ID				TINYINT,
Group_Name			VARCHAR(50),
Creator_ID			TINYINT,
Create_Date			DATETIME DEFAULT NOW()
);

-- create table: GroupAccount
CREATE TABLE Group_Account(
Group_ID				TINYINT,	
Account_ID			TINYINT,
Join_Date			DATE
);


CREATE TABLE Type_Question(
Type_ID				TINYINT,
Type_Name			ENUM ('Essay','Multiple-Choice' )
);

-- create table: CategoryQuestion
CREATE TABLE Category_Question(
Category_ID			TINYINT,
Category_Name		VARCHAR(50)
);

-- create table: Question
CREATE TABLE Question(
Question_ID			SMALLINT,
Content				VARCHAR(200),
Category_ID			TINYINT,
Type_ID				TINYINT,
Creator_ID			TINYINT,
create_date			DATETIME DEFAULT NOW()
);

-- create table: Answer
CREATE TABLE Answer(
Answer_ID			TINYINT,
Content				VARCHAR(200),
Question_ID			TINYINT UNSIGNED,
isCorrect			ENUM('TRUE','FALSE')
);

-- create table: Exam
CREATE TABLE Exam(
Exam_ID				TINYINT,	
Codee				CHAR(6),
Title				VARCHAR(100),
Category_ID			TINYINT,
Duration			CHAR(3),
Creator_ID			TINYINT,
Create_Date			DATETIME DEFAULT NOW()
);


CREATE TABLE Exam_Question(
Exam_ID				TINYINT,
Question_ID			TINYINT
);
