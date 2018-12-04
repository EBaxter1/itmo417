#!/usr/bin/perl
#This program will find the element that is listed an odd number of times
#

print "Hello and welcome to the odd count program!\n";
print "\n";

#variables
@a1 = (1,1,2,2,3,3,4,4,5,5,6,7,7,7,7);
@a2 = (10,10,7,7,6,6,2,2,3,3,4,4,5,5,6,7,7,7,7,10,10);
@a3 = (6,6,10,10,7,7,6,6,2,2,3,3,4,4,5,5,6,7,7,7,7,10,10);
@a4 = (10,10,7,7,2,2,3,3,4,4,5,5,7,7,7,7,10,10,6);
@a5 = (6,6);
@a6 = (1);

sub findOddCount 
{
	@array = @_;
	# print "\n @array\n";
	@sortedArray = sort {$a <=> $b } @array;
	 #print "\n @sortedArray\n";
	%count = ();
	#make array into a hash
	++$count{$_} for @array;
	@hashValues = values(%count);
	@hashKeys = keys(%count);
	#go through hash to see if number of times a number happens it is odd
	$oddNum = "";
	foreach $num (@hashKeys) {
		$checkNum = $count{$num} % 2;
		# print "\nChecked: $checkNum\n";
		if ($checkNum ne 0 ){
			$oddNum = $num;
			print $oddNum;
		}	
	}
	# if all elements are even list then this prints 
	if (!defined $oddNum || $oddNum eq ""){
		print "unable to be found.";
	}
	# testing stuff
	# print "\n";
	# print @hashKeys;
	# print "\n";
	# print @hashValues;
}


#calls
# findOddCount(@a1);
print "odd value in a1 is "; findOddCount(@a1);
print "\n";
print "odd value in a2 is "; findOddCount(@a2);
print "\n";
print "odd value in a3 is "; findOddCount(@a3);
print "\n";
print "odd value in a4 is "; findOddCount(@a4);
print "\n";
print "odd value in a5 is "; findOddCount(@a5);
print "\n";
print "odd value in a6 is "; findOddCount(@a6);
print "\n";



print "\nThat is all the numbers! Program closing\n";
