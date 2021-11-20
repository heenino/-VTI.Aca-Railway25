-- Question 1: Tạo store để người dùng nhập vào tên phòng ban và in ra tất cả các account thuộc phòng ban đó
DELIMITER $$ 
DROP PROCEDURE IF EXISTS THONG_TIN_NV;
CREATE PROCEDURE THONG_TIN_NV (IN TEN_PHONG_BAN nCHAR(50) )
BEGIN

SELECT			DEP.*,ACC.Email,ACC.User_Name,ACC.full_Name,ACC.Account_ID
FROM		 	account ACC
JOIN 	 		department DEP ON ACC.Department_ID = DEP.Department_ID
WHERE			 DEP.Department_Name = TEN_PHONG_BAN;

END $$
DELIMITER ;

###########DÙNG FUNCTION




-- Question 2: Tạo store để in ra số lượng account trong mỗi group
DELIMITER $$
CREATE PROCEDURE SO_LUONG_ACC(IN NHAP_GROUP_ID TINYINT UNSIGNED)
BEGIN

SELECT 		GR.Group_ID, COUNT(GR.Account_ID)
FROM 		group_account GR
JOIN 		account ACC ON GR.Account_ID = ACC.Account_ID 
WHERE 		GR.Group_ID = NHAP_GROUP_ID 
GROUP BY	GR.Group_ID;


END $$
DELIMITER ;
CALL SO_LUONG_ACC;

-- Question 3: Tạo store để thống kê mỗi type question có bao nhiêu question được tạo trong tháng hiện tại
DELIMITER $$
DROP PROCEDURE IF EXISTS How_Question_In_Mouth;
CREATE PROCEDURE How_Question_In_Mouth()
			BEGIN
                SELECT 		TQ.Type_Name,COUNT(Question_ID) SO_LUONG_Q,MONTH(NOW()) THANG_HIEN_TAI
                FROM 		question Q
                JOIN		type_question TQ ON Q.Type_ID = TQ.Type_ID
                WHERE 		MONTH(Q.createdate) = MONTH(NOW()) AND YEAR(Q.createdate) = YEAR(now())
                GROUP BY 	TQ.Type_Name;
            END $$
DELIMITER ;
CALL How_Question_In_Mouth;

-- Question 4: Tạo store để trả ra id của type question có nhiều câu hỏi nhất
DELIMITER $$
DROP PROCEDURE IF EXISTS TYPES_WITH_THE_MOST_QUESTIONS $$
CREATE PROCEDURE TYPES_WITH_THE_MOST_QUESTIONS( OUT Out_Type_ID INT UNSIGNED)
	BEGIN
    
SELECT 		TQ.Type_ID into Out_Type_ID
FROM 		question Q
JOIN 		type_question TQ ON TQ.Type_ID = Q.Type_ID
GROUP BY 	Q.Type_ID
HAVING 		COUNT(Q.Question_ID) = (SELECT MAX(SO_LUONG_Q) MAX
									FROM ( SELECT 		COUNT(Q1.Question_ID ) SO_LUONG_Q , GROUP_CONCAT(Q1.Question_ID)
											FROM 		question Q1
											GROUP BY 	Q1.Type_ID) TP1 );                                    
	END $$
DELIMITER ;

-- sử dụng 
SET		 @v_Out_Type_ID = 0;
CALL 	TYPES_WITH_THE_MOST_QUESTIONS(@v_Out_Type_ID); 

SELECT 	(@v_Out_Type_ID);

-- Question 5: Sử dụng store ở question 4 để tìm ra tên của type question

SELECT 	Type_Name
FROM 	type_question
WHERE 	Type_ID = @v_Out_Type_ID;


 --  			 Question 6: Viết 1 store cho phép người dùng nhập vào 1 chuỗi và trả về group có tên
-- 					chứa chuỗi của người dùng nhập vào hoặc trả về user có username chứa
 -- 					chuỗi của người dùng nhập vào
DELIMITER $$
DROP PROCEDURE IF EXISTS FIND_GROUP_OR_USERNAME;
CREATE PROCEDURE FIND_GROUP_OR_USERNAME(IN in_String nchar(30))
	BEGIN 
SELECT 	Group_Name AS Group_Name, '' AS User_Name ## NẾU GIÁ TRỊ LÀ NULL THÌ SẼ CHUYỂN SANG CỘT User_Name
FROM 	`group`
WHERE 	Group_Name LIKE CONCAT('%',in_String ,'%')
UNION
SELECT	'' AS Group_Name, User_Name AS User_Name ##NẾU GIÁ TRỊ LÀ NULL THÌ SẼ CHUYỂN SANG CỘT Group_Name
FROM 	`account`
WHERE 	User_Name LIKE CONCAT('%',in_String ,'%');
	END $$
