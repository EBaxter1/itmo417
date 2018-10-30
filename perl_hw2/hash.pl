#!/usr/bin/perl
#
#This program will have names hash and allow search for current names
#
#hash
%firstN_lastN = (
John => "Norman",
Robert => "Anson",
Christopher => "Fowler",
Robert => "Harris",
Dan => "Simmons",
);

#get search name
print "Hello, welcome to the name search program\n";
print "\nPlease enter name to first name to search:";
$fName = <STDIN>;
chomp $fName;

#check name
@FirstNames = keys(%firstN_lastN);
foreach $name (@FirstNames) {
	if ($name eq $fName) {
		print "\nName(s) Found!\n";
		foreach $check (@FirstNames) {
			if ($check eq $fName){
				$lName = $firstN_lastN{"$fName"};
				chomp $lName;
				print "Full name: $fName $lName\n";
			}
		}
	}
#	else {
#		print "\nName not found! Goodbye\n";
#		last;
#	}
}

