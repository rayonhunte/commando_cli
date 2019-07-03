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
    # create systemd service file
    sudo touch $nodeFile
    # write to new file
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
    # reload systemctl to load new service
    sudo systemctl daemon-reload

fi

#start app no matter what
sudo systemctl start nodeserver

