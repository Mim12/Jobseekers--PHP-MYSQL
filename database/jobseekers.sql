-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 09, 2022 at 01:02 PM
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
-- Database: `jobseekers`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `email`, `password`) VALUES
('6307c8c039ff1', 'admin', 'admin@gmail.com', 'ac9689e2272427085e35b9d3e3e8bed88cb3434828b43b86fc0596cad4c6e270');

-- --------------------------------------------------------

--
-- Table structure for table `buypackage`
--

CREATE TABLE `buypackage` (
  `id` int(11) NOT NULL,
  `numberofpost` int(11) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `employerid` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `buypackage`
--

INSERT INTO `buypackage` (`id`, `numberofpost`, `amount`, `employerid`) VALUES
(31, 3, '100.00', '631621c4eaefc '),
(33, 1, '50.00', '631a32e7e4881 ');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `adminid` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `adminid`) VALUES
(1, 'Graphics Designer', '6307c8c039ff1'),
(2, 'Content Writer', '6307c8c039ff1'),
(3, 'Frontend Developer', '6307c8c039ff1'),
(4, 'Backend Developer', '6307c8c039ff1'),
(5, 'Bank/Non Bank', '6307c8c039ff1'),
(6, 'Garments/Textile', '6307c8c039ff1'),
(7, 'Marketing/Sales', '6307c8c039ff1');

-- --------------------------------------------------------

--
-- Table structure for table `employer`
--

CREATE TABLE `employer` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `companyname` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile` int(15) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `otp` int(11) DEFAULT NULL,
  `authentication` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employer`
--

