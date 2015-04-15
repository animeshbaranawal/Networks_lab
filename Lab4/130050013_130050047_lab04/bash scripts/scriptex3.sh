#!/bin/bash

rm -rf temp111
ns ns-csmacd-lab04.tcl -nn 20 -seed 0060
for node in `seq 20`
do
	sent=`cat csmacd.tr | grep ^r | grep " $node\.0 " | wc -l `
	echo "$node $sent" >> temp111
done

awk -f scriptex3.awk temp111 >run20-node-stats.txt
rm -rf temp111
