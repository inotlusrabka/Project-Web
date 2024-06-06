-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 06, 2024 at 09:13 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pc_part`
--

-- --------------------------------------------------------

--
-- Table structure for table `build_component`
--

CREATE TABLE `build_component` (
  `build_id` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `motherboard_id` int(11) NOT NULL,
  `processor_id` int(11) NOT NULL,
  `ram_id` int(11) NOT NULL,
  `gpu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `build_component`
--

INSERT INTO `build_component` (`build_id`, `UserID`, `motherboard_id`, `processor_id`, `ram_id`, `gpu_id`) VALUES
(1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `gpu`
--

CREATE TABLE `gpu` (
  `item_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `brand` varchar(20) NOT NULL,
  `item_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gpu`
--

INSERT INTO `gpu` (`item_id`, `price`, `brand`, `item_name`) VALUES
(1, 4700000, 'MSI', 'GeForce RTX™ 3060 VENTUS 2X 12G OC'),
(2, 8800000, 'Gigabyte', 'WINDFORCE OC GeForce RTX 4070 12 GB'),
(3, 30500000, 'Asus', 'ROG STRIX GAMING OC GeForce RTX 4090 24 GB'),
(4, 3000000, 'EVGA', 'GeForce GTX 1050 Ti 4GB'),
(5, 15000000, 'NVIDIA', 'GeForce RTX 3080 10GB'),
(6, 10000000, 'ZOTAC', 'GeForce RTX 3070 8GB'),
(7, 7000000, 'MSI', 'GeForce GTX 1660 SUPER 6GB'),
(8, 5000000, 'Gigabyte', 'GeForce GTX 1650 4GB'),
(9, 2500000, 'Asus', 'GeForce GT 1030 2GB'),
(10, 4500000, 'ASRock', 'Radeon RX 570 4GB'),
(11, 16000000, 'Sapphire', 'Radeon RX 6800 XT 16GB'),
(12, 18000000, 'XFX', 'Radeon RX 6900 XT 16GB'),
(13, 12000000, 'PowerColor', 'Radeon RX 6700 XT 12GB'),
(14, 9000000, 'AMD', 'Radeon RX 5600 XT 6GB'),
(15, 7000000, 'MSI', 'Radeon RX 5500 XT 8GB'),
(16, 14000000, 'Gigabyte', 'GeForce RTX 3060 Ti 8GB'),
(17, 20000000, 'NVIDIA', 'GeForce RTX 3080 Ti 12GB'),
(18, 35000000, 'Asus', 'GeForce RTX 3090 24GB'),
(19, 22000000, 'ZOTAC', 'GeForce RTX 3070 Ti 8GB'),
(20, 11000000, 'MSI', 'GeForce GTX 1080 Ti 11GB'),
(21, 26000000, 'Gigabyte', 'GeForce RTX 3080 Ti 12GB'),
(22, 30000000, 'NVIDIA', 'GeForce RTX 3090 Ti 24GB'),
(23, 27000000, 'Asus', 'GeForce RTX 3080 Ti 12GB');

-- --------------------------------------------------------

--
-- Table structure for table `motherboard`
--

CREATE TABLE `motherboard` (
  `item_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `brand` varchar(20) NOT NULL,
  `item_name` varchar(40) NOT NULL,
  `power_usage` int(11) DEFAULT NULL,
  `image_url` varchar(100) DEFAULT NULL,
  `socket` varchar(20) NOT NULL,
  `ram_slot` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `motherboard`
--

INSERT INTO `motherboard` (`item_id`, `price`, `brand`, `item_name`, `power_usage`, `image_url`, `socket`, `ram_slot`) VALUES
(1, 3500000, 'MSI', 'B650 GAMING PLUS WIFI', NULL, 'https://storage-asset.msi.com/global/picture/image/feature/mb/B650/B650-GAMING-PLUS-WIFI/b650-gaming', 'AM5', 4),
(2, 3700000, 'Asus', 'ROG STRIX B650-A GAMING WIFI', NULL, 'https://dlcdnwebimgs.asus.com/files/media/3151EBBB-8450-43F6-9994-D7E5E6A9D0E5/v1/img/style/id-desig', 'AM5', 4),
(3, 2900000, 'Gigabyte', 'B650 GAMING X AX', NULL, 'https://static.gigabyte.com/StaticFile/Image/Global/78a667df301f4e8abecc66bb5e8ea619/Product/32245/p', 'AM5', 4),
(4, 2500000, 'ASRock', 'B450M PRO4', 50, 'https://example.com/asrock-b450m-pro4.jpg', 'AM4', 4),
(5, 3000000, 'MSI', 'MAG B550 TOMAHAWK', 55, 'https://example.com/msi-mag-b550-tomahawk.jpg', 'AM4', 4),
(6, 4500000, 'Gigabyte', 'X570 AORUS ELITE', 60, 'https://example.com/gigabyte-x570-aorus-elite.jpg', 'AM4', 4),
(7, 5000000, 'Asus', 'ROG STRIX B550-F GAMING', 70, 'https://example.com/asus-rog-strix-b550-f-gaming.jpg', 'AM4', 4),
(8, 4000000, 'MSI', 'MAG B550M MORTAR WIFI', 50, 'https://example.com/msi-mag-b550m-mortar-wifi.jpg', 'AM4', 4),
(9, 3500000, 'Gigabyte', 'B550 AORUS ELITE', 55, 'https://example.com/gigabyte-b550-aorus-elite.jpg', 'AM4', 4),
(10, 2800000, 'ASRock', 'B450 STEEL LEGEND', 50, 'https://example.com/asrock-b450-steel-legend.jpg', 'AM4', 4),
(11, 6000000, 'Asus', 'TUF GAMING X570-PLUS', 65, 'https://example.com/asus-tuf-gaming-x570-plus.jpg', 'AM4', 4),
(12, 7000000, 'MSI', 'MEG X570 UNIFY', 75, 'https://example.com/msi-meg-x570-unify.jpg', 'AM4', 4),
(13, 8000000, 'Gigabyte', 'Z490 AORUS MASTER', 85, 'https://example.com/gigabyte-z490-aorus-master.jpg', 'LGA1200', 4),
(14, 9000000, 'Asus', 'ROG MAXIMUS XII HERO', 90, 'https://example.com/asus-rog-maximus-xii-hero.jpg', 'LGA1200', 4),
(15, 9500000, 'MSI', 'MEG Z490 GODLIKE', 95, 'https://example.com/msi-meg-z490-godlike.jpg', 'LGA1200', 4),
(16, 7500000, 'Gigabyte', 'Z490 VISION D', 80, 'https://example.com/gigabyte-z490-vision-d.jpg', 'LGA1200', 4),
(17, 5500000, 'ASRock', 'Z490 STEEL LEGEND', 60, 'https://example.com/asrock-z490-steel-legend.jpg', 'LGA1200', 4),
(18, 6500000, 'Asus', 'TUF GAMING Z490-PLUS', 70, 'https://example.com/asus-tuf-gaming-z490-plus.jpg', 'LGA1200', 4),
(19, 4700000, 'MSI', 'MPG Z490 GAMING EDGE WIFI', 65, 'https://example.com/msi-mpg-z490-gaming-edge-wifi.jpg', 'LGA1200', 4),
(20, 3200000, 'Gigabyte', 'Z490 UD', 50, 'https://example.com/gigabyte-z490-ud.jpg', 'LGA1200', 4),
(21, 4800000, 'ASRock', 'Z490 PHANTOM GAMING 4', 60, 'https://example.com/asrock-z490-phantom-gaming-4.jpg', 'LGA1200', 4),
(22, 5200000, 'Asus', 'PRIME Z490-P', 65, 'https://example.com/asus-prime-z490-p.jpg', 'LGA1200', 4),
(23, 5300000, 'MSI', 'Z490-A PRO', 70, 'https://example.com/msi-z490-a-pro.jpg', 'LGA1200', 4);

-- --------------------------------------------------------

--
-- Table structure for table `processor`
--

CREATE TABLE `processor` (
  `item_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `brand` varchar(20) NOT NULL,
  `item_name` varchar(40) NOT NULL,
  `power_usage` int(11) NOT NULL,
  `image_url` varchar(100) NOT NULL,
  `socket` varchar(20) NOT NULL,
  `core_count` int(11) NOT NULL,
  `performance_core_clock` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `processor`
--

INSERT INTO `processor` (`item_id`, `price`, `brand`, `item_name`, `power_usage`, `image_url`, `socket`, `core_count`, `performance_core_clock`) VALUES
(1, 6400000, 'AMD', 'Ryzen 7 7800X3D 4.2 GHz 8-Core', 120, 'https://www.amd.com/content/dam/amd/en/images/products/processors/ryzen/2505503-ryzen-7-7800x3d.jpg', 'AM5', 8, 4.2),
(2, 3500000, 'Intel', 'Core i5-10400F 2.9 GHz 6-Core', 65, 'https://example.com/intel-core-i5-10400f.jpg', 'LGA1200', 6, 2.9),
(3, 5000000, 'Intel', 'Core i7-10700K 3.8 GHz 8-Core', 95, 'https://example.com/intel-core-i7-10700k.jpg', 'LGA1200', 8, 3.8),
(4, 3000000, 'AMD', 'Ryzen 5 3600 3.6 GHz 6-Core', 65, 'https://example.com/amd-ryzen-5-3600.jpg', 'AM4', 6, 3.6),
(5, 4500000, 'AMD', 'Ryzen 7 3700X 3.6 GHz 8-Core', 65, 'https://example.com/amd-ryzen-7-3700x.jpg', 'AM4', 8, 3.6),
(6, 6000000, 'AMD', 'Ryzen 9 3900X 3.8 GHz 12-Core', 105, 'https://example.com/amd-ryzen-9-3900x.jpg', 'AM4', 12, 3.8),
(7, 7000000, 'Intel', 'Core i9-10900K 3.7 GHz 10-Core', 125, 'https://example.com/intel-core-i9-10900k.jpg', 'LGA1200', 10, 3.7),
(8, 2800000, 'AMD', 'Ryzen 3 3300X 3.8 GHz 4-Core', 65, 'https://example.com/amd-ryzen-3-3300x.jpg', 'AM4', 4, 3.8),
(9, 8000000, 'AMD', 'Ryzen 9 3950X 3.5 GHz 16-Core', 105, 'https://example.com/amd-ryzen-9-3950x.jpg', 'AM4', 16, 3.5),
(10, 2500000, 'Intel', 'Core i3-10100 3.6 GHz 4-Core', 65, 'https://example.com/intel-core-i3-10100.jpg', 'LGA1200', 4, 3.6),
(11, 2700000, 'AMD', 'Ryzen 3 3100 3.6 GHz 4-Core', 65, 'https://example.com/amd-ryzen-3-3100.jpg', 'AM4', 4, 3.6),
(12, 3700000, 'Intel', 'Core i5-10600K 4.1 GHz 6-Core', 95, 'https://example.com/intel-core-i5-10600k.jpg', 'LGA1200', 6, 4.1),
(13, 4200000, 'AMD', 'Ryzen 5 5600X 3.7 GHz 6-Core', 65, 'https://example.com/amd-ryzen-5-5600x.jpg', 'AM4', 6, 3.7),
(14, 5200000, 'AMD', 'Ryzen 7 5800X 3.8 GHz 8-Core', 105, 'https://example.com/amd-ryzen-7-5800x.jpg', 'AM4', 8, 3.8),
(15, 7700000, 'AMD', 'Ryzen 9 5900X 3.7 GHz 12-Core', 105, 'https://example.com/amd-ryzen-9-5900x.jpg', 'AM4', 12, 3.7),
(16, 9200000, 'AMD', 'Ryzen 9 5950X 3.4 GHz 16-Core', 105, 'https://example.com/amd-ryzen-9-5950x.jpg', 'AM4', 16, 3.4),
(17, 6200000, 'Intel', 'Core i7-11700K 3.6 GHz 8-Core', 125, 'https://example.com/intel-core-i7-11700k.jpg', 'LGA1200', 8, 3.6),
(18, 8000000, 'Intel', 'Core i9-11900K 3.5 GHz 8-Core', 125, 'https://example.com/intel-core-i9-11900k.jpg', 'LGA1200', 8, 3.5),
(19, 2900000, 'Intel', 'Core i5-10400 2.9 GHz 6-Core', 65, 'https://example.com/intel-core-i5-10400.jpg', 'LGA1200', 6, 2.9),
(20, 3900000, 'Intel', 'Core i5-11400 2.6 GHz 6-Core', 65, 'https://example.com/intel-core-i5-11400.jpg', 'LGA1200', 6, 2.6),
(21, 3400000, 'AMD', 'Ryzen 5 2600 3.4 GHz 6-Core', 65, 'https://example.com/amd-ryzen-5-2600.jpg', 'AM4', 6, 3.4),
(22, 5700000, 'AMD', 'Ryzen 7 2700X 3.7 GHz 8-Core', 105, 'https://example.com/amd-ryzen-7-2700x.jpg', 'AM4', 8, 3.7);

-- --------------------------------------------------------

--
-- Table structure for table `ram`
--

CREATE TABLE `ram` (
  `item_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `brand` varchar(20) NOT NULL,
  `item_name` varchar(40) NOT NULL,
  `size` int(11) NOT NULL,
  `module` int(11) NOT NULL,
  `type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ram`
--

INSERT INTO `ram` (`item_id`, `price`, `brand`, `item_name`, `size`, `module`, `type`) VALUES
(1, 1850000, 'Corsair', 'Vengeance 32 GB', 16, 2, ''),
(2, 2500000, 'G.Skill', 'Ripjaws V 16 GB', 8, 2, 'DDR4'),
(3, 3700000, 'Corsair', 'Vengeance LPX 32 GB', 16, 2, 'DDR4'),
(4, 4500000, 'Kingston', 'HyperX Fury 16 GB', 8, 2, 'DDR4'),
(5, 5200000, 'Crucial', 'Ballistix Sport LT 32 GB', 16, 2, 'DDR4'),
(6, 6100000, 'G.Skill', 'Trident Z RGB 32 GB', 16, 2, 'DDR4'),
(7, 4700000, 'Corsair', 'Vengeance RGB Pro 16 GB', 8, 2, 'DDR4'),
(8, 5400000, 'Kingston', 'FURY Beast 16 GB', 8, 2, 'DDR4'),
(9, 3300000, 'Team', 'T-Force Vulcan Z 16 GB', 8, 2, 'DDR4'),
(10, 4100000, 'ADATA', 'XPG Z1 16 GB', 8, 2, 'DDR4'),
(11, 2900000, 'G.Skill', 'Aegis 16 GB', 8, 2, 'DDR4'),
(12, 5000000, 'Patriot', 'Viper 4 16 GB', 8, 2, 'DDR4'),
(13, 2700000, 'Corsair', 'Vengeance 16 GB', 8, 2, 'DDR4'),
(14, 3500000, 'Crucial', 'Ballistix 16 GB', 8, 2, 'DDR4'),
(15, 3800000, 'G.Skill', 'Ripjaws V 32 GB', 16, 2, 'DDR4'),
(16, 6000000, 'Corsair', 'Vengeance LPX 64 GB', 16, 4, 'DDR4'),
(17, 4500000, 'Kingston', 'HyperX Fury 32 GB', 16, 2, 'DDR4'),
(18, 5200000, 'Crucial', 'Ballistix Sport LT 16 GB', 8, 2, 'DDR4'),
(19, 6100000, 'G.Skill', 'Trident Z RGB 64 GB', 16, 4, 'DDR4'),
(20, 4700000, 'Corsair', 'Vengeance RGB Pro 32 GB', 16, 2, 'DDR4'),
(21, 5400000, 'Kingston', 'FURY Beast 32 GB', 16, 2, 'DDR4'),
(22, 3300000, 'Team', 'T-Force Vulcan Z 32 GB', 16, 2, 'DDR4');

-- --------------------------------------------------------

--
-- Table structure for table `userdata`
--

CREATE TABLE `userdata` (
  `UserID` int(11) NOT NULL,
  `Username` varchar(256) NOT NULL,
  `Email` varchar(256) NOT NULL,
  `Password` varchar(64) NOT NULL,
  `AccessLevel` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `userdata`
--

INSERT INTO `userdata` (`UserID`, `Username`, `Email`, `Password`, `AccessLevel`) VALUES
(1, 'kelompokkeren', '12345678', 'ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f', 'Member'),
(2, 'insert into UserData (AccessLevel) values (\"Admin\");', '123456', 'ee79976c9380d5e337fc1c095ece8c8f22f91f306ceeb161fa51fecede2c4ba1', 'Member'),
(3, 'akbar', 'akbar@gmail.com', 'ee79976c9380d5e337fc1c095ece8c8f22f91f306ceeb161fa51fecede2c4ba1', 'Member'),
(4, 'lmfaos', 'lol', '1718c24b10aeb8099e3fc44960ab6949ab76a267352459f203ea1036bec382c2', 'Member'),
(5, 'kelasb', 'kelasb@gmail.com', '054e3b308708370ea029dc2ebd1646c498d59d7203c9e1a44cf0484df98e581a', 'Member');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `build_component`
--
ALTER TABLE `build_component`
  ADD PRIMARY KEY (`build_id`),
  ADD KEY `gpu_id` (`gpu_id`),
  ADD KEY `motherboard_id` (`motherboard_id`),
  ADD KEY `processor_id` (`processor_id`),
  ADD KEY `ram_id` (`ram_id`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `gpu`
--
ALTER TABLE `gpu`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `motherboard`
--
ALTER TABLE `motherboard`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `processor`
--
ALTER TABLE `processor`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `ram`
--
ALTER TABLE `ram`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `userdata`
--
ALTER TABLE `userdata`
  ADD PRIMARY KEY (`UserID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `userdata`
--
ALTER TABLE `userdata`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `build_component`
--
ALTER TABLE `build_component`
  ADD CONSTRAINT `build_component_ibfk_1` FOREIGN KEY (`gpu_id`) REFERENCES `gpu` (`item_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `build_component_ibfk_2` FOREIGN KEY (`motherboard_id`) REFERENCES `motherboard` (`item_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `build_component_ibfk_3` FOREIGN KEY (`processor_id`) REFERENCES `processor` (`item_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `build_component_ibfk_4` FOREIGN KEY (`ram_id`) REFERENCES `ram` (`item_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `build_component_ibfk_5` FOREIGN KEY (`UserID`) REFERENCES `userdata` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
