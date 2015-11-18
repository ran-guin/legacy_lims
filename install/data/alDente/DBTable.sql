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
-- Table structure for table `DBTable`
--

DROP TABLE IF EXISTS `DBTable`;
CREATE TABLE `DBTable` (
  `DBTable_ID` int(11) NOT NULL AUTO_INCREMENT,
  `DBTable_Name` varchar(80) NOT NULL DEFAULT '',
  `DBTable_Description` text,
  `DBTable_Status` text,
  `Status_Last_Updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DBTable_Type` enum('General','Lab Object','Lab Process','Object Detail','Settings','Dynamic','DB Management','Application Specific','Class','Subclass','Lookup','Join','Imported','Manual Join') DEFAULT NULL,
  `DBTable_Title` varchar(80) NOT NULL DEFAULT '',
  `Scope` enum('Core','Lab','Plugin','Option','Custom') DEFAULT NULL,
  `Package_Name` varchar(40) DEFAULT NULL,
  `Records` int(11) NOT NULL DEFAULT '0',
  `FK_Package__ID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`DBTable_ID`),
  UNIQUE KEY `DBTable_Name` (`DBTable_Name`),
  UNIQUE KEY `name` (`DBTable_Name`),
  KEY `package` (`FK_Package__ID`)
) ENGINE=InnoDB AUTO_INCREMENT=393 DEFAULT CHARSET=latin1;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

