-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 19 Haz 2021, 12:23:25
-- Sunucu sürümü: 10.4.18-MariaDB
-- PHP Sürümü: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `final`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `address`
--

CREATE TABLE `address` (
  `Address_id` decimal(10,0) NOT NULL,
  `Street` varchar(30) DEFAULT NULL,
  `District` varchar(30) DEFAULT NULL,
  `City` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `address`
--

INSERT INTO `address` (`Address_id`, `Street`, `District`, `City`) VALUES
('1', 'Koru', 'Beşiktaş', 'İstanbul'),
('2', 'Ankaralılar', 'Çankaya', 'Ankara'),
('3', 'Kazımdirik', 'Bornova', 'İzmir'),
('4', 'Sinanpaşa', 'Yüreğir', 'Adana'),
('5', 'Tatlıkuyu', 'Gebze', 'Kocaeli');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `booking`
--

CREATE TABLE `booking` (
  `Book_id` int(11) NOT NULL,
  `Client_id` int(11) DEFAULT NULL,
  `Store_id` decimal(10,0) DEFAULT NULL,
  `Product_id` decimal(10,0) DEFAULT NULL,
  `Reservation_duration` decimal(15,0) DEFAULT NULL,
  `Total_price` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `booking`
--

INSERT INTO `booking` (`Book_id`, `Client_id`, `Store_id`, `Product_id`, `Reservation_duration`, `Total_price`) VALUES
(1, 8, '1000', '1', '3', '762'),
(2, 8, '1000', '7', '4', '9000'),
(3, 8, '1000', '67', '7', '11738'),
(4, 8, '1000', '1', '5', '2286'),
(5, 8, '1000', '31', '4', '15188');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `category`
--

CREATE TABLE `category` (
  `Category_id` decimal(10,0) NOT NULL,
  `Category_name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `category`
--

INSERT INTO `category` (`Category_id`, `Category_name`) VALUES
('1', 'Sandal'),
('2', 'Sneakers'),
('3', 'Casual Shoes'),
('4', 'Classic Shoes'),
('5', 'Heeled Shoes'),
('6', 'Shoulder Bag'),
('7', 'Sport Bag'),
('8', 'Backpack'),
('9', 'Clutch'),
('10', 'Wallet'),
('11', 'Watch'),
('12', 'Sun Glasses'),
('13', 'Necklace'),
('14', 'Ring'),
('15', 'Earring'),
('16', 'Bracelet');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `client`
--

CREATE TABLE `client` (
  `Client_id` int(11) NOT NULL,
  `Name` varchar(30) DEFAULT NULL,
  `Gender` varchar(20) DEFAULT NULL,
  `Age` decimal(10,0) DEFAULT NULL,
  `Mail` varchar(30) DEFAULT NULL,
  `Phone` decimal(10,0) DEFAULT NULL,
  `Password` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `client`
--

INSERT INTO `client` (`Client_id`, `Name`, `Gender`, `Age`, `Mail`, `Phone`, `Password`) VALUES
(1, 'Arzu', 'Female', '27', 'arzu@gmail.com', '5234567891', '1234'),
(2, 'Burak', 'Male', '33', 'burak@gmail.com', '5748736478', '5678'),
(3, 'Ela', 'Female', '38', 'ela@gmail.com', '5647392929', '9087'),
(4, 'Yusuf', 'Male', '41', 'yusuf@gmail.com', '5863720273', '6754'),
(5, 'Sevim', 'Female', '22', 'sevim@gmail.com', '5920386484', '3453'),
(8, 'example', 'Male', '22', 'example', '543', '12'),
(9, 'emre', 'Male', '22', 'emre@mail.com', '434', '12'),
(28, 'example2', 'Male', '0', 'example2', '0', '12'),
(29, 'ali', 'Male', '22', 'ali@gmail.com', '543', '12'),
(30, 'ahmet', 'Male', '22', 'ahmet@gmail.com', '543', '12');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `has`
--

CREATE TABLE `has` (
  `Has_id` int(11) NOT NULL,
  `Prod_id` decimal(10,0) DEFAULT NULL,
  `Store_id` decimal(10,0) DEFAULT NULL,
  `Quantity` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `has`
--

INSERT INTO `has` (`Has_id`, `Prod_id`, `Store_id`, `Quantity`) VALUES
(1, '1', '1000', '1'),
(2, '2', '1001', '2'),
(3, '3', '1002', '3'),
(4, '4', '1003', '1'),
(5, '5', '1004', '2'),
(6, '6', '1005', '4'),
(7, '7', '2001', '1'),
(8, '8', '2002', '2'),
(9, '9', '2003', '3'),
(10, '10', '2004', '2'),
(11, '11', '2005', '1'),
(12, '12', '3000', '3'),
(13, '13', '3001', '1'),
(14, '14', '3002', '2'),
(15, '15', '3003', '1'),
(16, '16', '3004', '2'),
(17, '17', '3005', '3'),
(18, '18', '4000', '3'),
(19, '19', '4001', '3'),
(20, '20', '4002', '2'),
(21, '21', '4003', '1'),
(22, '22', '4004', '2'),
(23, '23', '4005', '3'),
(24, '24', '5000', '4'),
(25, '25', '5001', '3'),
(26, '26', '5002', '2'),
(27, '27', '5003', '3'),
(28, '28', '5004', '3'),
(29, '29', '5005', '2'),
(30, '30', '2000', '3'),
(31, '31', '1000', '2'),
(32, '32', '2000', '1'),
(33, '33', '3000', '2'),
(34, '34', '4000', '1'),
(35, '35', '5000', '3'),
(36, '36', '1001', '2'),
(37, '37', '2001', '3'),
(38, '38', '3001', '2'),
(39, '39', '4001', '1'),
(40, '40', '5001', '2'),
(41, '41', '5002', '1'),
(42, '42', '4002', '2'),
(43, '43', '3002', '1'),
(44, '44', '2002', '999'),
(45, '45', '1002', '3'),
(46, '46', '1003', '4'),
(47, '47', '2003', '50'),
(48, '48', '3003', '3'),
(49, '49', '4003', '2'),
(50, '50', '5003', '1'),
(51, '51', '1004', '3'),
(52, '52', '2004', '2'),
(53, '53', '3004', '3'),
(54, '54', '4004', '2'),
(55, '55', '5004', '1'),
(56, '56', '1005', '2'),
(57, '57', '2005', '3'),
(58, '58', '2005', '4'),
(59, '59', '3005', '3'),
(60, '60', '4005', '2'),
(61, '61', '5005', '1'),
(62, '62', '1000', '2'),
(63, '63', '2000', '3'),
(64, '64', '3000', '4'),
(65, '65', '4000', '3'),
(66, '66', '5000', '2'),
(67, '67', '1000', '4'),
(68, '68', '1000', '2'),
(69, '69', '2000', '3'),
(70, '70', '2000', '2'),
(71, '71', '3000', '3'),
(72, '72', '3000', '1'),
(73, '73', '4000', '3'),
(74, '74', '4000', '2'),
(75, '75', '5000', '3'),
(76, '76', '5000', '2'),
(77, '77', '1001', '1'),
(78, '78', '2001', '2'),
(79, '79', '3001', '1'),
(80, '80', '4001', '2'),
(81, '1', '5001', '3'),
(82, '2', '1002', '2'),
(83, '3', '2002', '3'),
(84, '4', '3002', '2'),
(85, '5', '4002', '3'),
(86, '6', '5002', '4'),
(87, '7', '1003', '1'),
(88, '8', '2003', '3'),
(89, '9', '3003', '2'),
(90, '10', '4004', '3'),
(91, '11', '5003', '2'),
(92, '12', '1005', '2'),
(93, '13', '2005', '1'),
(94, '14', '3005', '1'),
(95, '15', '4005', '1'),
(96, '16', '5005', '1'),
(97, '21', '3004', '1'),
(98, '32', '2004', '1'),
(99, '43', '1004', '2'),
(100, '45', '5004', '3'),
(101, '55', '1000', '2');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `product`
--

CREATE TABLE `product` (
  `Prod_id` decimal(10,0) NOT NULL,
  `Category_id` decimal(10,0) DEFAULT NULL,
  `Prod_name` varchar(30) DEFAULT NULL,
  `Color` varchar(20) DEFAULT NULL,
  `Size` varchar(20) DEFAULT NULL,
  `Price` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `product`
--

INSERT INTO `product` (`Prod_id`, `Category_id`, `Prod_name`, `Color`, `Size`, `Price`) VALUES
('2', '1', 'Sandal', 'Red', '39', '897'),
('3', '1', 'Sandal', 'Purple', '42', '900'),
('4', '1', 'Sandal', 'Yellow', '43', '1560'),
('5', '1', 'Sandal', 'White', '45', '4582'),
('6', '2', 'Sneakers', 'Yellow', '42', '7700'),
('7', '2', 'Sneakers', 'Black', '39', '9000'),
('8', '2', 'Sneakers', 'Purple', '42', '8900'),
('9', '2', 'Sneakers', 'Yellow', '43', '6589'),
('10', '2', 'Sneakers', 'White', '45', '5897'),
('11', '3', 'Casual Shoes', 'Blue', '38', '6520'),
('12', '3', 'Casual Shoes', 'Red', '39', '7420'),
('13', '3', 'Casual Shoes', 'Purple', '42', '3500'),
('14', '3', 'Casual Shoes', 'Black', '43', '7400'),
('15', '3', 'Casual Shoes', 'White', '45', '6874'),
('16', '4', 'Classic Shoes', 'Blue', '38', '3000'),
('17', '4', 'Classic Shoes', 'Red', '39', '4500'),
('18', '4', 'Classic Shoes', 'Purple', '42', '8675'),
('19', '4', 'Classic Shoes', 'Black', '43', '6538'),
('20', '4', 'Classic Shoes', 'White', '45', '5654'),
('21', '5', 'Heeled Shoes', 'Blue', '38', '5647'),
('22', '5', 'Heeled Shoes', 'Red', '39', '9078'),
('23', '5', 'Heeled Shoes', 'Black', '42', '1254'),
('24', '5', 'Heeled Shoes', 'Yellow', '43', '3564'),
('25', '5', 'Heeled Shoes', 'White', '45', '563'),
('26', '6', 'Shoulder Bag', 'Black', 'Small', '7594'),
('27', '6', 'Shoulder Bag', 'Red', 'Small', '9585'),
('28', '6', 'Shoulder Bag', 'Purple', 'Medium', '7485'),
('29', '6', 'Shoulder Bag', 'Yellow', 'Big', '8605'),
('33', '7', 'Sport Bag', 'White', 'Medium', '7348'),
('34', '7', 'Sport Bag', 'Black', 'Big', '4849'),
('35', '7', 'Sport Bag', 'Red', 'Big', '8440'),
('36', '8', 'Backpack', 'Purple', 'Small', '9303'),
('37', '8', 'Backpack', 'Yellow', 'Small', '849'),
('38', '8', 'Backpack', 'White', 'Small', '8950'),
('39', '8', 'Backpack', 'Blue', 'Big', '4859'),
('40', '8', 'Backpack', 'Red', 'Small', '4859'),
('41', '9', 'Clutch', 'Purple', 'Small', '4904'),
('42', '9', 'Clutch', 'Yellow', 'Small', '3903'),
('43', '9', 'Clutch', 'Black', 'Small', '2209'),
('44', '9', 'Clutch', 'Red', 'Small', '100'),
('45', '9', 'Clutch', 'Red', 'Small', '7320'),
('46', '10', 'Wallet', 'Purple', 'Small', '7393'),
('47', '10', 'Wallet', 'Brown', 'Normal', '400'),
('48', '10', 'Wallet', 'Black', 'Medium', '7483'),
('49', '10', 'Wallet', 'Blue', 'Small', '4536'),
('50', '10', 'Wallet', 'Red', 'Small', '5678'),
('51', '11', 'Watch', 'Purple', 'Small', '6543'),
('52', '11', 'Watch', 'Yellow', 'Small', '5436'),
('53', '11', 'Watch', 'Black', 'Big', '4567'),
('54', '11', 'Watch', 'Blue', 'Small', '1231'),
('55', '11', 'Watch', 'Red', 'Small', '2315'),
('56', '12', 'Sun Glasses', 'Purple', 'Circle', '3678'),
('57', '12', 'Sun Glasses', 'Yellow', 'Rectangular', '765'),
('58', '12', 'Sun Glasses', 'Black', 'Circle', '4444'),
('59', '12', 'Sun Glasses', 'Blue', 'Square', '8404'),
('60', '12', 'Sun Glasses', 'Red', 'Circle', '8932'),
('61', '13', 'Necklace', 'Purple', '40', '3902'),
('62', '13', 'Necklace', 'Yellow', '30', '3840'),
('63', '13', 'Necklace', 'Black', '85', '4930'),
('64', '13', 'Necklace', 'Blue', '75', '4830'),
('65', '13', 'Necklace', 'Red', '80', '9545'),
('66', '14', 'Ring', 'Purple', '17', '8495'),
('67', '14', 'Ring', 'red', 'M', '5000'),
('68', '14', 'Ring', 'Black', '27', '840'),
('69', '14', 'Ring', 'Blue', '24', '6758'),
('70', '14', 'Ring', 'Red', '22', '5786'),
('71', '15', 'Earring', 'Purple', 'Small', '5859'),
('72', '15', 'Earring', 'Yellow', 'Small', '6945'),
('73', '15', 'Earring', 'Black', 'Small', '8069'),
('74', '15', 'Earring', 'Blue', 'Big', '589'),
('75', '15', 'Earring', 'Red', 'Small', '6759'),
('76', '16', 'Bracelet', 'Purple', 'Small', '648'),
('77', '16', 'Bracelet', 'Yellow', 'Small', '495'),
('78', '16', 'Bracelet', 'Black', 'XLarge', '6795'),
('79', '16', 'Bracelet', 'Blue', 'XLarge', '463'),
('80', '16', 'Bracelet', 'Red', 'Medium', '3283');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `salesperson`
--

CREATE TABLE `salesperson` (
  `Person_id` decimal(10,0) NOT NULL,
  `Password` varchar(30) DEFAULT NULL,
  `Mail` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `salesperson`
--

INSERT INTO `salesperson` (`Person_id`, `Password`, `Mail`) VALUES
('1', 'abcd', 'elif@besties.com'),
('2', 'efgh', 'ayşegül@fashionstar.com'),
('3', 'rhfj', 'sıdıka@luxy.com'),
('4', 'ghdl', 'emre@fortune.com'),
('5', 'jdks', 'ılgaz@suitup.com'),
('6', 'lakd', 'cansu@classicos.com'),
('7', 'slka', 'kübra@momentum.com'),
('8', 'oeıs', 'mehmet@beautie.com'),
('9', 'pale', 'onur@naturart.com'),
('10', 'paoa', 'alp@boldring.com'),
('11', 'kdls', 'yaren@vvedding.com'),
('12', 'kjdl', 'betül@fashmon.com'),
('13', 'odks', 'salih@cariamo.com'),
('14', 'kdjs', 'emir@lamoda.com'),
('15', 'lals', 'batuhan@blackdiamond.com'),
('16', 'alsl', 'oğuzhan@pinkello.com'),
('17', 'ajdh', 'gülşah@timeblossom.com'),
('18', 'fjgj', 'esra@accessColor.com'),
('19', 'dhfj', 'melek@dreamy.com'),
('20', 'oedj', 'yiğit@seasun.com'),
('21', 'spsp', 'suat@bluStone.com'),
('22', 'aaks', 'yunus@blacknwhite.com'),
('23', 'gjdk', 'gökhan@jewelliving.com'),
('24', 'sooe', 'mustafa@goodress.com'),
('25', 'sodj', 'anıl@lifelgood.com'),
('26', 'djff', 'murat@mercy.com'),
('27', 'rdud', 'beyza@danceStar.com'),
('28', 'sdjf', 'fatma@luxuryoung.com'),
('29', 'fgdh', 'ayşe@runcatch.com'),
('30', 'wusy', 'aslı@maya.com');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `store`
--

CREATE TABLE `store` (
  `Store_id` decimal(10,0) NOT NULL,
  `Address_id` decimal(10,0) DEFAULT NULL,
  `Store_name` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `store`
--

INSERT INTO `store` (`Store_id`, `Address_id`, `Store_name`) VALUES
('1000', '1', 'Besties'),
('1001', '2', 'FashionStar'),
('1002', '3', 'Luxy'),
('1003', '4', 'Fortune'),
('1004', '5', 'Suitup'),
('1005', '1', 'Classicos'),
('2000', '2', 'Momentum'),
('2001', '3', 'Beautie'),
('2002', '4', 'Naturart'),
('2003', '5', 'Boldring'),
('2004', '1', 'Vvedding'),
('2005', '2', 'Fash\'mon'),
('3000', '3', 'Cariamo'),
('3001', '4', 'La\'moda'),
('3002', '5', 'BlackDiamond'),
('3003', '1', 'Pinkello'),
('3004', '2', 'TimeBlossom'),
('3005', '3', 'AccessColor'),
('4000', '4', 'Dreamy'),
('4001', '5', 'SeaSun'),
('4002', '1', 'BluStone'),
('4003', '2', 'BlackNwhite'),
('4004', '3', 'Je\'welliving'),
('4005', '4', 'GooDress'),
('5000', '5', 'Lifelgood'),
('5001', '1', 'Mercy'),
('5002', '2', 'DanceStar'),
('5003', '3', 'Luxuryoung'),
('5004', '4', 'Run&Catch'),
('5005', '5', 'Maya');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `supplier`
--

CREATE TABLE `supplier` (
  `Supplier_id` decimal(10,0) NOT NULL,
  `Supplier_name` varchar(30) DEFAULT NULL,
  `Country` varchar(20) DEFAULT NULL,
  `City` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `supplier`
--

INSERT INTO `supplier` (`Supplier_id`, `Supplier_name`, `Country`, `City`) VALUES
('1', 'Kloteksa', 'Italy', 'Rome'),
('2', 'Maison', 'France', 'Paris'),
('3', 'Etnik', 'Turkey', 'İstanbul'),
('4', 'Steger', 'Germany', 'Berlin'),
('5', 'Madam T', 'Russia', 'Moscow');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `supplymatch`
--

CREATE TABLE `supplymatch` (
  `Match_id` decimal(10,0) NOT NULL,
  `Supplier_id` decimal(10,0) DEFAULT NULL,
  `Store_id` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `supplymatch`
--

INSERT INTO `supplymatch` (`Match_id`, `Supplier_id`, `Store_id`) VALUES
('1', '1', '1000'),
('2', '2', '1001'),
('3', '3', '1002'),
('4', '4', '1003'),
('5', '5', '1004'),
('6', '1', '1005'),
('7', '2', '2000'),
('8', '3', '2001'),
('9', '4', '2002'),
('10', '5', '2003'),
('11', '1', '2004'),
('12', '2', '2005'),
('13', '3', '3000'),
('14', '4', '3001'),
('15', '5', '3002'),
('16', '1', '3003'),
('17', '2', '3004'),
('18', '3', '3005'),
('19', '4', '4000'),
('20', '5', '4001'),
('21', '1', '4002'),
('22', '2', '4003'),
('23', '3', '4004'),
('24', '4', '4005'),
('25', '5', '5000'),
('26', '1', '5001'),
('27', '2', '5002'),
('28', '3', '5003'),
('29', '4', '5004'),
('30', '5', '5005');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `updatetable`
--

CREATE TABLE `updatetable` (
  `Update_id` int(11) NOT NULL,
  `Prod_id` decimal(10,0) DEFAULT NULL,
  `Person_id` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `updatetable`
--

INSERT INTO `updatetable` (`Update_id`, `Prod_id`, `Person_id`) VALUES
(1, '1', '1'),
(2, '2', '2'),
(3, '3', '3'),
(4, '4', '4'),
(5, '5', '5'),
(6, '6', '6'),
(7, '7', '7'),
(8, '8', '8'),
(9, '9', '9'),
(10, '10', '10'),
(11, '11', '11'),
(12, '12', '12'),
(13, '13', '13'),
(14, '14', '14'),
(15, '15', '15'),
(16, '16', '16'),
(17, '17', '17'),
(18, '18', '18'),
(19, '19', '19'),
(20, '20', '20'),
(21, '21', '21'),
(22, '22', '22'),
(23, '23', '23'),
(24, '24', '24'),
(25, '25', '25'),
(26, '26', '26'),
(27, '27', '27'),
(28, '28', '28'),
(29, '29', '29'),
(30, '30', '30'),
(31, '31', '1'),
(32, '32', '2'),
(33, '33', '3'),
(34, '34', '4'),
(35, '35', '5'),
(36, '36', '6'),
(37, '37', '7'),
(38, '38', '8'),
(39, '39', '9'),
(40, '40', '10'),
(41, '41', '11'),
(42, '42', '12'),
(43, '43', '13'),
(44, '44', '14'),
(45, '45', '15'),
(46, '46', '16'),
(47, '47', '17'),
(48, '48', '18'),
(49, '49', '19'),
(50, '50', '20'),
(51, '51', '21'),
(52, '52', '22'),
(53, '53', '23'),
(54, '54', '24'),
(55, '55', '25'),
(56, '56', '26'),
(57, '57', '27'),
(58, '58', '28'),
(59, '59', '29'),
(60, '60', '30'),
(61, '61', '1'),
(62, '62', '2'),
(63, '63', '3'),
(64, '64', '4'),
(65, '65', '5'),
(66, '66', '6'),
(67, '67', '7'),
(68, '68', '8'),
(69, '69', '9'),
(70, '70', '10'),
(71, '71', '11'),
(72, '72', '12'),
(73, '73', '13'),
(74, '74', '14'),
(75, '75', '15'),
(76, '76', '16'),
(77, '77', '17'),
(78, '78', '18'),
(79, '79', '19'),
(80, '80', '20'),
(81, '6', '1'),
(82, '47', '1'),
(83, '44', '1'),
(84, '67', '1');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`Address_id`);

--
-- Tablo için indeksler `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`Book_id`),
  ADD KEY `Client_id` (`Client_id`),
  ADD KEY `Store_id` (`Store_id`),
  ADD KEY `Product_id` (`Product_id`);

--
-- Tablo için indeksler `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`Category_id`);

--
-- Tablo için indeksler `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`Client_id`);

--
-- Tablo için indeksler `has`
--
ALTER TABLE `has`
  ADD PRIMARY KEY (`Has_id`),
  ADD KEY `Store_id` (`Store_id`),
  ADD KEY `has_ibfk_1` (`Prod_id`);

--
-- Tablo için indeksler `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`Prod_id`),
  ADD KEY `Category_id` (`Category_id`);

--
-- Tablo için indeksler `salesperson`
--
ALTER TABLE `salesperson`
  ADD PRIMARY KEY (`Person_id`);

--
-- Tablo için indeksler `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`Store_id`),
  ADD KEY `Address_id` (`Address_id`);

