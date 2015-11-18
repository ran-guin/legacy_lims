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
-- Table structure for table `LibraryPrimer`
--

DROP TABLE IF EXISTS `LibraryPrimer`;
CREATE TABLE `LibraryPrimer` (
  `LibraryPrimer_ID` int(11) NOT NULL auto_increment,
  `FK_Library__Name` varchar(40) default NULL,
  `FK_Primer__Name` varchar(40) default NULL,
  `Clones_Estimate` int(11) NOT NULL default '0',
  `TagsRequested` int(11) NOT NULL default '0',
  `Direction` enum('3prime','5prime','N/A','Unknown') default NULL,
  PRIMARY KEY  (`LibraryPrimer_ID`),
  UNIQUE KEY `combo` (`FK_Library__Name`,`FK_Primer__Name`),
  KEY `FK_Primer__Name` (`FK_Primer__Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

