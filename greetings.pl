#!/usr/bin/perl

#This program will print messages according to system time

#set variable 
$time = `date | cut -d" " -f4 | cut -d: -f1`;

if ($time >= 0 and $time < 12)
{
	print "Good Morning\n";
}
elsif ($time >= 12 and $time < 17)
{
	print "Good Afternoon\n";
}
else
{
	print "Good Evening\n";
}
