#!/bin/bash

rm -rf run20-delay-stats.txt temp1.txt rec.txt
ns ns-csmacd-lab04.tcl -nn 20 -seed 0060
cat csmacd.tr | grep ^r > rec.txt
cat rec.txt | \
while read LINE
do
	rectime=`echo $LINE | awk '{print $2}'`
	x=`echo $LINE | awk '{print $NF}'`
	enqtime=`cat csmacd.tr | grep ^+ | grep " $x$" | awk '{print $2}'`
	deqtime=`cat csmacd.tr | grep ^- | grep " $x$" | awk '{print $2}'`
	echo "$x $enqtime $deqtime $rectime" >> temp1.txt
done

awk -f scriptex4.awk < temp1.txt > temp2.txt
rm -rf temp1.txt rec.txt
sort -n temp2.txt > run20-delay-stats.txt
rm -rf temp2.txt