DROP DATABASE IF EXISTS Testing_System_Assignment_1;
CREATE DATABASE Testing_System_Assignment_1;
USE Testing_System_Assignment_1;

								-- TẠO BẢNG PHÒNG BAN
CREATE TABLE Department (
Department_ID		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
Department_Name		VARCHAR(50) NOT NULL
);
-- THÊM DỮ LIỆU CHO CÁC CỘT Ở DEPARMENT 
INSERT INTO Department (Department_Name)
VALUES 	(	N'Makerting'),
		(	N'Sale'),
        (	N'Bảo Vệ'), 
        (	N'Nhân Sự'), 
        (	N'Kỹ Thuật' ), 
        (	N'Tài Chính'), 
        (	N'Phó giám Đốc'), 
        (	N'Giám Đốc');


								-- TẠO BẢNG CHỨC VỤ
CREATE TABLE Position (
Position_ID			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Position_Name		ENUM ('DEV','Test','Scrum Master','PM') NOT NULL
);
-- THÊM DỮ LIỆU CHO CÁC CỘT Ở POSITION
INSERT INTO Position (Position_Name)
VALUES 	(1),(2),(3),(4);


								-- TẠO BẢNG THÔNG TIN THÀNH VIÊN
CREATE TABLE `Account` (
Account_ID			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Email				VARCHAR(100) UNIQUE KEY NOT NULL,
User_Name 			CHAR(12) UNIQUE KEY NOT NULL,
full_Name 			VARCHAR(50) NOT NULL,
Department_ID		TINYINT UNSIGNED DEFAULT(1),
Position_ID			TINYINT UNSIGNED NOT NULL,
Create_Date			DATETIME DEFAULT NOW(),
FOREIGN KEY (Department_ID) REFERENCES Department (Department_ID),
FOREIGN KEY (Position_ID) REFERENCES Position (Position_ID),
CHECK (LENGTH(User_Name) >=6 AND length(full_Name) >=8)
);
-- THÊM DỮ LIỆU CHO CÁC CỘT Ở BẢNG Account
INSERT INTO `Account`
				(Email,User_Name,full_Name,Department_ID,Position_ID)
VALUES 
				('2can123@gmail.com','2can1234','TranVietHoang', 2, 2),
                ('khoiDaRealest@yahoo.com','Khoi123','TrinhHoangNam',2,1),
                ('Rhymastic@gmail.com','Rhymastis','VuDucThien',2,2),
                ('TranManhTung@yahoo.com','TungTeaa','VuManhTung',3,1),
                ('Ricky@rapname.com','RickyStar','TranTien',3,3);


								-- TẠO BẢNG NHÓM
CREATE TABLE `Group`	(
Group_ID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Group_Name			VARCHAR(50) NOT NULL,
Creator_ID			TINYINT UNSIGNED NOT NULL,
Create_Date			DATETIME DEFAULT NOW(),
FOREIGN KEY (Creator_ID) REFERENCES `Account`(Account_ID),
CHECK (length(Group_Name) >=6)
);
-- THÊM DỮ LIỆU CHO CÁC CỘT Ở BẢNG `Group`
INSERT INTO `Group`(Group_Name,Creator_ID)
VALUES 		
                    ('OTDcypher',5),
                    ('SpaceSpeakers',3),
                    ('BanCoTaiMa',1),
                    ('VietDreamerz',2),
                    ('TayNguyenSound',4);

 								-- TẠO BẢNG THÔNG TIN THÀNH VIÊN NHÓM
