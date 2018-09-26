#!/bin/bash

# This program edits a file using sed


echo "Welcome to the sed program!"
echo " "

echo "The title "PERSONNEL FILE" will be added to the top of the file"
sed '1i PERSONNEL FILE' /home/sam/datafile/datebook

