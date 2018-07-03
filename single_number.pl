#!/usr/bin/perl
use 5.016;
use DDP;
my @arr1 = (1, 2, 2, 1);
my @arr2 = (2, 2);
my $res = 0;
my %hash;
@hash{@arr1} = ();
my @intersect = grep {!$hash{$_}++} @arr2;
p @intersect;