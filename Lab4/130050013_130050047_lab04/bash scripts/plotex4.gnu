set term postscript eps color

set output 'EnqtoDeq.eps'

#used to make the fonts appear larger;  makes the figure smaller but keeps the fonts same size
set key right top

set grid
set xlabel "Packet Number"
set ylabel "Time(in sec)"

plot \
'run20-delay-stats.txt' using 1:2 t'Time EnqtoDeq' with p pt 1

set term postscript eps color

set output 'DeqtoRec.eps'

#used to make the fonts appear larger;  makes the figure smaller but keeps the fonts same size
set key right top

set grid
set xlabel "Packet Number"
set ylabel "Time(in sec)"

plot \
'run20-delay-stats.txt' using 1:3 t'Time DeqtoRec' with p pt 1