DELIMITER ;

################################### VD về cách dùng if 
DELIMITER //
CREATE PROCEDURE FIND_GROUP_OR_USERNAME2(IN in_String nchar(30))
	BEGIN 
DECLARE FLAG INT;
SELECT COUNT(1) into FLAG FROM `group`
WHERE 	Group_Name LIKE CONCAT('%',in_String ,'%');

IF FLAG = 0 THEN
SELECT	'' AS Group_Name, User_Name AS User_Name
FROM 	`account`
WHERE 	User_Name LIKE CONCAT('%',in_String ,'%');
ELSE 
SELECT 	Group_Name AS Group_Name, '' AS User_Name
FROM 	`group`
WHERE 	Group_Name LIKE CONCAT('%',in_String ,'%');

END IF;
	END //
DELIMITER ;


			-- 									Question 7: Viết 1 store cho phép người dùng nhập vào thông tin fullName, email và
			 -- 								trong store sẽ tự động gán:
			--   								username sẽ giống email nhưng bỏ phần @..mail đi
			--    								positionID: sẽ có default là developer
			-- 									departmentID: sẽ được cho vào 1 phòng chờ
			 -- 								Sau đó in ra kết quả tạo thành công
             
DELIMITER $$
DROP PROCEDURE IF EXISTS LOGIN;
CREATE PROCEDURE LOGIN(IN in_full_name CHAR(20), IN in_email CHAR(30))
		BEGIN
        DECLARE 	V_username CHAR(30) DEFAULT SUBSTRING_INDEX(in_email,'@',1);    		##hàm SUBSTRING_INDEX() là để lấy giá trị trước dấu phân cách
																							##VD SUBSTRING_INDEX(in_email,'@',1) 
                                                                                            ## lấy từ in_email các giá trị trước khi đếm 1 lần @
        DECLARE		V_positionID  ENUM('developer');
        DECLARE		V_departmentID INT DEFAULT 1;
		INSERT INTO `Account`
				(Email,					User_Name,				full_Name,					Department_ID,			Position_ID,		Create_Date)
		VALUES	
				(in_email,				V_username,				in_full_name,				V_departmentID,			1,			'2021-11-8');
		END $$
DELIMITER ;

call LOGIN('tranphihung','HEE@gmail.com');


-- 													Question 8: Viết 1 store cho phép người dùng nhập vào Essay hoặc Multiple-Choice
--  													để thống kê câu hỏi essay hoặc multiple-choice nào có content dài nhất

DELIMITER $$
DROP PROCEDURE IF EXISTS Long_content;
CREATE PROCEDURE Long_content(IN in_Essay_Or_Multiple_Choice CHAR(50))
		BEGIN
			SELECT 		DISTINCT Q.Question_ID, Q.Content, LENGTH(Q.Content) DO_DAI
            FROM 		Qsduestion Q
            JOIN 		Type_question TQ ON Q.Type_ID = TQ.Type_ID
            WHERE 		LENGTH(Q.Content) = (SELECT 	MAX(LENGTH(Q1.Content))
											FROM		Question Q1
                                            JOIN		Type_question TQ1 ON Q1.Type_ID = TQ1.Type_ID
                                            WHERE 		TQ1.Type_Name = in_Essay_Or_Multiple_Choice);
            END $$
DELIMITER ; 

-- Question 9: Viết 1 store cho phép người dùng xóa exam dựa vào ID
DELIMITER $$
DROP PROCEDURE IF EXISTS DELETE_EXAM;
CREATE PROCEDURE DELETE_EXAM (IN in_ID_of_exam int)
		BEGIN	
        DELETE FROM exam
        WHERE Exam_ID = in_ID_of_exam;
	END $$
DELIMITER ;

-- 	Question 10: Tìm ra các exam được tạo từ 3 năm trước và xóa các exam đó đi (sử
--  	dụng store ở câu 9 để xóa)
 -- 		 Sau đó in số lượng record đã remove từ các table liên quan trong khi removing
 
SELECT 	Exam_ID
FROM 	exam
WHERE Create_Date < DATE_SUB(date(now()), INTERVAL 3 YEAR);

call DELETE_EXAM(1);

-- Question 11: Viết store cho phép người dùng xóa phòng ban bằng cách người dùng
 -- nhập vào tên phòng ban và các account thuộc phòng ban đó sẽ được
 -- chuyển về phòng ban default là phòng ban chờ việc

