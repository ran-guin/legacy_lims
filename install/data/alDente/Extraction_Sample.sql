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
-- Table structure for table `Extraction_Sample`
--

DROP TABLE IF EXISTS `Extraction_Sample`;
CREATE TABLE `Extraction_Sample` (
  `Extraction_Sample_ID` int(11) NOT NULL AUTO_INCREMENT,
  `FK_Sample__ID` int(11) NOT NULL DEFAULT '0',
  `FK_Library__Name` char(6) DEFAULT NULL,
  `Plate_Number` int(11) DEFAULT NULL,
  `Volume` int(11) DEFAULT NULL,
  `FKOriginal_Plate__ID` int(11) DEFAULT NULL,
  `Extraction_Sample_Type` enum('DNA','RNA','Protein','Mixed','Amplicon','Clone','mRNA','Tissue','Cells','RNA - DNase Treated','cDNA','1st strand cDNA','Amplified cDNA','Ditag','Concatemer - Insert','Concatemer - Cloned','undefined') DEFAULT NULL,
  `Original_Well` char(3) DEFAULT NULL,
  PRIMARY KEY (`Extraction_Sample_ID`),
  KEY `sample` (`FK_Sample__ID`),
  KEY `plate` (`FKOriginal_Plate__ID`),
  KEY `library_name` (`FK_Library__Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

