-- MySQL dump 10.9
--
-- Host: limsdev02    Database: aldente_init
-- ------------------------------------------------------
-- Server version	4.1.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `GrantApplication`
--

DROP TABLE IF EXISTS `GrantApplication`;
CREATE TABLE `GrantApplication` (
  `GrantApplication_ID` int(11) NOT NULL auto_increment,
  `Title` char(80) default NULL,
  `FKContact_Employee__ID` int(11) default NULL,
  `AppliedFor` float default NULL,
  `Duration` int(11) default NULL,
  `Duration_Units` enum('days','months','years') default NULL,
  `Grant_Type` char(40) default NULL,
  `ApplicationStatus` enum('Awarded','Declined','Applied') default NULL,
  `Award` float default NULL,
  `Currency` enum('US','Canadian') default NULL,
  `Application_Date` date default NULL,
  `Application_Number` int(11) default NULL,
  `Funding_Frequency` char(40) default NULL,
  PRIMARY KEY  (`GrantApplication_ID`),
  KEY `FKContact_Employee__ID` (`FKContact_Employee__ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

