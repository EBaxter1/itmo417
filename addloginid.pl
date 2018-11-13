#!/usr/bin/perl
#This program adds a new user to the system
#
print "Welcome to the add login program!\n";

# Global variables
$id=" ";
$fName=" ";
$newId=" ";
$groupId=" ";
$phone=" ";

# function to get user input
sub getUserStuff
{
	print "\nPlease enter full name:";
	$fName = <STDIN>;
	chomp $fName;

	print "Please enter choice of Linux user ID:";
	$id = <STDIN>;
	chomp $id;
	$grep = `grep -iw $id ../submit/perl_hw3/passwd`;
	if ($? ==  0)
	{
		print "$id is a duplicate id. Please try again with unqiue id\n";	
	}
	else 
	{
		print "Please enter phone number in the format xxx-xxx-xxxx:\n";
		$phone = <STDIN>;
		chomp $phone;
		
		&getIDs;		
	}
}


# get UID and GID
sub getIDs
{
	$lastId=`tail -1 ../submit/perl_hw3/passwd | cut -d: -f3`;
	$newId = $lastId +  1;

	print "\nUID and GID to be used: $newId\n";
	
	&addUser;	
}

# make new home directory 
sub addHome
{
	print "\nCreating new home directory\n";
	
	$newHome=`mkdir /home/$id`;
	print $newHome;
	if ($? != 0)
	{
		print "Error creating new home directory. Program will now close";
	}
	else
	{
		$profile=`cp /etc/skel/.bash_profile /home/$id`;
		print $profile;
		if ($? != 0)
		{
			print "Error copying bash profile to new home directory. Program will now close";
		}
		else
		{
			 print "New home directory created at: /home/$id\n";
			
			&showInfo;
		}
	}
}

# make new user
sub addUser
{
	$path="/home/$id";
	print "\nTesting: $path\n";
	$newUser="$id:x:$newId:$newId:$fName, $phone:$path:/bin/bash\n";
	print "\nCreating user...\n";
	open(FILE, "+>>../submit/perl_hw3/passwd") or die("Unable to create user");
	print FILE $newUser;
	close(FILE);
	print "New User created successfully!\n";

	$newGroup="$id:x:$newId:\n";
	print "Creating group...\n";
	open(FILE2, "+>>../submit/perl_hw3/group") or die("Unable to create user");
	print FILE2 $newGroup;
	close(FILE2);
	print "New Group created successfully!\n";

	&addHome;
}

sub showInfo () 
{
	print "\nNew user id: $id\n";
	
	$list=`ls -l /home/$id`
	print "New user home directory is as follows:\n $list\n";

	$userEntry=`tail -1 ../submit/perl_hw3/passwd`;
	print "Last entry in /etc/passwd is now the following:\n$userEntry\n";
	
	$groupEntry=`tail -1 ../submit/perl_hw3/group`;
	print "Last entry in /etc/group is now the following:\n$groupEntry\n";

	print "\nPassword for user $id will need to be set using passwd commad\m"; 
}

&getUserStuff; 
