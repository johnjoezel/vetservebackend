-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 27, 2019 at 12:46 AM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vetserveph`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
CREATE TABLE IF NOT EXISTS `appointment` (
  `app_id` int(11) NOT NULL AUTO_INCREMENT,
  `app_datetime` datetime NOT NULL,
  `remarks` varchar(50) NOT NULL,
  `status` int(11) NOT NULL,
  `vet_id` int(11) NOT NULL,
  `petOwner_id` int(11) NOT NULL,
  PRIMARY KEY (`app_id`),
  KEY `vet_id` (`vet_id`),
  KEY `petOwner_id` (`petOwner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `clinic`
--

DROP TABLE IF EXISTS `clinic`;
CREATE TABLE IF NOT EXISTS `clinic` (
  `clinic_id` int(11) NOT NULL AUTO_INCREMENT,
  `clinic_name` varchar(100) NOT NULL,
  `clinic_address` varchar(50) NOT NULL,
  `clinic_hours` time NOT NULL,
  `owner_id` time NOT NULL,
  PRIMARY KEY (`clinic_id`),
  KEY `owner_id` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `clinic_owner`
--

DROP TABLE IF EXISTS `clinic_owner`;
CREATE TABLE IF NOT EXISTS `clinic_owner` (
  `owner_id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_username` varchar(25) NOT NULL,
  `owner_password` varchar(25) NOT NULL,
  `owner_firstname` varchar(50) NOT NULL,
  `owner_lastname` varchar(50) NOT NULL,
  `owner_mname` varchar(50) DEFAULT NULL,
  `owner_address` varchar(150) NOT NULL,
  `owner_contact` varchar(15) NOT NULL,
  PRIMARY KEY (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `clinic_services`
--

DROP TABLE IF EXISTS `clinic_services`;
CREATE TABLE IF NOT EXISTS `clinic_services` (
  `clinicService_id` int(11) NOT NULL AUTO_INCREMENT,
  `clinic_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  PRIMARY KEY (`clinicService_id`),
  KEY `clinic_id` (`clinic_id`),
  KEY `service_id` (`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
CREATE TABLE IF NOT EXISTS `feedback` (
  `feedback _id` int(11) NOT NULL AUTO_INCREMENT,
  `feedback_content` varchar(150) NOT NULL,
  `feedback_date` datetime NOT NULL,
  `petOwner_id` int(11) NOT NULL,
  PRIMARY KEY (`feedback _id`),
  KEY `petOwner_id` (`petOwner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `medical_record`
--

DROP TABLE IF EXISTS `medical_record`;
CREATE TABLE IF NOT EXISTS `medical_record` (
  `medRec_id` int(11) NOT NULL AUTO_INCREMENT,
  `pet_height` varchar(50) NOT NULL,
  `pet_weight` varchar(50) NOT NULL,
  `pet_temp` int(11) NOT NULL,
  `vet_id` int(11) NOT NULL,
  `pet_id` int(11) NOT NULL,
  PRIMARY KEY (`medRec_id`),
  UNIQUE KEY `vet_id` (`vet_id`),
  UNIQUE KEY `pet_id` (`pet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
CREATE TABLE IF NOT EXISTS `notification` (
  `notification_id` int(11) NOT NULL AUTO_INCREMENT,
  `app_id` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `notif_date` datetime NOT NULL,
  PRIMARY KEY (`notification_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE IF NOT EXISTS `payment` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_type` int(11) NOT NULL,
  `clinicService_id` int(11) NOT NULL,
  `petOwner_id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `clinicService_id` (`clinicService_id`),
  KEY `petOwner_id` (`petOwner_id`),
  KEY `owner_id` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pet`
--

DROP TABLE IF EXISTS `pet`;
CREATE TABLE IF NOT EXISTS `pet` (
  `pet _id` int(11) NOT NULL AUTO_INCREMENT,
  `pet_name` varchar(25) NOT NULL,
  `breed_name` varchar(100) NOT NULL,
  `pet_gender` varchar(10) NOT NULL,
  `pet_DOB` date NOT NULL,
  `pet_color` varchar(25) NOT NULL,
  `petOwner_id` int(11) NOT NULL,
  `petSpecies_id` int(11) NOT NULL,
  PRIMARY KEY (`pet _id`),
  KEY `petOwner_id` (`petOwner_id`),
  KEY `petType_id` (`petSpecies_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pet_owner`
--

DROP TABLE IF EXISTS `pet_owner`;
CREATE TABLE IF NOT EXISTS `pet_owner` (
  `petOwner_id` int(11) NOT NULL AUTO_INCREMENT,
  `petOwner_firstname` varchar(50) DEFAULT NULL,
  `petOwner_mname` varchar(50) DEFAULT NULL,
  `petOwner_lastname` varchar(50) DEFAULT NULL,
  `petOwner_dob` date DEFAULT NULL,
  `petOwner_age` tinyint(4) DEFAULT NULL,
  `petOwner_contact` varchar(15) DEFAULT NULL,
  `petOwner_address` varchar(100) DEFAULT NULL,
  `petOwner_email` varchar(50) DEFAULT NULL,
  `petOwner_username` varchar(25) DEFAULT NULL,
  `petOwner_password` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`petOwner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pet_owner`
--

INSERT INTO `pet_owner` (`petOwner_id`, `petOwner_firstname`, `petOwner_mname`, `petOwner_lastname`, `petOwner_dob`, `petOwner_age`, `petOwner_contact`, `petOwner_address`, `petOwner_email`, `petOwner_username`, `petOwner_password`) VALUES
(1, 'asdasd', 'asdasdasd', 'asdasdasd', '2019-07-01', 123, 'cvxvcxcvxvc', '', 'xcvxcvxcvcxv', 'cxczcxzc', 'vnbnvbnbn'),
(2, 'John Joezel', 'Rosales', 'Panugalinog', '2019-07-01', 123, '09865636563', '', 'johnjoezel@gmail.com', 'q', 'q'),
(3, 'Agnes', 'Bacusmo', 'Panugalinog', '2019-07-01', 123, '09999888043', '', 'agnes@cmcm.cm', 'agnespanugalinog', '11111aA'),
(4, 'Zerah Nissi', 'Tuada', 'Panugalinog', '2019-07-01', 123, '09685866885', '', 'zerah@bndnd.xm', 'zerahnissi', '11111aA'),
(5, 'yyyggv', 'hbbbbb', 'hbbbbbbh', '2019-07-01', 123, '09868685565', '', 'hshhshshj@ndnd.mj', 'johnjoezel123', '11111aA'),
(6, 'vvvggg', 'hdhdhdhhd', 'hdhdjxjjjxx', '2019-07-01', 123, '08689696865', '', 'gzgsgsgsg@xb.CNN', 'ffffffff', '11111aA'),
(7, 'johnsmsns', 'bSvchzhzz', 'bdbdbdjsj', '2019-07-01', 123, '555558888885', '', 'hahsshz@xnnx.cn', 'bsbzbzbxxj', '11111aA'),
(8, 'johnsmsns', 'bSvchzhzz', 'bdbdbdjsj', '2019-07-01', 123, '555558888885', '', 'hahsshz@xnnx.cn', 'bsbzbzbxxj', '11111aA'),
(9, 'johnsmsns', 'bSvchzhzz', 'bdbdbdjsj', '2019-07-01', 123, '555558888885', '', 'hahsshz@xnnx.cn', 'bsbzbzbxxj', '11111aA');

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
CREATE TABLE IF NOT EXISTS `rating` (
  `rating _id` int(11) NOT NULL AUTO_INCREMENT,
  `rating` varchar(150) NOT NULL,
  `vet_id` int(11) NOT NULL,
  PRIMARY KEY (`rating _id`),
  KEY `vet_id` (`vet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
CREATE TABLE IF NOT EXISTS `services` (
  `service_id` int(11) NOT NULL AUTO_INCREMENT,
  `service_name` varchar(50) NOT NULL,
  `service_rate` varchar(50) NOT NULL,
  PRIMARY KEY (`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `species`
--

DROP TABLE IF EXISTS `species`;
CREATE TABLE IF NOT EXISTS `species` (
  `species_id` int(11) NOT NULL AUTO_INCREMENT,
  `species_name` varchar(50) NOT NULL,
  PRIMARY KEY (`species_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `species`
--

INSERT INTO `species` (`species_id`, `species_name`) VALUES
(1, 'Dog'),
(2, 'Cat');

-- --------------------------------------------------------

--
-- Table structure for table `subscription`
--

DROP TABLE IF EXISTS `subscription`;
CREATE TABLE IF NOT EXISTS `subscription` (
  `sub_id` int(11) NOT NULL AUTO_INCREMENT,
  `subType_id` int(11) NOT NULL,
  `sub_startDate` datetime NOT NULL,
  `sub_endDate` datetime NOT NULL,
  `owner_id` int(11) NOT NULL,
  PRIMARY KEY (`sub_id`),
  KEY `owner_id` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `subscription_type`
--

DROP TABLE IF EXISTS `subscription_type`;
CREATE TABLE IF NOT EXISTS `subscription_type` (
  `subType_id` int(11) NOT NULL AUTO_INCREMENT,
  `subtype_desc` varchar(50) NOT NULL,
  PRIMARY KEY (`subType_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `transaction_history`
--

DROP TABLE IF EXISTS `transaction_history`;
CREATE TABLE IF NOT EXISTS `transaction_history` (
  `transactHis_id` int(11) NOT NULL AUTO_INCREMENT,
  `app_id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`transactHis_id`),
  KEY `app_id` (`app_id`),
  KEY `owner_id` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `treatment`
--

DROP TABLE IF EXISTS `treatment`;
CREATE TABLE IF NOT EXISTS `treatment` (
  `treatment_id` int(11) NOT NULL AUTO_INCREMENT,
  `treatment_date` date NOT NULL,
  `treatment_repeat` date NOT NULL,
  PRIMARY KEY (`treatment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `treatment_type`
--

DROP TABLE IF EXISTS `treatment_type`;
CREATE TABLE IF NOT EXISTS `treatment_type` (
  `treatmentType_id` int(11) NOT NULL AUTO_INCREMENT,
  `treatmentType_name` varchar(50) NOT NULL,
  `treatmentType_desc` varchar(50) NOT NULL,
  PRIMARY KEY (`treatmentType_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vaccination`
--

DROP TABLE IF EXISTS `vaccination`;
CREATE TABLE IF NOT EXISTS `vaccination` (
  `vaccine_id` int(11) NOT NULL AUTO_INCREMENT,
  `vaccine_date` date NOT NULL,
  `vaccine_repeat` date NOT NULL,
  `vacType_id` int(11) NOT NULL,
  `pet_id` int(11) NOT NULL,
  `medRec_id` int(11) NOT NULL,
  PRIMARY KEY (`vaccine_id`),
  KEY `vacType_id` (`vacType_id`),
  KEY `pet_id` (`pet_id`),
  KEY `medRec_id` (`medRec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vaccine_type`
--

DROP TABLE IF EXISTS `vaccine_type`;
CREATE TABLE IF NOT EXISTS `vaccine_type` (
  `vacType_id` int(11) NOT NULL AUTO_INCREMENT,
  `vacType_name` varchar(50) NOT NULL,
  `vacType_desc` varchar(50) NOT NULL,
  PRIMARY KEY (`vacType_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `veterinarian`
--

DROP TABLE IF EXISTS `veterinarian`;
CREATE TABLE IF NOT EXISTS `veterinarian` (
  `vet_id` int(11) NOT NULL AUTO_INCREMENT,
  `vet_username` varchar(25) NOT NULL,
  `vet_password` varchar(25) NOT NULL,
  `vet_firstname` varchar(50) NOT NULL,
  `vet_lastname` varchar(50) NOT NULL,
  `vet_mname` varchar(50) NOT NULL,
  `vet_address` varchar(100) NOT NULL,
  `vet_contact` varchar(15) NOT NULL,
  `clinic_id` int(11) NOT NULL,
  PRIMARY KEY (`vet_id`),
  KEY `clinic_id` (`clinic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `veterinarian`
--

INSERT INTO `veterinarian` (`vet_id`, `vet_username`, `vet_password`, `vet_firstname`, `vet_lastname`, `vet_mname`, `vet_address`, `vet_contact`, `clinic_id`) VALUES
(1, '1', '1', '1', '1', '1', '1', '1', 1);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pet`
--
ALTER TABLE `pet`
  ADD CONSTRAINT `pet_ibfk_1` FOREIGN KEY (`petOwner_id`) REFERENCES `pet_owner` (`petOwner_id`),
  ADD CONSTRAINT `pet_ibfk_2` FOREIGN KEY (`petSpecies_id`) REFERENCES `species` (`species_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
