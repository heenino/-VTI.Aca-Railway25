INSERT INTO Department(DepartmentName)
VALUES				('Hành chính'),
					('Tổng hợp'),
					('Kinh doanh'),
                    ('Kĩ thuật'),
                    ('Sale'),
                    ('Maketing'),
                    ('Nhân sự'),
                    ('Công nghệ thông tin'),
                    ('Mạng');
                    
INSERT INTO `Position`(PositionName)
VALUES				('Nhân viên'),
					('Trưởng phòng'),
                    ('Phó phòng'),
                    ('Giám đốc'),
                    ('Quản lý nhân sự'),
                    ('Trưởng nhóm'),
                    ('Phó nhóm');
                    
INSERT INTO `Account`(Email,Username,FullName,DepartmentID,PositionID,CreateDate)
VALUES				('LETHUANDUC@gmail.com','LeDuc','LeThuanDuc',1,3,'2019/03/12'),
					('VOHOHONGLOAN@gmail.com','VoLoan','VoHoHongLoan',2,2,'2018/05/12'),
                    ('NGUYENNGOCHUY@gmail.com','NguyenHuy','NguyenNgocHuy',3,1,'2019/12/09'),
                    ('VOKHOIHONGNHUNG@gmail.com','VoNhung','VoKhoiHongNhung',1,3,'2017/01/30'),
                    ('DANGHONHATTHACH@gmail.com','DangThach','DangHoNhatThach',1,1,'2019/12/03'),
                    ('VOVANTHANG@gmail.com','VoThang','VoVanThang',2,3,'2020/01/01'),
                    ('HOANGMINHTIEN@gmail.com','HoangTien','HoangMinhTien',3,1,'2019/07/02'),
                    ('DANGHOAIAN@gmail.com','DangAn','DangHoaiAn',3,4,'2019/03/16'),
                    ('BUITHIHIENNA@gmail.com','BuiNa','BuiThiHienNa',4,2,'2019/08/09'),
                    ('LEPHANMINHQUAN@gmail.com','LeQuan','LePhanMinhQuan',4,1,'2019/09/25'),
                    ('PHAMTHINGOCTRANG@gmail.com','PhamTrang','PhamThiNgocTrang',5,1,'2019/05/05'),
                    ('VANTHUTRUNG@gmail.com','VanTrung','VanThuTrung',3,4,'2019/10/02'),
                    ('DINHTHANHTUONGVY@gmail.com','DinhVy','DinhThanhTuongVy',3,2,'2019/11/02'),
                    ('PHANTHAIBACH@gmail.com','PhanBach','PhanThaibach',4,1,'2019/03/30'),
                    ('LEHOANGBINH@gmail.com','LeBinh','LeHoangBinh',4,3,'2019/05/02');
           -- LẤY RA DỮ LIỆU TRÙNG GIỮA 2 BẢNG   Account VÀ    Department
SELECT 		acc.AccountID, acc.Username, acc.DepartmentID as accDepID, acc.Email,dep.DepartmentName,dep.DepartmentID as depID
FROM 		Account AS  acc
LEFT JOIN 	Department AS dep
ON 			acc.DepartmentID = dep.DepartmentID

UNION

SELECT 		acc.AccountID, acc.Username, acc.DepartmentID as accDepID, acc.Email,dep.DepartmentName,dep.DepartmentID as depID
FROM 		Account AS  acc
RIGHT JOIN 	Department AS dep
ON 			acc.DepartmentID = dep.DepartmentID
WHERE 		acc.DepartmentID IS NULL
                    
                    ##CÁI NÀY CÓ BẰNG FULL OUTER JOIN KHÔNG Ạ?
                    