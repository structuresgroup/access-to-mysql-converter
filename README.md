# Structures Access To MySQL Converter
This program converts input/Data.accdb to .sql files or .csv files

### Requirements
* [MDB Tools 1.0.0](https://github.com/mdbtools/mdbtools/releases/tag/v1.0.0)

### Setup
1. Install [MDB Tools](https://github.com/mdbtools/mdbtools)
1. Move your `.accdb` file to `input/Data.accdb` 

### How to convert to MySQL

1. Run `./convert-sql.sh`
1. The results are found in the `output` folder
1. Import with MySQL

### How to convert to CSV

1. Run `./convert-csv.sh`
1. The results are found in the `output/csv` folder