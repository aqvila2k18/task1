#!/bin/bash
cpuinf=$(dmidecode -s processor-version)
meminfo=$(free -h | grep 'Mem:' | awk  '{print $2}')
bbpminfo=$(dmidecode -s  baseboard-product-name)
bbminfo=$(dmidecode -s  baseboard-manufacturer)
echo '---Hardware---'>task4_1.out
echo 'CPU: '${cpuinf:-'Uknown'}>>task4_1.out
echo 'RAM: '${meminfo:-'Uknown'}>>task4_1.out
echo 'Motherboard: '${bbpminfo:-'Uknown'}'/'${bbminfo:-'Uknown'}>>task4_1.out
