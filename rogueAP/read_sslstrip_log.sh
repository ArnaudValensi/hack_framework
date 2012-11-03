#!/bin/bash

PASSWORD_FILE=./passwords.txt

echo "Do you want to save passwords to a file? (Y=keep)"
echo "(If you want to keep it, it will be saved in $PASSWORD_FILE)"
read -e keeppd
cat ./secret.txt  |
awk -F "&" '!/GET/ && !/if/  !/header/ && !/^[0-9]/ && !/</ && /[PpEeUuLlCc_][A-Za-z]*=[A-Za-z0-9.%_-]*/ {if (NF >= 2) print $0}' |
awk -F "&" '{for(i=1;i<=NF;i++) print $i }' |
egrep -a -i "pwd=|pass=|passwd=|password=|textbox=|email=|user=|username=|login=|credential=|_user|_pwd=|email_address=" |
awk -F "=" '{if (length($2) < 3) print "\b"; else if ($1 ~/[Pp]/) print "Password = " $2"\n"; else print "Login =", $2}' >& $PASSWORD_FILE
if [[ $keeppd = "Y" || $keeppd = "y" ]] ; then 
    if [ -f $PASSWORD_FILE ]; then 
        echo "Passwords saved !" 
    else 
	echo "Error while saving passwords" 
    fi
else 
    echo "Password saving skipped."
    echo "================"
    cat $PASSWORD_FILE
    rm $PASSWORD_FILE
    echo -e "\nTemporary files deleted."
fi
