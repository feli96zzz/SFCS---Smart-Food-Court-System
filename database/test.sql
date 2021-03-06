-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 23, 2019 at 07:53 PM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerece`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getcat` (IN `cid` INT)  SELECT * FROM categories WHERE cat_id=cid$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin_info`
--

CREATE TABLE `admin_info` (
  `admin_id` int(10) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `admin_email` varchar(300) NOT NULL,
  `admin_password` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_info`
--

INSERT INTO `admin_info` (`admin_id`, `admin_name`, `admin_email`, `admin_password`) VALUES
(1, 'admin', 'admin@gmail.com', '25f9e794323b453885f5181f1b624d0b');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(100) NOT NULL,
  `brand_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_title`) VALUES
(1, 'Pho Hung'),
(2, 'Local brand'),
(3, 'Hai Nam'),
(4, 'McDonald'),
(5, 'PewPew'),
(6, 'Cloth Brand'),
(7, 'SnackHack'),
(8, 'Co Ba'),
(9, 'Hamoud Boualem'),
(10, 'Mel Coffee Roasters');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(250) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `p_id`, `ip_add`, `user_id`, `qty`) VALUES
(6, 26, '::1', 4, 1),
(9, 10, '::1', 7, 1),
(10, 11, '::1', 7, 1),
(11, 45, '::1', 7, 1),
(44, 5, '::1', 3, 0),
(46, 2, '::1', 3, 0),
(48, 72, '::1', 3, 0),
(49, 60, '::1', 8, 1),
(50, 61, '::1', 8, 1),
(51, 1, '::1', 8, 1),
(52, 5, '::1', 9, 1),
(53, 2, '::1', 14, 1),
(54, 3, '::1', 14, 1),
(55, 5, '::1', 14, 1),
(56, 1, '::1', 9, 1),
(57, 2, '::1', 9, 1),
(71, 61, '127.0.0.1', -1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(100) NOT NULL,
  `cat_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(1, 'Noodles'),
(2, 'Soup'),
(3, 'Rice'),
(4, 'Fast foods'),
(5, 'Beverages'),
(6, 'Snacks');

-- --------------------------------------------------------

--
-- Table structure for table `email_info`
--

CREATE TABLE `email_info` (
  `email_id` int(100) NOT NULL,
  `email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `email_info`
--

INSERT INTO `email_info` (`email_id`, `email`) VALUES
(3, 'admin@gmail.com'),
(4, 'puneethreddy951@gmail.com'),
(5, 'puneethreddy@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `trx_id` varchar(255) NOT NULL,
  `p_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `product_id`, `qty`, `trx_id`, `p_status`) VALUES
(1, 12, 7, 1, '07M47684BS5725041', 'Completed'),
(2, 14, 2, 1, '07M47684BS5725041', 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `orders_info`
--

CREATE TABLE `orders_info` (
  `order_id` int(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  `payment` varchar(20) NOT NULL,
  `time` DATE NOT NULL,
  `prod_count` int(15) DEFAULT NULL,
  `total_amt` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders_info`
--

INSERT INTO `orders_info`	(`order_id`,`user_id`,`payment`, `time`,`prod_count`,`total_amt`)  VALUES
(1, 12, 'PaymentAccount', '2020-01-01', 3, 77000);


--
-- Dumping data for table `orders_info`
--

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

CREATE TABLE `order_products` (
  `order_pro_id` int(10) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(15) DEFAULT NULL,
  `amt` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_products`
--

INSERT INTO `order_products` (`order_pro_id`, `order_id`, `product_id`, `qty`, `amt`) VALUES
(73, 1, 1, 1, 5000),
(74, 1, 4, 2, 64000),
(75, 1, 8, 1, 40000);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(100) NOT NULL,
  `product_cat` int(100) NOT NULL,
  `product_brand` int(100) NOT NULL,
  `product_title` nvarchar(255) NOT NULL,
  `product_price` int(100) NOT NULL,
  `product_desc` text NOT NULL,
  `product_image` text NOT NULL,
  `product_keywords` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_cat`, `product_brand`, `product_title`, `product_price`, `product_desc`, `product_image`, `product_keywords`) VALUES
(1, 1, 2, N'Mì thêm (Extra noodles)', 5000, 'It\'s just a piece of noodles', 'noodles_block.jpg', 'noodles block'),
(2, 1, 2, N'Mì nước (Wet noodles)', 25000, 'The basic type of noodles, is guaranteed to burn your pocket', 'wet_noodles.jpg', 'basic noodles'),
(3, 1, 2, N'Mì thượng hạng (Noodles Pro Max)', 560000, 'The supreme dish, will cost you a fortune', 'noodles_pro_max.jpg', 'pro max'),
(4, 1, 2, N'Mì Quảng (Quang noodles)', 32000, 'The title says it all', 'quang_noodles.jpg', 'mi quang'),
(5, 1, 1, N'Phở bò (Beef Pho)', 10000, 'One of the best-selling foods in the court', 'pho.jpg', 'pho bo'),
(6, 1, 1, N'Phở gà (Chicken meat Pho)', 35000, 'Same as Beef Pho, but it\'s chicken', 'phoga.jpg', 'pho ga'),
(7, 1, 2, N'Bún đậu mắm tôm (Vermicelli with tofu and shrimp paste)', 50000, 'It\'s not recommended to eat this', 'Vermicelli.jpg', 'Bun dau mam tom'),
(8, 1, 2, N'Hủ tiếu sa tế (Satay noodles)', 40000, 'A dish that\'s refined with lots of satay and will ensure your next dump will be lunatic', 'satay.jpg', 'Hu tieu sa te'),
(9, 1, 1, N'Nước sôi (Boiled water)', 12000, 'It\'s not classified as noodles but we\'ll keep it here anyway', 'boiledwater.jpg', 'nuoc soi'),
(10, 2, 2, N'Canh cà chua (Ketchup soup)', 1000, 'It\'s red, appreciate it', 'ketchupsoup.jpg', 'canh ca chua'),
(11, 2, 2, N'Canh hẹ (Chives soup)', 1200, 'Our court\'s highly rated dish', 'chives.jpg', 'canh he'),
(12, 2, 2, N'Canh khoai tây (Potato soup)', 1500, 'So nutritious you won\'t need to order twice', 'potatosoup.jpg', 'canh khoai tay'),
(13, 2, 2, N'Canh khoai sọ (Taro soup)', 1200, 'Colocasia esculenta to be specific', 'tarosoup.jpg', 'canh khoai so'),
(14, 2, 2, N'Súp cua (Crab soup)', 1400, 'It\'s not as disgusting as it may sound', 'crabsoup.jpg', 'sup cua'),
(15, 2, 2, N'Súp tóc tiên (Black moss soup)', 1500, 'It\'s black', 'blackmosssoup.jpg', 'sup toc tien'),

(16, 3, 3, 'Com ga hai nam', 35000, 'products_desc', 'com_gahainam.jpg', 'com_ga'),
(17, 3, 3, 'Com ga xoi mo', 30000, 'products_desc', 'com_gaxoimo.jpg', 'com_ga'),
(18, 3, 3, 'Com ca loc kho to', 30000, 'products_desc', 'com_calockhoto.jpg', 'com_ca'),
(19, 3, 3, 'Com bo', 35000, 'products_desc', 'com_bo.jpg', 'com_bo'),
(20, 3, 3, 'Com suon', 35000, 'products_desc', 'com_suon.jpg', 'com_suon '),
(21, 3, 3, 'Com vit', 800, 'ssds', 'com_vit.jpg', 'com_vit'),
(22, 3, 3, 'Com chien duong chau', 30000, 'ad', 'com-chien-duong-chau.jpg', 'com_chien'),
(23, 3, 3, 'Com xa xiu', 30000, 'sadsf', 'com_ga_xa_xiu.jpg', 'com_xa_xiu'),
(24, 3, 3, 'Com thit kho', 25000, 'g', 'com_thit_kho.jpg', 'com_thit_kho'),

(25, 4, 4, 'Breakfast Egg McMuffin', 25000, 'as', 'Breakfast-Egg-McMuffin.jpg', 'Breakfast'),
(26, 4, 4, 'Breakfast-Sausage-Burrito.jpg', 30000, 'ad', 'Breakfast-Sausage-Burrito.jpg', 'Breakfast'),
(27, 4, 4, 'breakfast-Sausage-Egg-Cheese-McGriddles.jpg', 25000, 'sd', 'breakfast-Sausage-Egg-Cheese-McGriddles.jpg', 'Breakfast'),
(28, 4, 4, 'Burger-Big-Mac.jpg', 20000, 'yello t shirt with pant', 'Burger-Big-Mac.jpg', 'burger'),
(29, 4, 4, 'Burger-Quarter-Pounder-with-Cheese', 30000, 'ad', 'Burger-Quarter-Pounder-with-Cheese.jpg', 'burger'),
(30, 4, 4, 'combo-fries-small', 20000, 'ad', 'combo-fries-small.jpg', 'fries'),
(31, 4, 4, 'Sandwich-Artisan-Grilled-Chicken-Sandwich', 30000, 'ad', 'Sandwich-Artisan-Grilled-Chicken-Sandwich.jpg', 'sandwich'),
(32, 4, 4, 'Sandwich-Filet-O-Fish', 30000, 'ad', 'Sandwich-Filet-O-Fish.jpg', 'sandwich'),
(33, 4, 5, 'bong-lan-trung-muoi-600x400', 30000, 'ad', 'bong-lan-trung-muoi-600x400.jpg', 'Banh'),
(34, 4, 5, 'Banh mi', 15000, 'ad', 'banh-mi.jpg', 'Banh mi'),
(35, 4, 5, 'Sandwich', 15000, 'ad', 'sandwich.png', 'Banh'),

(36, 5, 10, 'Hot Chocolate', 25000, 'hot chocolate', 'homemade-hot-chocolate-15-56a8bdfe5f9b58b7d0f4bbe2.jpg', 'hot chocolate beverages'),
(37, 5, 10, 'Coffee', 20000, 'coffee', 'flat-white.jpg', 'coffee beverages'),
(38, 5, 10, 'Espresso', 25000, 'espresso', 'espresso.jpg', 'espresso beverages'),
(39, 5, 10, 'Tea', 15000, 'tea', 'Drink-Ceylon-Tea.jpg', 'tea beverages'),
(40, 5, 9, 'Bottled Water', 7000, 'Bottled Water', 'HOME-1L-Filling-3x-500ml_wide-800x500.jpg', 'Bottled Water beverages'),
(41, 5, 9, 'Coca-Cola', 8000, 'Coca-Cola', 'coca_cola_loc_6_lon_cao.jpg', 'Coca-Cola beverages'),
(42, 5, 10, 'Orange Juice', 15000, 'Juice', '8297195-orange-juice-and-slices-of-orange-isolated-on-white.jpg', 'Orange Juice beverages'),
(43, 5, 10, 'Lemonade', 12000, 'Lemonade', 'honey-lemonade-2-650x975.jpg', 'Lemonade beverages'),
(44, 5, 9, 'Milk', 10000, 'Milk', 'Cashew-Milk-4.jpg', 'Milk beverages'),
(45, 6, 7, 'M&M\'s', 5000, 'M&M', 'mms.jpg', 'M&M Snacks'),
(46, 6, 7, 'Hershey\'s', 7000, 'Hershey\'s', 'hersheys-candy-bar-wrapped.jpg', 'Hershey Snacks'),
(47, 6, 7, 'Kit Kat', 8000, 'Kit Kat', 'kit-kat-bar-wrapped.jpg', 'Kit Kat Snacks'),
(48, 6, 7, 'Lay\'s Chips', 6000, 'Lay Chips', 'lays-classic.jpg', 'Lay Chips Snacks'),
(49, 6, 7, 'Doritos', 7000, 'Doritos', 'cool-ranch-doritos.jpg', 'Doritos Snacks'),
(50, 6, 7, 'Cheerios', 15000, 'Cheerios', 'cheerios.jpg', 'Cheerios Snacks'),
(51, 6, 7, 'Fritos', 7000, 'Fritos', 'fritos.jpg', 'Fritos Snacks'),
(52, 6, 7, 'Cheetos', 8000, 'Cheetos', 'Small-bag-of-cheetos.jpg', 'Cheetos Snacks'),
(53, 6, 7, 'Cheez-It', 7000, 'Cheez-It', 'cheez-it-original.jpg', 'Cheez-It Snacks'),
(54, 6, 8, 'Goi Cuon (Summer Rolls)', 12000, 'Summer Rolls', 'vietnamese-snacks-goi-cuon.jpg', 'Summer Rolls Viet Snacks'),
(55, 6, 8, 'Banh Gio (Pyramidal Rice Dumpling)', 10000, 'Pyramidal Rice Dumpling', 'vietnamese-snacks-banh-gio.jpg', 'Pyramidal Rice Dumpling Viet Snacks'),
(56, 6, 8, 'Tao Pho (Sweet Tofu)', 8000, 'Sweet Tofu', 'vietnamese-snacks-tao-pho.jpg', 'Sweet Tofu Viet Snacks'),
(57, 6, 8, 'Banh Trang Tron (Mixed Rice Paper)', 10000, 'Mixed Rice Paper', 'vietnamese-snacks-banh-trang-tron.jpg', 'Mixed Rice Paper Viet Snacks'),
(58, 6, 8, 'Xoai Lac (Shaking Mango)', 15000, 'Shaking Mango', 'vietnamese-snacks-xoai-lac.jpg', 'Shaking Mango Viet Snacks'),
(59, 6, 8, 'Trai Cay Dam (Macerated Fruits)', 20000, 'Macerated Fruits', 'vietnamese-snacks-trai-cay-dam.jpg', 'Macerated Fruits Viet Snacks');

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL,
  `balance` INT DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(12, 'puneeth', 'Reddy', 'puneethreddy951@gmail.com', 'puneeth', '9448121558', '123456789', 'sdcjns,djc'),
(15, 'hemu', 'ajhgdg', 'puneethreddy951@gmail.com', '346778', '536487276', ',mdnbca', 'asdmhmhvbv'),
(16, 'venky', 'vs', 'venkey@gmail.com', '1234534', '9877654334', 'snhdgvajfehyfygv', 'asdjbhfkeur'),
(19, 'abhishek', 'bs', 'abhishekbs@gmail.com', 'asdcsdcc', '9871236534', 'bangalore', 'hassan'),
(21, 'prajval', 'mcta', 'prajvalmcta@gmail.com', '1234545662', '202-555-01', 'bangalore', 'kumbalagodu'),
(22, 'puneeth', 'v', 'hemu@gmail.com', '1234534', '9877654334', 'snhdgvajfehyfygv', 'asdjbhfkeur'),
(23, 'hemanth', 'reddy', 'hemanth@gmail.com', 'Puneeth@123', '9876543234', 'Bangalore', 'Kumbalagodu'),
(24, 'newuser', 'user', 'newuser@gmail.com', 'puneeth@123', '9535688928', 'Bangalore', 'Kumbalagodu'),
(25, 'otheruser', 'user', 'otheruser@gmail.com', 'puneeth@123', '9535688928', 'Bangalore', 'Kumbalagodu');

--
-- Triggers `user_info`
--
DELIMITER $$
CREATE TRIGGER `after_user_info_insert` AFTER INSERT ON `user_info` FOR EACH ROW BEGIN 
INSERT INTO user_info_backup VALUES(new.user_id,new.first_name,new.last_name,new.email,new.password,new.mobile,new.address1,new.address2);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user_info_backup`
--

CREATE TABLE `user_info_backup` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_info_backup`
--

INSERT INTO `user_info_backup` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(12, 'puneeth', 'Reddy', 'puneethreddy951@gmail.com', '123456789', '9448121558', '123456789', 'sdcjns,djc'),
(14, 'hemanthu', 'reddy', 'hemanthreddy951@gmail.com', '123456788', '6526436723', 's,dc wfjvnvn', 'b efhfhvvbr'),
(15, 'hemu', 'ajhgdg', 'keeru@gmail.com', '346778', '536487276', ',mdnbca', 'asdmhmhvbv'),
(16, 'venky', 'vs', 'venkey@gmail.com', '1234534', '9877654334', 'snhdgvajfehyfygv', 'asdjbhfkeur'),
(19, 'abhishek', 'bs', 'abhishekbs@gmail.com', 'asdcsdcc', '9871236534', 'bangalore', 'hassan'),
(20, 'pramod', 'vh', 'pramod@gmail.com', '124335353', '9767645653', 'ksbdfcdf', 'sjrgrevgsib'),
(21, 'prajval', 'mcta', 'prajvalmcta@gmail.com', '1234545662', '202-555-01', 'bangalore', 'kumbalagodu'),
(22, 'puneeth', 'v', 'hemu@gmail.com', '1234534', '9877654334', 'snhdgvajfehyfygv', 'asdjbhfkeur'),
(23, 'hemanth', 'reddy', 'hemanth@gmail.com', 'Puneeth@123', '9876543234', 'Bangalore', 'Kumbalagodu'),
(24, 'newuser', 'user', 'newuser@gmail.com', 'puneeth@123', '9535688928', 'Bangalore', 'Kumbalagodu'),
(25, 'otheruser', 'user', 'otheruser@gmail.com', 'puneeth@123', '9535688928', 'Bangalore', 'Kumbalagodu');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_info`
--
ALTER TABLE `admin_info`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `email_info`
--
ALTER TABLE `email_info`
  ADD PRIMARY KEY (`email_id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `orders_info`
--
ALTER TABLE `orders_info`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`order_pro_id`),
  ADD KEY `order_products` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_info_backup`
--
ALTER TABLE `user_info_backup`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_info`
--
ALTER TABLE `admin_info`
  MODIFY `admin_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=147;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `email_info`
--
ALTER TABLE `email_info`
  MODIFY `email_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders_info`
--
ALTER TABLE `orders_info`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `order_products`
--
ALTER TABLE `order_products`
  MODIFY `order_pro_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `user_info_backup`
--
ALTER TABLE `user_info_backup`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders_info`
--
ALTER TABLE `orders_info`
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`);

--
-- Constraints for table `order_products`
--
ALTER TABLE `order_products`
  ADD CONSTRAINT `order_products` FOREIGN KEY (`order_id`) REFERENCES `orders_info` (`order_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;