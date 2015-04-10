set ns [new Simulator]

set nf [open out.nam w]
$ns namtrace-all $nf

set f [open bla.tr w]
$ns trace-all $f

proc finish {} {
	global ns nf f
    $ns flush-trace
    close $nf
	close $f
    exec nam out.nam &
    exit 0
}

set S [$ns node]
set R [$ns node]
set D [$ns node]

$ns duplex-link $S $R 1Mb 50ms DropTail
$ns duplex-link $R $D 100kb 5ms DropTail

$ns queue-limit $R $D 10
$ns duplex-link-op $R $D queuePos 0.5


set udp [new Agent/UDP]
$ns attach-agent $S $udp
set null [new Agent/Null]
$ns attach-agent $D $null
$ns connect $udp $null

set cbr [new Application/Traffic/CBR]
$cbr attach-agent $udp
$cbr set type_ CBR
$cbr set packet_size_ 50
$cbr set interval_ 0.01

$ns at 0.1 "$cbr start"
$ns at 10.1 "$cbr stop"

$ns at 10.1 "finish"

#Print CBR packet size and interval
puts "CBR packet size = [$cbr set packet_size_]"
puts "CBR interval = [$cbr set interval_]"

#Run the simulation
$ns run