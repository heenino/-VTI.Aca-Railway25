 ##LƯU Ý CÁC BƯỚC CHẠY BÀI NÀY 
## B1: CHẠY DATABASE Testing_System_Assignment_2 LINK : https://github.com/heenino/-VTI.Aca-Railway25/blob/master/SQL/Assignment%202/Testing_System_Assignment_2.sql
## B2: CHẠY Question 1 TRONG Assignment_3  (BÔI ĐEN TỪ DÒNG 8 ĐẾN 146 ) link: https://github.com/heenino/-VTI.Aca-Railway25/blob/master/SQL/Assignment%203/Assignment_3_SQL.sql
## B3: CHẠY TỪNG Question 


-- Question 1: Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ
SELECT		 ACC.Account_ID,	ACC.User_Name,	ACC.full_Name,	ACC.User_Name, DE.Department_ID DE_ID, DE.Department_Name DE_NAME
FROM		 account ACC
INNER JOIN 	 department DE
WHERE		 ACC.Department_ID = DE.Department_ID 
ORDER BY 	 Account_ID ASC;

-- Question 2: Viết lệnh để lấy ra thông tin các account được tạo sau ngày 20/12/2019

SELECT 		ACC.Account_ID,	ACC.User_Name,	ACC.full_Name, DE.Department_ID DE_ID, DE.Department_Name DE_NAME, ACC.Create_Date
FROM 		account ACC
LEFT JOIN 	department DE
ON			ACC.Department_ID = DE.Department_ID 
WHERE 		ACC.Create_Date > '2019-12-20';

-- Question 3: Viết lệnh để lấy ra tất cả các thông tin developer(DEV) (BẢNG ACCOUNT VÀ BẢNG POSITION)

SELECT 		ACC.User_Name, ACC.full_Name, POS.Position_ID,POS.Position_Name
FROM 		account ACC
INNER JOIN 	position POS
WHERE 		POS.Position_ID = ACC.Position_ID AND POS.Position_ID = 2;


-- 	Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên

SELECT		 DE.Department_ID DE_ID, DE.Department_Name DE_NAME, count(ACC.Account_ID) SO_LUONG_NV
FROM		 account ACC
INNER JOIN 	 department DE
WHERE		 ACC.Department_ID = DE.Department_ID
GROUP BY 	 DE.Department_ID
HAVING 		 count(ACC.Account_ID) >3;
--
##########B1: INNER JOIN 2 BẢNG account VÀ department ĐỂ LẤY NHỮNG PHÒNG BAN CÓ NHÂN VIÊN 
##########B2: DÙNG GROUP BY Department_ID Ở BẢNG department ĐỂ NHÓM SỐ LƯỢNG NHÂN VIÊN TỪNG PHÒNG BAN
##########B3: DÙNG HAVING ĐỂ GIỚI HẠN ĐIỀU KIỆN LÀ MỖI PHÒNG BAN CÓ TRÊN 3 NHÂN VIÊN

-- Question 5: Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhất

SELECT 		EQ.Question_ID, Q.Content,Q.Type_ID, COUNT(EQ.Question_ID) SO_LAN_SD,GROUP_CONCAT(EQ.Exam_ID) DE_THI_SD
FROM 		exam_question EQ
INNER JOIN 	question Q
WHERE 		EQ.Question_ID = Q.Question_ID
GROUP BY	EQ.Question_ID
ORDER BY	COUNT(EQ.Question_ID) DESC
LIMIT 		1;

##########B1: INNER JOIN 2 BẢNG question(BẢNG 1) VÀ exam_question( BẢNG 2) ĐỂ LẤY NHỮNG CÂU HỎI ĐƯỢC SỬ DỤNG TRONG ĐỀ THI
##########B2: DÙNG "GROUP BY" Question_ID Ở BẢNG exam_question ĐỂ NHÓM SỐ LƯỢNG CÂU HỎI ĐƯỢC SỬ DỤNG TRONG ĐỀ THI(VÀ ĐẾM BẰNG COUNT)
##########B3: DÙNG "ORDER BY" ĐỂ HIỂN THỊ TỪ LỚN TỚI BÉ GIÁ TRỊ Question_ID ĐƯỢC SỬ DỤNG ĐÃ ĐẾM Ở TRÊN BẰNG DESC
##########B4: DÙNG "LIMIT 1" ĐỂ LẤY GIÁ TRỊ ĐẦU TIÊN 

-- Question 6: Thông kê mỗi category Question được sử dụng trong bao nhiêu Question

SELECT 		CQ.Category_ID,CQ.Category_Name,count(Q.Category_ID) SO_LUONG,GROUP_CONCAT(Q.Question_ID) Question_SD
FROM 		question Q
INNER JOIN 	category_question CQ
WHERE 		CQ.Category_ID = Q.Category_ID
GROUP BY	Q.Category_ID;

-- Question 7: Thông kê mỗi Question được sử dụng trong bao nhiêu Exam

##??????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????



-- Question 8: Lấy ra Question có nhiều câu trả lời nhất

