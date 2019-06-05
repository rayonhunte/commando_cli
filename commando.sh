#!/bin/bash
echo $'\e[1;33m' Welcome to Commando !!!$'\e[0m'
echo $'\e[1;33m' Please Chose from below menu Options $'\e[0m'

# run prep script
./preCommando.sh
#script functions
# install npm function
function npmInint(){
    npm install >> commando_log 2>&1
}

# start application
function startApp(){
    node server/server.js >> 
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
        startApp
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