-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 19, 2023 at 10:09 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pharmacydb`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customerId` int(11) NOT NULL,
  `customerName` varchar(45) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `address` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customerId`, `customerName`, `contact`, `address`) VALUES
(1, 'John Doe', '09876543411', 'Himatagon'),
(2, 'Dexter Manlao', '09124758493', 'Namik'),
(3, 'Kela', '09876545444', 'Bam'),
(4, 'Roland Res', '98766787666', 'Manilasang'),
(5, '', '', ''),
(6, 'Peter Pan', '0909886868', 'Waa'),
(7, 'Manny P', '08798676666', 'Pol'),
(8, 'deleteme', '868454444', 'awa'),
(9, 'deleme', '34543543', 'dfddd'),
(10, 'ten', '54654444', 'qewe'),
(11, 'eleven', '3243333', 'waa ka'),
(12, 'twelve', '4535333', 'eleged'),
(13, 'sample1', '977778', 'nanna'),
(14, 'Chan', '090887777', 'Chan st.'),
(15, 'Chan', '89897978', 'Chan st.'),
(16, 'Last', '89897777', 'last st');

-- --------------------------------------------------------

--
-- Table structure for table `productcategory`
--

CREATE TABLE `productcategory` (
  `categoryId` int(11) NOT NULL,
  `categoryName` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `productcategory`
--

INSERT INTO `productcategory` (`categoryId`, `categoryName`) VALUES
(1, 'Vitamins & Supplements'),
(2, 'Adult Multivitamins'),
(3, 'Cold Medicines'),
(4, 'Cough Medicines'),
(5, 'Allergy Care'),
(6, 'Headache, Fever & Flu'),
(7, 'Healthy Aging');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `productId` int(11) NOT NULL,
  `productName` varchar(45) NOT NULL,
  `categoryId` int(11) NOT NULL,
  `unitPrice` float NOT NULL,
  `unitStock` int(11) NOT NULL,
  `expireDate` varchar(45) NOT NULL,
  `UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`productId`, `productName`, `categoryId`, `unitPrice`, `unitStock`, `expireDate`, `UserID`) VALUES
(1, 'Forti D', 1, 1150.5, 2, 'Friday, May 26, 2023', 0),
(2, 'Hemerate FA', 1, 1250.1, 1, 'Tuesday, May 23, 2023', 0),
(3, 'ImmunPro', 1, 1130, 5, 'Wednesday, July 5, 2023', 0),
(4, 'Maxvit', 2, 1500, 4, 'Wednesday, July 5, 2023', 0),
(5, 'Neurogen E', 2, 1200, 2, 'Monday, July 17, 2023', 0),
(6, 'Revicon', 2, 900, 10, 'Monday, July 17, 2023', 0),
(7, 'Decolgen Forte', 3, 950, 1, 'Monday, July 17, 2023', 0),
(8, 'Nafarin A', 3, 1050, 5, 'Wednesday, September 13, 2023', 0),
(9, 'Neozep Forte', 3, 990, 2, 'Wednesday, September 13, 2023', 0),
(10, 'Neozep Drops', 3, 910, 4, 'Monday, September 11, 2023', 0),
(11, 'Myracaf Tablet', 4, 1050, 5, 'Wednesday, September 20, 2023', 0),
(12, 'Solmux Advance', 4, 1100, 1, 'Friday, September 1, 2023', 0),
(13, 'Tuseran Forte', 4, 890, 3, 'Thursday, August 17, 2023', 0),
(14, 'Allerta Tablet', 5, 990, 20, 'Tuesday, June 11, 2024', 0),
(15, 'Alnix', 5, 890, 6, 'Thursday, June 13, 2024', 0),
(16, 'Alnix Plus Tablet', 5, 1130, 7, 'Saturday, May 20, 2023', 0),
(17, 'Bioflu', 6, 900, 2, 'Monday, June 12, 2023', 0),
(18, 'Alaxan FR', 6, 850, 95, 'Friday, June 16, 2023', 0),
(19, 'Dolfenal', 6, 560, 2, 'Monday, July 10, 2023', 0),
(20, 'Skelan', 7, 1500, 3, 'Thursday, July 20, 2023', 0),
(21, 'United Home Multi B', 7, 1500, 7, 'Tuesday, August 15, 2023', 0);

-- --------------------------------------------------------

--
-- Table structure for table `purchaseorder`
--

