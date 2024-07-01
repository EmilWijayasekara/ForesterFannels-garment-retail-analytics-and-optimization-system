-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 10, 2023 at 07:21 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `general_retail_analytics_and_optimization_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `assigned_to`
--

CREATE TABLE `assigned_to` (
  `employee_id` varchar(5) NOT NULL,
  `store_id` varchar(7) NOT NULL,
  `hours` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `assigned_to`
--

INSERT INTO `assigned_to` (`employee_id`, `store_id`, `hours`) VALUES
('E1000', 'STORE01', 35),
('E1001', 'STORE02', 46),
('E1002', 'STORE03', 36),
('E1003', 'STORE04', 22);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` varchar(8) NOT NULL,
  `first_name` varchar(10) NOT NULL,
  `last_name` varchar(10) NOT NULL,
  `email_address` varchar(20) NOT NULL,
  `phone_number` int(10) NOT NULL,
  `address` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `first_name`, `last_name`, `email_address`, `phone_number`, `address`) VALUES
('CUS12345', 'Sarah', 'Reddy', 'sreddy123@gmail.com', 778883334, '2427 Notre Dame Ave'),
('CUS12346', 'Fazal', 'Martinez', 'fazalmar45@gmail.com', 763456721, '8154 Via Mexico'),
('CUS12347', 'Fazal', 'Martinez', 'fazalmar45@gmail.com', 712381622, '80 Sunview Terrace'),
('CUS12348', 'Ema', 'Harris', 'emaharris@gmail.com', 723456875, '5725 Glaze Drive');

-- --------------------------------------------------------

--
-- Table structure for table `dependent`
--

