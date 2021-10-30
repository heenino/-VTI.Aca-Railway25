DROP DATABASE IF EXISTS Testing_System_Assignment_2;
CREATE DATABASE Testing_System_Assignment_2;
USE Testing_System_Assignment_2;

								-- TẠO BẢNG PHÒNG BAN
DROP TABLE IF EXISTS Department;
CREATE TABLE Department (
Department_ID		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
Department_Name		VARCHAR(50) UNIQUE KEY NOT NULL
);

								-- TẠO BẢNG CHỨC VỤ
DROP TABLE IF EXISTS Position;
CREATE TABLE Position (
Position_ID			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Position_Name		ENUM ('DEV','Test','Scrum Master','PM') NOT NULL
);

								-- TẠO BẢNG THÔNG TIN THÀNH VIÊN
DROP TABLE IF EXISTS `Account`;
CREATE TABLE `Account` (
Account_ID			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Email				VARCHAR(100) UNIQUE KEY NOT NULL,
User_Name 			CHAR(18) UNIQUE KEY NOT NULL,
full_Name 			NCHAR(100) NOT NULL,
Department_ID		TINYINT UNSIGNED DEFAULT(1),
Position_ID			TINYINT UNSIGNED NOT NULL,
Create_Date			DATETIME DEFAULT NOW(),
FOREIGN KEY (Department_ID) REFERENCES Department (Department_ID),
FOREIGN KEY (Position_ID) REFERENCES Position (Position_ID),
CHECK (LENGTH(User_Name) >=6 AND length(full_Name) >=5)
);

								-- TẠO BẢNG NHÓM
DROP TABLE IF EXISTS `Group`;
CREATE TABLE `Group`	(
Group_ID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Group_Name			VARCHAR(50)   NOT NULL,
Creator_ID			TINYINT UNSIGNED NOT NULL,
Create_Date			DATE,
FOREIGN KEY (Creator_ID) REFERENCES `Account`(Account_ID),
CHECK (length(Group_Name) >=6),
CONSTRAINT UK  UNIQUE KEY (Group_Name)
);

 								-- TẠO BẢNG THÔNG TIN THÀNH VIÊN NHÓM
DROP TABLE IF EXISTS Group_Account;							
CREATE TABLE Group_Account(
Group_ID				TINYINT UNSIGNED NOT NULL,	
Account_ID			TINYINT UNSIGNED NOT NULL,
CONSTRAINT PRIMARY KEY (Group_ID,Account_ID),
Join_Date			DATE NOT NULL,
FOREIGN KEY (Group_ID) REFERENCES  `Group`(Group_ID),
FOREIGN KEY (Account_ID) REFERENCES  `Account`(Account_ID)
);


								-- TẠO BẢNG MẪU CÂU HỎI
DROP TABLE IF EXISTS Type_Question;                                
CREATE TABLE Type_Question(
Type_ID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Type_Name			ENUM ('Essay','Multiple-Choice' ) NOT NULL
);

								-- TẠO BẢNG CHỦ ĐỀ CÂU HỎI
DROP TABLE IF EXISTS Category_Question;                                
CREATE TABLE Category_Question(
Category_ID			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Category_Name		VARCHAR(50) NOT NULL,
CHECK (length(Category_Name) >=3 AND length(Category_Name)<=50)
);


									-- TẠO BẢNG CÂU HỎI
DROP TABLE IF EXISTS Question;                                            
CREATE TABLE Question(
Question_ID			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Content				NVARCHAR(200),
Category_ID			TINYINT UNSIGNED,
Type_ID				TINYINT UNSIGNED,
Creator_ID			TINYINT UNSIGNED,
createdate			DATETIME DEFAULT NOW(),
FOREIGN KEY (Creator_ID) REFERENCES `Account`(Account_ID),
FOREIGN KEY (Category_ID) REFERENCES Category_Question(Category_ID),
FOREIGN KEY (Type_ID) REFERENCES Type_Question(Type_ID)
);


								-- TẠO BẢNG CÂU TRẢ LỜI
DROP TABLE IF EXISTS Answer;
CREATE TABLE Answer(
Answer_ID			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Content				NVARCHAR(200),
Question_ID			TINYINT UNSIGNED,
isCorrect			ENUM('TRUE','FALSE'),
FOREIGN KEY (Question_ID) REFERENCES Question(Question_ID)
);


									-- TẠO BẢNG ĐỀ THI
DROP TABLE IF EXISTS Exam;
CREATE TABLE Exam(
Exam_ID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,	
`Code`				ENUM('TSA01','TSA02','TSA03'),
Title				NCHAR(100) NOT NULL,
Category_ID			TINYINT UNSIGNED NOT NULL,
Duration			TINYINT NOT NULL,
Creator_ID			TINYINT UNSIGNED NOT NULL,
Create_Date			DATE,
FOREIGN KEY (Creator_ID) REFERENCES `Account`(Account_ID),
CHECK (Duration >= 15 AND Duration <= 120)
);


							-- TẠO BẢNG CÂU HỎI TRONG ĐỀ THI
DROP TABLE IF EXISTS Exam_Question;
CREATE TABLE Exam_Question(
Exam_ID				TINYINT UNSIGNED NOT NULL,
Question_ID			TINYINT UNSIGNED NOT NULL,
FOREIGN KEY (Exam_ID) REFERENCES Exam(Exam_ID),
FOREIGN KEY (Question_ID) REFERENCES Question(Question_ID)
);

                          
