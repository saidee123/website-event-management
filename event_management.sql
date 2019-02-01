-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 27, 2018 at 04:53 PM
-- Server version: 5.6.24
-- PHP Version: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `event_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendee`
--

CREATE TABLE IF NOT EXISTS `attendee` (
  `att_id` int(4) NOT NULL,
  `att_name` varchar(100) DEFAULT NULL,
  `att_nric` varchar(14) DEFAULT NULL,
  `att_phone_num` varchar(13) DEFAULT NULL,
  `att_email` varchar(100) DEFAULT NULL,
  `eve_id` int(4) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attendee`
--

INSERT INTO `attendee` (`att_id`, `att_name`, `att_nric`, `att_phone_num`, `att_email`, `eve_id`) VALUES
(5, 'Muhammad Zahriel', '970707-11-1111', '0123456789', 'zahriel@someemail.com', 26),
(6, 'Dannis Ng', '900717-12-1311', '0123356489', 'dannis@mailmail.com', 26),
(7, 'Zaidee Yisau', '950302-31-4131', '0123456789', 'zaidee@nomail.com', 26);

-- --------------------------------------------------------

--
-- Table structure for table `committee`
--

CREATE TABLE IF NOT EXISTS `committee` (
  `comm_id` int(4) NOT NULL,
  `comm_name` varchar(100) DEFAULT NULL,
  `comm_div` varchar(20) DEFAULT NULL,
  `comm_nric` varchar(14) DEFAULT NULL,
  `comm_phone_num` varchar(13) DEFAULT NULL,
  `comm_email` varchar(100) DEFAULT NULL,
  `eve_id` int(4) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `committee`
--

INSERT INTO `committee` (`comm_id`, `comm_name`, `comm_div`, `comm_nric`, `comm_phone_num`, `comm_email`, `eve_id`) VALUES
(9, 'Naszrul Azreen Badarudin', 'Event Management', '900101-10-1010', '0129270590', 'nasxgeek@gmail.com', 26),
(10, 'Mohamad Harith', 'Logistics', '901101-12-2010', '0111111111', 'harith@someemail.com', 26);

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE IF NOT EXISTS `event` (
  `eve_id` int(4) NOT NULL,
  `eve_name` varchar(100) DEFAULT NULL,
  `eve_date` date DEFAULT NULL,
  `eve_time` time DEFAULT NULL,
  `eve_venue` varchar(100) DEFAULT NULL,
  `eve_max_num_att` int(3) DEFAULT NULL,
  `eve_desc` varchar(255) DEFAULT NULL,
  `user_id` int(4) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`eve_id`, `eve_name`, `eve_date`, `eve_time`, `eve_venue`, `eve_max_num_att`, `eve_desc`, `user_id`) VALUES
(26, 'VR Experience', '2018-11-12', '10:00:00', 'MPH', 120, 'Experience the world of VR with HTC Vive, Oculus Rift and more.', 1),
(27, 'LAN Party', '2018-12-12', '17:00:00', 'Public Hall', 230, 'Let''s play games together on a LAN network!', 1),
(28, 'Web Development Workshop', '2018-12-12', '20:00:00', 'CQCR2002', 50, 'Learn about web development.', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tentative`
--

CREATE TABLE IF NOT EXISTS `tentative` (
  `tent_id` int(4) NOT NULL,
  `tent_time` time DEFAULT NULL,
  `tent_desc` varchar(255) DEFAULT NULL,
  `eve_id` int(4) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tentative`
--

INSERT INTO `tentative` (`tent_id`, `tent_time`, `tent_desc`, `eve_id`) VALUES
(9, '10:00:00', 'Opening ceremony.', 26),
(10, '11:00:00', 'Simulation begins.', 26),
(11, '17:00:00', 'Closing ceremony.', 26),
(12, '17:00:00', 'PC setup.', 27),
(13, '18:00:00', 'Opening Ceremony.', 27),
(14, '19:00:00', 'Free time.', 27),
(15, '23:00:00', 'Closing ceremony.', 27);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(4) NOT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `user_password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_name`, `user_password`) VALUES
(1, 'user@email.com', 'e99a18c428cb38d5f260853678922e03');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendee`
--
ALTER TABLE `attendee`
  ADD PRIMARY KEY (`att_id`), ADD KEY `fk_event2` (`eve_id`);

--
-- Indexes for table `committee`
--
ALTER TABLE `committee`
  ADD PRIMARY KEY (`comm_id`), ADD KEY `fk_event1` (`eve_id`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`eve_id`), ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tentative`
--
ALTER TABLE `tentative`
  ADD PRIMARY KEY (`tent_id`), ADD KEY `fk_event` (`eve_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendee`
--
ALTER TABLE `attendee`
  MODIFY `att_id` int(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `committee`
--
ALTER TABLE `committee`
  MODIFY `comm_id` int(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `eve_id` int(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `tentative`
--
ALTER TABLE `tentative`
  MODIFY `tent_id` int(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendee`
--
ALTER TABLE `attendee`
ADD CONSTRAINT `fk_event2` FOREIGN KEY (`eve_id`) REFERENCES `event` (`eve_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `committee`
--
ALTER TABLE `committee`
ADD CONSTRAINT `fk_event1` FOREIGN KEY (`eve_id`) REFERENCES `event` (`eve_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `event`
--
ALTER TABLE `event`
ADD CONSTRAINT `event_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `tentative`
--
ALTER TABLE `tentative`
ADD CONSTRAINT `fk_event` FOREIGN KEY (`eve_id`) REFERENCES `event` (`eve_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
