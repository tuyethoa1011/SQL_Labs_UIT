﻿CREATE DATABASE QLGV
GO
USE QLGV
GO

--I. Ngôn ngữ định nghĩa dữ liệu (Data Definition Language):

--1. Tạo quan hệ và khai báo tất cả các ràng buộc khóa chính, khóa ngoại.
--Thêm vào 3 thuộc tính GHICHU, DIEMTB, XEPLOAI cho quan hệ HOCVIEN.

--Tạo quan hệ và các ràng buộc khóa chính
CREATE TABLE KHOA
(
	MAKHOA VARCHAR(4) CONSTRAINT PK_KHOA PRIMARY KEY,
	TENKHOA VARCHAR(40),
	NGTLAP SMALLDATETIME,
	TRGKHOA CHAR(4)
)

CREATE TABLE MONHOC
(
	MAMH VARCHAR(10) CONSTRAINT PK_MH PRIMARY KEY,
	TENMH VARCHAR(40),
	TCLT TINYINT,
	TCTH TINYINT,
	MAKHOA VARCHAR(4)
)

CREATE TABLE DIEUKIEN
(
	MAMH VARCHAR(10),
	MAMH_TRUOC VARCHAR(10),
	CONSTRAINT PK_DK PRIMARY KEY (MAMH,MAMH_TRUOC)
)

CREATE TABLE GIAOVIEN
(
	MAGV CHAR(4) CONSTRAINT PK_GV PRIMARY KEY,
	HOTEN VARCHAR(40),
	HOCVI VARCHAR(10),
	HOCHAM VARCHAR(10),
	GIOITINH VARCHAR(3),
	NGSINH SMALLDATETIME,
	NGVL SMALLDATETIME,
	HESO NUMERIC(4,2),
	MUCLUONG MONEY,
	MAKHOA VARCHAR(4)
)

CREATE TABLE LOP
(
	MALOP CHAR(3) CONSTRAINT PK_LOP PRIMARY KEY,
	TENLOP VARCHAR(40),
	TRGLOP CHAR(5),
	SISO TINYINT,
	MAGVCN CHAR(4)
)

CREATE TABLE HOCVIEN
(
	MAHV CHAR(5) CONSTRAINT PK_HV PRIMARY KEY,
	HO VARCHAR(40),
	TEN VARCHAR(10),
	NGSINH SMALLDATETIME,
	GIOITINH VARCHAR(3),
	NOISINH VARCHAR(40),
	MALOP CHAR(3)
)

CREATE TABLE GIANGDAY
(
	MALOP CHAR(3),
	MAMH VARCHAR(10),
	MAGV CHAR(4),
	HOCKY TINYINT,
	NAM SMALLINT,
	TUNGAY SMALLDATETIME,
	DENNGAY SMALLDATETIME,
	CONSTRAINT PK_GD PRIMARY KEY (MALOP,MAMH)
)

CREATE TABLE KETQUATHI
(
	MAHV CHAR(5),
	MAMH VARCHAR(10),
	LANTHI TINYINT,
	NGTHI SMALLDATETIME,
	DIEM NUMERIC(4,2),
	KQUA VARCHAR(10),
	CONSTRAINT PK_KQT PRIMARY KEY (MAHV,MAMH,LANTHI)
)



--Nhập liệu
ALTER TABLE KHOA NOCHECK CONSTRAINT ALL
ALTER TABLE LOP NOCHECK CONSTRAINT ALL
ALTER TABLE MONHOC NOCHECK CONSTRAINT ALL
ALTER TABLE DIEUKIEN NOCHECK CONSTRAINT ALL
ALTER TABLE GIAOVIEN NOCHECK CONSTRAINT ALL
ALTER TABLE HOCVIEN NOCHECK CONSTRAINT ALL
ALTER TABLE GIANGDAY NOCHECK CONSTRAINT ALL
ALTER TABLE KETQUATHI NOCHECK CONSTRAINT ALL
set dateformat dmy
-- KHOA
INSERT INTO KHOA VALUES('KHMT','Khoa hoc may tinh','06/07/2005','GV01')
INSERT INTO KHOA VALUES('HTTT','He thong thong tin','06/07/2005','GV02')
INSERT INTO KHOA VALUES('CNPM','Cong nghe phan mem','06/07/2005','GV04')
INSERT INTO KHOA VALUES('MTT','Mang va truyen thong','20/10/2005','GV03')
INSERT INTO KHOA VALUES('KTMT','Ky thuat may tinh','20/12/2005','Null')

-- LOP
INSERT INTO LOP VALUES('K11','Lop 1 khoa 1','K1108',11,'GV07')
INSERT INTO LOP VALUES('K12','Lop 2 khoa 1','K1205',12,'GV09')
INSERT INTO LOP VALUES('K13','Lop 3 khoa 1','K1305',12,'GV14')

-- MONHOC
INSERT INTO MONHOC VALUES('THDC','Tin hoc dai cuong',4,1,'KHMT')
INSERT INTO MONHOC VALUES('CTRR','Cau truc roi rac',5,0,'KHMT')
INSERT INTO MONHOC VALUES('CSDL','Co so du lieu',3,1,'HTTT')
INSERT INTO MONHOC VALUES('CTDLGT','Cau truc du lieu va giai thuat',3,1,'KHMT')
INSERT INTO MONHOC VALUES('PTTKTT','Phan tich thiet ke thuat toan',3,0,'KHMT')
INSERT INTO MONHOC VALUES('DHMT','Do hoa may tinh',3,1,'KHMT')
INSERT INTO MONHOC VALUES('KTMT','Kien truc may tinh',3,0,'KTMT')
INSERT INTO MONHOC VALUES('TKCSDL','Thiet ke co so du lieu',3,1,'HTTT')
INSERT INTO MONHOC VALUES('PTTKHTTT','Phan tich thiet ke he thong thong tin',4,1,'HTTT')
INSERT INTO MONHOC VALUES('HDH','He dieu hanh',4,0,'KTMT')
INSERT INTO MONHOC VALUES('NMCNPM','Nhap mon cong nghe phan mem',3,0,'CNPM')
INSERT INTO MONHOC VALUES('LTCFW','Lap trinh C for win',3,1,'CNPM')
INSERT INTO MONHOC VALUES('LTHDT','Lap trinh huong doi tuong',3,1,'CNPM')

-- DIEUKIEN
INSERT INTO DIEUKIEN VALUES('CSDL','CTRR')
INSERT INTO DIEUKIEN VALUES('CSDL','CTDLGT')
INSERT INTO DIEUKIEN VALUES('CTDLGT','THDC')
INSERT INTO DIEUKIEN VALUES('PTTKTT','THDC')
INSERT INTO DIEUKIEN VALUES('PTTKTT','CTDLGT')
INSERT INTO DIEUKIEN VALUES('DHMT','THDC')
INSERT INTO DIEUKIEN VALUES('LTHDT','THDC')
INSERT INTO DIEUKIEN VALUES('PTTKHTTT','CSDL')

