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
('P005', 'Thuận Phước', 'Q001'),
('P006', 'Hòa Thuận Tây', 'Q001'),
('P007', 'Hoà Thuận Đông', 'Q001'),
('P008', 'Nam Dương', 'Q001'),
('P009', 'Bình Thuận', 'Q001'),
('P010', 'Bình Hiên', 'Q001'),
('P011', 'Hòa Cường Nam', 'Q001'),
('P012', 'Hòa Cường Bắc', 'Q001'),

('P013', 'Thọ Quang', 'Q002'),
('P014', 'Mân Thái', 'Q002'),
('P015', 'Phước Mỹ', 'Q002'),
('P016', 'An Hải Bắc', 'Q002'),
('P017', 'An Hải Đông', 'Q002'),
('P018', 'An Hải Tây', 'Q002'),

('P019', 'Mỹ An', 'Q003'),
('P020', 'Khuê Mỹ', 'Q003'),
('P021', 'Hòa Hải', 'Q003'),
('P022', 'Hòa Quý', 'Q003'),
	
--Khuê Trung, Hòa Thọ Đông, Hòa Thọ Tây, Hòa An, Hòa Phát, Hòa Xuân
('P023', 'Khuê Trung', 'Q004'),
('P024', 'Hòa Thọ Đông', 'Q004'),
('P025', 'Hòa Thọ Tây', 'Q004'),
('P026', 'Hòa An', 'Q004'),
('P027', 'Hòa Phát', 'Q004'),
('P028', 'Hòa Xuân', 'Q004'),

-- Vĩnh Trung, Tân Chính, Thạc Gián, Chính Gián, Tam Thuận, Xuân Hà, An Khê, Hoà Khê, Thanh Khê Đông, Thanh Khê Tây.
('P029', 'Vĩnh Trung', 'Q005'),
('P030', 'Tân Chính', 'Q005'),
('P031', 'Thạc Gián', 'Q005'),
('P032', 'Chính Gián', 'Q005'),
('P033', 'Tam Thuận', 'Q005'),
('P034', 'Xuân Hà', 'Q005'),
('P035', 'An Khê', 'Q005'),
('P036', 'Hoà Khê,', 'Q005'),
('P037', 'Thanh Khê Đông', 'Q005'),
('P038', 'Thanh Khê Tây', 'Q005'),

-- Hòa Minh, Hòa Khánh Nam, Hoà Khánh Bắc, Hòa Hiệp Nam, Hoà Hiệp Bắc.
('P039', 'Hòa Minh', 'Q006'),
('P040', 'Hòa Khánh Nam', 'Q006'),
('P041', 'Hoà Khánh Bắc', 'Q006'),
('P042', 'Hòa Hiệp Nam', 'Q006'),
('P043', 'Hoà Hiệp Bắc', 'Q006')
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








-----------------------------------------
-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 23, 2021 lúc 03:58 AM
-- Phiên bản máy phục vụ: 10.4.17-MariaDB
-- Phiên bản PHP: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `uniroom`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `districts`
--

CREATE TABLE `districts` (
  `did` int(11) NOT NULL,
  `dname` varchar(255) COLLATE utf8_unicode_520_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `feedback`
--

CREATE TABLE `feedback` (
  `fid` int(11) NOT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_520_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_520_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_520_ci NOT NULL,
  `content` text COLLATE utf8_unicode_520_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `guides`
--

CREATE TABLE `guides` (
  `gid` int(11) NOT NULL,
  `gname` varchar(255) COLLATE utf8_unicode_520_ci NOT NULL,
  `content` text COLLATE utf8_unicode_520_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `posts`
--

CREATE TABLE `posts` (
  `pid` int(11) NOT NULL,
  `pname` varchar(255) COLLATE utf8_unicode_520_ci NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_520_ci NOT NULL,
  `description` text COLLATE utf8_unicode_520_ci NOT NULL,
  `date_create` timestamp NOT NULL DEFAULT current_timestamp(),
  `area` int(11) NOT NULL,
  `picture` varchar(255) COLLATE utf8_unicode_520_ci NOT NULL,
  `status` int(1) NOT NULL,
  `wid` int(11) NOT NULL,
  `add_detail` text COLLATE utf8_unicode_520_ci NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_520_ci NOT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_520_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_520_ci NOT NULL,
  `role_id` int(11) NOT NULL DEFAULT 2,
  `enabled` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wards`
--

CREATE TABLE `wards` (
  `wid` int(1) NOT NULL,
  `wname` varchar(255) COLLATE utf8_unicode_520_ci NOT NULL,
  `did` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `districts`
--
ALTER TABLE `districts`
  ADD PRIMARY KEY (`did`);

--
-- Chỉ mục cho bảng `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`fid`);

--
-- Chỉ mục cho bảng `guides`
--
ALTER TABLE `guides`
  ADD PRIMARY KEY (`gid`);

--
-- Chỉ mục cho bảng `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`pid`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `wards`
--
ALTER TABLE `wards`
  ADD PRIMARY KEY (`wid`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `districts`
--
ALTER TABLE `districts`
  MODIFY `did` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `feedback`
--
ALTER TABLE `feedback`
  MODIFY `fid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `guides`
--
ALTER TABLE `guides`
  MODIFY `gid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `posts`
--
ALTER TABLE `posts`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `wards`
--
ALTER TABLE `wards`
  MODIFY `wid` int(1) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
