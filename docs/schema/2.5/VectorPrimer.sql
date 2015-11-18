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
-- Table structure for table `VectorPrimer`
--

DROP TABLE IF EXISTS `VectorPrimer`;
CREATE TABLE `VectorPrimer` (
  `FK_Vector__Name` varchar(80) default NULL,
  `FK_Primer__Name` varchar(40) default NULL,
  `Direction` enum('3''','5''','N/A','3prime','5prime') default NULL,
  `VectorPrimer_ID` int(10) unsigned NOT NULL auto_increment,
  `FK_Vector__ID` int(11) NOT NULL default '0',
  `FK_Primer__ID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`VectorPrimer_ID`),
  UNIQUE KEY `combo` (`FK_Vector__Name`,`FK_Primer__Name`),
  KEY `direction` (`FK_Vector__Name`,`FK_Primer__Name`),
  KEY `FK_Primer__Name` (`FK_Primer__Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

