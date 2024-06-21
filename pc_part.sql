-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 21, 2024 at 05:19 PM
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
  `gpu_id` int(11) NOT NULL,
  `powersupply_id` int(11) NOT NULL,
  `cases_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `build_component`
--

INSERT INTO `build_component` (`build_id`, `UserID`, `motherboard_id`, `processor_id`, `ram_id`, `gpu_id`, `powersupply_id`, `cases_id`) VALUES
(1, 3, 5, 9, 6, 3, 16, 3),
(2, 3, 4, 11, 9, 4, 12, 17),
(3, 3, 4, 8, 12, 4, 13, 10),
(4, 1, 8, 6, 11, 4, 13, 10);

-- --------------------------------------------------------

--
-- Table structure for table `cases`
--

CREATE TABLE `cases` (
  `id` int(11) NOT NULL,
  `model` varchar(100) NOT NULL,
  `series_number` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `price` int(25) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image_url` varchar(300) NOT NULL,
  `buy_url` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cases`
--

INSERT INTO `cases` (`id`, `model`, `series_number`, `type`, `price`, `description`, `image_url`, `buy_url`) VALUES
(1, 'NZXT H510', 'CA-H510B-W1', 'Mid Tower', 1200000, 'Stylish mid tower case with tempered glass side panel and excellent cable management.', 'https://nzxt.com/assets/cms/34299/1617970872-h510-white-black-mainw-system.png?auto=format&dpr=1.5&fit=crop&h=1000&w=1000', 'https://tokopedia.link/cu8cOvwwBKb'),
(2, 'Phanteks Eclipse P400A', 'PH-EC400ATG_BK01', 'Mid Tower', 1400000, 'High airflow mid tower case with mesh front panel and RGB lighting.', 'https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full//catalog-image/89/MTA-131424901/no-brand_no-brand_full01.jpg', 'https://tokopedia.link/Asan4EXwBKb'),
(3, 'Fractal Design Meshify C', 'FD-CA-MESH-C-BKO-TG', 'Mid Tower', 1300000, 'Compact mid tower case with excellent airflow and tempered glass side panel.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOv46jijvWgtndVeU3wWKJQjKxZ91z07fhJQ&s', 'https://tokopedia.link/iDbB8f0wBKb'),
(4, 'Cooler Master MasterBox MB511 RGB', 'MCB-B511D-KGNN-RGB', 'Mid Tower', 1100000, 'Mid tower case with RGB lighting and optimized airflow for gaming builds.', 'https://a.storyblok.com/f/281110/322073bfac/mb511rgb_g1.png/m/1440x0/smart', 'https://tokopedia.link/CY9HxS2wBKb'),
(5, 'Corsair iCUE 220T RGB', 'CC-9011190-WW', 'Mid Tower', 1500000, 'Compact mid tower case with tempered glass side panel and RGB lighting.', 'https://assets.corsair.com/image/upload/c_pad,q_auto,h_1024,w_1024,f_auto/products/Cases/CC-9011190-WW/Gallery/220T_RGB_GLASS_BLACK_01.webp?width=1080&quality=85&auto=webp&format=pjpg', 'https://tokopedia.link/oGPbL15wBKb'),
(6, 'NZXT H710i', 'CA-H710i-B1', 'Full Tower', 1800000, 'Premium full tower case with integrated RGB lighting and tempered glass side panel.', 'https://nzxt.com/assets/cms/34299/1615570836-h710i-2020-white-black-kraken-x-system.png?auto=format&dpr=1.5&fit=crop&h=1000&w=1000', 'https://tokopedia.link/jObgBhKxBKb'),
(7, 'Phanteks Enthoo Pro II', 'PH-ES719LTG_DBK01', 'Full Tower', 2000000, 'Spacious full tower case with versatile cooling options and extensive storage support.', 'https://m.media-amazon.com/images/I/81gALg+hx3L._AC_UF894,1000_QL80_.jpg', 'https://tokopedia.link/NgeO4hSxBKb'),
(8, 'Fractal Design Define 7', 'FD-C-DEF7A-06', 'Full Tower', 1900000, 'Silent full tower case with sound-dampening panels and modular interior layout.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRn-yjocwF8_v6yc51VE1AhRDpP15Nx8VYN7g&s', 'https://tokopedia.link/NWoB5XUxBKb'),
(9, 'Cooler Master Cosmos C700M', 'MCC-C700M-MG5N-S00', 'Full Tower', 2200000, 'High-end full tower case with aluminum panels, RGB lighting, and adjustable motherboard layout.', 'https://a.storyblok.com/f/281110/cb15588e1a/c700m-black-gallery-1.png/m/1440x0/smart', 'https://tokopedia.link/lcVv4SYxBKb'),
(10, 'Corsair Obsidian Series 1000D', 'CC-9011148-WW', 'Full Tower', 2500000, 'Super tower case with dual-system capability, extensive cooling support, and premium build quality.', 'https://assets.corsair.com/image/upload/c_pad,q_auto,h_1024,w_1024,f_auto/products/Cases/CC-9011148-WW/Gallery/1000D_01.webp?width=1080&quality=85&auto=webp&format=pjpg', 'https://tokopedia.link/AZIiV11xBKb'),
(15, 'Corsair Carbide Series 88R', 'CC-9011086-WW', 'MicroATX', 700000, 'MicroATX case with clean exterior design and versatile cooling options.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0LF12H2uy5w1R4CgvWlA-fTkdPX28loAbvw&s', 'https://tokopedia.link/O7rgGL4xBKb'),
(16, 'NZXT H400i', 'CA-H400W-BB', 'MicroATX', 900000, 'Compact MicroATX case with tempered glass side panel and integrated RGB lighting.', 'https://www.bhphotovideo.com/images/images1000x1000/nzxt_ca_h400w_bb_h400i_matte_black_1395876.jpg', 'https://tokopedia.link/JdFSHufyBKb'),
(17, 'Phanteks Eclipse P300A', 'PH-EC300ATG_BK01', 'MicroATX', 750000, 'Budget-friendly MicroATX case with good airflow and stylish design.', 'https://m.media-amazon.com/images/I/91Gqz3yTwnL.jpg', 'https://tokopedia.link/MHMhfkjyBKb'),
(18, 'Fractal Design Meshify C Mini', 'FD-CA-MESH-C-MINI-BKO-TG', 'MicroATX', 800000, 'Compact MicroATX case with high airflow mesh front panel and tempered glass side panel.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKol70Tn0FpN8q8SHW4EgRzmKS5PvI9maCSA&s', 'https://tokopedia.link/RUEUOjnyBKb'),
(19, 'Cooler Master MasterBox Q300L', 'MCB-Q300L-KANN-S00', 'MicroATX', 600000, 'MicroATX case with magnetic dust filters and versatile cooling options.', 'https://a.storyblok.com/f/281110/5c1192c34c/gallery-2-min.png/m/1440x0/smart', 'https://tokopedia.link/L8MzzppyBKb'),
(20, 'Corsair Crystal Series 280X', 'CC-9011135-WW', 'MicroATX', 850000, 'MicroATX case with tempered glass side panels and dual-chamber internal layout.', 'https://assets.corsair.com/image/upload/c_pad,q_auto,h_1024,w_1024,f_auto/products/Cases/CC-9011135-WW/Gallery/280X_RGB_BLK_01.webp?width=1080&quality=85&auto=webp&format=pjpg', 'https://tokopedia.link/XW0SdwryBKb');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(6) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `message` text NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `message`, `reg_date`) VALUES
(1, 'aaaaaaaa', 'zidanealfatih14@gmail.com', 'testing', '2024-06-20 11:28:32');

-- --------------------------------------------------------

--
-- Table structure for table `gpu`
--

CREATE TABLE `gpu` (
  `item_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `brand` varchar(20) NOT NULL,
  `item_name` varchar(50) NOT NULL,
  `power_usage` int(11) NOT NULL,
  `image_url` varchar(300) NOT NULL,
  `buy_url` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gpu`
--

INSERT INTO `gpu` (`item_id`, `price`, `brand`, `item_name`, `power_usage`, `image_url`, `buy_url`) VALUES
(1, 4700000, 'MSI', 'GeForce RTX™ 3060 VENTUS 2X 12G OC', 170, 'https://asset.msi.com/resize/image/global/product/product_1610443907b48feb29b4a49834f4b19e35c5511db6.png62405b38c58fe0f07fcef2367d8a9ba1/1024.png', 'https://tokopedia.link/vsYV76OyBKb'),
(2, 8800000, 'Gigabyte', 'WINDFORCE OC GeForce RTX 4070 12 GB', 200, 'https://m.media-amazon.com/images/I/71qIJjDVfzL.jpg', 'https://tokopedia.link/IcWhrmRyBKb'),
(3, 30500000, 'Asus', 'ROG STRIX GAMING OC GeForce RTX 4090 24 GB', 450, 'https://images.tokopedia.net/img/cache/700/VqbcmM/2022/10/12/96bcfdea-f74a-4ead-afee-1375501e1af9.png', 'https://tokopedia.link/GYwlQ5UyBKb'),
(4, 3000000, 'EVGA', 'GeForce GTX 1050 Ti 4GB', 75, 'https://m.media-amazon.com/images/I/81Yj5yvjwHL.jpg', 'https://tokopedia.link/Z8bHo9XyBKb'),
(5, 15000000, 'NVIDIA', 'GeForce RTX 3080 10GB', 320, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9MrAb-wDuxFXxc8JTgUaTM2-anIphDio1eg&s', 'https://tokopedia.link/fWpkuj2yBKb'),
(6, 10000000, 'ZOTAC', 'GeForce RTX 3070 8GB', 220, 'https://images.tokopedia.net/img/cache/500-square/VqbcmM/2021/2/9/6898de2d-ad00-449f-92fc-de9d797cd4a2.jpg', 'https://tokopedia.link/MiVJZ44yBKb'),
(7, 7000000, 'MSI', 'GeForce GTX 1660 SUPER 6GB', 125, 'https://asset.msi.com/resize/image/global/product/product_9_20191024090506_5db0f8c2ee3a7.png62405b38c58fe0f07fcef2367d8a9ba1/1024.png', 'https://tokopedia.link/vDm8gFxzBKb'),
(8, 5000000, 'Gigabyte', 'GeForce GTX 1650 4GB', 75, 'https://images.tokopedia.net/img/cache/700/VqbcmM/2022/2/16/607d4958-ed36-41ba-9851-322f4bece667.jpg', 'https://tokopedia.link/ARPvBvzzBKb'),
(9, 2500000, 'Asus', 'GeForce GT 1030 2GB', 30, 'https://images.tokopedia.net/img/cache/700/product-1/2019/4/23/7701906/7701906_9276a88c-3bf9-4490-a0bc-ef5b596c9448_500_500.png', 'https://tokopedia.link/UxQfS3GzBKb'),
(10, 4500000, 'ASRock', 'Radeon RX 570 4GB', 150, 'https://pg.asrock.com/Graphics-Card/photo/Phantom%20Gaming%20D%20Radeon%20RX570%204G(L1).png', 'https://tokopedia.link/jjff8UIzBKb'),
(11, 16000000, 'Sapphire', 'Radeon RX 6800 XT 16GB', 300, 'https://images.tokopedia.net/img/cache/700/VqbcmM/2022/2/11/2b960ec4-52d5-4390-86d6-9e2ba53928bf.jpg', 'https://tokopedia.link/kASqvXnABKb'),
(12, 18000000, 'XFX', 'Radeon RX 6900 XT 16GB', 300, 'https://images.tokopedia.net/img/cache/700/VqbcmM/2022/8/18/64068afe-d800-45da-8cbb-1be66ea243a4.jpg', 'https://tokopedia.link/PTFzTRpABKb'),
(13, 12000000, 'PowerColor', 'Radeon RX 6700 XT 12GB', 230, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQp_lQkFTNc4WlEXxYYSPj4V7aARm5GPMSyOA&s', 'https://tokopedia.link/fVulbrxABKb'),
(14, 9000000, 'AMD', 'Radeon RX 5600 XT 6GB', 150, 'https://images.tokopedia.net/img/cache/700/VqbcmM/2023/12/19/bd5261c1-eef3-4035-81ca-bae0ca20bfe6.jpg', 'https://tokopedia.link/e4Lv3vzABKb'),
(15, 7000000, 'MSI', 'Radeon RX 5500 XT 8GB', 130, 'https://asset.msi.com/resize/image/global/product/product_0_20191129162145_5de0d519d6953.png62405b38c58fe0f07fcef2367d8a9ba1/1024.png', 'https://tokopedia.link/n3ujPuBABKb'),
(16, 14000000, 'Gigabyte', 'GeForce RTX 3060 Ti 8GB', 200, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-KO36Vwb90O8iCI7ifJC2KAUq6KCUcP14Tw&s', 'https://tokopedia.link/XKAzRtDABKb'),
(17, 20000000, 'NVIDIA', 'GeForce RTX 3080 Ti 12GB', 350, 'https://www.nvidia.com/content/dam/en-zz/Solutions/geforce/ampere/rtx-3080-3080ti/geforce-rtx-3080-ti-product-gallery-thumbnail-267-3.jpg', 'https://tokopedia.link/67KbsaFABKb'),
(18, 35000000, 'Asus', 'GeForce RTX 3090 24GB', 350, 'https://images.tokopedia.net/img/cache/500-square/VqbcmM/2021/2/8/6aea6ed8-a9c5-40c5-a144-8047cd9a5e0f.jpg', 'https://tokopedia.link/Zwah1oHABKb'),
(19, 22000000, 'ZOTAC', 'GeForce RTX 3070 Ti 8GB', 290, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4M2xPpUtbATTTxD_AdEqU7lYjkyBsuP97UA&s', 'https://tokopedia.link/Z2pPBBMABKb'),
(20, 11000000, 'MSI', 'GeForce GTX 1080 Ti 11GB', 250, 'https://asset.msi.com/resize/image/global/product/product_0_20170323105218_58d33862572b9.png62405b38c58fe0f07fcef2367d8a9ba1/1024.png', 'https://tokopedia.link/IpiAQYJABKb'),
(21, 26000000, 'Gigabyte', 'GeForce RTX 3080 Ti 12GB', 350, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwjIlZYdlxlulP2wWSFrIGEXbDEj03900p9Q&s', 'https://tokopedia.link/MytzUoOABKb'),
(22, 30000000, 'NVIDIA', 'GeForce RTX 3090 Ti 24GB', 450, 'https://m.media-amazon.com/images/I/51K36OrmxLL._AC_UF894,1000_QL80_.jpg', 'https://tokopedia.link/YEw3UTTABKb'),
(23, 27000000, 'Asus', 'GeForce RTX 3080 Ti 12GB', 350, 'https://images.tokopedia.net/img/cache/700/VqbcmM/2021/11/1/de1217e3-674e-4e5b-8681-a5966df81a55.jpg', 'https://tokopedia.link/IU48tMSABKb');

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
  `image_url` varchar(300) DEFAULT NULL,
  `socket` varchar(20) NOT NULL,
  `type` varchar(10) NOT NULL,
  `ram_slot` int(11) NOT NULL,
  `buy_url` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `motherboard`
--

INSERT INTO `motherboard` (`item_id`, `price`, `brand`, `item_name`, `power_usage`, `image_url`, `socket`, `type`, `ram_slot`, `buy_url`) VALUES
(1, 3500000, 'MSI', 'B650 GAMING PLUS WIFI', 60, 'https://storage-asset.msi.com/global/picture/image/feature/mb/B650/B650-GAMING-PLUS-WIFI/modelblock-gaming-pd.png', 'AM5', 'ATX', 4, 'https://tokopedia.link/6l9DZI8ABKb\''),
(2, 3700000, 'Asus', 'ROG STRIX B650-A GAMING WIFI', 60, 'https://dlcdnwebimgs.asus.com/files/media/3151EBBB-8450-43F6-9994-D7E5E6A9D0E5/v1/img/style/id-desig', 'AM5', 'ATX', 4, 'https://tokopedia.link/6l9DZI8ABKb\''),
(3, 2900000, 'Gigabyte', 'B650 GAMING X AX', 60, 'https://static.gigabyte.com/StaticFile/Image/Global/78a667df301f4e8abecc66bb5e8ea619/Product/32245/p', 'AM5', 'ATX', 4, 'https://tokopedia.link/VgbhlyNBBKb\''),
(4, 2500000, 'ASRock', 'B450M PRO4', 50, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQOfhHfuFGG48In_bNPmmL1B1W4cSBFTuFu_Q&s', 'AM4', 'Micro ATX', 4, 'https://tokopedia.link/LEltBLPBBKb\''),
(5, 3000000, 'MSI', 'MAG B550 TOMAHAWK', 55, 'https://blossomzones.com/wp-content/uploads/2020/07/B550-TOMAHAWK.jpg', 'AM4', 'ATX', 4, 'https://tokopedia.link/DwFwqTUBBKb\''),
(6, 4500000, 'Gigabyte', 'X570 AORUS ELITE', 60, 'https://static.gigabyte.com/StaticFile/Image/Global/b281bb90ea1787d73fe5bff45821cd8c/Product/22419/png/500', 'AM4', 'ATX', 4, 'https://tokopedia.link/1RgPYnXBBKb\''),
(7, 5000000, 'Asus', 'ROG STRIX B550-F GAMING', 70, 'https://images.tokopedia.net/img/cache/700/VqbcmM/2021/2/26/a7c69a9d-6129-4649-af35-e0d3aa4409bf.jpg', 'AM4', 'ATX', 4, 'https://tokopedia.link/SM8vbXZBBKb\''),
(8, 4000000, 'MSI', 'MAG B550M MORTAR WIFI', 50, 'https://m.media-amazon.com/images/I/91dm7oEjt3L._AC_UF894,1000_QL80_.jpg', 'AM4', 'Micro ATX', 4, 'https://tokopedia.link/hNWP9q1BBKb\''),
(9, 3500000, 'Gigabyte', 'B550 AORUS ELITE', 55, 'https://images.tokopedia.net/img/cache/700/VqbcmM/2021/3/10/dbb9d0be-6d05-4019-ac9a-eedb8bae7de4.png', 'AM4', 'ATX', 4, 'https://tokopedia.link/MYwSR84BBKb\''),
(10, 2800000, 'ASRock', 'B450 STEEL LEGEND', 50, 'https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full//106/MTA-74350986/amd_asrock-b450-steel-legend-am4-amd-promontory-b450-ddr4-usb3-1-_full01.jpg', 'AM4', 'ATX', 4, 'https://tokopedia.link/BlWP9B7BBKb\''),
(11, 6000000, 'Asus', 'TUF GAMING X570-PLUS', 65, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDM544Ur7W8f1y_QguKxivj6iu4cb0evTinw&s', 'AM4', 'ATX', 4, 'https://tokopedia.link/pHb7m98BBKb\''),
(12, 7000000, 'MSI', 'MEG X570 UNIFY', 75, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcReVrx-dGcT6w95r7S6bApeoWeZe_QjdS9hZQ&s', 'AM4', 'ATX', 4, 'https://tokopedia.link/ElgjQdbCBKb\''),
(13, 8000000, 'Gigabyte', 'Z490 AORUS MASTER', 85, 'https://images.tokopedia.net/img/cache/700/VqbcmM/2020/11/4/9e619c3f-978b-4c7e-bd66-17ab3714142f.png', 'LGA1200', 'ATX', 4, 'https://tokopedia.link/5q4dsIeCBKb\''),
(14, 9000000, 'Asus', 'ROG MAXIMUS XII HERO', 90, 'https://images.tokopedia.net/img/cache/700/product-1/2020/9/5/5163039/5163039_661fd887-fa22-4b5e-ae2c-bc36d4da6cd2_508_508', 'LGA1200', 'ATX', 4, 'https://tokopedia.link/NdBwY1fCBKb\''),
(15, 9500000, 'MSI', 'MEG Z490 GODLIKE', 95, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVzQWciL5oYtU73x3L22dosArsoQdD13fOnQ&s', 'LGA1200', 'ATX', 4, 'https://tokopedia.link/WOTe9rhCBKb\''),
(16, 7500000, 'Gigabyte', 'Z490 VISION D', 80, 'https://static.gigabyte.com/StaticFile/Image/Global/ac3834c102ae0a0d103b7e3cf764fd1c/Product/25021/Png', 'LGA1200', 'ATX', 4, 'https://tokopedia.link/0IzoFMiCBKb\''),
(17, 5500000, 'ASRock', 'Z490 STEEL LEGEND', 60, 'https://www.asrock.com/mb/photo/Z490%20Steel%20Legend(M1).png', 'LGA1200', 'ATX', 4, 'https://tokopedia.link/u9kufvkCBKb\''),
(18, 6500000, 'Asus', 'TUF GAMING Z490-PLUS', 70, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTyRx2WAFgual3Qvb50SEJKDbBdXLDZf-S7PQ&s', 'LGA1200', 'ATX', 4, 'https://tokopedia.link/fPyEnlmCBKb\''),
(19, 4700000, 'MSI', 'MPG Z490 GAMING EDGE WIFI', 65, 'https://asset.msi.com/resize/image/global/product/product_160938693173d821d3e96c87e573f494cb2197728e.png62405b38c58fe0f07fcef2367d8a9ba1/1024.png', 'LGA1200', 'ATX', 4, 'https://tokopedia.link/BESsLGnCBKb\''),
(20, 3200000, 'Gigabyte', 'Z490 UD', 50, 'https://static.gigabyte.com/StaticFile/Image/Global/5194226566f55c0daf2b06d9ef8e4969/Product/24912/Png', 'LGA1200', 'ATX', 4, 'https://tokopedia.link/MuW5W1sCBKb\''),
(21, 4800000, 'ASRock', 'Z490 PHANTOM GAMING 4', 60, 'https://pg.asrock.com/mb/photo/Z490%20Phantom%20Gaming%204(L1).png', 'LGA1200', 'ATX', 4, 'https://tokopedia.link/If3qnivCBKb\''),
(22, 5200000, 'Asus', 'PRIME Z490-P', 65, 'https://images.tokopedia.net/img/cache/700/hDjmkQ/2021/6/1/7c15bf60-a2b2-4483-92e0-ac4dda27626b.jpg', 'LGA1200', 'ATX', 4, 'https://tokopedia.link/aP6pevwCBKb\''),
(23, 5300000, 'MSI', 'Z490-A PRO', 70, 'https://asset.msi.com/resize/image/global/product/product_1682670061e46ba0eab3bd45242c22708e43da606f.png62405b38c58fe0f07fcef2367d8a9ba1/1024.png', 'LGA1200', 'ATX', 4, 'https://tokopedia.link/eci1MXxCBKb\');');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `title` varchar(64) DEFAULT NULL,
  `message` text NOT NULL,
  `build_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `UserID`, `title`, `message`, `build_id`) VALUES