--
-- Tablo için indeksler `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`Supplier_id`);

--
-- Tablo için indeksler `supplymatch`
--
ALTER TABLE `supplymatch`
  ADD PRIMARY KEY (`Match_id`),
  ADD KEY `Supplier_id` (`Supplier_id`),
  ADD KEY `Store_id` (`Store_id`);

--
-- Tablo için indeksler `updatetable`
--
ALTER TABLE `updatetable`
  ADD PRIMARY KEY (`Update_id`),
  ADD KEY `Person_id` (`Person_id`),
  ADD KEY `update_ibfk_1` (`Prod_id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `booking`
--
ALTER TABLE `booking`
  MODIFY `Book_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tablo için AUTO_INCREMENT değeri `client`
--
ALTER TABLE `client`
  MODIFY `Client_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Tablo için AUTO_INCREMENT değeri `has`
--
ALTER TABLE `has`
  MODIFY `Has_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- Tablo için AUTO_INCREMENT değeri `updatetable`
--
ALTER TABLE `updatetable`
  MODIFY `Update_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`Client_id`) REFERENCES `client` (`Client_id`),
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`Store_id`) REFERENCES `store` (`Store_id`),
  ADD CONSTRAINT `booking_ibfk_3` FOREIGN KEY (`Product_id`) REFERENCES `product` (`Prod_id`);