CREATE TABLE `dependent` (
  `employee_id` varchar(5) NOT NULL,
  `name` varchar(10) NOT NULL,
  `birth_date` date NOT NULL,
  `sex` char(1) NOT NULL,
  `relationship` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dependent`
--

INSERT INTO `dependent` (`employee_id`, `name`, `birth_date`, `sex`, `relationship`) VALUES
('E1000', 'Leah', '1999-11-23', 'F', 'Daughter'),
('E1000', 'Mike', '2000-12-22', 'M', 'Son'),
('E1000', 'Lily', '1969-12-14', 'F', 'Spouse'),
('E1001', 'Jake', '1965-07-08', 'M', 'Spouse'),
('E1002', 'Alexa', '1998-04-14', 'F', 'Daughter'),
('E1002', 'Alice', '1976-01-27', 'F', 'Spouse');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employee_id` varchar(5) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `email_address` varchar(25) DEFAULT NULL,
  `phone_number` int(10) NOT NULL,
  `sex` char(1) NOT NULL,
  `position` varchar(25) DEFAULT NULL,
  `hours` int(2) NOT NULL,
  `hire_date` date NOT NULL,
  `hourly_pay` decimal(7,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employee_id`, `first_name`, `last_name`, `email_address`, `phone_number`, `sex`, `position`, `hours`, `hire_date`, `hourly_pay`) VALUES
('E1000', 'John', 'Smith', 'johnsmith87@gmail.com', 771234567, 'M', 'Manager', 36, '2014-03-25', '4500.00'),
('E1001', 'Anne', 'Martinus', 'annem003@gmail.com', 762345898, 'F', 'Divisional Manager', 25, '2020-07-05', '2500.00'),
('E1002', 'Olivia', 'Jade', 'oliviaj356@gmail.com', 775551236, 'F', 'Human Resource Manager', 28, '2021-11-09', '1000.00'),
('E1003', 'Akash', 'Melvin', 'akmelevin@gmail.com', 766789321, 'M', 'Sales Manager', 34, '2016-02-26', '2300.00');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `order_id` varchar(8) NOT NULL,
  `employee_id` varchar(5) NOT NULL,
  `customer_id` varchar(8) NOT NULL,
  `order_date` date NOT NULL,
  `total_amount` decimal(7,2) NOT NULL,
  `pay_method` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`order_id`, `employee_id`, `customer_id`, `order_date`, `total_amount`, `pay_method`) VALUES
('ON5555', 'E1000', 'CUS12345', '2022-05-05', '20450.00', 'Cash'),
('ON5556', 'E1001', 'CUS12346', '2022-12-16', '12300.00', 'Check'),
('ON5557', 'E1002', 'CUS12347', '2022-10-08', '7900.00', 'Mobile payment'),
('ON5558', 'E1001', 'CUS12347', '2022-11-26', '15000.00', 'Debit cards');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` varchar(9) NOT NULL,
  `product_name` varchar(20) NOT NULL,
  `store_id` varchar(7) NOT NULL,
  `supplier_id` varchar(5) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `store_id`, `supplier_id`, `quantity`) VALUES
('ITEM11111', 'Uniforms', 'STORE01', 'S2000', 15),
('ITEM11112', 'Work wear', 'STORE02', 'S2001', 24),
('ITEM11113', 'Sports wear', 'STORE01', 'S2000', 11),
('ITEM11114', 'Track suit', 'STORE04', 'S2002', 9);

-- --------------------------------------------------------

--
-- Table structure for table `store`
--

CREATE TABLE `store` (
  `store_id` varchar(7) NOT NULL,
  `store_name` varchar(20) NOT NULL,
  `address` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `store`
--

INSERT INTO `store` (`store_id`, `store_name`, `address`) VALUES
('STORE01', 'Fashion Factory', '223 Azlan Avenue'),
('STORE02', 'Purple Passion', '123 Alexander way'),
('STORE03', 'Fashion Factory', '18 Orange Street'),
('STORE04', 'Rozelle Shop', '72 Albert Avenue');

-- --------------------------------------------------------

--
-- Table structure for table `store_phone_numbers`
--

CREATE TABLE `store_phone_numbers` (
  `store_id` varchar(7) NOT NULL,
  `store_phone_number` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `store_phone_numbers`
--

INSERT INTO `store_phone_numbers` (`store_id`, `store_phone_number`) VALUES
('STORE01', 435678955),
('STORE01', 435678956),
('STORE02', 336282989),
('STORE03', 256178876),
('STORE03', 256178877);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `supplier_id` varchar(5) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `email_address` varchar(50) DEFAULT NULL,
  `phone_number` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`supplier_id`, `first_name`, `last_name`, `email_address`, `phone_number`) VALUES
('S2000', 'Stephen', 'Carson', 'stephencar45@gmail.com', 465374583),
('S2001', 'Julian', 'Hendricks', 'jhendricks@gmail.com', 446327673),
('S2002', 'David', 'Cameron', 'davidcam33@gmail.com', 455512391),
('S2003', 'Amy', 'Albert', 'amyalbert91@gmail.com', 467871263);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assigned_to`
--
ALTER TABLE `assigned_to`
  ADD KEY `fk_assignedEmployee_id_to_employeeEmploye_id` (`employee_id`),
  ADD KEY `fk_assignedStore_id_to_storeStore_id` (`store_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `dependent`
--
ALTER TABLE `dependent`
  ADD KEY `fk_dependentEmployee_id_to_employeeEmploye_id` (`employee_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `fk_orderEmployee_id_to_employeeEmploye_id` (`employee_id`),
  ADD KEY `fk_orderCustomer_id_to_customerCustomer` (`customer_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `fk_productStore_id_to_storeStore_id` (`store_id`),
  ADD KEY `fk_productSupplier_id_to_supplierSupplier_id` (`supplier_id`);

--
-- Indexes for table `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`store_id`);

--
-- Indexes for table `store_phone_numbers`
--
ALTER TABLE `store_phone_numbers`
  ADD KEY `fk_store_phoneStore_id_to_storeStore_id` (`store_id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`supplier_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assigned_to`
--
ALTER TABLE `assigned_to`
  ADD CONSTRAINT `fk_assignedEmployee_id_to_employeeEmploye_id` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`),
  ADD CONSTRAINT `fk_assignedStore_id_to_storeStore_id` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`);

--
-- Constraints for table `dependent`
--
ALTER TABLE `dependent`
  ADD CONSTRAINT `fk_dependentEmployee_id_to_employeeEmploye_id` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `fk_orderCustomer_id_to_customerCustomer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `fk_orderEmployee_id_to_employeeEmploye_id` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk_productStore_id_to_storeStore_id` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`),
  ADD CONSTRAINT `fk_productSupplier_id_to_supplierSupplier_id` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`supplier_id`);

--
-- Constraints for table `store_phone_numbers`
--
ALTER TABLE `store_phone_numbers`
  ADD CONSTRAINT `fk_store_phoneStore_id_to_storeStore_id` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
