#!/bin/bash

#store application path
ogPath=$(pwd)

# check for system d file
isSystemd=$(ls /etc/systemd/system | grep 'nodeserver' -c)
echo $issystemd

