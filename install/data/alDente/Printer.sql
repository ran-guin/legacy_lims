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
-- Table structure for table `Printer`
--

DROP TABLE IF EXISTS `Printer`;
CREATE TABLE `Printer` (
  `Printer_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Printer_Name` varchar(40) DEFAULT '',
  `Printer_DPI` int(11) NOT NULL DEFAULT '0',
  `Printer_Location` varchar(40) DEFAULT NULL,
  `Printer_Type` varchar(40) NOT NULL DEFAULT '',
  `Printer_Address` varchar(80) NOT NULL DEFAULT '',
  `Printer_Output` enum('text','ZPL','latex','OFF') NOT NULL DEFAULT 'ZPL',
  `FK_Equipment__ID` int(11) NOT NULL DEFAULT '0',
  `FK_Label_Format__ID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Printer_ID`),
  KEY `prnname` (`Printer_Name`),
  KEY `FK_Label_Format__ID` (`FK_Label_Format__ID`),
  KEY `FK_Equipment__ID` (`FK_Equipment__ID`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
