import sys


def fix_conversion(filename: str):
    with open(filename, 'r') as file:
        filedata = file.read()

    # at the moment, the MDB tools don't escape backslashes
    filedata = filedata.replace('\\', '\\\\')

    # MySQL doesn't accept this as a valid date, so we should replace it with NULL
    filedata = filedata.replace('"1900-01-00 00:00:00"', 'NULL')

    # We don't need spaces at the beginning of estimate ids
    filedata = filedata.replace(' 3204_7/07_HRS', '3204_7/07_HRS')

    with open(filename, 'w') as file:
        file.write(filedata)


if __name__ == "__main__":
    print(sys.argv)
    (_, filename,) = sys.argv
    fix_conversion(filename)
