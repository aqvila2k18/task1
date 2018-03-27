#!/bin/bash

apt-get install bc  > /dev/null 2>&1

#Get system info
cpuinf=$(dmidecode -s processor-version)
meminfo=$(free -h | grep 'Mem:' | awk  '{print $2}')
bbpminfo=$(dmidecode -s baseboard-product-name)
bbminfo=$(dmidecode -s baseboard-manufacturer)
ssninfo=$(dmidecode -s system-serial-number)
osd=$(cat /etc/lsb-release | grep 'DISTRIB_DESCRIPTION' | awk -F"=" '{print $2}' | awk -F "\"" '{print $2}')
instdate=$(uname -r)
hostname=$(hostname)
upsec=$(cat /proc/uptime | awk -F"." '{print $1}')
let "updaywhole = upsec / 86400"
let "updayfrac = upsec % 86400"

#Put sistem info to task4_1.out
echo '---Hardware---'>task4_1.out
echo 'CPU: '${cpuinf:-'Uknown'}>>task4_1.out
echo 'RAM: '${meminfo:-'Uknown'}>>task4_1.out
echo 'Motherboard: '${bbpminfo:-'Uknown'}'/'${bbminfo:-'Uknown'}>>task4_1.out
echo 'System Serial Number: '${ssninfo:-'Uknown'}>>task4_1.out
echo '---System---'>>task4_1.out
echo 'OS Distribution: '${osd:-'Uknown'}>>task4_1.out
echo 'Kernel version: '${instdate:-'Uknown'}>>task4_1.out
echo 'Hostname: '${hostname:-'Uknown'}>>task4_1.out
echo 'Uptime: '$updaywhole'.'$updayfrac'days'>>task4_1.out