INSERT INTO `employer` (`id`, `name`, `companyname`, `location`, `email`, `mobile`, `password`, `position`, `otp`, `authentication`, `status`) VALUES
('631621c4eaefc', 'Minhajul Islam', 'eduIT', 'Narayanganj', 'minhajulsiam786@gmail.com', 1900112233, '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', 'employer', 748590, 'Verified', 'active'),
('631a32e7e4881', 'Siam khan', 'SwipeWire', 'Sylhet', 'minhajulsiam28@gmail.com', 1900110011, '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', 'employer', 914630, 'Verified', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `interview`
--

CREATE TABLE `interview` (
  `id` varchar(255) NOT NULL,
  `userid` varchar(255) DEFAULT NULL,
  `employerid` varchar(255) DEFAULT NULL,
  `jobpostid` varchar(255) DEFAULT NULL,
  `jobapplyid` varchar(255) DEFAULT NULL,
  `meetingid` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `interview`
--

INSERT INTO `interview` (`id`, `userid`, `employerid`, `jobpostid`, `jobapplyid`, `meetingid`, `time`, `url`, `password`) VALUES
('631b11015d146', '63162889723ce', '631621c4eaefc', '631622f903679', '63162a72bd98e', '89329147298', '2022-09-15 18:10:00', 'https://us05web.zoom.us/j/89329147298?pwd=eXNURnVoMnQ1czhLT25zanlGcituZz09', '12345'),
('631b1bf4f21af', '631b17215de55', '631a32e7e4881', '631b16b63826c', '631b1b2c91c56', '85043111398', '2022-09-21 18:00:00', 'https://us05web.zoom.us/j/85043111398?pwd=SWVNbTNyZERxcHJFZnNmMDRveDRodz09', '12345');

-- --------------------------------------------------------

--
-- Table structure for table `jobapply`
--

CREATE TABLE `jobapply` (
  `id` varchar(255) NOT NULL,
  `cv` varchar(300) DEFAULT NULL,
  `categoryid` int(11) DEFAULT NULL,
  `jobid` varchar(255) DEFAULT NULL,
  `userid` varchar(255) DEFAULT NULL,
  `applytime` date DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jobapply`
--

INSERT INTO `jobapply` (`id`, `cv`, `categoryid`, `jobid`, `userid`, `applytime`, `status`) VALUES
('63162a72bd98e', '631622f903679cv.pdf', 4, '631622f903679', '63162889723ce', '2022-09-06', 'called for interview'),
('631b1b2c91c56', '631b16b63826ccv.pdf', 5, '631b16b63826c', '631b17215de55', '2022-09-09', 'called for interview');

-- --------------------------------------------------------

--
-- Table structure for table `jobpost`
--

CREATE TABLE `jobpost` (
  `id` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `companyname` varchar(255) DEFAULT NULL,
  `categoryid` int(11) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `requirement` varchar(255) DEFAULT NULL,
  `experience` varchar(255) DEFAULT NULL,
  `salary` int(11) DEFAULT NULL,
  `employerid` varchar(255) DEFAULT NULL,
  `editlimit` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `education` varchar(255) DEFAULT NULL,
  `deadline` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jobpost`
--

INSERT INTO `jobpost` (`id`, `title`, `companyname`, `categoryid`, `location`, `type`, `requirement`, `experience`, `salary`, `employerid`, `editlimit`, `status`, `education`, `deadline`) VALUES
('631622f903679', 'Junior Developer', 'eduIT', 4, 'Narayanganj', 'Full Time ', 'php developer', '1-3 years ', 50, '631621c4eaefc', 0, 'approved', 'Bsc in cse ', '2022-09-20'),
('6319e221de30d', 'Senior Developer', 'eduIT', 3, 'Dhaka', 'Part Time ', 'Html, Css, JS, React  ', '1-2 years ', 30, '631621c4eaefc', 0, 'approved', 'Bsc in cse ', '2022-09-20'),
('631b16b63826c', 'Cashier', 'SwipeWire', 5, 'Dhaka ', 'Full Time ', 'Computer skills, MS word, Excel ', '1-3 years ', 25, '631a32e7e4881', 0, 'approved', 'BBA in Accounting  ', '2022-09-15');

-- --------------------------------------------------------

--
-- Table structure for table `package`
--

CREATE TABLE `package` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `numberofpost` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `adminid` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `package`
--

INSERT INTO `package` (`id`, `name`, `numberofpost`, `price`, `adminid`) VALUES
(1, 'Basic', 2, 50, '6307c8c039ff1'),
(2, 'Advanced', 5, 100, '6307c8c039ff1'),
(3, 'premium', 10, 150, '6307c8c039ff1');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` int(11) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `transid` varchar(255) DEFAULT NULL,
  `cardtype` varchar(255) DEFAULT NULL,
  `employerid` varchar(255) DEFAULT NULL,
  `packageid` int(11) DEFAULT NULL,
  `transtime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id`, `status`, `transid`, `cardtype`, `employerid`, `packageid`, `transtime`) VALUES
(170, 'VALID', 'SSLCZ_TEST_63162283e9a9e', 'QCASH-ITCL', '631621c4eaefc ', 2, '2022-09-05 22:25:51'),
(173, 'VALID', 'SSLCZ_TEST_631b167c4c267', 'MTBL-Mutual Trust Internet Banking', '631a32e7e4881 ', 1, '2022-09-09 16:35:50');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile` int(15) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `otp` int(11) DEFAULT NULL,
  `authentication` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `gender`, `email`, `mobile`, `password`, `position`, `otp`, `authentication`, `status`, `location`) VALUES
('63162889723ce', 'Moin khan', 'Male', 'msiam183036@bscse.uiu.ac.bd', 1900110011, '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', 'user', 593033, 'Verified', 'active', 'Narayanganj'),
('631b17215de55', 'Mainul Islam', 'Male', 'minhajulsiam370@gmail.com', 1900110022, '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', 'user', 624122, 'Verified', 'active', 'Sylhet');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `buypackage`
--
ALTER TABLE `buypackage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `buypackage_ibfk_1` (`employerid`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adminid` (`adminid`);

--
-- Indexes for table `employer`
--
ALTER TABLE `employer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `interview`
--
ALTER TABLE `interview`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid` (`userid`),
  ADD KEY `employerid` (`employerid`),
  ADD KEY `jobpostid` (`jobpostid`),
  ADD KEY `jobapplyid` (`jobapplyid`);

--
-- Indexes for table `jobapply`
--
ALTER TABLE `jobapply`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobapply_ibfk_1` (`categoryid`),
  ADD KEY `jobapply_ibfk_2` (`userid`),
  ADD KEY `jobapply_ibfk_3` (`jobid`);

--
-- Indexes for table `jobpost`
--
ALTER TABLE `jobpost`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employeeid` (`employerid`),
  ADD KEY `categoryid` (`categoryid`);

--
-- Indexes for table `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adminid` (`adminid`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_ibfk_1` (`employerid`),
  ADD KEY `payment_ibfk_2` (`packageid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buypackage`
--
ALTER TABLE `buypackage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `package`
--
ALTER TABLE `package`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=174;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `buypackage`
--
ALTER TABLE `buypackage`
  ADD CONSTRAINT `buypackage_ibfk_1` FOREIGN KEY (`employerid`) REFERENCES `employer` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `category_ibfk_1` FOREIGN KEY (`adminid`) REFERENCES `admin` (`id`);

--
-- Constraints for table `interview`
--
ALTER TABLE `interview`
  ADD CONSTRAINT `interview_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `interview_ibfk_2` FOREIGN KEY (`employerid`) REFERENCES `employer` (`id`),
  ADD CONSTRAINT `interview_ibfk_3` FOREIGN KEY (`jobpostid`) REFERENCES `jobpost` (`id`),
  ADD CONSTRAINT `interview_ibfk_4` FOREIGN KEY (`jobapplyid`) REFERENCES `jobapply` (`id`);

--
-- Constraints for table `jobapply`
--
ALTER TABLE `jobapply`
  ADD CONSTRAINT `jobapply_ibfk_1` FOREIGN KEY (`categoryid`) REFERENCES `category` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `jobapply_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `jobapply_ibfk_3` FOREIGN KEY (`jobid`) REFERENCES `jobpost` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `jobpost`
--
ALTER TABLE `jobpost`
  ADD CONSTRAINT `jobpost_ibfk_1` FOREIGN KEY (`employerid`) REFERENCES `employer` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `jobpost_ibfk_2` FOREIGN KEY (`categoryid`) REFERENCES `category` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `package`
--
ALTER TABLE `package`
  ADD CONSTRAINT `package_ibfk_1` FOREIGN KEY (`adminid`) REFERENCES `admin` (`id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`employerid`) REFERENCES `employer` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`packageid`) REFERENCES `package` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
