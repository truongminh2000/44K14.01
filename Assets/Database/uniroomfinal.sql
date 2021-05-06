-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th5 06, 2021 lúc 02:46 AM
-- Phiên bản máy phục vụ: 10.4.17-MariaDB
-- Phiên bản PHP: 7.4.11

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

--
-- Đang đổ dữ liệu cho bảng `districts`
--

INSERT INTO `districts` (`did`, `dname`) VALUES
(1, 'Hải Châu'),
(2, 'Cẩm Lệ'),
(3, 'Thanh Khê'),
(4, 'Liên Chiểu'),
(5, 'Ngũ Hành Sơn'),
(6, 'Sơn Trà');

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

--
-- Đang đổ dữ liệu cho bảng `feedback`
--

INSERT INTO `feedback` (`fid`, `fullname`, `email`, `subject`, `content`) VALUES
(1, 'as', 'luongngochoang0@gmail.com', 'a', 'sdsđsadsa'),
(2, 'asád', 'luongngochoang3@gmail.com', 'a', 'dá'),
(4, 'acx', 'sdasd', 'adsad', 'ádsad'),
(5, 'hello', 'helloword', 'hello world', 'hello world'),
(6, 'Nguyễn Văn C', 'due', 'SĐT', 'Cho em xin SĐT của người đăng phòng trọ ABC'),
(7, 'truong cong minh', 'truongcongminhqn@gmail.com', 'Thắc mắc về sử dụng trang', 'Testing'),
(8, 'wwwwwd', 'ww@gmail.com', 'ưqeqw', 'eqwe'),
(9, 'Nguyễn Thị Tố Như', 'nguyenthitonhu3003@gmail.com', 'tìm trọ', 'hahahh hihihi');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `guides`
--

