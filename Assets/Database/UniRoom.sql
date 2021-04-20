Create Database UniRoom
go

Use UniRoom
go

Create table Account
(
	Username varchar(50) primary key,
	Pass varchar(50) not null,
	Fullname nvarchar(50) not null,
	Phone varchar(12) not null,
	Acc_Role char(1) not null
)
go

Create table DiaChi
(
	Id_DiaChi varchar(10) primary key,
	Phuong nvarchar(50) not null,
	Quan nvarchar(50) not null, 
	Truong nvarchar(50) not null
)
go


Create table BaiDang
(
	Id_BaiDang varchar(10) primary key,
	Username varchar(50),
	Title nvarchar(255) not null,
	NoiDung nvarchar(255) not null,
	NgayDang date not null,
	KichThuoc numeric(10,0) not null,
	Gia numeric(10,0) not null,
	HinhAnh varchar(255) not null,
	TrangThai varchar(255) not null,
	Id_DiaChi varchar(10) not null,
	DiaChiCuThe varchar(255) not null
)
go

ALTER TABLE BaiDang
ADD CONSTRAINT fk_id_DiaChi
 FOREIGN KEY (Id_DiaChi)
 REFERENCES DiaChi (Id_DiaChi);

go

ALTER TABLE BaiDang
ADD CONSTRAINT fk_username
 FOREIGN KEY (Username)
 REFERENCES Account (Username);

Create table FeedBack
(
	Id_FeedBack varchar(10) primary key,
	full_Name nvarchar(100),
	NoiDung nvarchar(255) not null,
	email varchar(50)
)
go

Create table Guide
(
	Id_Guide varchar(10) primary key,
	Title nvarchar(255) not null,
	NoiDung nvarchar(255) not null,
	HinhAnh varchar(255) not null
)
go