#!/bin/bash
#read -p " enter username " name
#echo $name

#cd cashout
#ng serve
#cd ..

echo $'\e[1;33m' Welcome to Commando !!!$'\e[0m'
echo $'\e[1;33m' Please Chose from below menu Options $'\e[0m'

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
    echo "Option Chosen:- $REPLY $option"
done