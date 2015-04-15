set ns [new simulator]

$ns trace-all [open out.tr w]

proc finish {} {
	global ns nf
	close $nf
	exec nam out.nam &
	exit 0
}

$ns at 5.0 "finish"

$ns run