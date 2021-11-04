

-- Question 1: Tạo view có chứa danh sách nhân viên thuộc phòng ban sale
DROP VIEW IF EXISTS DS_NV;
CREATE VIEW DS_NV AS (
SELECT	 	DEP.Department_Name,ACC.Account_ID,ACC.User_Name
FROM 		department DEP
JOIN		account ACC ON ACC.Department_ID = DEP.Department_ID
WHERE 		DEP.Department_ID = (	SELECT D2.Department_ID
									FROM	 department D2
									WHERE 	D2.Department_Name = 'Sale')
);
SELECT * FROM DS_NV;
-- Question 2: Tạo view có chứa thông tin các account tham gia vào nhiều group nhất
DROP VIEW IF EXISTS DS_ACC;
CREATE VIEW DS_ACC AS (

SELECT 		ACC.Account_ID,ACC.full_Name,COUNT(GR.Group_ID) SO_LUONG_GR_THAM_GIA, GROUP_CONCAT(GR.Group_ID) NHUNG_GR_THAM_GIA
FROM 		group_account GR
INNER JOIN 	account ACC
WHERE 		GR.Account_ID = ACC.Account_ID	
GROUP BY 	GR.Account_ID
HAVING 		count(GR.Group_ID) = (	SELECT 	MAX(SO_GR_DUOC_THAM_GIA) MAX
									FROM (	SELECT		COUNT(GR1.GROUP_ID) SO_GR_DUOC_THAM_GIA
											FROM 		group_account GR1
                                            GROUP BY 	GR1.Account_ID) GR1ACC)
);
SELECT * FROM DS_ACC;
-- Question 3: Tạo view có chứa câu hỏi có những content quá dài (content quá 300 từ được coi là quá dài) và xóa nó đi)
DROP VIEW IF EXISTS Content_too_long;
CREATE VIEW Content_too_long AS (

SELECT 	*,length(Content) AS QUA_NHIEU_KY_TU
FROM 	question
WHERE  	length(Content) > 60

);

DROP VIEW Content_too_long_;   -- XÓA VIEW 'Content_too_long'

-- Question 4: Tạo view có chứa danh sách các phòng ban có nhiều nhân viên nhất

DROP VIEW IF EXISTS HAVE_THE_MOST_EMPLOYEES;
CREATE VIEW HAVE_THE_MOST_EMPLOYEES AS (

SELECT DEP.*, COUNT(ACC.Account_ID)
FROM department DEP
INNER JOIN account ACC ON ACC.Department_ID = DEP.Department_ID
GROUP BY ACC.Department_ID
HAVING COUNT(ACC.Account_ID) = (SELECT 
										MAX(SO_TV_TUNG_NHOM) SO_TV_NHIEU_NHAT
								FROM (	SELECT 		count(ACC1.Account_ID)	SO_TV_TUNG_NHOM
										FROM 		account ACC1
										GROUP BY	ACC1.Department_ID) ACC1D )

);
-- Question 5: Tạo view có chứa tất các các câu hỏi do user họ Nguyễn tạo
DROP VIEW IF EXISTS QUESTION_OF_NGUYEN;
CREATE VIEW QUESTION_OF_NGUYEN AS (

SELECT 			Q.Question_ID,Q.Content,ACC.full_Name
FROM 			question Q
INNER JOIN 		account ACC ON Q.Creator_ID = ACC.Account_ID 
WHERE 			ACC.full_Name LIKE 'NGUYỄN%'
);









