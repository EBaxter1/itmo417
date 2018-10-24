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
chomp $hName;
chomp $IP;
print "\nThe hostname for this server is $hName and the ip address is $IP\n";


#os release 
$OS = `cat /etc/os-release | head -2`;
print "\nThe OS release and Linux flavor are as follows:\n$OS\n";


#log on record 
$log = `last | grep $id`;
print "Record log for the past logins of user $id are as follows:\n$log\n";


#system memoryu
$sMem = `cat /proc/meminfo | head -2 | tail -1`;
chomp $sMem;
print "Current system memory is $sMem\n";

#list root processes 
$process = `ps -ef | grep -v root`;
print "\nAll current running non-root processes:\n$process\n"; 


#file system
$file = `df -h`;
print "Current fille system information is as follows:\n$file\n";


#ids
$group = `cat /etc/passwd | grep 2018FA | cut -d: -f1,5 | tr "," : | cut -d: -f1,2 | tr ":" " "`;
print "All current user ids and owners in the 2018FA group:\n$group\n";


#login count
$logon = `cat /etc/passwd | grep 2018FA | wc -l`;
chomp $logon;
print "There are currently $logon logins created for the Fall 2018 class\n";


print "\nThank you, program now ending\n";


