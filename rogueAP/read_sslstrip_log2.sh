#!/bin/bash

if [[ $# -ne 1 ]]; then
    echo "Usage: $0 <file>"
    exit 1
fi

OUT_FILE=$1
RED='\\e[1;31m'
RST='\\e[0m'    # Text Reset

result=`cat $OUT_FILE | strings | grep "POST Data" -A 1 | sed "s/.* (\\(.*\\)):/$RED\&\&\\1$RST\&/"`
echo -e $result | tr '&' '\n'
