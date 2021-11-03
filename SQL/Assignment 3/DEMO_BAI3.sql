DROP DATABASE IF EXISTS demo_bai34_31Oct;
CREATE DATABASE demo_bai34_31Oct;
USE demo_bai34_31Oct;

CREATE TABLE Department(
			DepartmentID		INT PRIMARY KEY AUTO_INCREMENT,
			DepartmentName		VARCHAR(100) UNIQUE NOT NULL
);


CREATE TABLE `Position`(
			PositionID			INT PRIMARY KEY AUTO_INCREMENT,
			PositionName		VARCHAR(100) UNIQUE NOT NULL 
);

-- Tao Table 3: Account
CREATE TABLE `Account`(
			AccountID			INT PRIMARY KEY AUTO_INCREMENT,
			Email				VARCHAR(50) UNIQUE,
			Username			VARCHAR(30) NOT NULL,
			FullName			NVARCHAR(50) NOT NULL,
			DepartmentID		INT NOT NULL, 
			PositionID			INT NOT NULL,
			CreateDate			DATETIME DEFAULT NOW()
);
Alter table Account add constraint lk_01 FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID);
Alter table Account add constraint lk_02 FOREIGN KEY (PositionID) REFERENCES `Position`(PositionID);
