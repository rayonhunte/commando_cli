#!/bin/bash

#command  prep file
#store application path
ogPath=$(pwd)

#check of bash profile
isBashrc=$(cd ~; ls -la | grep '.bashrc' -c)

# if file exist 0 if file does not exist
if [ $isBashrc -ne 1 ]
then
    touch ~/.bashrc
    echo "alias commando='cd $PWD; ./commando.sh'" >> ~/.bashrc
    echo $'\e[1;33m' bashrc file added to your home $'\e[0m'
    echo $'\e[1;33m' Commando alias added  $'\e[0m'
    exec bash
else
    # bashrc file exist 
    isCommando=$(grep 'commando' -c ~/.bashrc)
    # does commando alias exist 
    if [ $isCommando -ne 1 ]
    then
        # add commando alias to bashrc file
        echo "alias commando='cd $PWD; ./commando.sh'" >> ~/.bashrc
        echo $'\e[1;33m' Commando added to your bashrc file $'\e[0m'
        exce bash
    else
        # commando alias exist in the file infrom user
        echo $'\e[1;33m' You can now just run commando to start the commando cli$'\e[0m'
    fi

fi
#switch bash to application path
cd $ogPath


# check for log file
isLog=$(ls | grep 'commando_log' -c)
echo $isLog
if [ $isLog -ne 1 ]
then
    touch commando_log
fi