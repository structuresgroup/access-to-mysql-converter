#!/bin/bash

input_glob="input/*.accdb"

mkdir output

backend="mysql"
for input in $input_glob
do
    basename=$(basename "$input" .accdb)

    mkdir "output/$basename"

    output_data="output/$basename/data.sql"
    output_schema="output/$basename/schema.sql"


    # make the schema file
    mdb-schema "$input" "$backend" > "$output_schema"

    # clear the file and write the data all to one file
    echo "" > "$output_data"
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
    python fix-conversion.py "$output_data" 
done