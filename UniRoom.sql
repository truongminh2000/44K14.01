Create Database UniRoom
Use UniRoom

Create table Account
(
	Username varchar(50) primary key,
	Pass varchar(50) not null,
	Fullname nvarchar(50) not null,
	Phone varchar(12) not null,
	Acc_Role char(1) not null
)

Create table DiaChi
(
	Id_DiaChi varchar(10) primary key,
	Phuong nvarchar(50) not null,
	Quan nvarchar(50) not null, 
	Truong nvarchar(50) not null
)

Create table BaiDang
(
	Id_BaiDang varchar(10) primary key,
	Title nvarchar(255) not null,
	NoiDung nvarchar(255) not null,
	NgayDang date not null,
	KichThuoc numeric(10,0) not null,
	Gia numeric(10,0) not null,
	HinhAnh varchar(255) not null,
	TrangThai varchar(255) not null,
	Id_DiaChi varchar(10) not null,
	DiaChiCuThe varchar(255) not null,
)

Create table FeedBack
(
	Id_FeedBack varchar(10) primary key,
	Title nvarchar(255) not null,
	NoiDung nvarchar(255) not null
)

Create table Guide
(
	Id_Guide varchar(10) primary key,
	Title nvarchar(255) not null,
	NoiDung nvarchar(255) not null,
	HinhAnh varchar(255) not null
)