## Patch file to modify a database

<DESCRIPTION> ## Put a sentence or two here about what this patch changes in the database

Add Contact and Employee to Work Request table so that we know who created the request

</DESCRIPTION>
<SCHEMA> ## Put SQL statements here that change the structure of databases (ALTER, ADD, DROP, MODIFY)

ALTER TABLE Work_Request ADD FKRequest_Employee__ID INT DEFAULT NULL; 
ALTER TABLE Work_Request ADD FKRequest_Contact__ID INT DEFAULT NULL; 

ALTER TABLE Work_Request add index FKRequest_Employee (FKRequest_Employee__ID);
ALTER TABLE Work_Request add index FKRequest_Contact (FKRequest_Contact__ID);

</SCHEMA>

<DATA> ## Put statements here that change or add data to the database. These statements will be executed after the schema statements above (INSERT, UPDATE)
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
