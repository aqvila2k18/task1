#!/bin/bash

apt-get install bc  > /dev/null 2>&1

#Get system info
cpuinf=$(cat /proc/cpuinfo | grep 'model name' -m 1 | awk -F": " '{print $2}')
meminfo=$(free -h | grep 'Mem:' | awk  '{print $2}')
bbpminfo=$(dmidecode -s baseboard-product-name)
bbminfo=$(dmidecode -s baseboard-manufacturer)
ssninfo=$(dmidecode -s system-serial-number)
osd=$(cat /etc/lsb-release | grep 'DISTRIB_DESCRIPTION' | awk -F"=" '{print $2}' | awk -F "\"" '{print $2}')
instdate=$(uname -r)
hostname=$(hostname)
uptime=$(uptime  -p | awk -F"up " '{print $2}')
procrun=$(ps axuh | wc -l)

#Put sistem info to task4_1.out
echo '---Hardware---'>task4_1.out
echo 'CPU: '${cpuinf:-'Uknown'}>>task4_1.out
echo 'RAM: '${meminfo:-'Uknown'}>>task4_1.out
echo 'Motherboard: '${bbminfo:-'Uknown'}' '${bbpminfo:-'Uknown'}>>task4_1.out
echo 'System Serial Number: '${ssninfo:-'Uknown'}>>task4_1.out
echo '---System---'>>task4_1.out
echo 'OS Distribution: '${osd:-'Uknown'}>>task4_1.out
echo 'Kernel version: '${instdate:-'Uknown'}>>task4_1.out
echo 'Hostname: '${hostname:-'Uknown'}>>task4_1.out
echo 'Uptime: '$uptime>>task4_1.out
echo 'Processes running: '$procrun>>task4_1.out