-- GIANGDAY
INSERT INTO GIANGDAY VALUES('K11','THDC','GV07',1,2006,'01/02/2006','05/12/2006')
INSERT INTO GIANGDAY VALUES('K12','THDC','GV06',1,2006,'01/02/2006','05/12/2006')
INSERT INTO GIANGDAY VALUES('K13','THDC','GV15',1,2006,'01/02/2006','05/12/2006')
INSERT INTO GIANGDAY VALUES('K11','CTRR','GV02',1,2006,'01/09/2006','17/5/2006')
INSERT INTO GIANGDAY VALUES('K12','CTRR','GV02',1,2006,'01/09/2006','17/5/2006')
INSERT INTO GIANGDAY VALUES('K13','CTRR','GV08',1,2006,'01/09/2006','17/5/2006')
INSERT INTO GIANGDAY VALUES('K11','CSDL','GV05',2,2006,'06/01/2006','15/7/2006')
INSERT INTO GIANGDAY VALUES('K12','CSDL','GV09',2,2006,'06/01/2006','15/7/2006')
INSERT INTO GIANGDAY VALUES('K13','CTDLGT','GV15',2,2006,'06/01/2006','15/7/2006')
INSERT INTO GIANGDAY VALUES('K13','CSDL','GV05',3,2006,'08/01/2006','15/12/2006')
INSERT INTO GIANGDAY VALUES('K13','DHMT','GV07',3,2006,'08/01/2006','15/12/2006')
INSERT INTO GIANGDAY VALUES('K11','CTDLGT','GV15',3,2006,'08/01/2006','15/12/2006')
INSERT INTO GIANGDAY VALUES('K12','CTDLGT','GV15',3,2006,'08/01/2006','15/12/2006')
INSERT INTO GIANGDAY VALUES('K11','HDH','GV04',1,2007,'01/02/2007','18/2/2007')
INSERT INTO GIANGDAY VALUES('K12','HDH','GV04',1,2007,'01/02/2007','20/3/2007')
INSERT INTO GIANGDAY VALUES('K11','DHMT','GV07',1,2007,'18/2/2007','20/3/2007')

-- GIAOVIEN
INSERT INTO GIAOVIEN VALUES('GV01','Ho Thanh Son','PTS','GS','Nam','05/02/1950','01/11/2004',5,2250000,'KHMT')
INSERT INTO GIAOVIEN VALUES('GV02','Tran Tam Thanh','TS','PGS','Nam','17/12/1965','20/4/2004',4.5,2025000,'HTTT')
INSERT INTO GIAOVIEN VALUES('GV03','Do Nghiem Phung','TS','GS','Nu','08/01/1950','23/9/2004',4,1800000,'CNPM')
INSERT INTO GIAOVIEN VALUES('GV04','Tran Nam Son','TS','PGS','Nam','22/2/1961','01/12/2005',4.5,2025000,'KTMT')
INSERT INTO GIAOVIEN VALUES('GV05','Mai Thanh Danh','ThS','GV','Nam','03/12/1958','01/12/2005',3,1350000,'HTTT')
INSERT INTO GIAOVIEN VALUES('GV06','Tran Doan Hung','TS','GV','Nam','03/11/1953','01/12/2005',4.5,2025000,'KHMT')
INSERT INTO GIAOVIEN VALUES('GV07','Nguyen Minh Tien','ThS','GV','Nam','23/11/1971','03/01/2005',4,1800000,'KHMT')
INSERT INTO GIAOVIEN VALUES('GV08','Le Thi Tran','KS','Null','Nu','26/3/1974','03/01/2005',1.69,760500,'KHMT')
INSERT INTO GIAOVIEN VALUES('GV09','Nguyen To Lan','ThS','GV','Nu','31/12/1966','03/01/2005',4,1800000,'HTTT')
INSERT INTO GIAOVIEN VALUES('GV10','Le Tran Anh Loan','KS','Null','Nu','17/7/1972','03/01/2005',1.86,837000,'CNPM')
INSERT INTO GIAOVIEN VALUES('GV11','Ho Thanh Tung','CN','GV','Nam','01/12/1980','15/5/2005',2.67,1201500,'MTT')
INSERT INTO GIAOVIEN VALUES('GV12','Tran Van Anh','CN','Null','Nu','29/3/1981','15/5/2005',1.69,760500,'CNPM')
INSERT INTO GIAOVIEN VALUES('GV13','Nguyen Linh Dan','CN','Null','Nu','23/5/1980','15/5/2005',1.69,760500,'KTMT')
INSERT INTO GIAOVIEN VALUES('GV14','Truong Minh Chau','ThS','GV','Nu','30/11/1976','15/5/2005',3,1350000,'MTT')
INSERT INTO GIAOVIEN VALUES('GV15','Le Ha Thanh','ThS','GV','Nam','05/04/1978','15/5/2005',3,1350000,'KHMT')

-- HOCVIEN
INSERT INTO HOCVIEN VALUES('K1101','Nguyen Van','A','27/1/1986','Nam','TpHCM','K11')
INSERT INTO HOCVIEN VALUES('K1102','Tran Ngoc','Han','14/3/1986','Nu','Kien Giang','K11')
INSERT INTO HOCVIEN VALUES('K1103','Ha Duy','Lap','18/4/1986','Nam','Nghe An','K11')
INSERT INTO HOCVIEN VALUES('K1104','Tran Ngoc','Linh','30/3/1986','Nu','Tay Ninh','K11')
INSERT INTO HOCVIEN VALUES('K1105','Tran Minh','Long','27/2/1986','Nam','TpHCM','K11')
INSERT INTO HOCVIEN VALUES('K1106','Le Nhat','Minh','24/1/1986','Nam','TpHCM','K11')
INSERT INTO HOCVIEN VALUES('K1107','Nguyen Nhu','Nhut','27/1/1986','Nam','Ha Noi','K11')
INSERT INTO HOCVIEN VALUES('K1108','Nguyen Manh','Tam','27/2/1986','Nam','Kien Giang','K11')
INSERT INTO HOCVIEN VALUES('K1109','Phan Thi Thanh','Tam','27/1/1986','Nu','Vinh Long','K11')
INSERT INTO HOCVIEN VALUES('K1110','Le Hoai','Thuong','02/05/1986','Nu','Can Tho','K11')
INSERT INTO HOCVIEN VALUES('K1111','Le Ha','Vinh','25/12/1986','Nam','Vinh Long','K11')
INSERT INTO HOCVIEN VALUES('K1201','Nguyen Van','B','02/11/1986','Nam','TpHCM','K12')
INSERT INTO HOCVIEN VALUES('K1202','Nguyen Thi Kim','Duyen','18/1/1986','Nu','TpHCM','K12')
INSERT INTO HOCVIEN VALUES('K1203','Tran Thi Kim','Duyen','17/9/1986','Nu','TpHCM','K12')
INSERT INTO HOCVIEN VALUES('K1204','Truong My','Hanh','19/5/1986','Nu','Dong Nai','K12')
INSERT INTO HOCVIEN VALUES('K1205','Nguyen Thanh','Nam','17/4/1986','Nam','TpHCM','K12')
INSERT INTO HOCVIEN VALUES('K1206','Nguyen Thi Truc','Thanh','03/04/1986','Nu','Kien Giang','K12')
INSERT INTO HOCVIEN VALUES('K1207','Tran Thi Bich','Thuy','02/08/1986','Nu','Nghe An','K12')
INSERT INTO HOCVIEN VALUES('K1208','Huynh Thi Kim','Trieu','04/08/1986','Nu','Tay Ninh','K12')
INSERT INTO HOCVIEN VALUES('K1209','Pham Thanh','Trieu','23/2/1986','Nam','TpHCM','K12')
INSERT INTO HOCVIEN VALUES('K1210','Ngo Thanh','Tuan','14/2/1986','Nam','TpHCM','K12')
INSERT INTO HOCVIEN VALUES('K1211','Do Thi','Xuan','03/09/1986','Nu','Ha Noi','K12')
INSERT INTO HOCVIEN VALUES('K1212','Le Thi Phi','Yen','03/12/1986','Nu','TpHCM','K12')
INSERT INTO HOCVIEN VALUES('K1301','Nguyen Thi Kim','Cuc','06/09/1986','Nu','Kien Giang','K13')
INSERT INTO HOCVIEN VALUES('K1302','Truong Thi My','Hien','18/3/1986','Nu','Nghe An','K13')
INSERT INTO HOCVIEN VALUES('K1303','Le Duc','Hien','21/3/1986','Nam','Tay Ninh','K13')
INSERT INTO HOCVIEN VALUES('K1304','Le Quang','Hien','18/4/1986','Nam','TpHCM','K13')
INSERT INTO HOCVIEN VALUES('K1305','Le Thi','Huong','27/3/1986','Nu','TpHCM','K13')
INSERT INTO HOCVIEN VALUES('K1306','Nguyen Thai','Huu','30/3/1986','Nam','Ha Noi','K13')
INSERT INTO HOCVIEN VALUES('K1307','Tran Minh','Man','28/5/1986','Nam','TpHCM','K13')
INSERT INTO HOCVIEN VALUES('K1308','Nguyen Hieu','Nghia','04/08/1986','Nam','Kien Giang','K13')
INSERT INTO HOCVIEN VALUES('K1309','Nguyen Trung','Nghia','18/1/1987','Nam','Nghe An','K13')
INSERT INTO HOCVIEN VALUES('K1310','Tran Thi Hong','Tham','22/4/1986','Nu','Tay Ninh','K13')
INSERT INTO HOCVIEN VALUES('K1311','Tran Minh','Thuc','04/04/1986','Nam','TpHCM','K13')
INSERT INTO HOCVIEN VALUES('K1312','Nguyen Thi Kim','Yen','09/07/1986','Nu','TpHCM','K13')

