#!/bin/bash
echo $'\e[1;33m' Welcome to Commando !!!$'\e[0m'
echo $'\e[1;33m' Please Chose from below menu Options $'\e[0m'

# run prep script
./preCommando.sh
#script functions
# install npm function
function npmInint(){
    echo "################# start action ##################" >> commando_log 2>&1
    date >> commando_log 2>&1
    echo "npm install / command option 1" >> commando_log 2>&1
    npm install >> commando_log 2>&1; cd cashout; npm install >> ../commando_log 2>&1; cd .. >> commando_log 2>&1
}

# start application
function startApp(){
    # node server/server.js >>
   echo "place holder" 
  #check of system d file
  #create if does not exist
  # run start system d service file 
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
