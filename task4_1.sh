#!/bin/bash
cpuinf=$(dmidecode -s processor-version)
echo '---Hardware---'>task4_1.out
echo 'CPU:'${cpuinf:-'Uknown'}>>task4_1.out
