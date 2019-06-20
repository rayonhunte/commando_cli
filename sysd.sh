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
    touch /etc/systemd/user/nodeserver.service
    echo "[Unit]" >> $systemPath
    echo "Description=Node.js Express server" >> $systemPath
    echo " " >> $systemPath
    echo "[Service]" >> $systemPath
    echo "ExecStart=/user/local/bin/node $ogPath/server/server.js" >> $systemPath
    echo " " >> $systemPath
    echo "Restart=always" >> $systemPath
    echo "RestartSec=10" >> $systemPath
fi

