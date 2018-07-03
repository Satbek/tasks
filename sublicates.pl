#!/usr/bin/perl
use 5.016;
use DDP;
my @arr = (1,1,1,3,3,4,3,2,4,2);

my %hash;

my $res = 0;
for (@arr) {
	$hash{$_}++;
	if ($hash{$_} > 1) {
		$res = 1;
		last;
	}
}
p %hash;
say $res;