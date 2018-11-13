#!/usr/bin/perl
#
#This program will uses /etc/passwd and output some information
#

print "Welcome! Checking /etc/passwd file\n";

#count bash shell users and noLogin shell users
$num_bash = `cat /etc/passwd | grep /bash | wc -l`;
$num_nologin = `cat /etc/passwd | grep /nologin | wc -l`;
chomp $num_bash;
chomp $num_nologin;
print "\nThere are $num_bash usernames that are using bash shell\n";
print "There are $num_nologin usernames that are using nologin shell\n";

#grab largest UID 
@UID = `cat /etc/passwd | cut -d: -f3`;
@new = sort { $a <=> $b} (@UID);
$size = @new;
print "\nThe largest UID is @new[$size-1]\n";

#uid less 1000
open(PASSWORD, "/etc/passwd") or die("Error: Can not open /etc/passwd\n");
@lines = <PASSWORD>;
foreach $record (@lines){
	@elements = split(':', $record);
	if(@elements[2] <=> 2000){
	print @elements[0];
	print "\n";
	}
}
close PASSWORD 

