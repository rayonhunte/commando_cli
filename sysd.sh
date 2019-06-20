#!/bin/bash

#store application path
ogPath=$(pwd)

# check for system d file
isSystemd=$(ls /etc/systemd/user | grep 'nodeserver' -c)

#system path
systemPath=/etc/systemd/user/nodeserver.service

echo $isSystemd

if [ $isSystemd -ne 1 ]
then 
    sudo touch /etc/systemd/user/nodeserver.service; sudo chmod u+wx /etc/systemd/user/nodeserver.service; 
    sudo su -c 'echo "[Unit]" >> $systemPath'
    echo "Description=Node.js Express server" | sudo tree -a $systemPath
    echo " " | sudo tree -a $systemPath
    echo "[Service]" | sudo tree -a $systemPath
    echo "ExecStart=/user/local/bin/node $ogPath/server/server.js" | sudo tree -a $systemPath
    echo " " | sudo tree  -a $systemPath
    echo "Restart=always" | sudo tree -a $systemPath
    echo "RestartSec=10" | sudo tree -a $systemPath
fi

