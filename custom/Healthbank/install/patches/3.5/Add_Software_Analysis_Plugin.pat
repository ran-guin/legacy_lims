## Patch file to modify a database

<DESCRIPTION> ## Put a sentence or two here about what this patch changes in the database

-Adding plugins Software_Analysis and its parent plugin Experiment

</DESCRIPTION>

<SCHEMA> ## Put SQL statements here that change the structure of databases (ALTER, ADD, DROP, MODIFY)

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
if (_check_block('Add_Software_Analysis_Plugin')) { 

}

</CODE_BLOCK>
<NEW_PACKAGES>
install.pl -package_version Experiment -db_version 2.6
install.pl -package_version Software_Analysis -db_version 2.6
</NEW_PACKAGES>

<FINAL> ## Put statements here that change existing entries in DBField or DBTable. These statements will be executed after all tables and fields in those tables have been refreshed (via dbfield_set.pl)


</FINAL>
