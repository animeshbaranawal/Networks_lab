BEGIN{
	sum=0;
}
{
	thru = ($2*8)/(10000);
	sum = sum + thru;
	print $1" "thru;	
}
END{

}
