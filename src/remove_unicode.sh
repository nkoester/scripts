#!/bin/bash

if [ $# -ne 2 ]; then
    echo $0: usage: [SCRIPT] input_file output_file
    exit 1
fi

input=$1
output=$2

echo "Converting ..."
iconv -f utf8 -t ascii//TRANSLIT < $input > $output
echo "Done!"

