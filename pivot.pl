#!/usr/bin/perl
# Given an array of integers nums, write a method that returns the "pivot" index of this array.

# We define the pivot index as the index where the sum of the numbers to the left of the index is equal to the sum of the numbers to the right of the index.

# If no such index exists, we should return -1. If there are multiple pivot indexes, you should return the left-most pivot index.

# Example 1:

# Input: 
# nums = [1, 7, 3, 6, 5, 6]
# Output: 3
# Explanation: 
# The sum of the numbers to the left of index 3 (nums[3] = 6) is equal to the sum of numbers to the right of index 3.
# Also, 3 is the first index where this occurs.

# Example 2:

# Input: 
# nums = [1, 2, 3]
# Output: -1
# Explanation: 
# There is no index that satisfies the conditions in the problem statement.

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