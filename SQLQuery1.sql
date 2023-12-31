
IF EXISTS (SELECT * FROM sys.databases WHERE Name='Example5')
DROP DATABASE Example5
GO
CREATE DATABASE Example5
GO
USE Example5
GO
--T?o b?ng L?p h?c
CREATE TABLE LopHoc(
MaLopHoc INT PRIMARY KEY IDENTITY,
TenLopHoc VARCHAR(10)
)
GO
--T?o b?ng Sinh vi�n c� kh�a ngo?i l� c?t MaLopHoc, n?i v?i b?ng 

CREATE TABLE SinhVien(
MaSV int PRIMARY KEY,
TenSV varchar(40),
MaLopHoc int,
CONSTRAINT fk FOREIGN KEY (MaLopHoc) REFERENCES LopHoc(MaLopHoc)
)
GO

GO
--T?o b?ng SanPham v?i m?t c?t NULL, m?t c?t NOT NULL
CREATE TABLE SanPham (
MaSP int NOT NULL,
TenSP varchar(40) NULL
);

insert into SanPham values(1, 'Cafe')

select * from SanPham

GO
--T?o b?ng v?i thu?c t�nh default cho c?t Price
CREATE TABLE StoreProduct(
ProductID int NOT NULL,
Name varchar(40) NOT NULL,
Price money NOT NULL DEFAULT (100)
)
INSERT INTO StoreProduct (ProductID, Name, Price)
VALUES (1, 'Product A', 150.00);

INSERT INTO StoreProduct (ProductID, Name)
VALUES (2, 'Product B');

select * from StoreProduct
GO
--T?o b?ng ContactPhone v?i thu?c t�nh IDENTITY
CREATE TABLE ContactPhone (
Person_ID int IDENTITY(500,1) NOT NULL,
MobileNumber bigint NOT NULL
)
INSERT INTO ContactPhone ( MobileNumber)
VALUES ( 5);
INSERT INTO ContactPhone ( MobileNumber)
VALUES ( 56);
INSERT INTO ContactPhone ( MobileNumber)
VALUES ( NULL);
select * from ContactPhone
GO

GO
--T?o c?t nh?n d?ng duy nh?t t?ng th?
DROP TABLE CellularPhone
CREATE TABLE CellularPhone(
Person_ID uniqueidentifier DEFAULT NEWID() NOT NULL,
PersonName varchar(60) NOT NULL
)
--Ch�n m?t record v�o
INSERT INTO CellularPhone(PersonName) VALUES('William Smith')
GO
--Ki?m tra gi� tr? c?a c?t Person_ID t? ??ng sinh
SELECT * FROM CellularPhone 
GO
--T?o b?ng ContactPhone v?i c?t MobileNumber c� thu?c t�nh UNIQUE
DROP TABLE ContactPhone
CREATE TABLE ContactPhone (
Person_ID int PRIMARY KEY,
MobileNumber bigint UNIQUE,
ServiceProvider varchar(30),
LandlineNumber bigint UNIQUE
)
--Ch�n 2 b?n ghi c� gi� tr? gi?ng nhau ? c?t MobileNumber v� LanlineNumber ?? quan s�t l?i
INSERT INTO ContactPhone values (101, 983345674, 'Hutch', NULL)
INSERT INTO ContactPhone values (102, 983345675, 'Alex', 1)

DELETE FROM ContactPhone;

SELECT * FROM ContactPhone 
GO
GO
--T?o b?ng PhoneExpenses c� m?t CHECT ? c?t Amount
CREATE TABLE PhoneExpenses (
Expense_ID int PRIMARY KEY,
MobileNumber bigint FOREIGN KEY REFERENCES ContactPhone
(MobileNumber),
Amount bigint CHECK (Amount >0)
)
go
INSERT INTO PhoneExpenses values (102, 983345675, 'Alex', 1)

GO
--Ch?nh s?a c?t trong b?ng
ALTER TABLE ContactPhone 
ALTER COLUMN ServiceProvider varchar(50)
GO
--X�a c?t trong b?ng
ALTER TABLE ContactPhone 
DROP COLUMN ServiceProvider 
GO
---Them m?t r�ng bu?c v�o b?ng
ALTER TABLE ContactPhone ADD CONSTRAINT CHK_RC CHECK(RentalCharges >0)
GO
--X�a m?t r�ng bu?c
ALTER TABLE Person.ContactPhone 
DROP CONSTRAINT CHK_RC