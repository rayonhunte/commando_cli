#command  prep file


#store application path
ogPath=$(pwd)
#check of bash profile
isBashrc=$(cd ~; ls -la | grep '.bash_profile' -c)
#1 if file exist 0 if file does not exist
if [ $isBashrc -ne 1 ]
then
    touch ~/.bash_profile
    echo "alias commando='cd $PWD; ./commando.sh'" >> ~/.bash_profile
    source ~/.bash_profile
else
    isCommando=$(grep 'commando' -c ~/.bash_profile)
    if [ $isCommando -ne 1 ]
    then
        echo 'no commando'
        echo "alias commando='cd $PWD; ./commando.sh'" >> ~/.bash_profile
        source ~/.bash_profile
    else
        echo 'commando alais exist'
    fi

fi
#switch bash to application path
cd $ogPath