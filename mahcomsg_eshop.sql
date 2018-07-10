-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th3 13, 2018 lúc 03:21 PM
-- Phiên bản máy phục vụ: 5.6.38
-- Phiên bản PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `mahcomsg_eshop`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mah_brands`
--

CREATE TABLE `mah_brands` (
  `id` int(11) NOT NULL,
  `name` varchar(54) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon` varchar(54) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(54) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sorted` int(11) NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ctl` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `mah_brands`
--

INSERT INTO `mah_brands` (`id`, `name`, `icon`, `image`, `sorted`, `created`, `modified`, `ctl`) VALUES
(1, 'Vespa', 'fa fa-vespa', '1513064763_vespa.png', 9, '2017-12-04 11:52:22', '2018-01-27 16:05:14', 0),
(2, 'Piaggio', 'fa fa-contao', '1513064525_piaggio.png', 6, '2017-12-04 11:52:22', '2018-01-30 10:15:23', 0),
(3, 'Victory', ' fa fa-victory', '1513064927_victory.png', 10, '2017-12-04 14:10:11', '2018-01-27 16:05:15', 0),
(4, 'Triumph', 'fa fa-triumph', '1513065211_triumph.png', 8, '2017-12-04 14:11:52', '2018-01-30 10:16:43', 0),
(5, 'Indian', 'fa fa-calendar-minus-o', '1513065508_indian.png', 4, '2017-12-04 14:13:39', '2018-01-27 16:05:08', 0),
(6, 'Aprilia', 'fa fa-hand-peace-o', '1513066375_aprilia.png', 2, '2017-12-04 14:19:30', '2018-01-27 16:05:06', 0),
(7, 'Moto Guzzi', 'fa fa-genderless', '1513066662_moto_guzzi.png', 5, '2017-12-04 14:20:00', '2018-01-30 10:13:17', 0),
(8, 'SYM', 'fa fa-opera', '1513067048_sym.png', 7, '2017-12-04 14:20:47', '2018-01-27 16:05:12', 0),
(9, 'Adiva', 'fa fa-cubes', '1513088352_adiva.png', 1, '2017-12-04 14:22:20', '2018-01-27 16:05:04', 0),
(10, 'GIVI', 'fa fa-map-o', '1513088377_givi.png', 3, '2017-12-04 14:25:47', '2018-01-27 16:05:07', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mah_cart`
--

CREATE TABLE `mah_cart` (
  `id` bigint(20) NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `qty` int(11) NOT NULL DEFAULT '0',
  `price` decimal(11,2) NOT NULL DEFAULT '0.00',
  `created` datetime DEFAULT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ctl` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `mah_cart`
--

INSERT INTO `mah_cart` (`id`, `order_id`, `user_id`, `product_id`, `qty`, `price`, `created`, `modified`, `ctl`) VALUES
(1, 3, 3, 1812, 2, '168.00', '2018-03-05 04:59:42', '2018-03-06 12:01:06', 0),
(2, 3, 3, 1811, 3, '172.00', '2018-03-05 05:00:02', '2018-03-06 12:01:06', 0),
(4, 3, 3, 229, 4, '506.00', '2018-03-05 05:01:25', '2018-03-06 12:01:06', 0),
(6, 3, 3, 76, 1, '26.00', '2018-03-05 05:17:27', '2018-03-06 12:01:06', 0),
(8, 0, 5, 903, 2, '131.00', '2018-03-05 20:04:11', '2018-03-05 12:12:17', 0),
(9, 0, 5, 1811, 2, '172.00', '2018-03-05 20:13:30', '2018-03-05 12:15:12', 0),
(10, 0, 5, 76, 1, '26.00', '2018-03-05 20:13:39', '2018-03-05 12:15:12', 0),
(11, 0, 5, 1812, 2, '168.00', '2018-03-05 20:19:14', '2018-03-05 12:20:15', 0),
(12, 0, 5, 492, 1, '59.00', '2018-03-05 20:19:19', '2018-03-05 12:20:15', 0),
(13, 1, 5, 1812, 2, '168.00', '2018-03-06 12:18:03', '2018-03-06 04:19:06', 0),
(14, 1, 5, 767, 1, '117.00', '2018-03-06 12:18:09', '2018-03-06 04:19:06', 0),
(15, 2, 5, 1811, 2, '172.00', '2018-03-06 19:09:44', '2018-03-06 11:10:12', 0),
(16, 4, 3, 1812, 1, '168.00', '2018-03-06 22:25:40', '2018-03-06 14:27:19', 0),
(17, 4, 3, 229, 2, '506.00', '2018-03-06 22:26:29', '2018-03-06 14:27:19', 0),
(18, 5, 6, 1812, 2, '168.00', '2018-03-08 11:22:45', '2018-03-08 03:37:54', 0),
(19, 5, 6, 2, 1, '50.00', '2018-03-08 11:22:55', '2018-03-08 03:37:54', 0),
(20, 6, 7, 1811, 1, '172.00', '2018-03-08 12:03:49', '2018-03-08 04:08:53', 0),
(21, 6, 7, 238, 2, '117.00', '2018-03-08 12:03:53', '2018-03-08 04:08:53', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mah_category`
--

CREATE TABLE `mah_category` (
  `id` int(11) NOT NULL,
  `name` varchar(54) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon` varchar(54) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sorted` int(11) NOT NULL DEFAULT '0',
  `main_cat` int(11) NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ctl` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `mah_category`
--

INSERT INTO `mah_category` (`id`, `name`, `icon`, `sorted`, `main_cat`, `created`, `modified`, `ctl`) VALUES
(1, 'Apparels', NULL, 0, 0, '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(2, 'Baseplate', NULL, 1, 0, '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(3, 'Box Add on', NULL, 2, 0, '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(4, 'Custom Accessories', NULL, 3, 0, '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(5, 'Custom Accs', NULL, 4, 0, '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(6, 'Engine Guard', NULL, 5, 0, '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(7, 'Fitting Kit', NULL, 6, 0, '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(8, 'Foglights', NULL, 7, 0, '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(9, 'Gps Holder', NULL, 8, 0, '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(10, 'Hand Protector', NULL, 9, 0, '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(11, 'Helmet', NULL, 10, 0, '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(12, 'Monokey Side Rack', NULL, 11, 0, '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(13, 'Pannier', NULL, 12, 0, '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(14, 'Pannier (Soft)', NULL, 13, 0, '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(15, 'Pannier Holder', NULL, 14, 0, '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(16, 'Pannier Rack', NULL, 15, 0, '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(17, 'Phone/Gps Holder', NULL, 16, 0, '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(18, 'Plug-Ins', NULL, 17, 0, '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(19, 'Protection', NULL, 18, 0, '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(20, 'Safety', NULL, 19, 0, '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(21, 'Seat Cover', NULL, 20, 0, '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(22, 'Side Rack', NULL, 21, 0, '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(23, 'Soft bags', NULL, 22, 0, '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(24, 'Softbags', NULL, 23, 0, '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(25, 'Spareparts', NULL, 24, 0, '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(26, 'Specific Rack', NULL, 25, 0, '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(27, 'Tank Bag', NULL, 26, 0, '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(28, 'Tool box', NULL, 27, 0, '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(29, 'Top box', NULL, 28, 0, '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(30, 'Top Box/Side Box', NULL, 29, 0, '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(31, 'Top Plate', NULL, 30, 0, '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(32, 'Top Rack', NULL, 31, 0, '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(33, 'Top rack/Plate', NULL, 32, 0, '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(34, 'Top/Side box', NULL, 33, 0, '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(35, 'Universal GPS Support', NULL, 34, 0, '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(36, 'V35N Side Rack', NULL, 35, 0, '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(37, 'Windscreen', NULL, 36, 0, '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mah_experience`
--

CREATE TABLE `mah_experience` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `company` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_from` date DEFAULT NULL,
  `date_to` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created` datetime DEFAULT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ctl` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `mah_experience`
--

INSERT INTO `mah_experience` (`id`, `user_id`, `company`, `position`, `date_from`, `date_to`, `description`, `created`, `modified`, `ctl`) VALUES
(1, 2, 'Web Design Studios', 'Manager director', '2014-01-01', 'present', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vehicula, magna et bibendum malesuada, purus augue suscipit dolor, vitae fringilla dui nibh non lectus. Curabitur in pellentesque tortor. Nunc posuere vestibulum augue, quis posuere orci blandit vitae. Suspendisse dignissim elit dui, ac dictum felis interdum nec.', '2017-10-14 11:06:26', '2017-10-13 19:33:03', 0),
(2, 2, 'Creation Inc.', 'Commercial manager', '2008-07-01', '2014-01-01', 'Nunc vehicula, magna et bibendum malesuada, purus augue suscipit dolor, vitae fringilla dui nibh non lectus. Curabitur in pellentesque tortor. Nunc posuere vestibulum augue, quis posuere orci blandit vitae. Suspendisse dignissim elit dui, ac dictum felis interdum nec.', '2017-10-14 11:06:26', '2017-10-13 19:33:07', 0),
(3, 2, 'Designers Corp.', 'Commercial assistant', '2002-03-01', '2008-07-01', 'Suspendisse dignissim elit dui, ac dictum felis interdum nec. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vehicula, magna et bibendum malesuada, purus augue suscipit dolor, vitae fringilla dui nibh non lectus. Curabitur in pellentesque tortor. Nunc posuere vestibulum augue, quis posuere orci blandit vitae.', '2017-10-14 11:06:26', '2017-10-13 19:33:10', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mah_follow`
--

CREATE TABLE `mah_follow` (
  `id` int(11) NOT NULL,
  `cat_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ctl` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `mah_follow`
--

INSERT INTO `mah_follow` (`id`, `cat_id`, `brand_id`, `created`, `modified`, `ctl`) VALUES
(1, 1, 10, '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(2, 2, 10, '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(3, 3, 10, '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(4, 4, 10, '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(5, 5, 10, '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(6, 6, 10, '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(7, 7, 10, '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(8, 8, 10, '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(9, 9, 10, '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(10, 10, 10, '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(11, 11, 10, '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(12, 12, 10, '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(13, 13, 10, '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(14, 14, 10, '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(15, 15, 10, '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(16, 16, 10, '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(17, 17, 10, '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(18, 18, 10, '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(19, 19, 10, '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(20, 20, 10, '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(21, 21, 10, '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(22, 22, 10, '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(23, 23, 10, '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(24, 24, 10, '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(25, 25, 10, '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(26, 26, 10, '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(27, 27, 10, '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(28, 28, 10, '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(29, 29, 10, '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(30, 30, 10, '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(31, 31, 10, '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(32, 32, 10, '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(33, 33, 10, '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(34, 34, 10, '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(35, 35, 10, '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(36, 36, 10, '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(37, 37, 10, '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mah_general`
--

CREATE TABLE `mah_general` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `general` text COLLATE utf8_unicode_ci,
  `created` datetime DEFAULT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ctl` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `mah_general`
--

INSERT INTO `mah_general` (`id`, `user_id`, `general`, `created`, `modified`, `ctl`) VALUES
(1, 2, '<h5 class=\"text-primary\" style=\"font-family: Roboto, sans-serif, Helvetica, Arial, sans-serif;\">A young professional</h5><p style=\"color: rgb(49, 53, 52);\">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p><h5 class=\"text-primary\" style=\"font-family: Roboto, sans-serif, Helvetica, Arial, sans-serif;\">Wanted by</h5><p style=\"color: rgb(49, 53, 52);\">Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p><p style=\"color: rgb(49, 53, 52);\">Curabitur pretium tincidunt lacus. Nulla gravida orci a odio. Nullam varius, turpis et commodo pharetra, est eros bibendum elit, nec luctus magna felis sollicitudin mauris. Integer in mauris eu nibh euismod gravida. Duis ac tellus et risus vulputate vehicula.</p><h5 class=\"text-primary\" style=\"font-family: Roboto, sans-serif, Helvetica, Arial, sans-serif;\">And finally</h5><p style=\"color: rgb(49, 53, 52);\">Donec lobortis risus a elit. Donec fermentum. Pellentesque malesuada nulla a mi. Duis sapien sem, aliquet nec, commodo eget, consequat quis, neque. Aliquam faucibus, elit ut dictum aliquet, felis nisl adipiscing sapien, sed malesuada diam lacus eget erat. Cras mollis scelerisque nunc. Nullam arcu. Aliquam consequat. Curabitur augue lorem, dapibus quis, laoreet et, pretium ac, nisi. Aenean magna nisl, mollis quis, molestie eu, feugiat in, orci. In hac habitasse platea dictumst.</p>', '2017-10-14 18:39:55', '2017-10-14 02:39:55', 0),
(2, 7, 'not availbility', '2018-03-08 12:32:38', '2018-03-08 04:32:38', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mah_image`
--

CREATE TABLE `mah_image` (
  `id` bigint(20) NOT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `image` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ctl` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `mah_image`
--

INSERT INTO `mah_image` (`id`, `product_id`, `image`, `created`, `modified`, `ctl`) VALUES
(1, 1812, '1520071411_S180T_SHIELD_.jpg', '2018-03-03 18:03:31', '2018-03-03 10:03:31', 0),
(2, 1811, '1520071437_S180F_SHIELD_.jpg', '2018-03-03 18:03:57', '2018-03-03 10:03:57', 0),
(3, 1732, '1520074962_D331ST.jpg', '2018-03-03 19:02:43', '2018-03-03 11:02:43', 0),
(4, 1589, '1520075028_AF49.jpg', '2018-03-03 19:03:48', '2018-03-03 11:03:48', 0),
(5, 1584, '1520075082_AF330.jpg', '2018-03-03 19:04:42', '2018-03-03 11:04:42', 0),
(6, 1567, '1520075120_A800N_still.jpg', '2018-03-03 19:05:20', '2018-03-03 11:05:20', 0),
(7, 1565, '1520075160_A780.jpg', '2018-03-03 19:06:00', '2018-03-03 11:06:00', 0),
(8, 1558, '1520075201_A660.jpg', '2018-03-03 19:06:41', '2018-03-03 11:06:41', 0),
(9, 1553, '1520075264_A604.jpg', '2018-03-03 19:07:44', '2018-03-03 11:07:44', 0),
(10, 1552, '1520075295_A603.jpg', '2018-03-03 19:08:15', '2018-03-03 11:08:15', 0),
(11, 1551, '1520075352_A601.jpg', '2018-03-03 19:09:12', '2018-03-03 11:09:12', 0),
(12, 1491, '1520075554_A210.jpg', '2018-03-03 19:12:34', '2018-03-03 11:12:34', 0),
(13, 1490, '1520075580_A200.jpg', '2018-03-03 19:13:00', '2018-03-03 11:13:00', 0),
(14, 903, '1520075658_EX2M.jpg', '2018-03-03 19:14:18', '2018-03-03 11:14:18', 0),
(15, 902, '1520075701_EX1SRA.png', '2018-03-03 19:15:01', '2018-03-03 11:15:01', 0),
(16, 882, '1520075802_V46_NT.jpg', '2018-03-03 19:16:42', '2018-03-03 11:16:42', 0),
(17, 881, '1520075813_V46_N_1.jpg', '2018-03-03 19:16:54', '2018-03-03 11:16:54', 0),
(18, 881, '1520075815_V46_N_2.jpg', '2018-03-03 19:16:56', '2018-03-03 11:16:56', 0),
(20, 878, '1520076113_TRK_52_SILVER_1.jpg', '2018-03-03 19:21:53', '2018-03-03 11:21:53', 0),
(21, 878, '1520076113_TRK_52_SILVER_2.jpg', '2018-03-03 19:21:53', '2018-03-03 11:21:53', 0),
(22, 877, '1520076180_TRK_52_BLACK.jpg', '2018-03-03 19:23:00', '2018-03-03 11:23:00', 0),
(23, 875, '1520076271_S410.jpg', '2018-03-03 19:24:31', '2018-03-03 11:24:31', 0),
(24, 874, '1520076387_TRK_OBK_58_BLACK_1.jpg', '2018-03-03 19:26:27', '2018-03-03 11:26:27', 0),
(25, 873, '1520076458_TRK_OBK_58_SILVER_3.jpg', '2018-03-03 19:27:38', '2018-03-03 11:27:38', 0),
(26, 873, '1520076458_TRK_OBK_58_SILVER_1.jpg', '2018-03-03 19:27:38', '2018-03-03 11:27:38', 0),
(27, 873, '1520076459_TRK_OBK_58_SILVER_2.jpg', '2018-03-03 19:27:39', '2018-03-03 11:27:39', 0),
(28, 872, '1520076527_TRK_OBK_42_BLACK_1.jpg', '2018-03-03 19:28:47', '2018-03-03 11:28:47', 0),
(29, 871, '1520076585_TRK_OBK_42_SILVER_1.jpg', '2018-03-03 19:29:46', '2018-03-03 11:29:46', 0),
(30, 871, '1520076586_TRK_OBK_42_SILVER_2.jpg', '2018-03-03 19:29:46', '2018-03-03 11:29:46', 0),
(31, 871, '1520076586_TRK_OBK_42_SILVER_3.jpg', '2018-03-03 19:29:46', '2018-03-03 11:29:46', 0),
(32, 857, '1520076672_E340_TECH.jpg', '2018-03-03 19:31:12', '2018-03-03 11:31:12', 0),
(33, 856, '1520076699_E340.jpg', '2018-03-03 19:31:39', '2018-03-03 11:31:39', 0),
(34, 854, '1520076776_E300NT2.jpg', '2018-03-03 19:32:56', '2018-03-03 11:32:56', 0),
(35, 853, '1520076804_E300N2.jpg', '2018-03-03 19:33:24', '2018-03-03 11:33:24', 0),
(36, 786, '1520076853_B47_TECH.jpg', '2018-03-03 19:34:14', '2018-03-03 11:34:14', 0),
(37, 785, '1520076882_B47_SILVER.jpg', '2018-03-03 19:34:42', '2018-03-03 11:34:42', 0),
(38, 783, '1520076932_B37_TECH.jpg', '2018-03-03 19:35:33', '2018-03-03 11:35:33', 0),
(39, 781, '1520076963_B37.jpg', '2018-03-03 19:36:03', '2018-03-03 11:36:03', 0),
(40, 778, '1520076992_B34_TECH.jpg', '2018-03-03 19:36:32', '2018-03-03 11:36:32', 0),
(41, 777, '1520077024_B34.jpg', '2018-03-03 19:37:04', '2018-03-03 11:37:04', 0),
(42, 770, '1520077066_B27NMAL.jpg', '2018-03-03 19:37:46', '2018-03-03 11:37:46', 0),
(43, 768, '1520077121_S250kit_01.jpg', '2018-03-03 19:38:41', '2018-03-03 11:38:41', 0),
(44, 767, '1520077147_S250.jpg', '2018-03-03 19:39:07', '2018-03-03 11:39:07', 0),
(45, 709, '1520077196_XS5112R.jpg', '2018-03-03 19:39:56', '2018-03-03 11:39:56', 0),
(46, 708, '1520077225_XS5112E.jpg', '2018-03-03 19:40:26', '2018-03-03 11:40:26', 0),
(47, 705, '1520077316_XS318.jpg', '2018-03-03 19:41:56', '2018-03-03 11:41:56', 0),
(48, 704, '1520077337_XS317.jpg', '2018-03-03 19:42:17', '2018-03-03 11:42:17', 0),
(49, 703, '1520077361_XS316.jpg', '2018-03-03 19:42:41', '2018-03-03 11:42:41', 0),
(50, 702, '1520077370_XS315.jpg', '2018-03-03 19:42:50', '2018-03-03 11:42:50', 0),
(51, 700, '1520077379_XS313.jpg', '2018-03-03 19:42:59', '2018-03-03 11:42:59', 0),
(52, 699, '1520077386_XS312.jpg', '2018-03-03 19:43:07', '2018-03-03 11:43:07', 0),
(53, 694, '1520077458_XS308.jpg', '2018-03-03 19:44:18', '2018-03-03 11:44:18', 0),
(54, 690, '1520077502_XS1110R.jpg', '2018-03-03 19:45:02', '2018-03-03 11:45:02', 0),
(55, 674, '1520077556_UT801.jpg', '2018-03-03 19:45:56', '2018-03-03 11:45:56', 0),
(56, 675, '1520077570_UT802.jpg', '2018-03-03 19:46:10', '2018-03-03 11:46:10', 0),
(57, 676, '1520077578_UT803.jpg', '2018-03-03 19:46:18', '2018-03-03 11:46:18', 0),
(58, 677, '1520077586_UT804.jpg', '2018-03-03 19:46:26', '2018-03-03 11:46:26', 0),
(59, 678, '1520077635_UT806.jpg', '2018-03-03 19:47:15', '2018-03-03 11:47:15', 0),
(60, 679, '1520077648_UT807.jpg', '2018-03-03 19:47:28', '2018-03-03 11:47:28', 0),
(61, 680, '1520077648_UT808.jpg', '2018-03-03 19:47:28', '2018-03-03 11:47:28', 0),
(62, 661, '1520078047_T502.jpg', '2018-03-03 19:54:07', '2018-03-03 11:54:07', 0),
(63, 663, '1520078074_T505.jpg', '2018-03-03 19:54:34', '2018-03-03 11:54:34', 0),
(64, 664, '1520078081_T506.jpg', '2018-03-03 19:54:41', '2018-03-03 11:54:41', 0),
(65, 665, '1520078093_T507.jpg', '2018-03-03 19:54:53', '2018-03-03 11:54:53', 0),
(66, 666, '1520078225_T511.jpg', '2018-03-03 19:57:05', '2018-03-03 11:57:05', 0),
(67, 667, '1520078232_T512.jpg', '2018-03-03 19:57:12', '2018-03-03 11:57:12', 0),
(68, 668, '1520078243_T513.jpg', '2018-03-03 19:57:23', '2018-03-03 11:57:23', 0),
(69, 669, '1520078254_T514.jpg', '2018-03-03 19:57:34', '2018-03-03 11:57:34', 0),
(70, 657, '1520078332_T490.jpg', '2018-03-03 19:58:52', '2018-03-03 11:58:52', 0),
(71, 654, '1520078354_T484B.jpg', '2018-03-03 19:59:14', '2018-03-03 11:59:14', 0),
(72, 650, '1520078379_T468B.jpg', '2018-03-03 19:59:39', '2018-03-03 11:59:39', 0),
(73, 647, '1520078417_T465_01.jpg', '2018-03-03 20:00:17', '2018-03-03 12:00:17', 0),
(74, 646, '1520078442_T445.jpg', '2018-03-03 20:00:42', '2018-03-03 12:00:42', 0),
(75, 645, '1520078464_T443B.jpg', '2018-03-03 20:01:04', '2018-03-03 12:01:04', 0),
(76, 641, '1520078499_ST605.jpg', '2018-03-03 20:01:39', '2018-03-03 12:01:39', 0),
(77, 640, '1520078510_ST603.jpg', '2018-03-03 20:01:50', '2018-03-03 12:01:50', 0),
(78, 639, '1520078518_ST602.jpg', '2018-03-03 20:01:58', '2018-03-03 12:01:58', 0),
(79, 638, '1520078525_ST601.jpg', '2018-03-03 20:02:05', '2018-03-03 12:02:05', 0),
(80, 634, '1520078623_MT504.jpg', '2018-03-03 20:03:43', '2018-03-03 12:03:43', 0),
(81, 633, '1520078648_MT502.jpg', '2018-03-03 20:04:08', '2018-03-03 12:04:08', 0),
(82, 632, '1520078664_MT501.jpg', '2018-03-03 20:04:24', '2018-03-03 12:04:24', 0),
(83, 632, '1520078666_MT501S.jpg', '2018-03-03 20:04:26', '2018-03-03 12:04:26', 0),
(84, 631, '1520078725_GRT708.jpg', '2018-03-03 20:05:25', '2018-03-03 12:05:25', 0),
(85, 630, '1520078731_GRT707.jpg', '2018-03-03 20:05:31', '2018-03-03 12:05:31', 0),
(86, 629, '1520078739_GRT706.jpg', '2018-03-03 20:05:39', '2018-03-03 12:05:39', 0),
(87, 628, '1520078746_GRT705.jpg', '2018-03-03 20:05:46', '2018-03-03 12:05:46', 0),
(88, 627, '1520078753_GRT704.jpg', '2018-03-03 20:05:53', '2018-03-03 12:05:53', 0),
(89, 626, '1520078762_GRT703.jpg', '2018-03-03 20:06:02', '2018-03-03 12:06:02', 0),
(90, 625, '1520078762_GRT702.jpg', '2018-03-03 20:06:02', '2018-03-03 12:06:02', 0),
(91, 624, '1520078985_GRT701.jpg', '2018-03-03 20:09:45', '2018-03-03 12:09:45', 0),
(92, 623, '1520079060_EA115KG.jpg', '2018-03-03 20:11:00', '2018-03-03 12:11:00', 0),
(93, 622, '1520079114_EA115BK.jpg', '2018-03-03 20:11:54', '2018-03-03 12:11:54', 0),
(94, 599, '1520079199_EA100B.jpg', '2018-03-03 20:13:19', '2018-03-03 12:13:19', 0),
(95, 601, '1520079220_EA101B.jpg', '2018-03-03 20:13:40', '2018-03-03 12:13:40', 0),
(96, 603, '1520079245_EA102B.jpg', '2018-03-03 20:14:05', '2018-03-03 12:14:05', 0),
(97, 605, '1520079272_EA103B.jpg', '2018-03-03 20:14:32', '2018-03-03 12:14:32', 0),
(98, 607, '1520079316_EA104GR.jpg', '2018-03-03 20:15:16', '2018-03-03 12:15:16', 0),
(99, 609, '1520079345_EA105B.jpg', '2018-03-03 20:15:45', '2018-03-03 12:15:45', 0),
(100, 610, '1520079367_EA105GR.jpg', '2018-03-03 20:16:07', '2018-03-03 12:16:07', 0),
(101, 612, '1520079399_EA106B.jpg', '2018-03-03 20:16:39', '2018-03-03 12:16:39', 0),
(102, 490, '1520079462_S280_S281_S282.png', '2018-03-03 20:17:42', '2018-03-03 12:17:42', 0),
(103, 489, '1520079506_S280_S281_S282.png', '2018-03-03 20:18:26', '2018-03-03 12:18:26', 0),
(104, 488, '1520079513_S280_S281_S282.png', '2018-03-03 20:18:33', '2018-03-03 12:18:33', 0),
(105, 491, '1520079541_S301.png', '2018-03-03 20:19:01', '2018-03-03 12:19:01', 0),
(106, 492, '1520079566_S450.png', '2018-03-03 20:19:27', '2018-03-03 12:19:27', 0),
(107, 493, '1520079619_TM418.png', '2018-03-03 20:20:19', '2018-03-03 12:20:19', 0),
(108, 486, '1520079679_RP6403.png', '2018-03-03 20:21:19', '2018-03-03 12:21:19', 0),
(109, 368, '1520079735_V35_PAN.jpg', '2018-03-03 20:22:15', '2018-03-03 12:22:15', 0),
(110, 369, '1520079750_V35_PAN_TECH.jpg', '2018-03-03 20:22:30', '2018-03-03 12:22:30', 0),
(111, 370, '1520079762_V35_PAN_TFL.jpg', '2018-03-03 20:22:42', '2018-03-03 12:22:42', 0),
(112, 311, '1520079879_DLM_36_PAN_SILVER.jpg', '2018-03-03 20:24:39', '2018-03-03 12:24:39', 0),
(113, 317, '1520080011_TRK_OBK_37_PAN_SILVER.jpg', '2018-03-03 20:26:51', '2018-03-03 12:26:51', 0),
(114, 318, '1520080017_TRK_OBK_37_PAN_SILVER.jpg', '2018-03-03 20:26:57', '2018-03-03 12:26:57', 0),
(115, 319, '1520080028_TRK_OBK_37_PAN_SILVER.jpg', '2018-03-03 20:27:08', '2018-03-03 12:27:08', 0),
(116, 322, '1520080042_TRK_OBK_37_PAN_BLACK.jpg', '2018-03-03 20:27:22', '2018-03-03 12:27:22', 0),
(117, 321, '1520080049_TRK_OBK_37_PAN_BLACK.jpg', '2018-03-03 20:27:29', '2018-03-03 12:27:29', 0),
(118, 320, '1520080058_TRK_OBK_37_PAN_BLACK.jpg', '2018-03-03 20:27:38', '2018-03-03 12:27:38', 0),
(119, 324, '1520080174_TRK_OBK_37_PAN_BLACK.jpg', '2018-03-03 20:29:34', '2018-03-03 12:29:34', 0),
(120, 324, '1520080189_TRK_OBK_48_PAN_BLACK.jpg', '2018-03-03 20:29:49', '2018-03-03 12:29:49', 0),
(121, 323, '1520080203_TRK_OBK_48_PAN_SILVER.jpg', '2018-03-03 20:30:03', '2018-03-03 12:30:03', 0),
(122, 323, '1520080203_TRK_OBK_37_PAN_SILVER.jpg', '2018-03-03 20:30:04', '2018-03-03 12:30:04', 0),
(123, 330, '1520080236_TRK_OBK_48_PAN_BLACK.jpg', '2018-03-03 20:30:36', '2018-03-03 12:30:36', 0),
(124, 329, '1520080246_TRK_OBK_48_PAN_BLACK.jpg', '2018-03-03 20:30:46', '2018-03-03 12:30:46', 0),
(125, 328, '1520080256_TRK_OBK_48_PAN_BLACK.jpg', '2018-03-03 20:30:56', '2018-03-03 12:30:56', 0),
(126, 327, '1520080263_TRK_OBK_48_PAN_SILVER.jpg', '2018-03-03 20:31:03', '2018-03-03 12:31:03', 0),
(127, 326, '1520080271_TRK_OBK_48_PAN_SILVER.jpg', '2018-03-03 20:31:12', '2018-03-03 12:31:12', 0),
(128, 325, '1520080278_TRK_OBK_48_PAN_SILVER.jpg', '2018-03-03 20:31:18', '2018-03-03 12:31:18', 0),
(129, 227, '1520080381_S310.png', '2018-03-03 20:33:01', '2018-03-03 12:33:01', 0),
(130, 229, '1520080408_S321.jpg', '2018-03-03 20:33:28', '2018-03-03 12:33:28', 0),
(131, 236, '1520080446_S900A.jpg', '2018-03-03 20:34:06', '2018-03-03 12:34:06', 0),
(132, 237, '1520080532_S901A_04.jpg', '2018-03-03 20:35:32', '2018-03-03 12:35:32', 0),
(133, 238, '1520080556_S920L.jpg', '2018-03-03 20:35:56', '2018-03-03 12:35:56', 0),
(134, 239, '1520080576_S920M.jpg', '2018-03-03 20:36:16', '2018-03-03 12:36:16', 0),
(135, 245, '1520080627_S952B.png', '2018-03-03 20:37:07', '2018-03-03 12:37:07', 0),
(136, 247, '1520080650_S953B.png', '2018-03-03 20:37:30', '2018-03-03 12:37:30', 0),
(137, 248, '1520080809_S954B.png', '2018-03-03 20:40:09', '2018-03-03 12:40:09', 0),
(138, 250, '1520080836_S955B.png', '2018-03-03 20:40:36', '2018-03-03 12:40:36', 0),
(139, 251, '1520080860_S956B.png', '2018-03-03 20:41:00', '2018-03-03 12:41:00', 0),
(140, 252, '1520080930_S957B.png', '2018-03-03 20:42:10', '2018-03-03 12:42:10', 0),
(141, 211, '1520080997_T460B.jpg', '2018-03-03 20:43:17', '2018-03-03 12:43:17', 0),
(142, 212, '1520081026_T4KIT.jpg', '2018-03-03 20:43:46', '2018-03-03 12:43:46', 0),
(143, 169, '1520081080_T445.jpg', '2018-03-03 20:44:40', '2018-03-03 12:44:40', 0),
(144, 114, '1520081110_RM01.jpg', '2018-03-03 20:45:10', '2018-03-03 12:45:10', 0),
(145, 117, '1520081135_S210.png', '2018-03-03 20:45:35', '2018-03-03 12:45:35', 0),
(146, 119, '1520081155_S220.png', '2018-03-03 20:45:55', '2018-03-03 12:45:55', 0),
(147, 120, '1520081197_S221.png', '2018-03-03 20:46:37', '2018-03-03 12:46:37', 0),
(148, 121, '1520081225_S350.png', '2018-03-03 20:47:05', '2018-03-03 12:47:05', 0),
(149, 122, '1520081249_S351.png', '2018-03-03 20:47:29', '2018-03-03 12:47:29', 0),
(150, 125, '1520081272_S650.png', '2018-03-03 20:47:52', '2018-03-03 12:47:52', 0),
(151, 126, '1520081294_TC400.png', '2018-03-03 20:48:14', '2018-03-03 12:48:14', 0),
(152, 93, '1520081329_TB53.jpg', '2018-03-03 20:48:49', '2018-03-03 12:48:49', 0),
(153, 76, '1520081368_STF500S.jpg', '2018-03-03 20:49:28', '2018-03-03 12:49:28', 0),
(154, 78, '1520081401_T10N.png', '2018-03-03 20:50:01', '2018-03-03 12:50:01', 0),
(155, 81, '1520081433_TAN01.png', '2018-03-03 20:50:33', '2018-03-03 12:50:33', 0),
(156, 56, '1520081501_E162.jpg', '2018-03-03 20:51:41', '2018-03-03 12:51:41', 0),
(157, 4, '1520081530_S300.png', '2018-03-03 20:52:10', '2018-03-03 12:52:10', 0),
(158, 1, '1520081610_VESTO1_1.png', '2018-03-03 20:53:30', '2018-03-03 12:53:30', 0),
(159, 1, '1520081610_VEST02.jpg', '2018-03-03 20:53:30', '2018-03-03 12:53:30', 0),
(160, 2, '1520081645_VESTO1_1.png', '2018-03-03 20:54:05', '2018-03-03 12:54:05', 0),
(161, 2, '1520081645_VEST02.jpg', '2018-03-03 20:54:05', '2018-03-03 12:54:05', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mah_interest`
--

CREATE TABLE `mah_interest` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ctl` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `mah_interest`
--

INSERT INTO `mah_interest` (`id`, `user_id`, `product_id`, `created`, `modified`, `ctl`) VALUES
(1, 2, 8, '2018-03-04 21:40:36', '2018-03-04 13:40:36', 0),
(2, 2, 3, '2018-03-04 21:41:18', '2018-03-04 13:41:18', 0),
(3, 2, 169, '2018-03-04 23:06:21', '2018-03-04 15:06:21', 0),
(4, 3, 212, '2018-03-06 22:25:46', '2018-03-06 14:25:46', 0),
(5, 3, 126, '2018-03-06 22:25:50', '2018-03-06 14:25:50', 0),
(6, 2, 717, '2018-03-08 12:54:02', '2018-03-08 04:54:02', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mah_invoice`
--

CREATE TABLE `mah_invoice` (
  `id` int(11) NOT NULL,
  `code` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `subtotal` int(11) NOT NULL DEFAULT '0',
  `tax` int(11) NOT NULL DEFAULT '0',
  `amount` int(11) NOT NULL DEFAULT '0',
  `contact_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `delivery` datetime DEFAULT NULL,
  `payment` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'o',
  `action` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'p',
  `created` datetime DEFAULT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ctl` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `mah_invoice`
--

INSERT INTO `mah_invoice` (`id`, `code`, `user_id`, `subtotal`, `tax`, `amount`, `contact_name`, `contact_email`, `description`, `delivery`, `payment`, `status`, `action`, `created`, `modified`, `ctl`) VALUES
(1, '5a9e16baa0e46', 5, 453, 32, 485, 'master123', 'master123@gmail.com', 'master 123', NULL, NULL, 'o', 'p', '2018-03-06 12:19:06', '2018-03-06 04:19:06', 0),
(2, '5a9e77145a9c8', 5, 344, 24, 368, 'master123', 'master123@gmail.com', 'tester', NULL, NULL, 'o', 'p', '2018-03-06 19:10:12', '2018-03-06 11:10:12', 0),
(3, '5a9e830219032', 3, 2902, 203, 3105, 'master test', 'Master@gmail.com', 'tested i\'m here', NULL, NULL, 'o', 'p', '2018-03-06 20:01:06', '2018-03-06 12:01:06', 0),
(4, '5a9ea547ceb81', 3, 1180, 83, 1263, 'master test', 'Master@gmail.com', 'tester i\'m here', '2018-03-06 09:32:27', 'Credit card', 'i', 'r', '2018-03-06 22:27:19', '2018-03-07 15:54:42', 0),
(5, '5aa0b0125011a', 6, 386, 27, 413, 'Andy Ng', 'andy@adspress.com.sg', '', '2018-03-09 01:30:48', 'Cash on delivery', 'i', 'p', '2018-03-08 11:37:54', '2018-03-08 03:39:31', 0),
(6, '5aa0b755200c2', 7, 406, 28, 434, 'benmaster', 'master@gmail.com', '', NULL, NULL, 'o', 'p', '2018-03-08 12:08:53', '2018-03-08 04:08:53', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mah_menu`
--

CREATE TABLE `mah_menu` (
  `id` int(10) NOT NULL,
  `menu` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `controller` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `action` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon_ctl` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `sorted` tinyint(4) UNSIGNED NOT NULL DEFAULT '0',
  `parents` tinyint(4) UNSIGNED NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ctl` tinyint(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `mah_menu`
--

INSERT INTO `mah_menu` (`id`, `menu`, `controller`, `action`, `icon`, `icon_ctl`, `sorted`, `parents`, `type`, `created`, `modified`, `ctl`) VALUES
(1, 'Dashboard', '', '', ' fa fa-tachometer', 0, 1, 0, 0, '2016-08-15 12:00:00', '2017-12-12 02:40:50', 0),
(2, 'System', '', '', 'fa fa-desktop', 0, 10, 0, 0, '2016-08-15 12:00:00', '2017-12-12 02:40:50', 0),
(3, 'Meta', 'meta', '', 'fa fa-file-code-o', 0, 1, 2, 0, '2016-08-15 12:00:00', '2017-08-07 11:15:53', 0),
(4, 'Logs', '', '', 'fa fa-calendar-o', 0, 6, 2, 0, '2016-08-15 12:00:00', '2017-08-14 16:31:46', 0),
(30, 'Invoice List', '	\r\ninvoiceList', NULL, 'fa fa-list-ul', 0, 3, 18, 0, '2018-03-07 20:56:08', '2018-03-07 15:39:33', 0),
(6, 'Menu', 'menu', '', 'fa fa-bars', 0, 3, 2, 0, '2016-08-15 12:00:00', '2017-08-03 14:56:30', 0),
(7, 'Transactions', 'logs', '', 'fa fa-history', 0, 1, 4, 0, '2016-08-15 12:00:00', '2017-08-07 14:20:39', 0),
(8, 'Selected records', 'select', '', 'fa fa-database ', 0, 2, 4, 0, '2016-08-15 12:00:00', '2017-08-07 14:21:15', 0),
(9, 'Added records', 'add', '', 'fa fa-calendar-plus-o', 0, 3, 4, 0, '2016-08-15 12:00:00', '2017-08-07 14:21:15', 0),
(10, 'Updated records', 'update', '', 'fa fa-gavel', 0, 4, 4, 0, '2016-08-15 12:00:00', '2017-08-07 14:20:39', 0),
(11, 'Deleted records', 'delete', '', 'fa fa-trash', 0, 5, 4, 0, '2016-08-15 12:00:00', '2017-08-07 14:20:51', 0),
(12, 'Acc module', '', '', 'fa fa-address-book-o ', 0, 4, 0, 0, '2017-08-07 09:10:23', '2017-12-12 02:40:50', 0),
(13, 'Role', 'role', '', 'fa fa-address-card-o ', 0, 1, 12, 0, '2017-08-07 09:23:26', '2017-08-14 16:30:10', 2),
(14, 'Customer', 'user', '', ' fa fa-user', 0, 2, 12, 0, '2017-08-07 09:56:52', '2017-11-29 04:24:36', 0),
(15, 'Manager', 'manager', '', ' fa fa-user-secret', 0, 3, 12, 0, '2017-08-09 09:43:29', '2017-08-14 13:03:06', 0),
(16, 'Image', 'image', '', 'fa fa-bars', 0, 4, 2, 0, '2016-08-15 12:00:00', '2017-08-03 14:56:30', 0),
(17, 'Info', 'infor', '', 'fa fa-cogs', 0, 5, 2, 0, '2017-08-09 09:43:29', '2017-08-14 13:03:06', 0),
(18, 'Frontend', '', '', ' fa fa-globe', 0, 2, 0, 0, '2017-12-04 10:33:28', '2017-12-12 02:40:50', 0),
(19, 'Head Menu', 'headMenu', '', ' fa fa-sitemap', 0, 1, 18, 0, '2017-12-04 10:42:09', '2017-12-04 05:24:59', 0),
(20, 'Home', 'brandChange', '', 'fa fa-home', 0, 1, 0, 1, '2017-12-04 10:58:43', '2018-02-06 04:01:07', 0),
(21, 'Sale', 'sale', '', 'fa fa-bookmark', 0, 2, 0, 1, '2017-12-04 11:02:22', '2018-01-26 16:42:32', 2),
(22, 'About', 'about', '', ' fa fa-amazon', 0, 3, 0, 1, '2017-12-04 11:05:19', '2017-12-04 03:54:52', 0),
(23, 'Product', '', '', ' fa fa-cubes', 0, 3, 0, 0, '2017-12-04 13:21:44', '2017-12-12 02:40:50', 0),
(24, 'Brand', 'brand', '', ' fa fa-registered', 0, 1, 23, 0, '2017-12-04 13:24:33', '2017-12-04 05:24:53', 0),
(25, 'Category', 'category', '', ' fa fa-sitemap', 0, 2, 23, 0, '2017-12-04 18:15:10', '2017-12-04 10:16:56', 0),
(26, 'Type', 'type', '', ' fa fa-cube', 0, 3, 23, 0, '2017-12-04 18:16:40', '2017-12-04 10:25:39', 0),
(27, 'Product list', 'product', '', ' fa fa-cubes', 0, 4, 23, 0, '2017-12-05 17:16:12', '2017-12-05 09:36:53', 0),
(29, 'Order list', 'orderList', NULL, 'fa fa-list-ul', 0, 2, 18, 0, '2018-03-07 20:56:08', '2018-03-07 15:39:33', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mah_note`
--

CREATE TABLE `mah_note` (
  `id` bigint(20) NOT NULL,
  `user_id` tinyint(4) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `created` datetime DEFAULT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ctl` tinyint(1) NOT NULL DEFAULT '0' COMMENT '//2-deleted //1-locked'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `mah_note`
--

INSERT INTO `mah_note` (`id`, `user_id`, `type`, `notes`, `created`, `modified`, `ctl`) VALUES
(1, 2, 1, '\"It looks like he wanted our help and there is an opening here.\"', '2017-10-12 17:23:33', '2017-10-12 01:28:56', 0),
(2, 2, 1, 'There should be a meeting scheduled soon.', '2017-10-12 17:25:33', '2017-10-12 01:25:33', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mah_note_type`
--

CREATE TABLE `mah_note_type` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ctl` tinyint(1) NOT NULL DEFAULT '0' COMMENT '//2-deleted //1-locked'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `mah_note_type`
--

INSERT INTO `mah_note_type` (`id`, `name`, `created`, `modified`, `ctl`) VALUES
(1, 'Note', '2017-10-12 17:23:33', '2017-10-12 01:26:48', 0),
(2, 'Event', '2017-10-12 17:23:33', '2017-10-12 01:26:54', 0),
(3, 'Social activity', '2017-10-12 17:23:33', '2017-10-12 01:27:28', 0),
(4, 'System alerts', '2017-10-12 17:23:33', '2017-10-12 01:27:57', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mah_product`
--

CREATE TABLE `mah_product` (
  `id` bigint(20) NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `desc` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` decimal(11,2) NOT NULL DEFAULT '8.00',
  `interested` int(11) NOT NULL DEFAULT '0',
  `brand` int(11) DEFAULT NULL,
  `cate` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `status` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'a',
  `created` datetime DEFAULT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ctl` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `mah_product`
--

INSERT INTO `mah_product` (`id`, `name`, `desc`, `image`, `price`, `interested`, `brand`, `cate`, `type`, `status`, `created`, `modified`, `ctl`) VALUES
(1, 'CSV01/2XL-3XL', 'CFT SAFETY VEST 1 SIZE 2XL-3XL', '1520081610_VEST02.jpg', '50.00', 0, 10, 1, 1, 'a', '2018-03-03 18:03:00', '2018-03-03 12:53:42', 0),
(2, 'CSV01/L-XL', 'CFT SAFETY VEST 01 SIZE L-XL', '1520081645_VEST02.jpg', '50.00', 0, 10, 1, 1, 'a', '2018-03-03 18:03:00', '2018-03-03 12:54:10', 0),
(3, 'HU01', 'UNDER HELMET', NULL, '9.00', 1, 10, 1, 2, 'o', '2018-03-03 18:03:00', '2018-03-04 13:41:18', 0),
(4, 'S300', 'SAFETY VEST AND WARNING', '1520081530_S300.png', '20.00', 0, 10, 1, 1, 'a', '2018-03-03 18:03:00', '2018-03-03 12:52:19', 0),
(5, 'M3', 'MONORACK3 TOPPLATE KIT', NULL, '66.00', 0, 10, 2, 3, 'o', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(6, 'M35', 'MONORACK4 TOPPLATE KIT', NULL, '82.00', 0, 10, 2, 3, 'a', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(7, 'M3P', 'BASEPLATE M3P GIVI', NULL, '54.00', 0, 10, 2, 4, 'a', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(8, 'M5', 'PLATE FOR FZ MONORACKS', NULL, '56.00', 1, 10, 2, 4, 'o', '2018-03-03 18:03:00', '2018-03-04 13:40:36', 0),
(9, 'M5M', 'PLATE FOR  FZ MONORACKS', NULL, '56.00', 0, 10, 2, 5, 'o', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(10, 'M6M', 'PLATE FOR MONOLOCK FZ MONRACK', NULL, '56.00', 0, 10, 2, 5, 'a', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(11, 'M7', 'PLATE FOR FZ MONORACKS', NULL, '58.00', 0, 10, 2, 4, 'o', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(12, 'M8A', 'ALU PLATE FZ MONOKEY SLVR', NULL, '147.00', 0, 10, 2, 4, 'a', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(13, 'M8B', 'ALU PLATE FZ MONOKEY', NULL, '154.00', 0, 10, 2, 4, 'a', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(14, 'MM', 'MONORACK  M TOPPLATE KIT', NULL, '67.00', 0, 10, 2, 5, 'o', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(15, 'BE43N', 'BACKREST E43N', NULL, '50.00', 0, 10, 3, 6, 'a', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(16, 'E101', 'STOP  LIGHT/CONTACTS FLOW E350', NULL, '48.00', 0, 10, 3, 7, 'o', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(17, 'E102', 'SPECIFIC BACKREST FOR E260', NULL, '42.00', 0, 10, 3, 8, 'o', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(18, 'E103', 'SPECIFIC BACKREST FOR E350', NULL, '42.00', 0, 10, 3, 8, 'a', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(19, 'E104', 'STOP LIGHT/CONTACTS TOUR E30', NULL, '43.00', 0, 10, 3, 7, 'a', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(20, 'E105S', 'STOP LIGHT FOR TOPCASE V46', NULL, '60.00', 0, 10, 3, 7, 'o', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(21, 'E106', 'INNER LIGHT FOR TOPCASE V46', NULL, '31.00', 0, 10, 3, 7, 'o', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(22, 'E107', 'METAL RACK FOR TOPCASE V46', NULL, '76.00', 0, 10, 3, 9, 'o', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(23, 'E108', 'STOP LIGHT FOR TOPCASE E370', NULL, '48.00', 0, 10, 3, 7, 'a', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(24, 'E109', 'SPECIFIC BACKREST FOR E370', NULL, '41.00', 0, 10, 3, 8, 'a', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(25, 'E110', 'SPECIFIC BACKREST FOR E470', NULL, '45.00', 0, 10, 3, 8, 'a', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(26, 'E111', 'SPECIFIC BACKREST FOR E55', NULL, '64.00', 0, 10, 3, 8, 'a', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(27, 'E112', 'STOP LIGHT FOR TOPCASE E55', NULL, '71.00', 0, 10, 3, 7, 'a', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(28, 'E113S', 'SPECIFIC REMOTE CONTROL X E55', NULL, '119.00', 0, 10, 3, 10, 'o', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(29, 'E118', 'BACKREST TRK33N AND TRK46N', NULL, '47.00', 0, 10, 3, 8, 'a', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(30, 'E120', 'METAL RACK FOR TOPCASE TRK33N', NULL, '89.00', 0, 10, 3, 9, 'a', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(31, 'E120B', 'METAL RACK FOR TOPCASE TRK33N', NULL, '77.00', 0, 10, 3, 9, 'o', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(32, 'E126', 'STOP LIGHT FOR TOPCASE B47', NULL, '91.00', 0, 10, 3, 7, 'a', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(33, 'E129', 'REMOTE CONTROL SYSTEM B33', NULL, '117.00', 0, 10, 3, 10, 'o', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(34, 'E130', 'SPECIFIC BACKREST FOR B33', NULL, '34.00', 0, 10, 3, 8, 'a', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(35, 'E131', 'SPEC.BACKREST FOR B47/TECH', NULL, '39.00', 0, 10, 3, 8, 'a', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(36, 'E131S', 'SPEC.BACKREST X B47-B37/TECH', NULL, '50.00', 0, 10, 3, 8, 'a', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(37, 'E132', 'REMOTE CONTROL SYSTEM B47', NULL, '120.00', 0, 10, 3, 10, 'a', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(38, 'E133', 'BACKREST TRK52N TREKKER', NULL, '50.00', 0, 10, 3, 8, 'o', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(39, 'E133S', 'SPEC.BACKREST X TRK52N IN PVC', NULL, '62.00', 0, 10, 3, 8, 'a', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(40, 'E134S', 'SPECIFIC BACKREST X V47/TECH', NULL, '54.00', 0, 10, 3, 8, 'a', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(41, 'E135', 'STOP LIGHT FOR V47/V47TECH', NULL, '62.00', 0, 10, 3, 7, 'o', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(42, 'E142', 'METAL RACK FOR TOPCASE TRK52N', NULL, '90.00', 0, 10, 3, 9, 'o', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(43, 'E142B', 'TOP METAL RACK TRK52', NULL, '92.00', 0, 10, 3, 9, 'a', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(44, 'E143', 'ADDITIONAL CARRY HANDLE OUTBK', NULL, '27.00', 0, 10, 3, 11, 'o', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(45, 'E144', 'BLACK ELASTIC NET FOR OUTBACK', NULL, '19.00', 0, 10, 3, 12, 'a', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(46, 'E145', 'SET OF TWO REFLECTIVE STICKERS', NULL, '21.00', 0, 10, 3, 13, 'a', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(47, 'E146', 'SET OF 3 STICKY RUBBERS OUTBAC', NULL, '13.00', 0, 10, 3, 13, 'a', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(48, 'E147', 'SPECIFIC BACKREST FOR B27', NULL, '39.00', 0, 10, 3, 8, 'o', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(49, 'E148', 'STAINLESS STEEL HOLDER X TAN01', NULL, '129.00', 0, 10, 3, 14, 'a', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(50, 'E149', 'STAINLESS STEEL HOLDER X TAN01', NULL, '124.00', 0, 10, 3, 15, 'a', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(51, 'E157', 'SPECIFIC BACKREST FOR OBK42A/B', NULL, '73.00', 0, 10, 3, 8, 'o', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(52, 'E158', 'SPECIFIC BACKREST FOR OBK58A/B', NULL, '89.00', 0, 10, 3, 8, 'a', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(53, 'E159', 'METAL RACK FOR TOPCASE V47', NULL, '97.00', 0, 10, 3, 9, 'o', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(54, 'E160', 'STOP LIGHT TOPCASE V56', NULL, '80.00', 0, 10, 3, 7, 'a', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(55, 'E161', 'BLACK INTERNAL NET OBK58', NULL, '19.00', 0, 10, 3, 12, 'o', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(56, 'E162', 'STAINLESS STEEL FLASK HOLDER', '1520081501_E162.jpg', '81.00', 0, 10, 3, 14, 'a', '2018-03-03 18:03:00', '2018-03-03 12:51:45', 0),
(57, 'E164', 'BACKREST FOR DOLOMITI 30-46', NULL, '76.00', 0, 10, 3, 8, 'a', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(58, 'E75', 'SPECIFIC BACKREST FOR E42', NULL, '45.00', 0, 10, 3, 8, 'o', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(59, 'E78', 'SPECIFIC BACKREST FOR E33', NULL, '42.00', 0, 10, 3, 8, 'o', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(60, 'E78-W', 'BACKREST FOR E33N', NULL, '42.00', 0, 10, 3, 8, 'a', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(61, 'E79', 'SPECIFIC BACKREST FOR E460', NULL, '43.00', 0, 10, 3, 8, 'o', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(62, 'E81', 'METAL RACK FOR TOPCASE E460', NULL, '78.00', 0, 10, 3, 9, 'o', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(63, 'E811', 'SPECIFIC BACKREST FOR E340', NULL, '35.00', 0, 10, 3, 8, 'o', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(64, 'E83', 'SPECIFIC BACKREST FOR E50', NULL, '55.00', 0, 10, 3, 8, 'o', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(65, 'E84', 'SPECIFIC BACKREST FOR E35/E450', NULL, '43.00', 0, 10, 3, 8, 'a', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(66, 'E88M', 'BACKREST FOR E230', NULL, '25.00', 0, 10, 3, 8, 'a', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(67, 'E92', 'STOP LIGHT FOR TOPCASE E460', NULL, '57.00', 0, 10, 3, 7, 'o', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(68, 'E93', 'STOP LIGHT FOR TOPCASE E33', NULL, '44.00', 0, 10, 3, 7, 'o', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(69, 'E94', 'STOP LIGHT FOR TOPCASE E470', NULL, '59.00', 0, 10, 3, 7, 'o', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(70, 'E95S', 'SPECIFIC BACKREST FOR E52/V46', NULL, '62.00', 0, 10, 3, 8, 'o', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(71, 'E96', 'METAL RACK FOR TCASE E52/E55', NULL, '76.00', 0, 10, 3, 9, 'a', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(72, 'E96B', 'SPEC RACK TOPCASE E52', NULL, '92.00', 0, 10, 3, 9, 'a', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(73, 'E96G', 'METAL RACK FOR TCASE E52/E55', NULL, '76.00', 0, 10, 3, 9, 'o', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(74, 'E97', 'STOP LIGHT FOR TOPCASE E52', NULL, '74.00', 0, 10, 3, 7, 'o', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(75, 'E99', 'STOP LIGHT FOR TOPCASE E260', NULL, '49.00', 0, 10, 3, 7, 'o', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(76, 'STF500S', 'THERMO FLASK STAINLESS STEEL', '1520081368_STF500S.jpg', '26.00', 0, 10, 3, 16, 'a', '2018-03-03 18:03:00', '2018-03-03 12:49:32', 0),
(77, 'T10', 'KIT 12 PCS. BLACK ELASTIC NET', NULL, '136.00', 0, 10, 3, 12, 'o', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(78, 'T10N', 'BLACK ELASTIC NET', '1520081401_T10N.png', '12.00', 0, 10, 3, 12, 'a', '2018-03-03 18:03:00', '2018-03-03 12:50:07', 0),
(79, 'T471', 'BAG T471 INNERBAG', NULL, '26.00', 0, 10, 3, 17, 'a', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(80, 'T508', 'INNER BAG FOR CAMERAS', NULL, '59.00', 0, 10, 3, 17, 'a', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(81, 'TAN01', 'PLASTIC TANK - CAPACITY 2,5 LT', '1520081433_TAN01.png', '21.00', 0, 10, 3, 16, 'a', '2018-03-03 18:03:00', '2018-03-03 12:50:37', 0),
(82, 'TB19', 'BACKREST HONDA 600 SIL.WING', NULL, '94.00', 0, 10, 3, 18, 'a', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(83, 'TB2013', 'BACKREST YAM.T-MAX 530\'12', NULL, '89.00', 0, 10, 3, 18, 'o', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(84, 'TB21', 'BACKREST HONDA SH125-150\'03', NULL, '83.00', 0, 10, 3, 18, 'o', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(85, 'TB2111', 'BACKREST YAM.T-MAX 400\'13', NULL, '128.00', 0, 10, 3, 18, 'o', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(86, 'TB2120', 'BACKREST YAM.TRICITY 125 2014', NULL, '116.00', 0, 10, 3, 18, 'o', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(87, 'TB3106', 'BACKREST S.BURGMAN 125-200', NULL, '75.00', 0, 10, 3, 18, 'a', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(88, 'TB4111', 'BACKREST KAWASAKI J300\'14', NULL, '146.00', 0, 10, 3, 18, 'o', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(89, 'TB45', 'BACKREST YAMAHA T-MAX500', NULL, '92.00', 0, 10, 3, 18, 'o', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(90, 'TB47', 'BACKREST MAJESTY 400\'04', NULL, '62.00', 0, 10, 3, 18, 'o', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(91, 'TB49', 'BACKREST YAM.X-MAX 125-250\'05', NULL, '93.00', 0, 10, 3, 18, 'o', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(92, 'TB51', 'BACKREST YAM.T-MAX 500\'01..07', NULL, '92.00', 0, 10, 3, 18, 'o', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(93, 'TB531', 'BACKREST SUZ.BURGMAN 400 K7', '1520081329_TB53.jpg', '61.00', 0, 10, 3, 18, 'o', '2018-03-03 18:03:00', '2018-03-03 12:48:57', 0),
(94, 'TB55', 'BACK REST YAMAHA X-MAX 125-250', NULL, '107.00', 0, 10, 3, 18, 'o', '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(95, 'TB5600', 'BACKREST PIAGGIO MP3 YOURBAN', NULL, '94.00', 0, 10, 3, 18, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(96, 'TB6103', 'BACKREST K.K-XCT 125I-300I \'13', NULL, '79.00', 0, 10, 3, 18, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(97, 'TB6104', 'BACKREST K.XCITING 400I (2013)', NULL, '87.00', 0, 10, 3, 18, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(98, 'TB711', 'BACKREST GILERA GP 800\'08', NULL, '164.00', 0, 10, 3, 18, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(99, 'TB80', 'BACKREST KIMCO XCITING 250-500', NULL, '77.00', 0, 10, 3, 18, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(100, 'TB82', 'BACKREST KIMCO DOWNTOWN 125', NULL, '76.00', 0, 10, 3, 18, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(101, 'TS806', 'BACKREST+CARRIER H.SHADOW', NULL, '354.00', 0, 10, 3, 19, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(102, 'TS807', 'BACKREST+CARRIER H.SHADOW', NULL, '362.00', 0, 10, 3, 19, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(103, 'TS808', 'BACKREST+CARRIER H.VT750S \'10', NULL, '505.00', 0, 10, 3, 19, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(104, 'TS825', 'BACKREST+CARRIER YAMAHA', NULL, '388.00', 0, 10, 3, 19, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(105, 'TS835', 'BACKREST+CARRIER KAWASAKI', NULL, '262.00', 0, 10, 3, 19, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(106, 'TS836', 'BACKREST+CARRIER KAWASAKI', NULL, '364.00', 0, 10, 3, 19, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(107, 'IN1121KIT', 'KIT TO RELOCATE INDICATORS', NULL, '28.00', 0, 10, 4, 3, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(108, 'IN2132KIT', 'RELOCATE KIT  INDICATORTST2132', NULL, '68.00', 0, 10, 4, 3, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(109, 'LS1146', 'SPEC NC750 FIT KIT S310/S320', NULL, '46.00', 0, 10, 4, 3, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(110, 'N140', 'WINGRACK 2 CHAS INDIC. 3PANN', NULL, '256.00', 0, 10, 4, 20, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(111, 'N141', 'WINGRACK2 CHAS W/O INDIC.3PANN', NULL, '189.00', 0, 10, 4, 20, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(112, 'N150', 'WINGR.2 2SIDEFRAMES 2BAGS IND.', NULL, '174.00', 0, 10, 4, 20, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(113, 'N151', 'WINGR.2 2SIDEFR.2BAGS W/0 IND.', NULL, '111.00', 0, 10, 4, 20, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(114, 'RM01', 'UNIVERSAL REAR MUDFLAP', '1520081110_RM01.jpg', '117.00', 0, 10, 5, 3, 'a', '2018-03-03 18:03:01', '2018-03-03 12:45:16', 0),
(115, 'S201L', 'WATERPROOF BIKE COVER', NULL, '59.00', 0, 10, 5, 16, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(116, 'S201XL', 'WATERPROOF BIKE COVER', NULL, '59.00', 0, 10, 5, 16, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(117, 'S210', 'WATER PROOF BIKE COVER', '1520081135_S210.png', '24.00', 0, 10, 5, 16, 'a', '2018-03-03 18:03:01', '2018-03-03 12:45:40', 0),
(118, 'S215', 'CHAIN COVER', NULL, '6.00', 0, 10, 5, 16, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(119, 'S220', 'RETRACTABLE CABLE LOCK', '1520081155_S220.png', '24.00', 0, 10, 5, 16, 'a', '2018-03-03 18:03:01', '2018-03-03 12:46:03', 0),
(120, 'S221', 'CABLE LOCK FOR SOFT LUGGAGES', '1520081197_S221.png', '13.00', 0, 10, 5, 16, 'o', '2018-03-03 18:03:01', '2018-03-03 12:46:41', 0),
(121, 'S350', 'SET LOADING STRAPS CM 170X25', '1520081225_S350.png', '17.00', 0, 10, 5, 1, 'o', '2018-03-03 18:03:01', '2018-03-03 12:47:08', 0),
(122, 'S351', 'SET LOADING STRAPS CM 100X20', '1520081249_S351.png', '14.00', 0, 10, 5, 1, 'o', '2018-03-03 18:03:01', '2018-03-03 12:47:33', 0),
(123, 'S601', 'UNIV.KIT HOLDER FOR DEVICES', NULL, '42.00', 0, 10, 5, 16, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(124, 'S602', 'MOTORWAY DEVICES HOLDER', NULL, '30.00', 0, 10, 5, 16, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(125, 'S650', 'CHILD\'S CHAIR', '1520081272_S650.png', '304.00', 0, 10, 5, 16, 'o', '2018-03-03 18:03:01', '2018-03-03 12:47:56', 0),
(126, 'TC400', 'NECK PROTECTOR', '1520081294_TC400.png', '12.00', 1, 10, 5, 16, 'o', '2018-03-03 18:03:01', '2018-03-06 14:25:50', 0),
(127, 'TN1110', 'ENGINE GUARD H.CROSSTOURER', NULL, '269.00', 0, 10, 6, 21, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(128, 'TN1110OX', 'ENGINE GUARD H.CROSSTOURER1200', NULL, '549.00', 0, 10, 6, 21, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(129, 'TN1111', 'ENGINE GUARD H.NC700X \'12-\'13', NULL, '256.00', 0, 10, 6, 21, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(130, 'TN1121', 'ENGINE GUARD H.CB500X (2013)', NULL, '226.00', 0, 10, 6, 21, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(131, 'TN1139', 'ENGINE GUARD CROSSRUNNER \'15', NULL, '270.00', 0, 10, 6, 21, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(132, 'TN1142', 'ENGINE GUARD HONDA CB125F 15', NULL, '134.00', 0, 10, 6, 21, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(133, 'TN1144', 'ENGINE GUARD AFRICA TWIN 2016', NULL, '227.00', 0, 10, 6, 21, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(134, 'TN1144OX', 'ENGINE GUARD AT 2016 CHROME', NULL, '425.00', 0, 10, 6, 21, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(135, 'TN1151', 'ENGINE GUARD DCT AFRICA TWIN', NULL, '235.00', 0, 10, 6, 21, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(136, 'TN1156', 'ENGINE GUARD DCT X ADV', NULL, '229.00', 0, 10, 6, 21, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(137, 'TN2105', 'ENGINE GUARD YAM.XT660Z\'08-\'13', NULL, '294.00', 0, 10, 6, 21, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(138, 'TN2109OX', 'ENGINE GUARD YAMAHA FJR300\'13', NULL, '424.00', 0, 10, 6, 21, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(139, 'TN2122', 'ENGINE GUARD MT-09 TRACER', NULL, '209.00', 0, 10, 6, 21, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(140, 'TN2128', 'TUBULAR HOLDER  XSR900', NULL, '192.00', 0, 10, 6, 21, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(141, 'TN2132', 'ENGINE GUARD MT-09 \'17', NULL, '203.00', 0, 10, 6, 21, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(142, 'TN225', 'ENGINE GUARD TRIUMPH TIGER', NULL, '184.00', 0, 10, 6, 21, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(143, 'TN226', 'ENGINE GUARD TRIUMPH STREET', NULL, '265.00', 0, 10, 6, 21, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(144, 'TN3101', 'ENGINE GUARD SUZ.DL650 V-STROM', NULL, '224.00', 0, 10, 6, 21, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(145, 'TN3102', 'ENGINE GUARD SUZ.GSF 650', NULL, '215.00', 0, 10, 6, 21, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(146, 'TN3105', 'ENGINE GUARD SUZ.DL1000', NULL, '337.00', 0, 10, 6, 21, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(147, 'TN347', 'ENGINE GUARD YAM.TDM 900\'02', NULL, '192.00', 0, 10, 6, 21, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(148, 'TN352', 'ENGINE GUARD YAM. FZ8 FAZER', NULL, '235.00', 0, 10, 6, 21, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(149, 'TN355', 'ENGINE GUARD YAM XT1200Z 2010', NULL, '376.00', 0, 10, 6, 21, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(150, 'TN356', 'ENGINE GUARD YAM. MT-03\'06', NULL, '167.00', 0, 10, 6, 21, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(151, 'TN358', 'ENGINE GUARD YAM.FZ6-FAZER S2', NULL, '193.00', 0, 10, 6, 21, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(152, 'TN359', 'ENGINE GUARD Y.XT660X/R\'07-08', NULL, '132.00', 0, 10, 6, 21, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(153, 'TN362', 'ENGINE GUARD H.AFRICA TWIN 750', NULL, '173.00', 0, 10, 6, 21, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(154, 'TN363', 'ENGINE GUARD HON.TRANSALP 600', NULL, '189.00', 0, 10, 6, 21, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(155, 'TN365', 'ENGINE GUARD H.VARADERO', NULL, '275.00', 0, 10, 6, 21, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(156, 'TN366', 'ENGINE GUARD H.XL650 V\'00...07', NULL, '220.00', 0, 10, 6, 21, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(157, 'TN367', 'ENGINE GUARD H.VARAD. 1000\'03', NULL, '291.00', 0, 10, 6, 21, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(158, 'TN369', 'ENGINE GUARD HONDA CBF', NULL, '161.00', 0, 10, 6, 21, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(159, 'TN392', 'ENGINE GUARD SUZ.GSX750-GSF600', NULL, '118.00', 0, 10, 6, 21, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(160, 'TN394', 'ENGINE GUARD SUZ.GSX 1400\'02', NULL, '248.00', 0, 10, 6, 21, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(161, 'TN4101', 'ENGINE GUARD KAWAS.W800 (2011)', NULL, '187.00', 0, 10, 6, 21, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(162, 'TN4105', 'ENGINE GUARD KAWAS.VERSYS 1000', NULL, '249.00', 0, 10, 6, 21, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(163, 'TN421', 'ENGINE GUARD KAWASAKI KLR', NULL, '268.00', 0, 10, 6, 21, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(164, 'TN422', 'ENGINE GUARD KAWASAKI VERSY', NULL, '256.00', 0, 10, 6, 21, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(165, 'TN451', 'ENGINE GUARD HONDA CB 1300\'04', NULL, '183.00', 0, 10, 6, 21, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(166, 'TN452', 'ENGINE GUARD HONDA CBF 1000\'06', NULL, '171.00', 0, 10, 6, 21, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(167, 'TN453', 'ENGINE GUARD H.HORNET 600\'07', NULL, '208.00', 0, 10, 6, 21, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(168, 'TN454', 'ENGINE GUARD HONDA XL 1000 V', NULL, '302.00', 0, 10, 6, 21, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(169, 'TN455', 'ENGINE GUARD HONDA XL 700 V', '1520081080_T445.jpg', '277.00', 1, 10, 6, 21, 'o', '2018-03-03 18:03:01', '2018-03-04 15:06:21', 0),
(170, 'TN456', 'ENGINE GUARD HONDA CBF 600\'08', NULL, '175.00', 0, 10, 6, 21, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(171, 'TN457', 'ENGINE GUARD HONDA CBF125\'09', NULL, '140.00', 0, 10, 6, 21, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(172, 'TN460', 'ENGINE GUARD HONDA CBF1000', NULL, '211.00', 0, 10, 6, 21, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(173, 'TN5100', 'ENGINE GUARD BMW R1200R 2011', NULL, '355.00', 0, 10, 6, 21, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(174, 'TN5101', 'ENGINE GUARD BMW G650GS 2011', NULL, '184.00', 0, 10, 6, 21, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(175, 'TN5103', 'ENGINE GUARD BMW F800GS 2013', NULL, '346.00', 0, 10, 6, 21, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(176, 'TN5108', 'ENGINE GUARD BMW R1200GS(2013)', NULL, '409.00', 0, 10, 6, 21, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(177, 'TN5108OX', 'ENGINE GUARD BMW R1200GS  \'13', NULL, '549.00', 0, 10, 6, 21, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(178, 'TN5119', 'ENGINE GUARD BMW S1000XR', NULL, '207.00', 0, 10, 6, 21, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(179, 'TN528', 'ENGINE GUARD SUZ.DL 1000\'02V-S', NULL, '202.00', 0, 10, 6, 21, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(180, 'TN532', 'ENGINE GUARD SUZ.DL 650\'04 V-S', NULL, '211.00', 0, 10, 6, 21, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(181, 'TN535', 'ENGINE GUARD SUZUKI GSR 600\'06', NULL, '181.00', 0, 10, 6, 21, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(182, 'TN6401', 'ENGINE GUARD TRIUMPH TIGER 800', NULL, '245.00', 0, 10, 6, 21, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(183, 'TN6401A', 'ENGINE GUARD TR.TIGER 800/XC', NULL, '275.00', 0, 10, 6, 21, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(184, 'TN6403', 'ENGINE GUARD T.TIGER EXPLORER', NULL, '276.00', 0, 10, 6, 21, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(185, 'TN6404', 'ENGINE GUARD TR.TIGER 1050 \'13', NULL, '186.00', 0, 10, 6, 21, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(186, 'TN6409', 'ENGINE GUARD TIGER XC/XR', NULL, '219.00', 0, 10, 6, 21, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(187, 'TN6410', 'ENGINE GUARD BONN T120', NULL, '118.00', 0, 10, 6, 21, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(188, 'TN689', 'ENGINE GUARD BMW R1200GS\'04.7', NULL, '292.00', 0, 10, 6, 21, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(189, 'TN690', 'ENGINE GUARD BMW F650-F800GS', NULL, '229.00', 0, 10, 6, 21, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(190, 'TN691', 'ENGINE GUARD BMW F800R \'09', NULL, '163.00', 0, 10, 6, 21, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(191, 'TN7401', 'ENGINE GUARD D.MULTISTRADA1200', NULL, '242.00', 0, 10, 6, 21, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(192, 'TN7406', 'ENGINE GUARD DUCATI MULTISTR', NULL, '253.00', 0, 10, 6, 21, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(193, 'TN7703', 'ENGINE GUARD KTM 1190 ADVENT.', NULL, '366.00', 0, 10, 6, 21, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(194, 'TN8202', 'ENGINE GUARD V7 III', NULL, '170.00', 0, 10, 6, 21, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(195, 'TNH1144', 'CRASH GUARD AFRICA TWIN 2016', NULL, '282.00', 0, 10, 6, 21, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(196, 'TNH5108', 'ENGINE GUARD BMW R1200GS \'13', NULL, '287.00', 0, 10, 6, 21, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(197, 'TNH5110OX', 'ENGINE GUARD B.F800GS ADV.\'13', NULL, '396.00', 0, 10, 6, 21, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(198, 'TNH5112OX', 'ENGINE GUARD BMW R1200GS \'14', NULL, '430.00', 0, 10, 6, 21, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(199, 'TNH5114', 'ENGINE GUARD B.R1200GS (13-14)', NULL, '287.00', 0, 10, 6, 21, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(200, 'TNH5114OX', 'ENGINE GUARD B.R1200GS(13-14)', NULL, '421.00', 0, 10, 6, 21, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(201, '2110KIT', 'FITTING KIT FOR TE2110', NULL, '44.00', 0, 10, 7, 22, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(202, '2115KIT', 'FITTING KIT TE2115 Y.MT-09\'13', NULL, '45.00', 0, 10, 7, 22, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(203, '2118KIT', 'FITTING KIT TE2118 Y.MT-07\'14', NULL, '63.00', 0, 10, 7, 22, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(204, '267KIT', 'FITTING KIT FOR PLX209', NULL, '127.00', 0, 10, 7, 23, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(205, '3100KIT', 'FITTING KIT TE3100 SUZ.GSR750', NULL, '51.00', 0, 10, 7, 22, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(206, 'PLR5108KIT', 'HEAT GUARD FOR PLR5108', NULL, '29.00', 0, 10, 7, 24, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(207, 'S650KIT', 'FITTING KIT FOR S650', NULL, '43.00', 0, 10, 7, 16, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(208, 'SR3104KIT', 'KIT FOR SR3104/MM ON SUZUKI', NULL, '61.00', 0, 10, 7, 4, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(209, 'T265KIT', 'Specific kit for Kawasaki Z 750', NULL, '52.00', 0, 10, 7, 25, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(210, 'T267KIT', 'FITTING KIT FOR T267', NULL, '45.00', 0, 10, 7, 25, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(211, 'T460B', 'TANK FITTING SYSTEM UNIVERSAL', '1520080997_T460B.jpg', '33.00', 0, 10, 7, 16, 'a', '2018-03-03 18:03:01', '2018-03-03 12:43:21', 0),
(212, 'T4KIT', 'KIT 4 MAGNETS X SOFT BAGS', '1520081026_T4KIT.jpg', '28.00', 1, 10, 7, 16, 'o', '2018-03-03 18:03:01', '2018-03-06 14:25:46', 0),
(213, 'T700KIT', 'FITTING KIT FOR T700', NULL, '41.00', 0, 10, 7, 21, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(214, 'TL1144KIT', 'Specific kit to install the S250', NULL, '79.00', 0, 10, 7, 21, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(215, 'TL1146KIT', 'Specific kit to install the S250', NULL, '109.00', 0, 10, 7, 21, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(216, 'TL1156KIT', 'Specific kit to install the S250', NULL, '83.00', 0, 10, 7, 21, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(217, 'TL2119KIT', 'KIT FOR S250 SUPER TENERY', NULL, '48.00', 0, 10, 7, 21, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(218, 'TL6401KIT', 'KIT FOR S250 TIGER 800', NULL, '82.00', 0, 10, 7, 21, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(219, 'TN367KIT', 'FITTING KIT FOR ENGINE G.TN367', NULL, '6.00', 0, 10, 7, 21, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(220, 'TN6401AKIT', 'FITTING KIT FOR TN6401A', NULL, '29.00', 0, 10, 7, 21, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(221, 'TST1146', 'SPEC ST601 HOLDER NC750X 2016', NULL, '189.00', 0, 10, 7, 26, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(222, 'TST2129', 'SPEC REAR RACK MT10 2016 ST601', NULL, '180.00', 0, 10, 7, 26, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(223, 'TST2132', 'SPEC HOLDER MT-09 2017 ST601', NULL, '183.00', 0, 10, 7, 26, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(224, 'TST6411', 'ST601 HOLDER SPEED TRIPLE', NULL, '196.00', 0, 10, 7, 26, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(225, 'TST7409', 'ST601 HOLDER HYPERMOTARD', NULL, '173.00', 0, 10, 7, 26, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(226, 'TSTS3110', 'Sport-T range sidecase Holder', NULL, '236.00', 0, 10, 7, 26, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(227, 'S310', 'ADDITIONAL HALOGEN HEADLIGHT', '1520080381_S310.png', '224.00', 0, 10, 8, 16, 'a', '2018-03-03 18:03:01', '2018-03-03 12:33:09', 0),
(228, 'S320', 'SET HALOGEN FOG HEADLIGHTS', NULL, '491.00', 0, 10, 8, 16, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(229, 'S321', 'LED PROJECTOR FOG LIGHTS', '1520080408_S321.jpg', '506.00', 0, 10, 8, 16, 'a', '2018-03-03 18:03:01', '2018-03-03 12:33:32', 0),
(230, 'FB1146', 'MUDGUARD UPP BRACKET NC750X\'16', NULL, '55.00', 0, 10, 9, 3, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(231, 'FB2122', '', NULL, '55.00', 0, 10, 9, 3, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(232, 'FB2130', 'FAIRING UPP BRK S902A+GPS MT07', NULL, '46.00', 0, 10, 9, 3, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(233, 'FB4114', 'FAIRING UPP BRK S902A+GPS VERS', NULL, '55.00', 0, 10, 9, 3, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(234, 'FB4120', '', NULL, '55.00', 0, 10, 9, 3, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(235, 'S850', 'BAG/GPS HOLDER/S850', NULL, '54.00', 0, 10, 9, 16, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(236, 'S900A', 'SMART BAR UNIVERSAL', '1520080446_S900A.jpg', '148.00', 0, 10, 9, 16, 'a', '2018-03-03 18:03:01', '2018-03-03 12:34:11', 0),
(237, 'S901A', 'SUPPORT FOR GPS HOLDER', '1520080532_S901A_04.jpg', '138.00', 0, 10, 9, 16, 'a', '2018-03-03 18:03:01', '2018-03-03 12:35:36', 0),
(238, 'S920L', 'Smart Clip', '1520080556_S920L.jpg', '117.00', 0, 10, 9, 16, 'a', '2018-03-03 18:03:01', '2018-03-03 12:36:00', 0),
(239, 'S920M', 'Smart Clip', '1520080576_S920M.jpg', '108.00', 0, 10, 9, 16, 'a', '2018-03-03 18:03:01', '2018-03-03 12:36:26', 0),
(240, 'S950', 'GPS HOLDER-ADJUSTABLE', NULL, '61.00', 0, 10, 9, 16, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(241, 'S951BKITR', 'Replacement fitting system', NULL, '26.00', 0, 10, 9, 3, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(242, 'S951KIT2', 'UNIVERSAL MOUNTING KIT FOR', NULL, '21.00', 0, 10, 9, 3, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(243, 'S951KITR', 'Replacement fitting system', NULL, '14.00', 0, 10, 9, 3, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(244, 'S952', 'ADJUST.SMARTHPONE/GPS HOLDER', NULL, '64.00', 0, 10, 9, 16, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(245, 'S952B', 'ADJUST.SMARTHPONE/GPS HOLDER', '1520080627_S952B.png', '67.00', 0, 10, 9, 16, 'a', '2018-03-03 18:03:01', '2018-03-03 12:37:11', 0),
(246, 'S953', 'SMARTPHONE/NAVIGATOR HOLDER', NULL, '67.00', 0, 10, 9, 16, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(247, 'S953B', 'ADJUST.SMARTHPONE/GPS HOLDER', '1520080650_S953B.png', '67.00', 0, 10, 9, 16, 'o', '2018-03-03 18:03:01', '2018-03-03 12:37:34', 0),
(248, 'S954B', 'ADJUST.SMARTPHONE/GPS HOLDER', '1520080809_S954B.png', '67.00', 0, 10, 9, 16, 'o', '2018-03-03 18:03:01', '2018-03-03 12:40:13', 0),
(249, 'S955', 'SMARTPHONE HOLDER', NULL, '64.00', 0, 10, 9, 16, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(250, 'S955B', 'ADJUST.SMARTPHONE HOLDER', '1520080836_S955B.png', '64.00', 0, 10, 9, 16, 'a', '2018-03-03 18:03:01', '2018-03-03 12:40:41', 0),
(251, 'S956B', 'SMARTPHONE HOLDER IP5/S5', '1520080860_S956B.png', '67.00', 0, 10, 9, 16, 'a', '2018-03-03 18:03:01', '2018-03-03 12:41:08', 0),
(252, 'S957B', 'SMARTP HOLDER IP6 PLUS/NOTE4', '1520080930_S957B.png', '67.00', 0, 10, 9, 16, 'a', '2018-03-03 18:03:01', '2018-03-03 12:42:17', 0),
(253, 'DF5105', 'HANDS DEFLECTORS FOR BMW C600S', NULL, '120.00', 0, 10, 10, 21, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(254, 'DF5106', 'HANDS DEFLECTORS BMW C650GT', NULL, '93.00', 0, 10, 10, 21, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(255, 'H104FSLBK61', 'DEMI JET 10.4F MATT BLACK XL61', NULL, '133.00', 0, 10, 11, 27, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(256, 'H107BN90061', 'DEMI JET 10.7 MATT BLACK XL', NULL, '146.00', 0, 10, 11, 27, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(257, 'H123BG76854', 'JET HELMET 12.3 STRATOS 54/XS MATT TITANIUM', NULL, '197.00', 0, 10, 11, 27, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(258, 'H123FTHTY58', 'Titanium Matt Helmet', NULL, '205.00', 0, 10, 11, 27, 'h', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(259, '', 'Casco jet Oldster 20.7', NULL, '248.00', 0, 10, 11, 27, 'h', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(260, 'H209FGSWH60', 'Fibre Jet', NULL, '253.00', 0, 10, 11, 27, 'h', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(261, 'H303FBKWH61', 'Tweet Casco Jet', NULL, '150.00', 0, 10, 11, 27, 'h', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(262, 'H402FBKDM61', 'FULL FACE HELMET BKDM XL', NULL, '546.00', 0, 10, 11, 28, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(263, 'H405FXCFY56', 'X CARBON GLOSSY NEON YELLOW S', NULL, '830.00', 0, 10, 11, 28, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(264, 'H405FXCFY58', 'X CARBON GLOSSY NEON YELLOW M', NULL, '830.00', 0, 10, 11, 28, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(265, 'H405FXCFY60', 'X CARBON GLOSSY NEON YELLOW L', NULL, '830.00', 0, 10, 11, 28, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(266, 'H405FXCFY61', 'X CARBON GLOSSY NEON YELLOW XL', NULL, '830.00', 0, 10, 11, 28, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(267, 'H405FXCRD56', 'X CARBON GREY MATT RED S', NULL, '830.00', 0, 10, 11, 28, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(268, 'H405FXCRD58', 'X CARBON GREY MATT RED M', NULL, '830.00', 0, 10, 11, 28, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(269, 'H405FXCRD60', 'X CARBON GREY MATT RED L', NULL, '830.00', 0, 10, 11, 28, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(270, 'H405FXCRD61', 'X CARBON GREY MATT RED XL', NULL, '830.00', 0, 10, 11, 28, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(271, 'HC01X', 'HELMET COVER BAG', NULL, '9.00', 0, 10, 11, 16, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(272, 'HX01CN90256', 'POLY CARBONATE FULLFACE HELMET', NULL, '550.00', 0, 10, 11, 28, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(273, 'HX01FN90061', 'INTEGRALE HELMET MATT BLK XL', NULL, '550.00', 0, 10, 11, 28, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(274, 'PLR1110', 'TUB.PANN.HOLDER H.CROSSTOURER', NULL, '340.00', 0, 10, 12, 24, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(275, 'PLR1110CAM', 'TUB.PANN.HOLDER H.CROSSTOURER', NULL, '491.00', 0, 10, 12, 29, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(276, 'PLR1144', 'MONOKEY SIDE RACK AFRICA TWIN', NULL, '327.00', 0, 10, 12, 24, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(277, 'PLR2119', 'TUB.PANN.HOLDER Y. XT1200ZE', NULL, '335.00', 0, 10, 12, 24, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(278, 'PLR2122', 'SPEC.RAPID RELEASE SIDE CASE', NULL, '290.00', 0, 10, 12, 24, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(279, 'PLR3101', 'TUB.PANN.HOLDER SUZUKI DL650', NULL, '297.00', 0, 10, 12, 24, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(280, 'PLR3105', 'TUB.PANN.HOLDER SUZUKI DL1000', NULL, '316.00', 0, 10, 12, 24, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(281, 'PLR367', 'TUB.PANN.HOLDER XT1200Z', NULL, '355.00', 0, 10, 12, 24, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(282, 'PLR4105', 'TUB.PANN.HOLDER KAW VERSYS1000', NULL, '305.00', 0, 10, 12, 24, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(283, 'PLR4113', 'SPEC RAPID RELEASE RACK VERSYS', NULL, '315.00', 0, 10, 12, 24, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(284, 'PLR450', 'TUB.PANN.HOLDER KAW VERSYS 650', NULL, '294.00', 0, 10, 12, 24, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(285, 'PLR5103', 'TUB.PANN.HOLDER BMW F650GS', NULL, '332.00', 0, 10, 12, 24, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(286, 'PLR5108', 'TUB.PANN.HOLDER BMW R1200GS\'13', NULL, '337.00', 0, 10, 12, 24, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(287, 'PLR5109', 'TUB.PANN.HOLDER BMW F800GT \'13', NULL, '302.00', 0, 10, 12, 24, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(288, 'PLR6401', 'TUBULAR PANN.HOLDER TRIUMPH', NULL, '324.00', 0, 10, 12, 24, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(289, 'PLR6403', 'TUBULAR PANN.HOLDER TRIUMPH', NULL, '276.00', 0, 10, 12, 24, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(290, 'PLR6404', 'TUBULAR PANN.HOLDER TRIUMPH', NULL, '318.00', 0, 10, 12, 24, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(291, 'PLR6408', 'SIDE RACK MONOKET TIGER1200', NULL, '323.00', 0, 10, 12, 24, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(292, 'PLR684', 'TUB.PANN.HOLDER BMW R1200GS', NULL, '384.00', 0, 10, 12, 24, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(293, 'PLR692', 'TUB.PANN.HOLDER BMW K1300 S\'09', NULL, '291.00', 0, 10, 12, 24, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(294, 'PLR693', 'TUB.PANN.HOLDER BMW F800R \'09', NULL, '284.00', 0, 10, 12, 24, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(295, 'PLR7401', 'TUB.PANN.HOLDER D.MULTISTRADA', NULL, '362.00', 0, 10, 12, 24, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(296, 'PLR7406CAM', 'OUTBACK HOLDER DUCATI MULTISTR', NULL, '452.00', 0, 10, 12, 29, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(297, 'PLR750', 'TUB.PANN.HOLDER KTM 990 SMT\'09', NULL, '306.00', 0, 10, 12, 24, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(298, 'PLR7703', 'TUB.PANN.HOLDER KTM 1190', NULL, '339.00', 0, 10, 12, 24, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(299, 'PLR7706', '', NULL, '440.00', 0, 10, 12, 24, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(300, '1000F', 'UNIVERSAL SIDEARMS M/RACK', NULL, '122.00', 0, 10, 13, 16, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(301, '1101KIT', 'FITTING KIT TE1101 HON.CB1000R', NULL, '72.00', 0, 10, 13, 3, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(302, '1102KIT', 'FITTING KIT TE1102 HON.HORNET', NULL, '106.00', 0, 10, 13, 3, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(303, '1104KIT', 'FITTING KIT PLX1104 HONDA', NULL, '89.00', 0, 10, 13, 3, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(304, '1109KIT', 'FITTING KIT FOR PLX1109-PL1109', NULL, '47.00', 0, 10, 13, 3, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(305, '1111KIT', 'FITTING KIT FOR TE1111', NULL, '40.00', 0, 10, 13, 22, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(306, '1121KIT', 'FITTING KIT PLX1121 H.CB500X', NULL, '120.00', 0, 10, 13, 3, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(307, '1127KIT', 'FITTING KIT PLX1127 HONDA', NULL, '45.00', 0, 10, 13, 3, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(308, '1132KIT', 'FITTING KIT FOR PLXR1132', NULL, '131.00', 0, 10, 13, 3, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(309, '1137KIT', 'FITTING KIT PLX1137-TE1137', NULL, '28.00', 0, 10, 13, 3, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(310, '1146KIT', 'FITTING KIT FOR NC750X 2016', NULL, '49.00', 0, 10, 13, 3, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(311, 'DLM36APACK2', 'TREKKER SIDECASES DOLOMITI36LT', '1520079879_DLM_36_PAN_SILVER.jpg', '919.00', 0, 10, 13, 4, 'a', '2018-03-03 18:03:01', '2018-03-03 12:24:43', 0),
(312, 'E22B912', 'COUPLE CRUISER 22LT', NULL, '416.00', 0, 10, 13, 4, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(313, 'E22N', 'COUPLE CRUISER 22LT BLACK', NULL, '194.00', 0, 10, 13, 4, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(314, 'E22N-S', 'COUPLE CRUISER BLK MKEY W/LIGH', NULL, '221.00', 0, 10, 13, 4, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(315, 'E41N', 'PAIR OF KEYLESS PANNIERS', NULL, '682.00', 0, 10, 13, 4, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(316, 'E41NN', 'PAIR OF KEYLESS PANNIERS BLACK', NULL, '642.00', 0, 10, 13, 4, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(317, 'OBK37AL', 'TREKKER LEFT CASE OUTBACK 37LT', '1520080011_TRK_OBK_37_PAN_SILVER.jpg', '520.00', 0, 10, 13, 30, 'o', '2018-03-03 18:03:01', '2018-03-03 12:28:24', 0),
(318, 'OBK37APACK2', 'TREKKER SIDECASES OUTBACK 37LT', '1520080017_TRK_OBK_37_PAN_SILVER.jpg', '1039.00', 0, 10, 13, 30, 'a', '2018-03-03 18:03:01', '2018-03-03 12:28:16', 0),
(319, 'OBK37AR', 'TREKKER RIGHT CASE OUTBACK37LT', '1520080028_TRK_OBK_37_PAN_SILVER.jpg', '520.00', 0, 10, 13, 30, 'a', '2018-03-03 18:03:01', '2018-03-03 12:28:07', 0),
(320, 'OBK37BL', 'TREKKER LEFT CASE OUTBACK 37LT', '1520080058_TRK_OBK_37_PAN_BLACK.jpg', '570.00', 0, 10, 13, 30, 'a', '2018-03-03 18:03:01', '2018-03-03 12:27:59', 0),
(321, 'OBK37BPACK2', 'TREKKER SIDECASES OUTBACK 37LT', '1520080049_TRK_OBK_37_PAN_BLACK.jpg', '1142.00', 0, 10, 13, 30, 'a', '2018-03-03 18:03:01', '2018-03-03 12:27:52', 0),
(322, 'OBK37BR', 'TREKKER RIGHT CASE OUTBACK37LT', '1520080042_TRK_OBK_37_PAN_BLACK.jpg', '570.00', 0, 10, 13, 30, 'a', '2018-03-03 18:03:01', '2018-03-03 12:27:46', 0),
(323, 'OBK4837APACK2', 'TREKKER SIDECASES OUTBACK', '1520080203_TRK_OBK_48_PAN_SILVER.jpg', '1061.00', 0, 10, 13, 30, 'a', '2018-03-03 18:03:01', '2018-03-03 12:30:19', 0),
(324, 'OBK4837BPACK2', 'OUTBACK SIDE CASE 37BR/48BL', '1520080174_TRK_OBK_37_PAN_BLACK.jpg', '1168.00', 0, 10, 13, 30, 'o', '2018-03-03 18:03:01', '2018-03-03 12:30:11', 0),
(325, 'OBK48AL', 'TREKKER LEFT CASE OUTBACK 48LT', '1520080278_TRK_OBK_48_PAN_SILVER.jpg', '538.00', 0, 10, 13, 30, 'a', '2018-03-03 18:03:01', '2018-03-03 12:31:43', 0),
(326, 'OBK48APACK2', 'TREKKER SIDECASES OUTBACK 48LT', '1520080271_TRK_OBK_48_PAN_SILVER.jpg', '1076.00', 0, 10, 13, 30, 'a', '2018-03-03 18:03:01', '2018-03-03 12:32:16', 0),
(327, 'OBK48AR', 'TREKKER RIGHT CASE OUTBACK48LT', '1520080263_TRK_OBK_48_PAN_SILVER.jpg', '538.00', 0, 10, 13, 30, 'o', '2018-03-03 18:03:01', '2018-03-03 12:31:59', 0),
(328, 'OBK48BL', 'TREKKER LEFT CASE OUTBACK 48LT', '1520080256_TRK_OBK_48_PAN_BLACK.jpg', '598.00', 0, 10, 13, 30, 'a', '2018-03-03 18:03:01', '2018-03-03 12:31:35', 0),
(329, 'OBK48BPACK2', 'TREKKER SIDECASES OUTBACK 48LT', '1520080246_TRK_OBK_48_PAN_BLACK.jpg', '1195.00', 0, 10, 13, 30, 'a', '2018-03-03 18:03:01', '2018-03-03 12:31:29', 0),
(330, 'OBK48BR', 'TREKKER RIGHT CASE OUTBACK48LT', '1520080236_TRK_OBK_48_PAN_BLACK.jpg', '598.00', 0, 10, 13, 30, 'a', '2018-03-03 18:03:01', '2018-03-03 12:31:24', 0),
(331, 'TE1101', 'TUBULAR HOLDER SOFT BAGS', NULL, '129.00', 0, 10, 13, 31, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(332, 'TE1102', 'TUBULAR HOLDER SOFT BAGS', NULL, '119.00', 0, 10, 13, 31, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(333, 'TE1107', 'TUB.HOLDER SOFT BAGS H.CB600F', NULL, '131.00', 0, 10, 13, 31, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(334, 'TE1109', 'TUBULAR HOLDER EASYLOCK BAGS', NULL, '112.00', 0, 10, 13, 31, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(335, 'TE1111', 'TUBULAR HOLDER EASYLOCK BAGS', NULL, '114.00', 0, 10, 13, 31, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(336, 'TE1119', 'TUBULAR HOLDER SOFT BAGS', NULL, '121.00', 0, 10, 13, 31, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(337, 'TE1137', 'TUBULAR HOLDER EASYLOCK BAGS', NULL, '141.00', 0, 10, 13, 31, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(338, 'TE2110', 'TUBOLAR HOLDER SOFT BAGS', NULL, '128.00', 0, 10, 13, 31, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(339, 'TE2115', 'TUBOLAR HOLDER SOFT BAGS', NULL, '119.00', 0, 10, 13, 31, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(340, 'TE2118', 'TUBULAR HOLDER SOFT BAGS', NULL, '128.00', 0, 10, 13, 31, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(341, 'TE2122', 'SOFT BAGS HOLDER TRACER', NULL, '128.00', 0, 10, 13, 31, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(342, 'TE265', 'TUBOLAR HOLDER SOFT BAGS', NULL, '154.00', 0, 10, 13, 31, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(343, 'TE266', 'TUBULAR HOLDER FOR SOFT BAGS', NULL, '128.00', 0, 10, 13, 31, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(344, 'TE3100', 'TUBULAR HOLDER FOR SOFT BAGS', NULL, '146.00', 0, 10, 13, 31, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(345, 'TE351', 'TUBUL. HOLDER FOR SOFT BAGS', NULL, '129.00', 0, 10, 13, 31, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(346, 'TE366', 'TUBUL. HOLDER FOR SOFT BAGS', NULL, '113.00', 0, 10, 13, 31, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(347, 'TE4100', 'TUBULAR HOLDER FOR SOFT BAGS', NULL, '123.00', 0, 10, 13, 31, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(348, 'TE4103', 'TUB.HOLD.SOFT BAGS KAW.VER.650', NULL, '106.00', 0, 10, 13, 31, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(349, 'TE4104', 'TUB.HOLD.SOFT BAGS KAW.ER6N-6F', NULL, '155.00', 0, 10, 13, 31, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(350, 'TE4106', 'TUBULAR HOLDER FOR SOFT BAGS', NULL, '131.00', 0, 10, 13, 31, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(351, 'TE4107', 'TUBOLAR HOLDER SOFT BAGS', NULL, '144.00', 0, 10, 13, 31, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(352, 'TE4108', 'TUBULAR HOLDER FOR SOFT BAGS', NULL, '127.00', 0, 10, 13, 31, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(353, 'TE4109', 'TUBULAR HOLDER FOR SOFT BAGS', NULL, '140.00', 0, 10, 13, 31, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(354, 'TE4114', 'SOFT PANNIER HOLDER VERSYS 650', NULL, '165.00', 0, 10, 13, 31, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(355, 'TE5105', 'TUBOL HOLDER SOFT BAGS EASYLOK', NULL, '137.00', 0, 10, 13, 31, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(356, 'TE5111', 'TUBULAR HOLDER EASYLOCK BAGS', NULL, '161.00', 0, 10, 13, 31, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(357, 'TE5115', 'SPECIFIC HOLDER FOR EASYLOCK', NULL, '155.00', 0, 10, 13, 31, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(358, 'TE6402', 'TUB.HOLD.SOFT B.TRIUMPH TRIPLE', NULL, '149.00', 0, 10, 13, 31, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(359, 'TE6405', 'TUBULAR HOLDER SOFT BAGS', NULL, '177.00', 0, 10, 13, 31, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(360, 'TE6700', 'TUBOL HOLDER SOFT BAGS EASYLOK', NULL, '143.00', 0, 10, 13, 31, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(361, 'TE6702', 'TUBOL HOLDER SOFT BAGS EASYLOK', NULL, '112.00', 0, 10, 13, 31, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(362, 'TE6703', 'TUBOL HOLDER SOFT BAGS EASYLOK', NULL, '155.00', 0, 10, 13, 31, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(363, 'TE705', 'TUBUL. HOLDER FOR SOFT BAGS', NULL, '125.00', 0, 10, 13, 31, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(364, 'TE7400', 'TUB.HOLDER SOFT BAGS DUCATI', NULL, '155.00', 0, 10, 13, 31, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(365, 'TE7404', 'TUBULAR HOLDER EASYLOCK BAGS', NULL, '196.00', 0, 10, 13, 31, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(366, 'TE7405', 'SPEC.HOLDER FOR EASYLOCK SIDE', NULL, '183.00', 0, 10, 13, 31, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(367, 'TE8201', 'SPEC.HOLDER FOR EASYLOCK OR', NULL, '131.00', 0, 10, 13, 31, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(368, 'V35N', 'V35 PAIR OF SIDECASES ,BLACK', '1520079735_V35_PAN.jpg', '564.00', 0, 10, 13, 32, 'a', '2018-03-03 18:03:01', '2018-03-03 12:23:12', 0),
(369, 'V35NT', 'V35 PAIR  BLACK SIDECASE TECH', '1520079750_V35_PAN_TECH.jpg', '564.00', 0, 10, 13, 32, 'a', '2018-03-03 18:03:01', '2018-03-03 12:22:57', 0),
(370, 'V35NTFL', 'V35 PAIR  BLACK SIDECASE TECH', '1520079762_V35_PAN_TFL.jpg', '668.00', 0, 10, 13, 32, 'a', '2018-03-03 18:03:01', '2018-03-03 12:23:05', 0),
(371, '351KIT', 'FITTING KIT FOR PL351', NULL, '55.00', 0, 10, 13, 3, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(372, '366KIT', 'Fitting kit 366FZ FAZER 800 - 2010', NULL, '41.00', 0, 10, 13, 3, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(373, '4100KIT', 'FITTING KIT PLXR4100 Z1000SX', NULL, '102.00', 0, 10, 13, 23, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(374, '4103KIT', 'FITTING KIT SPOILER KAW.VERSYS', NULL, '62.00', 0, 10, 13, 3, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(375, '777KIT', 'SPECIFIC KIT TO FIX THE PLXR', NULL, '42.00', 0, 10, 13, 3, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(376, '4107KIT', 'FITTING KIT TE4107 KAW.NINJIA', NULL, '80.00', 0, 10, 14, 3, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(377, '4108KIT', 'FITTING KIT TE4108 KAW.NINJIA', NULL, '50.00', 0, 10, 14, 3, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(378, '4109KIT', 'FITTING KIT TE4109 KAW.Z800\'13', NULL, '82.00', 0, 10, 14, 3, 'o', '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0);
INSERT INTO `mah_product` (`id`, `name`, `desc`, `image`, `price`, `interested`, `brand`, `cate`, `type`, `status`, `created`, `modified`, `ctl`) VALUES
(379, '4114KIT', 'SPEC KIT SUPPORT KAW VERSYS650', NULL, '14.00', 0, 10, 14, 3, 'a', '2018-03-03 18:03:01', '2018-03-03 10:03:02', 0),
(380, '7400KIT', 'FITTING KIT TE7400 DUCATI', NULL, '61.00', 0, 10, 14, 3, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(381, 'T129', 'TUBUL.HOLDER FOR SOFT BAGS', NULL, '54.00', 0, 10, 15, 31, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(382, 'T2013', 'TUBUL.HOLDER FOR SOFT BAGS', NULL, '101.00', 0, 10, 15, 31, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(383, 'T213', 'TUBUL.HOLDER FOR SOFT BAGS', NULL, '71.00', 0, 10, 15, 31, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(384, 'T214', 'TUBUL.HOLDER FOR SOFT BAGS', NULL, '91.00', 0, 10, 15, 31, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(385, 'T216', 'TUBUL.HOLDER FOR SOFT BAGS', NULL, '75.00', 0, 10, 15, 31, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(386, 'T218', 'TUBUL.HOLDER FOR SOFT BAGS', NULL, '61.00', 0, 10, 15, 31, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(387, 'T219', 'TUBUL.HOLDER FOR SOFT BAGS', NULL, '56.00', 0, 10, 15, 31, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(388, 'T220', 'TUBUL.HOLDER FOR SOFT BAGS', NULL, '91.00', 0, 10, 15, 31, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(389, 'T221', 'TUBUL.HOLDER FOR SOFT BAGS', NULL, '100.00', 0, 10, 15, 31, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(390, 'T223', 'TUBUL.HOLDER FOR SOFT BAGS', NULL, '125.00', 0, 10, 15, 31, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(391, 'T255', 'TUBUL.HOLDER FOR SOFT BAGS', NULL, '54.00', 0, 10, 15, 31, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(392, 'T262', 'TUBUL.HOLDER FOR SOFT BAGS', NULL, '57.00', 0, 10, 15, 31, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(393, 'T264', 'TUBUL.HOLDER FOR SOFT BAGS', NULL, '82.00', 0, 10, 15, 31, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(394, 'T267', 'TUBUL.HOLDER FOR SOFT BAGS', NULL, '126.00', 0, 10, 15, 31, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(395, 'T271', 'TUBUL.HOLDER FOR SOFT BAGS', NULL, '57.00', 0, 10, 15, 31, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(396, 'T272', 'TUBUL.HOLDER FOR SOFT BAGS', NULL, '79.00', 0, 10, 15, 31, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(397, 'T276', 'TUBUL.HOLDER FOR SOFT BAGS', NULL, '94.00', 0, 10, 15, 31, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(398, 'T351', 'TUBUL.HOLDER FOR SOFT BAGS', NULL, '49.00', 0, 10, 15, 31, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(399, 'T680', 'TUBUL.HOLDER FOR SOFT BAGS', NULL, '74.00', 0, 10, 15, 31, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(400, 'T681', 'TUBUL.HOLDER FOR SOFT BAGS', NULL, '118.00', 0, 10, 15, 31, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(401, 'T682', 'TUBUL. HOLDER FOR SOFT BAGS', NULL, '108.00', 0, 10, 15, 31, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(402, 'T704', 'BRACKETSIDE T704 TIGER/SOFTBAG', NULL, '150.00', 0, 10, 15, 31, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(403, 'TMT2128', 'TUBULAR HOLDER  XSR900 MT501', NULL, '167.00', 0, 10, 15, 33, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(404, 'TMT5115', 'RH LUGGAGE RACK R NINE T', NULL, '96.00', 0, 10, 15, 33, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(405, 'TMT6407', 'TUB HOLDER MT501 STTWIN', NULL, '152.00', 0, 10, 15, 33, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(406, 'TMT6410', 'TUBULAR HOLDER BONN MT501', NULL, '131.00', 0, 10, 15, 33, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(407, 'TMT8201', 'TUB HOLDER MT501 V7 STONE 2017', NULL, '167.00', 0, 10, 15, 33, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(408, 'SB2000', 'BRACKETSIDE/SB2000 NEW', NULL, '134.00', 0, 10, 16, 16, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(409, 'SB225', 'SIDE BAG HOLDER FOR FZ150', NULL, '107.00', 0, 10, 16, 21, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(410, 'SBL502', 'SIDE BAG HOLDER KTM DUKE 200/3', NULL, '161.00', 0, 10, 16, 21, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(411, 'T448', 'HOLDER FOR T446 PHONE HOLDER', NULL, '33.00', 0, 10, 17, 16, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(412, 'S110', 'ELETRIC PLUG-12V KIT POWER', NULL, '34.00', 0, 10, 18, 34, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(413, 'S111', 'POWER HUB KIT FOR DEVICE', NULL, '98.00', 0, 10, 18, 35, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(414, 'S112', 'KIT FOR CHARGING OF DEVICES', NULL, '75.00', 0, 10, 18, 35, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(415, 'EH1110', 'EXTENSION ORIG.HAND PROTECTOR', NULL, '113.00', 0, 10, 19, 36, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(416, 'EH5108', 'EXTENSION ORIG.HAND PROTECTOR', NULL, '111.00', 0, 10, 19, 36, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(417, 'EH6401', 'EXTENSION ORIG.HAND PROTECTOR', NULL, '101.00', 0, 10, 19, 36, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(418, 'ES1110', 'ALUMINUM STAND SUPPORT FOR', NULL, '50.00', 0, 10, 19, 37, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(419, 'ES1111', 'ALUMINUM STAND SUPPORT FOR', NULL, '50.00', 0, 10, 19, 37, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(420, 'ES1121', 'ALUMINUM STAND SUPPORT FOR H.', NULL, '50.00', 0, 10, 19, 37, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(421, 'ES1144', 'ALU SIDE STAND SUPPORT CRF', NULL, '59.00', 0, 10, 19, 37, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(422, 'ES1156', 'Specific Side Stand support  X ADV 750', NULL, '61.00', 0, 10, 19, 37, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(423, 'ES2105', 'ALUMINUM STAND SUPPORT', NULL, '50.00', 0, 10, 19, 37, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(424, 'ES2119', 'ALUMINUM STAND SUPPORT FOR', NULL, '58.00', 0, 10, 19, 37, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(425, 'ES2122', 'ALU STAND SUPPORT MT-09 TRACER', NULL, '59.00', 0, 10, 19, 37, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(426, 'ES3101', 'ALUMINUM STAND SUPPORT FOR SUZ', NULL, '59.00', 0, 10, 19, 37, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(427, 'ES3105', 'ALUMINUM STAND SUPPORT FOR', NULL, '59.00', 0, 10, 19, 37, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(428, 'ES4103', 'ALUMINUM STAND SUPPORT', NULL, '59.00', 0, 10, 19, 37, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(429, 'ES4105', 'ALUMINUM STAND SUPPORT FOR', NULL, '59.00', 0, 10, 19, 37, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(430, 'ES5101', 'ALUMINUM STAND SUPPORT FOR', NULL, '50.00', 0, 10, 19, 37, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(431, 'ES5102', 'ALUMINUM STAND SUPPORT FOR BMW', NULL, '50.00', 0, 10, 19, 37, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(432, 'ES5107', 'ALUMINUM STAND SUPPORT FOR', NULL, '50.00', 0, 10, 19, 37, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(433, 'ES5108', 'ALUMINUM STAND SUPPORT', NULL, '50.00', 0, 10, 19, 37, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(434, 'ES5110', 'ALUMINUM STAND SUPPORT', NULL, '50.00', 0, 10, 19, 37, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(435, 'ES5112', 'ALUMINUM STAND SUPPORT FOR', NULL, '58.00', 0, 10, 19, 37, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(436, 'ES5113', 'ALUMINUM STAND SUPPORT FOR', NULL, '59.00', 0, 10, 19, 37, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(437, 'ES6401', 'ALUMINUM STAND SUPPORT FOR', NULL, '50.00', 0, 10, 19, 37, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(438, 'ES6403', 'ALUMINUM STAND SUPPORT FOR', NULL, '59.00', 0, 10, 19, 37, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(439, 'ES6408', 'ALU STAND SUPPORT TIGER EXP', NULL, '59.00', 0, 10, 19, 37, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(440, 'ES6706', 'ALUMINUM STAND SUPPORT FOR', NULL, '50.00', 0, 10, 19, 37, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(441, 'ES684', 'ALUMINUM STAND SUPPORT', NULL, '50.00', 0, 10, 19, 37, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(442, 'ES7401', 'ALUMINUM STAND SUPPORT FOR', NULL, '50.00', 0, 10, 19, 37, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(443, 'ES7703', 'ALUMINUM STAND SUPPORT', NULL, '50.00', 0, 10, 19, 37, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(444, 'ES7704', 'ALUMINUM STAND SUPPORT FOR', NULL, '59.00', 0, 10, 19, 37, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(445, 'HP1111', 'HAND PROTECTOR FOR HONDA', NULL, '148.00', 0, 10, 19, 36, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(446, 'HP1121', 'HAND PROTECTOR FOR HONDA', NULL, '143.00', 0, 10, 19, 36, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(447, 'HP1139', 'HAND PROTECTOR CROSSRUNNER \'15', NULL, '161.00', 0, 10, 19, 36, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(448, 'HP1144', 'HAND PROTECTOR HONDA CRF1000', NULL, '143.00', 0, 10, 19, 36, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(449, 'HP2115', 'HAND PROTECTOR FOR YAMAHA', NULL, '161.00', 0, 10, 19, 36, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(450, 'HP3105', 'HAND PROTECTOR FOR SUZUKI', NULL, '148.00', 0, 10, 19, 36, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(451, 'HP4103', 'HAND PROTECTOR FOR KAWASAKI', NULL, '136.00', 0, 10, 19, 36, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(452, 'HP5103', 'HAND PROTECTOR FOR BMW F800GS', NULL, '148.00', 0, 10, 19, 36, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(453, 'LP5112', 'SPEC. PROTECTION FOR HEADLIGHT', NULL, '169.00', 0, 10, 19, 2, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(454, 'MG1109', 'MUDGUARD H.INTEGRA 700-NC700X-', NULL, '195.00', 0, 10, 19, 38, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(455, 'MG1121', 'MUDGUARD H.CB500X (13-14)', NULL, '186.00', 0, 10, 19, 38, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(456, 'MG1127', 'MUDGUARD H.INTEGRA 750(2014)', NULL, '195.00', 0, 10, 19, 38, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(457, 'MG1156', 'Fender Chain Guard', NULL, '208.00', 0, 10, 19, 38, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(458, 'MG3101', 'MUDGUARD SUZUKI DL650 V-STROM', NULL, '151.00', 0, 10, 19, 38, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(459, 'MG3105', 'MUDGUARD SUZUKI DL1000 V-STROM', NULL, '139.00', 0, 10, 19, 38, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(460, 'MG4103', 'MUDGUARD KAW.VERSYS 650(10-13)', NULL, '117.00', 0, 10, 19, 38, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(461, 'MG5103', 'MUDGUARD BMW F650GS-F700GS', NULL, '141.00', 0, 10, 19, 38, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(462, 'MG532', 'MUDGUARD SUZ.DL650 V-STROM', NULL, '151.00', 0, 10, 19, 38, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(463, 'MG6401', 'MUDGUARD TRIUMP TIGER 800', NULL, '155.00', 0, 10, 19, 38, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(464, 'PH5108', 'ENGIN HEAD PROTECTOR', NULL, '209.00', 0, 10, 19, 39, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(465, 'PR1121', 'RADIATOR PROTECTION CB400X', NULL, '120.00', 0, 10, 19, 40, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(466, 'PR1146', 'RADIATOR PROTECTION NC750X2016', NULL, '112.00', 0, 10, 19, 40, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(467, 'PR1156', 'Stainless steel specific radiator guard black painted', NULL, '151.00', 0, 10, 19, 40, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(468, 'PR2128', 'SPECIFIC RAD PROTECTION XSR900', NULL, '136.00', 0, 10, 19, 40, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(469, 'PR2132', 'SPEC RAD PROTECTION MT-09 \'17', NULL, '127.00', 0, 10, 19, 40, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(470, 'PR4117', 'RADIATOR PROTECTOR KAW Z650', NULL, '117.00', 0, 10, 19, 40, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(471, 'PR5108', 'SPECIFIC RADIATOR PROTECTION', NULL, '103.00', 0, 10, 19, 40, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(472, 'RM1146KIT', 'SPEC MUDGUARD NC750X', NULL, '144.00', 0, 10, 19, 3, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(473, 'RM2122KIT', 'SPEC MUDGUARD SUPPORT TRACER', NULL, '111.00', 0, 10, 19, 3, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(474, 'RM2130KIT', 'SUPPORT MT-07 TRACER RM01', NULL, '111.00', 0, 10, 19, 3, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(475, 'RP1110', 'OIL CARTER PROTECTOR HONDA', NULL, '349.00', 0, 10, 19, 41, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(476, 'RP1144', 'OIL CARTER CRF1000L AFRICATWIN', NULL, '438.00', 0, 10, 19, 41, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(477, 'RP1144KIT', 'FITTING KIT CRF1000L', NULL, '25.00', 0, 10, 19, 3, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(478, 'RP2101', 'OIL CARTER PROT SPR TENERY', NULL, '409.00', 0, 10, 19, 41, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(479, 'RP2105', 'OIL CARTER PROTECTOR Y.XT660Z', NULL, '230.00', 0, 10, 19, 41, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(480, 'RP2119', 'OIL CARTER PROTECTOR YAMAHA', NULL, '282.00', 0, 10, 19, 41, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(481, 'RP3101', 'OIL CARTER PROTECTOR SUZ.DL650', NULL, '221.00', 0, 10, 19, 41, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(482, 'RP3105', 'OIL CARTER PROTECTOR SUZUKI', NULL, '245.00', 0, 10, 19, 41, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(483, 'RP5103', 'OIL CARTER PROTECTOR BMW F800', NULL, '231.00', 0, 10, 19, 41, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(484, 'RP5112', 'OIL CARTER PROTECTOR BMW', NULL, '205.00', 0, 10, 19, 41, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(485, 'RP6401', 'OIL CARTER PROTECTOR TRIUMPH', NULL, '279.00', 0, 10, 19, 41, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(486, 'RP6403', 'OIL CARTER PROTECTOR TRIUMPH', '1520079679_RP6403.png', '233.00', 0, 10, 19, 41, 'a', '2018-03-03 18:03:02', '2018-03-03 12:21:23', 0),
(487, 'RP7703', 'OIL CARTER PROTECTOR KTM', NULL, '282.00', 0, 10, 19, 41, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(488, 'S280', 'UNIVERSAL INOX-PROTECTION FOR', '1520079513_S280_S281_S282.png', '68.00', 0, 10, 19, 16, 'a', '2018-03-03 18:03:02', '2018-03-03 12:18:43', 0),
(489, 'S281', 'UNIVERSAL INOX-PROTECTION FOR', '1520079506_S280_S281_S282.png', '71.00', 0, 10, 19, 16, 'a', '2018-03-03 18:03:02', '2018-03-03 12:18:37', 0),
(490, 'S282', 'UNIVERSAL INOX-PROTECTION FOR', '1520079462_S280_S281_S282.png', '96.00', 0, 10, 19, 16, 'a', '2018-03-03 18:03:02', '2018-03-03 12:17:57', 0),
(491, 'S301', 'FIRST AID KIT', '1520079541_S301.png', '25.00', 0, 10, 19, 16, 'a', '2018-03-03 18:03:02', '2018-03-03 12:19:05', 0),
(492, 'S450', 'TUBELESS TYRES REPAIR KIT', '1520079566_S450.png', '59.00', 0, 10, 19, 16, 'a', '2018-03-03 18:03:02', '2018-03-03 12:19:30', 0),
(493, 'TM418', 'PAIR OF PROTEC.HANDLE-BAR', '1520079619_TM418.png', '67.00', 0, 10, 19, 16, 'o', '2018-03-03 18:03:02', '2018-03-03 12:20:23', 0),
(494, 'TL10', 'HIGH VISIBILITY ARMOR CAB-LOCK', NULL, '67.00', 0, 10, 20, 16, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(495, 'TL8', 'HIGH VISIBILITY U-LOCK', NULL, '67.00', 0, 10, 20, 16, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(496, 'TL9', 'HIGH VISIBILITY DISC-LOCK', NULL, '37.00', 0, 10, 20, 16, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(497, 'VEST01-2XL/3XL', 'HIGH VISIBILITY VEST 2/XL/3XL', NULL, '74.00', 0, 10, 20, 42, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(498, 'VEST01-L/XL', 'HIGH VISIBILITY VEST L/XL', NULL, '74.00', 0, 10, 20, 42, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(499, 'VEST01-S/M', 'HIGH VISIBILITY VEST S/M', NULL, '74.00', 0, 10, 20, 42, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(500, 'SC131', 'COOL-DRY SEAT COVER PIAGGIO', NULL, '43.00', 0, 10, 21, 21, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(501, 'SC134', 'DRY-COOL SEAT COVER SPECIFIC', NULL, '43.00', 0, 10, 21, 21, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(502, 'SC2013', 'COOL-DRY SEAT COVER YAMAHA', NULL, '43.00', 0, 10, 21, 21, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(503, 'SC231', 'COOL DRY SEAT HONDA PCX150', NULL, '39.00', 0, 10, 21, 21, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(504, 'SC5604', 'DRY-COOL SEAT COVER SPECIFIC', NULL, '43.00', 0, 10, 21, 21, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(505, '450KIT', 'FITTING KIT PLR/PLXR450 KAW.', NULL, '82.00', 0, 10, 22, 3, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(506, 'PL01CAM', 'ROUGH FRAME FOR MONOKEY CASE', NULL, '164.00', 0, 10, 22, 43, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(507, 'PL1109', 'TUB.PAN.HOLD.H.INTEGRA 700 \'12', NULL, '233.00', 0, 10, 22, 44, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(508, 'PL1111', 'TUB.PAN.HOLD.HONDA NC700X \'12', NULL, '248.00', 0, 10, 22, 44, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(509, 'PL1111CAM', 'TUB.PANN.HOLDER H.NC700X\'12-13', NULL, '369.00', 0, 10, 22, 45, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(510, 'PL1119', 'TUB.PAN.HOLD.H.CBR500R \'13', NULL, '238.00', 0, 10, 22, 44, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(511, 'PL1121', 'TUB.PAN.HOLD.HONDA CB500X \'13', NULL, '286.00', 0, 10, 22, 44, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(512, 'PL1121CAM', 'TUB.PANN.HOLDER H.CB500X \'13', NULL, '354.00', 0, 10, 22, 45, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(513, 'PL1129CAM', 'TUB.PANN.HOLDER H.XL700V', NULL, '422.00', 0, 10, 22, 45, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(514, 'PL1139CAM', 'OUTBACK HOLDER CROSSRUNNER 800', NULL, '369.00', 0, 10, 22, 45, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(515, 'PL1142', 'TUN PANN HOLDE HONDA CB125F 15', NULL, '187.00', 0, 10, 22, 44, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(516, 'PL1144CAM', 'OBK PANNIER RACK AFRICA TWIN', NULL, '422.00', 0, 10, 22, 45, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(517, 'PL1146', 'MONOKEY SIDE RACK NC750X16', NULL, '212.00', 0, 10, 22, 44, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(518, 'PL1146CAM', 'OUTBACK PANNIER HOLDER NC750X', NULL, '354.00', 0, 10, 22, 45, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(519, 'PL1156', '', NULL, '248.00', 0, 10, 22, 44, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(520, 'PL1158', '', NULL, '260.00', 0, 10, 22, 44, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(521, 'PL131', 'TUB.PAN.HOLD.H.600 TRANSALP', NULL, '200.00', 0, 10, 22, 44, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(522, 'PL148', 'TUB.PAN.HOLDER H.AFR.TWIN 750', NULL, '210.00', 0, 10, 22, 44, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(523, 'PL164', 'TUB.PAN.HOLDER H.VARAD.1000', NULL, '254.00', 0, 10, 22, 44, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(524, 'PL166', 'TUB.PAN.HOLDER H.VFR 800\'02', NULL, '243.00', 0, 10, 22, 44, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(525, 'PL167', 'TUB.PAN.HOLD.650 TRANSALP 02', NULL, '241.00', 0, 10, 22, 44, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(526, 'PL170', 'TUB.PAN.HOL.H.VARAD.1000\'03', NULL, '255.00', 0, 10, 22, 44, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(527, 'PL174', 'TUB.PAN.HOL.HONDA CBF 600\'04', NULL, '221.00', 0, 10, 22, 44, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(528, 'PL177', 'TUB.PAN.HOL.H.VARAD.1000 V', NULL, '262.00', 0, 10, 22, 44, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(529, 'PL185', 'TUB.PAN.HOLD.BMW F650ST \'97', NULL, '186.00', 0, 10, 22, 44, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(530, 'PL188', 'TUB.PAN.H.BMW F 650GS\'00-01', NULL, '238.00', 0, 10, 22, 44, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(531, 'PL189', 'TUB.PAN.H.BMW R 1150GS\'94.02', NULL, '238.00', 0, 10, 22, 44, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(532, 'PL202', 'TUB.PAN.HOLD.H.VARADERO XL', NULL, '244.00', 0, 10, 22, 44, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(533, 'PL203', 'TUB.PAN.HOLD.H.TRANSALP XL', NULL, '256.00', 0, 10, 22, 44, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(534, 'PL208', 'TUB.PANN.HOLDER HONDA CBF1000-', NULL, '254.00', 0, 10, 22, 44, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(535, 'PL2101CAM', 'TUB PANN OUTBACK SUPER TENERY', NULL, '369.00', 0, 10, 22, 45, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(536, 'PL2104', 'TUB.PAN.HOLD.YAM.YBR125(10-12)', NULL, '227.00', 0, 10, 22, 44, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(537, 'PL2105CAM', 'TUB.PANN.HOLDER YAM.XT 660Z', NULL, '354.00', 0, 10, 22, 45, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(538, 'PL2119', 'TUB.PAN.HOLD.YAM.XT1200ZE', NULL, '277.00', 0, 10, 22, 44, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(539, 'PL2119CAM', 'TUB.PANN.HOLDER Y. XT1200ZE', NULL, '369.00', 0, 10, 22, 45, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(540, 'PL2122CAM', 'PANNIER OBK RACK MT-09 TRACER', NULL, '391.00', 0, 10, 22, 45, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(541, 'PL2128', 'MONOKEY SIDE RACK XSR900', NULL, '245.00', 0, 10, 22, 44, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(542, 'PL257', 'TUB.PAN.HOLD.HONDA VFR 800\'01', NULL, '196.00', 0, 10, 22, 44, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(543, 'PL3101', 'TUB.PAN.HOLDER SUZUKI DL650', NULL, '276.00', 0, 10, 22, 44, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(544, 'PL3101CAM', 'TUB.PAN.HOLDER S.DL650 V-STROM', NULL, '422.00', 0, 10, 22, 45, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(545, 'PL3103', 'TUB.PAN.HOLDER SUZ. INAZUMA', NULL, '253.00', 0, 10, 22, 44, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(546, 'PL3104', 'TUB.PAN.HOLDER SUZ.BURGMAN 650', NULL, '248.00', 0, 10, 22, 44, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(547, 'PL3105CAM', 'TUB.PANN.HOLDER SUZUKI', NULL, '369.00', 0, 10, 22, 45, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(548, 'PL313', 'TUB.PAN.HOLD.APR.ETV 1000\'01', NULL, '210.00', 0, 10, 22, 44, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(549, 'PL347', 'TUB.PAN.HOLD.YAM.TDM 900', NULL, '221.00', 0, 10, 22, 44, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(550, 'PL349', 'TUB.PAN.HOLD. YAM.FZS 1000FZ\'0', NULL, '230.00', 0, 10, 22, 44, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(551, 'PL351', 'TUB.PAN.HOLD.YAMAHA FZ6-FZ6', NULL, '214.00', 0, 10, 22, 44, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(552, 'PL360', 'TUB.PAN.HOLD.YAMAHA FZ6', NULL, '241.00', 0, 10, 22, 44, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(553, 'PL363', 'TUB.PAN HOLD.YAM. XT660Z TENER', NULL, '268.00', 0, 10, 22, 44, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(554, 'PL4101', 'TUB.PAN.HOL.KAWAS. W800 (2011)', NULL, '260.00', 0, 10, 22, 44, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(555, 'PL4102', 'TUB.PAN.HOLD.KAW.VN900 (06-11)', NULL, '224.00', 0, 10, 22, 44, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(556, 'PL4103CAM', 'TUB.PAN.HOL.K.VERSYS 650\'10-13', NULL, '354.00', 0, 10, 22, 45, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(557, 'PL4105CAM', 'TUB.PANN.HOLDER K. VERSYS 1000', NULL, '354.00', 0, 10, 22, 45, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(558, 'PL4114', 'MONOKEY HOLDER VERSYS 650 15', NULL, '209.00', 0, 10, 22, 44, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(559, 'PL4114CAM', 'OBK PANNIER HOLDER VERSYS 650', NULL, '380.00', 0, 10, 22, 45, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(560, 'PL4115', 'Side Case Racks Kawasaki Vulcan S', NULL, '274.00', 0, 10, 22, 44, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(561, 'PL441', 'TUB.PAN.HOLD.KAW.ZZR 1200\'02', NULL, '197.00', 0, 10, 22, 44, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(562, 'PL447', 'TUB.PAN.HOL.KAW.VERSYS 650\'07', NULL, '260.00', 0, 10, 22, 44, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(563, 'PL448', 'TUB.PAN.HOLDER KAW.KLR 650\'08', NULL, '228.00', 0, 10, 22, 44, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(564, 'PL5101CAM', 'TUB.PANN.HOLDER BMW F650GS', NULL, '354.00', 0, 10, 22, 45, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(565, 'PL5103CAM', 'TUB.PANN.HOLDER BMW F650GS', NULL, '422.00', 0, 10, 22, 45, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(566, 'PL5106', 'TUB.PAN.H.BMW C650GT', NULL, '324.00', 0, 10, 22, 44, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(567, 'PL5108CAM', 'TUB.PAN.HOLD.BMW R1200GS\'13', NULL, '422.00', 0, 10, 22, 45, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(568, 'PL5119CAM', 'OBK HOLDER BMW S1000XR', NULL, '369.00', 0, 10, 22, 45, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(569, 'PL528', 'TUB.PAN.HOL.SUZ.DL1000\'02V-STR', NULL, '214.00', 0, 10, 22, 44, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(570, 'PL532', 'TUB.PAN.HOL.SUZ.DL650 V-STROM', NULL, '245.00', 0, 10, 22, 44, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(571, 'PL532CAM', 'TUB.PANN.HOLDER SUZUKI', NULL, '369.00', 0, 10, 22, 45, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(572, 'PL539', 'TUB.PAN.HOLD.SUZ.BANDIT 650 K7', NULL, '239.00', 0, 10, 22, 44, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(573, 'PL6401CAM', 'TUBULAR PANN.HOLDER TR. TIGER', NULL, '369.00', 0, 10, 22, 45, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(574, 'PL6403CAM', 'TUBULAR PANN.HOLDER TRIUMPH', NULL, '369.00', 0, 10, 22, 45, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(575, 'PL6408CAM', 'OUTBACK RACK 2016 TIGER EXPL', NULL, '369.00', 0, 10, 22, 45, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(576, 'PL6410', 'PANNIER HOLDER  BONN T120', NULL, '236.00', 0, 10, 22, 44, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(577, 'PL650', 'TUB.PAN.HOLDER KTM 950 ADVEN.', NULL, '220.00', 0, 10, 22, 44, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(578, 'PL6706', 'TUB.PAN.HOLD. APRILIA CAPONORD', NULL, '256.00', 0, 10, 22, 44, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(579, 'PL684', 'TUB.PAN.HOLD.BMW R 1200GS\'04', NULL, '245.00', 0, 10, 22, 44, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(580, 'PL684CAM', 'TUB.PAN.HOLD.BMW R1200GS\'04-12', NULL, '422.00', 0, 10, 22, 45, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(581, 'PL685', 'TUB.PAN.HOLDER BMW R 1200 GS', NULL, '242.00', 0, 10, 22, 44, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(582, 'PL690', 'TUB.PAN.HOLDER BMW F650-F800', NULL, '277.00', 0, 10, 22, 44, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(583, 'PL708', 'TUB.PAN.HOLDER GUZZI STELVIO', NULL, '254.00', 0, 10, 22, 44, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(584, 'PL727', 'TUB.PAN.HOLDER TRIUMPH TIGER', NULL, '242.00', 0, 10, 22, 44, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(585, 'PL7407', 'PANNIER HOLDER DUCATI 800', NULL, '266.00', 0, 10, 22, 44, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(586, 'PL7700CAM', 'TUB.PAN.HOLDER KTM 950/990 ADV', NULL, '422.00', 0, 10, 22, 45, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(587, 'PL7703CAM', 'TUB.PANN.HOLDER KTM 1190', NULL, '369.00', 0, 10, 22, 45, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(588, 'PL7705CAM', 'OUTBACK HOLDER KTM1050 ADV', NULL, '369.00', 0, 10, 22, 45, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(589, 'PL7705CAMKIT', '', NULL, '117.00', 0, 10, 22, 3, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(590, 'PL8201', 'SPEC SIDE RACK V7 STONE 2017', NULL, '228.00', 0, 10, 22, 44, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(591, 'PL8701', 'TUB.PAN.HOLD.BENELLI BN600', NULL, '270.00', 0, 10, 22, 44, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(592, 'CBP01', 'CFT BACKPACK 12LT 01', NULL, '155.00', 0, 10, 23, 46, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(593, 'CBP02', 'CFT BACKPACK 17LT 02', NULL, '193.00', 0, 10, 23, 46, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(594, 'CL500', 'CLASSIC RANGE TAIL BAG GP100', NULL, '284.00', 0, 10, 23, 47, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(595, 'CL502', 'TAIL OR SPEC.RACK CUSTOM PACK', NULL, '157.00', 0, 10, 23, 47, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(596, 'CL503', 'PAIR OF CUSTOM SIDE BAGS', NULL, '290.00', 0, 10, 23, 48, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(597, 'CWB01', 'CFT WAIST BAG 2LT 01', NULL, '93.00', 0, 10, 23, 49, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(598, 'EA100', 'PAIR OF SADDLE EASY BAGS28/35', NULL, '184.00', 0, 10, 23, 50, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(599, 'EA100B', 'SADDLE BAG PAIR EASY 28/35', '1520079199_EA100B.jpg', '187.00', 0, 10, 23, 50, 'o', '2018-03-03 18:03:02', '2018-03-03 12:13:23', 0),
(600, 'EA101', 'PAIR OF SADDLE EASY BAG 19/25', NULL, '168.00', 0, 10, 23, 50, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(601, 'EA101B', 'SADDLE BAG PAIR 19/25', '1520079220_EA101B.jpg', '171.00', 0, 10, 23, 50, 'a', '2018-03-03 18:03:02', '2018-03-03 12:13:44', 0),
(602, 'EA102', 'TANK EASY BAG WITH MAGNETS', NULL, '116.00', 0, 10, 23, 51, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(603, 'EA102B', 'TANK EASY W/MAGNETS 28LT', '1520079245_EA102B.jpg', '118.00', 0, 10, 23, 51, 'o', '2018-03-03 18:03:02', '2018-03-03 12:14:12', 0),
(604, 'EA103', 'TANK EASY BAG W/MAGNETS EXTEN', NULL, '175.00', 0, 10, 23, 51, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(605, 'EA103B', 'MAGNETIC TANK EASY', '1520079272_EA103B.jpg', '179.00', 0, 10, 23, 51, 'a', '2018-03-03 18:03:02', '2018-03-03 12:14:42', 0),
(606, 'EA104', 'EXTENSIBLE RUCKSAK EASY BAG', NULL, '95.00', 0, 10, 23, 46, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(607, 'EA104GR', 'EXTEN RUCKSACK EASY BAG GREY', '1520079316_EA104GR.jpg', '113.00', 0, 10, 23, 46, 'a', '2018-03-03 18:03:02', '2018-03-03 12:15:19', 0),
(608, 'EA105', 'CENTRAL EASY BAG 18LT', NULL, '87.00', 0, 10, 23, 52, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(609, 'EA105B', 'CENTRAL EASY BAG 18LITERS', '1520079345_EA105B.jpg', '89.00', 0, 10, 23, 52, 'o', '2018-03-03 18:03:02', '2018-03-03 12:15:48', 0),
(610, 'EA105GR', 'CENTRAL EASY BAG 18LT GRAY', '1520079367_EA105GR.jpg', '93.00', 0, 10, 23, 52, 'a', '2018-03-03 18:03:02', '2018-03-03 12:16:12', 0),
(611, 'EA106', 'TANK EASY BAG WITH MAGNETS', NULL, '62.00', 0, 10, 23, 51, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(612, 'EA106B', 'TANK EASY BAG W/MAGNETS 6LT', '1520079399_EA106B.jpg', '71.00', 0, 10, 23, 51, 'a', '2018-03-03 18:03:02', '2018-03-03 12:16:45', 0),
(613, 'EA107', 'ROLL TAIL BAG 33LT', NULL, '118.00', 0, 10, 23, 53, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(614, 'EA107GR', 'ROLL/TAIL BAG 33LTR GREY', NULL, '123.00', 0, 10, 23, 53, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(615, 'EA108', 'BUMBAG EASY BAG', NULL, '26.00', 0, 10, 23, 54, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(616, 'EA109', 'LEG EASY BAG', NULL, '27.00', 0, 10, 23, 55, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(617, 'EA110', 'TANK EASY BAG FOR ENDURO', NULL, '141.00', 0, 10, 23, 51, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(618, 'EA111', 'EXTENSIBLE CAMEL BAG', NULL, '75.00', 0, 10, 23, 46, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(619, 'EA112', 'EASY BAG FOR TABLET/MAP WITH', NULL, '74.00', 0, 10, 23, 51, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(620, 'EA113', 'LEG EASY BAG', NULL, '48.00', 0, 10, 23, 55, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(621, 'EA114KG', 'TAIL PACK 30L WPROOF KAKI GREY', NULL, '60.00', 0, 10, 23, 53, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(622, 'EA115BK', 'BLACK WATERPROOF BAG 40LT', '1520079114_EA115BK.jpg', '91.00', 0, 10, 23, 56, 'o', '2018-03-03 18:03:02', '2018-03-03 12:11:59', 0),
(623, 'EA115KG', 'GREY WATERPROOF BAG 40LT', '1520079060_EA115KG.jpg', '91.00', 0, 10, 23, 56, 'a', '2018-03-03 18:03:02', '2018-03-03 12:11:04', 0),
(624, 'GRT701', 'WATERPROOF RUCKSACK GRAVELT', '1520078985_GRT701.jpg', '142.00', 0, 10, 23, 57, 'a', '2018-03-03 18:03:02', '2018-03-03 12:09:49', 0),
(625, 'GRT702', 'WATERPROOF CYLINDER BAG GRT', '1520078762_GRT702.jpg', '118.00', 0, 10, 23, 57, 'a', '2018-03-03 18:03:02', '2018-03-03 12:08:20', 0),
(626, 'GRT703', 'TAILROLL WATERPROOF 40LT GRAVEL', '1520078762_GRT703.jpg', '188.00', 0, 10, 23, 57, 'a', '2018-03-03 18:03:02', '2018-03-03 12:08:56', 0),
(627, 'GRT704', 'BUMBAG WATERPROOF 3LT GRAVEL', '1520078753_GRT704.jpg', '92.00', 0, 10, 23, 57, 'a', '2018-03-03 18:03:02', '2018-03-03 12:09:02', 0),
(628, 'GRT705', 'TANK BAG WATER PROOF 20L', '1520078746_GRT705.jpg', '235.00', 0, 10, 23, 57, 'a', '2018-03-03 18:03:02', '2018-03-03 12:09:28', 0),
(629, 'GRT706', 'TANK BAG WATERPROOF 6LT', '1520078739_GRT706.jpg', '116.00', 0, 10, 23, 57, 'a', '2018-03-03 18:03:02', '2018-03-03 12:09:20', 0),
(630, 'GRT707', 'GRAVEL  WATERPROOF 5LT', '1520078731_GRT707.jpg', '47.00', 0, 10, 23, 57, 'a', '2018-03-03 18:03:02', '2018-03-03 12:09:14', 0),
(631, 'GRT708', 'TANK BAG WATERPROOF 15LT', '1520078725_GRT708.jpg', '245.00', 0, 10, 23, 57, 'a', '2018-03-03 18:03:02', '2018-03-03 12:09:08', 0),
(632, 'MT501', 'PAIR EASY LOCK METRO RANGE', '1520078664_MT501.jpg', '586.00', 0, 10, 23, 58, 'a', '2018-03-03 18:03:02', '2018-03-03 12:04:50', 0),
(633, 'MT502', 'SADDLE BAG CONVERTIBLE BACKPAC', '1520078648_MT502.jpg', '260.00', 0, 10, 23, 50, 'a', '2018-03-03 18:03:02', '2018-03-03 12:04:42', 0),
(634, 'MT504', 'MAGNETIC THERMOFOR METRO', '1520078623_MT504.jpg', '131.00', 0, 10, 23, 51, 'a', '2018-03-03 18:03:02', '2018-03-03 12:04:35', 0),
(635, 'MT505', 'TANKLOCK BAG THERMOFOR METRO', NULL, '125.00', 0, 10, 23, 51, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(636, 'RBP02', 'RIDER TECH BACKPACK 15LT 02', NULL, '101.00', 0, 10, 23, 46, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(637, 'RWB04', 'RIDE TECH WAIST BAG 3L', NULL, '43.00', 0, 10, 23, 49, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(638, 'ST601', 'PAIR EASY LOCK THERMOFORMED', '1520078525_ST601.jpg', '784.00', 0, 10, 23, 59, 'a', '2018-03-03 18:03:02', '2018-03-03 12:02:40', 0),
(639, 'ST602', 'TANKLOCK SYSTEM 4LT', '1520078518_ST602.jpg', '147.00', 0, 10, 23, 51, 'a', '2018-03-03 18:03:02', '2018-03-03 12:02:27', 0),
(640, 'ST603', 'TANK LOCK SYSTEM 15LTR', '1520078510_ST603.jpg', '182.00', 0, 10, 23, 51, 'a', '2018-03-03 18:03:02', '2018-03-03 12:02:20', 0),
(641, 'ST605', 'NEW TANK LOCK BAG 5L', '1520078499_ST605.jpg', '211.00', 0, 10, 23, 51, 'o', '2018-03-03 18:03:02', '2018-03-03 12:02:12', 0),
(642, 'SV200', 'SADDLE BAGS', NULL, '179.00', 0, 10, 23, 59, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(643, 'SV201', 'PAIR OF SADDLE BAGST T469', NULL, '217.00', 0, 10, 23, 59, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(644, 'T409', 'BAG T409 TANK MAGNETIC GIVI', NULL, '86.00', 0, 10, 23, 51, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(645, 'T443B', 'PAIR OF SADDLE BAGS', '1520078464_T443B.jpg', '95.00', 0, 10, 23, 16, 'a', '2018-03-03 18:03:02', '2018-03-03 12:01:08', 0),
(646, 'T445', 'SOFT BAG FOR QUAD', '1520078442_T445.jpg', '256.00', 0, 10, 23, 16, 'o', '2018-03-03 18:03:02', '2018-03-03 12:00:47', 0),
(647, 'T465', 'SHOULDER STRAP COMPUTER BAG', '1520078417_T465_01.jpg', '131.00', 0, 10, 23, 16, 'o', '2018-03-03 18:03:02', '2018-03-03 12:00:21', 0),
(648, 'T466', 'SHOULDER BAG', NULL, '97.00', 0, 10, 23, 16, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(649, 'T467', 'COMPUTER BAG MKEY/MLOCK', NULL, '181.00', 0, 10, 23, 4, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(650, 'T468B', 'REMOVABLE INTERNAL BAGS FOR', '1520078379_T468B.jpg', '56.00', 0, 10, 23, 17, 'a', '2018-03-03 18:03:02', '2018-03-03 11:59:43', 0),
(651, 'T473', 'SADDLE BAG WTRPROOF RAIN COV.', NULL, '74.00', 0, 10, 23, 50, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(652, 'T474', 'XTREEM SADLE BAGS', NULL, '207.00', 0, 10, 23, 50, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(653, 'T475', 'XTREEM MAGNETIC TANK BAG', NULL, '186.00', 0, 10, 23, 51, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(654, 'T484B', 'INTERNAL BAG FOR TREKKER CASE', '1520078354_T484B.jpg', '75.00', 0, 10, 23, 17, 'a', '2018-03-03 18:03:02', '2018-03-03 11:59:20', 0),
(655, 'T486', 'TANK BAG X-TREAM', NULL, '123.00', 0, 10, 23, 51, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(656, 'T486SM', 'TANK BAG XSTREAM', NULL, '123.00', 0, 10, 23, 51, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(657, 'T490', 'INTERNAL BAG FOR TRK52N CASE', '1520078332_T490.jpg', '81.00', 0, 10, 23, 17, 'a', '2018-03-03 18:03:02', '2018-03-03 11:58:57', 0),
(658, 'T496', 'TUNNEL EASY BAG 22LT', NULL, '74.00', 0, 10, 23, 16, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(659, 'T499', 'INTERNAL BAG X TRK OUTFIT 35L', NULL, '95.00', 0, 10, 23, 17, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(660, 'T499B', 'INTERNAL BAG TRK OUTBACK 35LT', NULL, '103.00', 0, 10, 23, 17, 'o', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(661, 'T502', 'REMOVABLE INTERNAL BAGS FOR', '1520078047_T502.jpg', '63.00', 0, 10, 23, 17, 'o', '2018-03-03 18:03:02', '2018-03-03 11:55:36', 0),
(662, 'T504', 'INTERNAL BAG TRK OUTBACK 48LT', NULL, '123.00', 0, 10, 23, 16, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(663, 'T505', 'REMOVABLE INTERNAL BAGS FOR', '1520078074_T505.jpg', '65.00', 0, 10, 23, 16, 'o', '2018-03-03 18:03:02', '2018-03-03 11:55:20', 0),
(664, 'T506', 'INTERNAL BAG TRK OUTBACK 37LT', '1520078081_T506.jpg', '80.00', 0, 10, 23, 17, 'a', '2018-03-03 18:03:02', '2018-03-03 11:55:28', 0),
(665, 'T507', 'INTERNAL BAG TRK OUTBACK 48LT', '1520078093_T507.jpg', '88.00', 0, 10, 23, 17, 'a', '2018-03-03 18:03:02', '2018-03-03 11:55:09', 0),
(666, 'T511', 'INTERNAL BAG TRK OUTBACK 42LT', '1520078225_T511.jpg', '82.00', 0, 10, 23, 17, 'a', '2018-03-03 18:03:02', '2018-03-03 11:57:57', 0),
(667, 'T512', 'INTERNAL BAG TRK OUTBACK 58LT', '1520078232_T512.jpg', '91.00', 0, 10, 23, 17, 'a', '2018-03-03 18:03:02', '2018-03-03 11:57:51', 0),
(668, 'T513', 'SET BAGS FOR ENGINE GUARD', '1520078243_T513.jpg', '138.00', 0, 10, 23, 16, 'a', '2018-03-03 18:03:02', '2018-03-03 11:57:44', 0),
(669, 'T514', 'INTERNAL BAG DOLOMITI', '1520078254_T514.jpg', '65.00', 0, 10, 23, 17, 'o', '2018-03-03 18:03:02', '2018-03-03 11:57:38', 0),
(670, 'TW01', 'ROLL TAIL WATERPROOF BAG 40LT', NULL, '147.00', 0, 10, 23, 60, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(671, 'TW03', 'WATERPROOF RUCKSACK 35LT', NULL, '161.00', 0, 10, 23, 60, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(672, 'TW04', 'WATERPROOF BAG 80LT', NULL, '194.00', 0, 10, 23, 60, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(673, 'TW05', 'WATERPROOF LEGBAG', NULL, '30.00', 0, 10, 23, 60, 'a', '2018-03-03 18:03:02', '2018-03-03 10:03:03', 0),
(674, 'UT801', 'TAIL ROLL ULTIMA 30LT W PROOF', '1520077556_UT801.jpg', '87.00', 0, 10, 23, 61, 'a', '2018-03-03 18:03:03', '2018-03-03 11:48:54', 0),
(675, 'UT802', 'RUCKSACK ULTIMA 35LT W PROOF', '1520077570_UT802.jpg', '153.00', 0, 10, 23, 61, 'o', '2018-03-03 18:03:03', '2018-03-03 11:49:02', 0),
(676, 'UT803', 'TAIL ROLL ULTIMA 40LT W PROOF', '1520077578_UT803.jpg', '133.00', 0, 10, 23, 61, 'a', '2018-03-03 18:03:03', '2018-03-03 11:48:37', 0),
(677, 'UT804', 'Waterproof Cargo bag, 80 ltr.', '1520077586_UT804.jpg', '158.00', 0, 10, 23, 61, 'o', '2018-03-03 18:03:03', '2018-03-03 11:48:30', 0),
(678, 'UT806', 'TAIL BAG ULTIMA 55LT W PROOF', '1520077635_UT806.jpg', '380.00', 0, 10, 23, 61, 'a', '2018-03-03 18:03:03', '2018-03-03 11:48:22', 0),
(679, 'UT807', 'CARGO BAG ULTIMA 25LT W PROOF', '1520077648_UT807.jpg', '181.00', 0, 10, 23, 61, 'a', '2018-03-03 18:03:03', '2018-03-03 11:48:14', 0),
(680, 'UT808', 'SADDLE BAG ULTIMA 25LT W PROOF', '1520077648_UT808.jpg', '327.00', 0, 10, 23, 61, 'o', '2018-03-03 18:03:03', '2018-03-03 11:51:51', 0),
(681, 'WP400', 'TAIL ROLL WATERPROOF BAG 40LT', NULL, '112.00', 0, 10, 23, 60, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(682, 'WP401', 'WATERPROOF BAG 80LT', NULL, '131.00', 0, 10, 23, 60, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(683, 'WP402', 'TAIL ROLL WATERPROOF BAG 30LT', NULL, '78.00', 0, 10, 23, 60, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(684, 'WP403', 'WATERPROOF RUCKSACK 35LT', NULL, '122.00', 0, 10, 23, 60, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(685, 'WP404', 'WATERPROOF LEG BAG', NULL, '37.00', 0, 10, 23, 60, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(686, 'WP405', 'HI-VISIBILITY SADDLE BAGS', NULL, '200.00', 0, 10, 23, 60, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(687, 'WP406', 'HI-VISIBILITY TAIL PACK', NULL, '109.00', 0, 10, 23, 60, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(688, 'WP407', 'TAIL ROLL WATERPROOF BAG 30LT', NULL, '71.00', 0, 10, 23, 60, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(689, 'X1850', 'GIVI KEYHOLDER BAG', NULL, '5.00', 0, 10, 23, 62, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(690, 'XS1110R', 'TOOLS BAG H.CROSSTOURER 1200', '1520077502_XS1110R.jpg', '55.00', 0, 10, 23, 62, 'o', '2018-03-03 18:03:03', '2018-03-03 11:45:07', 0),
(691, 'XS305', 'TAIL BAG EXPANDABLE TO 60 LT.', NULL, '266.00', 0, 10, 23, 62, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(692, 'XS306', 'TANKLOCK XSTREAM BAG 25 LT', NULL, '183.00', 0, 10, 23, 62, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(693, 'XS307', 'EXTENSIBLE TANKLOCK BAG 15LT', NULL, '166.00', 0, 10, 23, 62, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(694, 'XS308', 'EXTENSIBLE TANKLOCK BAG 20LT', '1520077458_XS308.jpg', '202.00', 0, 10, 23, 62, 'a', '2018-03-03 18:03:03', '2018-03-03 11:44:22', 0),
(695, 'XS309', 'XSTREAM BUMBAG', NULL, '70.00', 0, 10, 23, 62, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(696, 'XS310B', 'CARGO BAG EXTREAM W/SITTING K', NULL, '117.00', 0, 10, 23, 62, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(697, 'XS310BB', 'CARGO BAG EXTREME', NULL, '209.00', 0, 10, 23, 62, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(698, 'XS311', 'XTREAM TANK BAG', NULL, '189.00', 0, 10, 23, 62, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(699, 'XS312', 'XTREAM TANK BAG', '1520077386_XS312.jpg', '171.00', 0, 10, 23, 62, 'a', '2018-03-03 18:03:03', '2018-03-03 11:43:38', 0),
(700, 'XS313', 'TAIL PACK XSTREAM', '1520077379_XS313.jpg', '122.00', 0, 10, 23, 62, 'a', '2018-03-03 18:03:03', '2018-03-03 11:43:29', 0),
(701, 'XS314', 'XTREAM SADDLE BAGS', NULL, '275.00', 0, 10, 23, 62, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(702, 'XS315', 'TOOLS BAG BMW R1200GS (2013)', '1520077370_XS315.jpg', '92.00', 0, 10, 23, 62, 'a', '2018-03-03 18:03:03', '2018-03-03 11:43:22', 0),
(703, 'XS316', 'TAIL PACK XSTREAM', '1520077361_XS316.jpg', '185.00', 0, 10, 23, 62, 'a', '2018-03-03 18:03:03', '2018-03-03 11:43:15', 0),
(704, 'XS317', 'RUCKSACK XSTREAM', '1520077337_XS317.jpg', '189.00', 0, 10, 23, 62, 'a', '2018-03-03 18:03:03', '2018-03-03 11:42:21', 0),
(705, 'XS318', 'CENTRAL OR TAIL BAG', '1520077316_XS318.jpg', '142.00', 0, 10, 23, 62, 'a', '2018-03-03 18:03:03', '2018-03-03 11:42:02', 0),
(706, 'XS319', 'TANK BAG XSTREAM', NULL, '79.00', 0, 10, 23, 62, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(707, 'XS320', 'TANKLOCK FOR CRF1000L AFRICAN', NULL, '205.00', 0, 10, 23, 62, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(708, 'XS5112E', 'ENGINE GUARD BAGS BMW R1200GS', '1520077225_XS5112E.jpg', '98.00', 0, 10, 23, 62, 'o', '2018-03-03 18:03:03', '2018-03-03 11:40:31', 0),
(709, 'XS5112R', 'TOOLS BAG BMW R1200GS ADV.14', '1520077196_XS5112R.jpg', '49.00', 0, 10, 23, 62, 'o', '2018-03-03 18:03:03', '2018-03-03 11:40:01', 0),
(710, '3D600', 'PAIR OF SADDLEBAGS THERMOFORM', NULL, '429.00', 0, 10, 24, 63, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(711, '3D603', 'TANK BAG 3D603 TANKLOCK SYST.', NULL, '125.00', 0, 10, 24, 51, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(712, '3D604', 'EXTENSIBLE TANKLOCK BAG 15LT', NULL, '162.00', 0, 10, 24, 51, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(713, '4506FR', 'SMOKED REFLECTORS', NULL, '72.00', 0, 10, 25, 64, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(714, '7401SRAKITR', 'Screw kit for SRA7401', NULL, '29.00', 0, 10, 25, 3, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(715, 'CV47B508', 'V47 COVER STANDARD BLUE', NULL, '70.00', 0, 10, 25, 65, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(716, 'CV47B912', 'V47 COVER WHITE', NULL, '70.00', 0, 10, 25, 65, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(717, 'CV47B913', 'V47 COVER WHITE', NULL, '70.00', 1, 10, 25, 65, 'o', '2018-03-03 18:03:03', '2018-03-08 04:54:02', 0),
(718, 'CV47B928', 'V47 COVER SUZUKI WHITE BURGMAN', NULL, '70.00', 0, 10, 25, 65, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(719, 'CV47G126', 'V47 COVER FLUO YELLOW', NULL, '70.00', 0, 10, 25, 65, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(720, 'CV47G730', 'V47 COVER PAINTED SILVER', NULL, '70.00', 0, 10, 25, 65, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(721, 'CV47G807', 'V47 COVER GREY', NULL, '70.00', 0, 10, 25, 65, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(722, 'CV47N', 'V47 COVER BLACK', NULL, '22.00', 0, 10, 25, 65, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(723, 'CV47N902', 'V47 COVER PAINTED BLACK', NULL, '70.00', 0, 10, 25, 65, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(724, 'CV47R300', 'V47 COVER RED', NULL, '70.00', 0, 10, 25, 65, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(725, 'E114', 'INNER LINING FOR TOPCASE E55', NULL, '51.00', 0, 10, 25, 66, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(726, 'E115F', 'JUNCTION KIT BAG LUGGAGE MONOR', NULL, '29.00', 0, 10, 25, 4, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(727, 'E115F2', 'JUNCTION KIT BAG LUGGAGE MRACK', NULL, '21.00', 0, 10, 25, 4, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(728, 'E115F5', 'CASE LOCK - MULTIRACK', NULL, '14.00', 0, 10, 25, 4, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(729, 'E121', 'UNIV.ADAPTOR PLATE MONOKEY', NULL, '54.00', 0, 10, 25, 4, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(730, 'E125', 'FOUR RINGS KIT FOR T10N', NULL, '11.00', 0, 10, 25, 16, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(731, 'E410G730', 'PAIR OF OPENING LIDS SLVR', NULL, '301.00', 0, 10, 25, 67, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(732, 'E410N902', 'PAIR OF PAINTED OPENING LIDS', NULL, '244.00', 0, 10, 25, 67, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(733, 'SL101', 'SET SECURITY LOCK KEY', NULL, '21.00', 0, 10, 25, 4, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(734, 'SL102', 'SECURITY UNIFICATION LOCK KEY', NULL, '42.00', 0, 10, 25, 4, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(735, 'SL103', 'SECURITY UNIFICATION LOCK KEY', NULL, '63.00', 0, 10, 25, 4, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(736, 'SL105', 'LOCK KEY 5 SET', NULL, '108.00', 0, 10, 25, 4, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(737, 'SL450', 'STOPLAMP W/O LIGHT', NULL, '33.00', 0, 10, 25, 68, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(738, 'SR-NMAX150', 'SPEC RACK YAHAMA NMAX 150', NULL, '95.00', 0, 10, 26, 69, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(739, 'BF01', 'METAL FLANGE EASYLOCK TANK BAG', NULL, '17.00', 0, 10, 27, 70, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(740, 'BF02', 'METAL FLANGE EASYLOCK TANK BAG', NULL, '17.00', 0, 10, 27, 70, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(741, 'BF03', 'METAL FLANGE EASYLOCK TANK BAG', NULL, '17.00', 0, 10, 27, 70, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(742, 'BF04', 'METAL FLANGE EASYLOCK TANK BAG', NULL, '17.00', 0, 10, 27, 70, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(743, 'BF05', 'METAL FLANGE EASYLOCK TANK BAG', NULL, '17.00', 0, 10, 27, 70, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(744, 'BF06', 'FLANGE-TANKLOCK BAG BMW', NULL, '18.00', 0, 10, 27, 70, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(745, 'BF07', 'FLANGE-TANKLOCK BAG BMW', NULL, '18.00', 0, 10, 27, 70, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(746, 'BF08', 'SPECIFIC FLANGE X TANKLOCK BAG', NULL, '17.00', 0, 10, 27, 70, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(747, 'BF09', 'SPECIFIC FLANGE X TANKLOCK BAG', NULL, '34.00', 0, 10, 27, 70, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(748, 'BF10', 'SPECIFIC FLANGE X TANKLOCK BAG', NULL, '17.00', 0, 10, 27, 70, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(749, 'BF11', 'METAL FLANGE FOR EASY LOCKTANK', NULL, '17.00', 0, 10, 27, 70, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(750, 'BF12', 'METAL FLANGE KTM DUKE 125 \'11', NULL, '17.00', 0, 10, 27, 70, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(751, 'BF13', 'METAL FLANGE BMW R1200GS ADV', NULL, '18.00', 0, 10, 27, 70, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(752, 'BF14', 'SPECIFIC FLANGE X TANKLOCK BAG', NULL, '20.00', 0, 10, 27, 70, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(753, 'BF15', 'SPECIFIC FLANGE X TANKLOCK BAG', NULL, '62.00', 0, 10, 27, 70, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(754, 'BF16', 'SPECIFIC FLANGE X TANKLOCK BAG', NULL, '62.00', 0, 10, 27, 70, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(755, 'BF17', 'METAL FLANGE EASYLOCK TANK BAG', NULL, '17.00', 0, 10, 27, 70, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0);
INSERT INTO `mah_product` (`id`, `name`, `desc`, `image`, `price`, `interested`, `brand`, `cate`, `type`, `status`, `created`, `modified`, `ctl`) VALUES
(756, 'BF18', 'METAL FLANGE EASYLOCK TANK BAG', NULL, '17.00', 0, 10, 27, 70, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(757, 'BF19', 'METAL FLANGE EASYLOCK TANK BAG', NULL, '48.00', 0, 10, 27, 70, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(758, 'BF20', 'METAL FLANGE EASYLOCK TANK BAG', NULL, '17.00', 0, 10, 27, 70, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(759, 'BF21', 'METAL FLANGE EASYLOCK TANK BAG', NULL, '48.00', 0, 10, 27, 70, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(760, 'BF22', 'SPECIFIC FLANGE FOR FITTING', NULL, '17.00', 0, 10, 27, 70, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(761, 'BF23', 'SPEC.FLANGE FOR FITTING TANKLO', NULL, '20.00', 0, 10, 27, 70, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(762, 'BF24', 'METAL FLANGE XSR700 2016', NULL, '63.00', 0, 10, 27, 70, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(763, 'BF25', 'TANK LOCK RING XS320', NULL, '27.00', 0, 10, 27, 70, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(764, 'BF26', 'METAL FLANGE VERSYS 650 15-16', NULL, '35.00', 0, 10, 27, 70, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(765, 'BF27', 'METAL FLANGE MT-10 2016', NULL, '18.00', 0, 10, 27, 70, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(766, 'BF28', 'METAL FLANGE FOR Z650', NULL, '18.00', 0, 10, 27, 70, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(767, 'S250', 'TOOL BOX', '1520077147_S250.jpg', '117.00', 0, 10, 28, 16, 'a', '2018-03-03 18:03:03', '2018-03-03 11:39:13', 0),
(768, 'S250KIT', 'UNIVERSAL FITTING S250', '1520077121_S250kit_01.jpg', '86.00', 0, 10, 28, 3, 'a', '2018-03-03 18:03:03', '2018-03-03 11:38:46', 0),
(769, 'B27N', 'CLACK BLACK BOX W/O LIGHT', NULL, '86.00', 0, 10, 29, 5, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(770, 'B27NMAL', 'MONOLOCK CASE B27N BLACK', '1520077066_B27NMAL.jpg', '85.00', 0, 10, 29, 5, 'o', '2018-03-03 18:03:03', '2018-03-03 11:37:51', 0),
(771, 'B32N', '32LTR BOLD MONOLOCK TOPCASE', NULL, '93.00', 0, 10, 29, 5, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(772, 'B33NMK', 'B33 TOPBOX - MONOKEY VERSION', NULL, '199.00', 0, 10, 29, 4, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(773, 'B33NMKLUX', 'B33 TOPBOX - MONOKEY VERS. LUX', NULL, '217.00', 0, 10, 29, 4, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(774, 'B33NML', 'B33 TOPBOX - MONOLOCK VERSION', NULL, '159.00', 0, 10, 29, 5, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(775, 'B340N', 'Monolock Topbox ', NULL, '190.00', 0, 10, 29, 5, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(776, 'B340NT', 'Monolock Topbox ', NULL, '190.00', 0, 10, 29, 5, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(777, 'B34N', 'B34 MONOLOCK TOPBOX', '1520077024_B34.jpg', '190.00', 0, 10, 29, 5, 'a', '2018-03-03 18:03:03', '2018-03-03 11:37:10', 0),
(778, 'B34NT', 'B34 MONOLOCK TECH V TOPBOX', '1520076992_B34_TECH.jpg', '190.00', 0, 10, 29, 5, 'a', '2018-03-03 18:03:03', '2018-03-03 11:36:38', 0),
(779, 'B360N', 'MONOLOCK BOX 36L', NULL, '189.00', 0, 10, 29, 5, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(780, 'B360NT', 'Monolock Topbox ', NULL, '189.00', 0, 10, 29, 5, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(781, 'B37N', 'B37 TOPBOX - MONOLOCK VERSION', '1520076963_B37.jpg', '192.00', 0, 10, 29, 5, 'a', '2018-03-03 18:03:03', '2018-03-03 11:36:07', 0),
(782, 'B37NLUX', 'B37 TOPBOX - MONOLOCK VER. LUX', NULL, '309.00', 0, 10, 29, 5, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(783, 'B37NT', 'B37 TOPBOX - MONOLOCK VERSION', '1520076932_B37_TECH.jpg', '192.00', 0, 10, 29, 5, 'a', '2018-03-03 18:03:03', '2018-03-03 11:35:39', 0),
(784, 'B37NTLUX', 'B37 TOPBOX - MONOLOCK VERSION', NULL, '309.00', 0, 10, 29, 5, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(785, 'B47NML', 'MONOLOCK CASE 47LT', '1520076882_B47_SILVER.jpg', '261.00', 0, 10, 29, 64, 'a', '2018-03-03 18:03:03', '2018-03-03 11:34:46', 0),
(786, 'B47NTML', 'MONOLOCK CASE 47LT TECH', '1520076853_B47_TECH.jpg', '261.00', 0, 10, 29, 64, 'a', '2018-03-03 18:03:03', '2018-03-03 11:34:18', 0),
(787, 'C340B508', 'E340 COVER STANDARD BLUE', NULL, '46.00', 0, 10, 29, 65, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(788, 'C340B588', 'E340 COVER BLUE MIDNIGHT', NULL, '46.00', 0, 10, 29, 65, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(789, 'C340B912', 'E340 COVER METAL.STD WHITE', NULL, '46.00', 0, 10, 29, 65, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(790, 'C340G730', 'E340 COVER SILVER METAL', NULL, '46.00', 0, 10, 29, 65, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(791, 'C340N902', 'E340 COVER BLACK METAL', NULL, '46.00', 0, 10, 29, 65, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(792, 'C340N902SL', 'B34 Top Box Cover', NULL, '45.00', 0, 10, 29, 65, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(793, 'C340NL', 'COVER SMOOTH BLACK E340', NULL, '20.00', 0, 10, 29, 65, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(794, 'C35A900', 'V35 COVER PAINTED SILVER', NULL, '107.00', 0, 10, 29, 65, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(795, 'C35B912', 'COVER METALLIZED (CP) WHITE', NULL, '107.00', 0, 10, 29, 65, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(796, 'C35B915', 'V35 Side Box Cover', NULL, '107.00', 0, 10, 29, 65, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(797, 'C35G126', 'V35 COVER PAINTED YELLOW', NULL, '110.00', 0, 10, 29, 65, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(798, 'C35G730', 'V35 COVER PAINTED SILVER', NULL, '107.00', 0, 10, 29, 65, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(799, 'C35N', 'V35 COVER BLACK', NULL, '41.00', 0, 10, 29, 65, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(800, 'C35N902', 'V35 COVER PAINTED BLACK', NULL, '107.00', 0, 10, 29, 65, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(801, 'C370B508', 'E370 COVER STANDARD BLUE', NULL, '73.00', 0, 10, 29, 65, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(802, 'C370B578', 'E370 COVER PEARL MONTANA BLUE', NULL, '73.00', 0, 10, 29, 65, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(803, 'C370B912', 'E370 COVER METAL.STD WHITE', NULL, '76.00', 0, 10, 29, 65, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(804, 'C370B913', 'E370 COVER METAL.STD WHITE', NULL, '76.00', 0, 10, 29, 65, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(805, 'C370G730', 'E370 COVER STANDARD SILVER', NULL, '73.00', 0, 10, 29, 65, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(806, 'C370N', 'E370 COVER BLACK', NULL, '25.00', 0, 10, 29, 65, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(807, 'C370N902', 'E370 COVER STANDARD BLACK', NULL, '73.00', 0, 10, 29, 65, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(808, 'C37B508', 'B37 COVER STANDARD BLUE', NULL, '78.00', 0, 10, 29, 65, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(809, 'C37B912', 'B37 COVER METAL.STD WHITE', NULL, '80.00', 0, 10, 29, 65, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(810, 'C37G730', 'B37 COVER STANDARD SILVER', NULL, '78.00', 0, 10, 29, 65, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(811, 'C37N902', 'B37 COVER STANDARD BLACK', NULL, '78.00', 0, 10, 29, 65, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(812, 'C46A900', 'V46 COVER PAINTED SILVER', NULL, '79.00', 0, 10, 29, 65, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(813, 'C46B508', 'COVERTOP V46 BLUE C46B508', NULL, '116.00', 0, 10, 29, 65, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(814, 'C46B912', 'V46 COVER WHITE', NULL, '91.00', 0, 10, 29, 65, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(815, 'C46B913', 'V46 COVER WHITE', NULL, '91.00', 0, 10, 29, 65, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(816, 'C46B915', 'V46 COVER SUZUKI WHITE', NULL, '91.00', 0, 10, 29, 65, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(817, 'C46G730', 'V46 COVER PAINTED SILVER', NULL, '79.00', 0, 10, 29, 65, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(818, 'C46N', 'V46 COVER BLACK', NULL, '27.00', 0, 10, 29, 65, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(819, 'C46N902', 'V46 COVER PAINTED BLACK', NULL, '79.00', 0, 10, 29, 65, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(820, 'C46N926', 'V46 COVER BLACK PEARL', NULL, '91.00', 0, 10, 29, 65, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(821, 'C46NL', 'V46 COVER BLACK', NULL, '27.00', 0, 10, 29, 65, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(822, 'C46R301', 'V46 COVER PAINTED STANDARD RED', NULL, '79.00', 0, 10, 29, 65, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(823, 'C46R344', 'V46 COVER LAVA RED YAMAHA', NULL, '91.00', 0, 10, 29, 65, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(824, 'C46R358', 'V46 COVER CANDY GRACEFUL RED', NULL, '91.00', 0, 10, 29, 65, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(825, 'C470B912', 'E470 COVER METAL WHITE', NULL, '83.00', 0, 10, 29, 65, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(826, 'C470B913', 'E470 COVER WHITE METAL.STD Y', NULL, '83.00', 0, 10, 29, 65, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(827, 'C470B916', 'E470 COVER PEARL SUNBEAM WHITE', NULL, '83.00', 0, 10, 29, 65, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(828, 'C470G730', 'E470 COVER STANDARD SILVER', NULL, '83.00', 0, 10, 29, 65, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(829, 'C470N', 'E470 COVER BLACK', NULL, '30.00', 0, 10, 29, 65, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(830, 'C470N902', 'E470 COVER STANDARD BLACK', NULL, '83.00', 0, 10, 29, 65, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(831, 'C470NL', 'E470 COVER BLACK SMOOTH', NULL, '30.00', 0, 10, 29, 65, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(832, 'C470R301', 'E470 COVER STANDARD METAL RED', NULL, '83.00', 0, 10, 29, 65, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(833, 'C47B912', 'B47 COLOURED COVER', NULL, '85.00', 0, 10, 29, 65, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(834, 'C47B913', 'B47 COLOURED COVER', NULL, '85.00', 0, 10, 29, 65, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(835, 'C47B915', 'B47 COVER SUZUKI WHITE', NULL, '85.00', 0, 10, 29, 65, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(836, 'C47G730', 'B47 COLOURED COVER', NULL, '85.00', 0, 10, 29, 65, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(837, 'C47N902', 'B47 COLOURED COVER', NULL, '85.00', 0, 10, 29, 65, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(838, 'C47R301', 'B47 COLOURED COVER', NULL, '85.00', 0, 10, 29, 65, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(839, 'C55A900', 'E55 COVER PAINTED SILVER', NULL, '78.00', 0, 10, 29, 65, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(840, 'C55B508', 'E55 COVER PAINTED BLUE', NULL, '78.00', 0, 10, 29, 65, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(841, 'C55B912', 'V35 Side Box Cover', NULL, '78.00', 0, 10, 29, 65, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(842, 'C55B915', 'V35 Side Box Cover', NULL, '78.00', 0, 10, 29, 65, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(843, 'C55G730', 'E55 COVER PAINTED SILVER', NULL, '78.00', 0, 10, 29, 65, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(844, 'C55G768', 'E55 COVER PAINTED SMOKY GREY', NULL, '78.00', 0, 10, 29, 65, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(845, 'C55N901', 'E55 COVER STANDARD BLACK', NULL, '78.00', 0, 10, 29, 65, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(846, 'C55N902', 'E55 COVER PAINTED BLACK', NULL, '78.00', 0, 10, 29, 65, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(847, 'C55NL', 'E55 RAW COVER NO EMBLEM', NULL, '30.00', 0, 10, 29, 65, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(848, 'C55R301', 'E55 COVER STANDARD METAL RED', NULL, '78.00', 0, 10, 29, 65, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(849, 'CY14N', 'CASE 14LT FOR CITY BIKE', NULL, '56.00', 0, 10, 29, 71, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(850, 'CY25N', 'CASE 25LT FOR CITY BIKE', NULL, '64.00', 0, 10, 29, 71, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(851, 'DLM46A', 'TREKKER DOLOMITI 46LT', NULL, '530.00', 0, 10, 29, 4, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(852, 'E300B', 'TOPCASE E300B WHITE', NULL, '91.00', 0, 10, 29, 5, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(853, 'E300N2', 'BK TOP CASE 30LT MICRO 2 HINGE', '1520076804_E300N2.jpg', '95.00', 0, 10, 29, 5, 'a', '2018-03-03 18:03:03', '2018-03-03 11:33:31', 0),
(854, 'E300NT2', 'BK TOP CASE 30LT MICRO 2 HINGE', '1520076776_E300NT2.jpg', '95.00', 0, 10, 29, 5, 'a', '2018-03-03 18:03:03', '2018-03-03 11:33:01', 0),
(855, 'E33N', 'GIVI BOXTOP E33NPOINT W/O LGTH', NULL, '72.00', 0, 10, 29, 5, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(856, 'E340N', 'E340 TOPCASE BLACK', '1520076699_E340.jpg', '140.00', 0, 10, 29, 5, 'a', '2018-03-03 18:03:03', '2018-03-03 11:32:01', 0),
(857, 'E340NT', 'E340 TOPCASE BLACK TECH', '1520076672_E340_TECH.jpg', '140.00', 0, 10, 29, 5, 'a', '2018-03-03 18:03:03', '2018-03-03 11:32:01', 0),
(858, 'E360N', 'E360 TCASE/PAN BLACK', NULL, '146.00', 0, 10, 29, 5, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(859, 'E370N', 'E370 TOPCASE BLACK', NULL, '162.00', 0, 10, 29, 5, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(860, 'E370NS', 'E370 TOPCASE BLACK WITHOUT', NULL, '152.00', 0, 10, 29, 5, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(861, 'E370NT', 'E370 TOPCASE BLACK TECH', NULL, '162.00', 0, 10, 29, 5, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(862, 'E43NML-ADV', 'MULEBOX 43L MONOLOCK TOPCASE', NULL, '163.00', 0, 10, 29, 5, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(863, 'E450N', 'E450 SIMPLY TCASE BLACK', NULL, '131.00', 0, 10, 29, 5, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(864, 'E460N', '46LT MKEY TCASE/PAN BLACK', NULL, '159.00', 0, 10, 29, 4, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(865, 'E470B906', 'TOPCASE E470 WHITE WO/LIGHT', NULL, '268.00', 0, 10, 29, 5, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(866, 'E470G730', 'TOPCASE E470 SILVER', NULL, '268.00', 0, 10, 29, 5, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(867, 'E470N902', 'TOPCASE METALIC BLACK E470', NULL, '268.00', 0, 10, 29, 5, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(868, 'E55N', 'E55 TOPCASE BLACK EMBOSSED', NULL, '438.00', 0, 10, 29, 4, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(869, 'E55NT', 'BLACK TECH MAXIA 3 E55 TOPCASE', NULL, '438.00', 0, 10, 29, 4, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(870, 'OBK110', 'TRK  OUTBACK ALU 110L ATV', NULL, '838.00', 0, 10, 29, 30, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(871, 'OBK42A', 'TREKKER OUTBACK 42LT ALUMINUM', '1520076585_TRK_OBK_42_SILVER_1.jpg', '525.00', 0, 10, 29, 30, 'a', '2018-03-03 18:03:03', '2018-03-03 11:29:52', 0),
(872, 'OBK42B', 'TREKKER OUTBACK 42LT BLACK', '1520076527_TRK_OBK_42_BLACK_1.jpg', '577.00', 0, 10, 29, 30, 'a', '2018-03-03 18:03:03', '2018-03-03 11:28:53', 0),
(873, 'OBK58A', 'TREKKER OUTBACK 58LT ALUMINUM', '1520076458_TRK_OBK_58_SILVER_1.jpg', '658.00', 0, 10, 29, 30, 'a', '2018-03-03 18:03:03', '2018-03-03 11:27:46', 0),
(874, 'OBK58B', 'TREKKER OUTBACK 58LT BLACK', '1520076387_TRK_OBK_58_BLACK_1.jpg', '723.00', 0, 10, 29, 30, 'a', '2018-03-03 18:03:03', '2018-03-03 11:27:08', 0),
(875, 'S410', 'Trolley Baseplate', '1520076271_S410.jpg', '209.00', 0, 10, 29, 4, 'o', '2018-03-03 18:03:03', '2018-03-03 11:24:40', 0),
(876, 'TRK46PACK2', 'TREKKER SIDE-CASE 46 LT SET 2P', NULL, '881.00', 0, 10, 29, 72, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(877, 'TRK52B', 'TREKKER MONOKEY CASE 52 LT', '1520076180_TRK_52_BLACK.jpg', '468.00', 0, 10, 29, 72, 'a', '2018-03-03 18:03:03', '2018-03-03 11:23:13', 0),
(878, 'TRK52N', 'TREKKER MONOKEY CASE 52 LT', '1520076113_TRK_52_SILVER_1.jpg', '449.00', 0, 10, 29, 72, 'a', '2018-03-03 18:03:03', '2018-03-03 11:22:08', 0),
(879, 'V40N', 'V40 TOPCASE RED TECH', NULL, '211.00', 0, 10, 29, 73, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(880, 'V40NT', 'V40 TOPCASE BLACK TECH', NULL, '211.00', 0, 10, 29, 73, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(881, 'V46N', '46LT MKEY TCASE UNPAINT. BLACK', '1520075813_V46_N_1.jpg', '342.00', 0, 10, 29, 73, 'o', '2018-03-03 18:03:03', '2018-03-03 11:17:02', 0),
(882, 'V46NT', '46LT MKEY TCASE UNPAINT. BLACK', '1520075802_V46_NT.jpg', '342.00', 0, 10, 29, 73, 'o', '2018-03-03 18:03:03', '2018-03-03 11:17:09', 0),
(883, 'V47N', 'MONOKEY CASE 47LT', NULL, '398.00', 0, 10, 29, 73, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(884, 'V47NLUX', 'MONOKEY CASE 47LT VERS. LUX', NULL, '483.00', 0, 10, 29, 73, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(885, 'V47NN', 'MONOKEY CASE 47LT BLACK COVER', NULL, '364.00', 0, 10, 29, 73, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(886, 'V47NNT', 'MONOKEY CASE 47LT BLACK COVER', NULL, '364.00', 0, 10, 29, 73, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(887, 'V47NNTFL', 'MONOKEY CASE 47LT TECH FLUO', NULL, '426.00', 0, 10, 29, 73, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(888, 'V47NT', 'MONOKEY CASE 47LT TECH', NULL, '398.00', 0, 10, 29, 73, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(889, 'V47NTLUX', 'MONOKEY CASE 47LT', NULL, '483.00', 0, 10, 29, 73, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(890, 'V56N', '56LT MKEY TCASE UNPAINT. BLACK', NULL, '516.00', 0, 10, 29, 73, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(891, 'V56NN', '56LT MKEY TCASE UNPAINT. BLACK', NULL, '482.00', 0, 10, 29, 73, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(892, 'V56NNT', '56LT MKEY TCASE UNPAINT. BLACK', NULL, '482.00', 0, 10, 29, 73, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(893, 'V56NT', '56LT MKEY TCASE UNPAINT. BLACK', NULL, '516.00', 0, 10, 29, 73, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(894, 'TRK33B', 'TREKKER SIDE-CASE 33 LT', NULL, '439.00', 0, 10, 30, 72, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(895, 'TRK33BPACK2', 'TREKKER SIDE-CASE 33 LT SET 2P', NULL, '878.00', 0, 10, 30, 72, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(896, 'TRK33NV', 'SIDE/TOPCASE TREKKER 33', NULL, '421.00', 0, 10, 30, 72, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(897, 'TRK33PACK2', 'TREKKER SIDE-CASE 33 LT SET 2P', NULL, '841.00', 0, 10, 30, 72, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(898, 'TRK33PACK2V', 'TREKKER 33 LITERS PAIR', NULL, '841.00', 0, 10, 30, 72, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(899, 'TRK46B', 'TREKKER SIDE-CASE 46 LT', NULL, '459.00', 0, 10, 30, 72, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(900, 'TRK46BPACK2', 'TREKKER SIDE-CASE 46 LT SET 2P', NULL, '918.00', 0, 10, 30, 72, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(901, 'TRK46NV', 'SIDE/TOPCASE TREKKER 46', NULL, '440.00', 0, 10, 30, 72, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(902, 'EX1SRA', 'ALUMINUM EXTENDABLE BAG HOLDER', '1520075701_EX1SRA.png', '198.00', 0, 10, 31, 4, 'o', '2018-03-03 18:03:03', '2018-03-03 11:15:05', 0),
(903, 'EX2M', 'ALU EXTEND BAG HOLDER M5/M7', '1520075658_EX2M.jpg', '131.00', 0, 10, 31, 4, 'a', '2018-03-03 18:03:03', '2018-03-03 11:14:32', 0),
(904, '1102FZ', 'M/RACK S/ARMSY.H.HORNET 600\'11', NULL, '205.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(905, '1104FZ', 'M/RACK S/ARMSY.H.CROSSR.800\'11', NULL, '212.00', 0, 10, 32, 74, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(906, '1109FZ', 'M/RACK S/ARMS HON.INTEGRA 700', NULL, '137.00', 0, 10, 32, 74, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(907, '1111FZ', 'M/RACK S/ARMS H. NC700X\'12-\'13', NULL, '125.00', 0, 10, 32, 74, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(908, '1121FZ', 'M/RACK S/ARMS HONDA CB500X \'13', NULL, '168.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(909, '1127FZ', 'M/RACK S/ARMS HON.INTEGRA 750', NULL, '143.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(910, '1131FZ', 'M/RACK S/ARMS H.CTX700N DCT\'14', NULL, '223.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(911, '1132FZ', 'M/RACK S/ARMS H.VFR800F (2014)', NULL, '218.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(912, '1133FZ', 'M/RACK S/ARMS H.CTX700 DCT\'14', NULL, '154.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(913, '1137FZ', 'M/RACK S/ARMS HONDA CB650F \'14', NULL, '133.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(914, '1146FZ', 'MONORACK ARM NC750X 2016', NULL, '127.00', 0, 10, 32, 74, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(915, '1156FZ', 'MONORACK X ADV 750', NULL, '196.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(916, '162FZ', 'M/RACK S/ARMS HON.HORNET 600', NULL, '226.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(917, '166FZ', 'M/RACK S/ARMS H.VFR 800\'02.04', NULL, '175.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(918, '2115FZ', 'M/RACK S/ARMS YAMAHA MT-09 \'13', NULL, '139.00', 0, 10, 32, 74, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(919, '2118FZ', 'M/RACK S/ARMS YAMAHA MT-07 \'14', NULL, '205.00', 0, 10, 32, 74, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(920, '2130FZ', 'MONORACK MT-07 2016', NULL, '122.00', 0, 10, 32, 74, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(921, '2132FZ', 'M/RACK ARMS MT-09 \'17', NULL, '181.00', 0, 10, 32, 74, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(922, '227F', 'M/RACK S/ARMS HONDA CBR1000F', NULL, '106.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(923, '229F', 'M/RACK S/ARMS HONDA VFR 750F', NULL, '86.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(924, '232F', 'M/RACK S/ARMS H.CB750 SEV.F.92', NULL, '75.00', 0, 10, 32, 74, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(925, '242F', 'M/RACK S/ARMS HON VFR 750 F 94', NULL, '75.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(926, '248F', 'M/RACK S/ARMS HON.CBR 1100XX', NULL, '75.00', 0, 10, 32, 74, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(927, '249F', 'M/RACK S/ARMS HON.CBR 600\'97', NULL, '111.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(928, '250EKIT', 'KIT FOR PLATE E250', NULL, '13.00', 0, 10, 32, 3, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(929, '250F', 'M/RACK S/ARMS HONDA CB 500\'97', NULL, '110.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(930, '251F', 'M/RACK S/ARMS HONDA VTR1000', NULL, '109.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(931, '252F', 'M/RACK S/ARMS HON.CBR 600F\'04', NULL, '97.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(932, '256FZ', 'M/RACK S/ARMS H.HORNET 900', NULL, '136.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(933, '257FZ', 'M/RACK S/ARMS HON.VFR 800\'01', NULL, '168.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(934, '258FZ', 'M/RACK S/ARMS HON.HORNET 600', NULL, '168.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(935, '259FZ', 'M/RACK S/ARMS HON.CB 1300\'03', NULL, '93.00', 0, 10, 32, 74, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(936, '260FZ', 'M/RACK S/ARMS HON.CBF 600\'04', NULL, '108.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(937, '261FZ', 'M/RACK S/ARMS HON.CBF 250\'04', NULL, '105.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(938, '262FZ', 'M/RACK S/ARMS HON.CBR 125 \'05', NULL, '90.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(939, '263FZ', 'M/RACK S/ARMS H.HORNET 600\'07', NULL, '133.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(940, '265FZ', 'M/RACK S/ARMS HONDA DN-01\'08', NULL, '188.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(941, '266FZ', 'M/RACK S/ARMS HON.CBR 125 \'05', NULL, '186.00', 0, 10, 32, 74, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(942, '267FZ', 'S/ARMS M/RACK HONDA VFR 1200F', NULL, '212.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(943, '268FZ', 'MONORACK SIDEARMS  HONDA', NULL, '126.00', 0, 10, 32, 74, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(944, '297F', 'M/RACK S/ARMS YAM FJ110-1200', NULL, '78.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(945, '3100FZ', 'M/RACK S/ARMS SUZUKI GSR750\'11', NULL, '184.00', 0, 10, 32, 74, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(946, '3110FZ', 'MONORACK SUZ GSX1000', NULL, '177.00', 0, 10, 32, 74, 'a', '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(947, '3110KIT', 'FITTING KIT SUZ GSX1000', NULL, '80.00', 0, 10, 32, 3, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(948, '325F', 'M/RACK S/ARMS YAM.XJ 660 DIV.9', NULL, '88.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(949, '333F', 'M/RACK S/ARMS YAM.XT600 E(95)', NULL, '74.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(950, '336F', 'M/RACK S/ARMS YAM.TDM 850 \'96', NULL, '91.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(951, '338F', 'M/RACK S/ARMS YAM.YZF 600', NULL, '88.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(952, '340F', 'M/RACK S/ARMS YAM.FAZER 600', NULL, '101.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(953, '341F', 'M/RACK S/ARMS YAM.XJR 1300', NULL, '88.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(954, '347F', 'M/RACK S/ARMS YAM.TDM 900', NULL, '105.00', 0, 10, 32, 74, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(955, '348FZ', 'M/RACK S/ARMS Y.FZS 1000\'02FAZ', NULL, '109.00', 0, 10, 32, 74, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(956, '350FZ', 'M/RACK S/ARMS YAM.BT 1100\'02-0', NULL, '102.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(957, '351FZ', 'M/RACK S/ARMSY.Y.FZ6/FAZ.600\'0', NULL, '149.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(958, '355F', 'M/RACK S/ARMS YAM.XJR 1300\'04', NULL, '80.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(959, '356FZ', 'M/RACK S/ARMS YAM.MT-03\'2006', NULL, '104.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(960, '359FZ', 'M/RACK S/ARMS Y.FZ1 FAZER\'06', NULL, '157.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(961, '361F', 'M/RACK S/ARMS YAM.XJR 1300\'07', NULL, '88.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(962, '364FZ', 'M/RACK S/ARMS Y.XJ6 600\'09\'13', NULL, '121.00', 0, 10, 32, 74, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(963, '365FZ', 'M/RACK S/ARMS YAM.FZ1 1000\'', NULL, '111.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(964, '365KIT', 'Fitting Kit YAM.FZ1 1000\'', NULL, '28.00', 0, 10, 32, 3, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(965, '366FZ', 'MONORACK 366FZ FAZER 800 - 2010', NULL, '118.00', 0, 10, 32, 74, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(966, '4100FZ', 'S/ARMS M/RACK KAW.Z1000SX 2011', NULL, '200.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(967, '4104FZ', 'M/RACK S/ARMS K.ER-6N/ER-6F\'12', NULL, '124.00', 0, 10, 32, 74, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(968, '4106FZ', 'S/ARMS M/RACK KAW.ZZR1400\'12', NULL, '162.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(969, '4107FZ', 'M/RACK S/ARMS K.NINJA 250 R', NULL, '164.00', 0, 10, 32, 74, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(970, '4108FZ', 'S/ARMS M/RACK KAW.NINJIA300\'13', NULL, '153.00', 0, 10, 32, 74, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(971, '4109FZ', 'S/ARMS M/RACK KAW.Z800 (2013)', NULL, '196.00', 0, 10, 32, 74, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(972, '4117FZ', 'MONORACK ARMS KAW Z650', NULL, '128.00', 0, 10, 32, 74, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(973, '4118FZ', 'MONORACK ARMS KAW Z900', NULL, '157.00', 0, 10, 32, 74, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(974, '422F', 'M/RACK S/ARMS KAW.ZZR 1100\'93', NULL, '74.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(975, '423F', 'M/RACK S/ARMS KAW.ZZR 600\'93', NULL, '75.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(976, '432F', 'M/RACK S/ARMS KAW. ER5 500\'98', NULL, '86.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(977, '433F', 'M/RACK S/ARMS KAW.ZRX1100-S 99', NULL, '74.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(978, '436F', 'M/RACK S/ARMS KAW.ZR 7 99', NULL, '75.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(979, '440A', 'SPOILER KYMCO AGILITY 50 125', NULL, '89.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(980, '440D', 'SPOILER YAMAHA FZ6 FAZER S2\'07', NULL, '154.00', 0, 10, 32, 74, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(981, '440F', 'M/RACK S/ARMS KAW. ER 5 500\'01', NULL, '88.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(982, '441A', 'SPOILER SCOOTER K.AGILITY 50', NULL, '95.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(983, '441FZ', 'M/RACK S/ARMS KAW.ZZR 1200\'02', NULL, '102.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(984, '442FZ', 'M/RACK S/ARMS KAW.Z 1000\'03', NULL, '136.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(985, '443FZ', 'M/RACK S/ARMS KAW. Z 750\'04', NULL, '153.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(986, '444FZ', 'M/RACK S/ARMS KAW. Z750S \'05', NULL, '174.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(987, '445FZ', 'M/RACK S/ARMS KAW.ER-6N\'05', NULL, '102.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(988, '447FZ', 'M/RACK S/ARMS K.VERSYS 650\'06', NULL, '133.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(989, '448FZ', 'M/RACK S/ARMS K.Z750-Z1000\'07', NULL, '157.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(990, '449FZ', 'M/RACK S/ARMS K.EN-ER-6F\'09', NULL, '162.00', 0, 10, 32, 74, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(991, '450FZ', 'S/ARMS M/RACK KAW.Z1000 \'2010', NULL, '144.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(992, '451FZ', 'S/ARMS M/RACK KAW.VERSYS', NULL, '169.00', 0, 10, 32, 74, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(993, '5103TNKITR', 'Screw kit for TN5103', NULL, '48.00', 0, 10, 32, 3, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(994, '5107DT', 'SPOILER BMW F6700GS (2013)', NULL, '116.00', 0, 10, 32, 75, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(995, '5108D', 'SPOILER BMW R1200GS (13-14)', NULL, '109.00', 0, 10, 32, 75, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(996, '5108DT', 'SPOILER BMW R1200GS (2013)', NULL, '135.00', 0, 10, 32, 75, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(997, '5117FZ', 'MONORACK BMW R1200R', NULL, '126.00', 0, 10, 32, 74, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(998, '511F', 'M/RACK S/ARMS S.GSF 600/1200B', NULL, '92.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(999, '517F', 'M/RACK S/ARMS SUZ.GSX 750\'98', NULL, '88.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1000, '518F', 'M/RACK S/ARMS SUZ.GSX 600-750', NULL, '88.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1001, '522F', 'M/RACK S/ARMS SUZ.600\'00.04  B', NULL, '75.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1002, '526F', 'M/RACK S/ARMS SUZ.GS 500 E\'01', NULL, '75.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1003, '527FZ', 'M/RACK S/ARMS S.GSX1400\'02.06', NULL, '102.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1004, '529FZ', 'M/RACK S/ARMS SUZ.SV 650\'03', NULL, '136.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1005, '530FZ', 'M/RACK S/ARMS SUZ.GSX 600F\'03', NULL, '105.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1006, '539FZ', 'M/RACK S/ARMS S.BANDIT 650 K7', NULL, '133.00', 0, 10, 32, 74, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1007, '540FZ', 'SIDEARMS FOR SUZ.BANDIT 650ABS', NULL, '118.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1008, '541FZ', 'MONORACK SUZ GSX HAYABUSA', NULL, '207.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1009, '6103SRKITR', 'Screw kit for SR6103M', NULL, '21.00', 0, 10, 32, 3, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1010, '6103SRMKITR', 'Screw kit for SR6103M', NULL, '15.00', 0, 10, 32, 3, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1011, '635F', 'M/RACK S/ARMS BMW R 850 R', NULL, '75.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1012, '639F', 'M/RACK S/ARMS BMW F650 GS\'01', NULL, '74.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1013, '6702FZ', 'M/RACK S/ARMS APR.SHIVER 750', NULL, '249.00', 0, 10, 32, 74, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1014, '675F', 'M/RACK S/ARMS DUCATI ST 2', NULL, '75.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1015, '680F', 'M/RACK S/ARMS BMW K 1200RS\'97', NULL, '88.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1016, '681F', 'M/RACK S/ARMS BMW R 1100 S', NULL, '75.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1017, '687FZ', 'M/RACK S/ARMS BMW F800S\'06', NULL, '96.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1018, '688FZ', 'M/RACK S/ARMS BMW K1200RS\'07', NULL, '136.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1019, '703F', 'M/RACK S/ARMS G.BREVA 750\'03', NULL, '105.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1020, '726FZ', 'M/RACK.S/ARMS TR.SPRINT ST', NULL, '105.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1021, '727FZ', 'M/RACK S/ARMS TRIUMPH STREET', NULL, '121.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1022, '732FZ', 'M/RACK S/ARMS APR.MANA 850\'08', NULL, '132.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1023, '7702FZ', 'M/RACK S/ARMS KTM Duke 690 (2012-2017)', NULL, '127.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1024, '780FZ', 'M/RACK S/ARMS DUCATI MONSTER', NULL, '131.00', 0, 10, 32, 74, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1025, '8700FZ', 'M/RACK S/ARMS BEN.TRE899/1130K', NULL, '161.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1026, 'E170', 'SPEC PLATE GILERA FOUCO', NULL, '86.00', 0, 10, 32, 4, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1027, 'HR3-FZ150-I', 'MONORACK  YAM FZ150i', NULL, '82.00', 0, 10, 32, 74, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1028, 'HR3-Y135LC ES', 'CARRIER YAMAHA Y135LC ES', NULL, '88.00', 0, 10, 32, 74, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1029, 'HR4M-CB400 SPECIII', 'MONOLOCK CB400SPEC lll/REVO', NULL, '126.00', 0, 10, 32, 74, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1030, 'HR4M-CB400SPECI&amp;II', 'MONORACK HR4M SPECI&amp;II', NULL, '126.00', 0, 10, 32, 74, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1031, 'HRV-WINNER 150', 'H/DUTY ADV RACK HONDA WIN 150', NULL, '95.00', 0, 10, 32, 74, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1032, 'MR- TIGER REVO', 'TIGER REVOLUTION RACK', NULL, '38.00', 0, 10, 32, 76, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1033, 'MR5-FZ150I', 'YAM FZ150 REAR CARRIER', NULL, '26.00', 0, 10, 32, 76, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1034, 'MR5-Y135LC ES', ' CARRIER YAMAHA Y135LC ES', NULL, '26.00', 0, 10, 32, 76, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1035, 'MT-Y135LC ES', ' CARRIER YAMAHA Y135LC ES MT', NULL, '38.00', 0, 10, 32, 74, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1036, 'MV-FUTURE125', 'HONDA WAVE 125i', NULL, '38.00', 0, 10, 32, 76, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1037, 'MV-STX/ETX150', 'MONORACK ADVANCE APRILLIA STX', NULL, '35.00', 0, 10, 32, 76, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1038, 'MV-Y15ZR', 'YAM SNIPER MR5 RACK', NULL, '38.00', 0, 10, 32, 76, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1039, 'SR DUKE 200-390 V2', 'SPECIAL RACK2 KTM DUKE 200-390', NULL, '145.00', 0, 10, 32, 5, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1040, 'SR MSX125', 'SPECIAL RACK MSX125', NULL, '70.00', 0, 10, 32, 77, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1041, 'SRV-FZ150I F1-14', 'SPECIAL ADV RACK YAM FZ150 F1', NULL, '82.00', 0, 10, 32, 74, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1042, 'E128', 'SPEC. PLATE KAWASAKIT GTR 1000', NULL, '91.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1043, 'E137', 'SPECIFIC KIT KYMCO AGILITY 50', NULL, '42.00', 0, 10, 33, 5, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1044, 'E139', 'FITTING KIT KYMCO PEOPLE GT', NULL, '52.00', 0, 10, 33, 5, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1045, 'E180', 'SPEC.PLATE BMW K100 \'90', NULL, '105.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1046, 'E181', 'SPEC.PLATE BMW K 100 \'90', NULL, '103.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1047, 'E183', 'SPEC.PLATE BMW R1100RT', NULL, '109.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1048, 'E190', 'SPEC.PLATE HONDA ST 1100', NULL, '90.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1049, 'E191', 'SPEC.PLATE BMW R 1150 RT\'02', NULL, '106.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1050, 'E193', 'SPEC.PLATE BMW R1200RT\'05', NULL, '114.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1051, 'E194', 'SPEC.PLATE BMW F650-F800', NULL, '98.00', 0, 10, 33, 4, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1052, 'E194M', 'SPEC. PLATE BMW F650-F800', NULL, '96.00', 0, 10, 33, 5, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1053, 'E200', 'SPEC.PLATE HONDA A.TWIN 750', NULL, '59.00', 0, 10, 33, 4, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1054, 'E210', 'SPEC.PLATE HONDA AFR.TWIN', NULL, '80.00', 0, 10, 33, 4, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1055, 'E212', 'SPEC. PLATE H.VARADERO 1000', NULL, '59.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1056, 'E213', 'SPEC. PLATE H.TRANSALP 650\'00', NULL, '82.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1057, 'E215', 'SPEC.PLATE HONDA ST 1300\'02', NULL, '90.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1058, 'E217', 'SPEC.PLATE HONDA VARADERO 125', NULL, '32.00', 0, 10, 33, 5, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1059, 'E219', 'SPEC. PLATE HONDA SH125-150 \'0', NULL, '21.00', 0, 10, 33, 5, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1060, 'E220', 'SPEC.PLATE HONDA FORZA 250 \'05', NULL, '90.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1061, 'E220M', 'SPEC. PLATE HONDA FORZA 250\'05', NULL, '83.00', 0, 10, 33, 5, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1062, 'E221', 'SPEC.PLATE HONDA DEAUVILLE\'06', NULL, '102.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1063, 'E221M', 'SPEC.PLATE HONDA DEAUVILLE\'06', NULL, '96.00', 0, 10, 33, 5, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1064, 'E222', 'SPEC.PLATE HONDA XL 1000 V', NULL, '87.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1065, 'E223', 'SPEC. PLATE HONDA SH 300\'07', NULL, '37.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1066, 'E224', 'SPEC. PLATE S.WING125-150\'07', NULL, '44.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1067, 'E225', 'SPEC. PLATE HONDA XL 700 V', NULL, '116.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1068, 'E225M', 'SPEC. PLATE HONDA XL 700 V', NULL, '116.00', 0, 10, 33, 5, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1069, 'E226', 'SPEC PLATE HON FORZA250', NULL, '107.00', 0, 10, 33, 4, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1070, 'E227', 'SPEC.PLATE HONDA SH 125-150\'09', NULL, '31.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1071, 'E228', 'SPEC.PLATE YAM.FJR 1300\'06..09', NULL, '102.00', 0, 10, 33, 4, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1072, 'E228M', 'SPEC.PLATE YAM.FJR 1300\'06..09', NULL, '102.00', 0, 10, 33, 5, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1073, 'E251', 'UNIV.ADAPTOR PLATE+COVER MKEY', NULL, '66.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1074, 'E292', 'SPECIAL PLATE SYM SYMPHONY', NULL, '4.00', 0, 10, 33, 5, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1075, 'E318', 'SPEC.PLATE A.SCARAB.125-200\'07', NULL, '42.00', 0, 10, 33, 5, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1076, 'E319', 'SPEC.PLATE A.SPORTCITY C.300', NULL, '55.00', 0, 10, 33, 5, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1077, 'E331', 'SPEC.PLATE YAM.MAJESTY 400', NULL, '108.00', 0, 10, 33, 4, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1078, 'E331M', 'SPEC.PLATE YAM.MAJESTY 400', NULL, '112.00', 0, 10, 33, 5, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1079, 'E332', 'SPEC.PLATE YAM. XT 125 R/X\'05', NULL, '46.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1080, 'E333', 'SPEC.PLATE YAM.XT660Z', NULL, '107.00', 0, 10, 33, 4, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1081, 'E333M', 'SPEC.PLATE YAM.XT660Z', NULL, '107.00', 0, 10, 33, 5, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1082, 'E341', 'SPEC.PLATE BEVERLY 125-200-250', NULL, '37.00', 0, 10, 33, 78, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1083, 'E342', 'SPEC.PLATE LIBERTY 50 4T\'02', NULL, '37.00', 0, 10, 33, 78, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1084, 'E344', 'SPEC.PLATE P.BEVERLY 250/500\'0', NULL, '47.00', 0, 10, 33, 78, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1085, 'E348', 'SPEC.PLATE P.CARNABY 300', NULL, '57.00', 0, 10, 33, 78, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1086, 'E349', 'SPECIFIC KIT PIAGGIO BEVERLY', NULL, '61.00', 0, 10, 33, 78, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1087, 'E528', 'SPEC.PLATE SUZ.DL 1000V\'02', NULL, '81.00', 0, 10, 33, 78, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1088, 'E528M', 'SPEC.PLATE SUZ.DL 1000VS\'02-', NULL, '28.00', 0, 10, 33, 78, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1089, 'E531', 'SPEC.PLATE SUZUKI BURGMAN', NULL, '100.00', 0, 10, 33, 78, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1090, 'E531M', 'SPEC.PLATE SUZUKI BURGMAN', NULL, '96.00', 0, 10, 33, 78, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1091, 'E532', 'SPEC.PLATE SUZUKI SIXTEEN', NULL, '2.00', 0, 10, 33, 78, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1092, 'E581', 'SPEC.PLATE KAW.KLR 650\'08', NULL, '98.00', 0, 10, 33, 78, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1093, 'E581M', 'SPEC.PLATE KAW.KLR 650\'08', NULL, '57.00', 0, 10, 33, 78, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1094, 'E650M', 'SPEC.PLATE KTM 950 ADVENTURE', NULL, '26.00', 0, 10, 33, 78, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1095, 'E68', 'SPECIFIC BACKREST FOR E36/E45', NULL, '48.00', 0, 10, 33, 78, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1096, 'E682', 'SPEC.PLATE GILERA NEXUS 500\'05', NULL, '91.00', 0, 10, 33, 78, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1097, 'E682M', 'SPEC.PLATE GILERA NEXUS 500\'05', NULL, '91.00', 0, 10, 33, 78, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1098, 'E708', 'SPEC.PLATE  GUZZI STELVIO 1200', NULL, '90.00', 0, 10, 33, 78, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1099, 'E71', 'SPECIFIC BACKREST FOR E280', NULL, '42.00', 0, 10, 33, 78, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1100, 'E710', 'SPEC.PLATE GILERA FUOCO 500\'07', NULL, '83.00', 0, 10, 33, 78, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1101, 'E710M', 'SPEC.PLATE GILERA FUOCO 500\'07', NULL, '41.00', 0, 10, 33, 78, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1102, 'E730', 'SPECIAL PLATE A. SCARABEO', NULL, '42.00', 0, 10, 33, 78, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1103, 'SR102', 'SPEC.RACK PIAGGIO X8 125-200\'0', NULL, '203.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1104, 'SR102M', 'SPEC.RACK PIAGGIO X8 125-200\'0', NULL, '203.00', 0, 10, 33, 5, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1105, 'SR104', 'SPEC. RACK PIAGGIO FLY 50-125\'', NULL, '118.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1106, 'SR105', 'SPEC.RACK P.VESPA S50-125 07', NULL, '195.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1107, 'SR107', 'SPEC.RACK PIAGGIO LIBERTY S 50', NULL, '71.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1108, 'SR108', 'SPEC.RACK PIAGGIO MP3 250\'06', NULL, '214.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1109, 'SR108M', 'SPEC.RACK PIAGGIO MP3 250\'06', NULL, '214.00', 0, 10, 33, 5, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1110, 'SR1103', 'SPEC.RACK HONDA CBR 125R 2011', NULL, '139.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1111, 'SR1106', 'SPECIFIC RACK HONDA VISION 110', NULL, '41.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1112, 'SR111', 'SPEC.RACK SUZ. BURGMAN 250 \'98', NULL, '151.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1113, 'SR1110', 'SPEC.RACK H.CROSSTOURER 1200', NULL, '137.00', 0, 10, 33, 4, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1114, 'SR1114', 'SPECIFIC RACK H. WAVE 110I\'12', NULL, '140.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1115, 'SR1118', 'SPEC.RACK HONDA CB1100 (2013)', NULL, '384.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1116, 'SR1119', 'SPEC.RACK H.CBR500R-CB500F \'13', NULL, '131.00', 0, 10, 33, 4, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1117, 'SR111M', 'SPEC.RACK SUZ. BURGMAN 250 \'98', NULL, '151.00', 0, 10, 33, 5, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1118, 'SR1123', 'SPEC.RACK H.FORZA 300 ABS \'13', NULL, '127.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1119, 'SR1123MM', 'SPEC.RACK H.FORZA 300 ABS \'13', NULL, '122.00', 0, 10, 33, 5, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1120, 'SR1125', 'SPECIFIC RACK H.SH MODE 125\'13', NULL, '55.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1121, 'SR1134', 'SPEC.RACK HONDA CTX1300 (2014)', NULL, '154.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1122, 'SR1136', 'SPECIFIC RACK H.PCX 125-150', NULL, '54.00', 0, 10, 33, 4, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1123, 'SR1139', 'SPEC RACK CROSSRUNNER \'15', NULL, '161.00', 0, 10, 33, 4, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1124, 'SR114', 'SPEC.RACK SUZ.BURGMAN', NULL, '85.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1125, 'SR1142', 'SPEC RACK HONDA CB125F 15', NULL, '101.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1126, 'SR1144', 'SPEC RACK CRF1000L AFRICA TWIN', NULL, '81.00', 0, 10, 33, 4, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1127, 'SR115', 'SPEC.RACK SUZ.BURGMAN', NULL, '137.00', 0, 10, 33, 4, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1128, 'SR1150', 'SPEC RACK HONDA INTEGRA 2016', NULL, '188.00', 0, 10, 33, 4, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1129, 'SR1156', 'Specific rear rack for', NULL, '47.00', 0, 10, 33, 4, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1130, 'SR116', 'SPEC.RACK SUZUKI GSR 600\'06', NULL, '228.00', 0, 10, 33, 4, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1131, 'SR116M', 'SPEC.RACK SUZUKI GSR 600\'06', NULL, '228.00', 0, 10, 33, 5, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1132, 'SR117M', 'SPEC.RACK SUZ.BURGMAN', NULL, '170.00', 0, 10, 33, 5, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1133, 'SR121', 'SPEC.RACK SUZ.GLADIUS 650\'09', NULL, '205.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1134, 'SR121M', 'SPEC.RACK SUZ.GLADIUS 650\'09', NULL, '205.00', 0, 10, 33, 5, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1135, 'SR125', 'SPEC.RACK GILERA RUNNER', NULL, '93.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0);
INSERT INTO `mah_product` (`id`, `name`, `desc`, `image`, `price`, `interested`, `brand`, `cate`, `type`, `status`, `created`, `modified`, `ctl`) VALUES
(1136, 'SR126', 'SPEC.RACK GILERA .RUNNER', NULL, '81.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1137, 'SR131', 'SPEC.RACK P.VESPA 300 S.\'08', NULL, '196.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1138, 'SR132', 'SPEC.RACK PIAGGIO LIBERTY 50', NULL, '77.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1139, 'SR134', 'SPEC.RACK PIAG. MP3 125-250', NULL, '265.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1140, 'SR134M', 'SPEC.RACK PIAG.MP3 125-250', NULL, '265.00', 0, 10, 33, 5, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1141, 'SR140', 'SPEC.RACK FORESIGHT 250 97/04', NULL, '68.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1142, 'SR15', 'SPEC.RACK DEAUVILLE 650  98/02', NULL, '154.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1143, 'SR151', 'SPEC.RACK H.INNOVA 125\'07', NULL, '125.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1144, 'SR157', 'SPEC.RACK HONDA CBF 125\'09', NULL, '103.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1145, 'SR15M', 'SPEC.RACK DEAUVILLE 650  98/02', NULL, '154.00', 0, 10, 33, 5, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1146, 'SR19', 'SPEC.RACK SILVERWING 600\'01/04', NULL, '131.00', 0, 10, 33, 4, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1147, 'SR19M', 'SPEC.RACK SILVERWING 600\'01/04', NULL, '131.00', 0, 10, 33, 5, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1148, 'SR2013', 'SPEC.RACK YAM.T-MAX 530\'12', NULL, '168.00', 0, 10, 33, 4, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1149, 'SR2013M', 'SPEC.RACK YAM.T-MAX 530\'12', NULL, '168.00', 0, 10, 33, 5, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1150, 'SR210', 'SPEC.RACK M.GUZZI BREVA 1100', NULL, '132.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1151, 'SR2102', 'SPEC.RACK YAM.XENTER125-150\'12', NULL, '68.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1152, 'SR2104', 'SPEC.RACK YAM.YBR 125 (10-12)', NULL, '43.00', 0, 10, 33, 4, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1153, 'SR210M', 'SPEC.RACK M.GUZZI BREVA 1100', NULL, '132.00', 0, 10, 33, 5, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1154, 'SR2111', 'SPEC.RACK YAMAHA X-MAX 400\'13', NULL, '214.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1155, 'SR2111M', 'SPEC.RACK YAMAHA X-MAX 400\'13', NULL, '147.00', 0, 10, 33, 5, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1156, 'SR2113', 'SPEC.RACK YAMAHA AEROX R \'13', NULL, '178.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1157, 'SR2114', 'SPEC.RACK Y.D\'ELIGHT 114 \'13', NULL, '96.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1158, 'SR2117', 'SPEC.RACK YAM.X-MAX 125-250\'14', NULL, '214.00', 0, 10, 33, 4, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1159, 'SR2117M', 'SPEC.RACK YAM.X-MAX 125-250\'14', NULL, '147.00', 0, 10, 33, 5, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1160, 'SR2120', 'SPEC.RACK YAM.TRICITY 125 \'14', NULL, '61.00', 0, 10, 33, 4, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1161, 'SR2121', 'SPEC RACK YAM MAJESTIC S125', NULL, '116.00', 0, 10, 33, 4, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1162, 'SR2122', 'SPEC.REAR RACK MONOLOCK/MONOKE', NULL, '102.00', 0, 10, 33, 4, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1163, 'SR2123', 'SPEC RACK YAM NMAX125', NULL, '181.00', 0, 10, 33, 4, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1164, 'SR2126', 'SPEC REAR RACK YAM XSR700', NULL, '177.00', 0, 10, 33, 4, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1165, 'SR2127', 'SPEC RACK YAM MT-06 2016', NULL, '171.00', 0, 10, 33, 4, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1166, 'SR2129', 'SPEC REAR RACK MT-10 2016+', NULL, '90.00', 0, 10, 33, 4, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1167, 'SR2133', 'TMAX 530 2017 rack', NULL, '243.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1168, 'SR2136', 'XMAX 300 2017 rack', NULL, '137.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1169, 'SR22', 'SPEC.RACK DYLAN 125-150\'02/04', NULL, '90.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1170, 'SR225', 'SPEC.RACK TRIUMPH TIGER 1050', NULL, '134.00', 0, 10, 33, 4, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1171, 'SR226', 'SPEC.RACK TRIUMPH BONNEVILLE', NULL, '431.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1172, 'SR230', 'SPEC.RACK SYM JOYMAX 250\'05', NULL, '136.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1173, 'SR231M', 'SPEC.RACK SYM CITYCOM 300\'08', NULL, '135.00', 0, 10, 33, 5, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1174, 'SR232', 'SPEC.RACK SYM JOYMAX EVO', NULL, '101.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1175, 'SR233', 'SPEC. RACK SYM JOYRIDE EVO', NULL, '157.00', 0, 10, 33, 4, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1176, 'SR233M', 'SPEC. RACK SYM JOYRIDE EVO', NULL, '94.00', 0, 10, 33, 5, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1177, 'SR28', 'SPEC.RACK HONDA ZOOMER 50 \'04', NULL, '91.00', 0, 10, 33, 4, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1178, 'SR310', 'SPEC.RACK DUCATI MULTISTRADA', NULL, '183.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1179, 'SR3101', 'SPEC.RACK SUZ DL650 V-STROM L2', NULL, '111.00', 0, 10, 33, 4, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1180, 'SR3101M', 'SPEC.RACK SUZ DL650 V-STROM L2', NULL, '63.00', 0, 10, 33, 5, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1181, 'SR3103', 'SPEC.RACK SUZUKI INAZUMA 250', NULL, '123.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1182, 'SR3104', 'SPEC.RACK SUZ BURGMAN 650 \'13', NULL, '134.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1183, 'SR3104MM', 'SPEC.RACK SUZ BURGMAN 650 \'13', NULL, '121.00', 0, 10, 33, 5, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1184, 'SR3105', 'SPEC.RACK S.DL1000 V-STROM', NULL, '205.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1185, 'SR3105M', 'SPEC.RACK S.DL1000 V-STROM', NULL, '205.00', 0, 10, 33, 5, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1186, 'SR3106', 'SPEC.RACK BURGMAN 125-200 \'14', NULL, '70.00', 0, 10, 33, 4, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1187, 'SR311', 'SPEC.RACK DUCATI MULTISTRADA', NULL, '189.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1188, 'SR312', 'SPEC.RACK DUCATI MULTISTRADA', NULL, '178.00', 0, 10, 33, 4, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1189, 'SR346', 'SPEC.RACK YAMAHA FJR 1300\'01', NULL, '238.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1190, 'SR347', 'SPEC.RACK YAM.TDM 900\'02-03', NULL, '98.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1191, 'SR353M', 'SPEC.RACK YAMAHA XT 660R/X \'04', NULL, '153.00', 0, 10, 33, 5, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1192, 'SR354', 'SPEC.RACK YAM.CYGNUS X 125 \'04', NULL, '64.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1193, 'SR355', 'SPEC.RACK YAMAHA X-MAX 125-', NULL, '147.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1194, 'SR355M', 'SPEC.RACK YAMAHA X-MAX 125-', NULL, '81.00', 0, 10, 33, 5, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1195, 'SR356', 'SPEC.RACK YAMAHA BW\'S 50\'05', NULL, '104.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1196, 'SR357', 'SPEC.RACK YAMAHA FJR 1300\'06', NULL, '194.00', 0, 10, 33, 4, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1197, 'SR361', 'SPEC.RACK YAM. X-CITY 250\'07', NULL, '104.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1198, 'SR364', 'SPEC RACK FOR YAM T-MAX500', NULL, '193.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1199, 'SR365M', 'SPEC.RACK YAM.XT660X/R\'07-08', NULL, '169.00', 0, 10, 33, 5, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1200, 'SR366', 'SPEC.RACK YAM.NEO\'S 50 MBK', NULL, '123.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1201, 'SR370', 'SPEC.RACK YAM.X-MAX 125-250', NULL, '164.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1202, 'SR370M', 'SPEC.RACK YAM.X-MAX 125-250', NULL, '102.00', 0, 10, 33, 5, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1203, 'SR371', 'SPEC.RACK FOR YAM.XT1200Z \'10', NULL, '128.00', 0, 10, 33, 4, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1204, 'SR372', 'SPEC.RACK FOR YAM.BW\'S 125 \'10', NULL, '97.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1205, 'SR410', 'SPEC.RACK KAWAS.GTR 1400 \'07', NULL, '199.00', 0, 10, 33, 4, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1206, 'SR4101', 'SPEC.RACK KAWAS.W800 (2011)', NULL, '190.00', 0, 10, 33, 4, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1207, 'SR4105', 'SPEC.RACK K.VERSYS 1000\'12\'15', NULL, '102.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1208, 'SR4105M', 'SPEC.RACK K.VERSYS 1000\'12\'15', NULL, '52.00', 0, 10, 33, 5, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1209, 'SR4111', 'SPEC.RACK SUZ.KAWASAKI J300\'14', NULL, '135.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1210, 'SR4111MM', 'SPEC.RACK SUZ.KAWASAKI J300\'14', NULL, '129.00', 0, 10, 33, 5, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1211, 'SR4114', 'SEPC REAR RACK KAW VERSYS650', NULL, '40.00', 0, 10, 33, 4, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1212, 'SR43', 'SPEC.RACK Y.MAJESTY 125/150', NULL, '113.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1213, 'SR45', 'SPEC.RACK YAMAHA T-MAX 500\'01', NULL, '156.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1214, 'SR46M', 'SPEC.RACK Y.MAJESTY 125-180', NULL, '82.00', 0, 10, 33, 5, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1215, 'SR5100M', 'SPECIAL RACK BMW R1200R \'11', NULL, '189.00', 0, 10, 33, 5, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1216, 'SR5105', 'SPEC.RACK BMW C600 SPORT', NULL, '186.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1217, 'SR5105M', 'SPEC.RACK BMW C600 SPORT', NULL, '183.00', 0, 10, 33, 5, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1218, 'SR5107', 'SPEC.RACK BMW F650GS/F700GS', NULL, '132.00', 0, 10, 33, 4, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1219, 'SR5108', 'SPECIAL RACK BMW R1200GS\'13', NULL, '163.00', 0, 10, 33, 4, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1220, 'SR5109', 'SPEC.RACK BMW F800GT (2013)', NULL, '154.00', 0, 10, 33, 4, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1221, 'SR54M', 'SPEC.RACK PIAGGIO X9 250\'00', NULL, '221.00', 0, 10, 33, 5, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1222, 'SR56', 'SPEC.RACK PIAGGIO ZIP 50-125', NULL, '97.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1223, 'SR5600', 'SPEC.RACK PIAG.MP3 YOURMAN \'11', NULL, '194.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1224, 'SR5600M', 'SPEC.RACK PIAG.MP3 YOURMAN \'11', NULL, '126.00', 0, 10, 33, 5, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1225, 'SR5600MM', 'SPEC.RACK PIAG.MP3 YOURMAN \'11', NULL, '181.00', 0, 10, 33, 5, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1226, 'SR5602', 'SPECIAL RACK P.TYPHOON 50-125', NULL, '151.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1227, 'SR5603', 'SPEC.RACK P.VESPA PX125/150\'11', NULL, '110.00', 0, 10, 33, 4, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1228, 'SR5604', 'SPECIAL RACK P.X10 125-350-500', NULL, '336.00', 0, 10, 33, 4, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1229, 'SR5604M', 'SPECIAL RACK P.X10 125-350-500', NULL, '334.00', 0, 10, 33, 5, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1230, 'SR5605', 'SPECIAL RACK PIAGGIO FLY 50\'12', NULL, '77.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1231, 'SR5608CR', 'SPEC.RACK P.VESPA PRIMAVERA', NULL, '264.00', 0, 10, 33, 5, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1232, 'SR5609', 'SPEC.RACK P.MP3 500IE/500IE', NULL, '120.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1233, 'SR5609M', 'SPEC.RACK P.MP3 500IE/500IE', NULL, '120.00', 0, 10, 33, 5, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1234, 'SR57', 'SPEC.RACK PIAGGIO X9 125-500', NULL, '112.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1235, 'SR6100', 'SPEC.RACK KYMKO MYROAD 700', NULL, '119.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1236, 'SR6100M', 'SPEC.RACK KYMKO MYROAD 700', NULL, '119.00', 0, 10, 33, 5, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1237, 'SR6101', 'SPEC.RACK KYMKO G-DINK 125-300', NULL, '184.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1238, 'SR6103', 'SPEC.RACK K.K-XCT 125I-300I\'13', NULL, '203.00', 0, 10, 33, 4, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1239, 'SR6103M', 'SPEC.RACK K.K-XCT 125I-300I\'13', NULL, '128.00', 0, 10, 33, 5, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1240, 'SR6104', 'SPEC.RACK KYMCO XCITING 400\'13', NULL, '179.00', 0, 10, 33, 4, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1241, 'SR6104M', 'SPEC.RACK KYMCO XCITING 400\'13', NULL, '106.00', 0, 10, 33, 5, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1242, 'SR6105', 'SPEC.RACK KYMKO SUPER 8 125\'13', NULL, '64.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1243, 'SR6106', 'SPEC.RACK KYMKO AGILITY R16+', NULL, '45.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1244, 'SR63', 'SPEC.RACK PEUGEOT GEOPOLIS', NULL, '103.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1245, 'SR64', 'SPEC.RACK PEUGEOT GEOPOLIS', NULL, '104.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1246, 'SR6401', 'SPEC.RACK TRIUMPH TIGER 800/XC', NULL, '173.00', 0, 10, 33, 4, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1247, 'SR6403', 'SPEC.RACK TRIUM.TIGER EXPLORER', NULL, '138.00', 0, 10, 33, 4, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1248, 'SR6404', 'SPEC.RACK TRIUM.TIGER SPORT', NULL, '219.00', 0, 10, 33, 4, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1249, 'SR6407', 'SPEC RACK STREET TWIN 900 2016', NULL, '194.00', 0, 10, 33, 4, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1250, 'SR6700M', 'SPEC.RACK APRILIA DORSODURO', NULL, '227.00', 0, 10, 33, 5, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1251, 'SR6701', 'SPEC.RACK SCARABEO 125-200', NULL, '85.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1252, 'SR6703', 'SPEC.RACK APRILIA SRV 850 \'12', NULL, '187.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1253, 'SR6703M', 'SPEC.RACK APRILIA SRV 850 \'12', NULL, '184.00', 0, 10, 33, 5, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1254, 'SR6705', 'SPEC.RACK A.SCARABEO 50 STREET', NULL, '50.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1255, 'SR6708', 'SPEC.REAR RACK APRILIA SRV 850', NULL, '106.00', 0, 10, 33, 4, 'a', '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(1256, 'SR682M', 'SPEC.RACK BMW F 650CS SCARVER', NULL, '163.00', 0, 10, 33, 5, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1257, 'SR683', 'SPEC.RACK BMW R 1150 R\'01..03', NULL, '153.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1258, 'SR684', 'SPEC.RACK BMW R 1200 GS\'04-08', NULL, '153.00', 0, 10, 33, 4, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1259, 'SR685', 'SPEC.RACK BMW F 650 GS \'04', NULL, '98.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1260, 'SR689', 'SPEC.RACK BMW R 1200GS\'04.08', NULL, '164.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1261, 'SR694', 'SPEC.RACK BMW R1100GS 94-99 &amp;', NULL, '198.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1262, 'SR7051', 'SPEC.RACK SYM MAXSYM 400(2011)', NULL, '131.00', 0, 10, 33, 4, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1263, 'SR7051M', 'SPEC.RACK SYM MAXSYM 400(2011)', NULL, '127.00', 0, 10, 33, 5, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1264, 'SR7052', 'SPEC.RACK SYM JOYMAX 300I \'12', NULL, '188.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1265, 'SR7052M', 'SPEC.RACK SYM JOYMAX 300I \'12', NULL, '120.00', 0, 10, 33, 5, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1266, 'SR74', 'SPEC.RACK APRILIA HABANA125\'00', NULL, '114.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1267, 'SR740', 'SPEC.RACK APR.SPORTCITY ONE', NULL, '134.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1268, 'SR7700', 'SPEC.RACK KTM ADVENT.950/990', NULL, '135.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1269, 'SR7701', 'SPEC.RACK KTM DUKE 125 (2011)', NULL, '162.00', 0, 10, 33, 4, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1270, 'SR7703', 'SPEC.RACK KTM 1190 ADVENTURE -', NULL, '144.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1271, 'SR7705', 'SPEC RACK KTM1050 ADV', NULL, '58.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1272, 'SR777', 'SPEC.RACK HONDA CBF1000/1000', NULL, '224.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1273, 'SR777M', 'SPEC.RACK HONDA CBF1000/1000', NULL, '224.00', 0, 10, 33, 5, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1274, 'SR78', 'SPEC.RACK APR.SR 50 DITECH\'03', NULL, '96.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1275, 'SR79', 'SPEC.RACK APRILIA PEGASO 650', NULL, '151.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1276, 'SR8201', 'SPEC RACK V7 STONE 2017', NULL, '208.00', 0, 10, 33, 4, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1277, 'SR852', 'SPECIFIC RACK KEEWAY RY8 50EVO', NULL, '80.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1278, 'SR86', 'SPEC.RACK MBK OVETTO/NEO\'S', NULL, '97.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1279, 'SR87', 'SPEC.RACK KYMCO GRAND DINK \'01', NULL, '154.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1280, 'SR8701', 'SPEC.RACK FOR BENELLI BN600\'13', NULL, '220.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1281, 'SR8701M', 'SPEC.RACK FOR BENELLI BN600\'13', NULL, '152.00', 0, 10, 33, 5, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1282, 'SR87M', 'SPEC.RACK KYMCO GRAND DINK', NULL, '86.00', 0, 10, 33, 5, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1283, 'SR89M', 'SPEC.RACK KYMCO XCITING 500\'05', NULL, '102.00', 0, 10, 33, 5, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1284, 'SR90', 'SPEC.RACK KYMCO DINK 125', NULL, '98.00', 0, 10, 33, 4, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1285, 'SR91', 'SPEC.RACK KYMCO XCITING 300i-', NULL, '166.00', 0, 10, 33, 4, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1286, 'SR91M', 'SPEC.RACK KYMCO XCITING 300i-', NULL, '103.00', 0, 10, 33, 5, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1287, 'SR92', 'SPEC.RACK KYMCO DOWNNTOWN', NULL, '139.00', 0, 10, 33, 4, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1288, 'SR92M', 'SPEC.RACK KYMCO DOWNNTOWN', NULL, '76.00', 0, 10, 33, 5, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1289, 'SRA1110', 'SPEC.RACK H. CROSSTOURER 1200', NULL, '204.00', 0, 10, 33, 79, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1290, 'SRA2013', 'SPEC ALU RACK FOR T-MAX 530\'12', NULL, '239.00', 0, 10, 33, 79, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1291, 'SRA2101', 'SPEC.RACK YAM.XT1200Z SUPER', NULL, '188.00', 0, 10, 33, 79, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1292, 'SRA2109', 'SPEC.RACK YAM.FJR1300 2013', NULL, '219.00', 0, 10, 33, 79, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1293, 'SRA227', 'SPEC.RACK TRIUMPH SPRING 1050', NULL, '154.00', 0, 10, 33, 79, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1294, 'SRA3101', 'SPEC.RACK SUZ.DL650 V-STROM L2', NULL, '183.00', 0, 10, 33, 79, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1295, 'SRA3105', 'SPEC.RACK SUZ.DL1000 V-STROM', NULL, '284.00', 0, 10, 33, 79, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1296, 'SRA4105', 'SPEC.RACK K.VERSYS 1000 \'12\'15', NULL, '199.00', 0, 10, 33, 79, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1297, 'SRA5102', 'SPEC.RACK BMW R1200GS', NULL, '255.00', 0, 10, 33, 79, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1298, 'SRA5103', 'SPEC.RACK BMW F650GS/F800GS\'11', NULL, '230.00', 0, 10, 33, 79, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1299, 'SRA5105', 'SPECIAL RACK BMW C600 SPORT', NULL, '299.00', 0, 10, 33, 79, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1300, 'SRA5106', 'SPECIAL RACK BMW C650GT', NULL, '236.00', 0, 10, 33, 79, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1301, 'SRA5108', 'SPEC.RACK BMW R1200GS (2013)', NULL, '235.00', 0, 10, 33, 79, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1302, 'SRA5112', 'SPEC.RACK BMW R1200GS ADV.\'14', NULL, '250.00', 0, 10, 33, 79, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1303, 'SRA5113', 'SPEC.RACK BMW R1200RT \'14', NULL, '239.00', 0, 10, 33, 79, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1304, 'SRA5116', 'SPEC. REAR RACK IN ALUMINIUM', NULL, '287.00', 0, 10, 33, 79, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1305, 'SRA5117', 'SPEC RACK BMW R1200R', NULL, '181.00', 0, 10, 33, 79, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1306, 'SRA5119', 'SPEC RACK BMW S1000XR', NULL, '163.00', 0, 10, 33, 79, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1307, 'SRA6401', 'SPECIFIC RACK TRIUMPHTIGER', NULL, '225.00', 0, 10, 33, 79, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1308, 'SRA6403', 'SPECIFIC RACK TRIUMPH TIGER', NULL, '173.00', 0, 10, 33, 79, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1309, 'SRA6404', 'SPECIFIC RACK TRIUMPH TIGER', NULL, '284.00', 0, 10, 33, 79, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1310, 'SRA6706', 'SPEC.RACK APR.CAPONORD 1200\'13', NULL, '271.00', 0, 10, 33, 79, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1311, 'SRA690', 'SPEC.RACK BMW K 1300 R\'09', NULL, '317.00', 0, 10, 33, 79, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1312, 'SRA691', 'SPECIAL RACK BMW F800R \'09', NULL, '353.00', 0, 10, 33, 79, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1313, 'SRA692', 'SPEC.RACK BMW R1200GS\'\'04-09', NULL, '347.00', 0, 10, 33, 79, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1314, 'SRA693', 'SPEC.RACK BMW K1200GT K1300GT', NULL, '203.00', 0, 10, 33, 79, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1315, 'SRA7401', 'SPEC.RACK D. MULTISTRADA 1200', NULL, '249.00', 0, 10, 33, 79, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1316, 'SRA7403', 'SPEC.RACK D.HYPERSTRADA 821\'13', NULL, '235.00', 0, 10, 33, 79, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1317, 'SRA750', 'SPEC.RACK KTM 990 SMT\'09', NULL, '212.00', 0, 10, 33, 79, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1318, 'SRA7703', 'SPEC.RACK KTM 1190 ADVENTURE', NULL, '244.00', 0, 10, 33, 79, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1319, 'DLM30A', 'TREKKER DOLOMITI 30LT', NULL, '463.00', 0, 10, 34, 4, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1320, 'DLM36KIT', 'FITTING KIT FOR PL', NULL, '72.00', 0, 10, 34, 3, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1321, 'STTR40', 'Universal Support GPS TOM', NULL, '66.00', 0, 10, 35, 16, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1322, 'PLX1102', 'TUB.PANN.HOLDER HONDA HORNET', NULL, '281.00', 0, 10, 36, 80, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1323, 'PLX1104', 'TUB.PANN.HOLDER H.CROSSRUN.800', NULL, '319.00', 0, 10, 36, 80, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1324, 'PLX1109', 'TUB.PANN.HOLD.H.INTEGRA 700\'12', NULL, '257.00', 0, 10, 36, 80, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1325, 'PLX1111', 'TUB.PAN.HOLDER H.NC700X\'12-\'13', NULL, '261.00', 0, 10, 36, 80, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1326, 'PLX1119', 'TUB.PANN.HOLD.H.CBR500R \'13', NULL, '259.00', 0, 10, 36, 80, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1327, 'PLX1120', 'TUB.PANN.HOLD.H.INTEGRA 700\'', NULL, '277.00', 0, 10, 36, 80, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1328, 'PLX1121', 'TUB.PANN.HOLD.H.CB500X (2013)', NULL, '255.00', 0, 10, 36, 80, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1329, 'PLX1127', 'TUB.PANN.HOLD.H.INTEGRA 750\'', NULL, '259.00', 0, 10, 36, 80, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1330, 'PLX1137', 'TUB.PANN.HOLDER H.CBF650F\'14', NULL, '276.00', 0, 10, 36, 80, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1331, 'PLX1146', 'V35 MONOKEY SIDE RACK NC750X16', NULL, '242.00', 0, 10, 36, 24, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1332, 'PLX1150', 'V35 RACK HONDA INTEGRA 2016', NULL, '247.00', 0, 10, 36, 24, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1333, 'PLX166', 'TUB.PANN.HOLDER HONDA VFR800', NULL, '243.00', 0, 10, 36, 80, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1334, 'PLX174', 'TUB.PANN.HOLDER HONDA CBF', NULL, '229.00', 0, 10, 36, 80, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1335, 'PLX174KIT', 'FITTING KIT FOR PLX174', NULL, '37.00', 0, 10, 36, 3, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1336, 'PLX177', 'TUB.PANN.HOLDER HONDA', NULL, '261.00', 0, 10, 36, 80, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1337, 'PLX209', 'TUB.PANN.HLDR HONDA VFR1200F', NULL, '288.00', 0, 10, 36, 80, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1338, 'PLX2118', 'TUB.PANN.HOLD.YAMAHA MT-07\'14', NULL, '257.00', 0, 10, 36, 80, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1339, 'PLX3101', 'TUB.PANN.HOLDER SUZUKI DL650', NULL, '291.00', 0, 10, 36, 80, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1340, 'PLX347', 'TUB.PANN.HOLDER YAMAHA TDM', NULL, '238.00', 0, 10, 36, 80, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1341, 'PLX351', 'TUB.PANN.HOLDER YAM.FZ6-FZ6', NULL, '232.00', 0, 10, 36, 80, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1342, 'PLX359', 'TUB.PANN.HOLDER YAMAHA FZ1', NULL, '256.00', 0, 10, 36, 80, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1343, 'PLX359KIT', 'FITTING KIT FOR PLX359', NULL, '62.00', 0, 10, 36, 3, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1344, 'PLX360', 'TUB.PANN.HOLDER HONDA FZ6 S2', NULL, '261.00', 0, 10, 36, 80, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1345, 'PLX4104', 'TUB.PANN.HOLD.KAW ER6N/6F 2012', NULL, '281.00', 0, 10, 36, 80, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1346, 'PLX4114', 'V35 PANNIER HOLDER VERSYS 650', NULL, '232.00', 0, 10, 36, 24, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1347, 'PLX4117', 'V35N SIDEHOLDER KAW Z650', NULL, '258.00', 0, 10, 36, 24, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1348, 'PLX445', 'TUB.PANN.HOLDER KAWASAKI', NULL, '227.00', 0, 10, 36, 80, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1349, 'PLX446', 'TUB.PANN.HOLDER KAWASAKI', NULL, '258.00', 0, 10, 36, 80, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1350, 'PLX447', 'TUB.PANN.HOLDER KAWASAKI', NULL, '261.00', 0, 10, 36, 80, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1351, 'PLX447KIT', 'FITTING KIT FOR PLX447', NULL, '29.00', 0, 10, 36, 3, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1352, 'PLX449', 'TUB.PANN.HOLDER KAWASAKI', NULL, '264.00', 0, 10, 36, 80, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1353, 'PLX449KIT', 'FITTING KIT FOR PLX449', NULL, '118.00', 0, 10, 36, 3, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1354, 'PLX528', 'TUB.PANN.HOLDER SUZUKI DL 1000', NULL, '240.00', 0, 10, 36, 80, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1355, 'PLX532', 'TUB.PANN.HOLDER SUZUKI DL 650', NULL, '273.00', 0, 10, 36, 80, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1356, 'PLX538', 'TUB.PANN.HOLDER SUZ. GSR 600\'0', NULL, '225.00', 0, 10, 36, 80, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1357, 'PLX539', 'TUB.PANN.HOLDER SUZ. BANDIT', NULL, '273.00', 0, 10, 36, 80, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1358, 'PLX687', 'TUB.PANN.HOLDER BMW F800 S\'06', NULL, '285.00', 0, 10, 36, 80, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1359, 'PLX688KIT', 'FITTING KIT FOR PLX688', NULL, '42.00', 0, 10, 36, 3, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1360, 'PLX770', 'TUB.PANN.HOLDER CAN AM', NULL, '334.00', 0, 10, 36, 80, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1361, 'PLXR1104', 'TUB.PANN.HOLDER HONDA CROSSRUN', NULL, '377.00', 0, 10, 36, 24, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1362, 'PLXR1110', 'TUB.PANN.HOLDER H. CROSSTOURER', NULL, '337.00', 0, 10, 36, 24, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1363, 'PLXR1132', 'TUB.PANN.HOLDER H.VFR800F \'14', NULL, '309.00', 0, 10, 36, 24, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1364, 'PLXR1139', 'V35 PANNIER HOLDER', NULL, '368.00', 0, 10, 36, 24, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1365, 'PLXR166', 'TUB.PANN.HOLDER HONDA VFR 800', NULL, '274.00', 0, 10, 36, 24, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1366, 'PLXR174', 'TUB.PANN.HOLDER HONDA CBF 500', NULL, '253.00', 0, 10, 36, 24, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1367, 'PLXR208', 'TUB.PANN.HOLDER HONDA CBF 1000', NULL, '312.00', 0, 10, 36, 24, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1368, 'PLXR2110', 'TUB.PANN.HOLDER YAM.XJ6 (2013)', NULL, '314.00', 0, 10, 36, 24, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1369, 'PLXR2122', 'SPEC. RAPID RELEASE SIDE CASE', NULL, '326.00', 0, 10, 36, 24, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1370, 'PLXR312', 'TUB.PANN.HOLDER DUCATI', NULL, '340.00', 0, 10, 36, 24, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1371, 'PLXR359', 'TUB.PANN.HOLDER YAM. FZ1 FAZER', NULL, '319.00', 0, 10, 36, 24, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1372, 'PLXR363', 'RAPID RELEASE SIDERACK XT660', NULL, '368.00', 0, 10, 36, 24, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1373, 'PLXR364', 'TUB.PANN.HOLDER YAM.XJ6 600\'09', NULL, '296.00', 0, 10, 36, 24, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1374, 'PLXR366', 'TUB.PANN.HOLDER YAMAHA', NULL, '337.00', 0, 10, 36, 24, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1375, 'PLXR4100', 'TUB.PANN.HOLDER KAW.Z1000SX\'11', NULL, '333.00', 0, 10, 36, 24, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1376, 'PLXR4105', 'TUB.PANN.HOLDER KAW.VERSYS', NULL, '288.00', 0, 10, 36, 24, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1377, 'PLXR4113', 'SPEC V35 RACK VERSYS', NULL, '328.00', 0, 10, 36, 24, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1378, 'PLXR450', 'TUB.PANN.HOLDER KAW VERSYS 650', NULL, '302.00', 0, 10, 36, 24, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1379, 'PLXR5100', 'TUB.PANN.HOLDER BMW R1200R \'11', NULL, '330.00', 0, 10, 36, 24, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1380, 'PLXR541', 'TUB.PANN.HOLDER SUZ.BANDIT 650', NULL, '295.00', 0, 10, 36, 24, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1381, 'PLXR691', 'TUB.PANN.HOLDER BMW K1300 R\'09', NULL, '285.00', 0, 10, 36, 24, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1382, '1000A', 'TRANSPARENT WINDSCREEN', NULL, '96.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1383, '102A', 'SPOILER DYLAN-BEVERLY-B&amp;W', NULL, '98.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1384, '103A', 'SPOILER PIAGGIO BEVERLY 500\'03', NULL, '105.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1385, '104A', 'SPOILER PIAGGIO VESPA 125-200', NULL, '104.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1386, '105A', 'SPOILER P.BEVERLY 125-200-250', NULL, '89.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1387, '106A', 'SPOILER PIAGGIO BEVERLY 500\'03', NULL, '86.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1388, '107A', 'SPOILER PIAG.FLY 50/125/200 \'0', NULL, '87.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1389, '1104DT', 'SPEC.SCREEN H.CROSSRUNN 800\'11', NULL, '121.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1390, '1114A', 'SPOILER HONDA WAVE 110I (2012)', NULL, '73.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1391, '1125A', 'SPOILER HONDA SH MODE 125 \'13', NULL, '87.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1392, '1128A', 'SPOILER H.SH 125I-150I ABS', NULL, '78.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1393, '115KIT', 'KIT SPOILER YAM.MAJESTY', NULL, '12.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1394, '120A', 'AIRSTAR KEEWAY OUTLOOK 125-150', NULL, '98.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1395, '128A', 'SPOILER A. SPORTCITY 125-200\'0', NULL, '100.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1396, '130A', 'SPOILER  APRIL.SCARABEO 500\'06', NULL, '90.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1397, '130DT', 'SPOILER Y.MAJESTY 125-150\'01', NULL, '132.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1398, '134A', 'SPOILER P.BEVERLY 125-200-250', NULL, '85.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1399, '136A', 'SPOILER A. SPORTCITY 125-200\'0', NULL, '100.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1400, '137A', 'SPOILER KYMCO PEOPLE S\'05', NULL, '91.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1401, '140D', 'SPOILER YAMAHA FZ6\'04', NULL, '93.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1402, '147A', 'SPOILER BMW R 1200 R\'+F16707', NULL, '122.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1403, '153A', 'AIRSTAR FOR A.SCARABEO', NULL, '89.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1404, '154A', 'TRANSPARENT WINDSCREEN', NULL, '92.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1405, '156DT', 'SPOILER SUZ.BURG.250 TRASP', NULL, '146.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1406, '169A', 'SPOILER SUZ.SIXTEEN 125-150\'08', NULL, '90.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1407, '183A', 'SPOILER HONDA @125-150\'00', NULL, '110.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1408, '2111DT', 'SPOILER YAMAHA X-MAX 400 \'13', NULL, '148.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1409, '2114A', 'SPOILER Y.D\'ELIGHT 114\'13', NULL, '79.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1410, '2120DT', 'SPEC SCREEN TRICITY125', NULL, '136.00', 0, 10, 37, 75, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1411, '2121DT', 'SPECIFIC SCREEN Y. MAJESTY S', NULL, '86.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1412, '2122DT', 'SPEC SCREEN MT-09 TRACER', NULL, '128.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1413, '2123DT', 'SPEC SCREEN YAMAHA N-MAX 125', NULL, '75.00', 0, 10, 37, 75, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1414, '214DT', 'SPOILER H.SILVER WING 600 TRAN', NULL, '150.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1415, '240A', 'UNIV.SPOILER FOR NAKED BIKES', NULL, '127.00', 0, 10, 37, 81, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1416, '245A', 'UNIVER.AIRSTAR FOR NAKED MOTO', NULL, '76.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1417, '245N', 'UNIVER.AIRSTAR FOR NAKED MOTO', NULL, '95.00', 0, 10, 37, 81, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1418, '247A', 'UNIVER.AIRSTAR FOR NAKED TRAN.', NULL, '97.00', 0, 10, 37, 81, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1419, '247N', 'UNIVER.AIRSTAR FOR NAKED FUMEE', NULL, '90.00', 0, 10, 37, 81, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1420, '266DT', 'SPOILER SUZUKI BURGMAN TRAN.', NULL, '182.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1421, '288A', 'WINDSCREEN YAM.BW\'S 125 2010', NULL, '86.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1422, '290DT', 'SPOILER KYMCO GRAN DINK\'01', NULL, '127.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1423, '292DT', 'SPOILER KYMCO GRAN DINK 125\'07', NULL, '97.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1424, '293A', 'WINDSCREEN SYM FIDDLE II', NULL, '89.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1425, '297A', 'WINDSCREEN SYM SYMPHONYNY', NULL, '96.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1426, '307A', 'SPOILER HONDA SH 300\'07', NULL, '87.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1427, '308A', 'SPOILER HONDA SH 300\'07', NULL, '77.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1428, '3101DT', 'SPOILER SUZUKI DL650 V-STROM', NULL, '127.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1429, '3106DT', 'SPOILER SUZUKI BURGMAN 125-200', NULL, '169.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1430, '311A', 'SPOILER HONDA SH125-150\'05', NULL, '87.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1431, '313A', 'SPOILER HONDA SH125-150\'05', NULL, '88.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1432, '314A', 'SPOILER HONDA LEAD 100\'08', NULL, '79.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1433, '317DT', 'SPOILER HONDA CB 125\'09 FUMEE', NULL, '98.00', 0, 10, 37, 3, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1434, '323DT', 'SPOILER HONDA PCX125 \'10 CLEAR', NULL, '178.00', 0, 10, 37, 75, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1435, '330DT', 'SPOILER BMW R 1200 GS\'04', NULL, '149.00', 0, 10, 37, 74, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1436, '333DT', 'SPOILER BMW F650 GS-F800 GS\'08', NULL, '122.00', 0, 10, 37, 75, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1437, '340D', 'SPOILER GILERA FUOCO 500\'07', NULL, '156.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1438, '352A', 'SPOILER PIAG.CRUISER 250-500\'0', NULL, '163.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1439, '355A', 'SPOILER PIAGGIO VESPA 50-125', NULL, '101.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1440, '357A', 'SCREEN BLADE PIAG.BEVERLY', NULL, '71.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1441, '358A', 'SCREEN BLADE PIAG.BEVERLY', NULL, '101.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1442, '408D', 'SPOILER KAWASAKI KLR 650\'08', NULL, '146.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1443, '4100D', 'SPOILER KAWASAKI Z 1000SX 2011', NULL, '134.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1444, '4111DT', 'SPOILER KAWASAKI J300 (2014)', NULL, '193.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1445, '443A', 'KYMCO PEOPLE GTI 125 - 300', NULL, '88.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1446, '445DT', 'SPOILER SCOOTER YAMAHA MAJESTY', NULL, '196.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1447, '446DT', 'WINDSCREEN YAMAHA X-MAX', NULL, '141.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1448, '5600DT', 'SPOILER PIAG.MP3 YOURBAN 2011', NULL, '163.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1449, '5606A', 'SPOILER P.BEVERLY 125IE-300IE', NULL, '77.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1450, '5608A', 'SPOILER P.VESPA PRIMAVERA', NULL, '74.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1451, '5610A', 'SPOILER P.VESPA SPRINT 50-125', NULL, '67.00', 0, 10, 37, 81, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1452, '6102A', 'SPOILER KIMCO LIKE 50-125-200I', NULL, '93.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1453, '6401DT', 'SPOILER TRIUMPH TIGER 800/XC', NULL, '138.00', 0, 10, 37, 75, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1454, '6404KIT', 'FITTING KIT FOR PLR6404', NULL, '37.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1455, '642A', 'WINDSCREEN SCOOTER LML STAR', NULL, '88.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1456, '6704A', 'SPECIFIC SCREEN A.SCARABEO 50', NULL, '70.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1457, '7051DT', 'SPOILER SYM MAXSYM 400 (2011)', NULL, '164.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1458, '7053A', 'SPOILER SYM SYMPHONY50-125-151', NULL, '75.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1459, '8100A', 'SPOILER P.TWEET 50-125-150', NULL, '76.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1460, '810DT', 'SPOILER PEUGEOT GEOPOLIS 250', NULL, '134.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1461, 'A103A', 'KIT AIRSTAR P.BEVERLY 500', NULL, '51.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1462, 'A104A', 'KIT AIRSTAR P.VESPA125-200', NULL, '60.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1463, 'A106A', 'KIT AIRSTAR P.BEVERLY 500\'03', NULL, '50.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1464, 'A107A', 'KIT AIRSTAR P.LIBERTY 50-125-2', NULL, '48.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1465, 'A1100A', 'Screen Fitting Kit SH300i', NULL, '62.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1466, 'A1101A', 'KIT FOR AIRST.HON.CB1000R 2011', NULL, '85.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1467, 'A1102', 'SPECIFIC SCREEN H.HORNET 600', NULL, '188.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1468, 'A1106A', 'FITTING KIT FOR 308A', NULL, '59.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1469, 'A110A', 'KIT AIRSTAR PIAG.FLY 50/125 04', NULL, '51.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1470, 'A1114A', 'KIT AIRSTAR HONDA WAVE 110I\'12', NULL, '58.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1471, 'A1117A', 'KIT AIRSTAR H.SH125I-SH150I', NULL, '50.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1472, 'A1125A', 'KIT FOR AIRST.H.SH MODE 125\'13', NULL, '65.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1473, 'A1126', 'SPECIFIC SCREEN H.CB500F\'13-14', NULL, '138.00', 0, 10, 37, 81, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1474, 'A1137', 'SPECIFIC SCREEN H. CB650F\'14', NULL, '172.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1475, 'A123', 'AIRSTAR YAMAHA VMAX 1200', NULL, '161.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1476, 'A129A', 'KIT AIRSTAR A.SPORTCITY\'O5', NULL, '56.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1477, 'A130A', ' KIT AIRSTAR A.SCARABEO', NULL, '5.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1478, 'A137A', 'KIT AIRSTAR KIMCO PEOPLE S', NULL, '56.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1479, 'A147A', 'KIT FOR AIRST.BMW R1200 R\'07', NULL, '52.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1480, 'A148A', 'KIT AIRSTAR SCARABEO 250\'06-07', NULL, '41.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1481, 'A150A', 'KIT AIRSTAR SPORTCITY', NULL, '61.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1482, 'A151A', 'KIT AIRSTAR SPORTCITY', NULL, '66.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1483, 'A154A', 'AIRSTAR  KIT A. SCARABEO', NULL, '46.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1484, 'A167A', 'KIT FOR 245N SUZUKI GSR 600\'06', NULL, '45.00', 0, 10, 37, 3, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1485, 'A169A', 'KIT AIRSTAR SUZUKI SIXTEEN', NULL, '75.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1486, 'A170A', 'KIT FOR 247N SUZUKI GSR 600\'08', NULL, '47.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1487, 'A172', 'SPECIFIC SCREEN SUZUKI GLADIUS', NULL, '164.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1488, 'A185A', 'KIT AIRSTAR HONDA DYLAN 125-15', NULL, '67.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1489, 'A186A', 'KIT AIRTSAR HONDA SH 125-150', NULL, '58.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1490, 'A200', 'UNIVER.SPOILER COMPLETE WITH', '1520075580_A200.jpg', '107.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 11:13:06', 0),
(1491, 'A210', 'UNIV.SPOILER WITH KIT-SMOKED', '1520075554_A210.jpg', '117.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 11:12:40', 0),
(1492, 'A2102A', 'KIT AIRSTAR Y.XENTER125-150\'12', NULL, '50.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1493, 'A2113A', 'KIT AIRSTAR Y.AEROX R (2013)', NULL, '48.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1494, 'A2114A', 'KIT AIRSTAR Y.D\'ELIGHT 114\'13', NULL, '60.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1495, 'A2115', 'SPECIFIC SCREEN FUME\' YAMAHA', NULL, '122.00', 0, 10, 37, 81, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1496, 'A2118', 'SPECIFIC SCREEN FUME\' YAMAHA', NULL, '132.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1497, 'A2132', 'SMOKE SCREEN FUME MT-09 2017', NULL, '150.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1498, 'A2132BL', 'ICE SCREEN FUME MT-09 2017', NULL, '170.00', 0, 10, 37, 75, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1499, 'A23', 'AS SCREEN - LOWER &amp; CLEAR VERS', NULL, '90.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1500, 'A240A', 'UNIVERSAL KIT FOR  240A', NULL, '20.00', 0, 10, 37, 3, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1501, 'A259A', 'KIT AIRSTAR HONDA LEAD 100', NULL, '63.00', 0, 10, 37, 3, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1502, 'A281A', 'KIT FOR 245A', NULL, '34.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1503, 'A283A', 'KIT AIRSTAR Y.CIGNUS X125 \'07', NULL, '63.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1504, 'A285A', 'KIT AIRSTAR YAMAHA NEO\'S 50', NULL, '76.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1505, 'A286', 'SPECIFIC SCREEN FUMEE YAMAHA', NULL, '154.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1506, 'A287', 'Windscreen Yamaha FZ8', NULL, '168.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1507, 'A287N', 'Windscreen Yamaha FZ8', NULL, '186.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1508, 'A288A', 'KIT AIRSTAR YAM.BW\'S 125  \'10', NULL, '59.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1509, 'A289A', 'KIT AIRSTAR YAM. VITY 125\'10', NULL, '56.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1510, 'A293A', 'FITTING KIT SYM FIDDLE II', NULL, '42.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1511, 'A297A', 'AIRSTAR  KIT SYM SYMPHONY', NULL, '62.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1512, 'A298A', 'KIT AIRSTAR SYMHD EVO/PEUG.LXR', NULL, '72.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1513, 'A303A', 'FIXING KIT FOR MONRACK303 ZOOMER', NULL, '107.00', 0, 10, 37, 3, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0);
INSERT INTO `mah_product` (`id`, `name`, `desc`, `image`, `price`, `interested`, `brand`, `cate`, `type`, `status`, `created`, `modified`, `ctl`) VALUES
(1514, 'A305', 'SPECIFIC SCREEN FUME\' HONDA', NULL, '133.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1515, 'A307A', 'KIT AIRSTAR HONDA SH 300\'07', NULL, '39.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1516, 'A309', 'SPECIFIC SCREEN FUME\' HONDA', NULL, '166.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1517, 'A31', 'UNIV.WINDSCREEN', NULL, '139.00', 0, 10, 37, 81, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1518, 'A310', 'SPECIFIC SCREEN FUME\' HONDA', NULL, '171.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1519, 'A3100', 'SPECIFIC SCREEN SUZUKI GSR 750', NULL, '205.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1520, 'A311A', 'KIT AIRSTAR HONDA SH\'05 125-15', NULL, '44.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1521, 'A314A', 'KIT AIRSTAR HONDA LEAD 110\'08', NULL, '57.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1522, 'A315A', 'KIT AIRSTAR HONDA SH125-150\'09', NULL, '49.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1523, 'A34', 'UNIVERSAL SCREEN FOR A620', NULL, '120.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1524, 'A352A', 'KIT AIRSTAR P.BEVERLY', NULL, '60.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1525, 'A354A', 'KIT AIRSTAR P.VESPA S50-125\'07', NULL, '44.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1526, 'A357A', 'FITTING KIT P.BEVERLY 125IE', NULL, '44.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1527, 'A35N', 'AIRSTAR SCREEN-BLACK', NULL, '137.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1528, 'A36', 'AIRSTAR SCREEN-LOW &amp; TRANSP.', NULL, '90.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1529, 'A37N', 'AIRSTAR SCREEN FOR AS126-BLACK', NULL, '137.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1530, 'A39', 'UNIVERSAL CUSTOM SCREEN', NULL, '199.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1531, 'A4101', 'SPECIFIC SCREEN KAWASAKI W800', NULL, '131.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1532, 'A4104', 'SPECIFIC SCREEN KAW.ER6N-6F\'12', NULL, '174.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1533, 'A4109', 'SPECIFIC SCREEN KAW. Z800\'13', NULL, '140.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1534, 'A41N', 'CUSTOM BLACK AIRSTAR FOR AS300', NULL, '150.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1535, 'A42', 'LOW TRANS. SCREEN FOR AS300', NULL, '98.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1536, 'A440A', 'KIT AIRSTAR KIMCO AGILITY', NULL, '32.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1537, 'A442A', 'KIT AIRSTAR KIMCO LIKE 50-125', NULL, '48.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1538, 'A443A', 'FITTING KIT KYMCO PEOPLE GT', NULL, '71.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1539, 'A446', 'SPECIFIC SCREEN KAWASAKI', NULL, '161.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1540, 'A448A', 'KIT FOR 247N KAWAS. ER-6N\'09', NULL, '48.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1541, 'A449', 'SMOKED AIRSTAR KAWASAKI Z', NULL, '173.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1542, 'A46', 'SPECIFIC SCREEN BLADE AS103A2', NULL, '161.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1543, 'A47', 'UNIVERSAL CUSTOM SCREEN FOR', NULL, '144.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1544, 'A5100A', 'KIT FOR AIRST.BMW R1200R 2011', NULL, '79.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1545, 'A5115A', 'KIT A900N902 BMW R1200 NINE-T', NULL, '75.00', 0, 10, 37, 3, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1546, 'A5602A', 'KIT AIRSTAR P.TYPH. 50-125 \'11', NULL, '56.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1547, 'A5603A', 'KIT AIRSTAR P.VESPA 125-150\'12', NULL, '44.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1548, 'A5606A', 'FITTING KIT P.BEVERLY 125IE', NULL, '52.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1549, 'A5607A', 'KIT AIRSTAR P.ZIP 2T-4T  50\'13', NULL, '50.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1550, 'A5608A', 'KIT AIRSTAR  P.VESPA PRIMAVERA', NULL, '67.00', 0, 10, 37, 3, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1551, 'A601', 'CUSTOM UNIVERSAL AIRSTAR', '1520075352_A601.jpg', '143.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 11:09:17', 0),
(1552, 'A603', 'UNIVERSAL AIRSTAR (SMALL)', '1520075295_A603.jpg', '140.00', 0, 10, 37, 75, 'a', '2018-03-03 18:03:05', '2018-03-03 11:08:28', 0),
(1553, 'A604', 'CUSTOM UNIVERSAL SCREEN (A30)', '1520075264_A604.jpg', '143.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 11:07:49', 0),
(1554, 'A6102A', 'KIT AIRSTAR KIMCO LIKE 50-125-', NULL, '49.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1555, 'A6106A', 'KIT AIRSTAR KYMCO AGILITY R16+', NULL, '44.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1556, 'A6405', 'SPECIFIC SCREEN TRIUMPH', NULL, '163.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1557, 'A642A', 'AIRSTAR KIT LML STAR 125', NULL, '58.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1558, 'A660', 'UNIVERSAL SMOKED AIRSTAR', '1520075201_A660.jpg', '135.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 11:06:46', 0),
(1559, 'A6704A', 'KIT AIRSTAR A.SCARABEO 50-100', NULL, '46.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1560, 'A7050A', 'KIT AIRSTAR SYM HD2 125-200\'11', NULL, '73.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1561, 'A7053A', 'AIRSTAR  KIT SYM SYMPHONY', NULL, '45.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1562, 'A7404', 'SPECIFIC SCREEN DUCATI', NULL, '137.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1563, 'A7701A', 'KIT FOR 247A/N KTM DUKE 125\'11', NULL, '54.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1564, 'A7702A', 'Screen Fitting Kit', NULL, '36.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1565, 'A780', 'SPECIFIC SCREEN DUCATI', '1520075160_A780.jpg', '193.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 11:06:05', 0),
(1566, 'A781A', 'FITTING KIT FOR  DUCATI', NULL, '45.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1567, 'A800N', 'SPECIFIC SCREEN BMW R1200NINET', '1520075120_A800N_still.jpg', '638.00', 0, 10, 37, 75, 'a', '2018-03-03 18:03:05', '2018-03-03 11:05:24', 0),
(1568, 'A8100A', 'KIT AIRSTAR P.TWEET 50-125-150', NULL, '42.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1569, 'A8201A', 'SPECIFIC SCREEN MOTO GUZZI V7', NULL, '112.00', 0, 10, 37, 3, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1570, 'A850A', 'KIT AIRSTAR  KEEWAY OUTLOOK', NULL, '46.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1571, 'A852A', 'KIT AIRSTAR KEEWAY RY8 50 EVO', NULL, '59.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1572, 'A9100A', 'KIT AIRSTAR  KEEWAY LOGIK', NULL, '66.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1573, 'AF1100', 'AIRSTAR HON.SH300I 2011', NULL, '213.00', 0, 10, 37, 82, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1574, 'AF1110', 'WINDSCREEN H.CROSSTOURER 1200', NULL, '184.00', 0, 10, 37, 82, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1575, 'AF1123', 'AIRSTAR HON.FORZA 300ABS \'13', NULL, '221.00', 0, 10, 37, 82, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1576, 'AF1144', 'AIRFLOW WINDSHIELD AFRICA TWIN', NULL, '188.00', 0, 10, 37, 82, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1577, 'AF214', 'AIRSTAR H.SILVER-WING 400-600\'', NULL, '225.00', 0, 10, 37, 82, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1578, 'AF260', 'WINDSCREEN SUZ. DL 650-1000', NULL, '199.00', 0, 10, 37, 82, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1579, 'AF266', 'AIRSTAR SUZ.BURGMAN400', NULL, '272.00', 0, 10, 37, 82, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1580, 'AF308', 'WINDSCREEN FOR SCOOTER', NULL, '190.00', 0, 10, 37, 82, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1581, 'AF3101', 'WINDSCREEN SUZ.DL650 V-STRO.L2', NULL, '201.00', 0, 10, 37, 82, 'a', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1582, 'AF3105', 'WINDSCREEN SUZ.DL1000 V-STROM', NULL, '181.00', 0, 10, 37, 82, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1583, 'AF318', 'AIRSTAR HONDA SW-T 400', NULL, '230.00', 0, 10, 37, 82, 'o', '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(1584, 'AF330', 'AIRSTAR BMW R1200GS 04-09 TRAN', '1520075082_AF330.jpg', '233.00', 0, 10, 37, 82, 'o', '2018-03-03 18:03:06', '2018-03-03 11:04:47', 0),
(1585, 'AF4105', 'WINDSCREEN K.VERSYS 1000\'12\'15', NULL, '189.00', 0, 10, 37, 82, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1586, 'AF442', 'WINDSCREEN FOR SCOOTER', NULL, '243.00', 0, 10, 37, 82, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1587, 'AF446', 'WINDSCREEN FOR SCOOTER', NULL, '271.00', 0, 10, 37, 82, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1588, 'AF447', 'WINDSCREEN YAM XT1200Z 2010', NULL, '212.00', 0, 10, 37, 82, 'a', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1589, 'AF49', 'UNIVERSAL AIRFLOW WINDSCREEN', '1520075028_AF49.jpg', '262.00', 0, 10, 37, 82, 'a', '2018-03-03 18:03:06', '2018-03-03 11:03:56', 0),
(1590, 'AF504', 'AIRSTAR PIAGGIO MP3', NULL, '229.00', 0, 10, 37, 82, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1591, 'AF5107', 'AIRSTAR BMW F700GS(2013)', NULL, '215.00', 0, 10, 37, 82, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1592, 'AF5110', 'AIRSTAR BMW F800GS ADV.(13-14)', NULL, '204.00', 0, 10, 37, 82, 'a', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1593, 'AF5600', 'AIRSTAR PIAG.MP3 YOUR.125-300', NULL, '287.00', 0, 10, 37, 82, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1594, 'AF5601', 'AIRSTAR PIAG.MP3 T.300-400(11)', NULL, '217.00', 0, 10, 37, 82, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1595, 'AF5604', 'AIRSTAR PIAG.X10 125-350-500', NULL, '251.00', 0, 10, 37, 82, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1596, 'AF6103', 'WINDSCREEN K.K-XCT 125I-300I', NULL, '235.00', 0, 10, 37, 82, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1597, 'AF6401', 'AIRSTAR TRIUMPH TIGER800/800XC', NULL, '261.00', 0, 10, 37, 82, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1598, 'AF6403', 'AIRSTAR T.TIGER EXPLORER 1200', NULL, '199.00', 0, 10, 37, 82, 'a', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1599, 'AF7703', 'AIRSTAR KTM 1190 ADV.-ADV R\'13', NULL, '224.00', 0, 10, 37, 82, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1600, 'AS100A2', 'KIT FOR AIRSTAR CUSTOM UNIV.', NULL, '216.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1601, 'AS103A2', 'KIT FOR AIRSTAR YAMAHA XVS', NULL, '178.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1602, 'AS121A2', 'KIT FOR AIRSTAR H. SHADOW', NULL, '172.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1603, 'AS122A2', 'KIT FOR AIRSTAR H.VT750S 2010', NULL, '242.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1604, 'AS128A2', 'KIT FOR AIRSTAR KAW.VN 900 CL.', NULL, '225.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1605, 'D1104KIT', 'FITTING KIT 1104DT', NULL, '35.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1606, 'D1105KIT', 'FITTING KIT FOR SPOILER CBR600', NULL, '29.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1607, 'D1109B', 'SPOILER HONDA INTEGRA 700\'12', NULL, '118.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1608, 'D1109ST', 'SPOILER HONDA INTEGRA 700\'12', NULL, '172.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1609, 'D1110ST', 'SPOILER H. CROSSTOURER 1200\'12', NULL, '126.00', 0, 10, 37, 75, 'a', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1610, 'D1111ST', 'SPOILER HONDA NC700X \'12-\'13', NULL, '114.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1611, 'D1112S', 'SPOILER HON.NC700S\'12-\'13', NULL, '81.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1612, 'D1113S', 'SPOILER HONDA CBR 1000 RR \'12', NULL, '146.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1613, 'D1119S', 'SPOILER HONDA CBR500R (2013)', NULL, '125.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1614, 'D1121ST', 'SPOILER HONDA CB500X (2013)', NULL, '114.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1615, 'D1122S', 'SPOILER HONDA CBR600RR (2013)', NULL, '135.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1616, 'D1123ST', 'SPOILER HONDA FORZA 300ABS \'13', NULL, '161.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1617, 'D1130ST', 'SPOILER HONDA PCX 125-150 \'14', NULL, '96.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1618, 'D1132S', 'SPOILER H. VFR800F (2014)', NULL, '154.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1619, 'D1133ST', 'SPOILER HONDA CTX700 DCT(2014)', NULL, '139.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1620, 'D1134ST', 'SPOILER HONDA CTX1300 (2014)', NULL, '164.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1621, 'D1136ST', 'SPOILER HONDA PCX 125-150 \'14', NULL, '78.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1622, 'D1138S', 'SECIFIC SCREEN H.CBR650F\'14', NULL, '120.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1623, 'D1139ST', 'SCREEN CROSS RUNNER 800', NULL, '132.00', 0, 10, 37, 75, 'a', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1624, 'D1144B0', 'SPOILER CRF1000L AFRICA TWIN', NULL, '102.00', 0, 10, 37, 75, 'a', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1625, 'D1144S', 'SPOILER CRF1000L AFRICA TWIN', NULL, '94.00', 0, 10, 37, 75, 'a', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1626, 'D1144ST', 'SPOILER CRF1000L AFRICA TWIN', NULL, '119.00', 0, 10, 37, 75, 'a', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1627, 'D1146ST', 'SPOILER HONDA NC750X 2016', NULL, '108.00', 0, 10, 37, 75, 'a', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1628, 'D1156ST', 'SPOILER HONDA X ADV', NULL, '107.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1629, 'D115ST', 'SPOILER YAM.MAJ 250 TRANSP', NULL, '151.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1630, 'D116S', 'SPOILER TDM850\'96\\XJ600DIV.\'96', NULL, '117.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1631, 'D127ST', 'SPOILER YAM.MAJE.250 \'00 TR.', NULL, '179.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1632, 'D128B', 'SPOILER YAMAHA T-MAX 500\'01.', NULL, '108.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1633, 'D128ST', 'SPOILER YAMAHA T-MAX 500\'01', NULL, '187.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1634, 'D129S', 'SPOILER YAM.FZS 1000\'01 FAZER', NULL, '122.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1635, 'D130KIT', 'KIT SPOILER YAM.MAJESTY 125', NULL, '17.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1636, 'D132S', 'SPOILER YAMAHA TDM 900\'02', NULL, '119.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1637, 'D134ST', 'SPOILER YAMAHA FJR 1300\'01-02', NULL, '126.00', 0, 10, 37, 75, 'a', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1638, 'D136ST', 'SPOILER YAMAHA FZ6 FAZER 2004', NULL, '132.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1639, 'D137ST', 'SPOILER YAMAHA MAJESTY 400\'04', NULL, '169.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1640, 'D140KIT', 'FITTING KIT FOR SPOILER', NULL, '49.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1641, 'D156KIT', 'KIT SPOILER SUZ.BURGMAN', NULL, '43.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1642, 'D174S', 'SPOILER KAWASAKI ZRX 1100S', NULL, '121.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1643, 'D180S', 'SPOILER HONDA 600 TRANSALP', NULL, '109.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1644, 'D182S', 'SPOILER HONDA CN250 SCOOTER', NULL, '153.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1645, 'D184S', 'SPOILER HONDA ST1100 PAN-E.', NULL, '169.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1646, 'D191S', 'SPOILER HONDA 600 TRANSALP 94', NULL, '137.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1647, 'D195S', 'SPOILER HON.AFRICA TWIN 750 96', NULL, '137.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1648, 'D199KIT', 'KIT SPOILER HONDA FORES.250', NULL, '10.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1649, 'D199S', 'SPOILER HONDA FORESIGHT', NULL, '140.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1650, 'D199ST', 'SPOILER TRANSP.H.FORESIGHT 250', NULL, '134.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1651, 'D200S', 'SPOILER HONDA VFR 800  98', NULL, '144.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1652, 'D2013B', 'SPOILER YAMAHA T-MAX 530\'12', NULL, '109.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1653, 'D2013BO', 'SPOILER YAM.T-MAX 530\'12 DULL', NULL, '133.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1654, 'D2013ST', 'SPOILER YAMAHA T-MAX 530\'12', NULL, '172.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1655, 'D201S', 'SPOILER HONDA DEAUVILLE', NULL, '122.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1656, 'D202ST', 'SPOILER TRANSP.H.FORESIGHT 250', NULL, '135.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1657, 'D203S', 'SPOILER HON.VARADERO XLV1000', NULL, '159.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1658, 'D203ST', 'SPOILER HON.VARADERO XLV1000', NULL, '159.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1659, 'D205S', 'SPOILER HON.600 TRANSALP 94/98', NULL, '143.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1660, 'D209S', 'SPOILER H.XL 650V TRANSALP 00', NULL, '128.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1661, 'D2102ST', 'SPOILER YAM.XENTER 125-150 \'12', NULL, '105.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1662, 'D2106S', 'SPOILER YAM.YZF R1 1000\'09-\'12', NULL, '172.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1663, 'D2109ST', 'SPOILER YAMAHA FJR 1300\'13', NULL, '150.00', 0, 10, 37, 75, 'a', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1664, 'D2111KIT', 'KIT FOR AIRST.Y.X-MAX 400\'13', NULL, '58.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1665, 'D2119ST', 'SPOILER Y. XT1200ZE SUPERT.\'14', NULL, '134.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1666, 'D2120KIT', 'SPECIFIC FITTING KIT 2120DT', NULL, '33.00', 0, 10, 37, 3, 'a', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1667, 'D2120ST', 'SPECIFIC SCREEN Y.TRICITY 125', NULL, '133.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1668, 'D2121KIT', 'SPECIFIC FITTING KIT FOR', NULL, '32.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1669, 'D2122KIT', 'FITTINGKIT SCREEN MT-09 TRACER', NULL, '49.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1670, 'D2122S', 'SPOILER MT-09 TRACER TINTED', NULL, '114.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1671, 'D2123KIT', 'SPEC FITTING KIT 2123DT', NULL, '40.00', 0, 10, 37, 3, 'a', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1672, 'D2129B', 'SPOILER MT-10', NULL, '139.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1673, 'D2129S', 'SPOILER MT-10', NULL, '168.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1674, 'D2136S', 'SPOILER Xmax 300', NULL, '108.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1675, 'D213S', 'SPOILER HONDA CBR 600F \'99-04', NULL, '134.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1676, 'D214KIT', 'KIT SPOILER HON.SILVER WING 60', NULL, '20.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1677, 'D215S', 'SPOILER HONDA XL 125V VARADERO', NULL, '134.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1678, 'D217S', 'SPOILER HONDA VFR 800 \'02/04', NULL, '142.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1679, 'D219ST', 'SPOILER TRA.H.PANTHEON 125-150', NULL, '153.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1680, 'D225ST', 'SPOILER TR.TIGER 1050\'07-\'13', NULL, '133.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1681, 'D229ST', 'SPOILER P.X9 250/500\'03-EVOLUL', NULL, '118.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1682, 'D230S', 'SPOILER BMW 650F', NULL, '154.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1683, 'D232S', 'SPOILER BMW F650 ST 97', NULL, '121.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1684, 'D233S', 'SPOILER BMW R 1150 GS \'00', NULL, '121.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1685, 'D234S', 'SPOILER BMW F650 GS\'00', NULL, '140.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1686, 'D237S', 'SPOILER APRILIA PEGASO 650', NULL, '117.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1687, 'D239ST', 'SPOILER APRILIA ETV 1000 C.NOR', NULL, '139.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1688, 'D240ST', 'SPOILER APRILIA ATLANTIC 500', NULL, '157.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1689, 'D241ST', 'SPOILER BMW R 1150RT\'02 TRANSP', NULL, '151.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1690, 'D242ST', 'SPOILER AP.ATLANTIC 125-200\'03', NULL, '179.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1691, 'D255ST', 'SPOILER SUZUKI DL 1000 V-STROM', NULL, '122.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1692, 'D256ST', 'SPOILER SUZUKI BURGMAN 125\'02', NULL, '147.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1693, 'D257ST', 'SPOILER SUZ.BURGMAN AN 650\'02', NULL, '177.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1694, 'D258ST', 'SPOILER SUZUKI BURGMAN 250', NULL, '179.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1695, 'D260S', 'SPOILER SUZUKI DL 650-1000\'04 ', NULL, '146.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1696, 'D260ST', 'SPOILER SUZ. DL650 V-STROM \'04', NULL, '146.00', 0, 10, 37, 75, 'a', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1697, 'D262S', 'SPOILER SUZUKI BANDIT 650S \'05', NULL, '125.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1698, 'D263ST', 'SPOILER SUZUKI BURGMAN 650', NULL, '175.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1699, 'D264DB', 'SCREEN GSXR750 D264DB', NULL, '105.00', 0, 10, 37, 75, 'a', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1700, 'D266KIT', 'KIT SPOILER SUZ.BURGMAN 400K7', NULL, '31.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1701, 'D267KIT', 'KIT SPOILER SUZ.BURGMAN 200', NULL, '39.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1702, 'D270S', 'SPOILER SUZUKI GSX 650F\'08', NULL, '153.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1703, 'D272ST', 'Windscreen Ducati Multistrada 1200.', NULL, '138.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1704, 'D290KIT', 'KIT SPOILER KIMCO GD\'01 125-15', NULL, '22.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1705, 'D292KIT', 'KIT SPOILER KYMCO DINK 125\'07', NULL, '61.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1706, 'D293ST', 'SPOILER KYMCO XCITING', NULL, '186.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1707, 'D294ST', 'TRANS.WINDSCREEN KYMCO', NULL, '186.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1708, 'D295ST', 'TRANS.WINDSCREEN KYMCO XCITING', NULL, '189.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1709, 'D300S', 'SPOILER H.VARADERO XLV1000\'03', NULL, '149.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1710, 'D300ST', 'SPOILER H.VARADERO XLV1000 \'03', NULL, '138.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1711, 'D303ST', 'SPOILER HON. CBF 600\'04 TRANSP', NULL, '126.00', 0, 10, 37, 75, 'a', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1712, 'D305DB', 'SCREEN CBR600 D305DB', NULL, '95.00', 0, 10, 37, 75, 'a', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1713, 'D306ST', 'SPOILER HONDA FORZA 250\'05', NULL, '119.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1714, 'D307ST', 'SPOILER HONDA DEAUVILLE\'06', NULL, '103.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1715, 'D3101KIT', 'KIT SPOILER SUZ.DL650 V-STROM', NULL, '12.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1716, 'D3104ST', 'SPOILER SUZ.BURGMAN 650 \'13', NULL, '190.00', 0, 10, 37, 75, 'a', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1717, 'D3105ST', 'SPOILER SUZ.DL1000 V-STROM\'14', NULL, '120.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1718, 'D3106ST', 'SPOILER SUZ.BURGMAN 125-200', NULL, '150.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1719, 'D311S', 'SPOILER HONDA XL 125V VARADERO', NULL, '111.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1720, 'D312ST', 'SPOILER HONDA S.WING125-150\'07', NULL, '158.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1721, 'D313S', 'SPOILER HONDA XL 700V TRANSALP', NULL, '104.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1722, 'D315KIT', 'FITTING KIT FOR SPOILER', NULL, '47.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1723, 'D316S', 'SPOILER HONDA DN-01 FUME\' 08', NULL, '186.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1724, 'D317KIT', 'KIT SPOILER HONDA CBF 125\'09', NULL, '22.00', 0, 10, 37, 3, 'a', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1725, 'D318ST', 'SPOILER SW-T400 \'09', NULL, '171.00', 0, 10, 37, 75, 'a', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1726, 'D320ST', 'SPOILER HONDA CBF1000/1000ST', NULL, '122.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1727, 'D321S', 'SPOILER HONDA PCX 125 \'10 \'', NULL, '181.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1728, 'D322S', 'SPOILER HONDA PCX 125 \'10 FUME', NULL, '93.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1729, 'D322ST', 'SPOILER HONDA PCX125 \'10 CLEAR', NULL, '78.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1730, 'D323KIT', 'FITTING KIT SPOILER  H.PCX 125', NULL, '12.00', 0, 10, 37, 3, 'a', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1731, 'D330KIT', 'FITTING KIT FOR SPOILER', NULL, '21.00', 0, 10, 37, 75, 'a', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1732, 'D331ST', 'SPOILER BMW F650GS 2004', '1520074962_D331ST.jpg', '117.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 11:02:47', 0),
(1733, 'D332ST', 'SPOILER BMW F800S/F800ST\'06-07', NULL, '116.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1734, 'D333KIT', 'FITTING KIT FOR SPOILER', NULL, '18.00', 0, 10, 37, 3, 'a', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1735, 'D340KIT', 'KIT SPOILER GILERA FUOCO', NULL, '62.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1736, 'D351ST', 'SPOILER GILERA NEXUS 250-500\'', NULL, '116.00', 0, 10, 37, 75, 'a', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1737, 'D352ST', 'SPOILER GILERA GP 800\'08', NULL, '112.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1738, 'D40', 'KIT FOR UNIVERSAL AIRSTAR', NULL, '50.00', 0, 10, 37, 3, 'a', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1739, 'D405ST', 'SPOILER KAWASAKI VERSYS 650', NULL, '112.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1740, 'D406S', 'SPOILER KAWASAKI ZZR 1400-ZX14', NULL, '168.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1741, 'D407ST', 'SPOILER KAWASAKI GTR 1400\'07', NULL, '159.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1742, 'D408KIT', 'FITTING KIT FOR SPOILER', NULL, '34.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1743, 'D4100KIT', 'FITTING KIT SPOILER KAW.Z1000S', NULL, '21.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1744, 'D4104S', 'SPOILER KAWASAKI ER-6F\'12 FUME', NULL, '121.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1745, 'D4105ST', 'SPOILER KAWASAKI VERSYS 1000', NULL, '128.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1746, 'D4106S', 'SPOILER KAWASAKI ZZR1400 \'12', NULL, '164.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1747, 'D4107S', 'SPOILER KAWASAKI NINJIA 250R', NULL, '150.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1748, 'D4108S', 'SPOILER KAWASAKI NINJIA 300\'13', NULL, '129.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1749, 'D410ST', 'SPOILER KAWASAKI VERSYS 650', NULL, '114.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1750, 'D4111KIT', 'KIT SPOILER KAWASAKI J300 \'14', NULL, '10.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1751, 'D4113ST', '', NULL, '143.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1752, 'D4114ST', 'SCREEN KAW VERSYS 650', NULL, '128.00', 0, 10, 37, 75, 'a', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1753, 'D430DB', 'SCREEN R1/04 D430DB', NULL, '105.00', 0, 10, 37, 75, 'a', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1754, 'D432ST', 'SPOILER Y.VERSITY 300/XC300 04', NULL, '143.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1755, 'D433S', 'SPOILER YAMAHA XT660R/X 04/05', NULL, '113.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1756, 'D435DB', 'SCREEN R6/06 D435DB', NULL, '116.00', 0, 10, 37, 75, 'a', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1757, 'D436ST', 'SPOILER YAMAHA FJR 1300\'06', NULL, '122.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1758, 'D437S', 'SPOILER YAMAHA FZ1 FAZER\'06', NULL, '109.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1759, 'D438ST', 'SPOILER YAMAHA X-MAX 250\'05-06', NULL, '113.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1760, 'D439ST', 'SPOILER YAMAHA X-CITY250\'07', NULL, '127.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1761, 'D440KIT', 'SPOILER FIT KIT FZ6 FAZER S2', NULL, '28.00', 0, 10, 37, 3, 'a', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1762, 'D442B', 'SPOILER YAMAHA T-MAX 500\'08', NULL, '132.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1763, 'D442ST', 'SPOILER YAMAHA T-MAX 500\'08', NULL, '179.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1764, 'D443ST', 'SPOILER YAM.XT 660Z TENERE\'08', NULL, '101.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1765, 'D444S', 'SPOILER YAMAHA XJ6 DIVERSION', NULL, '133.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1766, 'D445KIT', 'KIT SPOILER YAM.MAJESTY 400\'09', NULL, '33.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1767, 'D446B', 'SPOILER YAMAHA X-MAX 125-250', NULL, '85.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1768, 'D446KIT', 'SPOILER KIT YAM. X-MAX 125-250', NULL, '62.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1769, 'D447ST', 'SPOILER YAM.XT1200Z S.TEN.2010', NULL, '143.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1770, 'D448S', 'SPOILER YAMAHA FAZER 8 \'10', NULL, '164.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1771, 'D449S', 'SPOILER YAMAHA XJ6 DIVERSION F', NULL, '162.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1772, 'D45', 'KIT FOR UNIVERSAL AIRSTAR', NULL, '79.00', 0, 10, 37, 3, 'a', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1773, 'D488S', 'SPOILER YAM FAZER 8', NULL, '169.00', 0, 10, 37, 3, 'a', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1774, 'D500ST', 'SPOILER PIAGGIO X8 125-200\'04', NULL, '170.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1775, 'D501ST', 'SPOILER PIAGGIO MP3 250\'06', NULL, '174.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1776, 'D502S', 'SPOILER PIAG.MP3 125-250-400', NULL, '117.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1777, 'D5101ST', 'SPOILER BMW G6500GS (2011)', NULL, '114.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1778, 'D5105ST', 'SPOILER BMW C600 SPORT \'12', NULL, '287.00', 0, 10, 37, 75, 'a', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1779, 'D5106ST', 'SPOILER BMW C650GT (12-13)', NULL, '287.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1780, 'D5107KIT', 'KIT SPOILER BMW F700GS (2013)', NULL, '37.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1781, 'D5108B', 'SPOILER BMW R1200GS \'13 H485MM', NULL, '102.00', 0, 10, 37, 81, 'a', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1782, 'D5108KIT', 'KIT SPOILER BMW R1200GS\'13', NULL, '34.00', 0, 10, 37, 3, 'a', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1783, 'D5109S', 'SPOILER BMW F800GT SMOKED \'13', NULL, '150.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1784, 'D5109ST', 'SPOILER BMW F800GT (2013)', NULL, '187.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1785, 'D5110ST', 'SPOILER BMW F800GS ADV. (2013)', NULL, '164.00', 0, 10, 37, 75, 'a', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1786, 'D5120ST', 'SPOILER BMW R1200RS 2015', NULL, '138.00', 0, 10, 37, 75, 'a', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1787, 'D5600KIT', 'KIT SPOILER PIA.MP3 YOURBAN\'11', NULL, '71.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1788, 'D5600ST', 'SPOILER PIAG.MP3 YOURBAN 125-', NULL, '111.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1789, 'D5601ST', 'SPOILER PIAG.MP3 TOURING 300-', NULL, '157.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1790, 'D5604ST', 'SPOILER P.X10 125-350-500 \'12', NULL, '197.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1791, 'D6101ST', 'TRANS.WINDSCREEN KIMKO G-DINK', NULL, '161.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1792, 'D6103ST', 'SPOILER K.K-XCT 125I-300I \'13', NULL, '193.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1793, 'D6104ST', 'TRANS.WINDSCREEN K.XCITING400I', NULL, '198.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1794, 'D610ST', 'SPOILER GUZZI STELVIO 1200\'08', NULL, '122.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1795, 'D6401KIT', 'FITTING KIT FOR SPOILER TRIUMP', NULL, '50.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1796, 'D650ST', 'SPOILER SYM CITYCOM 300\'08', NULL, '110.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1797, 'D651ST', 'SPOILER SYM JOYRIDE EVO', NULL, '153.00', 0, 10, 37, 75, 'a', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1798, 'D6703ST', 'TRANSP.WINDSCREEN APR.SRV850', NULL, '168.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1799, 'D6706ST', 'TRANS.WINDSCREEN A. CAPONORD', NULL, '126.00', 0, 10, 37, 75, 'a', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1800, 'D7051KIT', 'KIT FOR AIRST.SYM MAXSYM400\'11', NULL, '59.00', 0, 10, 37, 3, 'a', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1801, 'D7052ST', 'SPOILER SYM JOYMAX 300I \'12', NULL, '163.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1802, 'D7401NO', 'SPOILER D. MULTISTRADA 1200\'13', NULL, '96.00', 0, 10, 37, 81, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1803, 'D7401ST', 'SPOILER D. MULTISTRADA 1200\'13', NULL, '133.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1804, 'D7402S', 'SPOILER DUCATI 1199 PANIGALE', NULL, '148.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1805, 'D750S', 'SPOILER KTM 990SMT \'09 FUME\'', NULL, '144.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1806, 'D7703ST', 'SPOILER KTM 1190 ADV.-ADV R\'13', NULL, '129.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1807, 'D780ST', 'SPOILER MORINI GRAN PASSO 1200', NULL, '131.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1808, 'D810KIT', 'KIT SPOILER PEUGEOT GEOPOLIS', NULL, '20.00', 0, 10, 37, 3, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1809, 'D8200ST', 'SPOILER GUZZI NORGE 1200\'10-13', NULL, '127.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1810, 'D98S', 'SPOILER YAMAHA XTZ 750', NULL, '87.00', 0, 10, 37, 75, 'o', '2018-03-03 18:03:06', '2018-03-03 10:03:06', 0),
(1811, 'S180F', 'UNIVERAL ADJUST.SMOKE DEFLECT', '1520071437_S180F_SHIELD_.jpg', '172.00', 0, 10, 37, 16, 'b', '2018-03-03 18:03:06', '2018-03-03 10:04:19', 0),
(1812, 'S180T', 'UNIVERSAL ADJUST.CLEAR DEFLEC', '1520071411_S180T_SHIELD_.jpg', '168.00', 0, 10, 37, 16, 'b', '2018-03-03 18:03:06', '2018-03-03 10:04:19', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mah_role`
--

CREATE TABLE `mah_role` (
  `id` int(11) NOT NULL,
  `role` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `manager` tinyint(4) DEFAULT '0',
  `level` tinyint(4) DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ctl` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `mah_role`
--

INSERT INTO `mah_role` (`id`, `role`, `manager`, `level`, `created`, `modified`, `ctl`) VALUES
(1, 'master', 1, 1, '2017-08-07 15:54:35', '2017-08-07 15:11:18', 0),
(2, 'administrator', 1, 1, '2017-08-07 15:54:35', '2017-08-07 15:11:21', 0),
(3, 'moderator ', 1, 2, '2017-08-07 15:54:35', '2017-08-07 15:25:51', 0),
(4, 'supper user', 0, 0, '2017-08-07 15:54:35', '2017-08-07 14:55:59', 0),
(5, 'user', 0, 0, '2017-08-07 15:54:35', '2017-08-07 14:55:59', 0),
(6, 'user not active', 0, 0, '2017-08-07 15:54:35', '2017-08-07 15:38:27', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mah_session`
--

CREATE TABLE `mah_session` (
  `idhash` char(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `userid` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `host` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0.0.0.0',
  `lastactivity` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `useragent` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `loggedin` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `logintime` datetime DEFAULT NULL,
  `apiaccesstoken` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `visittime` datetime DEFAULT NULL,
  `lastime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ctl` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `mah_session`
--

INSERT INTO `mah_session` (`idhash`, `userid`, `host`, `lastactivity`, `useragent`, `loggedin`, `logintime`, `apiaccesstoken`, `visittime`, `lastime`, `ctl`) VALUES
('-FV-ktRPgejV', 0, '123.21.89.28', '/~mahcomsg/login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36', 0, NULL, 'm5ta218VfdB8abeTQy1cxF4ZG9r', '2018-03-13 14:25:11', '2018-03-13 06:35:15', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mah_ship`
--

CREATE TABLE `mah_ship` (
  `id` bigint(20) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `suite` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zipcode` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ctl` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `mah_ship`
--

INSERT INTO `mah_ship` (`id`, `order_id`, `user_id`, `name`, `company`, `address`, `suite`, `phone`, `city`, `country`, `state`, `zipcode`, `created`, `modified`, `ctl`) VALUES
(1, 0, 5, 'master123', 'vietstar', '10/9/5 hoang hoa tham', 'ptd.lte', '810488', 'hcm', 'vn', 'hcm', '70000', '2018-03-05 20:20:15', '2018-03-05 12:20:15', 0),
(2, 1, 5, 'master123', 'vietstar', '10/9/5 hoang hoa tham', 'ptd.lte', '810488', 'hcm', 'vn', 'hcm', '70000', '2018-03-06 12:19:06', '2018-03-06 04:19:06', 0),
(3, 2, 5, 'master123', 'vietstar', '10/9/5 hoang hoa tham', 'ptd.lte', '810488', 'hcm', 'vn', 'hcm', '70000', '2018-03-06 19:10:12', '2018-03-06 11:10:12', 0),
(4, 3, 3, 'master test', '', '10/9/5 hht', '', '810488', 'hcm', 'vn', 'hcm', '70000', '2018-03-06 20:01:06', '2018-03-06 12:01:06', 0),
(5, 4, 3, 'master test', 'tester', '10/9/5 hht', 'company', '810488', 'hcm', 'vn', 'hcm', '70000', '2018-03-06 22:27:19', '2018-03-06 14:27:19', 0),
(6, 5, 6, 'Andy Ng', '', '55 Serangoon North Avenue 4 #03-02 S9 Singapore 555859', '', '93881347', '', '', '', '', '2018-03-08 11:37:54', '2018-03-08 03:37:54', 0),
(7, 6, 7, 'benmaster', 'vietstar', '10/9/5 hoang hoa tham, company', 'asdasd ', '123123', 'hcm', '123654', 'hcm', '70000', '2018-03-08 12:08:53', '2018-03-08 04:08:53', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mah_skills`
--

CREATE TABLE `mah_skills` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `skill` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rated` int(3) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ctl` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `mah_skills`
--

INSERT INTO `mah_skills` (`id`, `user_id`, `skill`, `rated`, `created`, `modified`, `ctl`) VALUES
(1, 2, 'Photoshop', 80, '2017-10-14 14:54:04', '2017-10-14 01:20:23', 0),
(2, 2, 'Php', 90, '2017-10-14 14:54:04', '2017-10-14 01:20:27', 0),
(3, 2, 'Jquery', 90, '2017-10-14 14:54:04', '2017-10-14 01:20:28', 0),
(4, 2, 'Ruby', 75, '2017-10-14 14:54:04', '2017-10-14 01:20:31', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mah_system`
--

CREATE TABLE `mah_system` (
  `id` int(11) NOT NULL,
  `sys_key` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sys_value` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` char(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sorted` int(11) NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ctl` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `mah_system`
--

INSERT INTO `mah_system` (`id`, `sys_key`, `sys_value`, `type`, `sorted`, `created`, `modified`, `ctl`) VALUES
(1, 'c9a069d63795ba6bd66d9cc25f22dcb0', 'forever', 'domain', 0, '2017-11-29 12:08:43', '2018-01-30 09:59:46', 0),
(2, 'email_name', 'No reply', 'email', 0, '2017-06-09 23:53:14', '2017-11-29 04:08:45', 0),
(3, 'email_add', 'vietstar.nt@gmail.com', 'email', 0, '2017-06-09 23:53:14', '2017-11-29 04:08:45', 0),
(4, 'email_pass', 'P@ssw0rd1982', 'email', 0, '2017-06-09 23:53:14', '2017-11-29 04:08:45', 0),
(5, 'email_port', '465', 'email', 0, '2017-06-09 23:53:14', '2017-11-29 04:08:45', 0),
(6, 'email_security', 'ssl', 'email', 0, '2017-06-09 23:53:14', '2017-11-29 04:08:45', 0),
(7, 'email_smtp', 'smtp.gmail.com', 'email', 0, '2017-06-09 23:53:14', '2017-11-29 04:08:45', 0),
(8, 'email_confirm_title', 'Confirm account on Mah Ecommerce', 'email', 0, '2017-06-09 23:53:14', '2017-12-12 02:35:48', 0),
(9, 'email_confirm_content', '<tbody><tr><td>Dears!<br>\r\nYou\'ve successfully created account.<br>\r\nPlease download app (<a href=\'#\'>app link</a>) and login by your phone number or email (not password required), then complete your information.<br>\r\n<br>\r\nRegards,<br>\r\nCompany</td></tr></tbody>', 'email', 0, '2017-06-09 23:53:14', '2017-12-12 02:35:03', 0),
(10, 'email_contact_title', 'contacted From: ', 'email', 0, '2017-06-09 23:53:14', '2017-11-29 04:08:45', 0),
(11, 'email_contact_content', 'Sender: < {name}> - {email} <br/>\r\nSubject: {subject}<br/>\r\nThe message: {message}<br/>', 'email', 0, '2017-06-09 23:53:14', '2017-11-29 04:21:24', 0),
(12, 'email_contact', 'vietstar.nt@hotmail.com', 'email', 0, '2017-06-09 23:53:14', '2017-11-29 04:08:45', 0),
(13, 'email_admin', 'vietstars.nt@hotmail.com', 'email', 0, '2017-06-09 23:53:14', '2017-11-29 04:08:45', 0),
(14, 'phone_admin', '810488', 'email', 0, '2017-06-09 23:53:14', '2017-11-29 04:08:45', 0),
(15, 'viewport', 'width=device-width, initial-scale=1.0', 'meta', 1, '2017-08-03 03:18:54', '2017-11-29 04:08:45', 0),
(16, 'author', 'Your Local Online Motorcycle MahMah Shop', 'meta', 2, '2017-06-12 20:21:10', '2018-02-08 09:28:38', 0),
(17, 'description', 'Your Local Online Motorcycle MahMah Shop', 'meta', 3, '2017-06-12 20:21:10', '2018-02-08 09:28:42', 0),
(18, 'icon', 'logo/bottom.png', 'image/png', 4, '2017-08-03 03:25:16', '2018-03-09 09:51:57', 0),
(19, 'title', 'MahMahShop', 'meta', 0, '2017-08-11 19:51:53', '2018-02-08 09:24:01', 0),
(20, 'template', 'default', 'theme', 5, '2017-10-02 15:55:28', '2017-11-29 04:08:45', 0),
(21, 'img_maxSize', '2097152', 'setting', 4, '2017-07-27 23:06:37', '2017-11-29 04:08:45', 0),
(22, 'img_maxCount', '5', 'setting', 4, '2017-07-27 23:06:42', '2017-11-29 04:08:45', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mah_text`
--

CREATE TABLE `mah_text` (
  `id` int(11) NOT NULL,
  `df_content` text COLLATE utf8_unicode_ci,
  `content` text COLLATE utf8_unicode_ci,
  `created` datetime DEFAULT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ctl` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `mah_text`
--

INSERT INTO `mah_text` (`id`, `df_content`, `content`, `created`, `modified`, `ctl`) VALUES
(1, 'Get Journal Updates', 'Get Journal Updates', '2017-12-13 09:50:47', '2018-03-09 10:20:01', 0),
(2, 'Sign up to get weekly emails with inspiration and special content straight from MahMahShop’s founder.', 'Sign up to get weekly emails with inspiration and special content straight from MahMahShop’s founder.', '2017-12-13 09:51:22', '2018-03-09 10:19:55', 0),
(3, 'Quality > Quantity', 'Quality > Quantity', '2017-12-13 09:51:22', '2018-03-10 11:55:20', 0),
(4, 'We make every item in small batches with intense attention to detail. We personally use and wear our products every day and believe in what we design.', 'For every item purchased we donate a meal to needy kids around the world. Learn more about our charity partnership with Rice Bowls.', '2017-12-13 09:51:22', '2018-03-10 11:59:12', 0),
(5, 'Giving Back', 'Giving Back', '2017-12-13 09:51:22', '2018-03-10 11:59:38', 0),
(6, 'For every item purchased we donate a meal to needy kids around the world. Learn more about our charity partnership with Rice Bowls.', 'For every item purchased we donate a meal to needy kids around the world. Learn more about our charity partnership with Rice Bowls.', '2017-12-13 09:51:22', '2018-03-10 11:59:39', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mah_type`
--

CREATE TABLE `mah_type` (
  `id` int(11) NOT NULL,
  `name` varchar(54) COLLATE utf8_unicode_ci NOT NULL,
  `sorted` int(11) NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ctl` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `mah_type`
--

INSERT INTO `mah_type` (`id`, `name`, `sorted`, `created`, `modified`, `ctl`) VALUES
(1, 'Safety', 0, '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(2, 'Head Cover', 1, '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(3, 'Fitting Kit', 2, '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(4, 'Monokey', 3, '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(5, 'Monolock', 4, '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(6, 'E43', 5, '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(7, 'Brake Light', 6, '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(8, 'Backrest', 7, '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(9, 'Top Rail', 8, '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(10, 'Remote', 9, '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(11, 'Carrier Strap', 10, '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(12, 'Net', 11, '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(13, 'Sticker', 12, '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(14, 'For Obk', 13, '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(15, 'For Trk', 14, '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(16, 'UNIVERSAL', 15, '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(17, 'Inner Bag', 16, '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(18, 'Fix on to bike', 17, '2018-03-03 18:03:00', '2018-03-03 10:03:00', 0),
(19, 'Custom bikes', 18, '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(20, 'Rack with Signal Light', 19, '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(21, 'Bike Specific', 20, '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(22, 'Pannier (Soft)', 21, '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(23, 'V35N Side Rack', 22, '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(24, 'Rapid Release', 23, '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(25, 'Pannier support', 24, '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(26, 'ST601 Holder', 25, '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(27, 'Half Face', 26, '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(28, 'Full Face', 27, '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(29, 'Rapid Release Outback rack', 28, '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(30, 'Aluminum', 29, '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(31, 'Soft Luggage', 30, '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(32, 'V35 Series', 31, '2018-03-03 18:03:01', '2018-03-03 10:03:01', 0),
(33, 'MT501 Series', 32, '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(34, 'Power kit', 33, '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(35, 'Output', 34, '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(36, 'Hand Guard', 35, '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(37, 'Bigfoot', 36, '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(38, 'Mudguard', 37, '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(39, 'Engine Guard', 38, '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(40, 'Radiator Guard', 39, '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(41, 'Skid Plate', 40, '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(42, 'Vest', 41, '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(43, 'Outback rack/Raw', 42, '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(44, 'Monokey holder', 43, '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(45, 'Outback rack', 44, '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(46, 'Rucksack', 45, '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(47, 'Tail Bag', 46, '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(48, 'Side Bags', 47, '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(49, 'Waist Bag', 48, '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(50, 'Side bag', 49, '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(51, 'Tank bag', 50, '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(52, 'Scooter bag', 51, '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(53, 'Roll Bag', 52, '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(54, 'Belt Bag', 53, '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(55, 'Leg Bag', 54, '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(56, 'Seat bag', 55, '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(57, 'Gravel-T Range', 56, '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(58, 'Pannier ', 57, '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(59, 'Saddle bag', 58, '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(60, 'Water Proof Bag', 59, '2018-03-03 18:03:02', '2018-03-03 10:03:02', 0),
(61, 'Ultima Range', 60, '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(62, 'Xtreme Range', 61, '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(63, 'Saddlebag', 62, '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(64, 'Monolock Blade', 63, '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(65, 'Box Lid/Cover', 64, '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(66, 'Inner Liner', 65, '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(67, 'E41 Side box Cover', 66, '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(68, 'E450 only', 67, '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(69, 'Monorack', 68, '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(70, 'Fitting Ring', 69, '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(71, 'Bicycle', 70, '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(72, 'Trekker Series', 71, '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(73, 'Monokey V series', 72, '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(74, 'Heavy Duty-Monorack', 73, '2018-03-03 18:03:03', '2018-03-03 10:03:03', 0),
(75, 'Touring', 74, '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(76, 'Rack for Light box', 75, '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(77, 'Normal Rack', 76, '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(78, 'Specific Plate', 77, '2018-03-03 18:03:04', '2018-03-03 10:03:04', 0),
(79, 'Monokey Alu Plate', 78, '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(80, 'Specific Rack', 79, '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(81, 'Spoiler', 80, '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0),
(82, 'Air Flow', 81, '2018-03-03 18:03:05', '2018-03-03 10:03:05', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mah_user`
--

CREATE TABLE `mah_user` (
  `id` bigint(20) NOT NULL,
  `fullname` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'male',
  `id_no` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `salt` char(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `mobile` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `phone` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `address` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `role` tinyint(1) NOT NULL DEFAULT '1',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userId` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `actived` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `lastactivity` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastvisit` datetime DEFAULT NULL,
  `visited` int(11) NOT NULL DEFAULT '0',
  `ctl` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '//2-deleted //1-locked'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `mah_user`
--

INSERT INTO `mah_user` (`id`, `fullname`, `gender`, `id_no`, `email`, `salt`, `password`, `avatar`, `birthday`, `mobile`, `phone`, `address`, `created`, `role`, `modified`, `userId`, `actived`, `lastactivity`, `lastvisit`, `visited`, `ctl`) VALUES
(1, 'Master', 'male', '225.185.392', 'vietstar.nt@gmail.com', 'rASQ#N4T^z!zs.HHXu_ENe]MgIP8CC', 'c3fc0e4f9f2900777e7596f7ab35e3e8', '1502726314_avatar.jpg', '1982-12-24', '', '', '28/5 Hoàng Hoa Thám, Nha Trang', '2017-11-29 12:08:43', 1, '2018-03-08 03:52:14', 'B8*****b', '2016-11-09 13:51:20', '/~mahcomsg/login', '2018-01-30 18:02:09', 83, 0),
(2, 'Admin', 'male', '123.456.789', 'admin', 'lBKX5E`*^<|uQx?_0eQnXtWm$s=eJV', 'e6ac08d8f1e02fcb61af2ea3e27fb6a5', '1502726314_avatar.jpg', '1982-12-24', '', '', 'tp.hcm', '2017-11-29 12:08:43', 1, '2018-03-13 06:25:09', '123456', '2016-11-09 13:51:20', '/~mahcomsg/', '2018-03-13 14:25:09', 220885, 0),
(3, 'master test', 'male', '225184394', 'Master@gmail.com', 'KZ<)8<4f~K@98|rWh0Yg5Tu\\aRjrjd', '132be02c10cecf4cd8e19483f43015f2', '1520192208_IMG_3321.jpg', '1997-03-25', '810488', '2213456', '10/9/5 hht', '2018-03-05 00:55:53', 6, '2018-03-08 03:52:14', '123456', '2016-11-09 13:51:20', '/~mahcomsg/login', '2018-03-07 23:37:06', 17364, 0),
(4, 'tester', 'male', NULL, 'tester1.vn@gmail.com', ',38OJ|K<lu@06V%`eIw;sO6=33b!Q=', 'ca3feb41a45a47819636c466c97905b4', NULL, NULL, '', '', NULL, '2018-03-05 13:35:05', 5, '2018-03-08 03:52:14', 'B810488b', '2018-03-05 13:35:05', '/~mahcomsg/login', '2018-03-06 22:25:14', 527, 0),
(5, 'master123', 'male', NULL, 'master123@gmail.com', 'VxcHHpJ[*gp*se&kvrfzvPfrnE{Q+/', '3e0449308b9fd05fd88da3fae40e148a', NULL, NULL, '', '', NULL, '2018-03-05 13:44:41', 5, '2018-03-09 09:50:37', '123456', '2018-03-05 13:44:41', '/~mahcomsg/', '2018-03-09 17:50:37', 20601, 0),
(6, 'Andy Ng', 'male', 'S7827965F', 'andy@adspress.com.sg', 'X#pxNI*g\\H6ZkoAKcf=Wwu!?u$\\$r`', '', '1520479914_me.jpg', '1978-09-27', '93881347', '', '55 Serangoon North Avenue 4 #03-02 S9 Singapore 555859', '2018-03-08 11:19:51', 5, '2018-03-08 03:52:14', 'gw270606', '2018-03-08 11:19:51', NULL, NULL, 0, 0),
(7, 'benmaster', 'female', '123123', 'benmaster@gmail.com', '_b&)V\"FVP8{rj#<p1L7qoG(d{:q^Iw', '3cbe5088ce57ad8e164893ad6aef1fd1', NULL, '2018-03-08', '123123', '123123', '123qeww easd ', '2018-03-08 11:47:28', 5, '2018-03-08 05:27:41', '123456', '2018-03-08 11:47:28', '/~mahcomsg/history', '2018-03-08 13:02:19', 3259, 0),
(8, 'Eugene', 'male', NULL, 'eugene@mah.com.sg', '3ZMRnnD{9VccxW4!rq&f:/*oV>h@Eu', '7e4121d4ef9b5e9ab0b87992b6bd1e0f', NULL, NULL, '', '', NULL, '2018-03-08 11:49:10', 5, '2018-03-08 03:52:14', 'coldnnumb84', '2018-03-08 11:49:10', NULL, NULL, 0, 0);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `mah_brands`
--
ALTER TABLE `mah_brands`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `mah_cart`
--
ALTER TABLE `mah_cart`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `mah_category`
--
ALTER TABLE `mah_category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `mah_experience`
--
ALTER TABLE `mah_experience`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `mah_follow`
--
ALTER TABLE `mah_follow`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `mah_general`
--
ALTER TABLE `mah_general`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `mah_image`
--
ALTER TABLE `mah_image`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `mah_interest`
--
ALTER TABLE `mah_interest`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `mah_invoice`
--
ALTER TABLE `mah_invoice`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `mah_menu`
--
ALTER TABLE `mah_menu`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `mah_note`
--
ALTER TABLE `mah_note`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `mah_note_type`
--
ALTER TABLE `mah_note_type`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `mah_product`
--
ALTER TABLE `mah_product`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `mah_role`
--
ALTER TABLE `mah_role`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `mah_ship`
--
ALTER TABLE `mah_ship`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `mah_skills`
--
ALTER TABLE `mah_skills`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `mah_system`
--
ALTER TABLE `mah_system`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `mah_text`
--
ALTER TABLE `mah_text`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `mah_type`
--
ALTER TABLE `mah_type`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `mah_user`
--
ALTER TABLE `mah_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `mah_brands`
--
ALTER TABLE `mah_brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT cho bảng `mah_cart`
--
ALTER TABLE `mah_cart`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT cho bảng `mah_category`
--
ALTER TABLE `mah_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT cho bảng `mah_experience`
--
ALTER TABLE `mah_experience`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT cho bảng `mah_follow`
--
ALTER TABLE `mah_follow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT cho bảng `mah_general`
--
ALTER TABLE `mah_general`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT cho bảng `mah_image`
--
ALTER TABLE `mah_image`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=162;
--
-- AUTO_INCREMENT cho bảng `mah_interest`
--
ALTER TABLE `mah_interest`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT cho bảng `mah_invoice`
--
ALTER TABLE `mah_invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT cho bảng `mah_menu`
--
ALTER TABLE `mah_menu`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT cho bảng `mah_note`
--
ALTER TABLE `mah_note`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT cho bảng `mah_note_type`
--
ALTER TABLE `mah_note_type`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT cho bảng `mah_product`
--
ALTER TABLE `mah_product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1813;
--
-- AUTO_INCREMENT cho bảng `mah_role`
--
ALTER TABLE `mah_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT cho bảng `mah_ship`
--
ALTER TABLE `mah_ship`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT cho bảng `mah_skills`
--
ALTER TABLE `mah_skills`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT cho bảng `mah_system`
--
ALTER TABLE `mah_system`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT cho bảng `mah_text`
--
ALTER TABLE `mah_text`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT cho bảng `mah_type`
--
ALTER TABLE `mah_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;
--
-- AUTO_INCREMENT cho bảng `mah_user`
--
ALTER TABLE `mah_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
