-- Question 1: Tạo trigger không cho phép người dùng nhập vào Group có ngày tạo trước 1 năm trước
DELIMITER $$
CREATE TRIGGER khongchophep 
BEFORE INSERT
ON `group` FOR EACH ROW
	BEGIN
		IF NEW.Create_Date > year(curdate()) - 365 THEN
        SIGNAL SQLSTATE  '99999'
        SET MESSAGE_TEXT = 'KHÔNG CHO PHÉP, CHỈ NHẬN GIÁ TRỊ TỪ 1 NĂM TRƯỚC';
        END IF;
	END $$
DELIMITER ;
        
INSERT INTO `group`(Group_Name, 			Creator_ID, 			Create_Date)
VALUES				('BCTM123',					9,						'2019-12-21');



-- Question 2: Tạo trigger Không cho phép người dùng thêm bất kỳ user nào vào
-- department "Sale" nữa, khi thêm thì hiện ra thông báo "Department
-- "Sale" cannot add more user"
DROP TRIGGER IF EXISTS cannot_add_more_user;
DELIMITER $$
CREATE TRIGGER cannot_add_more_user
BEFORE INSERT
ON `account` FOR EACH ROW
	BEGIN
    DECLARE	 	V_DEPID INT;
    SELECT 		D.Department_ID INTO V_DEPID
    FROM 		department D
    WHERE		D.Department_Name = 'Sale';
    IF V_DEPID = NEW.Department_ID  THEN 
    SIGNAL SQLSTATE '99999'
    SET MESSAGE_TEXT = ' Department "Sale" cannot add more user ';
    END IF;
END $$
DELIMITER ;

INSERT INTO `Account`
				(Email,							 User_Name,				full_Name,					Department_ID,			Position_ID,		Create_Date)
VALUES 
				('HUNBHG123@gmail.com',			'DotocHA1234',			'PhùnHg THhanh Độ', 			6, 						2,					'2021-12-10');

-- Question 3: Cấu hình 1 group có nhiều nhất là 5 user
DROP TRIGGER IF EXISTS cannot_add_more_user1;
DELIMITER $$
CREATE TRIGGER cannot_add_more_user1
AFTER INSERT
ON group_account FOR EACH ROW
	BEGIN 	
		DECLARE V_GRID TINYINT;
        SELECT		COUNT(GR.Account_ID) INTO V_GRID
        FROM 		group_account GR
        WHERE 		NEW.Group_ID = GR.Group_ID
        GROUP BY 	Group_ID;
        IF 			( V_GRID > 5) THEN 
		SIGNAL SQLSTATE '99999'
		SET MESSAGE_TEXT = ' USER LIMIT 5 FOR EACH GROUP ';	
		END IF;
	END $$
    DELIMITER ;
	
  INSERT INTO Group_Account(Group_ID,			Account_ID,		Join_Date)
	VALUES 		
							(1,					2,				'2020-10-27');
                            
                            
-- Question 4: Cấu hình 1 bài thi có nhiều nhất là 10 Question
DROP TRIGGER IF EXISTS NOT_ADD_MORE_Question;
DELIMITER $$
CREATE TRIGGER NOT_ADD_MORE_Question
AFTER INSERT
ON exam_question FOR EACH ROW
	BEGIN 
		DECLARE V_COUNTEXAMID TINYINT;
		SELECT COUNT(EQ.EXAMID) INTO V_COUNTEXAMID
		FROM exam_question EQ
		WHERE NEW.Exam_ID = EQ.Exam_ID;
		IF (V_COUNTEXAMID > 10) THEN 
			SIGNAL SQLSTATE '99999'
			SET MESSAGE_TEXT= 'CAN NOT ADD QUESTION, LIMIT 10';
		END IF;
	END $$
DELIMITER ;
	
	-- Question 5: Tạo trigger không cho phép người dùng xóa tài khoản có email là
 -- admin@gmail.com (đây là tài khoản admin, không cho phép user xóa),
 -- còn lại các tài khoản khác thì sẽ cho phép xóa và sẽ xóa tất cả các thông
 -- tin liên quan tới user đó
DROP TRIGGER IF EXISTS CAN_NOT_DELETE_ADMIN;
DELIMITER $$
CREATE TRIGGER CAN_NOT_DELETE_ADMIN
AFTER DELETE
ON `account` FOR EACH ROW
	BEGIN
    DECLARE errorMessage VARCHAR(255);
    SET errorMessage = CONCAT('CÁI EMAIL MÀ BẠN MUỐN XÓA ',
                        OLD.Email,
                        ' NÓ LÀ ADMIN ĐẤY, BẠN MUỐN TỰ HỦY À ');
		IF OLD.Email = 'admin@gmail.com' THEN
        SIGNAL SQLSTATE '99999'
        SET MESSAGE_TEXT = errorMessage
        END IF;
	END $$
DELIMITER ;

INSERT INTO `Account`
				(Email,							 User_Name,				full_Name,					Department_ID,			Position_ID,		Create_Date)
VALUES 
				('admin@gmail.com',			'DotocHA1234',			'PhùnHg THhanh Độ', 			3, 						2,					'2021-12-10');

DELETE FROM `account`
WHERE Email = 'admin@gmail.com';

DELETE FROM `account`
WHERE Email = 'HUNBG123@gmail.com';
        
 
 
 



