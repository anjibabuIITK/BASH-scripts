# Bash Script to send mails from terminal by using mutt package.
#
# Authour :  ANJI BABU KAPAKAYALA
#             IIT KANPUR, INDIA.
# USAGE   : sh send_mail.sh (Then follow instructionns)
#
#!/bin/bash
#Inorder to use this script , mutt package should be installed with proper configuration.
#this script will send mail to given gmail for given option (subject,message,gmailid,ect.)
echo "==================================================="
echo -e "\e[31;44m*****WELCOME TO ANJI BABU MAILING SERVICE *****\e[0m"
echo "==================================================="
yes="y"
no="n"
echo ""
read -p "Enter mail-id:" mailid                           #enter mailid of reciver
read -p "Enter Subject :" subject                                    #enter Subject of mail
# if [[ $subject == *"$no"* ]] 
# then
#    echo "You choosed not to enter subject"
# fi
read -p "Write Message here  :" msg                                 # write body of message here
# if [[ $msg == *"$no"* ]] 
# then
#    echo "You have choosed not to enter Message"
# fi
read -p "Any Attachments ( y/n) :" choice                           #enter y if you want to attach file else enter n
 if [[ $choice == *"$yes"* ]] 
 then
    read -p "Enter attachment :" filename                           #enter filename of attachment
    echo ""
    echo "sending mail to $mailid"
    echo "$msg" |mutt -s "$subject" $mailid -a $filename   
 else
    echo ""
    echo "No file is attached" 
    echo "sending mail to $mailid"
    echo "$msg" |mutt -s "$subject" $mailid   
 fi
echo ""
echo "Your mail has been sent."
echo ""
echo "===================================================="
echo -e "\e[31;44m***** THANKS FOR USING ANJI BABU SERVICES *****\e[0m"
echo "===================================================="
#==========================================================#
#    written by ANJI BABU KAPKAYALA                        #
#==========================================================#
