#!/bin/bash

mkdir output
mkdir output/csv 
tables=$(mdb-tables -1 input/StructuresData.accdb)
for table in ${tables// / } ; do
    echo "Converting $table..."
    {
        mdb-export input/StructuresData.accdb "$table";
    } > "output/csv/$table.csv"
done