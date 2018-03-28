#!/bin/bash

#Get system info
cpuinf=$(cat /proc/cpuinfo | grep 'model name' -m 1 | awk -F": " '{print $2}')
meminfo=$(free -h | grep 'Mem:' | awk  '{print $2}')
bbpminfo=$(dmidecode -s baseboard-product-name)
bbminfo=$(dmidecode -s baseboard-manufacturer)
ssninfo=$(dmidecode -s system-serial-number)
osd=$(cat /etc/lsb-release | grep 'DISTRIB_DESCRIPTION' | awk -F"=" '{print $2}' | awk -F "\"" '{print $2}')
instdate=$(date --set="$(fs=$(df / | tail -1 | cut -f1 -d' ') && tune2fs -l $fs | grep created | awk -F"Filesystem created:       " '{print $2}')")
krnlv=$(uname -r)
hostname=$(hostname)
uptime=$(uptime  -p | awk -F"up " '{print $2}')
procrun=$(ps axuh | wc -l)
loguser=$( w -s -h | wc -l)
netif=$(cat /proc/net/dev | awk -F : '{if (NR>2) print $1}')

#Put sistem info to task4_1.out
echo '---Hardware---'>task4_1.out
echo 'CPU: '${cpuinf:-'Uknown'}>>task4_1.out
echo 'RAM: '${meminfo:-'Uknown'}>>task4_1.out
echo 'Motherboard: '${bbminfo:-'Uknown'}' '${bbpminfo:-'Uknown'}>>task4_1.out
echo 'System Serial Number: '${ssninfo:-'Uknown'}>>task4_1.out
echo '---System---'>>task4_1.out
echo 'OS Distribution: '${osd:-'Uknown'}>>task4_1.out
echo 'Kernel version: '${krnlv:-'Uknown'}>>task4_1.out
echo 'Installation date: '${instdate:-'Uknown'}>>task4_1.out
echo 'Hostname: '${hostname:-'Uknown'}>>task4_1.out
echo 'Uptime: '$uptime>>task4_1.out
echo 'Processes running: '$procrun>>task4_1.out
echo 'Users logged in: '$loguser>>task4_1.out

#Put network info to task4_1.out
echo '---Network---'>>task4_1.out
for i in $netif
do
netip=$(ip address show $i | grep 'inet '| awk '{print $2}')
echo $i': '${netip:-'-'}>>task4_1.out
done
