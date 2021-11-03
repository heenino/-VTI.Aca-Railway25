##LƯU Ý CÁC BƯỚC CHẠY BÀI NÀY 
## B1: CHẠY DATABASE Testing_System_Assignment_2 LINK : https://github.com/heenino/-VTI.Aca-Railway25.git
## B2: CHẠY Question 1 (BÔI ĐEN TỪ DÒNG 8 ĐẾN 146 )   
## B3: CHẠY TỪNG Question    

-------------- Question 1: Thêm ít nhất 10 record vào mỗi table
-------------------------------------------------------------- THÊM DỮ LIỆU CHO BẢNG PHÒNG BAN LẦN 1 ----------------------------------------------------
INSERT INTO Department (Department_Name)
VALUES 	
						('Nhân Viên Bàn'),
						('Nhân Viên Tổng Đài'),
						('Kế Toán Trưởng'),
						('Kế Toán'),
						('Makerting'),
						('Sale'),
						('Bảo Vệ'), 
						('Nhân Sự'), 
						('Kỹ Thuật' ), 
						('Tài Chính'), 
						('Phó giám Đốc'), 
						('Giám Đốc'),
						('Lao Công'),
						('CEO'),
						('Con Giám Đốc');
-------------------------------------------------------------- THÊM DỮ LIỆU CHO BẢNG CHỨC VỤ LẦN 1 ----------------------------------------------------
INSERT INTO Position (Position_Name)
VALUES 	
					(2),	(3),	(4),	(1);
----------------------------------------------------- THÊM DỮ LIỆU CHO CÁC CỘT Ở BẢNG THÔNG TIN THÀNH VIÊN LẦN 1----------------------------------------------------------
INSERT INTO `Account`
				(Email,							 User_Name,				full_Name,					Department_ID,			Position_ID,		Create_Date)
VALUES 
				('domixi@gmail.com',			'Dotoc1234',			'Phùng Thanh Độ', 			9, 						2,					'2020-12-10'),
                ('viruss@yahoo.com',			'Virussss123',			'Đinh Tiến Hoàng', 			5, 						1,					'2019-12-9'),
                ('pewpew@gmail.com',			'PewHoang',				'Hoàng Văn Khoa', 			7, 						2,					'2021-1-9'),
                ('KayBich@yahoo.com',			'KL7neverdie',			'Không Tìm Được', 			10, 					1,					'2020-9-8'),
                ('LK@rapname.com',				'LKladykiller',			'Nguyễn Quang Hưng', 		9, 						3,					'2020-12-1'),
                ('Binz@gmail.com',				'Binzzzzzz',			'Đan Lê', 					4, 						4,					'2021-3-4'),
                ('HuanHoaHong@gmail.com',		'ThayHuan',				'Bùi Xuân Huấn', 			2, 						3,					'2021-3-30'),
                ('TienBip@gmail.com',			'TienBip',				'Nguyễn Thành Long',		3,						2,					'2021-4-19'),
                ('KhaBanh@gmail.com',			'KhaProVip123',			'Ngô Bá Khá',				4,						1,					'2020-3-24'),
                ('Dendi@yahoo.com',				'Dendiso1dota2',		'Danil Ishutin',			11,						2,					'2021-9-13'),
				('2can123@gmail.com',			'2can1234',				'Trần Việt Hoàng', 			2, 						2,					'2021-9-14'),
                ('khoiDaRealest@yahoo.com',		'Khoi123',				'Trịnh Hoàng Nam', 			2, 						1,					'2020-8-4'),
                ('Rhymastic@gmail.com',			'Rhymastis',			'Vũ Đức Thiện', 			6, 						2,					'2019-10-8'),
                ('TranManhTung@yahoo.com',		'TungTeaa',				'Vũ Mạnh Tùng', 			3, 						1,					'2020-3-4'),
                ('Ricky@rapname.com',			'RickyStar',			'Trần Tiến', 				2, 						3,					'2020-7-6'),
                ('GDragon@gmail.com',			'GD1TRap',				'Kwon Jiyong', 				5, 						4,					'2019-12-12'),
                ('TuanRapper@gmail.com',		'TuanRapper',			'Trần Quốc Tuấn', 			2,						3,					'2019-11-30'),
                ('HoangProvip@gmail.com',		'Hoangpro',				'Đinh Tiếng Hoàng',			7,						2,					'2020-4-30'),
                ('VietDR@gmail.com',			'VietDragon',			'Trương Hoàng Minh Huy',	8,						1,					'2020-5-31'),
                ('BlackMuder@yahoo.com',		'BlackMurder ',			'Hồ Thiên Ân',				1,						2,					'2020-6-28');
				 
