BEGIN{
	
}
{
	enqdeqtime=$3-$2;
	deqrecytime=$4-$3;
	print $1" "enqdeqtime" "deqrecytime;
}
END{
	
}