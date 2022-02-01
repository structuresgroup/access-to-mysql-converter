#!/bin/bash

input="input/Data.accdb"

mkdir output
output_data="output/data.sql"
output_schema="output/schema.sql"

backend="mysql"


# make the schema file
mdb-schema "$input" "$backend" > "$output_schema"

# clear the file and write the data all to one file
echo "" > output/data.sql
tables=$(mdb-tables -1 "$input")
for table in ${tables// / } ; do
    echo "Converting $table..."
    {
        echo "-- ### $table";
        mdb-export --insert="$backend" "$input" "$table";
        printf "\n\n";
    } >> "$output_data"
done

# fix the errors
# python fix-conversion.py "$output_data" 