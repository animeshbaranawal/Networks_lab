set term postscript eps color

set output 'my-thr.eps'

#used to make the fonts appear larger;  makes the figure smaller but keeps the fonts same size
set key right top

set grid
set xlabel "Number of Nodes"
set ylabel "Throughput(in Mbps)"

plot \
'overall-stats.txt' using 1:2 t'Throughput' with lp pt 1

set term postscript eps color

set output 'my-eff.eps'

#used to make the fonts appear larger;  makes the figure smaller but keeps the fonts same size
set key right top

set grid
set xlabel "Number of Nodes"
set ylabel "Efficiency(in %)"

plot \
'overall-stats.txt' using 1:3 t'Efficiency' with lp pt 1

set term postscript eps color

set output 'my-drops.eps'

#used to make the fonts appear larger;  makes the figure smaller but keeps the fonts same size
set key right top

set grid
set xlabel "Number of Nodes"
set ylabel "Drops"

plot \
'overall-stats.txt' using 1:4 t'Drops' with lp pt 1



