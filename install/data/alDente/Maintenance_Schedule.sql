-- MySQL dump 10.9
--
-- Host: limsdev04    Database: Core_Current
-- ------------------------------------------------------
-- Server version	5.5.10

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Maintenance_Schedule`
--

DROP TABLE IF EXISTS `Maintenance_Schedule`;
CREATE TABLE `Maintenance_Schedule` (
  `Maintenance_Schedule_ID` int(11) NOT NULL AUTO_INCREMENT,
  `FK_Maintenance_Process_Type__ID` int(11) NOT NULL DEFAULT '0',
  `FK_Equipment__ID` int(11) DEFAULT NULL,
  `Scheduled_Equipment_Type` char(20) DEFAULT NULL,
  `Scheduled_Frequency` int(11) DEFAULT NULL,
  `Notice_Frequency` int(11) DEFAULT '7',
  `Notice_Sent` date DEFAULT NULL,
  PRIMARY KEY (`Maintenance_Schedule_ID`),
  KEY `FK_Maintenance_Process_Type__ID` (`FK_Maintenance_Process_Type__ID`),
  KEY `FK_Equipment__ID` (`FK_Equipment__ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

