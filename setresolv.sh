#simple shell script meant to be executed through crontab or when a network change is detected
#prepends a desired nameserver to resolv.conf after PIA linux client overwrites and replaces local NS

#!/bin/bash

#Replace the string in MYNS with your desired nameserver IP
MYNS=""192.168.1.88""

#get the current name servers from resolv.conf
CURNS="$(cat /etc/resolv.conf)"

#check if our desired nameserver is already there
if [[ $CURNS != *$MYNS* ]]; then
        #if not prepend it to /etc/resolv.conf by replacing entire resolv.conf
        echo -e "nameserver $MYNS\n$CURNS" > /etc/resolv.conf

#debugging information, uncomment to check if resolv is found
#else 
        #echo "$MYNS found in resolv, skipping this turn" >> ~/resolv.found
fi
