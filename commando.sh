#!/bin/bash

echo $'\e[1;33m' Welcome to Commando !!!$'\e[0m'
echo $'\e[1;33m' Please Chose from below menu Options $'\e[0m'

#store application path
ogPath=$(pwd)
#check of bash profile
isBashrc=$(cd ~; ls -la | grep '.bash_profile' -c)
#1 if file exist 0 if file does not exist
echo $isBashrc
if [ $isBashrc -ne 1 ]
then
    touch ~/.bash_profile
fi
#switch bash to application path
cd $ogPath

#script functions
# install npm function
function npmInint(){
    npm install
}

# start application
function startApp(){
    node server.js
}

# command options list
commands="
Install-npm-packages 
Start-CashOut 
Stop-Cashout
Restart-Cashout
Download-Updates
Show-status
Genrate-Report
"

select option in $commands; 
do
    case $REPLY in 1)
        #print chosen option
        echo $option
        npmInint
        ;;
        2)
        echo $option
        ;;
        3)
        echo $option
        ;;
        4)
        echo $option
        ;;
        5)
        echo $option
        ;;
        6)
        echo $option
        ;;
        7)
        echo $option
        ;;
        *)
        echo "Sorry Invalid Option"
        ;;
    esac
    
done