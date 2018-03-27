#!/bin/bash
cpuinf=$(dmidecode -s processor-version)
echo ${cpuinf:-'Uknown'}
