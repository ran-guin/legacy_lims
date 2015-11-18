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
-- Table structure for table `SolexaAnalysis`
--

DROP TABLE IF EXISTS `SolexaAnalysis`;
CREATE TABLE `SolexaAnalysis` (
  `SolexaAnalysis_ID` int(11) NOT NULL auto_increment,
  `FK_Run__ID` int(11) NOT NULL default '0',
  `SolexaAnalysis_Type` enum('ELAND','DEFAULT','ELAND_EXTENDED','ELAND_PAIR') default 'DEFAULT',
  `Phasing` float default NULL,
  `Prephasing` float default NULL,
  `Read_Length` smallint(6) default NULL,
  `SolexaAnalysis_Started` datetime default NULL,
  `SolexaAnalysis_Finished` datetime default NULL,
  `Firecrest_Dir` varchar(50) default NULL,
  `Bustard_Dir` varchar(50) default NULL,
  `Gerald_Dir` varchar(50) default NULL,
  `End_Read_Type` enum('Single','PET 1','PET 2') default NULL,
  `Tiles_Analyzed` int(11) default NULL,
  `Raw_Clusters` int(11) default NULL,
  `PF_Clusters_Percent` float default NULL,
  `PF_Align_Percent` float default NULL,
  `PF_Alignment_Score` float default NULL,
  `PF_Error_Rate_Percent` float default NULL,
  `Lane_Yield_KB` int(11) default NULL,
  `PF_Clusters` int(11) default NULL,
  PRIMARY KEY  (`SolexaAnalysis_ID`),
  KEY `FKSolexaAnalysis_Run__ID` (`FK_Run__ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

