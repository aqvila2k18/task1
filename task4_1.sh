#!/bin/bash

#Get system info
cpuinf=$(cat /proc/cpuinfo | grep 'model name' -m 1 | awk -F": " '{print $2}')
meminfo=$(free -h | grep 'Mem:' | awk  '{print $2}')
bbpminfo=$(dmidecode -s baseboard-product-name)
bbminfo=$(dmidecode -s baseboard-manufacturer)
ssninfo=$(dmidecode -s system-serial-number)
osd=$(cat /etc/lsb-release | grep 'DISTRIB_DESCRIPTION' | awk -F"=" '{print $2}' | awk -F "\"" '{print $2}')
instdate=$(fs=$(df / | tail -1 | cut -f1 -d' ') && tune2fs -l $fs | grep created | awk -F"Filesystem created:       " '{print $2}')
krnlv=$(uname -r)
hostname=$(hostname)
uptime=$(uptime  -p | awk -F"up " '{print $2}')
procrun=$(ps axuh | wc -l)
loguser=$( w -s -h | wc -l)
netif=$(cat /proc/net/dev | awk -F : '{if (NR>2) print $1}')

#Path to task4_1.out
s_dir=$(dirname $0)'/task4_1.out'

#Put sistem info to task4_1.out
echo '---Hardware---'>$s_dir
echo 'CPU: '${cpuinf:-'Uknown'}>>$s_dir
echo 'RAM: '$meminfo'B'>>$s_dir
echo 'Motherboard: '${bbminfo:-'Uknown'}' '${bbpminfo:-'Uknown'}>>$s_dir
echo 'System Serial Number: '${ssninfo:-'Uknown'}>>$s_dir
echo '---System---'>>$s_dir
echo 'OS Distribution: '${osd:-'Uknown'}>>$s_dir
echo 'Kernel version: '${krnlv:-'Uknown'}>>$s_dir
echo 'Installation date: '${instdate:-'Uknown'}>>$s_dir
echo 'Hostname: '${hostname:-'Uknown'}>>$s_dir
echo 'Uptime: '$uptime>>$s_dir
echo 'Processes running: '$procrun>>$s_dir
echo 'Users logged in: '$loguser>>$s_dir

#Put network info to task4_1.out
echo '---Network---'>>$s_dir
for i in $netif
do
netip=$(ip address show $i | grep 'inet '| awk '{print $2}')
echo $i': '${netip:-'-'}>>$s_dir
done
