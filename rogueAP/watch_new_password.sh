#!/bin/bash

if [[ $# -ne 1 ]]; then
    echo "Usage: $0 <file>"
    exit 1
fi

OUT_FILE=$1

while [[ 1 ]]; do
    clear
    ./read_sslstrip_log.sh $OUT_FILE
    sleep 2
done