-- KETQUATHI
INSERT INTO KETQUATHI VALUES('K1101','CSDL',1,'20/7/2006',10,'Dat')
INSERT INTO KETQUATHI VALUES('K1101','CTDLGT',1,'28/12/2006',9,'Dat')
INSERT INTO KETQUATHI VALUES('K1101','THDC',1,'20/5/2006',9,'Dat')
INSERT INTO KETQUATHI VALUES('K1101','CTRR',1,'13/5/2006',9.5,'Dat')
INSERT INTO KETQUATHI VALUES('K1102','CSDL',1,'20/7/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1102','CSDL',2,'27/7/2006',4.25,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1102','CSDL',3,'08/10/2006',4.5,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1102','CTDLGT',1,'28/12/2006',4.5,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1102','CTDLGT',2,'01/05/2007',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1102','CTDLGT',3,'15/1/2007',6,'Dat')
INSERT INTO KETQUATHI VALUES('K1102','THDC',1,'20/5/2006',5,'Dat')
INSERT INTO KETQUATHI VALUES('K1102','CTRR',1,'13/5/2006',7,'Dat')
INSERT INTO KETQUATHI VALUES('K1103','CSDL',1,'20/7/2006',3.5,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1103','CSDL',2,'27/7/2006',8.25,'Dat')
INSERT INTO KETQUATHI VALUES('K1103','CTDLGT',1,'28/12/2006',7,'Dat')
INSERT INTO KETQUATHI VALUES('K1103','THDC',1,'20/5/2006',8,'Dat')
INSERT INTO KETQUATHI VALUES('K1103','CTRR',1,'13/5/2006',6.5,'Dat')
INSERT INTO KETQUATHI VALUES('K1104','CSDL',1,'20/7/2006',3.75,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1104','CTDLGT',1,'28/12/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1104','THDC',1,'20/5/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1104','CTRR',1,'13/5/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1104','CTRR',2,'20/5/2006',3.5,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1104','CTRR',3,'30/6/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1201','CSDL',1,'20/7/2006',6,'Dat')
INSERT INTO KETQUATHI VALUES('K1201','CTDLGT',1,'28/12/2006',5,'Dat')
INSERT INTO KETQUATHI VALUES('K1201','THDC',1,'20/5/2006',8.5,'Dat')
INSERT INTO KETQUATHI VALUES('K1201','CTRR',1,'13/5/2006',9,'Dat')
INSERT INTO KETQUATHI VALUES('K1202','CSDL',1,'20/7/2006',8,'Dat')
INSERT INTO KETQUATHI VALUES('K1202','CTDLGT',1,'28/12/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1202','CTDLGT',2,'01/05/2007',5,'Dat')
INSERT INTO KETQUATHI VALUES('K1202','THDC',1,'20/5/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1202','THDC',2,'27/5/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1202','CTRR',1,'13/5/2006',3,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1202','CTRR',2,'20/5/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1202','CTRR',3,'30/6/2006',6.25,'Dat')
INSERT INTO KETQUATHI VALUES('K1203','CSDL',1,'20/7/2006',9.25,'Dat')
INSERT INTO KETQUATHI VALUES('K1203','CTDLGT',1,'28/12/2006',9.5,'Dat')
INSERT INTO KETQUATHI VALUES('K1203','THDC',1,'20/5/2006',10,'Dat')
INSERT INTO KETQUATHI VALUES('K1203','CTRR',1,'13/5/2006',10,'Dat')
INSERT INTO KETQUATHI VALUES('K1204','CSDL',1,'20/7/2006',8.5,'Dat')
INSERT INTO KETQUATHI VALUES('K1204','CTDLGT',1,'28/12/2006',6.75,'Dat')
INSERT INTO KETQUATHI VALUES('K1204','THDC',1,'20/5/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1204','CTRR',1,'13/5/2006',6,'Dat')
INSERT INTO KETQUATHI VALUES('K1301','CSDL',1,'20/12/2006',4.25,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1301','CTDLGT',1,'25/7/2006',8,'Dat')
INSERT INTO KETQUATHI VALUES('K1301','THDC',1,'20/5/2006',7.75,'Dat')
INSERT INTO KETQUATHI VALUES('K1301','CTRR',1,'13/5/2006',8,'Dat')
INSERT INTO KETQUATHI VALUES('K1302','CSDL',1,'20/12/2006',6.75,'Dat')
INSERT INTO KETQUATHI VALUES('K1302','CTDLGT',1,'25/7/2006',5,'Dat')
INSERT INTO KETQUATHI VALUES('K1302','THDC',1,'20/5/2006',8,'Dat')
INSERT INTO KETQUATHI VALUES('K1302','CTRR',1,'13/5/2006',8.5,'Dat')
INSERT INTO KETQUATHI VALUES('K1303','CSDL',1,'20/12/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1303','CTDLGT',1,'25/7/2006',4.5,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1303','CTDLGT',2,'08/07/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1303','CTDLGT',3,'15/8/2006',4.25,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1303','THDC',1,'20/5/2006',4.5,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1303','CTRR',1,'13/5/2006',3.25,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1303','CTRR',2,'20/5/2006',5,'Dat')
INSERT INTO KETQUATHI VALUES('K1304','CSDL',1,'20/12/2006',7.75,'Dat')
INSERT INTO KETQUATHI VALUES('K1304','CTDLGT',1,'25/7/2006',9.75,'Dat')
INSERT INTO KETQUATHI VALUES('K1304','THDC',1,'20/5/2006',5.5,'Dat')
INSERT INTO KETQUATHI VALUES('K1304','CTRR',1,'13/5/2006',5,'Dat')
INSERT INTO KETQUATHI VALUES('K1305','CSDL',1,'20/12/2006',9.25,'Dat')
INSERT INTO KETQUATHI VALUES('K1305','CTDLGT',1,'25/7/2006',10,'Dat')
INSERT INTO KETQUATHI VALUES('K1305','THDC',1,'20/5/2006',8,'Dat')
INSERT INTO KETQUATHI VALUES('K1305','CTRR',1,'13/5/2006',10,'Dat')


--Tạo khóa ngoại cho các quan hệ
--HOC VIEN
ALTER TABLE HOCVIEN ADD CONSTRAINT FK_HV FOREIGN KEY (MALOP) REFERENCES LOP(MALOP);
--LOP
ALTER TABLE LOP ADD CONSTRAINT FK_LOP01 FOREIGN KEY (MAGVCN) REFERENCES GIAOVIEN(MAGV);
ALTER TABLE LOP ADD CONSTRAINT FK_LOP02 FOREIGN KEY (TRGLOP) REFERENCES HOCVIEN(MAHV);
--KHOA
ALTER TABLE KHOA ADD CONSTRAINT FK_KHOA FOREIGN KEY (TRGKHOA) REFERENCES GIAOVIEN(MAGV);
--MONHOC 
ALTER TABLE MONHOC ADD CONSTRAINT FK_MH FOREIGN KEY (MAKHOA) REFERENCES KHOA(MAKHOA);
--DIEUKIEN
ALTER TABLE DIEUKIEN ADD CONSTRAINT FK_DK01 FOREIGN KEY (MAMH) REFERENCES MONHOC(MAMH);
ALTER TABLE DIEUKIEN ADD CONSTRAINT FK_DK02 FOREIGN KEY (MAMH_TRUOC) REFERENCES MONHOC(MAMH);
--GIAOVIEN
ALTER TABLE GIAOVIEN ADD CONSTRAINT FK_GV FOREIGN KEY (MAKHOA) REFERENCES KHOA(MAKHOA);
--GIANGDAY
ALTER TABLE GIANGDAY ADD CONSTRAINT FK_GD01 FOREIGN KEY (MALOP) REFERENCES LOP(MALOP);
ALTER TABLE GIANGDAY ADD CONSTRAINT FK_GD02 FOREIGN KEY (MAMH) REFERENCES MONHOC(MAMH);
ALTER TABLE GIANGDAY ADD CONSTRAINT FK_GD03 FOREIGN KEY (MAGV) REFERENCES GIAOVIEN(MAGV);
--KETQUATHI
ALTER TABLE KETQUATHI ADD CONSTRAINT FK_KQT01 FOREIGN KEY (MAHV) REFERENCES HOCVIEN(MAHV);
ALTER TABLE KETQUATHI ADD CONSTRAINT FK_KQT02 FOREIGN KEY (MAMH) REFERENCES MONHOC(MAMH);



--1. Thêm vào 3 thuộc tính GHICHU, DIEMTB, XEPLOAI cho quan hệ HOCVIEN.
ALTER TABLE HOCVIEN ADD GHICHU VARCHAR(40);
ALTER TABLE HOCVIEN ADD DIEMTB NUMERIC(4,2);
ALTER TABLE HOCVIEN ADD XEPLOAI VARCHAR(10);
SELECT *FROM HOCVIEN;
--2. Mã học viên là một chuỗi 5 ký tự, 3 ký tự đầu là mã lớp, 2 ký tự 
--cuối cùng là số thứ tự học viên trong lớp. VD:"K1101"
GO
CREATE TRIGGER TRIG_THEM_SUA_HOCVIEN 
ON HOCVIEN
FOR INSERT, UPDATE
AS
BEGIN
	DECLARE @SISO INT, @MALOP VARCHAR(3), @MAHV VARCHAR(5)
	SELECT @MALOP = MALOP, @MAHV = MAHV FROM INSERTED
	SELECT @SISO = SISO FROM LOP WHERE MALOP = @MALOP
	IF(LEFT(@MAHV,3) != @MALOP)
	BEGIN
		ROLLBACK TRANSACTION
		PRINT('ERROR: 3 KI TU DAU PHAI LA MALOP')
	END
	ELSE IF CAST(RIGHT(@MAHV,2) AS INT) NOT BETWEEN 1 AND @SISO
	BEGIN
		ROLLBACK TRANSACTION
		PRINT('ERROR: 2 KY TU CUOI CUA MAHV PHAI LA SO THU TU HOC VIEN TRONG LOP')
	END
	ELSE 
	BEGIN
		PRINT('THAO TAC THUC HIEN THANH CONG!')
	END
END

--3. Thuộc tính GIOITINH chỉ có giá trị là "Nam" hoặc "Nu".
ALTER TABLE HOCVIEN ADD CONSTRAINT CHK_GT_HV CHECK (GIOITINH IN('NAM', 'NU'));
ALTER TABLE GIAOVIEN ADD CONSTRAINT CHK_GT_GV CHECK (GIOITINH IN('NAM','NU'));

--4. Điểm số của một lần thi có giá trị từ 0 đến 10 và cần lưu đến 2 số lẻ.
--(VD: 6.22).
ALTER TABLE KETQUATHI ADD CONSTRAINT CHK_DIEM CHECK
(
	DIEM BETWEEN 0 AND 10
	AND RIGHT(CAST(DIEM AS VARCHAR),3) LIKE '.__' );

--5. Kết quả thi là "Dat" nếu điểm từ 5 đến 10 và "Khong dat" nếu điểm nhỏ hơn 5.
ALTER TABLE KETQUATHI ADD CONSTRAINT CHK_KQT 
CHECK ((DIEM < 5 AND KQUA = 'Khong dat') OR 
((DIEM BETWEEN 5 AND 10) AND KQUA = 'Dat'));

--6. Học viên thi một môn tối đa 3 lần
ALTER TABLE KETQUATHI ADD CONSTRAINT CHK_SL_THI CHECK (LANTHI<=3);

--7. Học kỳ chỉ có giá trị từ 1 đến 3
ALTER TABLE GIANGDAY ADD CONSTRAINT CHK_HK CHECK (HOCKY BETWEEN 1 AND 3);

--8. Học vị của giáo viên chỉ có thể là "CN", "KS", "Ths", "TS", "PTS".
ALTER TABLE GIAOVIEN ADD CONSTRAINT CHK_HOCVI CHECK (HOCVI IN('CN','KS','Ths','TS','PTS'));

--9. Lớp trưởng của một lớp phải là học viên của lớp đó.
--LOP 
--THAO TAC THEM SUA LOP
GO
CREATE TRIGGER TRIG_THEM_SUA_LOP ON LOP
FOR INSERT, UPDATE
AS
BEGIN
	IF(EXISTS(SELECT *FROM INSERTED I, HOCVIEN HV 
	WHERE I.TRGLOP = HV.MAHV AND I.MALOP = HV.MALOP))
	BEGIN
		PRINT('THANH CONG!')
	END
	ELSE 
		BEGIN
			ROLLBACK TRANSACTION
			PRINT('ERROR: LOP TRUONG KHONG PHAI LA MOT THANH VIEN LOP')
		END
END

--HOCVIEN
--THAO TAC XOA HOC VIEN
GO
CREATE TRIGGER TRIG_XOA_HV ON HOCVIEN
FOR DELETE
AS
BEGIN
	IF(EXISTS(SELECT *FROM DELETED D,LOP
	WHERE D.MAHV = LOP.TRGLOP AND D.MALOP= LOP.MALOP))
	BEGIN
		ROLLBACK TRANSACTION
		PRINT('ERROR: KHONG DUOC XOA HOC VIEN')
	END
	ELSE
		BEGIN
			PRINT('XOA THANH CONG!')
		END
END

DROP TRIGGER  TRIG_THEM_SUA_HOCVIEN
--10. Trưởng khoa phải là giáo viên thuộc khoa có học vị "TS", "PTS".
--KHOA
--THEM SUA KHOA
GO
CREATE TRIGGER TRIG_THEM_SUA_KHOA ON KHOA
FOR INSERT, UPDATE
AS
BEGIN
	DECLARE @MAGV CHAR(4), @TRGKHOA CHAR(4), @MAKHOA VARCHAR(4)
	SELECT @MAKHOA = MAKHOA, @TRGKHOA = TRGKHOA
	FROM INSERTED
	SELECT @MAGV = MAGV FROM GIAOVIEN
	WHERE MAKHOA = @MAKHOA AND HOCVI IN ('TS','PTS')
	IF(@TRGKHOA != @MAGV)
	BEGIN 
		ROLLBACK TRANSACTION
		PRINT('ERROR: MA TRUONG KHOA VUA NHAP KHONG HOP LE!')
	END
	ELSE
	BEGIN
		PRINT('THAO TAC THUC HIEN THANH CONG!') 
	END
END
DROP TRIGGER TRIG_THEM_SUA_KHOA
--GIAO VIEN
--XOA GIAO VIEN
GO
CREATE TRIGGER TRIG_XOA_GV ON GIAOVIEN
FOR DELETE
AS
BEGIN
	DECLARE @MAGV CHAR(4), @TRGKHOA CHAR(4), @MAKHOA VARCHAR(4)
	SELECT @MAGV = MAGV, @MAKHOA = MAKHOA FROM DELETED
	SELECT @TRGKHOA = TRGKHOA
	FROM KHOA WHERE MAKHOA = @MAKHOA 
	IF(@TRGKHOA = @MAGV)
	BEGIN 
		ROLLBACK TRANSACTION
		PRINT('ERROR: KHONG DUOC XOA!')
	END
	ELSE
	BEGIN
		PRINT('THAO TAC THUC HIEN THANH CONG!') 
	END
END

--11. Học viên ít nhất là 18 tuổi.
ALTER TABLE HOCVIEN ADD CONSTRAINT CHK_TUOI CHECK (YEAR(GETDATE()) - YEAR(NGSINH) >= 18); 
--12. Giảng dạy một môn học ngày bắt đầu (TUNGAY) phải nhỏ hơn ngày kết thúc (DENNGAY).
ALTER TABLE GIANGDAY ADD CONSTRAINT CHK_DATE_GD_MH CHECK(TUNGAY<DENNGAY);
--13. Giáo viên khi vào làm ít nhất là 22 tuổi.
ALTER TABLE GIAOVIEN ADD CONSTRAINT CHK_TUOI_GV CHECK (YEAR(NGVL) - YEAR(NGSINH) >= 22);
--14. Tất cả các môn học đều có số tín chỉ lý thuyết và tín chỉ thực hành chênh lệch nhau không quá 3.
ALTER TABLE MONHOC ADD CONSTRAINT CHK_SOTC CHECK(ABS(TCLT - TCTH) <= 3 OR ABS(TCTH-TCLT)<=3);
--15. Học viên chỉ được thi một môn học nào đó khi lớp của học viên đã học xong môn học này.
--TRIGGER
--16. Mỗi học kỳ của một năm học, một lớp chỉ được học tối đa 3 môn.
--TRGGER
--17. Sỉ số của một lớp bằng với số lượng học viên thuộc lớp đó.
--TRIGGER
--18. Trong quan hệ DIEUKIEN giá trị của thuộc tính MAMH và MAMH_TRUOC trong cùng một bộ
--TRIGGER
--không được giống nhau (“A”,”A”) và cũng không tồn tại hai bộ (“A”,”B”) và (“B”,”A”).
--TRIGGER
--19. Các giáo viên có cùng học vị, học hàm, hệ số lương thì mức lương bằng nhau.
--TRIGGER
--20. Học viên chỉ được thi lại (lần thi >1) khi điểm của lần thi trước đó dưới 5.
--TRIGGER
--21. Ngày thi của lần thi sau phải lớn hơn ngày thi của lần thi trước (cùng học viên, cùng môn học).
--TRIGGER
--22. Học viên chỉ được thi những môn mà lớp của học viên đó đã học xong.
--TRIGGER
--23. Khi phân công giảng dạy một môn học, phải xét đến thứ tự trước sau giữa các môn học (sau khi học
--xong những môn học phải học trước mới được học những môn liền sau).
--TRIGGER
--24. Giáo viên chỉ được phân công dạy những môn thuộc khoa giáo viên đó phụ trách.
--TRIGGER
--II. Ngôn ngữ thao tác dữ liệu (Data Manipulation Language):
--1. Tăng hệ số lương thêm 0.2 cho những giáo viên là trưởng khoa.
UPDATE GIAOVIEN SET HESO = HESO + 0.2 FROM GIAOVIEN GV, KHOA K WHERE GV.MAGV = K.TRGKHOA;

--2. Cập nhật giá trị điểm trung bình tất cả các môn học (DIEMTB) của mỗi học viên (tất cả các môn
--học đều có hệ số 1 và nếu học viên thi một môn nhiều lần, chỉ lấy điểm của lần thi sau cùng).

--C1
UPDATE HOCVIEN SET DIEMTB = AVG_DIEM FROM
	(SELECT MAHV, AVG(DIEM) 'AVG_DIEM' FROM 
		(SELECT A.MAHV,A.MAMH,DIEM FROM
			(SELECT MAHV,MAMH, MAX(LANTHI) 'SL_THI'
				FROM KETQUATHI GROUP BY MAHV,MAMH) AS A, KETQUATHI
						WHERE A.SL_THI = KETQUATHI.LANTHI
						AND A.MAHV = KETQUATHI.MAHV AND KETQUATHI.MAMH = A.MAMH) AS B
								GROUP BY MAHV) AS C, HOCVIEN 
								WHERE HOCVIEN.MAHV = C.MAHV 

--C2
UPDATE HOCVIEN SET DIEMTB = (SELECT  AVG(DIEM) 
								FROM (SELECT MAHV, MAMH, MAX(LANTHI) 'SL_THI' FROM KETQUATHI 
									GROUP BY MAHV, MAMH) AS A, KETQUATHI KQT
									WHERE A.MAHV = KQT.MAHV AND A.SL_THI = KQT.LANTHI
										GROUP BY A.MAHV
										HAVING A.MAHV = HOCVIEN.MAHV) 

--3. Cập nhật giá trị cho cột GHICHU là “Cam thi” đối với trường hợp: học viên có một môn bất kỳ thi
--lần thứ 3 dưới 5 điểm.
UPDATE HOCVIEN SET GHICHU = 'Cam thi' FROM HOCVIEN HV, KETQUATHI KQT WHERE HV.MAHV = KQT.MAHV AND LANTHI = 3 AND DIEM < 5;

/*4. Cập nhật giá trị cho cột XEPLOAI trong quan hệ HOCVIEN như sau:
o Nếu DIEMTB >= 9 thì XEPLOAI =”XS”
o Nếu 8 <= DIEMTB < 9 thì XEPLOAI = “G”
o Nếu 6.5 <= DIEMTB < 8 thì XEPLOAI = “K”
o Nếu 5 <= DIEMTB < 6.5 thì XEPLOAI = “TB”
o Nếu DIEMTB < 5 thì XEPLOAI = ”Y”*/
--C1
UPDATE HOCVIEN SET XEPLOAI = 'XS' FROM HOCVIEN WHERE DIEMTB >= 9;
UPDATE HOCVIEN SET XEPLOAI = 'G' FROM HOCVIEN WHERE DIEMTB >= 8 AND DIEMTB < 9;
UPDATE HOCVIEN SET XEPLOAI = 'K' FROM HOCVIEN WHERE DIEMTB >=6.5 AND DIEMTB < 8;
UPDATE HOCVIEN SET XEPLOAI = 'TB' FROM HOCVIEN WHERE DIEMTB >=5 AND DIEMTB < 6.5;
UPDATE HOCVIEN SET XEPLOAI = 'Y' FROM HOCVIEN WHERE DIEMTB < 5;


--C2
UPDATE HOCVIEN SET XEPLOAI =
(
	CASE 
		WHEN DIEMTB >= 9 THEN 'XS'
		WHEN DIEMTB >= 8 AND DIEMTB < 9 THEN 'G'
		WHEN DIEMTB >= 6.5 AND DIEMTB < 8 THEN 'K'
		WHEN DIEMTB >= 5 AND DIEMTB < 6.5 THEN 'TB'
		WHEN DIEMTB < 5 THEN 'Y'
	END
);


SELECT *FROM HOCVIEN

--III. Ngôn ngữ truy vấn dữ liệu:
--1. In ra danh sách (mã học viên, họ tên, ngày sinh, mã lớp) lớp trưởng của các lớp.
SELECT HV.MAHV, (HO+' '+TEN) AS HOTEN ,NGSINH, HV.MALOP
FROM HOCVIEN HV,LOP
WHERE LOP.TRGLOP = HV.MAHV;

--2. In ra bảng điểm khi thi (mã học viên, họ tên , lần thi, điểm số) môn CTRR của lớp “K12”, sắp xếp
--theo tên, họ học viên.
SELECT HV.MAHV, (HO+' '+TEN) AS HOTEN, KQT.LANTHI, DIEM
FROM KETQUATHI KQT, HOCVIEN HV
WHERE KQT.MAHV = HV.MAHV AND MAMH = 'CTRR'
AND HV.MALOP = 'K12'
ORDER BY TEN, HO;

--3. In ra danh sách những học viên (mã học viên, họ tên) và những môn học mà học viên đó thi lần thứ
--nhất đã đạt.
SELECT HV.MAHV, (HO+' '+TEN) AS HOTEN, MAMH
FROM HOCVIEN HV, KETQUATHI KQT
WHERE HV.MAHV = KQT.MAHV
AND LANTHI = 1 AND KQUA = 'Dat';

--4. In ra danh sách học viên (mã học viên, họ tên) của lớp “K11” thi môn CTRR không đạt (ở lần thi 1).
SELECT HV.MAHV, (HO+' '+TEN) AS HOTEN
FROM HOCVIEN HV, KETQUATHI KQT
WHERE HV.MAHV = KQT.MAHV
AND HV.MALOP = 'K11' AND MAMH = 'CTRR'
AND LANTHI = 1 AND KQUA = 'Khong dat';
--5. * Danh sách học viên (mã học viên, họ tên) của lớp “K” thi môn CTRR không đạt (ở tất cả các lần
--thi).
SELECT DISTINCT HV.MAHV, (HO+' '+TEN) AS HOTEN
FROM HOCVIEN HV, KETQUATHI KQT1
WHERE HV.MAHV = KQT1.MAHV
AND KQT1.MAMH = 'CTRR' AND
KQT1.KQUA = 'Khong dat' AND HV.MALOP LIKE 'K%'
AND NOT EXISTS(SELECT *FROM KETQUATHI KQT2 
					WHERE KQUA = 'DAT' AND MAMH = 'CTRR' AND KQT2.MAHV = HV.MAHV)


--6. Tìm tên những môn học mà giáo viên có tên “Tran Tam Thanh” dạy trong học kỳ 1 năm 2006.
SELECT DISTINCT TENMH
FROM GIANGDAY GD, MONHOC MH, GIAOVIEN GV
WHERE GD.MAMH = MH.MAMH
AND GV.MAGV = GD.MAGV
AND HOTEN = 'Tran Tam Thanh' AND HOCKY = 1 AND NAM = 2006;
--7. Tìm những môn học (mã môn học, tên môn học) mà giáo viên chủ nhiệm lớp “K11” dạy trong học
--kỳ 1 năm 2006.
SELECT MH.MAMH,TENMH 
FROM LOP,GIAOVIEN GV,MONHOC MH, GIANGDAY GD
WHERE LOP.MAGVCN = GV.MAGV AND GV.MAGV = GD.MAGV
AND GD.MAMH = MH.MAMH 
AND LOP.MALOP = 'K11' AND HOCKY = 1 AND NAM = 2006;

--8. Tìm họ tên lớp trưởng của các lớp mà giáo viên có tên “Nguyen To Lan” dạy môn “Co So Du Lieu”.
SELECT (HO+' '+TEN) AS HOTEN
FROM HOCVIEN HV, LOP, GIAOVIEN GV, GIANGDAY GD, MONHOC MH
WHERE HV.MAHV = LOP.TRGLOP AND GD.MAMH = MH.MAMH
AND GD.MAGV = GV.MAGV AND LOP.MALOP = GD.MALOP
AND TENMH = 'Co So Du Lieu' AND GV.HOTEN = 'Nguyen To Lan';

--9. In ra danh sách những môn học (mã môn học, tên môn học) phải học liền trước môn “Co So Du
--Lieu”.
SELECT MAMH_TRUOC, TENMH
FROM MONHOC MH, DIEUKIEN DK
WHERE MH.MAMH = DK.MAMH_TRUOC
AND DK.MAMH = 'CSDL';

--10. Môn “Cau Truc Roi Rac” là môn bắt buộc phải học liền trước những môn học (mã môn học, tên
--môn học) nào.
SELECT MH.MAMH, TENMH
FROM MONHOC MH, DIEUKIEN DK
WHERE MH.MAMH = DK.MAMH
AND DK.MAMH_TRUOC = 'CTRR';

--11. Tìm họ tên giáo viên dạy môn CTRR cho cả hai lớp “K11” và “K12” trong cùng học kỳ 1 năm 2006.
SELECT GV.HOTEN
FROM GIAOVIEN GV, GIANGDAY GD
WHERE GV.MAGV = GD.MAGV
AND MALOP = 'K11' AND MAMH = 'CTRR'
AND HOCKY = 1 AND NAM = 2006
INTERSECT
SELECT GV.HOTEN
FROM GIAOVIEN GV, GIANGDAY GD
WHERE GV.MAGV = GD.MAGV
AND MALOP = 'K11' AND MAMH = 'CTRR'
AND HOCKY = 1 AND NAM = 2006;
--12. Tìm những học viên (mã học viên, họ tên) thi không đạt môn CSDL ở lần thi thứ 1 nhưng chưa thi
--lại môn này
SELECT HV.MAHV, (HO+' '+TEN) AS HOTEN
FROM HOCVIEN HV, KETQUATHI KQT
WHERE HV.MAHV = KQT.MAHV
AND KQT.KQUA = 'Khong dat' AND MAMH = 'CSDL'
AND LANTHI = 1 AND HV.MAHV 
NOT IN (SELECT HV.MAHV FROM HOCVIEN HV, KETQUATHI KQT 
			WHERE HV.MAHV = KQT.MAHV AND LANTHI>1 AND MAMH = 'CSDL');


--13. Tìm giáo viên (mã giáo viên, họ tên) không được phân công giảng dạy bất kỳ môn học nào.
--C1
SELECT GV.MAGV, HOTEN
FROM GIAOVIEN GV
LEFT JOIN GIANGDAY GD ON GD.MAGV = GV.MAGV
WHERE GD.MAGV IS NULL;
--C2
SELECT GV.MAGV,HOTEN
FROM GIAOVIEN GV
EXCEPT
SELECT GV.MAGV,HOTEN
FROM GIAOVIEN GV
JOIN GIANGDAY GD ON GD.MAGV = GV.MAGV;
--C3
SELECT GV.MAGV,HOTEN
FROM GIAOVIEN GV
WHERE NOT EXISTS (SELECT *FROM GIANGDAY GD WHERE GD.MAGV = GV.MAGV);
--C4
SELECT GV.MAGV,HOTEN
FROM GIAOVIEN GV
WHERE MAGV NOT IN(SELECT MAGV FROM GIANGDAY);


--14. Tìm giáo viên (mã giáo viên, họ tên) không được phân công giảng dạy bất kỳ môn học nào thuộc
--khoa giáo viên đó phụ trách.

SELECT GV.MAGV, HOTEN
FROM GIAOVIEN GV
WHERE GV.MAGV NOT IN
(SELECT GV.MAGV
FROM GIAOVIEN GV
JOIN GIANGDAY GD ON GD.MAGV = GV.MAGV
AND EXISTS (SELECT *FROM MONHOC MH WHERE MH.MAKHOA = GV.MAKHOA AND MH.MAMH = GD.MAMH));

--15. Tìm họ tên các học viên thuộc lớp “K11” thi một môn bất kỳ quá 3 lần vẫn “Khong dat” hoặc thi lần
--thứ 2 môn CTRR được 5 điểm.
SELECT DISTINCT (HO + ' ' + TEN) HO_TEN
FROM HOCVIEN HV
JOIN KETQUATHI KQT ON KQT.MAHV = HV.MAHV
WHERE HV.MALOP = 'K11' AND LANTHI >= 3 AND KQUA = 'KHONG DAT'
UNION
SELECT DISTINCT (HO + ' ' + TEN) HO_TEN
FROM HOCVIEN HV
JOIN KETQUATHI KQT ON KQT.MAHV = HV.MAHV
WHERE KQT.MAMH = 'CTRR' AND DIEM  = 5 AND LANTHI = 2;

--16. Tìm họ tên giáo viên dạy môn CTRR cho ít nhất hai lớp trong cùng một học kỳ của một năm học.

SELECT HOTEN FROM(SELECT MAGV, HOCKY, NAM
FROM GIANGDAY
WHERE MAMH = 'CTRR'
GROUP BY MAGV,HOCKY,NAM
HAVING COUNT(MALOP) >= 2) AS A, GIAOVIEN WHERE A.MAGV = GIAOVIEN.MAGV

--17. Danh sách học viên và điểm thi môn CSDL (chỉ lấy điểm của lần thi sau cùng).
--C1
SELECT HV.*, DIEM AS 'DIEM_CSDL_LANTHI_SAUCUNG' FROM
(SELECT A.MAHV,DIEM FROM
(SELECT MAHV, MAMH, MAX(LANTHI) 'SO_LANTHI'
FROM KETQUATHI KQT
WHERE MAMH = 'CSDL'
GROUP BY MAHV,MAMH) AS A, KETQUATHI KQT WHERE KQT.LANTHI = A.SO_LANTHI 
AND A.MAHV = KQT.MAHV AND KQT.MAMH = A.MAMH) AS B, HOCVIEN HV WHERE B.MAHV = HV.MAHV;

--C2
SELECT HV.*, DIEM 'DIEM_CSDL_LANTHI_SAUCUNG'
FROM HOCVIEN HV, KETQUATHI KQT
WHERE HV.MAHV = KQT.MAHV
AND MAMH = 'CSDL'
AND LANTHI = 
(
	SELECT MAX(LANTHI)
	FROM KETQUATHI KQT
	WHERE KQT.MAHV = HV.MAHV
	AND MAMH = 'CSDL'
	GROUP BY MAHV
);
--18. Danh sách học viên và điểm thi môn “Co So Du Lieu” (chỉ lấy điểm cao nhất của các lần thi).

SELECT HV.*, DIEM 'DIEM_CSDL_CAONHAT_TRONGCACLANTHI' FROM(
SELECT MAHV, MAX(DIEM) 'DIEM'
FROM KETQUATHI KQT, MONHOC MH
WHERE MH.MAMH = KQT.MAMH AND
TENMH = 'Co So Du Lieu'
GROUP BY MAHV) AS A,HOCVIEN HV WHERE HV.MAHV = A.MAHV;

--19. Khoa nào (mã khoa, tên khoa) được thành lập sớm nhất.
SELECT MAKHOA,TENKHOA
FROM KHOA
WHERE KHOA.NGTLAP = (SELECT MIN(NGTLAP) FROM KHOA);
--20. Có bao nhiêu giáo viên có học hàm là “GS” hoặc “PGS”
SELECT COUNT(MAGV) 'SL_GV_GS_PGS'
FROM GIAOVIEN 
WHERE GIAOVIEN.HOCHAM = 'GS' OR GIAOVIEN.HOCHAM = 'PGS';
--21. Thống kê có bao nhiêu giáo viên có học vị là “CN”, “KS”, “Ths”, “TS”, “PTS” trong mỗi khoa.
SELECT MAKHOA, HOCVI, COUNT(MAGV) 'SO_GV'
FROM GIAOVIEN
GROUP BY HOCVI, MAKHOA;
--22. Mỗi môn học thống kê số lượng học viên theo kết quả (đạt và không đạt).
SELECT A.MAMH, SLHV_DAT,SLHV_KHONG_DAT FROM (SELECT MAMH, COUNT(MAHV) 'SLHV_DAT' FROM KETQUATHI
WHERE KQUA = 'DAT'
GROUP BY MAMH) AS A, (SELECT MAMH, COUNT(MAHV) 'SLHV_KHONG_DAT' FROM KETQUATHI
WHERE KQUA = 'KHONG DAT'
GROUP BY MAMH) AS B WHERE B.MAMH = A.MAMH;

--23. Tìm giáo viên (mã giáo viên, họ tên) là giáo viên chủ nhiệm của một lớp, đồng thời dạy cho lớp đó ít
--nhất một môn học.

SELECT DISTINCT MAGV,HOTEN 
FROM(SELECT DISTINCT GIAOVIEN.MAGV,HOTEN,MALOP,COUNT(MAMH) 'SO_MH' 
		FROM GIANGDAY, GIAOVIEN 
			WHERE GIANGDAY.MAGV = GIAOVIEN.MAGV 
				GROUP BY GIAOVIEN.MAGV,HOTEN,MALOP 
					HAVING COUNT(MAMH) >= 1) AS A, LOP WHERE LOP.MAGVCN = A.MAGV;


--24. Tìm họ tên lớp trưởng của lớp có sỉ số cao nhất.
SELECT (HO+' '+TEN) HO_TEN FROM HOCVIEN HV, LOP L
WHERE HV.MAHV = L.TRGLOP AND L.SISO >= ALL (SELECT SISO FROM LOP);


--25. * Tìm họ tên những LOPTRG thi không đạt quá 3 môn (mỗi môn đều thi không đạt ở tất cả các lần
--thi).

SELECT (HO+' '+TEN) AS HO_TEN
FROM LOP,HOCVIEN HV,KETQUATHI KQT
WHERE LOP.TRGLOP = HV.MAHV
AND KQT.MAHV = HV.MAHV
AND KQUA = 'KHONG DAT'
GROUP BY TRGLOP,HO,TEN
HAVING COUNT(*) > 3;

--26. Tìm học viên (mã học viên, họ tên) có số môn đạt điểm 9,10 nhiều nhất.

SELECT A.MAHV, (HO+' '+TEN) AS HO_TEN FROM
(SELECT MAHV,COUNT(MAMH) 'SO_MH_0910D' FROM KETQUATHI KQT
WHERE DIEM = 9 OR DIEM = 10
GROUP BY MAHV
HAVING COUNT(MAMH) >= ALL (SELECT COUNT(MAMH) FROM KETQUATHI WHERE DIEM = 9 OR DIEM = 10 GROUP BY MAHV)) AS A, HOCVIEN WHERE A.MAHV = HOCVIEN.MAHV;

--27. Trong <từng lớp>, tìm học viên (mã học viên, họ tên) có số môn đạt điểm 9,10 nhiều nhất.
SELECT  HV1.MAHV, (HO+' '+TEN) AS HOTEN
FROM KETQUATHI KQ1,HOCVIEN HV1
WHERE (DIEM = 9 OR DIEM =10) AND KQ1.MAHV = HV1.MAHV
GROUP BY HV1.MAHV,HO,TEN,MALOP
HAVING COUNT(DIEM) >= ALL(SELECT COUNT(DIEM)
						FROM KETQUATHI KQ2,HOCVIEN HV2
						WHERE (DIEM = 9 OR DIEM = 10) AND KQ2.MAHV = HV2.MAHV AND HV1.MALOP = HV2.MALOP
						GROUP BY HV2.MAHV,MALOP
						);

--28. Trong từng học kỳ của từng năm, mỗi giáo viên phân công dạy bao nhiêu môn học, bao nhiêu lớp.

SELECT HOCKY,NAM,GIAOVIEN.MAGV,HOTEN, COUNT(MAMH) 'SL_MH', COUNT(MALOP) 'SL_LOP'
FROM GIAOVIEN LEFT JOIN
GIANGDAY ON GIAOVIEN.MAGV = GIANGDAY.MAGV
GROUP BY HOCKY,NAM,GIAOVIEN.MAGV,HOTEN;

--29. Trong từng học kỳ của từng năm, tìm giáo viên (mã giáo viên, họ tên) giảng dạy nhiều nhất.

SELECT NAM,HOCKY, GV1.MAGV,HOTEN
FROM GIAOVIEN GV1, GIANGDAY GD1
WHERE GV1.MAGV = GD1.MAGV
GROUP BY GV1.MAGV,HOTEN,HOCKY,NAM
HAVING COUNT(*) >= ALL( SELECT COUNT(*) FROM GIANGDAY GD2 WHERE GD2.HOCKY= GD1.HOCKY AND GD1.NAM = GD2.NAM GROUP BY MAGV,HOCKY,NAM);


--30. Tìm môn học (mã môn học, tên môn học) có nhiều học viên thi không đạt (ở lần thi thứ 1) nhất.
SELECT MH.MAMH, TENMH
FROM KETQUATHI KQT, MONHOC MH
WHERE KQT.MAMH = MH.MAMH
AND LANTHI = 1
AND KQUA = 'KHONG DAT'
GROUP BY MH.MAMH,TENMH
HAVING COUNT(MAHV) >= ALL (SELECT COUNT(MAHV) FROM KETQUATHI KQT WHERE LANTHI =1 AND KQUA = 'KHONG DAT' GROUP BY MAMH);

--31. Tìm học viên (mã học viên, họ tên) thi môn nào cũng đạt (chỉ xét lần thi thứ 1).

SELECT HV.MAHV,(HO+' '+TEN) AS HOTEN
FROM KETQUATHI KQT1,HOCVIEN HV
WHERE KQT1.MAHV = HV.MAHV
AND LANTHI = 1
AND KQUA = 'DAT'
GROUP BY HV.MAHV,HO,TEN
HAVING COUNT(MAMH) IN (SELECT COUNT(MAMH) FROM KETQUATHI KQT2 WHERE KQT2.MAHV = HV.MAHV GROUP BY MAHV);


--32. * Tìm học viên (mã học viên, họ tên) thi môn nào cũng đạt (chỉ xét lần thi sau cùng).

SELECT HV.MAHV, (HO+' '+TEN) AS HOTEN FROM
(SELECT MAHV,MAMH,KQUA, MAX(LANTHI) 'LAN_THI_SAU_CUNG'
FROM KETQUATHI
GROUP BY MAHV,MAMH,KQUA) AS A, HOCVIEN HV WHERE HV.MAHV = A.MAHV AND KQUA = 'DAT'
GROUP BY HV.MAHV,HO,TEN
HAVING COUNT(MAMH) IN (SELECT COUNT(DISTINCT MAMH) 
						FROM KETQUATHI KQT2
						WHERE HV.MAHV = KQT2.MAHV
							GROUP BY MAHV);

--33. * Tìm học viên (mã học viên, họ tên) đã thi tất cả các môn đều đạt (chỉ xét lần thi thứ 1).

SELECT MAHV,(HO+' '+TEN) AS HOTEN
FROM HOCVIEN HV
WHERE NOT EXISTS(  
					SELECT MAMH FROM KETQUATHI KQT1 WHERE 
					NOT EXISTS(SELECT *FROM KETQUATHI KQT2 
									WHERE KQT2.MAMH = KQT1.MAMH 
										AND KQT2.MAHV = HV.MAHV AND LANTHI = 1 AND KQUA = 'DAT'));

--34. * Tìm học viên (mã học viên, họ tên) đã thi tất cả các môn đều đạt (chỉ xét lần thi sau cùng).

SELECT HV.MAHV, (HO+' '+TEN) AS HOTEN
FROM HOCVIEN HV
WHERE NOT EXISTS (SELECT MAMH FROM KETQUATHI KQT1
						WHERE NOT EXISTS(SELECT *FROM KETQUATHI KQT2 WHERE KQUA = 'DAT'
											AND LANTHI = (SELECT MAX(LANTHI) 'SL_THI'
											FROM KETQUATHI KQT3 WHERE 
											KQT3.MAMH = KQT1.MAMH  AND KQT3.MAHV = HV.MAHV
											GROUP BY MAHV,MAMH) AND KQT2.MAHV = HV.MAHV AND KQT2.MAMH = KQT1.MAMH));


--35. ** Tìm học viên (mã học viên, họ tên) có điểm thi cao nhất trong từng môn (lấy điểm ở lần thi sau
--cùng).

SELECT HV.MAHV, (HO+' '+TEN) AS HOTEN,MAMH,DIEM 
FROM HOCVIEN HV, KETQUATHI KQT1
WHERE HV.MAHV = KQT1.MAHV
AND DIEM >= ALL(SELECT MAX (DIEM) FROM KETQUATHI KQT2
					WHERE KQT2.MAMH = KQT1.MAMH)
					AND LANTHI = 
					(SELECT MAX(LANTHI) FROM KETQUATHI KQT3 
							WHERE KQT3.MAMH = KQT1.MAMH AND KQT3.MAHV = KQT1.MAHV);
					





