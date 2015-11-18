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
-- Table structure for table `Concentrations`
--

DROP TABLE IF EXISTS `Concentrations`;
CREATE TABLE `Concentrations` (
  `Concentration_ID` int(10) unsigned NOT NULL auto_increment,
  `FK_ConcentrationRun__ID` int(10) unsigned NOT NULL default '0',
  `Well` char(3) default NULL,
  `Measurement` varchar(10) default NULL,
  `Units` varchar(15) default NULL,
  `Concentration` varchar(10) default NULL,
  `FK_Sample__ID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`Concentration_ID`),
  KEY `Measurement` (`Measurement`),
  KEY `Concentration` (`Concentration`),
  KEY `sample_id` (`FK_Sample__ID`),
  KEY `FK_ConcentrationRun__ID` (`FK_ConcentrationRun__ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