----------------------------------------------------- THÊM DỮ LIỆU CHO CÁC CỘT Ở BẢNG NHÓM LẦN 1  ---------------------------------------------------------------
INSERT INTO `Group`( Group_Name,			Creator_ID,			 Create_Date)
VALUES 		
                    ('TuHoangr',				11,							'2020-12-11'),
                    ('Gta5Roleplay',			14,							'2019-3-8'),
                    ('GvREntertaiment',			15,							'2019-11-11'),
                    ('HuanRose',				17,							'2021-1-1'),
                    ('ConCaiNit',				18,							'2011-12-9'),
                    ('MuaQuat',					19,							'2019-8-9'),
                    ('NaviRongVang',			20,							'2020-7-7'),		
                    ('OTDcypher',				5,							'2018-11-20'),
                    ('SpaceSpeakers',			3,							'2021-8-30'),
                    ('BanCoTaiMa',				1,							'2017-8-19'),
                    ('VietDreamerz',			2,							'2018-4-22'),
                    ('TayNguyenSound',			4,							'2021-1-30');
                    
	----------------------------------------------------- THÊM DỮ LIỆU CHO CÁC CỘT Ở BẢNG THÀNH VIÊN NHÓM LẦN 1 ----------------------------------------------------------
INSERT INTO Group_Account(Group_ID,			Account_ID,		Join_Date)
VALUES 		
						 (	1,				9,				'2020-10-27'),
                         (	2,				2,				'2020-10-20'),
                         (	4,				7,				'2020-10-10'),
                         (	4,				8,				'2020-10-10'),
                         (	2,				7,				'2020-9-10'),
                         (	3,				4,				'2021-8-10'),
                         (	2,				6,				'2021-7-10'),
                         (	1,				10,				'2021-8-10'),		
                         (	2,				3,				'2021-10-20'),
                         (	1,				3,				'2021-10-10'),
                         (	4,				2,				'2021-10-10'),
                         (	4,				3,				'2021-9-10'),
                         (	3,				6,				'2019-2-10'),
                         (	2,				5,				'2020-7-10'),
                         (	1,				5,				'2015-8-10');
                         
----------------------------------------------------- THÊM DỮ LIỆU CHO CÁC CỘT Ở BẢNG MÃU CÂU HỎI LẦN 1----------------------------------------------------------
INSERT INTO Type_Question(Type_Name)
VALUES 					
						 (1),(2),(1),(2),(1),(1),(2),(1),(2),(1);
                         
----------------------------------------------------- THÊM DỮ LIỆU CHO CÁC CỘT Ở BẢNG CHỦ ĐỀ CÂU HỎI LẤN 1 ----------------------------------------------------------
INSERT INTO Category_Question(Category_Name)
VALUES 				
							 ('Java'),('.NET'),('SQL'),('Postman'),('Ruby');
                    
----------------------------------------------------- THÊM DỮ LIỆU CHO CÁC CỘT Ở BẢNG CÂU HỎI LẦN 1 ----------------------------------------------------------
INSERT INTO Question(Content,													Category_ID,			Type_ID,			Creator_ID)
VALUES 				
					('Bạn hãy cho biết sự khác nhau giữa JDK và JRE',			1,						1,					5),
                    ('Function Overriding và Overloading là gì trong Java?',	1,						2,					6),
                    ('.NET hỗ trợ bao nhiêu ngôn ngữ?',							2,						2,					7),
                    ('Ruby là ngôn ngữ lập trình có kiểu tĩnh hay động?',		5,						2,					9),
                    ('Gemfile.lock là gì?',										5,						1,					8),				
					('Học Java Bắt Đầu Từ Đâu',									1,						1,					1),
                    ('.Net Có Lợi Ích Gì',										2,						2,					2),
					('Cách Tạo Bảng Trong MySQL như thế nào',					3,						2,					3),
					('Tại sao sử dụng Postman?',								2,						2,					4),
					('Hướng Đối Tượng Trong Ngôn Ngữ RuBy',						4,						1,					5);

----------------------------------------------------- THÊM DỮ LIỆU CHO CÁC CỘT Ở BẢNG CÂU TRẢ LỜI LẦN 1 ----------------------------------------------------------
INSERT INTO Answer(Question_ID,			isCorrect)
VALUES 			
				  (	2,					1),
                  (	2,					2),
				  (	9,					1),
                  (	3,					2),
                  (	6,					1),
                  (	1,					2),
                  (	3,					2),
                  (	7,					1),
                  (	2,					2),
				  (	1,					1),
                  (	7,					2),
                  (	4,					1),
                  (	1,					2),
                  (	6,					2),
                  (	3,					2),
                  (	2,					1),
                  (	5,					2),
				  (	4,					1),
                  (	10,					2);
