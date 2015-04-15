#!/bin/bash

rm -rf overall-stats.txt bla
for node in `seq 20`
do
ns ns-csmacd-lab04.tcl -nn $node -seed 0060 2> bla
received=`cat csmacd.tr | grep ^r | wc -l`
lost1=`cat csmacd.tr | grep ^d | wc -l`
lost2=`cat bla | tail -n +5 | wc -l`
generated=`cat csmacd.tr | grep ^h | wc -l`
echo "$node $received $lost1 $lost2 $generated" >> temp11.txt
done

awk -f scriptex2.awk  temp11.txt > overall-stats.txt
rm -rf temp11.txt bla
