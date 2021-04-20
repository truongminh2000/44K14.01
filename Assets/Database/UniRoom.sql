Create Database UniRoom
go

Use UniRoom
go

Create table users
(
	username varchar(50) primary key,
	password varchar(50) not null,
	fullname nvarchar(50) not null,
	phone varchar(12) not null,
	user_role char(1) not null
)
go

insert users 
values 
('Admin', '123', 'Admin', '', '1'),
('MinhTruong', '123', 'Trương Công Minh', '0916685091', '0'),
('HoangLuong', '123', 'Lương Ngọc Hoàng', '0943974642', '0')
go

create table dictricts 
(
	did varchar(10) primary key,
	dname nvarchar(100)
)
go

insert dictricts 
values 
('Q001', 'Hải Châu'),
('Q002', 'Sơn Trà'),
('Q003', 'Ngũ Hành Sơn'),
('Q004', 'Cẩm Lệ'),
('Q005', 'Thanh Khê'),
('Q006', 'Liên Chiểu')
go

create table wards 
(
	wid varchar(10) primary key,
	wname nvarchar(100),
	did varchar(10)
)

go
ALTER TABLE wards
ADD CONSTRAINT fk_did
 FOREIGN KEY (did)
 REFERENCES dictricts (did);
go
--Hải Châu 1, Hải Châu 2, Thạch Thang, Thanh Bình, Thuận Phước, 
--Hòa Thuận Tây, Hoà Thuận Đông, Nam Dương, Phước Ninh, Bình Thuận, Bình Hiên, Hòa Cường Nam, Hòa Cường Bắc.

insert wards 
values 
('P001', 'Hải Châu 1', 'Q001'),
('P002', 'Hải Châu 2', 'Q001'),
('P003', 'Thạch Thang', 'Q001'),
('P004', 'Thanh Bình', 'Q001'),
('P005', 'Thanh Khê', 'Q001'),
('P007', 'Thuận Phước', 'Q001'),
('P008', 'Hòa Thuận Tây', 'Q001'),
('P009', 'Hoà Thuận Đông', 'Q001'),
('P010', 'Nam Dương', 'Q001'),
('P011', 'Bình Thuận', 'Q001'),
('P012', 'Bình Hiên', 'Q001'),
('P013', 'Hòa Cường Nam', 'Q001'),
('P014', 'Hòa Cường Bắc', 'Q001'),

('P019', 'Thọ Quang', 'Q002'),
('P020', 'Mân Thái', 'Q002'),
('P021', 'Phước Mỹ', 'Q002'),
('P022', 'An Hải Bắc', 'Q002'),
('P023', 'An Hải Đông', 'Q002'),
('P024', 'An Hải Tây', 'Q002'),

('P015', 'Mỹ An', 'Q003'),
('P016', 'Khuê Mỹ', 'Q003'),
('P017', 'Hòa Hải', 'Q003'),
('P018', 'Hòa Quý', 'Q003'),
	
--Khuê Trung, Hòa Thọ Đông, Hòa Thọ Tây, Hòa An, Hòa Phát, Hòa Xuân
('P025', 'Khuê Trung', 'Q004'),
('P026', 'Hòa Thọ Đông', 'Q004'),
('P027', 'Hòa Thọ Tây', 'Q004'),
('P028', 'Hòa An', 'Q004'),
('P029', 'Hòa Phát', 'Q004'),
('P030', 'Hòa Xuân', 'Q004'),

-- Vĩnh Trung, Tân Chính, Thạc Gián, Chính Gián, Tam Thuận, Xuân Hà, An Khê, Hoà Khê, Thanh Khê Đông, Thanh Khê Tây.
('P031', 'Vĩnh Trung', 'Q005'),
('P032', 'Tân Chính', 'Q005'),
('P033', 'Thạc Gián', 'Q005'),
('P034', 'Chính Gián', 'Q005'),
('P035', 'Tam Thuận', 'Q005'),
('P036', 'Xuân Hà', 'Q005'),
('P037', 'An Khê', 'Q005'),
('P038', 'Hoà Khê,', 'Q005'),
('P039', 'Thanh Khê Đông', 'Q005'),
('P040', 'Thanh Khê Tây', 'Q005'),

-- Hòa Minh, Hòa Khánh Nam, Hoà Khánh Bắc, Hòa Hiệp Nam, Hoà Hiệp Bắc.
('P041', 'Hòa Minh', 'Q006'),
('P042', 'Hòa Khánh Nam', 'Q006'),
('P043', 'Hoà Khánh Bắc', 'Q006'),
('P044', 'Hòa Hiệp Nam', 'Q006'),
('P045', 'Hoà Hiệp Bắc', 'Q006')
go


Create table posts
(
	pid varchar(10) primary key,
	username varchar(50),
	title nvarchar(255) not null,
	content nvarchar(255) not null,
	date_created date not null,
	area int not null,
	price int not null,
	picture varchar(255) not null,
	status varchar(255) not null,
	wid varchar(10) not null,
	add_detail nvarchar(255) not null
)
go

ALTER TABLE posts
ADD CONSTRAINT fk_ward_id
 FOREIGN KEY (wid)
 REFERENCES wards (wid);
go

ALTER TABLE posts
ADD CONSTRAINT fk_username
 FOREIGN KEY (username)
 REFERENCES users (username);
go

Create table feedbacks
(
	fid varchar(10) primary key,
	fullname nvarchar(100),
	content nvarchar(255) not null,
	email varchar(50)
)
go

Create table guides
(
	gid varchar(10) primary key,
	gname nvarchar(255) not null,
	content nvarchar(255) not null,
	picture varchar(255) not null
)
go