#!/bin/bash
ACTUAL="anjibabu"
read -p "Enter Password: " enteredpass
echo ""

[ "$enteredpass" != "$ACTUAL" ] && echo "Sorry, wrong password " && echo " Try again & exiting" && exit || echo "Password matched" && echo "Conti.."

#=====================================#
#         Anji Babu Kapakayala        #
#=====================================#
