set term postscript eps color

set output 'my-fairness.eps'

#used to make the fonts appear larger;  makes the figure smaller but keeps the fonts same size
set key right top

set grid
set xlabel "Number of Nodes"
set ylabel "Throughput(in Mbps)"

plot \
'run20-node-stats.txt' using 1:2 t'Throughput' with lp pt 1