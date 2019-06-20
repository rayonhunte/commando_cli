#!/bin/bash

#store application path
ogPath=$(pwd)

# check for system d file
isSystemd=$(ls /etc/systemd/system | grep 'nodeserver' -c)
echo $isSystemd

#system path
systemPath=/etc/systemd/user/nodeserver.service


if [ $isSystemd -ne 1 ]
then 
    touch /etc/systemd/user/nodeserver.service
    echo "this is a test" >> $systemPath
fi

