#!/bin/bash

#store application path
ogPath=$(pwd)

# check for system d file
isSystemd=$(ls /etc/systemd/system/ | grep 'nodeserver' -c)

#node file
nodeFile=/etc/systemd/system/nodeserver.service

echo $isSystemd

if [ $isSystemd  -ne 1 ]
then 
    sudo touch $nodeFile
    sudo sh -c "echo [Unit] > $nodeFile" 
    sudo sh -c "echo Description=Node.js Express server >>  $nodeFile"
    sudo sh -c "echo After=network.target >> $nodeFile"
    sudo sh -c "echo '' >> $nodeFile"
    sudo sh -c "echo [Service] >> $nodeFile"
    sudo sh -c "echo Enviroment=NODE_PORT=3001 >> $nodeFile"
    sudo sh -c "echo Type=simple >> $nodeFile"
    sudo sh -c "echo User=root >> $nodeFile"
    sudo sh -c "echo ExecStart=/usr/bin/node $ogPath/server/server.js >> $nodeFile"
    sudo sh -c "echo Restart=on-failure >> $nodeFile"
    sudo sh -c "echo '' >> $nodeFile"
    sudo sh -c "echo RestartSec=10 >> $nodeFile"
    sudo sh -c "echo '' >> $nodeFile"
    sudo sh -c "echo [Install] >> $nodeFile"
    sudo sh -c "echo WantedBy=multi-user.target >> $nodeFile"
    #sudo chmod a=rwx $nodeFile
    #sudo chown root $nodeFile
    #sudo chgrp root $nodeFile
    #sudo mv $nodeFile /etc/systemd/system/
    sudo systemctl daemon-reload

fi

#start app no matter what
sudo systemctl start nodeserver

