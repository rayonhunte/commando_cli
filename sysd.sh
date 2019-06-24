#!/bin/bash

#store application path
ogPath=$(pwd)

# check for system d file
isSystemd=$(ls /lib/systemd/system/ | grep 'nodeserver' -c)

#node file
nodeFile=/lib/systemd/system/nodeserver.service

echo $isSystemd

if [ $isSystemd  -ne 1 ]
then 
    touch $nodeFile
    echo "[Unit]" > $nodeFile 
    echo "Description=Node.js Express server" >>  $nodeFile
    echo "After=network.target" >> $nodeFile
    echo "" >> $nodeFile
    echo "[Service]" >> $nodeFile
    echo "Enviroment=NODE_PORT=3001" >> $nodeFile
    echo "Type=simple" >> $nodeFile
    echo "User=root" >> $nodeFile
    echo "ExecStart=/usr/bin/node $ogPath/server/server.js" >> $nodeFile
    echo "Restart=on-failure" >> $nodeFile
    echo "" >> $nodeFile
    echo "RestartSec=10" >> $nodeFile
    echo "" >> $nodeFile
    echo "[Install]" >> $nodeFile
    echo "WantedBy=multi-user.target" >> $nodeFile
    sudo systemctl daemon-reload
    sudo systemctl start  nodeserver

fi

