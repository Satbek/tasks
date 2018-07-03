#!/usr/bin/perl

use 5.016;
use DDP;
use integer;
my @a = @{[0,1]};
p @a;

sub return_pivod(@) {
	my @arr = @_;
	return -1 unless (@arr);
	
	my $pivot = 0;
	my $sum_left = 0;
	my $sum_right = 0;
	for (1..$#arr) {
		$sum_right += $arr[$_];
	}
	while ($sum_left != $sum_right) {
		last if $pivot + 1 > $#arr;
		$sum_left += $arr[$pivot];
		$sum_right -= $arr[$pivot + 1];
		$pivot++;
		
	}
	return $pivot > $#arr ? -1 : $pivot;
}

say return_pivod(@a);
reverse