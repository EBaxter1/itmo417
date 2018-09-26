#!/bin/sed -f

# This is a sed script file that will perform edits on a file

# echo "Welcome to the sed program"

#Adding Personall file to the top of the file 
1i PERSONNAL FILE 

#remoes salaries ending in 500
/500$/d

# Reverse the first and last names in the file
s/^\([A-Z[A-Za-z]*\) \([A-Z][A-Za-z]*\)/\2 \1/  

# Append the end to bottom of file
$a THE END