----------------------------------------------------- THÊM DỮ LIỆU CHO CÁC CỘT Ở BẢNG  ĐỀ THI LẦN 1 ----------------------------------------------------------
INSERT INTO Exam(`Code`,		Title,										Category_ID,				Duration,			Creator_ID,			Create_Date)
VALUES 			
				( 1,			'Kiểm tra kỹ năng code trong MySQl', 		3, 							60, 				1, 					'2010-9-12' ),
				( 2,			'tìm lỗi trong 1 database Java', 			1, 							15, 				2, 					'2012-5-30' ),
                ( 3,			'đâu là Ruby', 								5, 							15, 				4, 					'2020-9-15' );
                
----------------------------------------------------- THÊM DỮ LIỆU CHO CÁC CỘT Ở BẢNG CÂU HỎI ĐỀ THI ----------------------------------------------------------
INSERT INTO Exam_Question(Exam_ID,Question_ID)
VALUES 					
							(1,2),(1,1),(2,3),(2,3),
							(3,4),(3,5),(2,6),(3,8); 
                          
                          
 ##LƯU Ý CÁC BƯỚC CHẠY BÀI NÀY 
## B1: CHẠY DATABASE Testing_System_Assignment_2 LINK : https://github.com/heenino/-VTI.Aca-Railway25.git
## B2: CHẠY Question 1 (BÔI ĐEN TỪ DÒNG 8 ĐẾN 146 )   
## B3: CHẠY TỪNG Question    
                          
                          ----------------------- Question 2: lấy ra tất cả các phòng ban
SELECT	Department_Name
FROM 	department;

 ----------------------- Question 3: lấy ra id của phòng ban "Sale"
SELECT 		Department_ID
FROM 		department
WHERE	 	Department_Name = 'Sale';

----------------------- lấy ra thông tin account có full name dài nhất & ngắn nhất
SELECT 		*
FROM 		account
WHERE 		 length(full_Name) =	(	SELECT	max(length(full_Name)) 
										FROM	account);
						
----------------------- Question 5: Lấy ra thông tin account có full name dài nhất và thuộc phòng ban có id =3
SELECT 		*
FROM 		account
WHERE	 	length(full_Name) =(	SELECT	max(length(full_Name)) 
									FROM	account) 
			AND Department_ID = '3';
            
----------------------- Question 7: Lấy ra ID của question có >= 4 câu trả lời VÀ ID CỦA MỖI CÂU TRẢ LỜI 
SELECT		Question_ID, count(Question_ID) AS So_luong, GROUP_CONCAT(Answer_ID) AS Answer_ID
FROM		Answer
GROUP BY	Question_ID
HAVING 		count(Question_ID)>=2;
             


----------------------- Question 8: Lấy ra các mã đề thi có thời gian thi >= 60 phút và được tạo trước ngày 20/12/2019
SELECT 	`code`
FROM 	exam
WHERE 	Duration >= 60 AND Create_Date < '2019-12-20';


----------------------- Question 9: Lấy ra 5 group được tạo gần đây nhất VÀ ID GROUP ĐÓ
SELECT 		Create_Date, Group_ID
FROM		`group`
ORDER BY	 Create_Date DESC
LIMIT		 5;

-----------------------  Question 10: Đếm số nhân viên thuộc department có id = 2 VÀ ĐÓ LÀ NHỮNG ACCOUNT ID NÀO?
SELECT 	Department_ID,	COUNT(Account_ID) AS Total_ID,
						GROUP_CONCAT(Account_ID) AS Account_ID
FROM 	`account` 
WHERE 	Department_ID = 2;

----------------------- Question 11: Lấy ra nhân viên có tên bắt đầu bằng chữ "B" và kết thúc bằng chữ "n"
SELECT 	full_Name
FROM 	`account`
WHERE 	full_Name  LIKE  'B%n';

----------------------- Question 12: Xóa tất cả các exam được tạo trước ngày 20/12/2019




----------------------- Question 13: Xóa tất cả các question có nội dung bắt đầu bằng từ "câu hỏi"
	DELETE 
	FROM question
	WHERE Content LIKE 'câu hỏi%';



----------------------- Question 14: Update thông tin của account có id = 5 thành tên "Nguyễn Bá Lộc" và email thành loc.nguyenba@vti.com.vn
UPDATE account
set 	full_Name = 'Nguyễn Bá Lộc', Email = 'loc.nguyenba@vti.com.vn'
WHERE 	Account_ID = 5;
select * from account;
----------------------------- Question 15: update account có id = 5 sẽ thuộc group có id = 4
UPDATE 	group_account
SET 	Account_ID = 5
WHERE  	Group_ID = 4;

-- lấy ra danh sách các phòng ban có >3 nhân viên

SELECT 		ACC.Department_ID AS ADEP,DEP.Department_ID,count(DEP.Department_ID)
FROM 		account AS ACC
INNER JOIN 	department AS DEP
ON 			DEP.Department_ID = ACC.Department_ID
GROUP BY 	Department_ID	
HAVING 		count(DEP.Department_ID) >3
ORDER BY 	ACCDEPID ASC