CREATE TABLE `guides` (
  `gid` int(11) NOT NULL,
  `gname` varchar(255) COLLATE utf8_unicode_520_ci NOT NULL,
  `content` text COLLATE utf8_unicode_520_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci;

--
-- Đang đổ dữ liệu cho bảng `guides`
--

INSERT INTO `guides` (`gid`, `gname`, `content`) VALUES
(2, 'Kinh nghiệm tìm phòng trọ cho sinh viên', '<strong>1. Xác định khu vực thuê trọ</strong><br><br>\r\n\r\nĐầu tiên hãy ưu tiên những vị trí thuận tiện cho việc học tập, làm việc của bạn nhất. Nhà trọ gần nơi học, nơi làm sẽ giúp bạn tiết kiệm thời gian di chuyển cũng như tiền xăng xe. Xét về lâu dài sẽ có lợi hơn so với thuê nhà giá rẻ mà khoảng cách quá xa.<br><br>\r\n\r\nCũng cần lưu ý xem các tuyến đường di chuyển có dễ lưu thông không hay luôn trong trạng thái kẹt xe. Tiếp đến bạn nên chọn khu vực đông dân cư, gần chợ và bệnh viện thì càng tốt. Bên cạnh đó cũng hãy quan tâm tìm hiểu xem khu vực này có thường bị ngập khi trời mưa không.<br><br>\r\n\r\nNgoài ra không nên tìm nhà trọ nơi quá hẻo lánh và không có tính an ninh cao.<br><br>\r\n\r\n<strong>2. Giá thuê phòng trọ, nhà trọ</strong><br><br>\r\n\r\nGiá cả là yếu tố quan trọng ảnh hưởng tới quyết định thuê nhà trọ - phòng trọ của bạn. Thị trường giá cả phòng trọ hiện nay rất đa dạng, tùy vào kích thước, không gian nhà trọ mà có những mức giá tương đương. Những phòng trọ đầy đủ tiện nghi và rộng rãi thì thường đòi hỏi mức giá cao hơn so các phòng nhỏ hẹp.<br><br>\r\n\r\nBên cạnh giá cả phòng thuê bạn cũng cần chú ý đến giá tiền điện, tiền nước, phí gửi xe, tiền wifi, vệ sinh,... Mọi thứ cần thật rõ ràng với chủ trọ ngay từ đầu, tránh những tranh chấp về sau. <br><br>\r\n\r\n<strong>3. Tiền cọc </strong><br><br>\r\n\r\nKhi thuê phòng trọ thường thì bạn cần đặt cọc tiền. Thông thường sẽ bằng 1 - 2 tháng tiền trọ, nhưng tốt nhất chỉ nên là 1 tháng. Hãy cảnh giác với những nơi hối thúc bạn đặt tiền cọc khi chưa ký hợp đồng, hoặc đòi hỏi số tiền cọc quá lớn. <br><br>\r\n\r\n<strong>4. Tiền điện</strong><br><br>\r\n\r\nHiện nay giá điện cho người thuê nhà trọ - phòng trọ được quy định theo thông tư 25/2018/TT - BCT và Quyết định 4495/QĐ-BCT, cụ thể: \r\n\r\nCó 6 mức giá điện hiện hành là 1.549, 1.600, 1.858, 2.340, 2,615, 2.701đồng/ kwh tương ứng lần lượt với 6 bậc sử dụng (đối với người thuê trọ trên 12 tháng và có đăng ký tạm trú). Riêng đối với trường hợp người thuê trọ dưới 12 tháng và chưa kê khai đủ lượng người dùng điện thì tính giá bán lẻ điện sinh hoạt của bậc thang thứ 3 là 1.858 đồng/kwh chưa thuế GTGT.<br><br>\r\n\r\nDo đó, nếu những nơi tính tiền điện quá cao, bạn cần cân nhắc và tìm hiểu thêm tránh bị mất tiền oan. Pháp luật cũng cũng quy định, nếu chủ nhà thu tiền điện cao trái pháp luật sẽ bị phạt nặng, lên đến 10.000.000 đồng.<br><br>\r\n');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mails`
--

CREATE TABLE `mails` (
  `id` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_520_ci NOT NULL,
  `did` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci;

--
-- Đang đổ dữ liệu cho bảng `mails`
--

INSERT INTO `mails` (`id`, `email`, `did`) VALUES
(1, 'luongngochoang0@gmail.com', 1),
(2, 'truongcongminhqn@gmail.com', 1),
(3, 'locdinh.20012000@gmail.com', 1),
(4, 'congphucqs@gmail.com', 1),
(5, 'minhzon6@gmail.com', 1),
(6, 'nguyenthitonhu3003@gmail.com', 1),
(9, 'phamthao8471@gmail.com', 3),
(21, 'itphutran.com@gmail.com', 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `posts`
--

CREATE TABLE `posts` (
  `pid` int(11) NOT NULL,
  `pname` varchar(255) COLLATE utf8_unicode_520_ci NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_520_ci NOT NULL DEFAULT '0',
  `description` text COLLATE utf8_unicode_520_ci NOT NULL,
  `date_create` timestamp NOT NULL DEFAULT current_timestamp(),
  `area` int(11) NOT NULL,
  `picture` varchar(255) COLLATE utf8_unicode_520_ci NOT NULL,
  `status` int(1) NOT NULL DEFAULT 0,
  `wid` int(11) NOT NULL,
  `add_detail` text COLLATE utf8_unicode_520_ci NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci;

--
-- Đang đổ dữ liệu cho bảng `posts`
--

INSERT INTO `posts` (`pid`, `pname`, `username`, `description`, `date_create`, `area`, `picture`, `status`, `wid`, `add_detail`, `price`) VALUES
(13, 'Cho thuê trọ đường Núi Thành ', 'nhuntt44k14', 'Vị trí sau lưng UBND phường Hòa Cường bắc và trường cao đẳng Phương Đông khu vực an ninh\r\nLiên hệ :09122354663', '2021-05-04 13:15:52', 30, 'mau-phong-tro-co-gac-lung-dep (20)-27840286270693.jpg', 1, 1, ' K381 Núi Thành ', 2300000),
(14, 'CHO THUÊ PHÒNG TRỌ NẠI HIÊN ĐÔNG, SƠN TRÀ', 'admin', 'Mình còn phòng trọ cho thuê tại 70 Giáp Hải, 02 Ngô Thì Hương, Sơn Trà.\r\n\r\nBạn nào có nhu cầu thì liên hệ mình nhé! KIM LAN\r\n\r\nRất cảm ơn bạn!', '2021-05-04 13:19:58', 25, '4-noi-that-phong-ngu-be-mau-xanh-noi-that-manh-he-27874516589821.jpg', 1, 43, '15 Nại Hiên Đông', 1500000),
(17, 'Cho thuê phòng trọ Trưng Nữ Vương, Hải Châu', 'admin', 'Khu Trưng Nữ Vương Thông núi thành, gần cầu rồng\r\nChỉ còn lại vài phòng trống\r\n**Phòng rộng, nội thất cơ bản, giờ giấc tự do, không chung chủ\r\n**Có sân để xe, phơi đồ riêng, máy giặt tập thể\r\nNhà xe có camera giám sát nên rất yên tâm\r\n**Bếp, wc khép kín từng phòng, wifi free\r\nLiên hệ:0365425463', '2021-05-04 13:27:45', 25, 'thiet-ke-phong-tro-dep-6-27863557408857.jpg', 1, 8, '130 Trưng Nữ Vương', 2500000),
(18, 'Cho Thuê Phòng Trọ Sạch Sẽ và An Toàn', 'admin', 'Cần cho thuê Phòng trọ đẹp còn mới sạch sẽ\r\n\r\nKhu an ninh\r\n\r\nCửa sổ thoáng mát\r\n\r\nCó một số nội thất\r\n\r\nLH: 0905096136 gặp Nguyệt', '2021-05-04 13:29:37', 20, '13-27848420557616.jpg', 1, 43, '139 Chu Huy Mân', 2000000),
(19, 'Cho thuê phòng trọ 359A Phan Châu Trinh', 'nhuntt44k14', 'CHO THUÊ TRỌ trong nhà nguyên căn, nội thất đầy đủ, vào ở ngay!\r\nMIỄN PHÍ WIFI, MÁY GIẶT, Camera an ninh.\r\nLiên hệ:0912365456', '2021-05-04 13:32:24', 30, '12-27823187505793.jpg', 1, 1, '359A Phan Châu Trinh', 2800000),
(21, 'Cho thuê nhà trọ giá bình dân, khu vực an ninh và tiện ích', 'admin', 'Nhà trọ mới xây . Thoáng mát . Có gác lửng rộng rải .Ở ngay măt tiền đường lớn 7.5m .Xung quanh nhiều tiện nghi. Bệnh viện ..Trường học', '2021-05-04 13:37:02', 25, '2-27811947515851.jpg', 1, 37, 'Đường Lê Văn Tâm', 2000000),
(23, 'Cho thuê phòng trọ Cách 500m đường 2/9, Hải Châu', 'nhuntt44k14', 'Đầy đủ bàn ghế, giường tủ bếp, tủ lạnh, điều hòa, máy giặt…\r\n\r\nBan công xanh mát, an ninh đảm bảo, giao thông thuận lợi\r\n\r\nCó thể ở hộ gia đình hoặc nhóm ở chung\r\nLiên hệ:0945653625', '2021-05-04 13:45:22', 35, 'thiet-ke-phong-tro-dep-6-27735275227054.jpg', 1, 12, '75 Hải Hồ', 3500000),
(24, 'Cho thuê phòng trọ 30m2, nhà chỉ có 2 phòng, thoáng mát.', 'admin', 'Phòng trọ tại đường Hải Triều, phường Hòa Hải, quận Ngũ Hành Sơn, Tp.Đà Nẵng Khu trọ chỉ có 2 phòng, có cổng riêng, chỗ để xe máy và phơi quần áo. Cả 2 phòng đều thoáng mát, hướng Đông Bắc, có bếp nấu, toilet khép kín, gác lửng, thoát nước máy giặt, diện tích sử dụng mỗi phòng khoảng 35m2 Phòng trọ nằm trong khu hưu trí an ninh, trước mặt là nhà văn hóa-trung tâm yoga Sen Hồng, đường 7m, gần khu TT hành chính, bệnh viện NHS, trường cấp 1,2,3…bán kính khoảng 1km, rất thích hợp với gia đình có con nhỏ hoặc người đi làm. Giá: 2tr/1 phòng, điện nước thanh toán theo đồng hồ, wifi miễn phí. Cảm ơn đã đọc tin\r\n\r\nLiên hệ ngay: 0905058733', '2021-05-04 13:47:14', 30, '15-27760299592496.jpg', 1, 35, 'Hải Triều', 2000000),
(25, 'Phòng ghép tiện nghi an toàn mặt biển ở Thanh Khê', 'admin', ' Môi trường sống giá trị dành cho người trẻ ở Đà Nẵng. Giá trị Tiện nghi An toàn – Lối sống Văn Minh – Kết nối và Phát triển bản thân\r\n \r\n Địa chỉ 713 Nguyễn Tất Thành, phù hợp với các bạn sinh viên và người đi làm ở quận Thanh Khê và quận Hải Châu\r\n \r\nPhòng đầy đủ nội thất : máy giặt, máy nước nóng, điều hòa, quạt, nệm, chăn ra gối, tủ. Các bạn chỉ cần xách vali đến ở! ^^\r\n \r\nThông thoáng: 100% phòng có cửa số, nắng chiếu tận giường, sân thượng rộng có chỗ phơi áo quần\r\n \r\n Mặt biển Thanh Khê tha hồ ngắm bình minh và hoàng hôn trong khung cảnh thơ mộng\r\n \r\n Đặc biệt, có thư viện sách và không gian học tập và làm việc. Tham gia miễn phí CLB Tiếng Anh và Workshop Kỹ năng mềm cho cư dân nhà trọ.\r\nCÓ HAI LOẠI PHÒNG GHÉP 2 GIƯỜNG VÀ 4 GIƯỜNG, NAM VÀ NỮ Ở RIÊNG. GIÁ CHỈ TỪ 850K/ THÁNG.\r\nSĐT: 0909112277\r\n', '2021-05-04 13:48:46', 20, '4-noi-that-phong-ngu-be-mau-xanh-noi-that-manh-he-27789114725021.jpg', 1, 20, '713 Nguyễn Tất Thành, Thanh Khê District, Đà Nẵng, Vietnam', 850000),
(26, 'Cho thuê phòng trong nhà nguyên căn Hoàng Diệu, Hải Châu', 'admin', '4 phòng đã cho thuê 1 phòng còn 3 PHÒNG TRỐNG trong nhà nguyên căn . \r\nĐối diện chợ ,trước nhà ăn uống từ sáng đến khuya vô tư tiện lợi\r\nLiên hệ:0912564573', '2021-05-04 13:51:27', 30, '10-15959302107241449964770-27801916648885.jpg', 1, 4, 'k406 Hoàng Diệu', 3800000),
(27, 'Cho thuê căn hộ mini tiện nghi an toàn mặt biển ở Thanh Khê', 'No', ' Môi trường sống giá trị dành cho người trẻ ở Đà Nẵng. Giá trị Tiện nghi An toàn – Lối sống Văn Minh – Kết nối và Phát triển bản thân\r\n\r\nĐịa chỉ 713 Nguyễn Tất Thành, phù hợp với các bạn sinh viên và người đi làm ở quận Thanh Khê và quận Hải Châu\r\n\r\nPhòng riêng giường đôi đầy đủ nội thất : máy giặt, máy nước nóng, điều hòa, quạt, nệm, chăn ra gối, tủ. Các bạn chỉ cần xách vali đến ở! ^^\r\n\r\nThông thoáng: 100% phòng có cửa số, nắng chiếu tận giường, sân thượng rộng có chỗ phơi áo quần\r\n\r\nMặt biển Thanh Khê tha hồ ngắm bình minh và hoàng hôn trong khung cảnh thơ mộng\r\n\r\nĐặc biệt, thư viện sách và không gian học tập và làm việc. Tham gia miễn phí CLB Tiếng Anh và Workshop Kỹ năng mềm cho cư dân nhà trọ.\r\n\r\nGIÁ CHỈ 2 TRIỆU/ PHÒNG, Ở ĐƯỢC 2 NGƯỜI. CHỈ CÒN DUY NHẤT 2 PHÒNG MINI STUDIO.\r\n\r\nLiên hệ Hiếu 037.497.5449 để được tư vấn tận tình nhé !', '2021-05-04 13:53:24', 20, '9-27778057783338.jpg', 1, 20, '713 Nguyễn Tất Thành, Thanh Khê District, Đà Nẵng, Vietnam', 2000000),
(29, 'cho thuê phòng trọ đường Đinh Tiên Hoàng, Đà Nẵng', 'phamthao', 'Cho thuê 2 phòng trọ tại K92 Đinh Tiên Hoàng, Thanh Khê, Đà Nẵng.\r\nMỗi phòng có khu vực bếp, sân phơi và nhà vệ sinh riêng biệt. Phòng mới, sạch đẹp, có lắp điều hòa, miễn phí wifi, truyền hình cáp. Ra vào cổng chung với chủ nhà, có chỗ để xe rộng rãi. Khu vực an ninh, yên tĩnh, chỉ cho hộ gia đình thuê.\r\nPhòng 30m2: 2.200.000 đồng/tháng.\r\nPhòng 25m2: 1.800.000 đồng/tháng.\r\nLiên hệ: 0906.559240.', '2021-05-04 14:06:29', 30, 'Storage-bed-1024x717-27752825131481.jpg', 1, 23, '92 Đinh tiên hoàng, thanh khê, đà nẵng', 1800000),
(30, 'Cho thuê phòng trọ tại 95 Phan Đăng lưu, Hải Châu', 'nhuntt44k14', '– Tự do giờ giấc, cho bạn thoải mái về thời gian.\r\n– An ninh tốt, có thiết bị camera giám sát 24/24\r\n– Điều hòa , bình nóng lạnh, tivi, máy giặt.\r\n– Tủ quần áo, giường nệm, bàn làm việc.\r\nLiên hệ: 0905654236', '2021-05-04 14:09:23', 25, 'tải xuống-27730585051115.jpg', 1, 7, '95 Phan Đăng lưu', 1900000),
(31, 'Phòng trọ cao cấp full nội thất, wifi đường Điện Biên Phủ 2.2tr/ tháng', 'admin', 'Phòng trọ cao cấp Đà Nẵng chuẩn khách sạn 1 sao Hải Vân Sơn\r\n– Diện tích : 20 m2\r\n– Yên tĩnh, thoáng mát,\r\n– Đầy đủ tiện nghi: Toilet, bàn ghế, giường nệm, tủ quần áo, tủ lạnh, tivi truyền hình cáp, điều hòa, wifi, nước nóng lạnh miễn phí toàn bộ. Có nhà để xe riêng, phòng giặt là, bếp, sân phơi.\r\n– Điện, nước đầy đủ và có đồng hồ riêng\r\n– An ninh cao có nhà để xe bảo vệ.\r\nGiá cho thuê: 2.000.000 Tháng(Giá trên chưa bao gồm phí điện nước hàng tháng )\r\n—————————————————-\r\nKhách sạn Hải Vân Sơn chuẩn 1 sao\r\nĐ/c: 220/3 Điện Biên Phủ\r\n\r\nLiên hệ : 0948757512', '2021-05-04 14:13:30', 20, 'Thiết-kế-phòng-ngủ-27697551554135.jpg', 1, 21, '220/3 Điện Biên Phủ', 2200000),
(32, 'Cho thuê phòng trọ gần Trường Ngoại Ngữ, Hải Châu', 'admin', 'Phòng rộng, cao thoáng mát, có gác lững, kệ bếp, wc khép kín…\r\nĐiện: 3k/kw\r\nNước: 30k/người/tháng\r\nƯu tiên nữ \r\nLiên hệ: 0365856454', '2021-05-04 14:16:54', 20, 'thiet-phong-tro-15m2-jpg-20190401120218kU9p9jWtGi-27676539860600.jpg', 1, 11, '21 Lê Lợi', 1800000),
(33, 'Cần 1 2 bạn nam để share phòng', 'No', 'vì phòng rộng nên mình cần 1 2 bạn nam để tiện share phòng. phòng mình cách trường Duy Tân nguyễn văn linh 500m. rộng rãi thoáng mát. ai cần liên hệ mình.\r\nSĐT: 0909112255', '2021-05-04 14:17:51', 50, 'trang-trí-phòng-ngủ-nhỏ-6m2-7m2-8m2-1-27645100203978.jpg', 1, 25, '34 Phan Thanh, Thanh Khê District, Da Nang, Vietnam', 750000),
(34, 'Phòng trọ full nội thất trung tâm quận Thanh Khê đầy đủ tiện nghi.', 'No', 'CHo thuê phòng trọ mới xây đầy đủ tiện nghi. \r\nĐịa chỉ: K814A/30/3 Trần Cao Vân, Q Thanh Khê, ĐN gần Điện Biên Phủ, chợ Kì Đồng, cách biển Nguyễn Tất Thành 200m \r\nĐầy đủ tiện nghi: Mỗi phòng đều có điều hòa, tủ lạnh, máy giặt, bình nóng lạnh, bếp điện, tủ quần áo... \r\nCó nguyên tầng 1 để xe rộng rãi, camera an ninh. \r\nDiện tích sử dụng: 30m2 cả gác. \r\nĐiện: 3.5k/số Nước: 10k/khối\r\nLiên hệ: 0358548405 (cô ba)', '2021-05-04 14:22:37', 30, '20170204115615-76d8-27952612097000.jpg', 1, 26, ' K814a Trần Cao Vân, Thanh Khê, Đà Nẵng, Việt Nam', 3000000),
(36, 'Cho thuê phòng trọ khu vực Hoà Khánh', 'admin', 'Phòng rộng rãi thoáng mát, đầy đủ tiện nghi, kệ bếp nấu ăn, an ninh tốt.\r\nSĐT: 0909112244', '2021-05-04 14:27:20', 30, '12-27977708383477.jpg', 1, 33, 'Đường Nguyễn Khắc Nhu, Liên Chiểu, Đà Nẵng, Việt Nam', 2000000),
(37, 'Cho thuê 2 phòng trọ mặt tiền 62 Phùng Chí Kiên, Hoà Minh, Liên Chiểu, Đà Nẵng', 'admin', 'Cho thuê 2 phòng trọ mặt tiền 62 Phùng Chí Kiên.\r\nGần KTX Phía Đông – ĐH Sư Phạm – ĐH Bách Khoa – Chợ – Bệnh Viện\r\n\r\n Phòng giá từ 1.900.000đ\r\n\r\nĐầy đủ tiện nghi : giường nệm , tủ quần áo. Máy quạt\r\n\r\nBãi để xe bao la, Camera An Ninh\r\n\r\nGiờ giấc do\r\n\r\nLiên hệ : 0972765843', '2021-05-04 14:29:55', 25, '15-27991199103793.jpg', 1, 34, '62 Phùng Chí Kiên, Hoà Minh, Liên Chiểu, Đà Nẵng', 1900000),
(38, 'Cho thuê phòng trọ cao cấp đầy đủ tiện nghi', 'admin', 'T-Home cho thuê phòng trọ đầy đủ tiện nghi, sạch sẽ và an toàn phù hợp cho các bạn sinh viên và nhân viên văn phòng, vị trị trên đường Nguyễn Lương Bằng và Đặng Huy Trứ gần trường đại học Bách Khoa, chợ Hòa Khánh, khu CN Hòa Khánh.\r\nCác lợi ích khi đến nhà T-Home ở là:\r\nKhông lo mua sắm đồ vì T-Home đã trang bị đồ dùng đầy đủ\r\nKhông lo tìm người ở ghép\r\nKhông gian ở thỏa mái, tiện nghi\r\nGiờ giấc tự do\r\nCửa khóa từ vân tay, cửa cuốn bên ngoài đảm bảo an toàn\r\nGiá thuê theo 1 người là từ 1tr/người, thuê theo phòng có giá từ 2tr/tháng, tùy phòng.\r\nLiên hệ đặt thuê 0934751818, T-Home sẵn sàng phục vụ quý khách.', '2021-05-04 14:32:03', 20, '1-28002553290271.jpg', 1, 32, '250 Nguyễn Lương Bằng', 2000000),
(39, 'Cho thuê phòng trọ, Trương Vân Lĩnh, Liên Chiểu, Đà Nẵng', 'admin', 'Cho thuê phòng trọ, Trương Vân Lĩnh, Liên Chiểu, Đà Nẵng\r\n\r\nĐịa chỉ : 88 Trương Vân Lĩnh, Liên Chiểu, Đà Nẵng\r\n\r\nChi tiết :\r\n– Phòng mới 100%\r\n– Phòng sạch sẽ ,có cửa sổ thông thoáng\r\n– Có gác lửng , vệ sinh trong\r\n– Phòng rộng ở được 3 người\r\n– Điện ,nước tính theo giá nhà nước\r\n– Khu vực an ninh\r\n– Gần KCN Hoà khánh\r\n\r\nGiá thuê : 1 triệu/tháng\r\n\r\nLiên hệ : 0905929398', '2021-05-04 14:34:09', 25, '13-28023480083270.jpg', 1, 31, '88 Trương Vân Lĩnh, Liên Chiểu, Đà Nẵng', 1000000),
(43, 'Cho thuê phòng 252 Lê Thanh Nghị, Hòa Cường Bắc, Hải Châu', 'No', 'Phòng có điều hoà, tủ lạnh, tủ quần áo.\r\nVị trí gần trung tâm thành phố, khu vui chơi giải trí, trường học, siêu thị, chợ, bệnh viện.\r\nmôi trường sống văn minh, lịch sự.\r\nMiễn phí wifi internet, trình hình cáp, phí quản lý, chổ để xe.\r\nGiờ mở cửa từ 5h30- 23h15. thích hợp v/c, người đi làm, nữ thuê, hoặc 1 nam.\r\nLH : 0787733556', '2021-05-04 14:51:54', 30, '7-27969630963780.jpg', 1, 6, '252 Lê Thanh Nghị', 3000000),
(45, 'Cho thuê phòng trọ cao cấp tại 110 Trần Huy Liệu, gần Trường Đại Học Kiến Trúc, ĐH Ngoại Ngữ, ĐH Đông Á, Cao Đẳng Bách Khoa', 'admin', 'Lợi thế: gần Trường Đại Học Kiến Trúc, ĐH Ngoại Ngữ, ĐH Đông Á, Cao Đẳng Bách Khoa, gần sân bay và cách thành phố chỉ mất 10 phút.\r\n– Bao gồm WIFI, điện, nước, máy giặt, nước nóng.\r\n– Nếu dùng điều hòa thì trả theo số chữ điện điều hòa 4K/ 1 chữ.\r\n– Phòng ở sạch sẽ giống phòng khách sạn, có đầy đủ tiện nghi:\r\n– Giường, gối.\r\n– Tủ áo quần, bàn ghế làm việc.\r\n– Máy giặt, điều hòa, máy quạt.\r\n– Buồng tắm toilet cao cấp, có máy nước nóng mùa đông.\r\n– Có tạp vụ dịch vụ chùi phòng thường xuyên.\r\n– Không được hút thuốc trong phòng và đem thức ăn vào phòng.\r\n\r\nAi có nhu cầu vui lòng liên hệ: 0915 365 324', '2021-05-04 14:56:29', 25, '8-27945006992457.jpg', 1, 19, '110 Trần Huy Liệu', 3300000),
(47, 'Cho thuê phòng trọ Đô Đốc Bảo, Hòa Xuân, Cẩm Lệ', 'No', ' Đà Nẵng, gần cầu Nguyễn Tri Phương, sau lưng Metro, các bạn sinh viên Kiến Trúc, Đông Á đi học cũng tương đối gần.\r\n\r\nPhòng mới xây xong, có cửa sổ thoáng, gác lửng, bếp, vệ sinh khép kín\r\nLH: 090565456', '2021-05-04 14:59:26', 20, 'Thiết-kế-phòng-ngủ-27926155184356.jpg', 1, 18, '06 Đô Đốc Bảo', 1200000),
(48, 'Cho thuê phòng trọ mặt tiền Mẹ Thứ, Cẩm Lệ, Đà Nẵng', 'nhuntt44k14', 'Còn 1 phòng mặt tiền rộng rãi thoáng mát sạch sẽ giá 2,5tr.\r\n– xây phục vụ cho gđ nên rất rộng rãi tolet ,bếp sạch sẽ cho các bạn có gd . Lại gần các công ty nên nhiều công nhân rất thuận tiện cho các bạn kinh doanh và làm nghề .\r\nLiên hệ:0365636585', '2021-05-04 15:02:26', 25, '2-27919857638270.jpg', 1, 18, '442 Mẹ Thứ', 2600000),
(49, 'Cho thuê phòng trọ Phạm Hùng, Cẩm lệ, Đà Nẵng ', 'admin', 'Nội thất đầy đủ: quạt, máy lạnh, tủ quần áo, máy giặt, máy nóng lạnh, tivi,…', '2021-05-04 15:07:44', 25, '10-27900433293452.jpg', 1, 18, '119 Phạm Hùng', 2000000),
(50, 'Cho thuê Phòng trọ Khuê Trung Cẩm Lệ', 'No', 'Yêu cầu: nữ sinh viên. (tối đa 2 người)\r\n– Có 1 giường. 1 tủ áo quần\r\n– Nhà vệ sinh phía ngoài nhưnh thuận tiện.\r\n– Có thể sử dụng chung không gian phòng khách và bếp.\r\n– Nước 50k / người. Điện: thỏa thuận thêm.\r\n– Cách chợ gần nhất 100m.\'\r\nLiên hệ:0365656325', '2021-05-04 15:10:25', 25, '9-27967777606151.jpg', 1, 19, '56 Bình Hoà 10 ', 2400000),
(51, 'Cho thuê phòng trọ Đỗ Thúc Tịnh, Cẩm Lệ, Đà Nẵng', 'No', 'Cho thuê phòng trọ mặt tiền mới xây.\r\n\r\nThuận tiện cho mở văn phòng, gia đình.\r\n\r\nPhòng mới xây, sạch sẽ, thoáng mát\r\nLiên hệ : 0365654658', '2021-05-04 15:13:38', 30, '8-27946039723100.jpg', 1, 19, '1E Đỗ Thúc Tịnh', 3200000),
(52, '~30m2 vệ sinh khép kín, đầy đủ tiện nghi. An hải Bắc, Sơn Trà ', 'admin', 'Phòng rộng rãi 30m2 thoáng mát, có cửa sổ, có thể ở tối đa 4 người. KHÔNG CẦN CỌC\r\n\r\nĐầy đủ tiện nghi chỉ cần ở không cần sắm thêm đồ:\r\n\r\n- 2 giường ngủ\r\n\r\n- Nhà vệ sinh khép kín\r\n\r\n- Điều hòa đời mới\r\n\r\n- Có người dọn vệ phòng hàng ngày\r\n\r\n- Tủ gỗ đựng quần áo\r\n\r\n- Bàn trà, bàn tiếp khách\r\n\r\n- Ti vi, truyền hình cáp Vietel\r\n\r\n- Wifi Vietel tốc độ cao >30Mb/giây\r\n\r\n- Sân thượng phơi Q.áo\r\n\r\n- Chăn, ga, gối đệm thay mới 7 ngày/ lần\r\n\r\n- Nước nóng năng lượng mặt trời.\r\n\r\n- Thang máy hiện đại.\r\n\r\n- KHÔNG MẤT ĐIỆN, mất điện có máy phát (nếu khách có nhu cầu)\r\n\r\n- Vị trí mặt đường Loseby, cách mặt biển ~300m, đỗ ô tô thoải mái.\r\n\r\n- Hầm để xe máy, an ninh tốt, có bảo vệ 24/7\r\n\r\nGiá 3,5tr-4tr/tháng', '2021-05-04 15:14:38', 30, 'Thiet-ke-phong-tro-don-gian-va-tiet-kiem.-2-28233176748794.jpg', 1, 39, 'Đường Loseby', 3500000),
(53, 'Cho thuê phòng trọ đường Hoàng Dư Khương, Cẩm Lệ, Đà Nẵng', 'nhuntt44k14', 'Yêu cầu:\r\nTối đa 2 bạn nữ, ít xe\r\nDùng bếp từ\r\nỞ lâu dài, sạch sẽ\r\n⛔Phòng có gác lửng đúc, chỗ rửa chén và nấu ăn, có kệ gỗ (có thể để sách hoặc cây xanh), ốp tường sạch sẽ. Ngoài ra, có chỗ để xe, phơi quần áo, wifi free (mỗi tầng 1 moderm). Nhà hướng Đông Nam mát quanh năm, mùa mưa ko bị lũ lụt.\r\nLiên hệ :0915653654', '2021-05-04 15:16:25', 27, 'phong-tro-nho-dep-so-3-28170318892935.jpg', 1, 19, '36 Hoàng Dư Khương', 2900000),
(54, 'Cho thuê phòng trọ Đường Cách Mạng Tháng Tám, Cẩm Lệ, Đà Nẵng', 'admin', 'Phòng có gác lững, gạch ốp tường, kệ nấu ăn rửa chén\r\nPhòng rộng, thoáng mát, sạch sẽ, mới xây\r\nKhu vực gần chợ Cẩm Lệ\r\nfree wifi tôc độ cao\r\nLiên hệ:0905123454', '2021-05-04 15:21:41', 30, '6-27825304690999.jpg', 1, 16, '353/7 Cách Mạng tháng 8', 2800000),
(55, 'PHÒNG RẺ 2,5tr – Thang Máy – Đủ Nội Thất', 'admin', 'NHANH KẺO HẾT- Phòng cho thuê tháng giá rẻ ngay 50 Lâm Hoành chỉ từ 2.5tr thôi . Có thang máy, nhiều loại phòng, đủ nội thất, xách vai ly vào ở thôi. Ngay sát Võ Văn Kiệt, ĐH Kinh Tế, Cao Đẳng Nghề, FPT – cách cầu Rồng và Trần Thị Lý 2Km, cách bãi biển Mỹ Khê chỉ 30m. Xung quanh nhiều tiện ích tạp hóa, hàng quán ăn uống, cafe – trà sữa, … . Đi về 24/24, Có bảo vệ, An ninh tốt, camera, wifi – TH cáp miễn phí, bãi xe … LH : 0979.211433-0939.033330', '2021-05-05 02:38:09', 20, '5-27804350270060.jpg', 1, 44, ' 50 Đường Lâm Hoành', 2500000),
(56, 'Phòng trọ kinh doanh 50m2 góc 2 mặt tiền Sơn Trà đường 10,5m giá 2.2TR/THÁNG', 'admin', 'Phòng trọ kinh doanh thích hợp vừa ở kết hợp kinh doanh mua bán\r\n\r\n– Diện tích sàn 30m2 + gác lửng 25m2\r\n\r\n– Vị trí góc 2 mặt tiền cực đẹp đường lớn Mân Quang 6 5m5 – Mân Quang 8 7m5. Cách Ngô Quyền 20m.\r\n\r\n– Cách tụ điểm du lịch 500m nên lượng khách Hàn, TQ khá đông thích hợp mở các dịch vụ du lịch như Spa, Nail\r\n\r\n\r\n \r\n– Cách khu công nghiệp hải sản 1KM thích hợp mở quán cơm, quán nhậu ..\r\n\r\n– Điện nước có đồng hồ riêng từng phòng. .\r\n\r\n– Giá hot chỉ 2.500.000 Đ / Tháng . Thanh toán từng tháng .\r\n\r\nBạn quan tâm vui lòng liên hệ\r\n\r\nNhấn để hiện số: 094875 7512', '2021-05-05 02:39:54', 50, '4-27783413419036.jpg', 1, 42, ' 21 Mân Quang 8', 2200000),
(57, 'Cho thuê phòng trọ đỗ mê gác lững mới xây nội thất đẹp- đường Phan Bá Vành', 'admin', '– Khu vực trung tâm thành phố, quy hoạch biệt thự nên dân trí cao, an ninh tôt, mặt tiên đường 10.5m gân sông hàn, biển, chợ trường học.\r\n\r\n– Chỉ có 6 phòng vừa xây xong, mỗi phòng 20m2 có gác lững đỗ bê tông chăc chăn. Có giường ngủ sẵn>>> cảm giác như ở nhà.\r\n\r\n\r\n \r\n– Tât cả phòng đêu có cửa sổ, phòng ôp gạch tường lên cao full nhà nên sạch sẽ,\r\n\r\n– Xây theo kiểu gia đình đây đủ công năng, giá để chén, vòi sen tăm, chậu rửa chén, lavabol, W.C, kệ úp chén, móc quân áo v.v…\r\n\r\n– WC riêng trang bị sẵn vị trí máy giặt, máy nước nóng. – Camera 24/24, wifi full, có khu để xe riêng 40m2 hoặc có thể đưa xe vào phòng tùy thích.\r\n\r\n– Phù hợp với người đi làm văn phòng, các cặp vợ chông có con nhỏ, cân nơi ở an ninh, tiện ích và sạch sẽ\r\nLiên hệ: 090 576 8384', '2021-05-05 02:46:46', 20, '3-27729209580283.jpg', 1, 43, 'Đường Phan Bá Vành', 22000),
(58, 'Cho thuê Phòng trọ 02 Ngô Thì Hương, Nại Hiên Đông, Sơn Trà, Đà Nẵng', 'admin', 'Cho thuê phòng trọ hướng Đông, DT 18 m2 + 6 m2 gác lững gỗ, khu vực an ninh camera 24/24, yên tĩnh, gần sông, rất mát mẻ. Giá từ 1,8 triệu đến 2,0 triệu đồng/ tháng (chưa bao gồm điện, nước), đặt cọc 1,0 triệu.\r\n\r\nLiên hệ chị Lan, Điện thoại 0906928207.\r\n\r\nCảm ơn bạn đã quan tâm đên mẫu tin này!', '2021-05-05 03:13:37', 24, '2-27709961300118.jfif', 1, 43, '02 Ngô Thì Hương', 1800000),
(84, 'Cho thuê nhà nguyên căn mới xây đường trường chinh', 'No', 'Liên hệ 0916685093', '2021-05-06 00:45:54', 20, '1-27691746619161.jpg', 1, 21, '12 Trường Chinh', 2000000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_520_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'ROLE_ADMIN'),
(2, 'ROLE_USER'),
(3, 'ROLE_MODIFIER');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `universities`
--

CREATE TABLE `universities` (
  `uid` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_520_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci;

--
-- Đang đổ dữ liệu cho bảng `universities`
--

INSERT INTO `universities` (`uid`, `name`) VALUES
(1, 'Đại học Kinh Tế'),
(2, 'Đại học Duy Tân'),
(3, 'Đại học Bách Khoa'),
(4, 'Đại học Ngoại Ngữ'),
(5, 'Đại học Đông Á'),
(6, 'Đại học Sư phạm'),
(7, 'Đại học Sư phạm Kỹ thuật'),
(8, 'Đại học Kỹ thuật Y dược');

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

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `username`, `fullname`, `password`, `role_id`, `enabled`) VALUES
(1, 'admin', 'Administrator', '$2a$10$QKKbH8aPbf5ZwoLFfIlwreCFuMg5I5PSrrmrl94/Ut6TYmuZXKrca', 1, 1),
(2, 'a', 'assssssssssss', '$2a$10$QKKbH8aPbf5ZwoLFfIlwreCFuMg5I5PSrrmrl94/Ut6TYmuZXKrca', 2, 1),
(5, '1811215141052', 'Lương Ngọc Hoàng', '$2a$10$QPNyJ4kuN1isQENhCrXf4u08zKTrVtQHqSkTbs0ROpMp4jCqtMPcW', 2, 1),
(6, 'truongcongminh2000', 'truong cong minh', '$2a$10$yCu.9o7tkP.ZYg9niq1QmOXYpBPwi0ZUBy.6vlUWG/OUoqPWOUsfC', 2, 1),
(7, 'thevinh2000', 'Nguyễn Thế Vĩnh', '$2a$10$yJjIa74iJV4VuiPLlHrMB.mC1IVN04PyEtKw88P/NKqB0JEvT8YCC', 2, 1),
(8, 'nhuntt44k14', 'Nguyễn Thị Tố Như', '$2a$10$VcBGf2bmDSYLM6b1dDvW.OyKCtszGtlX8DXRMP/xVO14GJ2sDwRrO', 2, 1),
(9, 'phamthao', 'Phạm Thị Thu Thảo', '$2a$10$jPOteoJEr2KO5HTX0sSm3OaacyuZ2FfsV6YZ.Z4IDD7YSexBDt12y', 2, 1),
(10, 'testngoailai', 'Tester chạy bằng cơm', '$2a$10$noDayFzpXr1PRSrEW5Vzie1lgB7I85Vs2iIbx1Fr5skjbzt/8pgNC', 2, 1),
(11, 'didoddodo', 'Hạ Quỳnh', '$2a$10$ofMRD1F7TuPu2EZEqwnvfedXVoYNod077/XNHj8P4JQ1PWeB5ZI7C', 2, 1),
(12, 'Balenciaga', 'Balenciaga', '$2a$10$LC.sKxrkdXwLXfa2qYz/aOrv66fPg8r4Nkf2H7rUwm6Jnnx91TExW', 2, 1),
(13, 'baolock14', 'Đinh Bảo Lộc', '$2a$10$l4fftf6I/iLWUxSwOhEBoeuR6Bj9Rian0292QkbqrqQpX.N5RVLIm', 2, 1),
(14, 'hangle02', 'Lê Thanh Hằng', '$2a$10$5Zf0nBNEf/AlvjaxSU0e1ODVohBICfgpEI7EhI4I1/lQ1MnsKsKLq', 2, 1),
(15, 'hoang4414', 'Ngọc Hoàng', '$2a$10$98ewN.y6n5tHizrkr9xXKOUGo1aso5UMhnhJ/Z0b6FuoELDxlgefu', 2, 1),
(16, 'user123456789', 'user123456789', '$2a$10$GdCyKccRzhfYGI4/0uN8Qu1bP4ol2.51tw40LrMIsyyhOVbsDai4C', 2, 1),
(18, 'abc12345', 'Trần Văn B', '$2a$10$O8QuKh15YSGEet5cmrBPkewS585CiRXWCrR./EbbZo.0ZtFIHNa.O', 2, 1),
(22, 'Milen1111', 'Bảo Ngânnnnn', '$2a$10$bizdXYsrFEF/2aRv1m3HeOI4Dwkdbgnketh.yUTJT3TrgDdLavjtS', 2, 1),
(23, 'hello1234', 'hello world', '$2a$10$Xplgm9MORExvaugdKQ2yQuw2T6UBNkftIzKTbRNxyHYCQYHf76oZe', 2, 1),
(24, 'centkali', 'Nguyễn Văn C', '$2a$10$fb7mdFabt/Qiq4ap/a1V0u9srMrUJGWoWbsU4jNla8wB0wc4RX/za', 2, 1),
(25, '181121514113', 'truong cong minh', '$2a$10$ghL4RToWgiUr.paJhz9LUu0zWegpsnpCo8JcQxX6n/fIL3Ynu3PYu', 2, 1),
(26, 'summersoon', 'Summer Lorem', '$2a$10$P/ixUzKU4ahKMzvg6ryeYu9sgATcuQ1RHVkM6qa4YK.EyYkyB2ijy', 2, 1),
(27, 'truongminh2000', 'truong cong minh', '$2a$10$gmp7930nm3bLLhgyAPW/R.7Lxwu35Xj1cYXn0tF4FhcizGaeeG1Ba', 2, 1),
(29, 'phucdai', 'nguyen dinh phuc dai', '$2a$10$p2jQYZatfsT0poIrLrS7nuaoWhCc6fRG80CBDIGy9XPm4NasgmGaW', 2, 1),
(30, 'phucdai11', 'nguyen dinh phuc dai', '$2a$10$.OPKeFQpSupB2X9zzDSWO.cWdHmqkGt8s5lnvK/6BZ6O8gzgPB6wC', 2, 1);

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
-- Đang đổ dữ liệu cho bảng `wards`
--

INSERT INTO `wards` (`wid`, `wname`, `did`) VALUES
(1, 'Hải Châu 1', 1),
(2, 'Hải Châu 2', 1),
(3, 'Bình Hiên', 1),
(4, 'Bình Thuận', 1),
(5, 'Nam Dương', 1),
(6, 'Hòa Cường Bắc', 1),
(7, 'Hòa Cường Nam ', 1),
(8, 'Hòa Thuận Nam', 1),
(9, 'Hòa Thuận Tây', 1),
(10, 'Phước Ninh', 1),
(11, 'Thạch Thang', 1),
(12, 'Thanh Bình', 1),
(13, 'Thuận Phước', 1),
(14, 'Hòa An', 2),
(15, 'Hòa Phát', 2),
(16, 'Hòa Thọ Đông', 2),
(17, 'Hòa Thọ Tây', 2),
(18, 'Hòa Xuân', 2),
(19, 'Khuê Trung', 2),
(20, 'An Khê', 3),
(21, 'Chính Gián', 3),
(22, 'Hòa Khê', 3),
(23, 'Tam Thuận', 3),
(24, 'Tân Chính', 3),
(25, 'Thạc Gián', 3),
(26, 'Thanh Khê Đông', 3),
(27, 'Thanh Khê Tây', 3),
(28, 'Vĩnh Trung', 3),
(29, 'Xuân Hà', 3),
(30, 'Hòa Hiệp Bắc', 4),
(31, 'Hòa Hiệp Nam', 4),
(32, 'Hòa Khánh Bắc', 4),
(33, 'Hòa Khánh Nam', 4),
(34, 'Hòa Minh', 4),
(35, 'Hòa Hải', 5),
(36, 'Hòa Quý', 5),
(37, 'Khuê Mỹ', 5),
(38, 'Mỹ An', 5),
(39, 'An Hải Bắc', 6),
(40, 'An Hải Đông', 6),
(41, 'An Hải Tây', 6),
(42, 'Mân Thái', 6),
(43, 'Nại Hiên Đông', 6),
(44, 'Phước Mỹ', 6),
(45, 'Thọ Quang', 6);

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
-- Chỉ mục cho bảng `mails`
--
ALTER TABLE `mails`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`pid`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `universities`
--
ALTER TABLE `universities`
  ADD PRIMARY KEY (`uid`);

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
  MODIFY `did` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `feedback`
--
ALTER TABLE `feedback`
  MODIFY `fid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `guides`
--
ALTER TABLE `guides`
  MODIFY `gid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `mails`
--
ALTER TABLE `mails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT cho bảng `posts`
--
ALTER TABLE `posts`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `universities`
--
ALTER TABLE `universities`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT cho bảng `wards`
--
ALTER TABLE `wards`
  MODIFY `wid` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
