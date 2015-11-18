-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Account`
--

DROP TABLE IF EXISTS `Account`;
CREATE TABLE `Account` (
  `Account_ID` int(11) NOT NULL default '0',
  `Account_Description` text,
  `Account_Type` text,
  `Account_Name` text,
  `Account_Dept` enum('Orders','Admin') default NULL,
  PRIMARY KEY  (`Account_ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Agilent_Assay`
--

DROP TABLE IF EXISTS `Agilent_Assay`;
CREATE TABLE `Agilent_Assay` (
  `Agilent_Assay_ID` int(11) NOT NULL auto_increment,
  `Agilent_Assay_Name` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`Agilent_Assay_ID`),
  KEY `name` (`Agilent_Assay_Name`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Antibiotic`
--

DROP TABLE IF EXISTS `Antibiotic`;
CREATE TABLE `Antibiotic` (
  `Antibiotic_ID` int(10) unsigned NOT NULL auto_increment,
  `Antibiotic_Name` varchar(40) default NULL,
  PRIMARY KEY  (`Antibiotic_ID`),
  UNIQUE KEY `Antibiotic_Name` (`Antibiotic_Name`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Attribute`
--

DROP TABLE IF EXISTS `Attribute`;
CREATE TABLE `Attribute` (
  `Attribute_ID` int(11) NOT NULL auto_increment,
  `Attribute_Name` varchar(40) default NULL,
  `Attribute_Format` varchar(40) default NULL,
  `Attribute_Type` varchar(40) default NULL,
  `FK_Grp__ID` int(11) NOT NULL default '0',
  `Inherited` enum('Yes','No') NOT NULL default 'No',
  `Attribute_Class` varchar(40) default NULL,
  PRIMARY KEY  (`Attribute_ID`),
  UNIQUE KEY `Attribute_Key` (`Attribute_Name`,`Attribute_Class`),
  KEY `grp` (`FK_Grp__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Band`
--

DROP TABLE IF EXISTS `Band`;
CREATE TABLE `Band` (
  `Band_ID` int(11) unsigned NOT NULL auto_increment,
  `Band_Size` int(10) unsigned default NULL,
  `Band_Number` int(4) unsigned default NULL,
  `FKParent_Band__ID` int(11) default NULL,
  `FK_Lane__ID` int(11) unsigned default NULL,
  `Band_Intensity` enum('Weak','Medium','Strong') default NULL,
  `Band_Type` enum('Insert','Vector') default NULL,
  PRIMARY KEY  (`Band_ID`),
  KEY `FKParent_Band__ID` (`FKParent_Band__ID`),
  KEY `lane` (`FK_Lane__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Barcode_Label`
--

DROP TABLE IF EXISTS `Barcode_Label`;
CREATE TABLE `Barcode_Label` (
  `Barcode_Label_ID` int(11) NOT NULL auto_increment,
  `Barcode_Label_Name` char(40) default NULL,
  `Label_Height` float default NULL,
  `Label_Width` float default NULL,
  `Zero_X` int(11) default NULL,
  `Zero_Y` int(11) default NULL,
  `Top` int(11) default NULL,
  `FK_Setting__ID` int(11) NOT NULL default '0',
  `Label_Descriptive_Name` char(40) NOT NULL default '',
  `Barcode_Label_Type` enum('plate','mulplate','solution','equipment','source','employee') default NULL,
  PRIMARY KEY  (`Barcode_Label_ID`),
  KEY `setting` (`FK_Setting__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Box`
--

DROP TABLE IF EXISTS `Box`;
CREATE TABLE `Box` (
  `Box_ID` int(11) NOT NULL auto_increment,
  `Box_Opened` date default NULL,
  `FK_Rack__ID` int(11) default NULL,
  `Box_Number` int(11) default NULL,
  `Box_Number_in_Batch` int(11) default NULL,
  `FK_Stock__ID` int(11) default NULL,
  `FKParent_Box__ID` int(11) default NULL,
  `Box_Serial_Number` text,
  `Box_Type` enum('Box','Kit','Supplies') NOT NULL default 'Box',
  `Box_Expiry` date default NULL,
  PRIMARY KEY  (`Box_ID`),
  KEY `stock` (`FK_Stock__ID`),
  KEY `FK_Rack__ID` (`FK_Rack__ID`),
  KEY `FKParent_Box__ID` (`FKParent_Box__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Branch`
--

DROP TABLE IF EXISTS `Branch`;
CREATE TABLE `Branch` (
  `Branch_ID` int(11) NOT NULL auto_increment,
  `Branch_Name` varchar(5) default NULL,
  `Branch_Description` text,
  `Object_ID` int(11) NOT NULL default '0',
  `FK_Object_Class__ID` int(11) NOT NULL default '0',
  `Branch_Condition` text NOT NULL,
  PRIMARY KEY  (`Branch_ID`)
) TYPE=MyISAM;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `cDNA_Library`
--

DROP TABLE IF EXISTS `cDNA_Library`;
CREATE TABLE `cDNA_Library` (
  `cDNA_Library_ID` int(11) NOT NULL auto_increment,
  `FK_Sequencing_Library__ID` int(11) NOT NULL default '0',
  `5Prime_Insert_Site_Enzyme` varchar(40) NOT NULL default '',
  `3Prime_Insert_Site_Enzyme` varchar(40) NOT NULL default '',
  `Blue_White_Selection` enum('Yes','No') NOT NULL default 'Yes',
  `FK3PrimeInsert_Restriction_Site__ID` int(11) default NULL,
  `FK5PrimeInsert_Restriction_Site__ID` int(11) default NULL,
  PRIMARY KEY  (`cDNA_Library_ID`),
  KEY `lib_id` (`FK_Sequencing_Library__ID`),
  KEY `FK3PrimeInsert_Restriction_Site__ID` (`FK3PrimeInsert_Restriction_Site__ID`),
  KEY `FK5PrimeInsert_Restriction_Site__ID` (`FK5PrimeInsert_Restriction_Site__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Change_History`
--

DROP TABLE IF EXISTS `Change_History`;
CREATE TABLE `Change_History` (
  `Change_History_ID` int(11) NOT NULL auto_increment,
  `FK_DBField__ID` int(11) NOT NULL default '0',
  `Old_Value` varchar(40) default NULL,
  `New_Value` varchar(40) default NULL,
  `FK_Employee__ID` int(11) NOT NULL default '0',
  `Modified_Date` datetime NOT NULL default '0000-00-00 00:00:00',
  `Record_ID` varchar(40) NOT NULL default '',
  `Comment` text,
  PRIMARY KEY  (`Change_History_ID`),
  KEY `FK_DBField__ID` (`FK_DBField__ID`),
  KEY `FK_Employee__ID` (`FK_Employee__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Chemistry_Code`
--

DROP TABLE IF EXISTS `Chemistry_Code`;
CREATE TABLE `Chemistry_Code` (
  `Chemistry_Code_Name` varchar(5) NOT NULL default '',
  `Chemistry_Description` text NOT NULL,
  `FK_Primer__Name` varchar(40) default NULL,
  `Terminator` enum('None','ET','Big Dye') default NULL,
  `Dye` enum('N/A','term') default NULL,
  PRIMARY KEY  (`Chemistry_Code_Name`),
  UNIQUE KEY `code` (`FK_Primer__Name`,`Terminator`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Child_Ordered_Procedure`
--

DROP TABLE IF EXISTS `Child_Ordered_Procedure`;
CREATE TABLE `Child_Ordered_Procedure` (
  `Child_Ordered_Procedure_ID` int(11) NOT NULL auto_increment,
  `FKParent_Ordered_Procedure__ID` int(11) NOT NULL default '0',
  `FKChild_Ordered_Procedure__ID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`Child_Ordered_Procedure_ID`),
  KEY `FKParent_Procedure__ID` (`FKParent_Ordered_Procedure__ID`),
  KEY `FKChild_Procedure__ID` (`FKChild_Ordered_Procedure__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Clone_Alias`
--

DROP TABLE IF EXISTS `Clone_Alias`;
CREATE TABLE `Clone_Alias` (
  `Clone_Alias_ID` int(11) NOT NULL auto_increment,
  `FK_Clone_Sample__ID` int(11) NOT NULL default '0',
  `FKSource_Organization__ID` int(11) default NULL,
  `Source` char(80) default NULL,
  `Alias` char(80) default NULL,
  `Alias_Type` enum('Primary','Secondary') default NULL,
  PRIMARY KEY  (`Clone_Alias_ID`),
  KEY `name` (`Alias`),
  KEY `source` (`Source`),
  KEY `organization` (`FKSource_Organization__ID`),
  KEY `clone` (`FK_Clone_Sample__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Clone_Details`
--

DROP TABLE IF EXISTS `Clone_Details`;
CREATE TABLE `Clone_Details` (
  `Clone_Details_ID` int(11) NOT NULL auto_increment,
  `FK_Clone_Sample__ID` int(11) NOT NULL default '0',
  `Clone_Comments` text,
  `PolyA_Tail` int(11) default NULL,
  `Chimerism_check_with_ESTs` enum('no','yes','warning','single EST match') default NULL,
  `Score` int(11) default NULL,
  `5Prime_found` tinyint(4) default NULL,
  `Genes_Protein` text,
  `Incyte_Match` int(11) default NULL,
  `PolyA_Signal` int(11) default NULL,
  `Clone_Vector` text,
  `Genbank_ID` text,
  `Lukas_Passed` int(11) default NULL,
  `Size_Estimate` int(11) default NULL,
  `Size_StdDev` int(11) default NULL,
  PRIMARY KEY  (`Clone_Details_ID`),
  UNIQUE KEY `clone` (`FK_Clone_Sample__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Clone_Sample`
--

DROP TABLE IF EXISTS `Clone_Sample`;
CREATE TABLE `Clone_Sample` (
  `Clone_Sample_ID` int(11) NOT NULL auto_increment,
  `FK_Sample__ID` int(11) NOT NULL default '0',
  `FK_Library__Name` char(5) default NULL,
  `Library_Plate_Number` int(11) default NULL,
  `Original_Quadrant` char(2) default NULL,
  `Original_Well` char(3) default NULL,
  `FKOriginal_Plate__ID` int(11) default NULL,
  PRIMARY KEY  (`Clone_Sample_ID`),
  KEY `sample` (`FK_Sample__ID`),
  KEY `plate` (`FKOriginal_Plate__ID`,`Original_Well`),
  KEY `lib` (`FK_Library__Name`,`Library_Plate_Number`,`Original_Quadrant`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Clone_Sequence`
--

DROP TABLE IF EXISTS `Clone_Sequence`;
CREATE TABLE `Clone_Sequence` (
  `FK_Run__ID` int(11) default NULL,
  `Sequence` text NOT NULL,
  `Sequence_Scores` blob NOT NULL,
  `Quality_Left` smallint(6) NOT NULL default '-2',
  `Vector_Quality` smallint(6) NOT NULL default '-2',
  `Vector_Total` smallint(6) NOT NULL default '-2',
  `Well` char(3) NOT NULL default '',
  `Phred_Histogram` varchar(200) NOT NULL default '',
  `Vector_Left` smallint(6) NOT NULL default '-2',
  `Vector_Right` smallint(6) NOT NULL default '-2',
  `Sequence_Length` smallint(6) NOT NULL default '-2',
  `Quality_Histogram` varchar(200) NOT NULL default '',
  `Quality_Length` smallint(6) NOT NULL default '-2',
  `Clone_Sequence_Comments` varchar(255) NOT NULL default '',
  `FK_Note__ID` tinyint(4) default NULL,
  `Growth` enum('OK','Slow Grow','No Grow','Unused','Empty','Problematic') default NULL,
  `Test_Run_Flag` tinyint(4) NOT NULL default '0',
  `Capillary` char(3) NOT NULL default '',
  `Clone_Sequence_ID` int(11) NOT NULL auto_increment,
  `Read_Error` enum('trace data missing','Empty Read','Analysis Aborted') default NULL,
  `Read_Warning` set('Vector Only','Vector Segment','Recurring String','Contamination','Poor Quality') default NULL,
  `FK_Sample__ID` int(11) NOT NULL default '0',
  `Peak_Area_Ratio` float(6,5) NOT NULL default '0.00000',
  PRIMARY KEY  (`Clone_Sequence_ID`),
  KEY `growth` (`Growth`),
  KEY `warnings` (`FK_Note__ID`),
  KEY `warning` (`Read_Warning`),
  KEY `clone` (`FK_Sample__ID`),
  KEY `seq_read` (`FK_Run__ID`,`Well`),
  KEY `length` (`Sequence_Length`)
) TYPE=MyISAM MAX_ROWS=4294967295 AVG_ROW_LENGTH=2448;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Clone_Source`
--

DROP TABLE IF EXISTS `Clone_Source`;
CREATE TABLE `Clone_Source` (
  `Clone_Source_ID` int(11) NOT NULL auto_increment,
  `Source_Description` varchar(40) default NULL,
  `FK_Clone_Sample__ID` int(11) NOT NULL default '0',
  `FK_Plate__ID` int(11) default NULL,
  `Clone_Quadrant` enum('a','b','c','d') default NULL,
  `Clone_Well` char(3) default NULL,
  `Well_384` char(3) default NULL,
  `FKSource_Organization__ID` int(11) default NULL,
  `Source_Name` varchar(40) default NULL,
  `Source_Comments` text,
  `Source_Library_ID` varchar(40) default NULL,
  `Source_Collection` varchar(40) default NULL,
  `Source_Library_Name` varchar(40) default NULL,
  `Source_Row` varchar(4) NOT NULL default '',
  `Source_Col` varchar(4) NOT NULL default '',
  `Source_5Prime_Site` text,
  `Source_Plate` int(11) default NULL,
  `Source_3Prime_Site` text,
  `Source_Vector` varchar(40) default NULL,
  `Source_Score` int(11) default NULL,
  `3prime_tag` varchar(40) default NULL,
  `5prime_tag` varchar(40) default NULL,
  `Source_Clone_Name` varchar(40) default NULL,
  `Source_Clone_Name_Type` varchar(40) default NULL,
  PRIMARY KEY  (`Clone_Source_ID`),
  KEY `clonesource_plate` (`FK_Plate__ID`),
  KEY `clonesource_clone` (`FK_Clone_Sample__ID`),
  KEY `clone` (`FK_Clone_Sample__ID`),
  KEY `name` (`Source_Name`),
  KEY `library` (`Source_Library_Name`),
  KEY `plate` (`Source_Plate`),
  KEY `well` (`Source_Collection`,`Source_Plate`,`Source_Row`,`Source_Col`),
  KEY `source_org_id` (`FKSource_Organization__ID`)
) TYPE=InnoDB;


-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Collaboration`
--

DROP TABLE IF EXISTS `Collaboration`;
CREATE TABLE `Collaboration` (
  `FK_Project__ID` int(11) default NULL,
  `Collaboration_ID` int(11) NOT NULL auto_increment,
  `FK_Contact__ID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`Collaboration_ID`),
  KEY `FK_Project__ID` (`FK_Project__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Communication`
--

DROP TABLE IF EXISTS `Communication`;
CREATE TABLE `Communication` (
  `Communication_ID` int(11) NOT NULL auto_increment,
  `FK_Contact__ID` int(11) default NULL,
  `FK_Organization__ID` int(11) default NULL,
  `Communication_Description` text,
  `Communication_Date` date default NULL,
  `FK_Employee__ID` int(11) default NULL,
  PRIMARY KEY  (`Communication_ID`),
  KEY `FK_Contact__ID` (`FK_Contact__ID`),
  KEY `FK_Organization__ID` (`FK_Organization__ID`),
  KEY `FK_Employee__ID` (`FK_Employee__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `ConcentrationRun`
--

DROP TABLE IF EXISTS `ConcentrationRun`;
CREATE TABLE `ConcentrationRun` (
  `ConcentrationRun_ID` int(10) unsigned NOT NULL auto_increment,
  `FK_Plate__ID` int(10) unsigned NOT NULL default '0',
  `FK_Equipment__ID` int(10) unsigned NOT NULL default '0',
  `DateTime` datetime NOT NULL default '0000-00-00 00:00:00',
  `CalibrationFunction` text NOT NULL,
  PRIMARY KEY  (`ConcentrationRun_ID`),
  KEY `plate` (`FK_Plate__ID`),
  KEY `equipment_id` (`FK_Equipment__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

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
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Contact`
--

DROP TABLE IF EXISTS `Contact`;
CREATE TABLE `Contact` (
  `Contact_ID` int(11) NOT NULL auto_increment,
  `Contact_Name` text,
  `Position` text,
  `FK_Organization__ID` int(11) default NULL,
  `Contact_Phone` text,
  `Contact_Email` text,
  `Contact_Type` enum('Collaborator','Maintenance','Technical Support','Sales','Academic') default NULL,
  `Contact_Status` enum('Active','Old','Basic') default NULL,
  `Contact_Notes` text,
  `Contact_Fax` text,
  `First_Name` text,
  `Middle_Name` text,
  `Last_Name` text,
  `Category` enum('Collaborator','Maintenance','Technical Support','Sales','Academic') default NULL,
  `Home_Phone` text,
  `Work_Phone` text,
  `Pager` text,
  `Fax` text,
  `Mobile` text,
  `Other_Phone` text,
  `Primary_Location` enum('home','work') default NULL,
  `Home_Address` text,
  `Home_City` text,
  `Home_County` text,
  `Home_Postcode` text,
  `Home_Country` text,
  `Work_Address` text,
  `Work_City` text,
  `Work_County` text,
  `Work_Postcode` text,
  `Work_Country` text,
  `Email` text,
  `Personal_Website` text,
  `Business_Website` text,
  `Alternate_Email_1` text,
  `Alternate_Email_2` text,
  `Birthday` date default NULL,
  `Anniversary` date default NULL,
  `Comments` text,
  `Canonical_Name` varchar(40) NOT NULL default '',
  PRIMARY KEY  (`Contact_ID`),
  KEY `FK_Organization__ID` (`FK_Organization__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Contaminant`
--

DROP TABLE IF EXISTS `Contaminant`;
CREATE TABLE `Contaminant` (
  `Contaminant_ID` int(11) NOT NULL auto_increment,
  `Well` char(3) default NULL,
  `FK_Run__ID` int(11) default NULL,
  `Detection_Date` date default NULL,
  `E_value` float unsigned default NULL,
  `Score` int(11) default NULL,
  `FK_Contamination__ID` int(11) default NULL,
  PRIMARY KEY  (`Contaminant_ID`),
  KEY `run` (`FK_Run__ID`),
  KEY `FK_Contamination__ID` (`FK_Contamination__ID`)
) TYPE=MyISAM;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Contamination`
--

DROP TABLE IF EXISTS `Contamination`;
CREATE TABLE `Contamination` (
  `Contamination_ID` int(11) NOT NULL auto_increment,
  `Contamination_Name` text,
  `Contamination_Description` text,
  `Contamination_Alias` text,
  PRIMARY KEY  (`Contamination_ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Cross_Match`
--

DROP TABLE IF EXISTS `Cross_Match`;
CREATE TABLE `Cross_Match` (
  `FK_Run__ID` int(11) default NULL,
  `Well` char(3) default NULL,
  `Match_Name` char(80) default NULL,
  `Match_Start` int(11) default NULL,
  `Match_Stop` int(11) default NULL,
  `Cross_Match_Date` date default NULL,
  `Cross_Match_ID` int(11) NOT NULL auto_increment,
  `Match_Direction` enum('','C') default NULL,
  PRIMARY KEY  (`Cross_Match_ID`),
  KEY `well` (`FK_Run__ID`,`Well`)
) TYPE=MyISAM;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `DBField`
--

DROP TABLE IF EXISTS `DBField`;
CREATE TABLE `DBField` (
  `DBField_ID` int(11) NOT NULL auto_increment,
  `Field_Description` text NOT NULL,
  `Field_Table` text NOT NULL,
  `Prompt` varchar(255) NOT NULL default '',
  `Field_Alias` varchar(255) NOT NULL default '',
  `Field_Options` set('Hidden','Mandatory','Primary','Unique','NewLink','ViewLink','ListLink','Searchable') default NULL,
  `Field_Reference` varchar(255) NOT NULL default '',
  `Field_Order` int(11) NOT NULL default '0',
  `Field_Name` varchar(255) NOT NULL default '',
  `Field_Type` varchar(255) NOT NULL default '',
  `Field_Index` varchar(255) NOT NULL default '',
  `NULL_ok` enum('NO','YES') NOT NULL default 'YES',
  `Field_Default` varchar(255) NOT NULL default '',
  `Field_Size` tinyint(4) default '20',
  `Field_Format` varchar(80) default NULL,
  `FK_DBTable__ID` int(11) default NULL,
  `Foreign_Key` varchar(255) default NULL,
  `DBField_Notes` text,
  `Editable` enum('yes','no') default 'yes',
  `Tracked` enum('yes','no') default 'no',
  PRIMARY KEY  (`DBField_ID`),
  UNIQUE KEY `tblfld` (`FK_DBTable__ID`,`Field_Name`),
  UNIQUE KEY `field_name` (`Field_Name`,`FK_DBTable__ID`),
  KEY `fld` (`Field_Name`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `DB_Form`
--

DROP TABLE IF EXISTS `DB_Form`;
CREATE TABLE `DB_Form` (
  `DB_Form_ID` int(11) NOT NULL auto_increment,
  `Form_Table` varchar(80) NOT NULL default '',
  `Form_Order` int(2) default '1',
  `Min_Records` int(2) NOT NULL default '1',
  `Max_Records` int(2) NOT NULL default '1',
  `FKParent_DB_Form__ID` int(11) default NULL,
  `Parent_Field` varchar(80) default NULL,
  `Parent_Value` varchar(200) default NULL,
  `Finish` int(11) default '0',
  `Class` varchar(40) default NULL,
  PRIMARY KEY  (`DB_Form_ID`),
  KEY `FKParent_DB_Form__ID` (`FKParent_DB_Form__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `DB_Login`
--

DROP TABLE IF EXISTS `DB_Login`;
CREATE TABLE `DB_Login` (
  `DB_Login_ID` int(11) NOT NULL auto_increment,
  `FK_Employee__ID` int(11) NOT NULL default '0',
  `DB_User` char(40) NOT NULL default '',
  PRIMARY KEY  (`DB_Login_ID`),
  KEY `FK_Employee__ID` (`FK_Employee__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `DBTable`
--

DROP TABLE IF EXISTS `DBTable`;
CREATE TABLE `DBTable` (
  `DBTable_ID` int(11) NOT NULL auto_increment,
  `DBTable_Name` varchar(80) NOT NULL default '',
  `DBTable_Description` text,
  `DBTable_Status` text,
  `Status_Last_Updated` datetime NOT NULL default '0000-00-00 00:00:00',
  `DBTable_Type` enum('General','Lab Object','Lab Process','Object Detail','Settings','Dynamic','DB Management','Application Specific','Lookup') default NULL,
  `DBTable_Title` varchar(80) NOT NULL default '',
  PRIMARY KEY  (`DBTable_ID`),
  UNIQUE KEY `DBTable_Name` (`DBTable_Name`),
  UNIQUE KEY `name` (`DBTable_Name`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `DepartmentSetting`
--

DROP TABLE IF EXISTS `DepartmentSetting`;
CREATE TABLE `DepartmentSetting` (
  `DepartmentSetting_ID` int(11) NOT NULL auto_increment,
  `FK_Setting__ID` int(11) default NULL,
  `FK_Department__ID` int(11) default NULL,
  `Setting_Value` char(40) default NULL,
  PRIMARY KEY  (`DepartmentSetting_ID`),
  KEY `FK_Department__ID` (`FK_Department__ID`),
  KEY `FK_Setting__ID` (`FK_Setting__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Department`
--

DROP TABLE IF EXISTS `Department`;
CREATE TABLE `Department` (
  `Department_ID` int(11) NOT NULL auto_increment,
  `Department_Name` char(40) default NULL,
  `Department_Status` enum('Active','Inactive') default NULL,
  PRIMARY KEY  (`Department_ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Dye_Chemistry`
--

DROP TABLE IF EXISTS `Dye_Chemistry`;
CREATE TABLE `Dye_Chemistry` (
  `Dye_Chemistry_ID` int(11) NOT NULL auto_increment,
  `Terminator` varchar(20) default NULL,
  `Chemistry_Version` int(11) default NULL,
  `Mobility_Version` int(11) default NULL,
  `Mob_File` varchar(255) default NULL,
  `Dye_Set` varchar(5) default NULL,
  PRIMARY KEY  (`Dye_Chemistry_ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `EmployeeSetting`
--

DROP TABLE IF EXISTS `EmployeeSetting`;
CREATE TABLE `EmployeeSetting` (
  `EmployeeSetting_ID` int(11) NOT NULL auto_increment,
  `FK_Setting__ID` int(11) default NULL,
  `FK_Employee__ID` int(11) default NULL,
  `Setting_Value` char(40) default NULL,
  PRIMARY KEY  (`EmployeeSetting_ID`),
  KEY `FK_Employee__ID` (`FK_Employee__ID`),
  KEY `FK_Setting__ID` (`FK_Setting__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
CREATE TABLE `Employee` (
  `Employee_ID` int(4) NOT NULL auto_increment,
  `Employee_Name` varchar(80) default NULL,
  `Employee_Start_Date` date default NULL,
  `Initials` varchar(4) default NULL,
  `Email_Address` text,
  `Employee_FullName` text,
  `Position` text,
  `Employee_Status` enum('Active','Inactive','Old') default NULL,
  `Permissions` set('R','W','U','D','S','P','A') default NULL,
  `IP_Address` text,
  `Password` varchar(80) default '78a302dd267f6044',
  `Machine_Name` varchar(20) default NULL,
  `Department` enum('Receiving','Administration','Sequencing','Mapping','BioInformatics','Gene Expression','None') default NULL,
  `FK_Department__ID` int(11) default NULL,
  PRIMARY KEY  (`Employee_ID`),
  UNIQUE KEY `initials` (`Initials`),
  UNIQUE KEY `name` (`Employee_Name`),
  KEY `FK_Department__ID` (`FK_Department__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Enzyme`
--

DROP TABLE IF EXISTS `Enzyme`;
CREATE TABLE `Enzyme` (
  `Enzyme_ID` int(11) NOT NULL auto_increment,
  `Enzyme_Name` varchar(8) NOT NULL default '',
  `Enzyme_Seqeunce` text,
  PRIMARY KEY  (`Enzyme_ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Equipment`
--

DROP TABLE IF EXISTS `Equipment`;
CREATE TABLE `Equipment` (
  `Equipment_ID` int(4) NOT NULL auto_increment,
  `Equipment_Name` varchar(40) default NULL,
  `Equipment_Type` enum('','Sequencer','Centrifuge','Thermal Cycler','Freezer','Liquid Dispenser','Platform Shaker','Incubator','Colony Picker','Plate Reader','Storage','Power Supply','Miscellaneous','Genechip Scanner','Gel Comb','Gel Box','Fluorimager') default NULL,
  `Equipment_Comments` text,
  `Model` text NOT NULL,
  `Serial_Number` varchar(80) default NULL,
  `Acquired` date default NULL,
  `Equipment_Cost` float default NULL,
  `Equipment_Number` int(11) default NULL,
  `Equipment_Number_in_Batch` int(11) default NULL,
  `FK_Stock__ID` int(11) default NULL,
  `Equipment_Alias` varchar(40) default NULL,
  `Equipment_Description` text,
  `Equipment_Location` enum('Sequence Lab','Chromos','CDC','CRC','Functional Genomics','Linen','GE Lab','GE Lab - RNA area','GE Lab - DITAG area','Mapping Lab','MGC Lab') default NULL,
  `Equipment_Status` enum('In Use','Not In Use','Removed') default 'In Use',
  `FK_Location__ID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`Equipment_ID`),
  UNIQUE KEY `equip` (`Equipment_Name`),
  KEY `FK_Stock__ID` (`FK_Stock__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Error_Check`
--

DROP TABLE IF EXISTS `Error_Check`;
CREATE TABLE `Error_Check` (
  `Error_Check_ID` int(11) NOT NULL auto_increment,
  `Username` varchar(20) NOT NULL default '',
  `Table_Name` mediumtext NOT NULL,
  `Field_Name` mediumtext NOT NULL,
  `Command_Type` enum('SQL','RegExp','FullSQL','Perl') default NULL,
  `Command_String` mediumtext NOT NULL,
  `Notice_Sent` date default NULL,
  `Notice_Frequency` int(11) default NULL,
  `Comments` text,
  `Description` text,
  `Action` text,
  `Priority` mediumtext,
  PRIMARY KEY  (`Error_Check_ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `EST_Library`
--

DROP TABLE IF EXISTS `EST_Library`;
CREATE TABLE `EST_Library` (
  `EST_Library_ID` int(11) NOT NULL auto_increment,
  `FK_Sequencing_Library__ID` int(11) NOT NULL default '0',
  `5Prime_Insert_Site_Enzyme` varchar(40) NOT NULL default '',
  `3Prime_Insert_Site_Enzyme` varchar(40) NOT NULL default '',
  `Blue_White_Selection` enum('Yes','No') NOT NULL default 'Yes',
  `Enriched_For_Full_Length` enum('Yes','No') NOT NULL default 'Yes',
  `Construction_Correction` enum('','Normalized','Subtracted') NOT NULL default '',
  `FK3PrimeInsert_Restriction_Site__ID` int(11) default NULL,
  `FK5PrimeInsert_Restriction_Site__ID` int(11) default NULL,
  PRIMARY KEY  (`EST_Library_ID`),
  KEY `lib_id` (`FK_Sequencing_Library__ID`),
  KEY `FK3PrimeInsert_Restriction_Site__ID` (`FK3PrimeInsert_Restriction_Site__ID`),
  KEY `FK5PrimeInsert_Restriction_Site__ID` (`FK5PrimeInsert_Restriction_Site__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Event_Attribute`
--

DROP TABLE IF EXISTS `Event_Attribute`;
CREATE TABLE `Event_Attribute` (
  `Event_Attribute_ID` int(11) NOT NULL auto_increment,
  `FK_Event__ID` int(11) NOT NULL default '0',
  `FK_Attribute__ID` int(11) NOT NULL default '0',
  `Attribute_Value` text NOT NULL,
  `FK_Employee__ID` int(11) default NULL,
  `Set_DateTime` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`Event_Attribute_ID`),
  UNIQUE KEY `event_attribute` (`FK_Event__ID`,`FK_Attribute__ID`),
  KEY `FK_Event__ID` (`FK_Event__ID`),
  KEY `FK_Attribute__ID` (`FK_Attribute__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Event`
--

DROP TABLE IF EXISTS `Event`;
CREATE TABLE `Event` (
  `Event_ID` int(10) unsigned NOT NULL auto_increment,
  `FK_Employee__ID` int(11) NOT NULL default '0',
  `Event_Type` enum('Inventory') default NULL,
  `Event_Start` datetime NOT NULL default '0000-00-00 00:00:00',
  `Event_Finish` datetime NOT NULL default '0000-00-00 00:00:00',
  `FKEvent_Status__ID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`Event_ID`),
  KEY `FK_Employee__ID` (`FK_Employee__ID`),
  KEY `FKEvent_Status__ID` (`FKEvent_Status__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Extraction_Details`
--

DROP TABLE IF EXISTS `Extraction_Details`;
CREATE TABLE `Extraction_Details` (
  `Extraction_Details_ID` int(11) NOT NULL auto_increment,
  `FK_Extraction_Sample__ID` int(11) NOT NULL default '0',
  `RNA_Isolated_Date` date default NULL,
  `FKIsolated_Employee__ID` int(11) default NULL,
  `Disruption_Method` enum('Homogenized','Sheared') default NULL,
  `Isolation_Method` enum('Trizol','Qiagen Kit') default NULL,
  `Resuspension_Volume` int(11) default NULL,
  `Resuspension_Volume_Units` enum('ul') default NULL,
  `Amount_RNA_Source_Used` int(11) default NULL,
  `Amount_RNA_Source_Used_Units` enum('Cells','Gram of Tissue','Embryos','Litters','Organs','ug/ng') default NULL,
  `FK_Agilent_Assay__ID` int(11) NOT NULL default '0',
  `Assay_Quality` enum('Degraded','Partially Degraded','Good') default NULL,
  `Assay_Quantity` int(11) default NULL,
  `Assay_Quantity_Units` enum('ug/ul','ng/ul','pg/ul') default NULL,
  `Total_Yield` int(11) default NULL,
  `Total_Yield_Units` enum('ug','ng','pg') default NULL,
  `Extraction_Size_Estimate` int(11) default NULL,
  `FK_Band__ID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`Extraction_Details_ID`),
  KEY `extraction_sample__id` (`FK_Extraction_Sample__ID`),
  KEY `isolated_employee_id` (`FKIsolated_Employee__ID`),
  KEY `agilent_assay_id` (`FK_Agilent_Assay__ID`),
  KEY `band_id` (`FK_Band__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Extraction_Sample`
--

DROP TABLE IF EXISTS `Extraction_Sample`;
CREATE TABLE `Extraction_Sample` (
  `Extraction_Sample_ID` int(11) NOT NULL auto_increment,
  `FK_Sample__ID` int(11) NOT NULL default '0',
  `FK_Library__Name` char(6) default NULL,
  `Plate_Number` int(11) default NULL,
  `Volume` int(11) default NULL,
  `FKOriginal_Plate__ID` int(11) default NULL,
  `Extraction_Sample_Type` enum('DNA','RNA','Protein','Mixed','Amplicon') NOT NULL default 'Mixed',
  `Original_Well` char(3) default NULL,
  PRIMARY KEY  (`Extraction_Sample_ID`),
  KEY `sample` (`FK_Sample__ID`),
  KEY `plate` (`FKOriginal_Plate__ID`),
  KEY `library_name` (`FK_Library__Name`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Extraction`
--

DROP TABLE IF EXISTS `Extraction`;
CREATE TABLE `Extraction` (
  `Extraction_ID` int(11) NOT NULL auto_increment,
  `FKSource_Plate__ID` int(11) NOT NULL default '0',
  `FKTarget_Plate__ID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`Extraction_ID`),
  KEY `source_plate` (`FKSource_Plate__ID`),
  KEY `target_plate` (`FKTarget_Plate__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `FailReason`
--

DROP TABLE IF EXISTS `FailReason`;
CREATE TABLE `FailReason` (
  `FailReason_ID` int(11) NOT NULL auto_increment,
  `FK_Grp__ID` int(11) NOT NULL default '0',
  `FailReason_Name` varchar(40) default NULL,
  `FailReason_Description` text,
  `FK_Object_Class__ID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`FailReason_ID`),
  UNIQUE KEY `Unique_type_name` (`FailReason_Name`,`FK_Object_Class__ID`),
  KEY `FK_Grp__ID` (`FK_Grp__ID`),
  KEY `FK_Object_Class__ID` (`FK_Object_Class__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Fail`
--

DROP TABLE IF EXISTS `Fail`;
CREATE TABLE `Fail` (
  `Fail_ID` int(11) NOT NULL auto_increment,
  `Object_ID` int(11) NOT NULL default '0',
  `FK_Employee__ID` int(11) NOT NULL default '0',
  `FK_FailReason__ID` int(11) NOT NULL default '0',
  `DateTime` datetime NOT NULL default '0000-00-00 00:00:00',
  `Comments` text,
  PRIMARY KEY  (`Fail_ID`),
  KEY `Object_ID` (`Object_ID`,`FK_Employee__ID`,`FK_FailReason__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `FailureReason`
--

DROP TABLE IF EXISTS `FailureReason`;
CREATE TABLE `FailureReason` (
  `FailureReason_ID` int(11) NOT NULL auto_increment,
  `FK_Grp__ID` int(11) NOT NULL default '0',
  `FailureReason_Name` varchar(40) default NULL,
  `Failure_Description` text,
  PRIMARY KEY  (`FailureReason_ID`),
  UNIQUE KEY `failurereason_name_nique` (`FailureReason_Name`),
  KEY `FK_Grp__ID` (`FK_Grp__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Field_Map`
--

DROP TABLE IF EXISTS `Field_Map`;
CREATE TABLE `Field_Map` (
  `Field_Map_ID` int(11) NOT NULL auto_increment,
  `FK_Attribute__ID` int(11) default NULL,
  `FKSource_DBField__ID` int(11) default NULL,
  `FKTarget_DBField__ID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`Field_Map_ID`),
  UNIQUE KEY `Field_Attr_Map_Key` (`FKTarget_DBField__ID`,`FK_Attribute__ID`),
  UNIQUE KEY `Field_Field_Map_Key` (`FKTarget_DBField__ID`,`FKSource_DBField__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Funding_Applicant`
--

DROP TABLE IF EXISTS `Funding_Applicant`;
CREATE TABLE `Funding_Applicant` (
  `Funding_Applicant_ID` int(11) NOT NULL auto_increment,
  `FK_Funding__ID` int(11) default NULL,
  `FK_Employee__ID` int(11) default NULL,
  `FK_Contact__ID` int(11) default NULL,
  `Applicant_Type` enum('Primary','Collaborator') default NULL,
  PRIMARY KEY  (`Funding_Applicant_ID`),
  KEY `FK_Employee__ID` (`FK_Employee__ID`),
  KEY `FK_Contact__ID` (`FK_Contact__ID`),
  KEY `FK_Funding__ID` (`FK_Funding__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Funding_Distribution`
--

DROP TABLE IF EXISTS `Funding_Distribution`;
CREATE TABLE `Funding_Distribution` (
  `Funding_Distribution_ID` int(11) NOT NULL auto_increment,
  `FK_Funding_Segment__ID` int(11) default NULL,
  `Funding_Start` date default NULL,
  `Funding_End` date default NULL,
  PRIMARY KEY  (`Funding_Distribution_ID`),
  KEY `FK_Funding_Segment__ID` (`FK_Funding_Segment__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Funding_Segment`
--

DROP TABLE IF EXISTS `Funding_Segment`;
CREATE TABLE `Funding_Segment` (
  `Funding_Segment_ID` int(11) NOT NULL auto_increment,
  `FK_Funding__ID` int(11) default NULL,
  `Amount` int(11) default NULL,
  `Currency` enum('US','Canadian') default NULL,
  `Funding_Segment_Notes` text,
  PRIMARY KEY  (`Funding_Segment_ID`),
  KEY `FK_Funding__ID` (`FK_Funding__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Funding`
--

DROP TABLE IF EXISTS `Funding`;
CREATE TABLE `Funding` (
  `Funding_ID` int(11) NOT NULL auto_increment,
  `Funding_Status` enum('Applied for','Pending','Received','Terminated') default NULL,
  `Funding_Name` varchar(80) NOT NULL default '',
  `Funding_Conditions` text NOT NULL,
  `Funding_Code` varchar(20) default NULL,
  `Funding_Description` text NOT NULL,
  `Funding_Source` enum('Internal','External') NOT NULL default 'Internal',
  `ApplicationDate` date default NULL,
  `FKContact_Employee__ID` int(11) default NULL,
  `FKSource_Organization__ID` int(11) default NULL,
  `Source_ID` text,
  `AppliedFor` int(11) default NULL,
  `Duration` text,
  `Funding_Type` enum('New','Renewal') default NULL,
  `Currency` enum('US','Canadian') default NULL,
  `ExchangeRate` float default NULL,
  PRIMARY KEY  (`Funding_ID`),
  UNIQUE KEY `name` (`Funding_Name`),
  UNIQUE KEY `code` (`Funding_Code`),
  KEY `FKSource_Organization__ID` (`FKSource_Organization__ID`),
  KEY `FKContact_Employee__ID` (`FKContact_Employee__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `GCOS_Config_Attribute`
--

DROP TABLE IF EXISTS `GCOS_Config_Attribute`;
CREATE TABLE `GCOS_Config_Attribute` (
  `GCOS_Config_Attribute_ID` int(11) NOT NULL auto_increment,
  `Attribute_Type` enum('Field','Prep') default NULL,
  `Attribute_Name` char(50) NOT NULL default '',
  `Attribute_Table` char(50) default '',
  `Attribute_Step` char(50) default '',
  `Attribute_Field` char(50) NOT NULL default '',
  `FK_GCOS_Config__ID` int(11) NOT NULL default '0',
  `Attribute_Default` char(50) default NULL,
  `Attribute_Usage` set('Sample','Experiment') default NULL,
  PRIMARY KEY  (`GCOS_Config_Attribute_ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `GCOS_Config`
--

DROP TABLE IF EXISTS `GCOS_Config`;
CREATE TABLE `GCOS_Config` (
  `GCOS_Config_ID` int(11) NOT NULL auto_increment,
  `GCOS_Config_Name` varchar(40) NOT NULL default '',
  `Experiment_Template_Name` varchar(80) default NULL,
  `Sample_Template_Name` varchar(80) default NULL,
  PRIMARY KEY  (`GCOS_Config_ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `GelAnalysis`
--

DROP TABLE IF EXISTS `GelAnalysis`;
CREATE TABLE `GelAnalysis` (
  `GelAnalysis_ID` int(11) NOT NULL auto_increment,
  `FK_GelRun__ID` int(11) default NULL,
  `GelAnalysis_DateTime` date NOT NULL default '0000-00-00',
  `Bandleader_Version` varchar(15) NOT NULL default '',
  PRIMARY KEY  (`GelAnalysis_ID`),
  KEY `FK_GelRun__ID` (`FK_GelRun__ID`)
) TYPE=InnoDB;

old','lane tracking','run bandleader','bandleader completed','bandleader failure','finished','sizes imported','size importing failure') default 'Active',
  `Gel_Comments` text,
  `Bandleader_Version` varchar(40) default '2.3.5',
  `Agarose_Percent` float(10,2) default '1.20',
  `File_Extension_Type` enum('sizes','none') default 'none',
  PRIMARY KEY  (`Gel_ID`),
  KEY `FK_Employee__ID` (`FK_Employee__ID`),
  KEY `FK_Plate__ID` (`FK_Plate__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Genechip_Experiment`
--

DROP TABLE IF EXISTS `Genechip_Experiment`;
CREATE TABLE `Genechip_Experiment` (
  `Genechip_Experiment_ID` int(11) NOT NULL auto_increment,
  `FK_Plate__ID` int(11) NOT NULL default '0',
  `Chip_Type` enum('HG-U133A','HG-U133') default NULL,
  `Experiment_Count` int(11) NOT NULL default '0',
  `Data_Subdirectory` varchar(80) NOT NULL default '',
  `Comments` text,
  `FK_Equipment__ID` int(11) NOT NULL default '0',
  `FK_Employee__ID` int(11) NOT NULL default '0',
  `Experiment_DateTime` date default NULL,
  `Experiment_Name` varchar(80) NOT NULL default '',
  `Genechip_Barcode` varchar(80) NOT NULL default '',
  PRIMARY KEY  (`Genechip_Experiment_ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Genomic_Library`
--

DROP TABLE IF EXISTS `Genomic_Library`;
CREATE TABLE `Genomic_Library` (
  `Genomic_Library_ID` int(11) NOT NULL auto_increment,
  `FK_Sequencing_Library__ID` int(11) NOT NULL default '0',
  `Vector_Type` enum('Unspecified','Plasmid','Fosmid','Cosmid','BAC') NOT NULL default 'Plasmid',
  `Insert_Site_Enzyme` varchar(40) NOT NULL default '',
  `DNA_Shearing_Method` enum('Unspecified','Mechanical','Enzyme') NOT NULL default 'Unspecified',
  `DNA_Shearing_Enzyme` varchar(40) default NULL,
  `384_Well_Plates_To_Pick` int(11) NOT NULL default '0',
  `Genomic_Library_Type` enum('Shotgun','BAC','Fosmid') default NULL,
  PRIMARY KEY  (`Genomic_Library_ID`),
  KEY `lib_id` (`FK_Sequencing_Library__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Goal`
--

DROP TABLE IF EXISTS `Goal`;
CREATE TABLE `Goal` (
  `Goal_ID` int(11) NOT NULL auto_increment,
  `Goal_Name` varchar(255) default NULL,
  `Goal_Description` text,
  `Goal_Query` text,
  `Goal_Tables` varchar(255) default NULL,
  `Goal_Count` varchar(255) default NULL,
  `Goal_Condition` varchar(255) default NULL,
  PRIMARY KEY  (`Goal_ID`)
) TYPE=MyISAM;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `GrantApplication`
--

DROP TABLE IF EXISTS `GrantApplication`;
CREATE TABLE `GrantApplication` (
  `GrantApplication_ID` int(11) NOT NULL auto_increment,
  `Title` char(80) default NULL,
  `FKContact_Employee__ID` int(11) default NULL,
  `AppliedFor` float default NULL,
  `Duration` int(11) default NULL,
  `Duration_Units` enum('days','months','years') default NULL,
  `Grant_Type` char(40) default NULL,
  `ApplicationStatus` enum('Awarded','Declined','Applied') default NULL,
  `Award` float default NULL,
  `Currency` enum('US','Canadian') default NULL,
  `Application_Date` date default NULL,
  `Application_Number` int(11) default NULL,
  `Funding_Frequency` char(40) default NULL,
  PRIMARY KEY  (`GrantApplication_ID`),
  KEY `FKContact_Employee__ID` (`FKContact_Employee__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `GrantDistribution`
--

DROP TABLE IF EXISTS `GrantDistribution`;
CREATE TABLE `GrantDistribution` (
  `GrantDistribution_ID` int(11) NOT NULL auto_increment,
  `FK_GrantApplication__ID` int(11) default NULL,
  `StartDate` date default NULL,
  `EndDate` date default NULL,
  `Amount` float default NULL,
  `Currency` enum('Canadian','US') default NULL,
  `AwardStatus` enum('Spent','Received','Awarded','Declined','Pending','TBD') default NULL,
  `Spent` float default NULL,
  `SpentAsOf` date default NULL,
  PRIMARY KEY  (`GrantDistribution_ID`),
  KEY `FK_GrantApplication__ID` (`FK_GrantApplication__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `GrpDBTable`
--

DROP TABLE IF EXISTS `GrpDBTable`;
CREATE TABLE `GrpDBTable` (
  `GrpDBTable_ID` int(11) NOT NULL auto_increment,
  `FK_Grp__ID` int(11) NOT NULL default '0',
  `FK_DBTable__ID` int(11) NOT NULL default '0',
  `Permissions` set('R','W','U','D','O') NOT NULL default 'R',
  PRIMARY KEY  (`GrpDBTable_ID`),
  KEY `FK_Grp__ID` (`FK_Grp__ID`),
  KEY `FK_DBTable__ID` (`FK_DBTable__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `GrpEmployee`
--

DROP TABLE IF EXISTS `GrpEmployee`;
CREATE TABLE `GrpEmployee` (
  `GrpEmployee_ID` int(11) NOT NULL auto_increment,
  `FK_Grp__ID` int(11) NOT NULL default '0',
  `FK_Employee__ID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`GrpEmployee_ID`),
  UNIQUE KEY `UniqueKey` (`FK_Grp__ID`,`FK_Employee__ID`),
  KEY `FK_Grp__ID` (`FK_Grp__ID`),
  KEY `FK_Employee__ID` (`FK_Employee__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `GrpLab_Protocol`
--

DROP TABLE IF EXISTS `GrpLab_Protocol`;
CREATE TABLE `GrpLab_Protocol` (
  `GrpLab_Protocol_ID` int(11) NOT NULL auto_increment,
  `FK_Grp__ID` int(11) NOT NULL default '0',
  `FK_Lab_Protocol__ID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`GrpLab_Protocol_ID`),
  UNIQUE KEY `UniqueKey` (`FK_Grp__ID`,`FK_Lab_Protocol__ID`),
  KEY `FK_Grp__ID` (`FK_Grp__ID`),
  KEY `FK_Lab_Protocol__ID` (`FK_Lab_Protocol__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `GrpProject`
--

DROP TABLE IF EXISTS `GrpProject`;
CREATE TABLE `GrpProject` (
  `GrpProject_ID` int(11) NOT NULL auto_increment,
  `FK_Project__ID` int(11) NOT NULL default '0',
  `FK_Grp__ID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`GrpProject_ID`),
  KEY `FK_Project__ID` (`FK_Project__ID`),
  KEY `FK_Grp__ID` (`FK_Grp__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Grp_Relationship`
--

DROP TABLE IF EXISTS `Grp_Relationship`;
CREATE TABLE `Grp_Relationship` (
  `Grp_Relationship_ID` int(11) NOT NULL auto_increment,
  `FKBase_Grp__ID` int(11) NOT NULL default '0',
  `FKDerived_Grp__ID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`Grp_Relationship_ID`),
  KEY `FKDerived_Grp__ID` (`FKDerived_Grp__ID`),
  KEY `FKBase_Grp__ID` (`FKBase_Grp__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `GrpStandard_Solution`
--

DROP TABLE IF EXISTS `GrpStandard_Solution`;
CREATE TABLE `GrpStandard_Solution` (
  `GrpStandard_Solution_ID` int(11) NOT NULL auto_increment,
  `FK_Grp__ID` int(11) NOT NULL default '0',
  `FK_Standard_Solution__ID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`GrpStandard_Solution_ID`),
  UNIQUE KEY `UniqueKey` (`FK_Grp__ID`,`FK_Standard_Solution__ID`),
  KEY `FK_Grp__ID` (`FK_Grp__ID`),
  KEY `FK_Standard_Solution__ID` (`FK_Standard_Solution__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Grp`
--

DROP TABLE IF EXISTS `Grp`;
CREATE TABLE `Grp` (
  `Grp_ID` int(11) NOT NULL auto_increment,
  `Grp_Name` varchar(80) NOT NULL default '',
  `FK_Department__ID` int(11) NOT NULL default '0',
  `Access` enum('Lab','Admin','Guest','Report','Bioinformatics') NOT NULL default 'Guest',
  PRIMARY KEY  (`Grp_ID`),
  KEY `dept_id` (`FK_Department__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `How_To_Object`
--

DROP TABLE IF EXISTS `How_To_Object`;
CREATE TABLE `How_To_Object` (
  `How_To_Object_ID` int(11) NOT NULL auto_increment,
  `How_To_Object_Name` varchar(80) NOT NULL default '',
  `How_To_Object_Description` text,
  PRIMARY KEY  (`How_To_Object_ID`),
  UNIQUE KEY `object_name` (`How_To_Object_Name`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `How_To_Step`
--

DROP TABLE IF EXISTS `How_To_Step`;
CREATE TABLE `How_To_Step` (
  `How_To_Step_ID` int(11) NOT NULL auto_increment,
  `How_To_Step_Number` int(11) default NULL,
  `How_To_Step_Description` text,
  `How_To_Step_Result` text,
  `Users` set('A','T','L') default 'T',
  `Mode` set('Scanner','PC') default 'PC',
  `FK_How_To_Topic__ID` int(11) default NULL,
  PRIMARY KEY  (`How_To_Step_ID`),
  KEY `title` (`FK_How_To_Topic__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `How_To_Topic`
--

DROP TABLE IF EXISTS `How_To_Topic`;
CREATE TABLE `How_To_Topic` (
  `How_To_Topic_ID` int(11) NOT NULL auto_increment,
  `Topic_Number` int(11) default NULL,
  `Topic_Name` varchar(80) NOT NULL default '',
  `Topic_Type` enum('','New','Update','Find','Edit') NOT NULL default '',
  `Topic_Description` text,
  `FK_How_To_Object__ID` int(11) default NULL,
  PRIMARY KEY  (`How_To_Topic_ID`),
  KEY `object` (`FK_How_To_Object__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Hybrid_Original_Source`
--

DROP TABLE IF EXISTS `Hybrid_Original_Source`;
CREATE TABLE `Hybrid_Original_Source` (
  `Hybrid_Original_Source_ID` int(11) NOT NULL auto_increment,
  `FKParent_Original_Source__ID` int(11) default NULL,
  `FKChild_Original_Source__ID` int(11) default NULL,
  PRIMARY KEY  (`Hybrid_Original_Source_ID`),
  KEY `FKParent_Source__ID` (`FKParent_Original_Source__ID`),
  KEY `FKChild_Original_Source__ID` (`FKChild_Original_Source__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Issue_Detail`
--

DROP TABLE IF EXISTS `Issue_Detail`;
CREATE TABLE `Issue_Detail` (
  `Issue_Detail_ID` int(11) NOT NULL auto_increment,
  `FK_Issue__ID` int(11) NOT NULL default '0',
  `FKSubmitted_Employee__ID` int(11) NOT NULL default '0',
  `Submitted_DateTime` datetime NOT NULL default '0000-00-00 00:00:00',
  `Message` text,
  PRIMARY KEY  (`Issue_Detail_ID`),
  KEY `FKSubmitted_Employee__ID` (`FKSubmitted_Employee__ID`),
  KEY `FK_Issue__ID` (`FK_Issue__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Issue_Log`
--

DROP TABLE IF EXISTS `Issue_Log`;
CREATE TABLE `Issue_Log` (
  `Issue_Log_ID` int(11) NOT NULL auto_increment,
  `FK_Issue__ID` int(11) NOT NULL default '0',
  `FKSubmitted_Employee__ID` int(11) default NULL,
  `Submitted_DateTime` datetime NOT NULL default '0000-00-00 00:00:00',
  `Log` text NOT NULL,
  PRIMARY KEY  (`Issue_Log_ID`),
  KEY `FKSubmitted_Employee__ID` (`FKSubmitted_Employee__ID`),
  KEY `FK_Issue__ID` (`FK_Issue__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Issue`
--

DROP TABLE IF EXISTS `Issue`;
CREATE TABLE `Issue` (
  `Issue_ID` int(11) NOT NULL auto_increment,
  `Type` enum('Reported','Defect','Enhancement','Conformance','Maintenance','Requirement','Work Request','Ongoing Maintenance','User Error') default NULL,
  `Description` text NOT NULL,
  `Priority` enum('Critical','High','Medium','Low') NOT NULL default 'High',
  `Severity` enum('Fatal','Major','Minor','Cosmetic') NOT NULL default 'Major',
  `Status` enum('Reported','Approved','Open','In Process','Resolved','Closed','Deferred') default 'Reported',
  `Found_Release` varchar(9) NOT NULL default '',
  `Assigned_Release` varchar(9) default NULL,
  `FKSubmitted_Employee__ID` int(11) NOT NULL default '0',
  `Submitted_DateTime` datetime NOT NULL default '0000-00-00 00:00:00',
  `FKAssigned_Employee__ID` int(11) default NULL,
  `Resolution` enum('By Design','Cannot Reproduce','Code Fix','Data Fix','Do Not Fix','Duplicate Issue','False Submission','System Fix','Code Design') default NULL,
  `Estimated_Time` float default NULL,
  `Estimated_Time_Unit` enum('FTE','Minutes','Hours','Days','Weeks','Months') default NULL,
  `Actual_Time` float default NULL,
  `Actual_Time_Unit` enum('Minutes','Hours','Days','Weeks','Months') default NULL,
  `Last_Modified` datetime default NULL,
  `FK_Department__ID` int(11) default NULL,
  `SubType` enum('General','View','Forms','I/O','Report','Settings','Error Checking','Auto-Notification','Documentation','Scanner','Background Process') default 'General',
  `FKParent_Issue__ID` int(11) default NULL,
  `Issue_Comment` text NOT NULL,
  `FK_Grp__ID` int(11) NOT NULL default '1',
  `Latest_ETA` decimal(10,2) default NULL,
  PRIMARY KEY  (`Issue_ID`),
  KEY `Priority` (`Priority`),
  KEY `Severity` (`Severity`),
  KEY `Status` (`Status`),
  KEY `Submitted` (`FKSubmitted_Employee__ID`),
  KEY `Assigned` (`FKAssigned_Employee__ID`),
  KEY `Resolution` (`Resolution`),
  KEY `FKParent_Issue__ID` (`FKParent_Issue__ID`),
  KEY `FK_Department__ID` (`FK_Department__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Lab_Protocol_Pipeline`
--

DROP TABLE IF EXISTS `Lab_Protocol_Pipeline`;
CREATE TABLE `Lab_Protocol_Pipeline` (
  `Lab_Protocol_Pipeline_ID` int(11) NOT NULL auto_increment,
  `FK_Pipeline__ID` int(11) NOT NULL default '0',
  `FK_Lab_Protocol__ID` int(11) NOT NULL default '0',
  `Protocol_Order` tinyint(4) NOT NULL default '0',
  `Mandatory_Protocol` enum('Yes','No') default 'No',
  PRIMARY KEY  (`Lab_Protocol_Pipeline_ID`),
  KEY `FK_Lab_Protocol__ID` (`FK_Lab_Protocol__ID`),
  KEY `FK_Pipeline__ID` (`FK_Pipeline__ID`)
) TYPE=MyISAM;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Lab_Protocol`
--

DROP TABLE IF EXISTS `Lab_Protocol`;
CREATE TABLE `Lab_Protocol` (
  `Lab_Protocol_Name` varchar(40) default NULL,
  `FK_Employee__ID` int(11) default NULL,
  `Lab_Protocol_Status` enum('Active','Old','Inactive') default NULL,
  `Lab_Protocol_Description` text,
  `Lab_Protocol_ID` int(11) NOT NULL auto_increment,
  `Lab_Protocol_VersionDate` date default NULL,
  PRIMARY KEY  (`Lab_Protocol_ID`),
  UNIQUE KEY `name` (`Lab_Protocol_Name`),
  KEY `FK_Employee__ID` (`FK_Employee__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Lab_Request`
--

DROP TABLE IF EXISTS `Lab_Request`;
CREATE TABLE `Lab_Request` (
  `Lab_Request_ID` int(11) NOT NULL auto_increment,
  `FK_Employee__ID` int(11) NOT NULL default '0',
  `Request_Date` date NOT NULL default '0000-00-00',
  PRIMARY KEY  (`Lab_Request_ID`),
  KEY `FK_Employee__ID` (`FK_Employee__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Lane`
--

DROP TABLE IF EXISTS `Lane`;
CREATE TABLE `Lane` (
  `Lane_ID` int(11) NOT NULL auto_increment,
  `FK_GelRun__ID` int(11) default NULL,
  `FK_Sample__ID` int(11) default NULL,
  `Lane_Number` int(11) default NULL,
  `Lane_Status` enum('Passed','Failed') default NULL,
  `Band_Size_Estimate` int(11) default NULL,
  `Bands_Count` int(11) default NULL,
  `Well` char(3) NOT NULL default '',
  PRIMARY KEY  (`Lane_ID`),
  KEY `FK_GelRun__ID` (`FK_GelRun__ID`,`FK_Sample__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `LibraryApplication`
--

DROP TABLE IF EXISTS `LibraryApplication`;
CREATE TABLE `LibraryApplication` (
  `LibraryApplication_ID` int(11) NOT NULL auto_increment,
  `FK_Library__Name` varchar(40) NOT NULL default '',
  `Object_ID` varchar(40) NOT NULL default '',
  `FK_Object_Class__ID` int(11) NOT NULL default '0',
  `Direction` enum('3prime','5prime','N/A','Unknown') default 'N/A',
  PRIMARY KEY  (`LibraryApplication_ID`),
  UNIQUE KEY `LibApp` (`FK_Library__Name`,`Object_ID`,`FK_Object_Class__ID`),
  KEY `FK_Library__Name` (`FK_Library__Name`),
  KEY `Object_ID` (`Object_ID`),
  KEY `FK_Object_Class__ID` (`FK_Object_Class__ID`)
) TYPE=InnoDB COMMENT='Generic TABLE for reagents (etc) applied to a library';

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `LibraryGoal`
--

DROP TABLE IF EXISTS `LibraryGoal`;
CREATE TABLE `LibraryGoal` (
  `LibraryGoal_ID` int(11) NOT NULL auto_increment,
  `FK_Library__Name` varchar(6) default NULL,
  `FK_Goal__ID` int(11) NOT NULL default '0',
  `Goal_Target` int(11) NOT NULL default '0',
  PRIMARY KEY  (`LibraryGoal_ID`)
) TYPE=MyISAM;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Library_Plate`
--

DROP TABLE IF EXISTS `Library_Plate`;
CREATE TABLE `Library_Plate` (
  `Library_Plate_ID` int(11) NOT NULL auto_increment,
  `FK_Plate__ID` int(11) default NULL,
  `Plate_Class` enum('Standard','ReArray','Oligo') default 'Standard',
  `No_Grows` text,
  `Slow_Grows` text,
  `Unused_Wells` text,
  `Sub_Quadrants` set('','a','b','c','d','none') default NULL,
  `Slice` varchar(8) default NULL,
  `Plate_Position` enum('','a','b','c','d') default '',
  `Problematic_Wells` text,
  `Empty_Wells` text,
  PRIMARY KEY  (`Library_Plate_ID`),
  KEY `plate_id` (`FK_Plate__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

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
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `LibraryProgress`
--

DROP TABLE IF EXISTS `LibraryProgress`;
CREATE TABLE `LibraryProgress` (
  `LibraryProgress_ID` int(11) NOT NULL auto_increment,
  `LibraryProgress_Date` date default NULL,
  `FK_Library__Name` varchar(5) default NULL,
  `LibraryProgress_Comments` text,
  PRIMARY KEY  (`LibraryProgress_ID`),
  KEY `FK_Library__Name` (`FK_Library__Name`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Library_Segment`
--

DROP TABLE IF EXISTS `Library_Segment`;
CREATE TABLE `Library_Segment` (
  `Library_Segment_ID` int(11) NOT NULL auto_increment,
  `FK_Vector__ID` int(11) NOT NULL default '0',
  `Non_Recombinants` int(11) default NULL,
  `Non_Insert_Clones` int(11) default NULL,
  `Recombinant_Clones` int(11) default NULL,
  `Average_Insert_Size` int(11) default NULL,
  `FK_Antibiotic__ID` int(11) default NULL,
  `Genome_Coverage` int(11) default NULL,
  `FK_Restriction_Site__ID` int(11) default NULL,
  `FK_Source__ID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`Library_Segment_ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Library_Source`
--

DROP TABLE IF EXISTS `Library_Source`;
CREATE TABLE `Library_Source` (
  `Library_Source_ID` int(11) NOT NULL auto_increment,
  `FK_Source__ID` int(11) NOT NULL default '0',
  `FK_Library__Name` varchar(40) NOT NULL default '',
  PRIMARY KEY  (`Library_Source_ID`),
  KEY `FK_Library__Name` (`FK_Library__Name`),
  KEY `FK_Source__ID` (`FK_Source__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Library`
--

DROP TABLE IF EXISTS `Library`;
CREATE TABLE `Library` (
  `Library_Source_Name` text,
  `Library_Type` enum('Sequencing','RNA','Mapping') NOT NULL default 'Sequencing',
  `Library_Obtained_Date` date NOT NULL default '0000-00-00',
  `Library_Source` text,
  `Library_Name` varchar(40) NOT NULL default '',
  `External_Library_Name` text NOT NULL,
  `Library_Description` text,
  `FK_Project__ID` int(11) default NULL,
  `Library_Notes` text,
  `Library_FullName` varchar(80) default NULL,
  `FKParent_Library__Name` varchar(40) default NULL,
  `Library_Goals` text,
  `Library_Status` enum('Submitted','On Hold','In Production','Complete','Cancelled','Contaminated') default 'Submitted',
  `FK_Contact__ID` int(11) default NULL,
  `FKCreated_Employee__ID` int(11) default NULL,
  `FK_Grp__ID` int(11) NOT NULL default '0',
  `FK_Original_Source__ID` int(11) NOT NULL default '0',
  `Library_URL` text,
  `Starting_Plate_Number` smallint(6) NOT NULL default '1',
  `Source_In_House` enum('Yes','No') NOT NULL default 'Yes',
  `Requested_Completion_Date` date default NULL,
  `FKConstructed_Contact__ID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`Library_Name`),
  KEY `proj` (`FK_Project__ID`),
  KEY `FK_Contact__ID` (`FK_Contact__ID`),
  KEY `FKParent_Library__Name` (`FKParent_Library__Name`),
  KEY `FKCreated_Employee__ID` (`FKCreated_Employee__ID`),
  KEY `FK_Grp__ID` (`FK_Grp__ID`),
  KEY `FK_Original_Source__ID` (`FK_Original_Source__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `LibraryStudy`
--

DROP TABLE IF EXISTS `LibraryStudy`;
CREATE TABLE `LibraryStudy` (
  `LibraryStudy_ID` int(11) NOT NULL auto_increment,
  `FK_Library__Name` varchar(40) default NULL,
  `FK_Study__ID` int(11) default NULL,
  PRIMARY KEY  (`LibraryStudy_ID`),
  KEY `library_name` (`FK_Library__Name`),
  KEY `study_id` (`FK_Study__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `LibraryVector`
--

DROP TABLE IF EXISTS `LibraryVector`;
CREATE TABLE `LibraryVector` (
  `LibraryVector_ID` int(11) NOT NULL auto_increment,
  `FK_Library__Name` varchar(40) default NULL,
  `FK_Vector__ID` int(11) NOT NULL default '0',
  `Vector_Type` enum('Plasmid','Fosmid','Cosmid','BAC') default NULL,
  PRIMARY KEY  (`LibraryVector_ID`),
  UNIQUE KEY `combo` (`FK_Library__Name`,`FK_Vector__ID`),
  KEY `FK_Vector__ID` (`FK_Vector__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Ligation`
--

DROP TABLE IF EXISTS `Ligation`;
CREATE TABLE `Ligation` (
  `Ligation_ID` int(11) NOT NULL auto_increment,
  `Ligation_Volume` int(11) default NULL,
  `cfu` int(11) default NULL,
  `Label` varchar(40) default NULL,
  `Sequencing_Type` enum('Primers','Transposon','Primers_and_transposon','Replicates','N/A') default NULL,
  `384_Well_Plates_To_Seq` int(11) default NULL,
  `FKExtraction_Plate__ID` int(11) default NULL,
  `FK_Source__ID` int(11) NOT NULL default '0',
  `384_Well_Plates_To_Pick` int(11) default '0',
  PRIMARY KEY  (`Ligation_ID`),
  KEY `FKExtraction_Plate__ID` (`FKExtraction_Plate__ID`),
  KEY `FK_Source__ID` (`FK_Source__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Location`
--

DROP TABLE IF EXISTS `Location`;
CREATE TABLE `Location` (
  `Location_ID` int(11) NOT NULL auto_increment,
  `Location_Name` char(40) default NULL,
  PRIMARY KEY  (`Location_ID`)
) TYPE=MyISAM;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Machine_Default`
--

DROP TABLE IF EXISTS `Machine_Default`;
CREATE TABLE `Machine_Default` (
  `Machine_Default_ID` int(11) NOT NULL auto_increment,
  `FK_Equipment__ID` int(11) default NULL,
  `Run_Module` text,
  `NT_Data_dir` text,
  `NT_Samplesheet_dir` text,
  `Local_Samplesheet_dir` text,
  `Host` text,
  `Local_Data_dir` text,
  `Sharename` text,
  `Agarose_Percentage` float default NULL,
  `Injection_Voltage` int(11) default NULL,
  `Injection_Time` int(11) default NULL,
  `Run_Voltage` int(11) default NULL,
  `Run_Time` int(11) default NULL,
  `Run_Temp` int(11) default NULL,
  `PMT1` int(11) default NULL,
  `PMT2` int(11) default NULL,
  `An_Module` text,
  `Foil_Piercing` tinyint(4) default NULL,
  `Chemistry_Version` tinyint(4) default NULL,
  `FK_Sequencer_Type__ID` tinyint(4) NOT NULL default '0',
  `Mount` varchar(80) default NULL,
  PRIMARY KEY  (`Machine_Default_ID`),
  KEY `FK_Equipment__ID` (`FK_Equipment__ID`),
  KEY `FK_Sequencer_Type__ID` (`FK_Sequencer_Type__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Maintenance_Protocol`
--

DROP TABLE IF EXISTS `Maintenance_Protocol`;
CREATE TABLE `Maintenance_Protocol` (
  `Maintenance_Protocol_ID` int(11) NOT NULL auto_increment,
  `FK_Service__Name` varchar(40) default NULL,
  `Step` int(11) default NULL,
  `Maintenance_Step_Name` varchar(40) default NULL,
  `Maintenance_Instructions` text,
  `FK_Employee__ID` int(11) default NULL,
  `Protocol_Date` date default '0000-00-00',
  `Maintenance_Protocol_Name` text,
  `FK_Contact__ID` int(11) default NULL,
  PRIMARY KEY  (`Maintenance_Protocol_ID`),
  UNIQUE KEY `step` (`FK_Service__Name`,`Step`),
  KEY `FK_Employee__ID` (`FK_Employee__ID`),
  KEY `FK_Contact__ID` (`FK_Contact__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Maintenance`
--

DROP TABLE IF EXISTS `Maintenance`;
CREATE TABLE `Maintenance` (
  `Maintenance_ID` int(11) NOT NULL auto_increment,
  `FK_Equipment__ID` int(11) default NULL,
  `Maintenance_Process` text,
  `Maintenance_Description` text NOT NULL,
  `Maintenance_DateTime` datetime default NULL,
  `FK_Employee__ID` int(11) default NULL,
  `FK_Contact__ID` int(11) default NULL,
  `FK_Solution__ID` int(11) default NULL,
  `Maintenance_Cost` float default NULL,
  `Maintenance_Finished` datetime default NULL,
  `FKMaintenance_Status__ID` int(11) default '0',
  PRIMARY KEY  (`Maintenance_ID`),
  KEY `FK_Employee__ID` (`FK_Employee__ID`),
  KEY `FK_Equipment__ID` (`FK_Equipment__ID`),
  KEY `FK_Solution__ID` (`FK_Solution__ID`),
  KEY `FK_Contact__ID` (`FK_Contact__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Matched_Funding`
--

DROP TABLE IF EXISTS `Matched_Funding`;
CREATE TABLE `Matched_Funding` (
  `Matched_Funding_ID` int(11) NOT NULL auto_increment,
  `Matched_Funding_Number` int(11) default NULL,
  `FK_Funding__ID` int(11) default NULL,
  PRIMARY KEY  (`Matched_Funding_ID`),
  KEY `FK_Funding__ID` (`FK_Funding__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Message`
--

DROP TABLE IF EXISTS `Message`;
CREATE TABLE `Message` (
  `Message_ID` int(11) NOT NULL auto_increment,
  `Message_Text` text,
  `Message_Date` datetime default NULL,
  `Message_Link` text,
  `Message_Status` enum('Urgent','Active','Old') default 'Active',
  `FK_Employee__ID` int(11) default NULL,
  `Message_Type` enum('Public','Private','Admin','Group') default NULL,
  `FK_Grp__ID` int(11) default NULL,
  PRIMARY KEY  (`Message_ID`),
  KEY `fk_grp` (`FK_Grp__ID`),
  KEY `FK_Employee__ID` (`FK_Employee__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Microtiter`
--

DROP TABLE IF EXISTS `Microtiter`;
CREATE TABLE `Microtiter` (
  `Microtiter_ID` int(11) NOT NULL auto_increment,
  `Plates` int(11) default NULL,
  `Plate_Size` enum('96-well','384-well') default NULL,
  `Plate_Catalog_Number` varchar(40) default NULL,
  `VolumePerWell` int(11) default NULL,
  `Cell_Catalog_Number` varchar(40) default NULL,
  `Label` varchar(40) default NULL,
  `FKSupplier_Organization__ID` int(11) default NULL,
  `Cell_Type` varchar(40) default NULL,
  `Media_Type` varchar(40) default NULL,
  `Sequencing_Type` enum('Primers','Transposon','Primers_and_transposon','Replicates') default NULL,
  `384_Well_Plates_To_Seq` int(11) default NULL,
  `FK_Source__ID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`Microtiter_ID`),
  KEY `FK_Source__ID` (`FK_Source__ID`),
  KEY `FKSupplier_Organization__ID` (`FKSupplier_Organization__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Misc_Item`
--

DROP TABLE IF EXISTS `Misc_Item`;
CREATE TABLE `Misc_Item` (
  `Misc_Item_ID` int(11) NOT NULL auto_increment,
  `Misc_Item_Number` int(11) NOT NULL default '0',
  `Misc_Item_Number_in_Batch` int(11) default NULL,
  `FK_Stock__ID` int(11) default NULL,
  `Misc_Item_Serial_Number` text,
  `FK_Rack__ID` int(11) default NULL,
  `Misc_Item_Type` text,
  PRIMARY KEY  (`Misc_Item_ID`),
  KEY `FK_Stock__ID` (`FK_Stock__ID`),
  KEY `FK_Rack__ID` (`FK_Rack__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Mixture`
--

DROP TABLE IF EXISTS `Mixture`;
CREATE TABLE `Mixture` (
  `Mixture_ID` int(8) NOT NULL auto_increment,
  `FKMade_Solution__ID` int(11) default NULL,
  `FKUsed_Solution__ID` int(11) default NULL,
  `Quantity_Used` float default NULL,
  `Mixture_Comments` text,
  `Units_Used` varchar(10) default NULL,
  PRIMARY KEY  (`Mixture_ID`),
  KEY `made_solution` (`FKMade_Solution__ID`),
  KEY `used_solution` (`FKUsed_Solution__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `MultiPlate_Run`
--

DROP TABLE IF EXISTS `MultiPlate_Run`;
CREATE TABLE `MultiPlate_Run` (
  `MultiPlate_Run_ID` int(11) NOT NULL auto_increment,
  `FKMaster_Run__ID` int(11) default NULL,
  `FK_Run__ID` int(11) default NULL,
  `MultiPlate_Run_Quadrant` char(1) default NULL,
  PRIMARY KEY  (`MultiPlate_Run_ID`),
  KEY `FK_Sequence__ID` (`FK_Run__ID`),
  KEY `FKMaster_Sequence__ID` (`FKMaster_Run__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Multiple_Barcode`
--

DROP TABLE IF EXISTS `Multiple_Barcode`;
CREATE TABLE `Multiple_Barcode` (
  `Multiple_Barcode_ID` int(11) NOT NULL auto_increment,
  `Multiple_Text` varchar(100) default NULL,
  PRIMARY KEY  (`Multiple_Barcode_ID`),
  UNIQUE KEY `text` (`Multiple_Text`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Note`
--

DROP TABLE IF EXISTS `Note`;
CREATE TABLE `Note` (
  `Note_ID` int(11) NOT NULL auto_increment,
  `Note_Text` varchar(40) default NULL,
  `Note_Type` varchar(40) default NULL,
  `Note_Description` text,
  PRIMARY KEY  (`Note_ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Notice`
--

DROP TABLE IF EXISTS `Notice`;
CREATE TABLE `Notice` (
  `Notice_ID` int(11) NOT NULL auto_increment,
  `Notice_Text` text,
  `Notice_Subject` text,
  `Notice_Date` date default NULL,
  `Target_List` text,
  PRIMARY KEY  (`Notice_ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Object_Class`
--

DROP TABLE IF EXISTS `Object_Class`;
CREATE TABLE `Object_Class` (
  `Object_Class_ID` int(11) NOT NULL auto_increment,
  `Object_Class` varchar(40) NOT NULL default '',
  `Object_Type` enum('Solution','') default NULL,
  PRIMARY KEY  (`Object_Class_ID`),
  UNIQUE KEY `object_type_class` (`Object_Type`,`Object_Class`),
  KEY `Object_Type` (`Object_Type`),
  KEY `Object_Class` (`Object_Class`)
) TYPE=InnoDB COMMENT='Object Types in the database, ie Enzyme, Antibiotic';

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Optical_Density`
--

DROP TABLE IF EXISTS `Optical_Density`;
CREATE TABLE `Optical_Density` (
  `FK_Plate__ID` int(11) NOT NULL default '0',
  `260nm_Corrected` float default NULL,
  `280nm_Corrected` float default NULL,
  `Density` float default NULL,
  `Optical_Density_DateTime` datetime default NULL,
  `Concentration` float default NULL,
  `Optical_Density_ID` int(11) NOT NULL default '0',
  `Well` char(3) NOT NULL default '',
  `FK_Sample__ID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`Well`,`Optical_Density_ID`),
  KEY `plate_id` (`FK_Plate__ID`),
  KEY `sample_id` (`FK_Sample__ID`),
  KEY `Optical_Density_ID` (`Optical_Density_ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Ordered_Procedure`
--

DROP TABLE IF EXISTS `Ordered_Procedure`;
CREATE TABLE `Ordered_Procedure` (
  `Ordered_Procedure_ID` int(11) NOT NULL auto_increment,
  `Object_Name` varchar(40) default NULL,
  `Object_ID` int(11) NOT NULL default '0',
  `Procedure_Order` tinyint(4) NOT NULL default '0',
  `FK_Pipeline__ID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`Ordered_Procedure_ID`),
  KEY `Object_ID` (`Object_ID`),
  KEY `Object_Name` (`Object_Name`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Order_Notice`
--

DROP TABLE IF EXISTS `Order_Notice`;
CREATE TABLE `Order_Notice` (
  `Minimum_Units` int(11) default NULL,
  `Order_Text` text,
  `Catalog_Number` varchar(40) NOT NULL default '',
  `Notice_Sent` date default NULL,
  `Notice_Frequency` int(11) default NULL,
  `Target_List` text,
  `Maximum_Units` int(11) default '0',
  `Order_Notice_ID` int(11) NOT NULL auto_increment,
  PRIMARY KEY  (`Order_Notice_ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
CREATE TABLE `Orders` (
  `Orders_ID` int(11) NOT NULL auto_increment,
  `Orders_Item` text,
  `Orders_Quantity` int(11) default NULL,
  `Item_Size` float default NULL,
  `Item_Units` enum('mL','litres','mg','grams','kg','pcs','boxes','tubes','n/a') default NULL,
  `Orders_Catalog_Number` text,
  `Orders_Lot_Number` text,
  `Unit_Cost` float default NULL,
  `Orders_Notes` text,
  `Orders_Req_Number` text,
  `Orders_PO_Number` text,
  `Quote_Number` text,
  `Orders_Received` int(11) NOT NULL default '0',
  `Orders_Status` enum('On Order','Received','Incomplete','Pending') default NULL,
  `PO_Date` date default NULL,
  `Orders_Quantity_Received` int(11) NOT NULL default '0',
  `Req_Date` date default NULL,
  `Orders_Cost` float(6,2) default NULL,
  `Taxes` float default NULL,
  `Freight_Costs` float default NULL,
  `Total_Ledger_Amount` float default NULL,
  `Ledger_Period` text,
  `Expense_Code` text,
  `Serial_Num` text,
  `FK_Funding__Code` text NOT NULL,
  `Expense_Type` enum('Reagents','Equip - C','Equip -M','Glass','Plastics','Kits','Service','Other') default NULL,
  `Item_Unit` enum('EA','CS','BX','PK','RL','HR') default NULL,
  `Req_Number` text,
  `PO_Number` text,
  `Warranty` text,
  `MSDS` enum('Yes','No','N/A') default NULL,
  `old_Expense` text,
  `old_Org_Name` text,
  `Orders_Received_Date` date default NULL,
  `Currency` enum('Can','US') default 'Can',
  `FK_Account__ID` int(11) default NULL,
  `FKVendor_Organization__ID` int(11) default NULL,
  `FKManufacturer_Organization__ID` int(11) default NULL,
  `Orders_Item_Description` text,
  PRIMARY KEY  (`Orders_ID`),
  KEY `FKManufacturer_Organization__ID` (`FKManufacturer_Organization__ID`),
  KEY `FKVendor_Organization__ID` (`FKVendor_Organization__ID`),
  KEY `FK_Account__ID` (`FK_Account__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Organism`
--

DROP TABLE IF EXISTS `Organism`;
CREATE TABLE `Organism` (
  `Organism_ID` int(11) NOT NULL auto_increment,
  `Organism_Name` varchar(255) NOT NULL default '',
  `Species` varchar(255) default NULL,
  `Sub_species` varchar(255) default NULL,
  `Common_Name` varchar(255) default NULL,
  PRIMARY KEY  (`Organism_ID`),
  UNIQUE KEY `organism` (`Organism_Name`,`Species`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Organization`
--

DROP TABLE IF EXISTS `Organization`;
CREATE TABLE `Organization` (
  `Organization_Name` varchar(80) default NULL,
  `Address` text,
  `City` text,
  `State` text,
  `Zip` text,
  `Phone` text,
  `Fax` text,
  `Email` text,
  `Country` text,
  `Notes` text,
  `Organization_ID` int(11) NOT NULL auto_increment,
  `Organization_Type` set('Manufacturer','Collaborator') default NULL,
  `Website` text,
  `Organization_FullName` text,
  PRIMARY KEY  (`Organization_ID`),
  UNIQUE KEY `name` (`Organization_Name`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Original_Source_Attribute`
--

DROP TABLE IF EXISTS `Original_Source_Attribute`;
CREATE TABLE `Original_Source_Attribute` (
  `FK_Original_Source__ID` int(11) NOT NULL default '0',
  `FK_Attribute__ID` int(11) NOT NULL default '0',
  `Attribute_Value` text NOT NULL,
  `Original_Source_Attribute_ID` int(11) NOT NULL auto_increment,
  `FK_Employee__ID` int(11) default NULL,
  `Set_DateTime` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`Original_Source_Attribute_ID`),
  UNIQUE KEY `original_source_attribute` (`FK_Original_Source__ID`,`FK_Attribute__ID`),
  KEY `FK_Original_Source__ID` (`FK_Original_Source__ID`),
  KEY `FK_Attribute__ID` (`FK_Attribute__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Original_Source`
--

DROP TABLE IF EXISTS `Original_Source`;
CREATE TABLE `Original_Source` (
  `Original_Source_ID` int(11) NOT NULL auto_increment,
  `Original_Source_Name` varchar(40) NOT NULL default '',
  `Organism` varchar(40) default NULL,
  `Sex` varchar(20) default NULL,
  `Tissue` varchar(40) default NULL,
  `Strain` varchar(40) default NULL,
  `Host` text NOT NULL,
  `Description` text,
  `FK_Contact__ID` int(11) default NULL,
  `FKCreated_Employee__ID` int(11) default NULL,
  `Defined_Date` date NOT NULL default '0000-00-00',
  `FK_Stage__ID` int(11) NOT NULL default '0',
  `FK_Tissue__ID` int(11) NOT NULL default '0',
  `FK_Organism__ID` int(11) NOT NULL default '0',
  `Subtissue_temp` varchar(40) default NULL,
  `Tissue_temp` varchar(40) NOT NULL default '',
  `Organism_temp` varchar(40) default NULL,
  `Stage_temp` varchar(40) default NULL,
  `Note_temp` varchar(40) NOT NULL default '',
  `Thelier_temp` varchar(40) default NULL,
  `Sample_Available` enum('Yes','No') NOT NULL default 'Yes',
  PRIMARY KEY  (`Original_Source_ID`),
  UNIQUE KEY `OS_Name` (`Original_Source_Name`),
  KEY `FK_Contact__ID` (`FK_Contact__ID`),
  KEY `FKCreated_Employee__ID` (`FKCreated_Employee__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Parameter`
--

DROP TABLE IF EXISTS `Parameter`;
CREATE TABLE `Parameter` (
  `FK_Standard_Solution__ID` int(11) default NULL,
  `Parameter_Name` varchar(40) default NULL,
  `Parameter_Description` text,
  `Parameter_Value` float default NULL,
  `Parameter_Type` enum('Static','Multiple','Variable','Hidden') default NULL,
  `Parameter_ID` int(11) NOT NULL auto_increment,
  `Parameter_Format` text,
  `Parameter_Units` enum('ml','ul','mg','ug','g','l') default NULL,
  `Parameter_SType` enum('Reagent','Solution','Primer','Buffer','Matrix') default NULL,
  `Parameter_Prompt` varchar(30) NOT NULL default '',
  PRIMARY KEY  (`Parameter_ID`),
  UNIQUE KEY `FK_Standard_Solution__ID` (`FK_Standard_Solution__ID`,`Parameter_Name`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `PCR_Library`
--

DROP TABLE IF EXISTS `PCR_Library`;
CREATE TABLE `PCR_Library` (
  `PCR_Library_ID` int(11) NOT NULL auto_increment,
  `FK_Sequencing_Library__ID` int(11) NOT NULL default '0',
  `Species` varchar(40) NOT NULL default '',
  `Cleanup_Procedure` text NOT NULL,
  `PCR_Product_Size` int(11) NOT NULL default '0',
  `Concentration_Per_Well` float(10,3) NOT NULL default '0.000',
  PRIMARY KEY  (`PCR_Library_ID`),
  KEY `lib_id` (`FK_Sequencing_Library__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Pipeline`
--

DROP TABLE IF EXISTS `Pipeline`;
CREATE TABLE `Pipeline` (
  `Pipeline_ID` int(11) NOT NULL auto_increment,
  `Pipeline_Name` varchar(40) default NULL,
  `FK_Grp__ID` int(11) NOT NULL default '0',
  `Pipeline_Description` text,
  PRIMARY KEY  (`Pipeline_ID`),
  KEY `FK_Grp__ID` (`FK_Grp__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Plate_Attribute`
--

DROP TABLE IF EXISTS `Plate_Attribute`;
CREATE TABLE `Plate_Attribute` (
  `FK_Plate__ID` int(11) NOT NULL default '0',
  `FK_Attribute__ID` int(11) NOT NULL default '0',
  `Attribute_Value` text NOT NULL,
  `Plate_Attribute_ID` int(11) NOT NULL auto_increment,
  `FK_Employee__ID` int(11) default NULL,
  `Set_DateTime` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`Plate_Attribute_ID`),
  UNIQUE KEY `FK_Attribute__ID_2` (`FK_Attribute__ID`,`FK_Plate__ID`),
  KEY `FK_Plate__ID` (`FK_Plate__ID`),
  KEY `FK_Attribute__ID` (`FK_Attribute__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Plate_Format`
--

DROP TABLE IF EXISTS `Plate_Format`;
CREATE TABLE `Plate_Format` (
  `Plate_Format_ID` int(11) NOT NULL auto_increment,
  `Plate_Format_Type` char(40) default NULL,
  `Plate_Format_Size` enum('1-well','96-well','384-well','1.5 ml','50 ml','15 ml','5 ml','2 ml','0.5 ml','0.2 ml') default NULL,
  `Plate_Format_Status` enum('Active','Inactive') default NULL,
  `FK_Barcode_Label__ID` int(11) default NULL,
  `Max_Row` char(2) default NULL,
  `Max_Col` tinyint(4) default NULL,
  `Plate_Format_Style` enum('Plate','Tube') default NULL,
  `Format_Size` char(4) default NULL,
  `Format_Size_Units` enum('wells','ml') default NULL,
  `Wells` smallint(6) NOT NULL default '1',
  PRIMARY KEY  (`Plate_Format_ID`),
  UNIQUE KEY `name` (`Plate_Format_Type`,`Plate_Format_Size`),
  KEY `FK_Barcode_Label__ID` (`FK_Barcode_Label__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Plate_Prep`
--

DROP TABLE IF EXISTS `Plate_Prep`;
CREATE TABLE `Plate_Prep` (
  `Plate_Prep_ID` int(11) NOT NULL auto_increment,
  `FK_Plate__ID` int(11) default NULL,
  `FK_Prep__ID` int(11) default NULL,
  `FK_Plate_Set__Number` int(11) default NULL,
  `FK_Equipment__ID` int(11) default NULL,
  `FK_Solution__ID` int(11) default NULL,
  `Solution_Quantity` float default NULL,
  `Transfer_Quantity` float default NULL,
  `Transfer_Quantity_Units` enum('pl','nl','ul','ml','l','g','mg','ug','ng','pg') default NULL,
  PRIMARY KEY  (`Plate_Prep_ID`),
  KEY `plate` (`FK_Plate__ID`),
  KEY `plate_set` (`FK_Plate_Set__Number`),
  KEY `prep` (`FK_Prep__ID`),
  KEY `FK_Equipment__ID` (`FK_Equipment__ID`),
  KEY `FK_Solution__ID` (`FK_Solution__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Plate_PrimerPlateWell`
--

DROP TABLE IF EXISTS `Plate_PrimerPlateWell`;
CREATE TABLE `Plate_PrimerPlateWell` (
  `Plate_PrimerPlateWell_ID` int(11) NOT NULL auto_increment,
  `FK_Plate__ID` int(11) NOT NULL default '0',
  `FK_Primer_Plate_Well__ID` int(11) NOT NULL default '0',
  `Plate_Well` char(3) default NULL,
  PRIMARY KEY  (`Plate_PrimerPlateWell_ID`),
  KEY `plate` (`FK_Plate__ID`),
  KEY `primer` (`FK_Primer_Plate_Well__ID`),
  KEY `well` (`Plate_Well`)
) TYPE=MyISAM;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Plate_Sample`
--

DROP TABLE IF EXISTS `Plate_Sample`;
CREATE TABLE `Plate_Sample` (
  `Plate_Sample_ID` int(11) NOT NULL auto_increment,
  `FKOriginal_Plate__ID` int(11) NOT NULL default '0',
  `FK_Sample__ID` int(11) NOT NULL default '0',
  `Well` char(3) default NULL,
  PRIMARY KEY  (`Plate_Sample_ID`),
  UNIQUE KEY `origplate` (`FKOriginal_Plate__ID`,`Well`),
  KEY `sampleid` (`FK_Sample__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Plate_Set`
--

DROP TABLE IF EXISTS `Plate_Set`;
CREATE TABLE `Plate_Set` (
  `Plate_Set_ID` int(4) NOT NULL auto_increment,
  `FK_Plate__ID` int(11) default NULL,
  `Plate_Set_Number` int(11) default NULL,
  `FKParent_Plate_Set__Number` int(11) default NULL,
  PRIMARY KEY  (`Plate_Set_ID`),
  KEY `num` (`Plate_Set_Number`),
  KEY `FK_Plate__ID` (`FK_Plate__ID`),
  KEY `parent_set` (`FKParent_Plate_Set__Number`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Plate`
--

DROP TABLE IF EXISTS `Plate`;
CREATE TABLE `Plate` (
  `Plate_ID` int(11) NOT NULL auto_increment,
  `Plate_Size` enum('1-well','16-well','32-well','48-well','64-well','80-well','96-well','384-well','1.5 ml','50 ml','15 ml','5 ml','2 ml','0.5 ml','0.2 ml') default NULL,
  `Plate_Created` datetime default '0000-00-00 00:00:00',
  `FK_Library__Name` varchar(40) default NULL,
  `FK_Rack__ID` int(11) default NULL,
  `Plate_Number` int(4) NOT NULL default '0',
  `FK_Employee__ID` int(11) default NULL,
  `FKParent_Plate__ID` int(11) default NULL,
  `Plate_Comments` text NOT NULL,
  `Plate_Status` enum('Active','Pre-Printed','Reserved','Temporary','Failed','Thrown Out','Exported') default 'Active',
  `Plate_Test_Status` enum('Test','Production') default 'Production',
  `FK_Plate_Format__ID` int(11) default NULL,
  `Plate_Application` enum('Sequencing','PCR','Mapping','Gene Expression') default NULL,
  `Plate_Type` enum('Library_Plate','Tube') default NULL,
  `FKOriginal_Plate__ID` int(10) unsigned default NULL,
  `Current_Volume` float default NULL,
  `Current_Volume_Units` enum('l','ml','ul','nl','g','mg','ug','ng') NOT NULL default 'ul',
  `Plate_Content_Type` enum('DNA','RNA','Protein','Mixed','Amplicon','Clone') default NULL,
  `Parent_Quadrant` enum('','a','b','c','d') NOT NULL default '',
  `Plate_Parent_Well` char(3) NOT NULL default '',
  `QC_Status` enum('N/A','Pending','Failed','Re-Test','Passed') default 'N/A',
  PRIMARY KEY  (`Plate_ID`),
  KEY `lib` (`FK_Library__Name`),
  KEY `user` (`FK_Employee__ID`),
  KEY `made` (`Plate_Created`),
  KEY `number` (`Plate_Number`),
  KEY `orderlist` (`FK_Library__Name`,`Plate_Number`),
  KEY `parent` (`FKParent_Plate__ID`),
  KEY `format` (`FK_Plate_Format__ID`),
  KEY `FK_Rack__ID` (`FK_Rack__ID`),
  KEY `FKOriginal_Plate__ID` (`FKOriginal_Plate__ID`),
  KEY `FKOriginal_Plate__ID_2` (`FKOriginal_Plate__ID`),
  KEY `Plate_Status` (`Plate_Status`),
  KEY `Plate_Content_Type` (`Plate_Content_Type`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Plate_Tray`
--

DROP TABLE IF EXISTS `Plate_Tray`;
CREATE TABLE `Plate_Tray` (
  `Plate_Tray_ID` int(11) NOT NULL auto_increment,
  `FK_Plate__ID` int(11) NOT NULL default '0',
  `FK_Tray__ID` int(11) NOT NULL default '0',
  `Plate_Position` enum('a','b','c','d','N/A') NOT NULL default 'N/A',
  PRIMARY KEY  (`Plate_Tray_ID`),
  UNIQUE KEY `FK_Plate__ID` (`FK_Plate__ID`),
  UNIQUE KEY `Plate_Position` (`FK_Tray__ID`,`Plate_Position`)
) TYPE=InnoDB COMMENT='For multiple plates on a tray';

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Plate_Tube`
--

DROP TABLE IF EXISTS `Plate_Tube`;
CREATE TABLE `Plate_Tube` (
  `Plate_Tube_ID` int(11) NOT NULL auto_increment,
  `FK_Plate__ID` int(11) default NULL,
  `FK_Tube__ID` int(11) default NULL,
  PRIMARY KEY  (`Plate_Tube_ID`),
  KEY `FK_Tube__ID` (`FK_Tube__ID`),
  KEY `FK_Plate__ID` (`FK_Plate__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `PoolSample`
--

DROP TABLE IF EXISTS `PoolSample`;
CREATE TABLE `PoolSample` (
  `PoolSample_ID` int(11) NOT NULL auto_increment,
  `FK_Pool__ID` int(11) NOT NULL default '0',
  `FK_Plate__ID` int(11) NOT NULL default '0',
  `Well` char(3) default NULL,
  `FK_Sample__ID` int(11) default NULL,
  `Sample_Quantity_Units` enum('ml','ul','mg','ug','ng','pg') default NULL,
  `Sample_Quantity` float default NULL,
  PRIMARY KEY  (`PoolSample_ID`),
  KEY `sample` (`FK_Sample__ID`),
  KEY `pool` (`FK_Pool__ID`),
  KEY `plated` (`FK_Plate__ID`,`Well`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Pool`
--

DROP TABLE IF EXISTS `Pool`;
CREATE TABLE `Pool` (
  `Pool_ID` int(11) NOT NULL auto_increment,
  `Pool_Description` text NOT NULL,
  `FK_Employee__ID` int(11) default NULL,
  `Pool_Date` date NOT NULL default '0000-00-00',
  `Pool_Comments` text,
  `Pool_Type` enum('Library','Sample','Transposon') default NULL,
  PRIMARY KEY  (`Pool_ID`),
  KEY `FK_Employee__ID` (`FK_Employee__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Prep_Attribute_Option`
--

DROP TABLE IF EXISTS `Prep_Attribute_Option`;
CREATE TABLE `Prep_Attribute_Option` (
  `Prep_Attribute_Option_ID` int(11) NOT NULL auto_increment,
  `FK_Protocol_Step__ID` int(11) NOT NULL default '0',
  `Option_Description` text,
  `FK_Attribute__ID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`Prep_Attribute_Option_ID`),
  KEY `FK_Protocol_Step__ID` (`FK_Protocol_Step__ID`),
  KEY `FK_Attribute__ID` (`FK_Attribute__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Prep_Attribute`
--

DROP TABLE IF EXISTS `Prep_Attribute`;
CREATE TABLE `Prep_Attribute` (
  `FK_Prep__ID` int(11) NOT NULL default '0',
  `FK_Attribute__ID` int(11) NOT NULL default '0',
  `Attribute_Value` text NOT NULL,
  `Prep_Attribute_ID` int(11) NOT NULL auto_increment,
  `FK_Employee__ID` int(11) default NULL,
  `Set_DateTime` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`Prep_Attribute_ID`),
  UNIQUE KEY `FK_Attribute__ID_2` (`FK_Attribute__ID`,`FK_Prep__ID`),
  KEY `FK_Prep__ID` (`FK_Prep__ID`),
  KEY `FK_Attribute__ID` (`FK_Attribute__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Prep_Detail_Option`
--

DROP TABLE IF EXISTS `Prep_Detail_Option`;
CREATE TABLE `Prep_Detail_Option` (
  `Prep_Detail_Option_ID` int(11) NOT NULL auto_increment,
  `FK_Protocol_Step__ID` int(11) NOT NULL default '0',
  `Option_Description` text,
  `FK_Attribute__ID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`Prep_Detail_Option_ID`),
  KEY `FK_Protocol_Step__ID` (`FK_Protocol_Step__ID`),
  KEY `FK_Attribute__ID` (`FK_Attribute__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Prep_Details`
--

DROP TABLE IF EXISTS `Prep_Details`;
CREATE TABLE `Prep_Details` (
  `Prep_Details_ID` int(11) NOT NULL auto_increment,
  `FK_Prep__ID` int(11) NOT NULL default '0',
  `FK_Attribute__ID` int(11) NOT NULL default '0',
  `Prep_Details_Value` text,
  PRIMARY KEY  (`Prep_Details_ID`),
  KEY `prep_id` (`FK_Prep__ID`),
  KEY `FK_Attribute__ID` (`FK_Attribute__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Prep`
--

DROP TABLE IF EXISTS `Prep`;
CREATE TABLE `Prep` (
  `Prep_Name` varchar(80) default NULL,
  `FK_Employee__ID` int(11) default NULL,
  `Prep_DateTime` datetime NOT NULL default '0000-00-00 00:00:00',
  `Prep_Time` text,
  `Prep_Conditions` text,
  `Prep_Comments` text,
  `FK_Equipment__ID` int(11) default NULL,
  `FK_Solution__ID` int(11) default NULL,
  `Solution_Quantity` float default NULL,
  `Prep_Failure_Date` datetime NOT NULL default '0000-00-00 00:00:00',
  `Prep_Action` enum('Completed','Failed','Skipped') default NULL,
  `FK_Lab_Protocol__ID` int(11) default NULL,
  `Prep_ID` int(11) NOT NULL auto_increment,
  `Transfer_Quantity` float(10,3) default NULL,
  `Transfer_Quantity_Units` enum('ml','ul','mg','ug','ng','pg') default NULL,
  `FK_FailureReason__ID` int(11) default NULL,
  `Attr_temp` text,
  PRIMARY KEY  (`Prep_ID`),
  KEY `protocol` (`FK_Lab_Protocol__ID`,`Prep_Name`),
  KEY `timestamp` (`Prep_DateTime`),
  KEY `FK_Equipment__ID` (`FK_Equipment__ID`),
  KEY `FK_Employee__ID` (`FK_Employee__ID`),
  KEY `FK_Solution__ID` (`FK_Solution__ID`),
  KEY `FK_FailureReason__ID` (`FK_FailureReason__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Primer_Customization`
--

DROP TABLE IF EXISTS `Primer_Customization`;
CREATE TABLE `Primer_Customization` (
  `Primer_Customization_ID` int(11) NOT NULL auto_increment,
  `FK_Primer__Name` varchar(40) NOT NULL default '',
  `Tm_Working` float(5,2) default NULL,
  `Direction` enum('Forward','Reverse','Unknown') default 'Unknown',
  `Amplicon_Length` int(11) default NULL,
  `Position` enum('Outer','Nested') default NULL,
  PRIMARY KEY  (`Primer_Customization_ID`),
  KEY `fk_primer` (`FK_Primer__Name`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Primer_Info`
--

DROP TABLE IF EXISTS `Primer_Info`;
CREATE TABLE `Primer_Info` (
  `Primer_Info_ID` int(11) NOT NULL auto_increment,
  `FK_Solution__ID` int(11) default NULL,
  `nMoles` float default NULL,
  `micrograms` float default NULL,
  `ODs` float default NULL,
  PRIMARY KEY  (`Primer_Info_ID`),
  KEY `FK_Solution__ID` (`FK_Solution__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Primer_Order`
--

DROP TABLE IF EXISTS `Primer_Order`;
CREATE TABLE `Primer_Order` (
  `Primer_Order_ID` int(11) NOT NULL auto_increment,
  `Primer_Name` varchar(40) default NULL,
  `Order_DateTime` date default NULL,
  `Received_DateTime` date default '0000-00-00',
  `FK_Employee__ID` int(11) default NULL,
  PRIMARY KEY  (`Primer_Order_ID`),
  KEY `FK_Employee__ID` (`FK_Employee__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Primer_Plate`
--

DROP TABLE IF EXISTS `Primer_Plate`;
CREATE TABLE `Primer_Plate` (
  `Primer_Plate_ID` int(11) NOT NULL auto_increment,
  `Primer_Plate_Name` text,
  `Order_DateTime` datetime default NULL,
  `Arrival_DateTime` datetime default NULL,
  `Primer_Plate_Status` enum('To Order','Ordered','Received','Inactive') default NULL,
  `FK_Solution__ID` int(11) default NULL,
  `Notes` varchar(40) default NULL,
  `Notify_List` text,
  `FK_Lab_Request__ID` int(11) default NULL,
  PRIMARY KEY  (`Primer_Plate_ID`),
  KEY `primerplate_arrival` (`Arrival_DateTime`),
  KEY `primerplate_status` (`Primer_Plate_Status`),
  KEY `primerplate_name` (`Primer_Plate_Name`(40)),
  KEY `FK_Solution__ID` (`FK_Solution__ID`),
  KEY `FK_Lab_Request__ID` (`FK_Lab_Request__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Primer_Plate_Well`
--

DROP TABLE IF EXISTS `Primer_Plate_Well`;
CREATE TABLE `Primer_Plate_Well` (
  `Primer_Plate_Well_ID` int(11) NOT NULL auto_increment,
  `Well` char(3) default NULL,
  `FK_Primer__Name` varchar(80) default NULL,
  `FK_Primer_Plate__ID` int(11) default NULL,
  `FKParent_Primer_Plate_Well__ID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`Primer_Plate_Well_ID`),
  KEY `primerplate_well` (`Well`),
  KEY `primerplatewell_name` (`FK_Primer__Name`),
  KEY `primerplatewell_fkplate` (`FK_Primer_Plate__ID`),
  KEY `parent` (`FKParent_Primer_Plate_Well__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Primer`
--

DROP TABLE IF EXISTS `Primer`;
CREATE TABLE `Primer` (
  `Primer_Name` varchar(40) NOT NULL default '',
  `Primer_Sequence` text NOT NULL,
  `Primer_ID` int(2) NOT NULL auto_increment,
  `Purity` text,
  `Tm1` int(2) default NULL,
  `Tm50` int(2) default NULL,
  `GC_Percent` int(2) default NULL,
  `Coupling_Eff` float(10,2) default NULL,
  `Primer_Type` enum('Standard','Custom','Oligo','Amplicon','Adapter') default NULL,
  `Primer_OrderDateTime` datetime default NULL,
  `Primer_External_Order_Number` varchar(80) default NULL,
  `Primer_Status` enum('','Ordered','Received','Inactive') default '',
  PRIMARY KEY  (`Primer_ID`),
  UNIQUE KEY `primer` (`Primer_Name`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Printer_Assignment`
--

DROP TABLE IF EXISTS `Printer_Assignment`;
CREATE TABLE `Printer_Assignment` (
  `Printer_Assignment_ID` int(11) NOT NULL auto_increment,
  `FK_Printer_Group__ID` int(11) NOT NULL default '0',
  `FK_Printer__ID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`Printer_Assignment_ID`)
) TYPE=MyISAM;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Printer_Group`
--

DROP TABLE IF EXISTS `Printer_Group`;
CREATE TABLE `Printer_Group` (
  `Printer_Group_ID` int(11) NOT NULL auto_increment,
  `Printer_Group_Name` varchar(40) NOT NULL default '',
  PRIMARY KEY  (`Printer_Group_ID`)
) TYPE=MyISAM;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Printer`
--

DROP TABLE IF EXISTS `Printer`;
CREATE TABLE `Printer` (
  `Printer_ID` int(11) NOT NULL auto_increment,
  `Printer_Name` varchar(40) default '',
  `Printer_DPI` int(11) NOT NULL default '0',
  `Printer_Location` varchar(40) default NULL,
  `Printer_Type` varchar(40) NOT NULL default '',
  `Printer_Address` varchar(80) NOT NULL default '',
  `Printer_Output` enum('text','ZPL','latex') default 'ZPL',
  PRIMARY KEY  (`Printer_ID`),
  KEY `prnname` (`Printer_Name`)
) TYPE=MyISAM;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `ProcedureTest_Condition`
--

DROP TABLE IF EXISTS `ProcedureTest_Condition`;
CREATE TABLE `ProcedureTest_Condition` (
  `ProcedureTest_Condition_ID` int(11) NOT NULL auto_increment,
  `FK_Ordered_Procedure__ID` int(11) NOT NULL default '0',
  `FK_Test_Condition__ID` int(11) NOT NULL default '0',
  `Test_Condition_Number` tinyint(11) NOT NULL default '0',
  PRIMARY KEY  (`ProcedureTest_Condition_ID`),
  KEY `FK_Ordered_Procedure__ID` (`FK_Ordered_Procedure__ID`),
  KEY `FK_Test_Condition__ID` (`FK_Test_Condition__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Project`
--

DROP TABLE IF EXISTS `Project`;
CREATE TABLE `Project` (
  `Project_Name` varchar(40) NOT NULL default '',
  `Project_Description` text,
  `Project_Initiated` date NOT NULL default '0000-00-00',
  `Project_Completed` date default NULL,
  `Project_Type` enum('EST','EST+','SAGE','cDNA','PCR','PCR Product','Genomic Clone','Other','Test') default NULL,
  `Project_Path` varchar(80) default NULL,
  `Project_ID` int(11) NOT NULL auto_increment,
  `Project_Status` enum('Active','Inactive','Completed') default NULL,
  `FK_Funding__ID` int(11) default NULL,
  PRIMARY KEY  (`Project_ID`),
  UNIQUE KEY `path` (`Project_Path`),
  KEY `FK_Funding__ID` (`FK_Funding__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `ProjectStudy`
--

DROP TABLE IF EXISTS `ProjectStudy`;
CREATE TABLE `ProjectStudy` (
  `ProjectStudy_ID` int(11) NOT NULL auto_increment,
  `FK_Project__ID` int(11) default NULL,
  `FK_Study__ID` int(11) default NULL,
  PRIMARY KEY  (`ProjectStudy_ID`),
  UNIQUE KEY `projectstudy` (`FK_Project__ID`,`FK_Study__ID`),
  KEY `project_id` (`FK_Project__ID`),
  KEY `study_id` (`FK_Study__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Protocol_Step`
--

DROP TABLE IF EXISTS `Protocol_Step`;
CREATE TABLE `Protocol_Step` (
  `Protocol_Step_Number` int(11) default NULL,
  `Protocol_Step_Name` varchar(80) NOT NULL default '',
  `Protocol_Step_Instructions` text,
  `Protocol_Step_ID` int(11) NOT NULL auto_increment,
  `Protocol_Step_Defaults` text,
  `Input` text,
  `Scanner` tinyint(3) unsigned default '1',
  `Protocol_Step_Message` varchar(40) default NULL,
  `FK_Employee__ID` int(11) default NULL,
  `Protocol_Step_Changed` date default NULL,
  `Input_Format` text NOT NULL,
  `FK_Lab_Protocol__ID` int(11) default NULL,
  PRIMARY KEY  (`Protocol_Step_ID`),
  UNIQUE KEY `naming` (`Protocol_Step_Name`,`FK_Lab_Protocol__ID`),
  KEY `prot` (`FK_Lab_Protocol__ID`),
  KEY `employee_id` (`FK_Employee__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Protocol_Tracking`
--

DROP TABLE IF EXISTS `Protocol_Tracking`;
CREATE TABLE `Protocol_Tracking` (
  `Protocol_Tracking_ID` int(11) NOT NULL auto_increment,
  `Protocol_Tracking_Title` char(20) default NULL,
  `Protocol_Tracking_Step_Name` char(40) default NULL,
  `Protocol_Tracking_Order` int(11) default NULL,
  `Protocol_Tracking_Type` enum('Step','Plasticware') default NULL,
  `Protocol_Tracking_Status` enum('Active','InActive') default NULL,
  `FK_Grp__ID` int(11) default NULL,
  PRIMARY KEY  (`Protocol_Tracking_ID`),
  KEY `FK_Grp__ID` (`FK_Grp__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Rack`
--

DROP TABLE IF EXISTS `Rack`;
CREATE TABLE `Rack` (
  `Rack_ID` int(4) NOT NULL auto_increment,
  `FK_Equipment__ID` int(11) default NULL,
  `Rack_Conditions` enum('Temporary','Room Temperature','+4 degrees','-20 degrees','-40 degrees','-80 degrees','Garbage','Exported') default NULL,
  `Rack_Type` enum('Shelf','Rack','Box','Slot') NOT NULL default 'Shelf',
  `Rack_Name` varchar(80) default NULL,
  `Movable` enum('Y','N') NOT NULL default 'Y',
  `Rack_Alias` varchar(80) default NULL,
  `FKParent_Rack__ID` int(11) default NULL,
  PRIMARY KEY  (`Rack_ID`),
  UNIQUE KEY `alias` (`Rack_Alias`),
  KEY `Equipment_FK` (`FK_Equipment__ID`),
  KEY `type` (`Rack_Type`),
  KEY `name` (`Rack_Name`),
  KEY `parent_rack_id` (`FKParent_Rack__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `ReArray_Attribute`
--

DROP TABLE IF EXISTS `ReArray_Attribute`;
CREATE TABLE `ReArray_Attribute` (
  `ReArray_Attribute_ID` int(11) NOT NULL auto_increment,
  `FK_Attribute__ID` int(11) NOT NULL default '0',
  `FK_ReArray__ID` int(11) NOT NULL default '0',
  `Attribute_Value` text,
  PRIMARY KEY  (`ReArray_Attribute_ID`),
  UNIQUE KEY `Attribute_ReArray` (`FK_Attribute__ID`,`FK_ReArray__ID`),
  KEY `FK_Attribute__ID` (`FK_Attribute__ID`),
  KEY `FK_ReArray__ID` (`FK_ReArray__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `ReArray_Plate`
--

DROP TABLE IF EXISTS `ReArray_Plate`;
CREATE TABLE `ReArray_Plate` (
  `ReArray_Plate_ID` int(11) NOT NULL auto_increment,
  `FK_Source__ID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ReArray_Plate_ID`),
  KEY `FK_Source__ID` (`FK_Source__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `ReArray_Request`
--

DROP TABLE IF EXISTS `ReArray_Request`;
CREATE TABLE `ReArray_Request` (
  `ReArray_Notify` text,
  `ReArray_Format_Size` enum('96-well','384-well') NOT NULL default '96-well',
  `ReArray_Type` enum('Clone Rearray','Manual Rearray','Reaction Rearray','Extraction Rearray','Pool Rearray') default NULL,
  `FK_Employee__ID` int(11) default NULL,
  `Request_DateTime` datetime default NULL,
  `FKTarget_Plate__ID` int(11) default NULL,
  `ReArray_Comments` text,
  `ReArray_Request` text,
  `ReArray_Request_ID` int(11) NOT NULL auto_increment,
  `FK_Lab_Request__ID` int(11) default NULL,
  `FK_Status__ID` int(11) NOT NULL default '0',
  `ReArray_Purpose` enum('Not applicable','96-well oligo prep','96-well EST prep','384-well oligo prep','384-well EST prep','384-well hardstop prep') default 'Not applicable',
  PRIMARY KEY  (`ReArray_Request_ID`),
  KEY `request_time` (`Request_DateTime`),
  KEY `request_target` (`FKTarget_Plate__ID`),
  KEY `request_emp` (`FK_Employee__ID`),
  KEY `FK_Lab_Request__ID` (`FK_Lab_Request__ID`),
  KEY `FK_Status__ID` (`FK_Status__ID`),
  KEY `ReArray_Purpose` (`ReArray_Purpose`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `ReArray`
--

DROP TABLE IF EXISTS `ReArray`;
CREATE TABLE `ReArray` (
  `FKSource_Plate__ID` int(11) NOT NULL default '0',
  `Source_Well` char(3) NOT NULL default '',
  `Target_Well` char(3) NOT NULL default '',
  `ReArray_ID` int(11) NOT NULL auto_increment,
  `FK_ReArray_Request__ID` int(11) NOT NULL default '0',
  `FK_Sample__ID` int(11) default '-1',
  PRIMARY KEY  (`ReArray_ID`),
  KEY `rearray_req` (`FK_ReArray_Request__ID`),
  KEY `target` (`Target_Well`),
  KEY `source` (`FKSource_Plate__ID`),
  KEY `fk_sample` (`FK_Sample__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Restriction_Site`
--

DROP TABLE IF EXISTS `Restriction_Site`;
CREATE TABLE `Restriction_Site` (
  `Restriction_Site_Name` varchar(20) NOT NULL default '',
  `Recognition_Sequence` text,
  `Restriction_Site_ID` int(11) NOT NULL auto_increment,
  PRIMARY KEY  (`Restriction_Site_ID`),
  UNIQUE KEY `Restriction_Site_Name` (`Restriction_Site_Name`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `RNA_Collection`
--

DROP TABLE IF EXISTS `RNA_Collection`;
CREATE TABLE `RNA_Collection` (
  `RNA_Collection_ID` int(11) NOT NULL auto_increment,
  `FK_Library__Name` varchar(6) NOT NULL default '',
  `RNA_Source_Format` enum('RNA_Tube') NOT NULL default 'RNA_Tube',
  `Collection_Type` enum('SAGE','LongSAGE','PCR-SAGE','PCR-LongSAGE','SAGELite-SAGE','SAGELite-LongSAGE') default NULL,
  PRIMARY KEY  (`RNA_Collection_ID`),
  UNIQUE KEY `FK_Library__Name` (`FK_Library__Name`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `RNA_Source`
--

DROP TABLE IF EXISTS `RNA_Source`;
CREATE TABLE `RNA_Source` (
  `RNA_Source_ID` int(11) NOT NULL auto_increment,
  `FK_Source__ID` int(11) NOT NULL default '0',
  `Sample_Collection_Date` date NOT NULL default '0000-00-00',
  `RNA_Isolation_Date` date NOT NULL default '0000-00-00',
  `RNA_Isolation_Method` varchar(40) default NULL,
  `Nature` enum('','Total RNA','mRNA','Tissue','Cells','RNA - DNase Treated','cDNA','1st strand cDNA','Amplified cDNA','Ditag','Concatemer - Insert','Concatemer - Cloned') NOT NULL default '',
  `Description` text,
  `Submitted_Amount` double(8,4) default NULL,
  `Submitted_Amount_Units` enum('','Cells','Embryos','Litters','Organs','mg','ug','ng','pg') default NULL,
  `Storage_Medium` enum('','RNALater','Trizol','Lysis Buffer','Ethanol','DEPC Water','Qiazol') default '',
  `Storage_Medium_Quantity` double(8,4) default NULL,
  `Storage_Medium_Quantity_Units` enum('ml','ul') default NULL,
  PRIMARY KEY  (`RNA_Source_ID`),
  KEY `FK_Source__ID` (`FK_Source__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Run_Attribute`
--

DROP TABLE IF EXISTS `Run_Attribute`;
CREATE TABLE `Run_Attribute` (
  `Run_Attribute_ID` int(11) NOT NULL auto_increment,
  `FK_Run__ID` int(11) NOT NULL default '0',
  `FK_Attribute__ID` int(11) NOT NULL default '0',
  `Attribute_Value` text NOT NULL,
  `FK_Employee__ID` int(11) default NULL,
  `Set_DateTime` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`Run_Attribute_ID`),
  UNIQUE KEY `run_attribute` (`FK_Attribute__ID`,`FK_Run__ID`),
  KEY `FK_Run__ID` (`FK_Run__ID`),
  KEY `FK_Attribute__ID` (`FK_Attribute__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `RunBatch`
--

DROP TABLE IF EXISTS `RunBatch`;
CREATE TABLE `RunBatch` (
  `RunBatch_ID` int(11) NOT NULL auto_increment,
  `RunBatch_RequestDateTime` datetime NOT NULL default '0000-00-00 00:00:00',
  `FK_Employee__ID` int(11) default NULL,
  `FK_Equipment__ID` int(11) default NULL,
  `RunBatch_Comments` text,
  PRIMARY KEY  (`RunBatch_ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `RunPlate`
--

DROP TABLE IF EXISTS `RunPlate`;
CREATE TABLE `RunPlate` (
  `Sequence_ID` int(11) NOT NULL default '0',
  `Plate_Number` int(4) NOT NULL default '0',
  `Parent_Quadrant` char(1) default ''
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Run`
--

DROP TABLE IF EXISTS `Run`;
CREATE TABLE `Run` (
  `Run_ID` int(11) NOT NULL auto_increment,
  `Run_Type` enum('SequenceRun','GelRun','AffyRun') NOT NULL default 'SequenceRun',
  `FK_Plate__ID` int(11) default NULL,
  `FK_RunBatch__ID` int(11) default NULL,
  `Run_DateTime` datetime default NULL,
  `Run_Comments` text,
  `Run_Test_Status` enum('Production','Test') default NULL,
  `FKPosition_Rack__ID` int(11) default NULL,
  `Run_Status` enum('In Process','Analyzed','Aborted','Failed','Expired','Not Applicable') default NULL,
  `Run_Directory` varchar(80) default NULL,
  `Billable` enum('Yes','No') default 'Yes',
  `Run_Validation` enum('Pending','Approved','Rejected') default 'Pending',
  PRIMARY KEY  (`Run_ID`),
  UNIQUE KEY `Run_Directory` (`Run_Directory`),
  KEY `date` (`Run_DateTime`),
  KEY `plate` (`FK_Plate__ID`),
  KEY `state` (`Run_Status`),
  KEY `position` (`FKPosition_Rack__ID`),
  KEY `FK_RunBatch__ID` (`FK_RunBatch__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `SAGE_Library`
--

DROP TABLE IF EXISTS `SAGE_Library`;
CREATE TABLE `SAGE_Library` (
  `SAGE_Library_ID` int(11) NOT NULL auto_increment,
  `FK_Sequencing_Library__ID` int(11) NOT NULL default '0',
  `Concatamer_Size_Fraction` int(11) NOT NULL default '0',
  `Clones_under500Insert_Percent` int(11) default '0',
  `Clones_over500Insert_Percent` int(11) default '0',
  `Tags_Requested` int(11) default NULL,
  `RNA_Extraction` text,
  `SAGE_Library_Type` enum('SAGE','LongSAGE','PCR-SAGE','PCR-LongSAGE','SAGELite-SAGE','SAGELite-LongSAGE') default NULL,
  `FKInsertSite_Enzyme__ID` int(11) default NULL,
  `FKAnchoring_Enzyme__ID` int(11) default NULL,
  `FKTagging_Enzyme__ID` int(11) default NULL,
  `Clones_with_no_Insert_Percent` int(11) default '0',
  `Starting_RNA_Amnt_ng` float(10,3) default NULL,
  `PCR_Cycles` int(11) default NULL,
  `cDNA_Amnt_Used_ng` float(10,3) default NULL,
  `DiTag_PCR_Cycle` int(11) default NULL,
  `DiTag_Template_Dilution_Factor` int(11) default NULL,
  `Adapter_A` varchar(20) default NULL,
  `Adapter_B` varchar(20) default NULL,
  PRIMARY KEY  (`SAGE_Library_ID`),
  KEY `lib_id` (`FK_Sequencing_Library__ID`),
  KEY `FKAnchoring_Enzyme__ID` (`FKAnchoring_Enzyme__ID`),
  KEY `FKTagging_Enzyme__ID` (`FKTagging_Enzyme__ID`),
  KEY `FKInsertSite_Enzyme__ID` (`FKInsertSite_Enzyme__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

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
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Sample_Attribute`
--

DROP TABLE IF EXISTS `Sample_Attribute`;
CREATE TABLE `Sample_Attribute` (
  `FK_Sample__ID` int(11) NOT NULL default '0',
  `FK_Attribute__ID` int(11) NOT NULL default '0',
  `Attribute_Value` text NOT NULL,
  `Sample_Attribute_ID` int(11) NOT NULL auto_increment,
  PRIMARY KEY  (`Sample_Attribute_ID`),
  UNIQUE KEY `sample_attribute` (`FK_Sample__ID`,`FK_Attribute__ID`),
  KEY `FK_Sample__ID` (`FK_Sample__ID`),
  KEY `FK_Attribute__ID` (`FK_Attribute__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Sample_Pool`
--

DROP TABLE IF EXISTS `Sample_Pool`;
CREATE TABLE `Sample_Pool` (
  `Sample_Pool_ID` int(11) NOT NULL auto_increment,
  `FK_Pool__ID` int(11) NOT NULL default '0',
  `FKTarget_Plate__ID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`Sample_Pool_ID`),
  UNIQUE KEY `pool_id` (`FK_Pool__ID`),
  UNIQUE KEY `target_plate` (`FKTarget_Plate__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Sample`
--

DROP TABLE IF EXISTS `Sample`;
CREATE TABLE `Sample` (
  `Sample_ID` int(11) NOT NULL auto_increment,
  `Sample_Name` varchar(40) default NULL,
  `Sample_Type` enum('Clone','Extraction') default NULL,
  `Sample_Comments` text,
  `FKParent_Sample__ID` int(11) default NULL,
  `FK_Source__ID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`Sample_ID`),
  KEY `name` (`Sample_Name`),
  KEY `FKParent_Sample__ID` (`FKParent_Sample__ID`),
  KEY `Sample_Type` (`Sample_Type`),
  KEY `FK_Source__ID` (`FK_Source__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Seq_temp`
--

DROP TABLE IF EXISTS `Seq_temp`;
CREATE TABLE `Seq_temp` (
  `Sequence_ID` int(11) NOT NULL default '0',
  `Sequence_DateTime` datetime NOT NULL default '0000-00-00 00:00:00',
  KEY `id` (`Sequence_ID`),
  KEY `date` (`Sequence_DateTime`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `SequenceAnalysis`
--

DROP TABLE IF EXISTS `SequenceAnalysis`;
CREATE TABLE `SequenceAnalysis` (
  `SequenceAnalysis_ID` int(11) NOT NULL auto_increment,
  `FK_SequenceRun__ID` int(11) default NULL,
  `SequenceAnalysis_DateTime` datetime NOT NULL default '0000-00-00 00:00:00',
  `Phred_Version` varchar(20) NOT NULL default '',
  `Reads` int(11) default NULL,
  `Q20array` blob,
  `SLarray` blob,
  `Q20mean` int(11) default NULL,
  `Q20median` int(11) default NULL,
  `Q20max` int(11) default NULL,
  `Q20min` int(11) default NULL,
  `SLmean` int(11) default NULL,
  `SLmedian` int(11) default NULL,
  `SLmax` int(11) default NULL,
  `SLmin` int(11) default NULL,
  `QVmean` int(11) default NULL,
  `QVtotal` int(11) default NULL,
  `Wells` int(11) default NULL,
  `NGs` int(11) default NULL,
  `SGs` int(11) default NULL,
  `EWs` int(11) default NULL,
  `PWs` int(11) default NULL,
  `QLmean` int(11) default NULL,
  `QLtotal` int(11) default NULL,
  `Q20total` int(11) default NULL,
  `SLtotal` int(11) default NULL,
  `AllReads` int(11) default NULL,
  `AllBPs` int(11) default NULL,
  `VectorSegmentWarnings` int(11) default NULL,
  `ContaminationWarnings` int(11) default NULL,
  `VectorOnlyWarnings` int(11) default NULL,
  `RecurringStringWarnings` int(11) default NULL,
  `PoorQualityWarnings` int(11) default NULL,
  `PeakAreaRatioWarnings` int(11) default NULL,
  `successful_reads` int(11) default NULL,
  `trimmed_successful_reads` int(11) default NULL,
  `A_SStotal` int(11) default NULL,
  `T_SStotal` int(11) default NULL,
  `G_SStotal` int(11) default NULL,
  `C_SStotal` int(11) default NULL,
  `Vtotal` int(11) default NULL,
  PRIMARY KEY  (`SequenceAnalysis_ID`),
  UNIQUE KEY `FK_SequenceRun__ID_2` (`FK_SequenceRun__ID`),
  KEY `FK_SequenceRun__ID` (`FK_SequenceRun__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Sequencer_Type`
--

DROP TABLE IF EXISTS `Sequencer_Type`;
CREATE TABLE `Sequencer_Type` (
  `Sequencer_Type_ID` tinyint(4) NOT NULL auto_increment,
  `Sequencer_Type_Name` varchar(20) NOT NULL default '',
  `Well_Ordering` enum('Columns','Rows') NOT NULL default 'Columns',
  `Zero_Pad_Columns` enum('YES','NO') NOT NULL default 'NO',
  `FileFormat` varchar(255) NOT NULL default '',
  `RunDirectory` varchar(255) NOT NULL default '',
  `TraceFileExt` varchar(40) NOT NULL default '',
  `FailedTraceFileExt` varchar(40) NOT NULL default '',
  `SS_extension` varchar(5) default NULL,
  `Default_Terminator` enum('Big Dye','Water') NOT NULL default 'Water',
  `Capillaries` int(3) default NULL,
  `Sliceable` enum('Yes','No') default 'No',
  `By_Quadrant` enum('Yes','No') default 'No',
  PRIMARY KEY  (`Sequencer_Type_ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `SequenceRun`
--

DROP TABLE IF EXISTS `SequenceRun`;
CREATE TABLE `SequenceRun` (
  `SequenceRun_ID` int(11) NOT NULL auto_increment,
  `FK_Run__ID` int(11) default NULL,
  `FK_Chemistry_Code__Name` varchar(5) default NULL,
  `FKPrimer_Solution__ID` int(11) default NULL,
  `FKMatrix_Solution__ID` int(11) default NULL,
  `FKBuffer_Solution__ID` int(11) default NULL,
  `DNA_Volume` float default NULL,
  `Total_Prep_Volume` smallint(6) default NULL,
  `BrewMix_Concentration` float default NULL,
  `Reaction_Volume` tinyint(4) default NULL,
  `Resuspension_Volume` tinyint(4) default NULL,
  `Slices` varchar(20) default NULL,
  `Run_Format` enum('96','384','96x4','16xN') default NULL,
  `Run_Module` varchar(128) default NULL,
  `Run_Time` int(11) default NULL,
  `Run_Voltage` int(11) default NULL,
  `Run_Temperature` int(11) default NULL,
  `Injection_Time` int(11) default NULL,
  `Injection_Voltage` int(11) default NULL,
  `Mobility_Version` enum('','1','2','3') default '',
  `PlateSealing` enum('None','Foil','Heat Sealing','Septa') default 'None',
  PRIMARY KEY  (`SequenceRun_ID`),
  UNIQUE KEY `FK_Run__ID_2` (`FK_Run__ID`),
  KEY `FK_Run__ID` (`FK_Run__ID`),
  KEY `FKPrimer_Solution__ID` (`FKPrimer_Solution__ID`),
  KEY `FK_Chemistry_Code__Name` (`FK_Chemistry_Code__Name`),
  KEY `FKMatrix_Solution__ID` (`FKMatrix_Solution__ID`,`FKBuffer_Solution__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Sequencing_Library`
--

DROP TABLE IF EXISTS `Sequencing_Library`;
CREATE TABLE `Sequencing_Library` (
  `Sequencing_Library_ID` int(11) NOT NULL auto_increment,
  `FK_Library__Name` varchar(40) NOT NULL default '',
  `Sequencing_Library_Type` enum('SAGE','cDNA','Genomic','EST','Transposon','PCR','Test') default NULL,
  `FK_Vector__Name` varchar(40) default NULL,
  `Host` text NOT NULL,
  `Organism` varchar(40) default NULL,
  `Sex` varchar(20) default NULL,
  `Tissue` varchar(40) default NULL,
  `Strain` varchar(40) default NULL,
  `FK_Vector__ID` int(11) default NULL,
  `Colonies_Screened` int(11) default NULL,
  `Clones_NoInsert_Percent` int(11) default NULL,
  `AvgInsertSize` int(11) default NULL,
  `InsertSizeMin` int(11) default NULL,
  `InsertSizeMax` int(11) default NULL,
  `Source_RNA` text,
  `BlueWhiteSelection` enum('Yes','No') default NULL,
  `Sequencing_Library_Format` set('Ligation','Transformed Cells','Microtiter Plates','ReArrayed') default NULL,
  `FKVector_Organization__ID` int(11) default NULL,
  `Vector_Type` enum('Plasmid','Fosmid','Cosmid','BAC') default NULL,
  `Vector_Catalog_Number` text,
  `Antibiotic_Concentration` float default NULL,
  `FK3Prime_Restriction_Site__ID` int(11) default NULL,
  `FK5Prime_Restriction_Site__ID` int(11) default NULL,
  PRIMARY KEY  (`Sequencing_Library_ID`),
  UNIQUE KEY `FK_Library__Name` (`FK_Library__Name`),
  KEY `FKVector_Organization__ID` (`FKVector_Organization__ID`),
  KEY `FK3Prime_Restriction_Site__ID` (`FK3Prime_Restriction_Site__ID`),
  KEY `FK_Vector__Name` (`FK_Vector__Name`),
  KEY `FK_Vector__ID` (`FK_Vector__ID`),
  KEY `FK5Prime_Restriction_Site__ID` (`FK5Prime_Restriction_Site__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Service_Contract`
--

DROP TABLE IF EXISTS `Service_Contract`;
CREATE TABLE `Service_Contract` (
  `Service_Contract_BeginDate` date default NULL,
  `Service_Contract_ExpiryDate` date default NULL,
  `FK_Organization__ID` int(11) default NULL,
  `FK_Equipment__ID` int(11) default NULL,
  `FK_Orders__ID` int(11) default NULL,
  `Service_Contract_Number` int(11) default NULL,
  `Service_Contract_Number_in_Batch` int(11) default NULL,
  `Service_Contract_ID` int(11) NOT NULL auto_increment,
  PRIMARY KEY  (`Service_Contract_ID`),
  KEY `FK_Orders__ID` (`FK_Orders__ID`),
  KEY `FK_Organization__ID` (`FK_Organization__ID`),
  KEY `FK_Equipment__ID` (`FK_Equipment__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Service`
--

DROP TABLE IF EXISTS `Service`;
CREATE TABLE `Service` (
  `FK_Equipment__ID` int(11) default NULL,
  `FK_Equipment__Type` varchar(40) default NULL,
  `Service_Interval` tinyint(4) default NULL,
  `Interval_Frequency` enum('Year','Month','Week','Day') default NULL,
  `Service_Name` text,
  `Service_ID` int(11) NOT NULL auto_increment,
  PRIMARY KEY  (`Service_ID`),
  UNIQUE KEY `service` (`FK_Equipment__ID`,`FK_Equipment__Type`),
  KEY `FK_Equipment__Type` (`FK_Equipment__Type`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Setting`
--

DROP TABLE IF EXISTS `Setting`;
CREATE TABLE `Setting` (
  `Setting_ID` int(11) NOT NULL auto_increment,
  `Setting_Name` varchar(40) default NULL,
  `Setting_Default` varchar(40) default NULL,
  `Setting_Description` text,
  PRIMARY KEY  (`Setting_ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Solution_Info`
--

DROP TABLE IF EXISTS `Solution_Info`;
CREATE TABLE `Solution_Info` (
  `Solution_Info_ID` int(11) NOT NULL auto_increment,
  `nMoles` float default NULL,
  `ODs` float default NULL,
  `micrograms` float default NULL,
  PRIMARY KEY  (`Solution_Info_ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Solution`
--

DROP TABLE IF EXISTS `Solution`;
CREATE TABLE `Solution` (
  `Solution_ID` int(11) NOT NULL auto_increment,
  `Solution_Started` datetime default NULL,
  `Solution_Quantity` float default NULL,
  `Solution_Expiry` date default NULL,
  `Quantity_Used` float default '0',
  `FK_Rack__ID` int(11) default NULL,
  `Solution_Finished` date default NULL,
  `Solution_Type` enum('Reagent','Solution','Primer','Buffer','Matrix') default NULL,
  `Solution_Status` enum('Unopened','Open','Finished','Temporary','Expired') default 'Unopened',
  `Solution_Cost` float default NULL,
  `FK_Stock__ID` int(11) default NULL,
  `FK_Solution_Info__ID` int(11) default NULL,
  `Solution_Number` int(11) default NULL,
  `Solution_Number_in_Batch` int(11) default NULL,
  `Solution_Notes` text,
  `QC_Status` enum('N/A','Pending','Failed','Re-Test','Passed') default 'N/A',
  PRIMARY KEY  (`Solution_ID`),
  KEY `stock` (`FK_Stock__ID`),
  KEY `FK_Solution_Info__ID` (`FK_Solution_Info__ID`),
  KEY `FK_Rack__ID` (`FK_Rack__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Source_Attribute`
--

DROP TABLE IF EXISTS `Source_Attribute`;
CREATE TABLE `Source_Attribute` (
  `Source_Attribute_ID` int(11) NOT NULL auto_increment,
  `FK_Source__ID` int(11) NOT NULL default '0',
  `FK_Attribute__ID` int(11) NOT NULL default '0',
  `Attribute_Value` text NOT NULL,
  `FK_Employee__ID` int(11) default NULL,
  `Set_DateTime` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`Source_Attribute_ID`),
  UNIQUE KEY `source_attribute` (`FK_Source__ID`,`FK_Attribute__ID`),
  KEY `FK_Source__ID` (`FK_Source__ID`),
  KEY `FK_Attribute__ID` (`FK_Attribute__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Source_Pool`
--

DROP TABLE IF EXISTS `Source_Pool`;
CREATE TABLE `Source_Pool` (
  `Source_Pool_ID` int(11) NOT NULL auto_increment,
  `FKParent_Source__ID` int(11) default NULL,
  `FKChild_Source__ID` int(11) default NULL,
  PRIMARY KEY  (`Source_Pool_ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Source`
--

DROP TABLE IF EXISTS `Source`;
CREATE TABLE `Source` (
  `Source_ID` int(11) NOT NULL auto_increment,
  `FKParent_Source__ID` int(11) default NULL,
  `External_Identifier` varchar(40) NOT NULL default '',
  `Source_Type` enum('Library_Segment','RNA_Source','ReArray_Plate','Ligation','Microtiter','Xformed_Cells','External') default NULL,
  `Source_Status` enum('Active','Inactive') default 'Active',
  `Label` varchar(40) default NULL,
  `FK_Original_Source__ID` int(11) default NULL,
  `Received_Date` date NOT NULL default '0000-00-00',
  `Current_Amount` float(10,3) default NULL,
  `Original_Amount` float(10,3) default NULL,
  `Amount_Units` enum('','ul','ml','ul/well','mg','ug','ng','pg','Cells','Embryos','Litters','Organs','Animals') default NULL,
  `FKReceived_Employee__ID` int(11) default NULL,
  `FK_Rack__ID` int(11) NOT NULL default '0',
  `Source_Number` int(11) NOT NULL default '1',
  `FK_Barcode_Label__ID` int(11) NOT NULL default '0',
  `Notes` text,
  `FKSource_Plate__ID` int(11) default NULL,
  PRIMARY KEY  (`Source_ID`),
  KEY `FK_Original_Source__ID` (`FK_Original_Source__ID`),
  KEY `FK_Rack__ID` (`FK_Rack__ID`),
  KEY `FKReceived_Employee__ID` (`FKReceived_Employee__ID`),
  KEY `FK_Barcode_Label__ID` (`FK_Barcode_Label__ID`),
  KEY `FKParent_Source__ID` (`FKParent_Source__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `SS_Config`
--

DROP TABLE IF EXISTS `SS_Config`;
CREATE TABLE `SS_Config` (
  `SS_Config_ID` int(11) NOT NULL auto_increment,
  `FK_Sequencer_Type__ID` int(4) NOT NULL default '0',
  `SS_Title` char(80) NOT NULL default '',
  `SS_Section` int(2) NOT NULL default '0',
  `SS_Order` tinyint(4) default NULL,
  `SS_Default` char(80) NOT NULL default '',
  `SS_Alias` char(80) NOT NULL default '',
  `SS_Orientation` enum('Column','Row','N/A') default NULL,
  `SS_Type` enum('Titled','Untitled','Hidden') NOT NULL default 'Titled',
  `SS_Prompt` enum('Text','Radio','Default','No') default NULL,
  `SS_Track` char(40) NOT NULL default '',
  PRIMARY KEY  (`SS_Config_ID`),
  KEY `FK_Sequencer_Type__ID` (`FK_Sequencer_Type__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `SS_Option`
--

DROP TABLE IF EXISTS `SS_Option`;
CREATE TABLE `SS_Option` (
  `SS_Option_ID` int(11) NOT NULL auto_increment,
  `FK_Equipment__ID` int(11) default NULL,
  `SS_Option_Alias` char(80) default NULL,
  `SS_Option_Value` char(80) default NULL,
  `FK_SS_Config__ID` int(11) default NULL,
  `SS_Option_Order` tinyint(4) default NULL,
  `SS_Option_Status` enum('Active','Inactive','Default','AutoSet') NOT NULL default 'Active',
  `FKReference_SS_Option__ID` int(11) default NULL,
  PRIMARY KEY  (`SS_Option_ID`),
  KEY `FKReference_SS_Option__ID` (`FKReference_SS_Option__ID`),
  KEY `FK_Equipment__ID` (`FK_Equipment__ID`),
  KEY `FK_SS_Config__ID` (`FK_SS_Config__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Stage`
--

DROP TABLE IF EXISTS `Stage`;
CREATE TABLE `Stage` (
  `Stage_ID` int(11) NOT NULL auto_increment,
  `Stage_Name` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`Stage_ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Standard_Solution`
--

DROP TABLE IF EXISTS `Standard_Solution`;
CREATE TABLE `Standard_Solution` (
  `Standard_Solution_ID` int(11) NOT NULL auto_increment,
  `Standard_Solution_Name` varchar(40) default NULL,
  `Standard_Solution_Parameters` int(11) default NULL,
  `Standard_Solution_Formula` text,
  `Standard_Solution_Status` enum('Active','Inactive','Development') default NULL,
  `Standard_Solution_Message` text,
  `Reagent_Parameter` varchar(40) default NULL,
  `Label_Type` enum('Laser','ZPL') default 'ZPL',
  `FK_Barcode_Label__ID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`Standard_Solution_ID`),
  UNIQUE KEY `name` (`Standard_Solution_Name`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Status`
--

DROP TABLE IF EXISTS `Status`;
CREATE TABLE `Status` (
  `Status_ID` int(11) NOT NULL auto_increment,
  `Status_Type` enum('ReArray_Request','Maintenance') default NULL,
  `Status_Name` char(40) default NULL,
  PRIMARY KEY  (`Status_ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Stock`
--

DROP TABLE IF EXISTS `Stock`;
CREATE TABLE `Stock` (
  `Stock_ID` int(11) NOT NULL auto_increment,
  `Stock_Name` varchar(80) default NULL,
  `FK_Employee__ID` int(11) default NULL,
  `Stock_Lot_Number` varchar(80) default NULL,
  `Stock_Received` date default NULL,
  `Stock_Size` float default NULL,
  `Stock_Size_Units` enum('mL','uL','litres','mg','grams','kg','pcs','boxes','tubes','rxns','n/a') default NULL,
  `Stock_Description` text,
  `FK_Orders__ID` int(11) default NULL,
  `Stock_Type` enum('Solution','Reagent','Kit','Box','Equipment','Service Contract','Computer Equip','Misc_Item') default NULL,
  `FK_Box__ID` int(11) default NULL,
  `Stock_Catalog_Number` varchar(80) default NULL,
  `Stock_Number_in_Batch` int(11) default NULL,
  `Stock_Cost` float default NULL,
  `FK_Organization__ID` int(11) default NULL,
  `Stock_Source` enum('Box','Order','Sample','Made in House') default NULL,
  `FK_Grp__ID` int(11) NOT NULL default '0',
  `FK_Barcode_Label__ID` int(11) default NULL,
  `Identifier_Number` varchar(80) default NULL,
  `Identifier_Number_Type` enum('Component Number') default NULL,
  PRIMARY KEY  (`Stock_ID`),
  KEY `cat` (`Stock_Catalog_Number`),
  KEY `name` (`Stock_Name`),
  KEY `box` (`FK_Box__ID`),
  KEY `FK_Orders__ID` (`FK_Orders__ID`),
  KEY `FK_Barcode_Label__ID` (`FK_Barcode_Label__ID`),
  KEY `FK_Grp__ID` (`FK_Grp__ID`),
  KEY `FK_Organization__ID` (`FK_Organization__ID`),
  KEY `FK_Employee__ID` (`FK_Employee__ID`),
  KEY `grp_id` (`FK_Grp__ID`),
  KEY `employee_id` (`FK_Employee__ID`),
  KEY `barcode_label` (`FK_Barcode_Label__ID`),
  KEY `catnum` (`Stock_Catalog_Number`),
  KEY `stockname` (`Stock_Name`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Study`
--

DROP TABLE IF EXISTS `Study`;
CREATE TABLE `Study` (
  `Study_ID` int(11) NOT NULL auto_increment,
  `Study_Name` varchar(40) NOT NULL default '',
  `Study_Description` text,
  `Study_Initiated` date default NULL,
  PRIMARY KEY  (`Study_ID`),
  UNIQUE KEY `study_name` (`Study_Name`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Submission_Alias`
--

DROP TABLE IF EXISTS `Submission_Alias`;
CREATE TABLE `Submission_Alias` (
  `Submission_Alias_ID` int(11) NOT NULL auto_increment,
  `FK_Trace_Submission__ID` int(11) NOT NULL default '0',
  `Submission_Reference` char(40) default NULL,
  `Submission_Reference_Type` enum('Genbank_ID','Accession_ID') default NULL,
  PRIMARY KEY  (`Submission_Alias_ID`),
  UNIQUE KEY `ref` (`Submission_Reference_Type`,`Submission_Reference`),
  KEY `FK_Trace_Submission__ID` (`FK_Trace_Submission__ID`)
) TYPE=MyISAM;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Submission_Detail`
--

DROP TABLE IF EXISTS `Submission_Detail`;
CREATE TABLE `Submission_Detail` (
  `Submission_Detail_ID` int(11) NOT NULL auto_increment,
  `FK_Submission__ID` int(11) NOT NULL default '0',
  `FKSubmission_DBTable__ID` int(11) NOT NULL default '0',
  `Reference` varchar(40) NOT NULL default '',
  PRIMARY KEY  (`Submission_Detail_ID`),
  KEY `FKSubmission_DBTable__ID` (`FKSubmission_DBTable__ID`),
  KEY `FK_Submission__ID` (`FK_Submission__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Submission_Info`
--

DROP TABLE IF EXISTS `Submission_Info`;
CREATE TABLE `Submission_Info` (
  `Submission_Info_ID` int(11) NOT NULL auto_increment,
  `FK_Submission__ID` int(11) NOT NULL default '0',
  `Submission_Comments` text,
  `FK_Grp__ID` int(11) default NULL,
  PRIMARY KEY  (`Submission_Info_ID`),
  KEY `FK_Submission__ID` (`FK_Submission__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Submission`
--

DROP TABLE IF EXISTS `Submission`;
CREATE TABLE `Submission` (
  `Submission_ID` int(11) NOT NULL auto_increment,
  `Submission_DateTime` datetime default NULL,
  `Submission_Source` enum('External','Internal') default NULL,
  `Submission_Status` enum('Draft','Submitted','Partially Approved','Approved','Completed','Cancelled','Rejected') default NULL,
  `FK_Contact__ID` int(11) default NULL,
  `FKSubmitted_Employee__ID` int(11) default NULL,
  `Submission_Comments` text,
  `FKApproved_Employee__ID` int(11) default NULL,
  `Approved_DateTime` datetime default NULL,
  PRIMARY KEY  (`Submission_ID`),
  KEY `FKSubmitted_Employee__ID` (`FKSubmitted_Employee__ID`),
  KEY `FK_Contact__ID` (`FK_Contact__ID`),
  KEY `FKApproved_Employee__ID` (`FKApproved_Employee__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Submission_Table_Link`
--

DROP TABLE IF EXISTS `Submission_Table_Link`;
CREATE TABLE `Submission_Table_Link` (
  `Submission_Table_Link_ID` int(11) NOT NULL auto_increment,
  `FK_Submission__ID` int(11) NOT NULL default '0',
  `Table_Name` char(40) NOT NULL default '',
  `Key_Value` char(40) default '',
  PRIMARY KEY  (`Submission_Table_Link_ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Submission_Volume`
--

DROP TABLE IF EXISTS `Submission_Volume`;
CREATE TABLE `Submission_Volume` (
  `Submission_Volume_ID` int(11) NOT NULL auto_increment,
  `Submission_Target` text,
  `Volume_Name` varchar(40) NOT NULL default '',
  `Submission_Date` date default NULL,
  `FKSubmitter_Employee__ID` int(11) default NULL,
  `Volume_Status` enum('In Process','Bundled','Submitted','Accepted','Rejected') default NULL,
  `Volume_Comments` text,
  `Records` int(11) NOT NULL default '0',
  `Approved_Date` date default NULL,
  PRIMARY KEY  (`Submission_Volume_ID`),
  UNIQUE KEY `name` (`Volume_Name`),
  KEY `FKSubmitter_Employee__ID` (`FKSubmitter_Employee__ID`)
) TYPE=MyISAM;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `SubmissionVolume`
--

DROP TABLE IF EXISTS `SubmissionVolume`;
CREATE TABLE `SubmissionVolume` (
  `SubmissionVolume_ID` int(11) NOT NULL auto_increment,
  `Volume_Name` varchar(40) default NULL,
  `FKContact_Employee__ID` int(11) NOT NULL default '0',
  `Submission_Status` enum('Sent','In Process','Pending','Accepted','Rejected') default NULL,
  `Submission_DateTime` date default NULL,
  `Volume_Description` text,
  PRIMARY KEY  (`SubmissionVolume_ID`),
  KEY `FKContact_Employee__ID` (`FKContact_Employee__ID`)
) TYPE=MyISAM;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Suggestion`
--

DROP TABLE IF EXISTS `Suggestion`;
CREATE TABLE `Suggestion` (
  `Suggestion_ID` int(11) NOT NULL auto_increment,
  `Suggestion_Text` text,
  `Suggestion_Date` date default NULL,
  `FK_Employee__ID` int(11) default NULL,
  `Response_Text` text,
  `Implementation_Date` date default NULL,
  `Priority` enum('Urgent','Useful','Wish') NOT NULL default 'Urgent',
  PRIMARY KEY  (`Suggestion_ID`),
  KEY `FK_Employee__ID` (`FK_Employee__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Test_Condition`
--

DROP TABLE IF EXISTS `Test_Condition`;
CREATE TABLE `Test_Condition` (
  `Test_Condition_ID` int(11) NOT NULL auto_increment,
  `Condition_Name` varchar(40) default NULL,
  `Condition_Tables` text,
  `Condition_Field` text,
  `Condition_String` text,
  `Condition_Type` enum('Ready','In Process','Completed','Transferred within Protocol','Ready For Next Protocol','Custom') default 'Custom',
  `Procedure_Link` varchar(80) default NULL,
  `Condition_Description` text,
  `Condition_Key` varchar(40) default NULL,
  `Extra_Clause` text,
  PRIMARY KEY  (`Test_Condition_ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Tissue`
--

DROP TABLE IF EXISTS `Tissue`;
CREATE TABLE `Tissue` (
  `Tissue_ID` int(11) NOT NULL auto_increment,
  `Tissue_Name` varchar(255) NOT NULL default '',
  `Tissue_Subtype` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`Tissue_ID`),
  UNIQUE KEY `tissue` (`Tissue_Name`,`Tissue_Subtype`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `TraceData`
--

DROP TABLE IF EXISTS `TraceData`;
CREATE TABLE `TraceData` (
  `FK_Sequence__ID` int(11) default NULL,
  `TraceData_ID` int(11) NOT NULL auto_increment,
  `Mirrored` int(11) default '0',
  `Archived` int(11) default '0',
  `Checked` datetime default NULL,
  `Machine` varchar(20) default NULL,
  `Links` int(11) default NULL,
  `Files` int(11) default NULL,
  `Broken` int(11) default NULL,
  `Path` enum('','Not Found','OK') default '',
  `Zipped` int(11) default NULL,
  `Format` varchar(20) default NULL,
  `MirroredSize` int(11) default NULL,
  `ArchivedSize` int(11) default NULL,
  `ZippedSize` int(11) default NULL,
  PRIMARY KEY  (`TraceData_ID`),
  UNIQUE KEY `run` (`FK_Sequence__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Trace_Submission`
--

DROP TABLE IF EXISTS `Trace_Submission`;
CREATE TABLE `Trace_Submission` (
  `Trace_Submission_ID` int(11) NOT NULL auto_increment,
  `FK_Run__ID` int(11) default NULL,
  `Well` char(4) NOT NULL default '',
  `Submission_Status` enum('Bundled','In Process','Accepted','Rejected') default NULL,
  `FK_Sample__ID` int(11) NOT NULL default '0',
  `Submitted_Length` int(11) NOT NULL default '0',
  `FK_Submission_Volume__ID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`Trace_Submission_ID`),
  UNIQUE KEY `sequence_read` (`FK_Run__ID`,`Well`,`FK_Submission_Volume__ID`),
  KEY `length` (`Submitted_Length`),
  KEY `FK_Sample__ID` (`FK_Sample__ID`),
  KEY `FK_Submission_Volume__ID` (`FK_Submission_Volume__ID`)
) TYPE=MyISAM;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Transposon_Library`
--

DROP TABLE IF EXISTS `Transposon_Library`;
CREATE TABLE `Transposon_Library` (
  `Transposon_Library_ID` int(11) NOT NULL auto_increment,
  `FK_Sequencing_Library__ID` int(11) NOT NULL default '0',
  `FK_Transposon__ID` int(11) NOT NULL default '0',
  `FK_Pool__ID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`Transposon_Library_ID`),
  KEY `lib_id` (`FK_Sequencing_Library__ID`),
  KEY `transposon_id` (`FK_Transposon__ID`),
  KEY `pool_id` (`FK_Pool__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Transposon_Pool`
--

DROP TABLE IF EXISTS `Transposon_Pool`;
CREATE TABLE `Transposon_Pool` (
  `Transposon_Pool_ID` int(11) NOT NULL auto_increment,
  `FK_Transposon__ID` int(11) NOT NULL default '0',
  `FK_Optical_Density__ID` int(11) default NULL,
  `FK_GelRun__ID` int(11) default NULL,
  `Reads_Required` int(11) default NULL,
  `Pipeline` enum('Standard','Gateway','PCR/Gateway (pGATE)') default NULL,
  `Test_Status` enum('Test','Production') NOT NULL default 'Production',
  `Status` enum('Data Pending','Dilutions','Ready For Pooling','In Progress','Complete','Failed-Redo') default NULL,
  `FK_Source__ID` int(11) default NULL,
  `FK_Pool__ID` int(11) default NULL,
  PRIMARY KEY  (`Transposon_Pool_ID`),
  KEY `FK_Source__ID` (`FK_Source__ID`),
  KEY `FK_Pool__ID` (`FK_Pool__ID`),
  KEY `FK_Gel__ID` (`FK_GelRun__ID`),
  KEY `FK_Optical_Density__ID` (`FK_Optical_Density__ID`),
  KEY `FK_Transposon__ID` (`FK_Transposon__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Transposon`
--

DROP TABLE IF EXISTS `Transposon`;
CREATE TABLE `Transposon` (
  `Transposon_Name` varchar(80) NOT NULL default '',
  `FK_Organization__ID` int(11) default NULL,
  `Transposon_Description` text,
  `Transposon_Sequence` text,
  `Transposon_Source_ID` text,
  `Antibiotic_Marker` enum('Kanamycin','Chloramphenicol','Tetracycline') default NULL,
  `Transposon_ID` int(11) NOT NULL auto_increment,
  PRIMARY KEY  (`Transposon_ID`),
  KEY `FK_Organization__ID` (`FK_Organization__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Tray`
--

DROP TABLE IF EXISTS `Tray`;
CREATE TABLE `Tray` (
  `Tray_ID` int(11) NOT NULL auto_increment,
  PRIMARY KEY  (`Tray_ID`)
) TYPE=InnoDB COMMENT='For multiple objects on a tray';

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Trigger`
--

DROP TABLE IF EXISTS `Trigger`;
CREATE TABLE `Trigger` (
  `Trigger_ID` int(11) NOT NULL auto_increment,
  `Table_Name` varchar(40) NOT NULL default '',
  `Trigger_Type` enum('SQL','Perl','Form') default NULL,
  `Value` text,
  `Trigger_On` enum('update','insert','delete') default NULL,
  `Status` enum('Active','Inactive') NOT NULL default 'Active',
  `Trigger_Description` text,
  PRIMARY KEY  (`Trigger_ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Tube_Application`
--

DROP TABLE IF EXISTS `Tube_Application`;
CREATE TABLE `Tube_Application` (
  `Tube_Application_ID` int(11) NOT NULL auto_increment,
  `FK_Solution__ID` int(11) default NULL,
  `FK_Tube__ID` int(11) default NULL,
  `Comments` text,
  PRIMARY KEY  (`Tube_Application_ID`),
  KEY `FK_Solution__ID` (`FK_Solution__ID`),
  KEY `FK_Tube__ID` (`FK_Tube__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Tube`
--

DROP TABLE IF EXISTS `Tube`;
CREATE TABLE `Tube` (
  `Tube_ID` int(11) NOT NULL auto_increment,
  `FK_Plate__ID` int(11) default NULL,
  `Tube_Quantity` float default NULL,
  `Tube_Quantity_Units` enum('ml','ul','mg','ug','ng','pg') default NULL,
  `Quantity_Used` float default NULL,
  `Quantity_Used_Units` enum('ml','ul','mg','ug','ng','pg') default NULL,
  `Concentration` float default NULL,
  `Concentration_Units` enum('cfu','ng/ul','ug/ul') default NULL,
  PRIMARY KEY  (`Tube_ID`),
  KEY `plate_id` (`FK_Plate__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `UseCase_Step`
--

DROP TABLE IF EXISTS `UseCase_Step`;
CREATE TABLE `UseCase_Step` (
  `UseCase_Step_ID` int(11) NOT NULL auto_increment,
  `UseCase_Step_Title` text,
  `UseCase_Step_Description` text,
  `UseCase_Step_Comments` text,
  `FK_UseCase__ID` int(11) default NULL,
  `FKParent_UseCase_Step__ID` int(11) default NULL,
  `UseCase_Step_Branch` enum('0','1') default '0',
  PRIMARY KEY  (`UseCase_Step_ID`),
  KEY `usecase_id` (`FK_UseCase__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `UseCase`
--

DROP TABLE IF EXISTS `UseCase`;
CREATE TABLE `UseCase` (
  `UseCase_ID` int(11) NOT NULL auto_increment,
  `UseCase_Name` varchar(80) NOT NULL default '',
  `FK_Employee__ID` int(11) default NULL,
  `UseCase_Description` text,
  `UseCase_Created` datetime default '0000-00-00 00:00:00',
  `UseCase_Modified` datetime default '0000-00-00 00:00:00',
  `FKParent_UseCase__ID` int(11) default NULL,
  `FK_UseCase_Step__ID` int(11) default NULL,
  PRIMARY KEY  (`UseCase_ID`),
  UNIQUE KEY `usecase_name` (`UseCase_Name`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

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
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Vector`
--

DROP TABLE IF EXISTS `Vector`;
CREATE TABLE `Vector` (
  `Vector_Name` varchar(40) NOT NULL default '',
  `Vector_Manufacturer` text,
  `Vector_Catalog_Number` text,
  `Vector_Sequence_File` text NOT NULL,
  `Vector_Sequence_Source` text,
  `Antibiotic_Marker` enum('Ampicillin','Zeocin','Kanamycin','Chloramphenicol','Tetracycline','N/A') default NULL,
  `Vector_ID` int(11) NOT NULL auto_increment,
  `Inducer` varchar(40) default NULL,
  `Substrate` varchar(40) default NULL,
  `FKManufacturer_Organization__ID` int(11) default NULL,
  `FKSource_Organization__ID` int(11) default NULL,
  `Vector_Sequence` longtext,
  `FK_Vector_Type__ID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`Vector_ID`),
  KEY `FKSource_Organization__ID` (`FKSource_Organization__ID`),
  KEY `FKManufacturer_Organization__ID` (`FKManufacturer_Organization__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Vector_TypeAntibiotic`
--

DROP TABLE IF EXISTS `Vector_TypeAntibiotic`;
CREATE TABLE `Vector_TypeAntibiotic` (
  `Vector_TypeAntibiotic_ID` int(10) unsigned NOT NULL auto_increment,
  `FK_Vector_Type__ID` int(11) NOT NULL default '0',
  `FK_Antibiotic__ID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`Vector_TypeAntibiotic_ID`),
  UNIQUE KEY `combo` (`FK_Vector_Type__ID`,`FK_Antibiotic__ID`),
  KEY `FK_Vector_Type__ID` (`FK_Vector_Type__ID`),
  KEY `FK_Antibiotic__ID` (`FK_Antibiotic__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Vector_TypePrimer`
--

DROP TABLE IF EXISTS `Vector_TypePrimer`;
CREATE TABLE `Vector_TypePrimer` (
  `Vector_TypePrimer_ID` int(10) unsigned NOT NULL auto_increment,
  `FK_Vector_Type__ID` int(11) NOT NULL default '0',
  `FK_Primer__ID` int(11) NOT NULL default '0',
  `Direction` enum('N/A','3prime','5prime') default NULL,
  PRIMARY KEY  (`Vector_TypePrimer_ID`),
  UNIQUE KEY `combo` (`FK_Vector_Type__ID`,`FK_Primer__ID`),
  KEY `FK_Vector_Type__ID` (`FK_Vector_Type__ID`),
  KEY `FK_Primer__ID` (`FK_Primer__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Vector_Type`
--

DROP TABLE IF EXISTS `Vector_Type`;
CREATE TABLE `Vector_Type` (
  `Vector_Type_ID` int(11) NOT NULL auto_increment,
  `Vector_Type_Name` varchar(40) NOT NULL default '',
  `Vector_Sequence_File` text NOT NULL,
  `Vector_Sequence` longtext,
  PRIMARY KEY  (`Vector_Type_ID`),
  UNIQUE KEY `Vector_Type_Name` (`Vector_Type_Name`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Version`
--

DROP TABLE IF EXISTS `Version`;
CREATE TABLE `Version` (
  `Version_ID` int(11) NOT NULL auto_increment,
  `Version_Name` varchar(8) default NULL,
  `Version_Description` text,
  `Release_Date` date default NULL,
  `Last_Modified_Date` date default NULL,
  PRIMARY KEY  (`Version_ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `ViewInput`
--

DROP TABLE IF EXISTS `ViewInput`;
CREATE TABLE `ViewInput` (
  `ViewInput_ID` int(10) unsigned NOT NULL auto_increment,
  `FK_View__ID` int(11) NOT NULL default '0',
  `Input_Field` varchar(80) default '',
  PRIMARY KEY  (`ViewInput_ID`),
  KEY `FK_View__ID` (`FK_View__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `ViewJoin`
--

DROP TABLE IF EXISTS `ViewJoin`;
CREATE TABLE `ViewJoin` (
  `ViewJoin_ID` int(10) unsigned NOT NULL auto_increment,
  `FK_View__ID` int(11) NOT NULL default '0',
  `Join_Condition` text,
  `Join_Type` enum('LEFT','INNER') default 'INNER',
  PRIMARY KEY  (`ViewJoin_ID`),
  KEY `FK_View__ID` (`FK_View__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `ViewOutput`
--

DROP TABLE IF EXISTS `ViewOutput`;
CREATE TABLE `ViewOutput` (
  `ViewOutput_ID` int(10) unsigned NOT NULL auto_increment,
  `FK_View__ID` int(11) NOT NULL default '0',
  `Output_Field` varchar(80) default '',
  PRIMARY KEY  (`ViewOutput_ID`),
  KEY `FK_View__ID` (`FK_View__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `View`
--

DROP TABLE IF EXISTS `View`;
CREATE TABLE `View` (
  `View_ID` int(10) unsigned NOT NULL auto_increment,
  `View_Name` varchar(40) default NULL,
  `View_Description` text,
  `View_Tables` text,
  `FK_Grp__ID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`View_ID`),
  KEY `FK_Grp__ID` (`FK_Grp__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Warranty`
--

DROP TABLE IF EXISTS `Warranty`;
CREATE TABLE `Warranty` (
  `Warranty_BeginDate` date default NULL,
  `Warranty_ExpiryDate` date default NULL,
  `FK_Organization__ID` int(11) default NULL,
  `FK_Equipment__ID` int(11) default NULL,
  `Warranty_Conditions` text,
  `Warranty_ID` int(11) NOT NULL auto_increment,
  `time` datetime default NULL,
  PRIMARY KEY  (`Warranty_ID`),
  KEY `FK_Organization__ID` (`FK_Organization__ID`),
  KEY `FK_Equipment__ID` (`FK_Equipment__ID`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Well_Lookup`
--

DROP TABLE IF EXISTS `Well_Lookup`;
CREATE TABLE `Well_Lookup` (
  `Plate_384` char(3) NOT NULL default '',
  `Plate_96` char(3) NOT NULL default '',
  `Quadrant` char(1) NOT NULL default '',
  UNIQUE KEY `P384` (`Plate_384`),
  UNIQUE KEY `P96W` (`Plate_96`,`Quadrant`)
) TYPE=InnoDB;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `WorkLog`
--

DROP TABLE IF EXISTS `WorkLog`;
CREATE TABLE `WorkLog` (
  `WorkLog_ID` int(11) NOT NULL auto_increment,
  `FK_Employee__ID` int(11) NOT NULL default '0',
  `Work_Date` date default NULL,
  `Hours_Spent` decimal(6,2) default NULL,
  `FK_Issue__ID` int(11) default NULL,
  `Log_Date` date default NULL,
  `Log_Notes` text,
  `Revised_ETA` decimal(10,0) default NULL,
  `FK_Grp__ID` int(11) default '0',
  PRIMARY KEY  (`WorkLog_ID`)
) TYPE=MyISAM;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `WorkPackage_Attribute`
--

DROP TABLE IF EXISTS `WorkPackage_Attribute`;
CREATE TABLE `WorkPackage_Attribute` (
  `WorkPackage_Attribute_ID` int(11) NOT NULL auto_increment,
  `FK_Attribute__ID` int(11) NOT NULL default '0',
  `FK_WorkPackage__ID` int(11) NOT NULL default '0',
  `Attribute_Value` text,
  PRIMARY KEY  (`WorkPackage_Attribute_ID`)
) TYPE=MyISAM;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `WorkPackage`
--

DROP TABLE IF EXISTS `WorkPackage`;
CREATE TABLE `WorkPackage` (
  `WorkPackage_ID` int(11) NOT NULL auto_increment,
  `FK_Issue__ID` int(11) default NULL,
  `WorkPackage_File` text,
  `WP_Name` varchar(60) default NULL,
  `WP_Comments` text,
  `WP_Obstacles` text,
  `WP_Priority_Details` text,
  `WP_Description` text,
  PRIMARY KEY  (`WorkPackage_ID`),
  UNIQUE KEY `Name` (`WP_Name`)
) TYPE=MyISAM;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Work_Request`
--

DROP TABLE IF EXISTS `Work_Request`;
CREATE TABLE `Work_Request` (
  `Work_Request_ID` int(11) NOT NULL auto_increment,
  `Plate_Size` enum('96-well','384-well') NOT NULL default '96-well',
  `Plates_To_Seq` int(11) default '0',
  `Plates_To_Pick` int(11) default '0',
  `FK_Goal__ID` int(11) default NULL,
  `Goal_Target` int(11) default NULL,
  `Comments` text,
  `FK_Submission__ID` int(11) NOT NULL default '0',
  `Work_Request_Type` enum('1/16 End Reads','1/24 End Reads','1/256 End Reads','1/16 Custom Reads','1/24 Custom Reads','1/256 Custom Reads','DNA Preps') default NULL,
  `Num_Plates_Submitted` int(11) NOT NULL default '0',
  `FK_Plate_Format__ID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`Work_Request_ID`)
) TYPE=MyISAM;

-- MySQL dump 9.10
--
-- Host: seqdb01    Database: sequence
-- ------------------------------------------------------
-- Server version	4.0.17-standard-log

--
-- Table structure for table `Xformed_Cells`
--

DROP TABLE IF EXISTS `Xformed_Cells`;
CREATE TABLE `Xformed_Cells` (
  `Xformed_Cells_ID` int(11) NOT NULL auto_increment,
  `VolumePerTube` int(11) default NULL,
  `Tubes` int(11) default NULL,
  `EstimatedClones` int(11) default NULL,
  `Cell_Catalog_Number` varchar(40) default NULL,
  `Label` varchar(40) default NULL,
  `Xform_Method` varchar(40) default NULL,
  `Cell_Type` varchar(40) default NULL,
  `FKSupplier_Organization__ID` int(11) default NULL,
  `Sequencing_Type` enum('Primers','Transposon','Primers_and_transposon','Replicates') default NULL,
  `384_Well_Plates_To_Seq` int(11) default NULL,
  `FK_Source__ID` int(11) NOT NULL default '0',
  `384_Well_Plates_To_Pick` int(11) default '0',
  PRIMARY KEY  (`Xformed_Cells_ID`),
  KEY `FK_Source__ID` (`FK_Source__ID`),
  KEY `FKSupplier_Organization__ID` (`FKSupplier_Organization__ID`)
) TYPE=InnoDB;

