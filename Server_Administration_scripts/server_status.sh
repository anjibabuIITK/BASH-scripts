#!/bin/bash
SERVERIP=172.26.30.147
NOTIFYEMAIL=test@example.com

ping -c 3 $SERVERIP > /dev/null 2>&1
if [ $? -ne 0 ]
then
   # Use your favorite mailer here:
   mailx -s "Server $SERVERIP is down" -t "$NOTIFYEMAIL" < /dev/null 
fi
#====================================#
#   ANJI BABU KAPKAYALA              #
#====================================#

#reference :http://unix.stackexchange.com/questions/56340/bash-script-to-detect-when-my-server-is-down-or-offline