(2, 3, 'test', 'test', 1),
(3, 3, 'test1', 'test1', 3),
(4, 3, 'tesss', 'tesss', 2);

-- --------------------------------------------------------

--
-- Table structure for table `powersupply`
--

CREATE TABLE `powersupply` (
  `id` int(11) NOT NULL,
  `model` varchar(100) NOT NULL,
  `series_number` varchar(50) DEFAULT NULL,
  `wattage` int(11) DEFAULT NULL,
  `image_url` varchar(300) NOT NULL,
  `price` int(25) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `buy_url` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `powersupply`
--

INSERT INTO `powersupply` (`id`, `model`, `series_number`, `wattage`, `image_url`, `price`, `description`, `buy_url`) VALUES
(1, 'Corsair RM750x', 'CP-9020179-NA', 750, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStGXfUg-KVQX0B7Moz4KPM64MhyQ3hlE5fPw&s', 1500000, 'Unit sumber daya yang andal dan efisien dengan kabel modular.', 'https://www.tokopedia.com/eseskomputer/psu-corsair-cv-series-cv750-750w-cv-750-80-plus-bronze-flat-cables?extParam=ivf%3Dfalse&src=topads'),
(2, 'EVGA SuperNOVA 850 G3', '220-G3-0850-X1', 850, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGfnKTlPgg_6Rie2cGXh5-dOvEc4ziYK6iYw&s', 1700000, 'Sumber daya yang sangat baik untuk gaming dan overclocking.', 'https://www.tokopedia.com/hello-r/evga-supernova-850-g3-80-plus-gold-power-supply?extParam=ivf%3Dfalse%26keyword%3Devga+supernova+g3%26search_id%3D20240621092136CDC64160AC8B80010MM0%26src%3Dsearch'),
(3, 'Seasonic Focus GX-650', 'SSR-650FX', 650, 'https://m.media-amazon.com/images/I/81JR4qhqzLL.jpg', 1300000, 'Sumber daya dengan sertifikasi 80 Plus Gold dan desain kompak.', 'https://www.tokopedia.com/cockomputer/seasonic-focus-gold-gx-650-650w-full-modular?utm_source=google&utm_medium=organic&utm_campaign=pdp-seo'),
(4, 'Thermaltake Toughpower GF1 750W', 'PS-TPD-0750FNFAGU-1', 750, 'https://m.media-amazon.com/images/I/71DDgVE794L.jpg', 1600000, 'Sumber daya modular lengkap dengan pencahayaan RGB dan efisiensi tinggi.', 'https://www.tokopedia.com/a-10store/thermaltake-toughpower-gf1-750-850-1050-1200w-80-gold-full-modular'),
(5, 'Cooler Master MWE Gold 650 V2', 'MPY-6501-AFAAG-US', 650, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaBQr3jI9682DJgQKhOSdKm6kuwzSbYm2FAQ&s', 1400000, 'Sumber daya yang tenang dan efisien cocok untuk build gaming menengah.', 'https://www.tokopedia.com/sportonlineshop/cooler-master-mwe-gold-650-v2-full-modular-80-gold-650w'),
(6, 'be quiet! Straight Power 11 750W', 'BN283', 750, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRmawwyBBP8Rzv-wU3Rj1UEtzbk1LIxO2oLKQ&s', 1800000, 'Sumber daya yang diam dan handal dengan komponen berkualitas tinggi.', 'https://www.enterkomputer.com/detail/157442/be-quiet-STRAIGHT-POWER-11-750W-Fully-Modular-80-Platinum-Certified-5-Years-Warranty-Number-1-PSU-in-Germany'),
(7, 'NZXT C Series 650W', 'NP-C650M-US', 650, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRyP1knmDmw_H7cH17REAZ6TqKsEy-sxkzTag&s', 1500000, 'Sumber daya kompak dengan sertifikasi 80 Plus Gold.', 'https://www.tokopedia.com/ctcharco/psu-nzxt-c650-650w-fully-modular-80plus-gold-np-c650m-power-supply?extParam=ivf%3Dfalse%26keyword%3Dnzxt+c650%26search_id%3D20240621093022FF021E6829306F0CFFKW%26src%3Dsearch'),
(8, 'SilverStone SST-SX650-G', 'SST-SX650-G', 650, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpaZrEcVr7jQ2FF_bWrgHp__WNVKQy5Bwytg&s', 1600000, 'Unit sumber daya yang ramping dan kuat untuk build form factor kecil.', 'https://www.tokopedia.com/tokoexpert/silverstone-sx650-g-650w-80-gold-full-modular-sfx-power-supply?utm_source=google&utm_medium=organic&utm_campaign=pdp-seo'),
(9, 'Antec Earthwatts Gold Pro 550W', 'EA550G PRO', 550, 'https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full//91/MTA-40077403/antec_power_supply_-_psu_antec_ea-gold_pro_550w_-_ea550g_pro_-_80-_gold_full01_h6a5xilf.jpg', 1200000, 'Sumber daya hemat energi dengan kapasitor Jepang untuk kehandalan jangka panjang.', 'https://www.tokopedia.com/cockomputer/antec-ea-gold-pro-550w-ea550g-pro-80-gold-modular'),
(10, 'Cooler Master MasterWatt 750', 'MPX-7501-AMAAB-US', 750, 'https://m.media-amazon.com/images/I/61qimjpxKrL.jpg', 1400000, 'Sumber daya yang terjangkau dan tahan lama dengan kabel modular penuh.', 'https://www.tokopedia.com/global-link168/power-supply-cooler-master-masterwatt-750-80-bronze-modular-psu'),
(11, 'EVGA 600 W1', '100-W1-0600-K1', 600, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBg19fTsd4oeWMFnFEsi20ZaHZFy15XKHz8g&s', 1100000, 'Sumber daya dasar untuk build berbiaya terjangkau.', 'https://www.tokopedia.com/asiabizparkjkt/psu-evga-600w-80plus-white-600watt-100-w1-0600-pgn-e-06?extParam=ivf%3Dfalse&src=topads'),
(12, 'Thermaltake Smart 500W', 'PS-SPD-0500NPCWUS-W', 500, 'https://thermaltakeusa.com/cdn/shop/files/PS-SPD-0500NPCW-W_6ef789325329466088eb98dc78b5bf77.jpg?v=1691162436&width=1445', 900000, 'Sumber daya tingkat pemula dengan performa yang handal untuk build pemula.', 'https://www.tokopedia.com/ragamhardisk/thermaltake-power-supply-toughpower-gx1-500watt-80-gold-rgb?extParam=ivf%3Dfalse%26keyword%3Dthermaltake+500w%26search_id%3D20240621093342C68B62B165277913E5IW%26src%3Dsearch'),
(13, 'Seasonic S12III 500 SSR-500GB3', 'SSR-500GB3', 500, 'https://m.media-amazon.com/images/I/41geCC+1cqL.jpg', 1000000, 'Sumber daya berbiaya rendah dengan sertifikasi 80 Plus Bronze.', 'https://www.tokopedia.com/wiracom/seasonic-s12iii-500-ssr-500gb3-500w-80-bronze-power-supply-original?utm_source=google&utm_medium=organic&utm_campaign=pdp-seo'),
(14, 'Rosewill Glacier 600W', 'GLACIER-600M', 600, 'https://m.media-amazon.com/images/I/816wyTSnBLL._AC_UF1000,1000_QL80_.jpg', 1100000, 'Sumber daya modular dengan operasi yang senyap dan efisiensi yang baik.', 'https://www.tokopedia.com/ks-comp/rosewill-glacier-600m-80-plus-bronze-psu-pgs-rw-02'),
(15, 'Corsair CX Series 450 Watt 80 Plus Bronze Certified', 'CP-9020120-NA', 450, 'https://images.tokopedia.net/img/cache/700/product-1/2020/1/24/batch-upload/batch-upload_f0dbdfdb-ca9d-40ee-b377-179b5402ab3f.jpg', 900000, 'Sumber daya berbiaya rendah dengan performa yang handal dan rating efisiensi Bronze.', 'https://www.tokopedia.com/viveraos/psu-corsair-cv450-450-watt-80-plus-bronze-certified-psu?extParam=ivf%3Dfalse%26keyword%3Dpsu+corsair+450w%26search_id%3D20240621093602BB4F66F5AD4FE30C438Y%26src%3Dsearch'),
(16, 'EVGA 750 N1, 750W', '100-N1-0750-L1', 750, 'https://www.evga.com/products/images/gallery/100-N1-0750-L1_MD_1.jpg', 1300000, 'Sumber daya berbiaya rendah dengan performa yang handal untuk gaming menengah.', 'https://www.amazon.com/EVGA-Warranty-Power-Supply-100-N1-0750-L1/dp/B01LZ3WDQG'),
(17, 'Cooler Master MWE 500W 80 Plus White', 'MPX-5001-ACABW-US', 500, 'https://a.storyblok.com/f/281110/2a55d7361e/1-500w-mwe-white-230v-v2.png/m/960x0/smart', 1000000, 'Sumber daya yang terjangkau untuk build gaming dasar dan kantor.', 'https://www.amazon.com.au/Cooler-Master-White-Power-Supply/dp/B07S2SQCW7'),
(18, 'Antec VP 450 Watt Energy-Efficient Power Supply', 'VP450P', 450, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRX4rIsXbD5DcE1DVCDraQ36aIiSsqchtpNgQ&s', 850000, 'Sumber daya level entry dengan fitur dasar dan kehandalan yang baik.', 'https://www.amazon.com/Antec-Supply-Silent-Cooling-Warranty/dp/B004IZN3K2'),
(19, 'SilverStone SST-ST30SF', 'SST-ST30SF', 300, 'https://www.silverstonetek.com/upload/images/products/st30sf/st30sf-package.jpg', 700000, 'Sumber daya kompak dan efisien untuk PC form factor kecil.', 'https://www.amazon.com/SilverStone-Technology-Factor-Bronze-ST30SF-V2/dp/B01LZFMSFK'),
(20, 'be quiet! Pure Power 11 400W', 'BN287', 400, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTMsbu4kn1zrGInPjI29-_Dw8idl4ZvzKN5nw&s', 1000000, 'Sumber daya yang tenang dan hemat energi cocok untuk kantor dan multimedia.', 'https://www.amazon.com/quiet-BN292-Quiet-Power-Hardware/dp/B07JJKPNRH');

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
  `image_url` varchar(300) NOT NULL,
  `socket` varchar(20) NOT NULL,
  `core_count` int(11) NOT NULL,
  `performance_core_clock` float NOT NULL,
  `buy_url` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `processor`
--

INSERT INTO `processor` (`item_id`, `price`, `brand`, `item_name`, `power_usage`, `image_url`, `socket`, `core_count`, `performance_core_clock`, `buy_url`) VALUES
(1, 6400000, 'AMD', 'Ryzen 7 7800X3D 4.2 GHz 8-Core', 120, 'https://www.amd.com/content/dam/amd/en/images/products/processors/ryzen/2505503-ryzen-7-7800x3d.jpg', 'AM5', 8, 4.2, 'https://www.tokopedia.com/gasoldinoyo/amd-ryzen-7-7800x3d-8-core-16-thread-5-0ghz-am5-processor?extParam=ivf%3Dfalse&src=topads'),
(2, 3500000, 'Intel', 'Core i5-10400F 2.9 GHz 6-Core', 65, 'https://ae01.alicdn.com/kf/S9af29621c6a24aacb642bc4c0db23daaS/Intel-Core-i5-10400F-i5-10400F-2-9-GHz-CPU-CPU-enam-inti-dua-belas-benang.jpg', 'LGA1200', 6, 2.9, 'https://www.tokopedia.com/enterkomputer/intel-core-i5-10400f-2-9ghz-up-to-4-3ghz-cache-12mb-box-lga-1200?extParam=ivf%3Dfalse%26keyword%3Di5+10400f%26search_id%3D20240621095150FF021E6829306F1E466H%26src%3Dsearch'),
(3, 5000000, 'Intel', 'Core i7-10700K 3.8 GHz 8-Core', 95, 'https://m.media-amazon.com/images/I/61V9Yi1gHpL.jpg', 'LGA1200', 8, 3.8, 'https://www.tokopedia.com/tokoexpert/intel-core-i7-10700k-3-8ghz-up-to-5-1ghz-cache-16mb-lga-12000-gen-10?extParam=ivf%3Dfalse%26keyword%3Dintel+core+i7+10700k%26search_id%3D20240621095229BB4F66F5AD4FE332FQ7K%26src%3Dsearch'),
(4, 3000000, 'AMD', 'Ryzen 5 3600 3.6 GHz 6-Core', 65, 'https://down-id.img.susercontent.com/file/a7bc88ada7dc947e529cd9373e7f7ceb', 'AM4', 6, 3.6, 'https://tokopedia.link/BcArKxDEBKb'),
(5, 4500000, 'AMD', 'Ryzen 7 3700X 3.6 GHz 8-Core', 65, 'https://down-id.img.susercontent.com/file/207d74e53c7e95ad63188e5ac4cffb3e', 'AM4', 8, 3.6, 'https://www.tokopedia.com/redrocket/amd-ryzen-7-3700x-8-core-3-6-ghz-socket-am4'),
(6, 6000000, 'AMD', 'Ryzen 9 3900X 3.8 GHz 12-Core', 105, 'https://tpucdn.com/review/amd-ryzen-9-3900x/images/title.jpg', 'AM4', 12, 3.8, 'https://tokopedia.link/YG1NAQHEBKb'),
(7, 7000000, 'Intel', 'Core i9-10900K 3.7 GHz 10-Core', 125, 'https://i.ebayimg.com/images/g/yU4AAOSwkIRhPIND/s-l1200.webp', 'LGA1200', 10, 3.7, 'https://www.tokopedia.com/mpcsamarinda/intel-core-i9-10900k-3-7-ghz-up-to-5-1-ghz-cache-12mb-box'),
(8, 2800000, 'AMD', 'Ryzen 3 3300X 3.8 GHz 4-Core', 65, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxwUBCcF289yEvM9A6RCHnnck3Y69l9Ba6Jg&s', 'AM4', 4, 3.8, 'https://tokopedia.link/ZmicNhMEBKb'),
(9, 8000000, 'AMD', 'Ryzen 9 3950X 3.5 GHz 16-Core', 105, 'https://i.ebayimg.com/images/g/2tEAAOSwqsJiKrnO/s-l1200.webp', 'AM4', 16, 3.5, 'https://www.tokopedia.com/gcomp-1/processor-amd-ryzen-9-3950x-16-core-3-5-ghz-socket-am4?utm_source=google&utm_medium=organic&utm_campaign=pdp-seo'),
(10, 2500000, 'Intel', 'Core i3-10100 3.6 GHz 4-Core', 65, 'https://ae01.alicdn.com/kf/H9fa91e35509a462fb6cd0d2053fdeb59T.jpg_640x640Q90.jpg_.webp', 'LGA1200', 4, 3.6, 'https://tokopedia.link/hMa0wCREBKb'),
(11, 2700000, 'AMD', 'Ryzen 3 3100 3.6 GHz 4-Core', 65, 'https://tpucdn.com/review/amd-ryzen-3-3100/images/title.jpg', 'AM4', 4, 3.6, 'https://tokopedia.link/rPuFOEVEBKb'),
(12, 3700000, 'Intel', 'Core i5-10600K 4.1 GHz 6-Core', 95, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmkmGcGSTmBuDaHm3-82JC13Lj666Ire8GiA&s', 'LGA1200', 6, 4.1, 'https://www.tokopedia.com/superstorecom/processor-intel-core-i5-10600k-4-1-ghz-box-socket-1200-new-item'),
(13, 4200000, 'AMD', 'Ryzen 5 5600X 3.7 GHz 6-Core', 65, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRA95CsXcNbmedjpE78KLaT62PebTk5PrRTnA&s', 'AM4', 6, 3.7, 'https://www.tokopedia.com/gasolsumbersari/amd-ryzen-5-5600x-am4-processor?extParam=ivf%3Dfalse&src=topads'),
(14, 5200000, 'AMD', 'Ryzen 7 5800X 3.8 GHz 8-Core', 105, 'https://ae01.alicdn.com/kf/Hd99d8a7a49db477fae4191f08a16c2a2D/AMD-Ryzen-7-5800X-R7-5800X-3-8-GHz-prosesor-CPU-105W-delapan-core-sixteen-Thread.png', 'AM4', 8, 3.8, 'https://www.tokopedia.com/pcrakitanofficial/amd-processor-ryzen-7-5800x-8-cores-3-8ghz-up-to-4-7ghz?extParam=ivf%3Dfalse%26keyword%3Damd+ryzen+7+5800x%26search_id%3D20240621095919CDC64160AC8B80131GE7%26src%3Dsearch'),
(15, 7700000, 'AMD', 'Ryzen 9 5900X 3.7 GHz 12-Core', 105, 'https://www.techspot.com/images2/news/bigimage/2020/11/2020-11-05-image-51.jpg', 'AM4', 12, 3.7, 'https://www.tokopedia.com/oneitsolution/processor-amd-ryzen-9-5900x-3-7ghz-upto-4-8ghz-12c-24t?utm_source=google&utm_medium=organic&utm_campaign=pdp-seo'),
(16, 9200000, 'AMD', 'Ryzen 9 5950X 3.4 GHz 16-Core', 105, 'https://image.made-in-china.com/202f0j00JmBVlgDnkQkb/AMD-Ryzen-9-5950X-R9-5950X-3-4-GHz-16-Cores-32-Threads-CPU-Processor-7nm-L3-64m-100-000000059-Socket-Am44-Orders.webp', 'AM4', 16, 3.4, 'https://www.tokopedia.com/sentosasolusindo/amd-ryzen-9-5950x-16-core-3-4-ghz-turbo-4-9ghz-socket-am4-105w-zen3?extParam=ivf%3Dfalse%26keyword%3Damd+ryzen+9+5950x%26search_id%3D20240621100052C68B62B16527791A6IH4%26src%3Dsearch'),
(17, 6200000, 'Intel', 'Core i7-11700K 3.6 GHz 8-Core', 125, 'https://tpucdn.com/cpu-specs/images/chips/2367-front.jpg', 'LGA1200', 8, 3.6, 'https://tokopedia.link/Lmy38DfFBKb'),
(18, 8000000, 'Intel', 'Core i9-11900K 3.5 GHz 8-Core', 125, 'https://ae01.alicdn.com/kf/S0fd3bfba9673415aab69f35a7846a9c7I.jpg_640x640Q90.jpg_.webp', 'LGA1200', 8, 3.5, 'https://www.tokopedia.com/asiatechsolusind/intel-core-i9-11900k-processor-16m-cache-up-to-5-30-ghz'),
(19, 2900000, 'Intel', 'Core i5-10400 2.9 GHz 6-Core', 65, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZfus93PV3zBJS1GLpXUpsgRZRAWTTT0deYg&s', 'LGA1200', 6, 2.9, 'https://www.tokopedia.com/weycomputer/intel-core-i5-10400-2-9ghz-6-core-12-thread-gen10-comet-lake-lga-1200?extParam=ivf%3Dfalse%26keyword%3Dintel+core+i5+10400%26search_id%3D202406211003280AA6CC0F5494A00DFU40%26src%3Dsearch'),
(20, 3900000, 'Intel', 'Core i5-11400 2.6 GHz 6-Core', 65, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSFYTa5tjUNet921ZMRJ-WAUvg1yVRQ2I23tg&s', 'LGA1200', 6, 2.6, 'https://www.tokopedia.com/centraldatacom/processor-intel-core-i5-11400-box-socket-lga1200?extParam=ivf%3Dfalse%26keyword%3Dintel+core+i5+11400%26search_id%3D202406211005012593B43047429D2BA1AZ%26src%3Dsearch'),
(21, 3400000, 'AMD', 'Ryzen 5 2600 3.4 GHz 6-Core', 65, 'https://images.tokopedia.net/img/cache/700/VqbcmM/2021/8/27/22dcd2b4-a8f8-42c9-b4c3-6a277f8fc220.jpg', 'AM4', 6, 3.4, 'https://www.tokopedia.com/archive-carisacada/processor-amd-ryzen-5-2600-6-core-3-4-ghz-socket-am4-pinnacle-ridge?extParam=ivf%3Dfalse%26keyword%3Damd+ryzen+5+2600%26search_id%3D2024062110055714E044CA7E2FE0112KXK%26src%3Dsearch'),
(22, 5700000, 'AMD', 'Ryzen 7 2700X 3.7 GHz 8-Core', 105, 'https://i.pcmag.com/imagery/reviews/03C5q44hBOvTvVqJFrfjjpT-31.fit_scale.size_760x427.v1569478869.jpg', 'AM4', 8, 3.7, 'https://www.tokopedia.com/chandut/amd-ryzen-7-2700x-box-3-7ghz-up-to-4-35ghz-socket-am4?extParam=ivf%3Dfalse%26keyword%3Dryzen+7+2700x%26search_id%3D20240621100941BB4F66F5AD4FE301F2EN%26src%3Dsearch');

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
  `type` varchar(20) NOT NULL,
  `power_usage` int(11) NOT NULL,
  `image_url` varchar(300) NOT NULL,
  `buy_url` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ram`
--

INSERT INTO `ram` (`item_id`, `price`, `brand`, `item_name`, `size`, `module`, `type`, `power_usage`, `image_url`, `buy_url`) VALUES
(1, 1850000, 'Corsair', 'Vengeance 32 GB', 16, 2, 'DDR4', 15, 'https://images.tokopedia.net/img/cache/700/VqbcmM/2021/8/15/866b5733-707c-421f-bdf4-2af6f9fef2be.jpg', 'https://www.tokopedia.com/gamersoutpost/corsair-vengeance-32gb-2x16gb-ddr5-dram-5200mhz-c40-memory-putih?extParam=ivf%3Dfalse&src=topads'),
(2, 2500000, 'G.Skill', 'Ripjaws V 16 GB', 8, 2, 'DDR4', 15, 'https://images.tokopedia.net/img/cache/700/VqbcmM/2021/11/11/cfb86031-63d3-4383-813d-f5ba48e873e3.jpg', 'https://www.tokopedia.com/starseventeen/gskill-ripjaws-v-ddr4-16gb-2x8gb-3600mhz-dual-channel?extParam=ivf%3Dfalse%26keyword%3Dripjaws+v+16gb%26search_id%3D20240621101101BB4F66F5AD4FE307B46H%26src%3Dsearch'),
(3, 3700000, 'Corsair', 'Vengeance LPX 32 GB', 16, 2, 'DDR4', 15, 'https://images.tokopedia.net/img/cache/700/VqbcmM/2021/8/15/518a07f4-ec9e-41f8-89ab-d2fbbe1f5857.jpg', 'https://www.tokopedia.com/gamersoutpost/corsair-vengeance-lpx-32gb-2x16gb-ddr4-3600mhz-cmk32gx4m2d3600c18?extParam=ivf%3Dfalse&src=topads'),
(4, 4500000, 'Kingston', 'HyperX Fury 16 GB', 8, 2, 'DDR4', 15, 'https://images.tokopedia.net/img/cache/700/VqbcmM/2021/2/25/f6f8d4c4-7f12-4795-9a9e-a85deac3af76.jpg', 'https://www.tokopedia.com/it-shoponline/kingston-memory-module-long-dimm-hyperx-furry-16gb-8x2-ddr4-3200-mhz?extParam=ivf%3Dfalse%26whid%3D12666244&src=topads'),
(5, 5200000, 'Crucial', 'Ballistix Sport LT 32 GB', 16, 2, 'DDR4', 15, 'https://www.memoryc.com/images/products/bb/xxe_41969.jpg', 'https://www.tokopedia.com/archive-happy-com/crucial-ballistix-sport-lt-ddr4-32gb-2x16gb-kit-2666mhz-red?extParam=ivf%3Dfalse%26keyword%3Dballistix+sport+lt+32+gb%26search_id%3D2024062110153877D24402E2AC5204EN64%26src%3Dsearch'),
(6, 6100000, 'G.Skill', 'Trident Z RGB 32 GB', 16, 2, 'DDR4', 15, 'https://images.tokopedia.net/img/cache/700/product-1/2018/11/10/5196009/5196009_b496f02a-58b8-4f29-b11b-9c7ddb51b862_1280_960.jpg', 'https://www.tokopedia.com/farayaonlineshop/gskill-trident-z-rgb-32gb-2x16gb-ddr4-f4-3600c18d-32gtzr-tridentz?extParam=ivf%3Dfalse&src=topads'),
(7, 4700000, 'Corsair', 'Vengeance RGB Pro 16 GB', 8, 2, 'DDR4', 15, 'https://images.tokopedia.net/img/cache/700/product-1/2018/7/10/9126088/9126088_5b79f2ab-6e8f-4858-b394-e99ea646d973_700_448.png', 'https://www.tokopedia.com/gamersoutpost/corsair-ram-vengeance-rgb-pro-sl-16gb-2x8gb-3600mhz-cmh16gx4m2d3600c18-hitam?extParam=ivf%3Dfalse&src=topads'),
(8, 5400000, 'Kingston', 'FURY Beast 16 GB', 8, 2, 'DDR4', 15, 'https://images.tokopedia.net/img/cache/500-square/VqbcmM/2021/11/3/f90eecad-2b13-43fb-aecc-ab9366cd6d93.jpg', 'https://www.tokopedia.com/kingstonofficial/kingston-fury-beast-seri-tangguh-rgb-16gb-ddr5-5200mhz-cl40-8gbx2?extParam=ivf%3Dfalse&src=topads'),
(9, 3300000, 'Team', 'T-Force Vulcan Z 16 GB', 8, 2, 'DDR4', 15, 'https://images.teamgroupinc.com/products/memory/u-dimm/ddr4/vulcan-z/gray/dual_01.jpg', 'https://www.tokopedia.com/tokoexpert/team-t-force-vulcan-z-ddr4-16gb-2x8gb-3200mhz-dual-channel?extParam=ivf%3Dfalse%26keyword%3Dt-force+vulcan+z+16+gb%26search_id%3D20240621101649BB4F66F5AD4FE3164SVJ%26src%3Dsearch'),
(10, 4100000, 'ADATA', 'XPG Z1 16 GB', 8, 2, 'DDR4', 15, 'https://images.tokopedia.net/img/cache/700/hDjmkQ/2022/7/31/8b522262-a000-47c3-87ce-c8ce656466fe.jpg', 'https://www.tokopedia.com/kalisandara/100-original-adata-xpg-z1-ddr4-8gb-16gb-3200mhz-desktop-memory-ram?extParam=ivf%3Dfalse%26keyword%3Dxpg+z1+16+gb%26search_id%3D202406211017202593B43047429D2E4WAS%26src%3Dsearch'),
(11, 2900000, 'G.Skill', 'Aegis 16 GB', 8, 2, 'DDR4', 15, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRY8hUp4vCQk5s-gwSfIk8Z_xDF3bfgP7VGA&s', 'https://www.tokopedia.com/tokomacro/ram-gskill-aegis-ddr4-16gb-2x8gb-pc2400-f4-2400c17d-16gis?extParam=ivf%3Dfalse%26keyword%3Daegis+16+gb%26search_id%3D20240621101745BB4F66F5AD4FE3185BOG%26src%3Dsearch&refined=true'),
(12, 5000000, 'Patriot', 'Viper 4 16 GB', 8, 2, 'DDR4', 15, 'https://cdn.mos.cms.futurecdn.net/i4ML4ZTkmGgiWxokbRXVG3.jpg', 'https://www.tokopedia.com/gapcom/ram-patriot-viper-4-blackout-ddr4-8gb-16gb-3000-3200-3600mhz-dual-kit-8gb-3000mhz-41fa5?extParam=ivf%3Dfalse%26keyword%3Dviper+4+16+gb%26search_id%3D20240621101811CDC64160AC8B80053MCB%26src%3Dsearch'),
(13, 2700000, 'Corsair', 'Vengeance 16 GB', 8, 2, 'DDR4', 15, 'https://images.tokopedia.net/img/cache/700/VqbcmM/2021/8/15/507e82f6-38db-4775-bdf6-b7770f4fcabe.jpg', 'https://www.tokopedia.com/omegapremium/corsair-ram-vengeance-lpx-16gb-8x2-ddr4-3200mhz-putih-665f8?extParam=ivf%3Dfalse&src=topads'),
(14, 3500000, 'Crucial', 'Ballistix 16 GB', 8, 2, 'DDR4', 15, 'https://images.tokopedia.net/img/cache/700/product-1/2018/4/1/0/0_c79797ff-ffeb-4f45-93d3-deee0171501f_700_366.jpg', 'https://www.tokopedia.com/tokomacro/ram-crucial-ballistix-sport-ddr4-16gb-kit-2x8gb-pc-2666?extParam=ivf%3Dfalse%26keyword%3Dballistix+16+gb%26search_id%3D20240621101859F3CBE875A142860E2UF4%26src%3Dsearch'),
(15, 3800000, 'G.Skill', 'Ripjaws V 32 GB', 16, 2, 'DDR4', 15, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTztt6YR0aFUXU3vQAzSwRGCYVrn4feOIVtQ&s', 'https://www.tokopedia.com/d-m-i/gskill-ripjaws-v-f4-2666c15d-32gvr-32gb-2x16gb-ddr4?extParam=ivf%3Dfalse%26keyword%3Dripjaws+v+32+gb%26search_id%3D202406211019220AA6CC0F5494A03CFUCB%26src%3Dsearch'),
(16, 6000000, 'Corsair', 'Vengeance LPX 64 GB', 16, 4, 'DDR4', 30, 'https://images.tokopedia.net/img/cache/700/VqbcmM/2021/8/31/c1601b79-9112-48dc-820c-f522fc68643c.jpg', 'https://www.tokopedia.com/gamersoutpost/corsair-vengeance-lpx-64gb-2x32gb-ddr4-3600mhz-cmk64gx4m2d3600c18?extParam=ivf%3Dfalse&src=topads'),
(17, 4500000, 'Kingston', 'HyperX Fury 32 GB', 16, 2, 'DDR4', 15, 'https://images.tokopedia.net/img/cache/700/VqbcmM/2022/4/23/f5beb4ce-b047-4556-b860-0051f94b3205.jpg', 'https://www.tokopedia.com/denlapakbakulan/seri-lama-langka-kingston-hyperx-fury-black-32gb-2x16gb-3200mhz-ddr4?extParam=ivf%3Dfalse%26keyword%3Dhyperx+fury+32+gb%26search_id%3D202406211019590AA6CC0F5494A03C3ZNV%26src%3Dsearch'),
(18, 5200000, 'Crucial', 'Ballistix Sport LT 16 GB', 8, 2, 'DDR4', 15, 'https://images.tokopedia.net/img/cache/700/product-1/2020/6/24/batch-upload/batch-upload_530aa6d4-332a-4513-9fab-98126469d6e7.jpg', 'https://www.tokopedia.com/distributorpc/crucisl-ballistix-sport-lt-red-16gb-kit-2-x-8gb-ddr4-2666-udimm?extParam=ivf%3Dfalse%26keyword%3Dballistix+sport+lt+16+gb%26search_id%3D202406211020190AA6CC0F5494A035B8T3%26src%3Dsearch'),
(19, 6100000, 'G.Skill', 'Trident Z RGB 64 GB', 16, 4, 'DDR4', 30, 'https://images.tokopedia.net/img/cache/700/VqbcmM/2021/4/1/824323d2-4a3c-48ea-bf07-f6168d086390.png', 'https://www.tokopedia.com/imbapc/g-skill-trident-z-rgb-64gb-2x32-ddr4-3600mhz-ram-trident-z-64gb?extParam=ivf%3Dfalse%26keyword%3Dtrident+z+rgb+64+gb%26search_id%3D20240621102032C68B62B1652779110Q8K%26src%3Dsearch'),
(20, 4700000, 'Corsair', 'Vengeance RGB Pro 32 GB', 16, 2, 'DDR4', 15, 'https://images.tokopedia.net/img/cache/700/product-1/2018/7/10/9126088/9126088_5b79f2ab-6e8f-4858-b394-e99ea646d973_700_448.png', 'https://www.tokopedia.com/gamersoutpost/corsair-ram-vengeance-rgb-pro-sl-32gb-2x16gb-3200mh-cmh32gx4m2z3200c16?extParam=ivf%3Dfalse&src=topads'),
(21, 5400000, 'Kingston', 'FURY Beast 32 GB', 16, 2, 'DDR4', 15, 'https://m.media-amazon.com/images/I/61uXihcspuL._AC_UF894,1000_QL80_.jpg', 'https://www.tokopedia.com/kingstonofficial/kingston-fury-beast-rgb-seri-tangguh-32gb-ddr5-5200mhz-cl40-16gbx2-putih?extParam=ivf%3Dfalse&src=topads'),
(22, 3300000, 'Team', 'T-Force Vulcan Z 32 GB', 16, 2, 'DDR4', 15, 'https://images.tokopedia.net/img/cache/700/VqbcmM/2022/10/19/aa03b8e7-ef7e-42b8-923f-fbf3c41b3e69.jpg', 'https://www.tokopedia.com/tokoexpert/team-t-force-vulcan-z-ddr4-32gb-2x16gb-3200mhz-dual-channel?extParam=ivf%3Dfalse%26keyword%3Dt-force+vulcan+z+32+gb%26search_id%3D2024062110212314E044CA7E2FE0104TIM%26src%3Dsearch');

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
(5, 'kelasb', 'kelasb@gmail.com', '054e3b308708370ea029dc2ebd1646c498d59d7203c9e1a44cf0484df98e581a', 'Member'),
(7, 'Alfazi', 'zidanealfatih14@gmail.com', 'c70d47cf241e0004847b515aa069219004ecc987859d443d9d8c7507f1f3f86c', 'Member'),
(8, 'joko', 'zidanealfatih@yahoo.com', 'dd05b4f47074fdd20fcf4db9861f4453fe9543798d913d432e9f2886ff9649dd', 'Member'),
(9, '111', '111', 'ee79976c9380d5e337fc1c095ece8c8f22f91f306ceeb161fa51fecede2c4ba1', 'Member'),
(10, 'gwgeming', 'akbar123', 'ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f', 'Member'),
(12, 'Rafie1715', 'rafie@gmail.com', 'ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f', 'Member');

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
-- Indexes for table `cases`
--
ALTER TABLE `cases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `posts_ibfk_2` (`build_id`);

--
-- Indexes for table `powersupply`
--
ALTER TABLE `powersupply`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `build_component`
--
ALTER TABLE `build_component`
  MODIFY `build_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cases`
--
ALTER TABLE `cases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `powersupply`
--
ALTER TABLE `powersupply`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `userdata`
--
ALTER TABLE `userdata`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `userdata` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`build_id`) REFERENCES `build_component` (`build_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
