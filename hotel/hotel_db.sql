-- phpMyAdmin SQL Dump
-- version 3.2.0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 31, 2016 at 01:58 AM
-- Server version: 5.1.37
-- PHP Version: 5.3.0

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `hotel_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `backup_orders_details`
--

CREATE TABLE IF NOT EXISTS `backup_orders_details` (
  `no` int(100) NOT NULL AUTO_INCREMENT,
  `c_date` date NOT NULL,
  `order_no` int(100) NOT NULL,
  `table_no` int(100) NOT NULL,
  `ord_menu` varchar(100) NOT NULL,
  `customer_bill` int(100) NOT NULL,
  `quantity` int(100) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `captain_name` varchar(100) NOT NULL,
  `payment_status` varchar(100) NOT NULL,
  PRIMARY KEY (`no`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=95 ;

--
-- Dumping data for table `backup_orders_details`
--

INSERT INTO `backup_orders_details` (`no`, `c_date`, `order_no`, `table_no`, `ord_menu`, `customer_bill`, `quantity`, `customer_name`, `captain_name`, `payment_status`) VALUES
(20, '2015-12-13', 17, 3, 'ladu:4#samosa:2#ladu:3#', 0, 0, 'prashant raut', 'pravin', 'Not_Done'),
(21, '2015-12-13', 18, 1, 'ladu:8#chicken:4#kande-pohe:4#', 0, 0, 'prashant raut', 'pras', 'Not_Done'),
(22, '2015-12-13', 19, 3, 'ladu:7#', 0, 0, 'dhs', 'pravin', 'Not_Done'),
(23, '2015-12-13', 20, 1, 'ladu:8#puri:7#', 0, 0, 'fdsh', 'pravin', 'Not_Done'),
(24, '2015-12-13', 21, 1, 'samosa:8#kande-pohe:5#baatata :3#chicken:2#samosa:7#', 0, 0, 'gfdhh', 'pras', 'Not_Done'),
(25, '2015-12-13', 22, 2, 'ladu:8#poli-bhaji:4#poli-bhaji:3#', 0, 0, 'dsxzfg', 'pravin', 'Not_Done'),
(26, '2015-12-13', 1, 1, 'samosa:8#ladu:4#', 0, 0, 'dfgfd', 'pras', 'Not_Done'),
(94, '2015-12-13', 2, 5, 'samosa:7#chicken:3#kande-pohe:4#poli-bhaji:3#poli-bhaji:10#chicken:100#', 0, 0, 'pravin', 'pras', 'Not_Done'),
(86, '2015-12-15', 3, 6, 'ladu:8#puri:2#samosa:3#chicken:8#poli-bhaji:2#chicken:4#ladu:1#ladu:10#ladu:100#ladu:1000#poli-bhaji', 0, 0, 'ashish', 'pravin', 'Not_Done');

-- --------------------------------------------------------

--
-- Table structure for table `captain_detail`
--

CREATE TABLE IF NOT EXISTS `captain_detail` (
  `cap_name` varchar(45) DEFAULT NULL,
  `cap_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cap_dob` date NOT NULL,
  `cap_mob` bigint(100) NOT NULL,
  `cap_email` varchar(45) NOT NULL,
  `cap_jdt` date NOT NULL,
  `cap_addr` varchar(45) NOT NULL,
  `role` varchar(100) NOT NULL,
  PRIMARY KEY (`cap_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `captain_detail`
--

INSERT INTO `captain_detail` (`cap_name`, `cap_id`, `cap_dob`, `cap_mob`, `cap_email`, `cap_jdt`, `cap_addr`, `role`) VALUES
('pravin', 1, '2015-12-02', 8087082478, 'pravin.sarode301@gmail.com', '2015-12-07', 'dfshgddsfshdg', 'captain'),
('pras', 2, '2015-12-31', 8087082478, 'kk@gmail.com', '2015-12-13', 'ddsfgsd', 'captain'),
('ramram', 3, '2016-01-15', 65656556556, 'pravin.sarode301@gmail.com', '2016-01-22', 'sfdgs', 'captain');

