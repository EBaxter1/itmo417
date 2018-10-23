#!/usr/bin/perl

#This program will greet user and then provide some information about the system#


#greet user
print "Welcome to the new script-1a!\n";
print "Please enter your first and last name:";
$name = <STDIN>;
chomp $name;
$id = getpwuid($<);
print "Hello $name! Your Linux login id is $id\n";


#hostname and ip address
$hName = `hostname`;
$IP = `hostname -I`;
print "\nThe hostname for this server is $hName and the ip address is $IP\n";


#os release 
$OS = `cat /etc/os-release | head -2`;
print "The OS release and Linux flavor are as follows:\n$OS\n";


#log on record 
$log = `last | grep $id`;
print "Record log for the past logins of user $id are as follows:\n$log\n";


#system memoryu
$sMem = `cat /proc/meminfo | head -2 | tail -1`;
print "Current system memory is $sMem\n";

#list root processes 
$process = `ps -ef | grep -v root`;
print "All current running non-root processes:\n$process\n"; 