CREATE TABLE Group_Account(
Group_ID				TINYINT UNSIGNED NOT NULL,	
Account_ID			TINYINT UNSIGNED NOT NULL,
Join_Date			DATE NOT NULL,
FOREIGN KEY (Group_ID) REFERENCES  `Group`(Group_ID),
FOREIGN KEY (Account_ID) REFERENCES  `Account`(Account_ID)
);
-- THÊM DỮ LIỆU CHO CÁC CỘT Ở BẢNG Group_Account
INSERT INTO Group_Account(Group_ID,Account_ID,Join_Date)
VALUES 		
						 (1,1,'2021-10-27'),
                         (2,2,'2021-10-20'),
                         (1,3,'2021-10-10'),
                         (4,2,'2021-10-10'),
                         (1,3,'2021-9-10'),
                         (3,4,'2021-8-10'),
                         (2,5,'2021-7-10'),
                         (1,5,'2021-8-10');

								-- TẠO BẢNG MẪU CÂU HỎI
CREATE TABLE Type_Question(
Type_ID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Type_Name			ENUM ('Essay','Multiple-Choice' ) NOT NULL
);
-- THÊM DỮ LIỆU CHO BẢNG MẪU CÂU HỎI
INSERT INTO Type_Question(Type_Name)
VALUES 					
						 (1),(2),(1),(2),(1),(1),(2),(1),(2),(1);

								-- TẠO BẢNG CHỦ ĐỀ CÂU HỎI
CREATE TABLE Category_Question(
Category_ID			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Category_Name		VARCHAR(50) NOT NULL,
CHECK (length(Category_Name) >=3 AND length(Category_Name)<=50)
);
-- THÊM DỮ LIỆU CHO BẢNG CHỦ ĐỀ CÂU HỎI
INSERT INTO Category_Question(Category_Name)
VALUES 				
							 ('Java'),('.NET'),('SQL'),('Postman'),('Ruby');

								-- TẠO BẢNG CÂU HỎI
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
-- THÊM DỮ LIỆU CHO BẢNG CÂU HỎI 
INSERT INTO Question(Content,Category_ID,Type_ID,Creator_ID)
VALUES 				
					('Học Java Bắt Đầu Từ Đâu',1,1,1),
                    ('.Net Có Lợi Ích Gì',2,2,2),
                    ('Cách Tạo Bảng Trong MySQL như thế nào',3,2,3),
                    ('Tại sao sử dụng Postman?',2,2,4),
                    ('Hướng Đối Tượng Trong Ngôn Ngữ RuBy',4,1,5);

								-- TẠO BẢNG CÂU TRẢ LỜI
CREATE TABLE Answer(
Answer_ID			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Content				NVARCHAR(200),
Question_ID			TINYINT UNSIGNED,
isCorrect			ENUM('TRUE','FALSE'),
FOREIGN KEY (Question_ID) REFERENCES Question(Question_ID)
);
-- THÊM DỮ LIỆU CHO BẢNG CÂU TRẢ LỜI
INSERT INTO Answer(Question_ID,isCorrect)
VALUES 			
				  (2,1),
                  (2,2),
				  (1,1),
                  (3,2),
                  (4,1),
                  (1,2),
                  (3,2); 

									-- TẠO BẢNG ĐỀ THI
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
-- THÊM DỮ LIỆU CHO BẢNG ĐỀ THI
INSERT INTO Exam(`Code`,Title,Category_ID,Duration,Creator_ID,Create_Date)
VALUES 			
				( 1,'Kiểm tra kỹ năng code trong MySQl', 3, 60, 1, '2010-9-12' ),
				( 2,'tìm lổi trong 1 database Java', 1, 15, 2, '2012-5-30' ),
                ( 3,'đâu là Ruby', 5, 15, 4, '2020-9-15' );

							-- TẠO BẢNG CÂU HỎI TRONG ĐỀ THI
CREATE TABLE Exam_Question(
Exam_ID				TINYINT UNSIGNED NOT NULL,
Question_ID			TINYINT UNSIGNED NOT NULL,
FOREIGN KEY (Exam_ID) REFERENCES Exam(Exam_ID),
FOREIGN KEY (Question_ID) REFERENCES Question(Question_ID)
);
-- THÊM DỮ LIỆU CHO BẢNG CÂU HỎI TRONG ĐỀ THI
INSERT INTO Exam_Question(Exam_ID,Question_ID)
VALUES 					
						  (1,2),(1,1),(1,3),(2,3); 