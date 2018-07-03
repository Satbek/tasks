#!/usr/bin/perl
use 5.016;
my @numbers = (2,7,11,15);
my $target = 9;
my $l = 0;
my $r = $#numbers;
while ($l < $r) {
	if ($numbers[$l] + $numbers[$r] == $target) {
		print "$l $r\n";
		last;
	} elsif ($numbers[$l] + $numbers[$r] < $target) {
		$l++;
	} elsif ($numbers[$l] + $numbers[$r] > $target) {
		$r--;
	}
}