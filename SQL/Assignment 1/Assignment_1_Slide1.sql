DROP DATABASE IF EXISTS Training_Management;
CREATE DATABASE Training_Management;
USE Training_Management;
	
  -- TẠO BẢNG TRAINEE --
CREATE TABLE Trainee(
Trainer_ID			TINYINT AUTO_INCREMENT PRIMARY KEY,
Full_Name			VARCHAR(50) CHECK (length(Full_Name) >=5 ) NOT NULL,
Birth_Date			DATE,
Gender				ENUM('male','female','unknow'),
ET_IQ				TINYINT UNSIGNED CHECK(ET_IQ <=20) NOT NULL,
ET_Gmath			TINYINT UNSIGNED CHECK(ET_Gmath <=20) NOT NULL,
ET_English			TINYINT UNSIGNED CHECK(ET_English <=50) NOT NULL,
Training_Class		TINYINT NOT NULL,
Evaluation_Notes	TEXT
);
 -- THÊM 1 CỘT VTI_Account CHO BẢNG TRAINEE --
ALTER TABLE Trainee
ADD VTI_Account 	VARCHAR(50) NOT NULL UNIQUE KEY;