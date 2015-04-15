BEGIN{
	
}
{
	throughput = ($2*8)/(10000);
	efficiency = throughput*100;
	drop = ($3+$4)/$5 ;
	print $1" "throughput" "efficiency" "drop;
}
END{
	
}