SELECT 		Q.Question_ID,Q.Content, COUNT(A.Question_ID) SO_LUONG_TL, GROUP_CONCAT(A.Answer_ID)
FROM 		answer A
INNER JOIN  question Q
WHERE 		Q.Question_ID = A.Question_ID
GROUP BY 	A.Question_ID
ORDER BY 	COUNT(A.Question_ID) DESC
LIMIT 		1;

-- Question 9: Thống kê số lượng account trong mỗi group 

SELECT 		GR.Group_ID,COUNT(GR.Account_ID) SO_LUONG_ACC
FROM 		group_account GR
INNER JOIN	account ACC
WHERE 		ACC.Account_ID = GR.Account_ID 
GROUP BY 	GR.Account_ID;

-- Question 10: Tìm chức vụ có ít người nhấT

SELECT 		POS.Position_ID, POS.Position_Name, COUNT(ACC.Position_ID) SO_LUONG_ACC,GROUP_CONCAT(ACC.account_ID) accountID
FROM 		account ACC
INNER JOIN 	position POS
WHERE 		POS.Position_ID = ACC.Position_ID
GROUP BY	ACC.Position_ID
ORDER BY	COUNT(ACC.Position_ID) ASC
LIMIT 		1;

-- Question 11: Thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM

SELECT 		 DEP.Department_ID,DEP.Department_Name, COUNT(POS.Position_ID),GROUP_CONCAT(POS.Position_Name)
FROM 		((account ACC
INNER JOIN 	department DEP ON ACC.Department_ID = DEP.Department_ID)
INNER JOIN 	position POS ON POS.Position_ID = ACC.Position_ID)
GROUP BY 	DEP.Department_Name
ORDER BY	COUNT(POS.Position_ID) ASC;



-- Question 12: Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì, …

SELECT 		DISTINCT Q.Question_ID,Q.Content CAU_HOI,Q.Type_ID,TQ.Type_Name,Q.Creator_ID,ACC.full_Name NGUOI_TAO_CAU_HOI,A.Content CAU_TRA_LOI
FROM 		account ACC
INNER JOIN 	question Q	ON ACC.Account_ID = Q.Creator_ID
RIGHT JOIN 	answer A ON A.Question_ID = Q.Question_ID
INNER JOIN  type_question TQ ON TQ.Type_ID = Q.Type_ID
ORDER BY 	Question_ID ASC;

-- Question 13: Lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm

SELECT 		Q.Question_ID,Q.Type_ID,TQ.Type_Name,COUNT(TQ.Type_ID) SO_LUONG_CAU_HOI, GROUP_CONCAT(Q.Question_ID) CAC_CAU_HOI
FROM		type_question TQ
INNER JOIN	question Q
WHERE 		Q.Type_ID = TQ.Type_ID
GROUP BY 	TQ.Type_ID;

-- Question 14:Lấy ra group không có account nào

SELECT 			G.Group_ID ID_GROUP,G.Group_Name TEN_GROUP
FROM 			`group` G
LEFT JOIN		group_account GR ON GR.Group_ID = G.Group_ID WHERE GR.Group_ID IS NULL
ORDER BY 		G.Group_ID ASC;


-- Question 16: Lấy ra question không có answer nào

SELECT 		Q.Question_ID, Q.Content, A.Answer_ID
FROM 		answer A
LEFT JOIN	question Q ON Q.Question_ID = A.Question_ID WHERE Q.Question_ID IS NULL;


-- Question 17:a) Lấy các account thuộc nhóm thứ 1
			## b) Lấy các account thuộc nhóm thứ 2
			## c) Ghép 2 kết quả từ câu a) và câu b) sao cho không có record nào trùng nhau
            
SELECT 		GR.Group_ID,ACC.Account_ID
FROM 		group_account GR
INNER JOIN 	account ACC
WHERE 		ACC.Account_ID = GR.Account_ID AND GR.Group_ID = 1
UNION DISTINCT
SELECT 		GR.Group_ID,ACC.Account_ID
FROM 		group_account GR
INNER JOIN 	account ACC
WHERE 		ACC.Account_ID = GR.Account_ID AND GR.Group_ID = 2;

-- Question 18: a) Lấy các group có lớn hơn 3 thành viên
			##  b) Lấy các group có nhỏ hơn 6 thành viên
			##  c) Ghép 2 kết quả từ câu a) và câu b)
            
SELECT 		COUNT(GR.Account_ID) SO_LUONG_TV, GR.Group_ID 
FROM 		group_account GR
INNER JOIN 	account ACC
WHERE 		ACC.Account_ID = GR.Account_ID
GROUP BY 	GR.Group_ID
HAVING 		count(GR.Account_ID) > 3
UNION
SELECT 		COUNT(GR.Account_ID) SO_LUONG_TV, GR.Group_ID
FROM 		group_account GR
INNER JOIN 	account ACC
WHERE 		ACC.Account_ID = GR.Account_ID
GROUP BY 	GR.Group_ID
HAVING 		count(GR.Account_ID) < 6;


