-- MySQL dump 10.9
--
-- Host: limsdev04    Database: skeleton
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
-- Table structure for table `DB_Login`
--

DROP TABLE IF EXISTS `DB_Login`;
CREATE TABLE `DB_Login` (
  `DB_Login_ID` int(11) NOT NULL AUTO_INCREMENT,
  `DB_User` char(40) NOT NULL DEFAULT '',
  `DB_Access_Level` enum('0','1','2','3','4','5') DEFAULT NULL,
  `DB_Login_Description` text,
  `FKProduction_DB_Access__ID` int(11) NOT NULL,
  `FKnonProduction_DB_Access__ID` int(11) NOT NULL,
  PRIMARY KEY (`DB_Login_ID`),
  KEY `Production_DB_Access` (`FKProduction_DB_Access__ID`),
  KEY `nonProduction_DB_Access` (`FKnonProduction_DB_Access__ID`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

