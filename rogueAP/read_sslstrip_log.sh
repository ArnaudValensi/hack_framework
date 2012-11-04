#!/usr/bin/awk -f

BEGIN {
    RED="\033[1;31m"
    RST="\033[0m"
    print ""
}

/POST Data \(.*\)/ { 
    c=2

    match($0, /POST Data \((.*)\)/, arr);
    OFS=""
    print RED, arr[1], RST
    OFS=" "
} 

c-- == 1 {
    FS="&"
    for(i=1;i<=NF;i++) print $(i)
    print ""
}
