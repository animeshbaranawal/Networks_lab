#!/bin/bash

cat ./udp-40k.tr | grep ^r | grep " 1 2 " | \
awk -F" " '{print $2, $NF}' > pack_rec_40

cat ./udp-40k.tr | grep ^+ | grep " 0 1 " > temp

cat pack_rec_40 | \
while read LINE; do
	id=$(echo $LINE | awk -F" " '{print $2}')
	grep " "$id$ < temp >> temp2  
done

awk -F" " '{print $2, $NF}' temp2 > pack_sent_40

rm temp temp2

cat ./udp-80k.tr | grep ^r | grep " 1 2 " | \
awk -F" " '{print $2, $NF}' > pack_rec_80

cat ./udp-80k.tr | grep ^+ | grep " 0 1 " > temp

cat pack_rec_80 | \
while read LINE; do
	id=$(echo $LINE | awk -F" " '{print $2}')
	grep " "$id$ < temp >> temp2  
done

awk -F" " '{print $2, $NF}' temp2 > pack_sent_80

rm temp temp2

tr40=$(awk -f ./td.awk ./pack_rec_40)
ts40=$(awk -f ./td.awk ./pack_sent_40)
pack40=$(cat ./pack_sent_40 | wc -l)
echo $tr40
echo $ts40
echo $pack40


tr80=$(awk -f ./td.awk ./pack_rec_80)
ts80=$(awk -f ./td.awk ./pack_sent_80)
pack80=$(cat ./pack_sent_80 | wc -l)
echo $tr80
echo $ts80
echo $pack80

rm pack_sent_40 pack_sent_80 pack_rec_80 pack_rec_40