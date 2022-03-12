-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 12, 2022 at 01:06 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `de15_cr9_famazon_sanjakostantinovic`
--
CREATE DATABASE IF NOT EXISTS `de15_cr9_famazon_sanjakostantinovic` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `de15_cr9_famazon_sanjakostantinovic`;

-- --------------------------------------------------------

--
-- Table structure for table `bank`
--

CREATE TABLE `bank` (
  `Bank_id` int(11) NOT NULL,
  `BankName` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bank`
--

INSERT INTO `bank` (`Bank_id`, `BankName`) VALUES
(1, 'Raiffeisen'),
(2, 'Erste'),
(3, 'Austria'),
(4, 'Bawag');

-- --------------------------------------------------------

--
-- Table structure for table `companie`
--

CREATE TABLE `companie` (
  `Companie_id` int(11) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `Telephone` int(11) NOT NULL,
  `fk_location_id` int(11) DEFAULT NULL,
  `fk_bankN_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `companie`
--

INSERT INTO `companie` (`Companie_id`, `Name`, `Email`, `Telephone`, `fk_location_id`, `fk_bankN_id`) VALUES
(1, 'Ric', 'ric.firme@gmail.com', 6601234, 1, 3),
(2, 'Bic', 'bic.firme@gmail.com', 6601254, 6, 1),
(3, 'Bucher', 'bucher.firme@gmail.com', 6601235, 6, 2),
(4, 'Tischler', 'tischler.firme@gmail.com', 6601255, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `Customer_id` int(11) NOT NULL,
  `lName` varchar(30) NOT NULL,
  `fName` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `regular` enum('yes','no') DEFAULT 'yes',
  `Apassword` varchar(30) NOT NULL,
  `fk_order_id` int(11) DEFAULT NULL,
  `fk_location_id` int(11) DEFAULT NULL,
  `fk_transaction_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`Customer_id`, `lName`, `fName`, `email`, `regular`, `Apassword`, `fk_order_id`, `fk_location_id`, `fk_transaction_id`) VALUES
(1, 'Bookmann', 'Penny', 'bookmann.penny@gmail.com', 'yes', 'bookmann1', 1, 1, 1),
(2, 'White', 'Snowy', 'white.snowy@gmail.com', 'yes', 'whityS', 2, 3, 2),
(3, 'Ultman', 'Mary', 'ultman.mary@gmail.com', 'no', 'ultman111', 3, 3, 3),
(4, 'Grey', 'Junne', 'grey.junne@gmail.com', 'yes', 'greygrey', 4, 4, 4),
(5, 'Hofer', 'Maria', 'hofer.maria@gmail.com', 'yes', 'hofer1988', 5, 2, 5),
(6, 'Sundayman', 'Meredith', 'Sundayman.1827@gmail.com', 'yes', 'sundayman111', 6, 5, 6);

-- --------------------------------------------------------

--
-- Table structure for table `famazon`
--

CREATE TABLE `famazon` (
  `fk_customer_id` int(11) DEFAULT NULL,
  `fk_companie_id` int(11) DEFAULT NULL,
  `fk_product_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `famazon`
--

INSERT INTO `famazon` (`fk_customer_id`, `fk_companie_id`, `fk_product_id`) VALUES
(1, 2, 8),
(4, 3, 9),
(5, 1, 7),
(6, 4, 6),
(3, 4, 5),
(3, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `Location_id` int(11) NOT NULL,
  `Address` varchar(30) DEFAULT NULL,
  `ZIP` int(4) DEFAULT NULL,
  `City` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`Location_id`, `Address`, `ZIP`, `City`) VALUES
(1, 'Fifhthstr 45', 3010, 'Graz'),
(2, 'Teslastreet 33', 1020, 'Vienna'),
(3, 'Fifhthstr 97', 3987, 'Tirol'),
(4, 'Secondstreet 33', 5308, 'Linz'),
(5, 'Thirdstreet 47', 9887, 'Salzburg'),
(6, 'Secondstreet 22', 5303, 'Bratislava');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `Order_id` int(11) NOT NULL,
  `OrderDate` date NOT NULL,
  `ShipDate` date NOT NULL,
  `DeliveryDate` date NOT NULL,
  `Quantity` int(11) NOT NULL,
  `PriceSum` int(11) NOT NULL,
  `Fk_ship_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`Order_id`, `OrderDate`, `ShipDate`, `DeliveryDate`, `Quantity`, `PriceSum`, `Fk_ship_id`) VALUES
(1, '2022-03-01', '2022-03-01', '2022-03-03', 2, 339, 2),
(2, '2022-03-01', '2022-03-02', '2022-03-03', 4, 330, 4),
(3, '2022-02-25', '2022-02-27', '2022-03-01', 1, 1504, 5),
(4, '2022-02-08', '2022-02-10', '0000-00-00', 3, 109, 1),
(5, '2022-03-06', '2022-03-07', '2022-03-07', 2, 588, 2),
(6, '2022-03-01', '2022-03-02', '2022-03-06', 4, 209, 4),
(7, '2022-03-10', '2022-03-11', '0000-00-00', 1, 298, 5);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Description` varchar(500) NOT NULL,
  `Photo` varchar(30) DEFAULT NULL,
  `Price` int(11) NOT NULL,
  `fk_set_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `Name`, `Description`, `Photo`, `Price`, `fk_set_id`) VALUES
(1, 'Miniskirt', 'The miniskirt pays homage to \'60s elegance with the D-Little Vichy motif in navy blue, white and red. Crafted in wool twill, it is distinguished by a streamlined, slightly flared silhouette. The miniskirt can be worn with the matching jacket to complete the look.\r\n', 'miniskirt.jpg', 48, 1),
(2, 'Long Skirt', 'The long skirt is created from gently pleated pale pink polka dot plumetis tulle. It skims the ankles and is fully lined with an underskirt of tonal cotton chiffon. Elegant finishings include an elasticated waistband of grosgrain ribbon and a subtly embroidered \'DIOR\' signature at the hem. This skirt can be paired with a blouse and the Miss B ballerinas for a special occasion.\r\n', 'longskirt.jpg', 59, 1),
(3, 'Pencil', 'NYONI 2B / HB / 14B Sketch Pencil Set of 12  / Karton Special Drawing Pencil Sketch Art', 'Drawing_Pencil.jpg', 14, 6),
(4, 'Pencil 50', 'NYONI 2B / HB / 14B Sketch Pencil Set of 50  / Karton Special Drawing Pencil Sketch Art', 'Drawing_Pencil.jpg', 48, 6),
(5, 'Handmade Bowl', 'Modern Casual Style, Decorative Handmade, (Stoneware Quality) Ceramic Bowl Tabletop Centerpiece. Handmade Beige Ceramic & Bright Green Glass Impressive Decorative Bowl.\r\n', 'Handmade_bowl.jpg', 67, 5),
(6, 'Handmade Big Bowl', 'Modern Casual Style, Decorative Handmade, (Stoneware Quality) Ceramic Bowl Tabletop Centerpiece. Handmade Beige Ceramic & Bright Green Glass Impressive Decorative Bowl. -Big\r\n', 'BowlBig.jpg', 88, 5),
(7, 'Divine Comedy', 'The Divine Comedy (Italian: Divina Commedia Italian pronunciation: [diˈviːna komˈmɛːdja]) is an Italian narrative poem by Dante Alighieri, begun c. 1308 and completed in 1320, a year before his death in 1321.', 'Alighieri.jpg', 123, 2),
(8, 'Divine Comedy', 'The Divine Comedy (Italian: Divina Commedia Italian pronunciation: [diˈviːna komˈmɛːdja]) is an Italian narrative poem by Dante Alighieri, begun c. 1308 and completed in 1320, a year before his death in 1321.', 'Alighieri.jpg', 134, 2),
(9, 'Copy of Picassos Bowl of Fruit', 'Picasso\'s Bowl of Fruit, Violin and Bottle is typical of his Synthetic Cubism, in which he uses various means - painted dots, silhouettes, grains of sand - to allude to the depicted objects. ', 'Picasso.jpg', 1269, 4);

-- --------------------------------------------------------

--
-- Table structure for table `set`
--

CREATE TABLE `set` (
  `set_id` int(11) NOT NULL,
  `Name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `set`
--

INSERT INTO `set` (`set_id`, `Name`) VALUES
(1, 'Skirt'),
(2, 'Book'),
(3, 'Glasses'),
(4, 'Painting'),
(5, 'Bowl'),
(6, 'Pencil');

-- --------------------------------------------------------

--
-- Table structure for table `shiping`
--

CREATE TABLE `shiping` (
  `shiping_id` int(11) NOT NULL,
  `StartLocation` varchar(30) NOT NULL,
  `EndLocation` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shiping`
--

INSERT INTO `shiping` (`shiping_id`, `StartLocation`, `EndLocation`) VALUES
(1, 'Vienna', 'Salzburg'),
(2, 'Linz', 'Salzburg'),
(3, 'Vienna', 'Vienna'),
(4, 'Linz', 'Tirol'),
(5, 'Tirol', 'Bratislava'),
(6, 'Tirol', 'Salzburg');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `transaction_id` int(11) NOT NULL,
  `Tdate` date DEFAULT NULL,
  `fk_bankN` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`transaction_id`, `Tdate`, `fk_bankN`) VALUES
(1, '2022-03-01', 2),
(2, '2022-02-08', 2),
(3, '2022-03-01', 2),
(4, '2022-02-08', 1),
(5, '2022-03-06', 3),
(6, '2022-02-27', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bank`
--
ALTER TABLE `bank`
  ADD PRIMARY KEY (`Bank_id`);

--
-- Indexes for table `companie`
--
ALTER TABLE `companie`
  ADD PRIMARY KEY (`Companie_id`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD KEY `fk_location_id` (`fk_location_id`),
  ADD KEY `fk_bankN_id` (`fk_bankN_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Customer_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `fk_order_id` (`fk_order_id`),
  ADD KEY `fk_location_id` (`fk_location_id`),
  ADD KEY `fk_transaction_id` (`fk_transaction_id`);

--
-- Indexes for table `famazon`
--
ALTER TABLE `famazon`
  ADD KEY `fk_customer_id` (`fk_customer_id`),
  ADD KEY `fk_companie_id` (`fk_companie_id`),
  ADD KEY `fk_product_id` (`fk_product_id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`Location_id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`Order_id`),
  ADD KEY `Fk_ship_id` (`Fk_ship_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `fk_set_id` (`fk_set_id`);

--
-- Indexes for table `set`
--
ALTER TABLE `set`
  ADD PRIMARY KEY (`set_id`);

--
-- Indexes for table `shiping`
--
ALTER TABLE `shiping`
  ADD PRIMARY KEY (`shiping_id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `fk_bankN` (`fk_bankN`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bank`
--
ALTER TABLE `bank`
  MODIFY `Bank_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `companie`
--
ALTER TABLE `companie`
  MODIFY `Companie_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `Customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `Location_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `Order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `set`
--
ALTER TABLE `set`
  MODIFY `set_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `shiping`
--
ALTER TABLE `shiping`
  MODIFY `shiping_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `companie`
--
ALTER TABLE `companie`
  ADD CONSTRAINT `companie_ibfk_1` FOREIGN KEY (`fk_location_id`) REFERENCES `location` (`Location_id`),
  ADD CONSTRAINT `companie_ibfk_2` FOREIGN KEY (`fk_bankN_id`) REFERENCES `bank` (`Bank_id`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`fk_order_id`) REFERENCES `order` (`Order_id`),
  ADD CONSTRAINT `customer_ibfk_2` FOREIGN KEY (`fk_location_id`) REFERENCES `location` (`Location_id`),
  ADD CONSTRAINT `customer_ibfk_3` FOREIGN KEY (`fk_transaction_id`) REFERENCES `transaction` (`transaction_id`);

--
-- Constraints for table `famazon`
--
ALTER TABLE `famazon`
  ADD CONSTRAINT `famazon_ibfk_1` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`Customer_id`),
  ADD CONSTRAINT `famazon_ibfk_2` FOREIGN KEY (`fk_companie_id`) REFERENCES `companie` (`Companie_id`),
  ADD CONSTRAINT `famazon_ibfk_3` FOREIGN KEY (`fk_product_id`) REFERENCES `product` (`product_id`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`Fk_ship_id`) REFERENCES `shiping` (`shiping_id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`fk_set_id`) REFERENCES `set` (`set_id`);

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`fk_bankN`) REFERENCES `bank` (`Bank_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
