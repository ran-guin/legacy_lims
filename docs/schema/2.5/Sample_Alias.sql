-- MySQL dump 10.9
--
-- Host: lims02    Database: sequence
-- ------------------------------------------------------
-- Server version	4.1.20-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Sample_Alias`
--

DROP TABLE IF EXISTS `Sample_Alias`;
CREATE TABLE `Sample_Alias` (
  `Sample_Alias_ID` int(11) NOT NULL auto_increment,
  `FK_Sample__ID` int(11) NOT NULL default '0',
  `FKSource_Organization__ID` int(11) NOT NULL default '0',
  `Alias` varchar(40) default NULL,
  `Alias_Type` varchar(40) default NULL,
  PRIMARY KEY  (`Sample_Alias_ID`),
  UNIQUE KEY `spec` (`FK_Sample__ID`,`Alias_Type`,`Alias`),
  KEY `sample` (`FK_Sample__ID`),
  KEY `alias` (`Alias`),
  KEY `type` (`Alias_Type`),
  KEY `FKSource_Organization__ID` (`FKSource_Organization__ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