CREATE TABLE `purchaseorder` (
  `purchaseId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unitPrice` double NOT NULL,
  `subTotal` double NOT NULL,
  `supplierId` int(11) NOT NULL,
  `orderDate` varchar(45) NOT NULL,
  `userId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `purchaseorder`
--

INSERT INTO `purchaseorder` (`purchaseId`, `productId`, `quantity`, `unitPrice`, `subTotal`, `supplierId`, `orderDate`, `userId`) VALUES
(1, 14, 50, 1120, 56000, 2, '5/14/2023 8:42:21 PM', 0),
(2, 16, 6, 1120, 6720, 0, '5/14/2023 9:05:11 PM', 0),
(3, 15, 2, 999, 1998, 0, '5/14/2023 9:07:36 PM', 0);

-- --------------------------------------------------------

--
-- Table structure for table `receiveproduct`
--

CREATE TABLE `receiveproduct` (
  `receiveId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unitPrice` double NOT NULL,
  `subTotal` double NOT NULL,
  `supplierId` int(11) NOT NULL,
  `receiveDate` varchar(45) NOT NULL,
  `userId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `receiveproduct`
--

INSERT INTO `receiveproduct` (`receiveId`, `productId`, `quantity`, `unitPrice`, `subTotal`, `supplierId`, `receiveDate`, `userId`) VALUES
(1, 14, 50, 1120, 56000, 2, '5/14/2023 8:42:21 PM', 0),
(2, 16, 6, 1120, 6720, 0, '5/14/2023 9:05:11 PM', 0),
(3, 15, 2, 999, 1998, 0, '5/14/2023 9:07:36 PM', 0);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `supplierId` int(11) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `contactNo` varchar(45) NOT NULL,
  `Address` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`supplierId`, `Name`, `contactNo`, `Address`, `email`) VALUES
(1, 'John Donut', '09737373221', 'Manilasang', ''),
(2, 'Dexter M', '086742343', 'Namek', 'dex@gmai.com'),
(3, 'Kyla M', '3432222', 'Namek', 'k@gmail.com'),
(4, 'Manek', '999393933', 'Jaw', 'wats@gmail.com'),
(5, 'Safu', '078664444', 'Man', 'safu@gmail.com'),
(6, 'MARIA', '9777777', 'MASAA', 'maia@gmail.com'),
(7, 'Dodong', '8778885', 'Dodong st.', 'dodong@gmail.com'),
(8, 'Dodong', '097788783', 'dodong st.', 'dodong2@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `tblinvoice`
--

CREATE TABLE `tblinvoice` (
  `invoiceId` int(11) NOT NULL,
  `customerId` int(11) NOT NULL,
  `totalAmount` double NOT NULL,
  `amountTendered` double NOT NULL,
  `dateRecorded` varchar(45) NOT NULL,
  `UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblinvoice`
--

INSERT INTO `tblinvoice` (`invoiceId`, `customerId`, `totalAmount`, `amountTendered`, `dateRecorded`, `UserID`) VALUES
(1, 4, 2870, 2000, '5/10/2023 9:41:14 AM', 2),
(2, 13, 6800, 10000, '5/10/2023 9:44:03 AM', 2),
(3, 13, 4250, 5000, '5/10/2023 9:46:49 AM', 2),
(4, 0, 32670, 50000, '5/14/2023 8:33:15 PM', 0),
(5, 0, 2670, 5000, '5/14/2023 8:36:37 PM', 0),
(6, 0, 5940, 7000, '5/18/2023 1:31:13 PM', 0),
(7, 0, 1780, 2000, '5/19/2023 7:41:38 AM', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tblsales`
--

CREATE TABLE `tblsales` (
  `salesId` int(11) NOT NULL,
  `invoiceId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unitPrice` double NOT NULL,
  `subTotal` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblsales`
--

INSERT INTO `tblsales` (`salesId`, `invoiceId`, `productId`, `quantity`, `unitPrice`, `subTotal`) VALUES
(1, 1, 14, 2, 990, 1980),
(2, 1, 15, 1, 890, 890),
(3, 2, 18, 8, 850, 6800),
(4, 3, 18, 5, 850, 4250),
(5, 4, 14, 33, 990, 32670),
(6, 5, 15, 3, 890, 2670),
(7, 6, 14, 6, 990, 5940),
(8, 7, 15, 2, 890, 1780);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL,
  `Firstname` varchar(45) NOT NULL,
  `Lastname` varchar(45) NOT NULL,
  `ContactNo` int(15) NOT NULL,
  `Username` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `Firstname`, `Lastname`, `ContactNo`, `Username`, `Password`) VALUES
(1, 'admin', 'admin', 213123, 'maw', 'maw'),
(2, 'Layla', 'Day', 908978667, 'sample', 'sample');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customerId`);

--
-- Indexes for table `productcategory`
--
ALTER TABLE `productcategory`
  ADD PRIMARY KEY (`categoryId`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`productId`);

--
-- Indexes for table `purchaseorder`
--
ALTER TABLE `purchaseorder`
  ADD PRIMARY KEY (`purchaseId`);

--
-- Indexes for table `receiveproduct`
--
ALTER TABLE `receiveproduct`
  ADD PRIMARY KEY (`receiveId`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`supplierId`);

--
-- Indexes for table `tblinvoice`
--
ALTER TABLE `tblinvoice`
  ADD PRIMARY KEY (`invoiceId`);

--
-- Indexes for table `tblsales`
--
ALTER TABLE `tblsales`
  ADD PRIMARY KEY (`salesId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customerId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `productcategory`
--
ALTER TABLE `productcategory`
  MODIFY `categoryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `productId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `purchaseorder`
--
ALTER TABLE `purchaseorder`
  MODIFY `purchaseId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `receiveproduct`
--
ALTER TABLE `receiveproduct`
  MODIFY `receiveId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `supplierId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tblinvoice`
--
ALTER TABLE `tblinvoice`
  MODIFY `invoiceId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tblsales`
--
ALTER TABLE `tblsales`
  MODIFY `salesId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
