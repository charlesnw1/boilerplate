function lookup_table_<thing>()
{
#Description: Lookup key value pairs in a text file
#Arguments: 
#<thing>

#Returns/outputs: 
#<value>

export <key>=$(grep $<keyname> <path to file> | awk -F ',' '{print $2}')

}