DELIMITER $$
DROP PROCEDURE IF EXISTS Delete_department;
CREATE PROCEDURE Delete_department(IN in_departmentName NCHAR(50) )
		BEGIN
        #TẠO 1 BIẾN VALIABLE TÊN v_DeparmentID ĐỂ GÁN CHO FEID Department_ID TÊN PHÒNG BAN NGƯỜI DÙNG NHẬP VÀO TRÙNG VỚI 1 TÊN PHÒNG BAN  TRONG BẢNG department
			DECLARE v_DeparmentID INT;
				SELECT Department_ID INTO v_DeparmentID
				FROM department
				WHERE Department_Name = in_departmentName;
		#UPDATE CHO BẢNG ACCOUNT ĐỂ KHI BIẾN v_DeparmentID TRÙNG VỚI FEID Department_ID THÌ SẼ CHUYỂN GIÁ TRỊ CỦA FEID Department_ID THÀNH GIÁ TRỊ DEFALT
			UPDATE `account` SET Department_ID = DEFAULT
			WHERE v_DeparmentID = Department_ID;
		#SAU ĐÓ SẼ XÓA TÊN PHÒNG BAN TRONG BẢNG department  DỰA VÀO TÊN PHÒNG BAN NGƯỜI DÙNG NHẬP VÀO
			DELETE FROM department
			WHERE Department_Name = in_departmentName;
		END $$
DELIMITER ;

CALL Delete_department('Lao Công');

-- Question 12: Viết store để in ra mỗi tháng có bao nhiêu câu hỏi được tạo trong năm nay

DELIMITER $$
DROP PROCEDURE IF EXISTS How_Many_Questions_Per_Month;
CREATE PROCEDURE How_Many_Questions_Per_Month()
	BEGIN
 WITH CTE_12_MONTH AS (
 SELECT 1 AS THANG
 UNION SELECT 2 AS THANG
 UNION SELECT 3 AS THANG
 UNION SELECT 4 AS THANG
 UNION SELECT 5 AS THANG
 UNION SELECT 6 AS THANG
 UNION SELECT 7 AS THANG
 UNION SELECT 8 AS THANG
 UNION SELECT 9 AS THANG
 UNION SELECT 10 AS THANG
 UNION SELECT 11 AS THANG
 UNION SELECT 12 AS THANG
)
	SELECT COUNT(MONTH(Q.createdate)) SO_LUONG_Q, C.THANG
    FROM CTE_12_MONTH C
    LEFT JOIN (SELECT * FROM question
				WHERE YEAR(createdate) = YEAR(CURDATE())) AS Q
    ON MONTH(Q.createdate) = C.THANG
	GROUP BY C.THANG;
    END $$
DELIMITER ;
    
 CALL  How_Many_Questions_Per_Month;
 
 
 -- Question 13: Viết store để in ra mỗi tháng có bao nhiêu câu hỏi được tạo trong 6
 -- tháng gần đây nhất
--  (Nếu tháng nào không có thì sẽ in ra là "không có câu hỏi nào trong tháng")

DELIMITER $$
DROP PROCEDURE IF EXISTS How_Many_Questions_Per_6Month;
CREATE PROCEDURE How_Many_Questions_Per_6Month()
	BEGIN
	DECLARE message NCHAR(255);
    DECLARE X INT;
 WITH CTE_12_MONTH AS (
 SELECT 1 AS THANG
 UNION SELECT 2 AS THANG
 UNION SELECT 3 AS THANG
 UNION SELECT 4 AS THANG
 UNION SELECT 5 AS THANG
 UNION SELECT 6 AS THANG
 UNION SELECT 7 AS THANG
 UNION SELECT 8 AS THANG
 UNION SELECT 9 AS THANG
 UNION SELECT 10 AS THANG
 UNION SELECT 11 AS THANG
 UNION SELECT 12 AS THANG
)
	SELECT C.THANG, COUNT(MONTH(Q.createdate)) INTO X
    FROM CTE_12_MONTH C
    LEFT JOIN (SELECT * FROM question
				WHERE MONTH(createdate) < MONTH(CURDATE())) AS Q
    ON MONTH(Q.createdate) = C.THANG 
    WHERE C.THANG <= MONTH(CURDATE()) AND C.THANG > (MONTH(CURDATE()) - 6)
	GROUP BY C.THANG;
	IF X = 0 THEN
            SET message = ('không có câu hỏi nào trong tháng');
	END IF; 
    SELECT message;
    END $$
DELIMITER ;
    
 
    
    
 CALL  How_Many_Questions_Per_6Month;
        
            
        
        

             