--
-- Tablo kısıtlamaları `has`
--
ALTER TABLE `has`
  ADD CONSTRAINT `has_ibfk_1` FOREIGN KEY (`Prod_id`) REFERENCES `product` (`Prod_id`),
  ADD CONSTRAINT `has_ibfk_2` FOREIGN KEY (`Store_id`) REFERENCES `store` (`Store_id`);

--
-- Tablo kısıtlamaları `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`Category_id`) REFERENCES `category` (`Category_id`);

--
-- Tablo kısıtlamaları `store`
--
ALTER TABLE `store`
  ADD CONSTRAINT `store_ibfk_1` FOREIGN KEY (`Address_id`) REFERENCES `address` (`Address_id`);

--
-- Tablo kısıtlamaları `supplymatch`
--
ALTER TABLE `supplymatch`
  ADD CONSTRAINT `supplymatch_ibfk_1` FOREIGN KEY (`Supplier_id`) REFERENCES `supplier` (`Supplier_id`),
  ADD CONSTRAINT `supplymatch_ibfk_2` FOREIGN KEY (`Store_id`) REFERENCES `store` (`Store_id`);

--
-- Tablo kısıtlamaları `updatetable`
--
ALTER TABLE `updatetable`
  ADD CONSTRAINT `updatetable_ibfk_1` FOREIGN KEY (`Prod_id`) REFERENCES `product` (`Prod_id`),
  ADD CONSTRAINT `updatetable_ibfk_2` FOREIGN KEY (`Person_id`) REFERENCES `salesperson` (`Person_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
