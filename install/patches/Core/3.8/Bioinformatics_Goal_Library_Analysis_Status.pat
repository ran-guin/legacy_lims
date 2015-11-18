## Patch file to modify a database

<DESCRIPTION> ## Put a sentence or two here about what this patch changes in the database
Add bioinformatics goals and add Library_Analysis_Status

</DESCRIPTION>
<SCHEMA> ## Put SQL statements here that change the structure of databases (ALTER, ADD, DROP, MODIFY)
ALTER TABLE Goal CHANGE Goal_Condition Goal_Condition text NULL default NULL;
ALTER TABLE Library ADD COLUMN Library_Analysis_Status enum('N/A','In Production','Complete') NULL DEFAULT 'N/A';
</SCHEMA>
<DATA> ## Put statements here that change or add data to the database. These statements will be executed after the schema statements above (INSERT, UPDATE)
INSERT INTO Goal (Goal_Name, Goal_Description, Goal_Tables, Goal_Count, Goal_Condition, Goal_Type) value ('Read alignment', 'Read alignment', 'Library,Plate,Run,Run_Analysis,Pipeline', 'COUNT(*)', "FK_Library__Name = Library_Name and FK_Plate__ID = Plate_ID and FK_Run__ID = Run_ID and FKAnalysis_Pipeline__ID = Pipeline_ID and Library_Name = '<LIBRARY>' and Pipeline_Name = 'Read alignment' and Run_Analysis_Status = 'Analyzed' and Current_Analysis = 'Yes'", 'Data Analysis');
INSERT INTO Pipeline (Pipeline_Name, FK_Grp__ID, Pipeline_Description, Pipeline_Code, Pipeline_Type) value ('Read alignment',1,'Read alignment pipeline','T01','Illumina');
INSERT INTO Analysis_Software (Analysis_Software_Name) value ('Read alignment');
INSERT INTO Pipeline_Step (FK_Object_Class__ID, Object_ID, Pipeline_Step_Order, FK_Pipeline__ID) select 9, Analysis_Software_ID, 1, Pipeline_ID from Analysis_Software,Pipeline where Analysis_Software_Name = 'Read alignment' and Pipeline_Code = 'T01';
INSERT INTO Goal (Goal_Name, Goal_Description, Goal_Tables, Goal_Count, Goal_Condition, Goal_Type) value ('SNV calling', 'SNV calling (on WGSS, exome sequencing or RNA-seq data, using read alignments)', 'Library,Plate,Run,Run_Analysis,Pipeline', 'COUNT(*)', "FK_Library__Name = Library_Name and FK_Plate__ID = Plate_ID and FK_Run__ID = Run_ID and FKAnalysis_Pipeline__ID = Pipeline_ID and Library_Name = '<LIBRARY>' and Pipeline_Name = 'SNV calling' and Run_Analysis_Status = 'Analyzed' and Current_Analysis = 'Yes'", 'Data Analysis');
INSERT INTO Pipeline (Pipeline_Name, FK_Grp__ID, Pipeline_Description, Pipeline_Code, Pipeline_Type) value ('SNV calling',1,'SNV calling (on WGSS, exome sequencing or RNA-seq data, using read alignments) pipeline','T02','Illumina');
INSERT INTO Analysis_Software (Analysis_Software_Name) value ('SNV calling');
INSERT INTO Pipeline_Step (FK_Object_Class__ID, Object_ID, Pipeline_Step_Order, FK_Pipeline__ID) select 9, Analysis_Software_ID, 1, Pipeline_ID from Analysis_Software,Pipeline where Analysis_Software_Name = 'SNV calling' and Pipeline_Code = 'T02';
INSERT INTO Goal (Goal_Name, Goal_Description, Goal_Tables, Goal_Count, Goal_Condition, Goal_Type) value ('SNV annotation', 'SNV annotation', 'Library,Plate,Run,Run_Analysis,Pipeline', 'COUNT(*)', "FK_Library__Name = Library_Name and FK_Plate__ID = Plate_ID and FK_Run__ID = Run_ID and FKAnalysis_Pipeline__ID = Pipeline_ID and Library_Name = '<LIBRARY>' and Pipeline_Name = 'SNV annotation' and Run_Analysis_Status = 'Analyzed' and Current_Analysis = 'Yes'", 'Data Analysis');
INSERT INTO Pipeline (Pipeline_Name, FK_Grp__ID, Pipeline_Description, Pipeline_Code, Pipeline_Type) value ('SNV annotation',1,'SNV annotation pipeline','T03','Illumina');
INSERT INTO Analysis_Software (Analysis_Software_Name) value ('SNV annotation');
INSERT INTO Pipeline_Step (FK_Object_Class__ID, Object_ID, Pipeline_Step_Order, FK_Pipeline__ID) select 9, Analysis_Software_ID, 1, Pipeline_ID from Analysis_Software,Pipeline where Analysis_Software_Name = 'SNV annotation' and Pipeline_Code = 'T03';
INSERT INTO Goal (Goal_Name, Goal_Description, Goal_Tables, Goal_Count, Goal_Condition, Goal_Type) value ('Small indel detection', 'Small indel detection (read alignment based)', 'Library,Plate,Run,Run_Analysis,Pipeline', 'COUNT(*)', "FK_Library__Name = Library_Name and FK_Plate__ID = Plate_ID and FK_Run__ID = Run_ID and FKAnalysis_Pipeline__ID = Pipeline_ID and Library_Name = '<LIBRARY>' and Pipeline_Name = 'Small indel detection' and Run_Analysis_Status = 'Analyzed' and Current_Analysis = 'Yes'", 'Data Analysis');
INSERT INTO Pipeline (Pipeline_Name, FK_Grp__ID, Pipeline_Description, Pipeline_Code, Pipeline_Type) value ('Small indel detection',1,'Small indel detection (read alignment based) pipeline','T04','Illumina');
INSERT INTO Analysis_Software (Analysis_Software_Name) value ('Small indel detection');
INSERT INTO Pipeline_Step (FK_Object_Class__ID, Object_ID, Pipeline_Step_Order, FK_Pipeline__ID) select 9, Analysis_Software_ID, 1, Pipeline_ID from Analysis_Software,Pipeline where Analysis_Software_Name = 'Small indel detection' and Pipeline_Code = 'T04';
INSERT INTO Goal (Goal_Name, Goal_Description, Goal_Tables, Goal_Count, Goal_Condition, Goal_Type) value ('Visualization', 'Visualization (using UCSC browser data formats)', 'Library,Plate,Run,Run_Analysis,Pipeline', 'COUNT(*)', "FK_Library__Name = Library_Name and FK_Plate__ID = Plate_ID and FK_Run__ID = Run_ID and FKAnalysis_Pipeline__ID = Pipeline_ID and Library_Name = '<LIBRARY>' and Pipeline_Name = 'Visualization' and Run_Analysis_Status = 'Analyzed' and Current_Analysis = 'Yes'", 'Data Analysis');
INSERT INTO Pipeline (Pipeline_Name, FK_Grp__ID, Pipeline_Description, Pipeline_Code, Pipeline_Type) value ('Visualization',1,'Visualization (using UCSC browser data formats) pipeline','T05','Illumina');
INSERT INTO Analysis_Software (Analysis_Software_Name) value ('Visualization');
INSERT INTO Pipeline_Step (FK_Object_Class__ID, Object_ID, Pipeline_Step_Order, FK_Pipeline__ID) select 9, Analysis_Software_ID, 1, Pipeline_ID from Analysis_Software,Pipeline where Analysis_Software_Name = 'Visualization' and Pipeline_Code = 'T05';
INSERT INTO Goal (Goal_Name, Goal_Description, Goal_Tables, Goal_Count, Goal_Condition, Goal_Type) value ('LOH', 'LOH', 'Library,Plate,Run,Run_Analysis,Pipeline', 'COUNT(*)', "FK_Library__Name = Library_Name and FK_Plate__ID = Plate_ID and FK_Run__ID = Run_ID and FKAnalysis_Pipeline__ID = Pipeline_ID and Library_Name = '<LIBRARY>' and Pipeline_Name = 'LOH' and Run_Analysis_Status = 'Analyzed' and Current_Analysis = 'Yes'", 'Data Analysis');
INSERT INTO Pipeline (Pipeline_Name, FK_Grp__ID, Pipeline_Description, Pipeline_Code, Pipeline_Type) value ('LOH',1,'LOH pipeline','T06','Illumina');
INSERT INTO Analysis_Software (Analysis_Software_Name) value ('LOH');
INSERT INTO Pipeline_Step (FK_Object_Class__ID, Object_ID, Pipeline_Step_Order, FK_Pipeline__ID) select 9, Analysis_Software_ID, 1, Pipeline_ID from Analysis_Software,Pipeline where Analysis_Software_Name = 'LOH' and Pipeline_Code = 'T06';
INSERT INTO Goal (Goal_Name, Goal_Description, Goal_Tables, Goal_Count, Goal_Condition, Goal_Type) value ('CNV', 'CNV', 'Library,Plate,Run,Run_Analysis,Pipeline', 'COUNT(*)', "FK_Library__Name = Library_Name and FK_Plate__ID = Plate_ID and FK_Run__ID = Run_ID and FKAnalysis_Pipeline__ID = Pipeline_ID and Library_Name = '<LIBRARY>' and Pipeline_Name = 'CNV' and Run_Analysis_Status = 'Analyzed' and Current_Analysis = 'Yes'", 'Data Analysis');
INSERT INTO Pipeline (Pipeline_Name, FK_Grp__ID, Pipeline_Description, Pipeline_Code, Pipeline_Type) value ('CNV',1,'CNV pipeline','T07','Illumina');
INSERT INTO Analysis_Software (Analysis_Software_Name) value ('CNV');
INSERT INTO Pipeline_Step (FK_Object_Class__ID, Object_ID, Pipeline_Step_Order, FK_Pipeline__ID) select 9, Analysis_Software_ID, 1, Pipeline_ID from Analysis_Software,Pipeline where Analysis_Software_Name = 'CNV' and Pipeline_Code = 'T07';
INSERT INTO Goal (Goal_Name, Goal_Description, Goal_Tables, Goal_Count, Goal_Condition, Goal_Type) value ('Structural Variation detection', 'Structural Variation detection (Alignment Based)', 'Library,Plate,Run,Run_Analysis,Pipeline', 'COUNT(*)', "FK_Library__Name = Library_Name and FK_Plate__ID = Plate_ID and FK_Run__ID = Run_ID and FKAnalysis_Pipeline__ID = Pipeline_ID and Library_Name = '<LIBRARY>' and Pipeline_Name = 'Structural Variation detection' and Run_Analysis_Status = 'Analyzed' and Current_Analysis = 'Yes'", 'Data Analysis');
INSERT INTO Pipeline (Pipeline_Name, FK_Grp__ID, Pipeline_Description, Pipeline_Code, Pipeline_Type) value ('Structural Variation detection',1,'Structural Variation detection (Alignment Based) pipeline','T08','Illumina');
INSERT INTO Analysis_Software (Analysis_Software_Name) value ('Structural Variation detection');
INSERT INTO Pipeline_Step (FK_Object_Class__ID, Object_ID, Pipeline_Step_Order, FK_Pipeline__ID) select 9, Analysis_Software_ID, 1, Pipeline_ID from Analysis_Software,Pipeline where Analysis_Software_Name = 'Structural Variation detection' and Pipeline_Code = 'T08';
INSERT INTO Goal (Goal_Name, Goal_Description, Goal_Tables, Goal_Count, Goal_Condition, Goal_Type) value ('Structural Variation detection Assembly', 'Structural Variation detection Assembly (Assembly Based)', 'Library,Plate,Run,Run_Analysis,Pipeline', 'COUNT(*)', "FK_Library__Name = Library_Name and FK_Plate__ID = Plate_ID and FK_Run__ID = Run_ID and FKAnalysis_Pipeline__ID = Pipeline_ID and Library_Name = '<LIBRARY>' and Pipeline_Name = 'Structural Variation detection Assembly' and Run_Analysis_Status = 'Analyzed' and Current_Analysis = 'Yes'", 'Data Analysis');
INSERT INTO Pipeline (Pipeline_Name, FK_Grp__ID, Pipeline_Description, Pipeline_Code, Pipeline_Type) value ('Structural Variation detection Assembly',1,'Structural Variation detection Assembly (Assembly Based) pipeline','T09','Illumina');
INSERT INTO Analysis_Software (Analysis_Software_Name) value ('Structural Variation detection Assembly');
INSERT INTO Pipeline_Step (FK_Object_Class__ID, Object_ID, Pipeline_Step_Order, FK_Pipeline__ID) select 9, Analysis_Software_ID, 1, Pipeline_ID from Analysis_Software,Pipeline where Analysis_Software_Name = 'Structural Variation detection Assembly' and Pipeline_Code = 'T09';
INSERT INTO Goal (Goal_Name, Goal_Description, Goal_Tables, Goal_Count, Goal_Condition, Goal_Type) value ('Alternative transcript detection', 'Alternative transcript detection (no standard pipeline)', 'Library,Plate,Run,Run_Analysis,Pipeline', 'COUNT(*)', "FK_Library__Name = Library_Name and FK_Plate__ID = Plate_ID and FK_Run__ID = Run_ID and FKAnalysis_Pipeline__ID = Pipeline_ID and Library_Name = '<LIBRARY>' and Pipeline_Name = 'Alternative transcript detection' and Run_Analysis_Status = 'Analyzed' and Current_Analysis = 'Yes'", 'Data Analysis');
INSERT INTO Pipeline (Pipeline_Name, FK_Grp__ID, Pipeline_Description, Pipeline_Code, Pipeline_Type) value ('Alternative transcript detection',1,'Alternative transcript detection (no standard pipeline) pipeline','T10','Illumina');
INSERT INTO Analysis_Software (Analysis_Software_Name) value ('Alternative transcript detection');
INSERT INTO Pipeline_Step (FK_Object_Class__ID, Object_ID, Pipeline_Step_Order, FK_Pipeline__ID) select 9, Analysis_Software_ID, 1, Pipeline_ID from Analysis_Software,Pipeline where Analysis_Software_Name = 'Alternative transcript detection' and Pipeline_Code = 'T10';
INSERT INTO Goal (Goal_Name, Goal_Description, Goal_Tables, Goal_Count, Goal_Condition, Goal_Type) value ('miRNA standard pipeline', 'miRNA standard pipeline (expression analysis)', 'Library,Plate,Run,Run_Analysis,Pipeline', 'COUNT(*)', "FK_Library__Name = Library_Name and FK_Plate__ID = Plate_ID and FK_Run__ID = Run_ID and FKAnalysis_Pipeline__ID = Pipeline_ID and Library_Name = '<LIBRARY>' and Pipeline_Name = 'miRNA standard pipeline' and Run_Analysis_Status = 'Analyzed' and Current_Analysis = 'Yes'", 'Data Analysis');
INSERT INTO Pipeline (Pipeline_Name, FK_Grp__ID, Pipeline_Description, Pipeline_Code, Pipeline_Type) value ('miRNA standard pipeline',1,'miRNA standard pipeline (expression analysis) pipeline','T11','Illumina');
INSERT INTO Analysis_Software (Analysis_Software_Name) value ('miRNA standard pipeline');
INSERT INTO Pipeline_Step (FK_Object_Class__ID, Object_ID, Pipeline_Step_Order, FK_Pipeline__ID) select 9, Analysis_Software_ID, 1, Pipeline_ID from Analysis_Software,Pipeline where Analysis_Software_Name = 'miRNA standard pipeline' and Pipeline_Code = 'T11';
INSERT INTO Goal (Goal_Name, Goal_Description, Goal_Tables, Goal_Count, Goal_Condition, Goal_Type) value ('miRNA novelty prediction pipeline', 'miRNA novelty prediction pipeline', 'Library,Plate,Run,Run_Analysis,Pipeline', 'COUNT(*)', "FK_Library__Name = Library_Name and FK_Plate__ID = Plate_ID and FK_Run__ID = Run_ID and FKAnalysis_Pipeline__ID = Pipeline_ID and Library_Name = '<LIBRARY>' and Pipeline_Name = 'miRNA novelty prediction pipeline' and Run_Analysis_Status = 'Analyzed' and Current_Analysis = 'Yes'", 'Data Analysis');
INSERT INTO Pipeline (Pipeline_Name, FK_Grp__ID, Pipeline_Description, Pipeline_Code, Pipeline_Type) value ('miRNA novelty prediction pipeline',1,'miRNA novelty prediction pipeline pipeline','T12','Illumina');
INSERT INTO Analysis_Software (Analysis_Software_Name) value ('miRNA novelty prediction pipeline');
INSERT INTO Pipeline_Step (FK_Object_Class__ID, Object_ID, Pipeline_Step_Order, FK_Pipeline__ID) select 9, Analysis_Software_ID, 1, Pipeline_ID from Analysis_Software,Pipeline where Analysis_Software_Name = 'miRNA novelty prediction pipeline' and Pipeline_Code = 'T12';
INSERT INTO Goal (Goal_Name, Goal_Description, Goal_Tables, Goal_Count, Goal_Condition, Goal_Type) value ('miRNA differential expression', 'miRNA differential expression', 'Library,Plate,Run,Run_Analysis,Pipeline', 'COUNT(*)', "FK_Library__Name = Library_Name and FK_Plate__ID = Plate_ID and FK_Run__ID = Run_ID and FKAnalysis_Pipeline__ID = Pipeline_ID and Library_Name = '<LIBRARY>' and Pipeline_Name = 'miRNA differential expression' and Run_Analysis_Status = 'Analyzed' and Current_Analysis = 'Yes'", 'Data Analysis');
INSERT INTO Pipeline (Pipeline_Name, FK_Grp__ID, Pipeline_Description, Pipeline_Code, Pipeline_Type) value ('miRNA differential expression',1,'miRNA differential expression pipeline','T13','Illumina');
INSERT INTO Analysis_Software (Analysis_Software_Name) value ('miRNA differential expression');
INSERT INTO Pipeline_Step (FK_Object_Class__ID, Object_ID, Pipeline_Step_Order, FK_Pipeline__ID) select 9, Analysis_Software_ID, 1, Pipeline_ID from Analysis_Software,Pipeline where Analysis_Software_Name = 'miRNA differential expression' and Pipeline_Code = 'T13';
INSERT INTO Goal (Goal_Name, Goal_Description, Goal_Tables, Goal_Count, Goal_Condition, Goal_Type) value ('mRNA expression analysis', 'mRNA expression analysis (alignment based) pipeline', 'Library,Plate,Run,Run_Analysis,Pipeline', 'COUNT(*)', "FK_Library__Name = Library_Name and FK_Plate__ID = Plate_ID and FK_Run__ID = Run_ID and FKAnalysis_Pipeline__ID = Pipeline_ID and Library_Name = '<LIBRARY>' and Pipeline_Name = 'mRNA expression analysis' and Run_Analysis_Status = 'Analyzed' and Current_Analysis = 'Yes'", 'Data Analysis');
INSERT INTO Pipeline (Pipeline_Name, FK_Grp__ID, Pipeline_Description, Pipeline_Code, Pipeline_Type) value ('mRNA expression analysis',1,'mRNA expression analysis (alignment based) pipeline','T14','Illumina');
INSERT INTO Analysis_Software (Analysis_Software_Name) value ('mRNA expression analysis');
INSERT INTO Pipeline_Step (FK_Object_Class__ID, Object_ID, Pipeline_Step_Order, FK_Pipeline__ID) select 9, Analysis_Software_ID, 1, Pipeline_ID from Analysis_Software,Pipeline where Analysis_Software_Name = 'mRNA expression analysis' and Pipeline_Code = 'T14';
INSERT INTO Goal (Goal_Name, Goal_Description, Goal_Tables, Goal_Count, Goal_Condition, Goal_Type) value ('mRNA differential expression', 'mRNA differential expression', 'Library,Plate,Run,Run_Analysis,Pipeline', 'COUNT(*)', "FK_Library__Name = Library_Name and FK_Plate__ID = Plate_ID and FK_Run__ID = Run_ID and FKAnalysis_Pipeline__ID = Pipeline_ID and Library_Name = '<LIBRARY>' and Pipeline_Name = 'mRNA differential expression' and Run_Analysis_Status = 'Analyzed' and Current_Analysis = 'Yes'", 'Data Analysis');
INSERT INTO Pipeline (Pipeline_Name, FK_Grp__ID, Pipeline_Description, Pipeline_Code, Pipeline_Type) value ('mRNA differential expression',1,'mRNA differential expression pipeline','T15','Illumina');
INSERT INTO Analysis_Software (Analysis_Software_Name) value ('mRNA differential expression');
INSERT INTO Pipeline_Step (FK_Object_Class__ID, Object_ID, Pipeline_Step_Order, FK_Pipeline__ID) select 9, Analysis_Software_ID, 1, Pipeline_ID from Analysis_Software,Pipeline where Analysis_Software_Name = 'mRNA differential expression' and Pipeline_Code = 'T15';
INSERT INTO Goal (Goal_Name, Goal_Description, Goal_Tables, Goal_Count, Goal_Condition, Goal_Type) value ('Trans-ABySS pipeline', 'Trans-ABySS pipeline (fusion, novelty and structural variation detection)', 'Library,Plate,Run,Run_Analysis,Pipeline', 'COUNT(*)', "FK_Library__Name = Library_Name and FK_Plate__ID = Plate_ID and FK_Run__ID = Run_ID and FKAnalysis_Pipeline__ID = Pipeline_ID and Library_Name = '<LIBRARY>' and Pipeline_Name = 'Trans-ABySS pipeline' and Run_Analysis_Status = 'Analyzed' and Current_Analysis = 'Yes'", 'Data Analysis');
INSERT INTO Pipeline (Pipeline_Name, FK_Grp__ID, Pipeline_Description, Pipeline_Code, Pipeline_Type) value ('Trans-ABySS pipeline',1,'Trans-ABySS pipeline (fusion, novelty and structural variation detection) pipeline','T16','Illumina');
INSERT INTO Analysis_Software (Analysis_Software_Name) value ('Trans-ABySS pipeline');
INSERT INTO Pipeline_Step (FK_Object_Class__ID, Object_ID, Pipeline_Step_Order, FK_Pipeline__ID) select 9, Analysis_Software_ID, 1, Pipeline_ID from Analysis_Software,Pipeline where Analysis_Software_Name = 'Trans-ABySS pipeline' and Pipeline_Code = 'T16';
INSERT INTO Goal (Goal_Name, Goal_Description, Goal_Tables, Goal_Count, Goal_Condition, Goal_Type) value ('Barnacle pipeline', 'Barnacle pipeline (fusion, internal tandem duplication, partial tandem duplication detection, requires Trans-ABySS pipeline)', 'Library,Plate,Run,Run_Analysis,Pipeline', 'COUNT(*)', "FK_Library__Name = Library_Name and FK_Plate__ID = Plate_ID and FK_Run__ID = Run_ID and FKAnalysis_Pipeline__ID = Pipeline_ID and Library_Name = '<LIBRARY>' and Pipeline_Name = 'Barnacle pipeline' and Run_Analysis_Status = 'Analyzed' and Current_Analysis = 'Yes'", 'Data Analysis');
INSERT INTO Pipeline (Pipeline_Name, FK_Grp__ID, Pipeline_Description, Pipeline_Code, Pipeline_Type) value ('Barnacle pipeline',1,'Barnacle pipeline (fusion, internal tandem duplication, partial tandem duplication detection, requires Trans-ABySS pipeline) pipeline','T17','Illumina');
INSERT INTO Analysis_Software (Analysis_Software_Name) value ('Barnacle pipeline');
INSERT INTO Pipeline_Step (FK_Object_Class__ID, Object_ID, Pipeline_Step_Order, FK_Pipeline__ID) select 9, Analysis_Software_ID, 1, Pipeline_ID from Analysis_Software,Pipeline where Analysis_Software_Name = 'Barnacle pipeline' and Pipeline_Code = 'T17';
INSERT INTO Goal (Goal_Name, Goal_Description, Goal_Tables, Goal_Count, Goal_Condition, Goal_Type) value ('Assembly-based coverage analysis', 'Assembly-based coverage analysis', 'Library,Plate,Run,Run_Analysis,Pipeline', 'COUNT(*)', "FK_Library__Name = Library_Name and FK_Plate__ID = Plate_ID and FK_Run__ID = Run_ID and FKAnalysis_Pipeline__ID = Pipeline_ID and Library_Name = '<LIBRARY>' and Pipeline_Name = 'Assembly-based coverage analysis' and Run_Analysis_Status = 'Analyzed' and Current_Analysis = 'Yes'", 'Data Analysis');
INSERT INTO Pipeline (Pipeline_Name, FK_Grp__ID, Pipeline_Description, Pipeline_Code, Pipeline_Type) value ('Assembly-based coverage analysis',1,'Assembly-based coverage analysis pipeline','T18','Illumina');
INSERT INTO Analysis_Software (Analysis_Software_Name) value ('Assembly-based coverage analysis');
INSERT INTO Pipeline_Step (FK_Object_Class__ID, Object_ID, Pipeline_Step_Order, FK_Pipeline__ID) select 9, Analysis_Software_ID, 1, Pipeline_ID from Analysis_Software,Pipeline where Analysis_Software_Name = 'Assembly-based coverage analysis' and Pipeline_Code = 'T18';
INSERT INTO Goal (Goal_Name, Goal_Description, Goal_Tables, Goal_Count, Goal_Condition, Goal_Type) value ('de novo genome assembly', 'de novo genome assembly', 'Library,Plate,Run,Run_Analysis,Pipeline', 'COUNT(*)', "FK_Library__Name = Library_Name and FK_Plate__ID = Plate_ID and FK_Run__ID = Run_ID and FKAnalysis_Pipeline__ID = Pipeline_ID and Library_Name = '<LIBRARY>' and Pipeline_Name = 'de novo genome assembly' and Run_Analysis_Status = 'Analyzed' and Current_Analysis = 'Yes'", 'Data Analysis');
INSERT INTO Pipeline (Pipeline_Name, FK_Grp__ID, Pipeline_Description, Pipeline_Code, Pipeline_Type) value ('de novo genome assembly',1,'de novo genome assembly pipeline','T19','Illumina');
INSERT INTO Analysis_Software (Analysis_Software_Name) value ('de novo genome assembly');
INSERT INTO Pipeline_Step (FK_Object_Class__ID, Object_ID, Pipeline_Step_Order, FK_Pipeline__ID) select 9, Analysis_Software_ID, 1, Pipeline_ID from Analysis_Software,Pipeline where Analysis_Software_Name = 'de novo genome assembly' and Pipeline_Code = 'T19';
INSERT INTO Goal (Goal_Name, Goal_Description, Goal_Tables, Goal_Count, Goal_Condition, Goal_Type) value ('ChIP-seq analysis', 'ChIP-seq analysis (findPeaks)', 'Library,Plate,Run,Run_Analysis,Pipeline', 'COUNT(*)', "FK_Library__Name = Library_Name and FK_Plate__ID = Plate_ID and FK_Run__ID = Run_ID and FKAnalysis_Pipeline__ID = Pipeline_ID and Library_Name = '<LIBRARY>' and Pipeline_Name = 'ChIP-seq analysis' and Run_Analysis_Status = 'Analyzed' and Current_Analysis = 'Yes'", 'Data Analysis');
INSERT INTO Pipeline (Pipeline_Name, FK_Grp__ID, Pipeline_Description, Pipeline_Code, Pipeline_Type) value ('ChIP-seq analysis',1,'ChIP-seq analysis (findPeaks) pipeline','T20','Illumina');
INSERT INTO Analysis_Software (Analysis_Software_Name) value ('ChIP-seq analysis');
INSERT INTO Pipeline_Step (FK_Object_Class__ID, Object_ID, Pipeline_Step_Order, FK_Pipeline__ID) select 9, Analysis_Software_ID, 1, Pipeline_ID from Analysis_Software,Pipeline where Analysis_Software_Name = 'ChIP-seq analysis' and Pipeline_Code = 'T20';

</DATA>
<CODE_BLOCK> 
## This block of code will be executed after all of the above SQL statements are executed;
## Assume you have an active database connection object (SDB::DBIO) by the name $dbc;
## Also, assume the script is using RGTools::RGIO. 
## There are more perl modules that are included with the script; for  a full list, please look at the header file (header.pl)
## If you need to use additional modules, just enter the appropriate use statements in the block
## Name the block of code below
if (_check_block('NAME_GOES_HERE')) { 
		


}
</CODE_BLOCK>
<FINAL> ## Put statements here that change existing entries in DBField or DBTable. These statements will be executed after all tables and fields in those tables have been refreshed (via dbfield_set.pl)


</FINAL>
