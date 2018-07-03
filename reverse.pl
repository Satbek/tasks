#!/usr/bin/perl
use 5.016;
use DDP;
my $str = <>;
# Write a function that takes a string as input and returns the string reversed.

# Example:
# Given s = "hello", return "olleh". 
chomp $str;
my @string = split //,$str;
p @string;

my $i = 0;
my $j = $#string;
while ($i < $j) {
	my $tmp = $string[$i];
	$string[$i] = $string[$j];
	$string[$j] = $tmp;
	$i++;
	$j--;
}

p @string;