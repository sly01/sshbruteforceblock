#!/bin/bash

echo "SSH ile bagli olan ip adresleri inceleniyor"

#echo $(netstat -ant | grep 22 | awk '{print $5}' | sed 's/:.*//g' | sed 's/^0.*//g')

block=$(netstat -ant | grep 22 | awk '{print $5}' | sed 's/:.*//g' | sed 's/^0.*//g')

iptables -t filter -I INPUT -p tcp --source $block --dport 22 -j DROP
