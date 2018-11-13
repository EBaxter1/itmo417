#!/usr/bin/perl
#
#This go through arrays and sort them 
#
#creating array
@food = ("burger", "dip", "fries", "apple", "steak", "cake", "spinach", "hummus", "chocolate", "eggroll", "squash", "egg");

#new array
@badFood = splice(@food, 6);

#print foods
print "The first food in the favorite food array is @food[0], the second is @food[1], and the third is @food[2]\n";

#new food
print "\nHello, welcome to the food array program\n";
print "Please enter a food you dislike:";
$newFood = <STDIN>;
chomp $newFood;
push(@badFood, $newFood);

#move badfood
$fMove = pop(@badFood);
unshift(@badFood, $fMove);

#move good food
$bMove = shift(@food);
push(@food, $bMove);

#print new moves
$size = @food;
print "\nThe new first element of the disliked food array is @badFood[0]\n";
print "The new last element of the favorite food array is @food[$size-1]\n";

#sizes!
$size2 = @badFood;
print "\nThe number of elements of the disliked foods array is $size2\n";
print "The number of elements in the favorite foods array is $size\n";