-- --------------------------------------------------------

--
-- Table structure for table `item_detail`
--

CREATE TABLE IF NOT EXISTS `item_detail` (
  `item_name` varchar(45) NOT NULL,
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_amount` varchar(45) NOT NULL,
  `item_add_dt` varchar(100) NOT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `item_detail`
--

INSERT INTO `item_detail` (`item_name`, `item_id`, `item_amount`, `item_add_dt`) VALUES
('ladu', 3, '50', '2015-10-23 00:00:00'),
('samosa', 11, '14', '2015-10-05 00:00:00'),
('poli-bhaji', 12, '12', '2015-10-19 00:00:00'),
('chicken', 13, '1000', '2015-10-27 00:00:00'),
('puri', 14, '5', '2015-10-10 00:00:00'),
('kande-pohe', 15, '67', '2015-10-06 00:00:00'),
('baatata ', 16, '78', '2015-10-07 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `login_table`
--

CREATE TABLE IF NOT EXISTS `login_table` (
  `user_name` varchar(100) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `role` varchar(100) NOT NULL,
  `Id` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login_table`
--

INSERT INTO `login_table` (`user_name`, `email`, `password`, `role`, `Id`) VALUES
('admin', 'kk@gmail.com', '09876', 'Admin', 0),
('mayur', 'nk@gmail.com', 'nk', 'Kitchen staff', 0),
('pravin', 'pravtej@gm.com', '222', 'captain', 8);

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE IF NOT EXISTS `order_detail` (
  `c_date` date NOT NULL,
  `no` int(100) NOT NULL AUTO_INCREMENT,
  `order_no` int(100) NOT NULL,
  `table_no` int(5) unsigned NOT NULL,
  `ord_menu` varchar(45) NOT NULL,
  `price` int(3) unsigned NOT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `captain_name` varchar(100) NOT NULL,
  `table_status` int(10) NOT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=746 ;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`c_date`, `no`, `order_no`, `table_no`, `ord_menu`, `price`, `quantity`, `customer_name`, `captain_name`, `table_status`) VALUES
('2015-12-15', 696, 3, 6, 'ladu', 0, 8, 'ashish', 'pravin', 1),
('2015-12-15', 697, 3, 6, 'puri', 0, 2, 'ashish', 'pravin', 1),
('2015-12-15', 698, 3, 6, 'samosa', 0, 3, 'ashish', 'pravin', 1),
('2015-12-15', 699, 3, 6, 'chicken', 0, 8, 'ashish', 'pravin', 1),
('2015-12-15', 700, 3, 6, 'poli-bhaji', 0, 2, 'ashish', 'pravin', 1),
('2015-12-15', 701, 3, 6, 'chicken', 0, 4, 'ashish', 'pravin', 1),
('2015-12-15', 702, 3, 6, 'ladu', 0, 1, 'ashish', 'pravin', 1),
('2015-12-15', 703, 3, 6, 'ladu', 0, 10, 'ashish', 'pravin', 1),
('2015-12-15', 704, 3, 6, 'ladu', 0, 100, 'ashish', 'pravin', 1),
('2015-12-15', 705, 3, 6, 'ladu', 0, 1000, 'ashish', 'pravin', 1),
('2015-12-15', 706, 3, 6, 'poli-bhaji', 0, 40, 'ashish', 'pravin', 1),
('2015-12-15', 707, 3, 6, 'kande-pohe', 0, 39, 'ashish', 'pravin', 1),
('2015-12-15', 708, 3, 6, 'chicken', 0, 55, 'ashish', 'pravin', 1),
('2015-12-15', 709, 3, 6, 'poli-bhaji', 0, 5, 'ashish', 'pravin', 1),
('2015-12-13', 740, 2, 5, 'samosa', 0, 7, 'pravin', 'pras', 1),
('2015-12-13', 741, 2, 5, 'chicken', 0, 3, 'pravin', 'pras', 1),
('2015-12-13', 742, 2, 5, 'kande-pohe', 0, 4, 'pravin', 'pras', 1),
('2015-12-13', 743, 2, 5, 'poli-bhaji', 0, 3, 'pravin', 'pras', 1),
('2015-12-13', 744, 2, 5, 'poli-bhaji', 0, 10, 'pravin', 'pras', 1),
('2015-12-13', 745, 2, 5, 'chicken', 0, 100, 'pravin', 'pras', 1);

-- --------------------------------------------------------

--
-- Table structure for table `table_eight`
--

CREATE TABLE IF NOT EXISTS `table_eight` (
  `table_entry_no` int(100) NOT NULL AUTO_INCREMENT,
  `order_no` int(10) NOT NULL,
  `cap_name` varchar(100) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `order_menu_item` varchar(100) NOT NULL,
  `quantity` int(100) NOT NULL,
  PRIMARY KEY (`table_entry_no`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `table_eight`
--


-- --------------------------------------------------------

--
-- Table structure for table `table_five`
--

CREATE TABLE IF NOT EXISTS `table_five` (
  `table_entry_no` int(100) NOT NULL AUTO_INCREMENT,
  `order_no` int(10) NOT NULL,
  `cap_name` varchar(100) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `order_menu_item` varchar(100) NOT NULL,
  `quantity` int(100) NOT NULL,
  PRIMARY KEY (`table_entry_no`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=138 ;

--
-- Dumping data for table `table_five`
--

INSERT INTO `table_five` (`table_entry_no`, `order_no`, `cap_name`, `customer_name`, `order_menu_item`, `quantity`) VALUES
(137, 2, 'pras', 'pravin', 'chicken', 100),
(136, 2, 'pras', 'pravin', 'poli-bhaji', 10),
(135, 2, 'pras', 'pravin', 'poli-bhaji', 3),
(134, 2, 'pras', 'pravin', 'kande-pohe', 4),
(133, 2, 'pras', 'pravin', 'chicken', 3),
(132, 2, 'pras', 'pravin', 'samosa', 7);

-- --------------------------------------------------------

--
-- Table structure for table `table_four`
--

CREATE TABLE IF NOT EXISTS `table_four` (
  `table_entry_no` int(100) NOT NULL AUTO_INCREMENT,
  `order_no` int(10) NOT NULL,
  `cap_name` varchar(100) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `order_menu_item` varchar(100) NOT NULL,
  `quantity` int(100) NOT NULL,
  PRIMARY KEY (`table_entry_no`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `table_four`
--


-- --------------------------------------------------------

--
-- Table structure for table `table_nine`
--

CREATE TABLE IF NOT EXISTS `table_nine` (
  `table_entry_no` int(100) NOT NULL AUTO_INCREMENT,
  `order_no` int(10) NOT NULL,
  `cap_name` varchar(100) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `order_menu_item` varchar(100) NOT NULL,
  `quantity` int(100) NOT NULL,
  PRIMARY KEY (`table_entry_no`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `table_nine`
--


-- --------------------------------------------------------

--
-- Table structure for table `table_one`
--

CREATE TABLE IF NOT EXISTS `table_one` (
  `table_entry_no` int(100) NOT NULL AUTO_INCREMENT,
  `order_no` int(10) NOT NULL,
  `cap_name` varchar(100) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `order_menu_item` varchar(100) NOT NULL,
  `quantity` int(100) NOT NULL,
  PRIMARY KEY (`table_entry_no`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=31 ;

--
-- Dumping data for table `table_one`
--


-- --------------------------------------------------------

--
-- Table structure for table `table_seven`
--

CREATE TABLE IF NOT EXISTS `table_seven` (
  `table_entry_no` int(100) unsigned NOT NULL AUTO_INCREMENT,
  `order_no` int(100) NOT NULL,
  `cap_name` varchar(45) NOT NULL,
  `customer_name` varchar(45) NOT NULL,
  `order_menu_item` varchar(45) NOT NULL,
  `quantity` int(10) unsigned NOT NULL,
  PRIMARY KEY (`table_entry_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `table_seven`
--


-- --------------------------------------------------------

--
-- Table structure for table `table_six`
--

CREATE TABLE IF NOT EXISTS `table_six` (
  `table_entry_no` int(100) NOT NULL AUTO_INCREMENT,
  `order_no` int(10) NOT NULL,
  `cap_name` varchar(100) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `order_menu_item` varchar(100) NOT NULL,
  `quantity` int(100) NOT NULL,
  PRIMARY KEY (`table_entry_no`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=505 ;

--
-- Dumping data for table `table_six`
--

INSERT INTO `table_six` (`table_entry_no`, `order_no`, `cap_name`, `customer_name`, `order_menu_item`, `quantity`) VALUES
(504, 3, 'pravin', 'ashish', 'poli-bhaji', 5),
(503, 3, 'pravin', 'ashish', 'chicken', 55),
(502, 3, 'pravin', 'ashish', 'kande-pohe', 39),
(501, 3, 'pravin', 'ashish', 'poli-bhaji', 40),
(500, 3, 'pravin', 'ashish', 'ladu', 1000),
(499, 3, 'pravin', 'ashish', 'ladu', 100),
(498, 3, 'pravin', 'ashish', 'ladu', 10),
(497, 3, 'pravin', 'ashish', 'ladu', 1),
(496, 3, 'pravin', 'ashish', 'chicken', 4),
(495, 3, 'pravin', 'ashish', 'poli-bhaji', 2),
(494, 3, 'pravin', 'ashish', 'chicken', 8),
(493, 3, 'pravin', 'ashish', 'samosa', 3),
(492, 3, 'pravin', 'ashish', 'puri', 2),
(491, 3, 'pravin', 'ashish', 'ladu', 8);

-- --------------------------------------------------------

--
-- Table structure for table `table_status`
--

CREATE TABLE IF NOT EXISTS `table_status` (
  `table_no` int(100) NOT NULL,
  `cureent_order` int(100) NOT NULL,
  `table_status` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `table_status`
--

INSERT INTO `table_status` (`table_no`, `cureent_order`, `table_status`) VALUES
(1, 0, '0'),
(2, 0, '0'),
(3, 0, '0'),
(4, 0, '0'),
(5, 2, '1'),
(6, 3, '1'),
(7, 0, '0'),
(8, 0, '0'),
(9, 0, '0'),
(10, 0, '0');

-- --------------------------------------------------------

--
-- Table structure for table `table_ten`
--

CREATE TABLE IF NOT EXISTS `table_ten` (
  `table_entry_no` int(100) NOT NULL AUTO_INCREMENT,
  `order_no` int(10) NOT NULL,
  `cap_name` varchar(100) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `order_menu_item` varchar(100) NOT NULL,
  `quantity` int(10) NOT NULL,
  PRIMARY KEY (`table_entry_no`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `table_ten`
--


-- --------------------------------------------------------

--
-- Table structure for table `table_three`
--

CREATE TABLE IF NOT EXISTS `table_three` (
  `table_entry_no` int(100) unsigned NOT NULL AUTO_INCREMENT,
  `order_no` int(100) NOT NULL,
  `cap_name` varchar(45) NOT NULL,
  `customer_name` varchar(45) NOT NULL,
  `order_menu_item` varchar(45) NOT NULL,
  `quantity` int(10) unsigned NOT NULL,
  PRIMARY KEY (`table_entry_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `table_three`
--


-- --------------------------------------------------------

--
-- Table structure for table `table_two`
--

CREATE TABLE IF NOT EXISTS `table_two` (
  `table_entry_no` int(100) NOT NULL AUTO_INCREMENT,
  `order_no` int(10) NOT NULL,
  `cap_name` varchar(100) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `order_menu_item` varchar(100) NOT NULL,
  `quantity` int(100) NOT NULL,
  PRIMARY KEY (`table_entry_no`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `table_two`
--


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
