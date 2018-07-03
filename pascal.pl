#!/usr/bin/perl
use 5.016;
use DDP;
# Given a non-negative integer numRows, generate the first numRows of Pascal's triangle.


# In Pascal's triangle, each number is the sum of the two numbers directly above it.

# Example:

# Input: 5
# Output:
# [
#      [1],
#     [1,1],
#    [1,2,1],
#   [1,3,3,1],
#  [1,4,6,4,1]
# ]




my $count = <>;
my $level = [1];
sub next_level {
	my $arr = shift;
	my @res;
	my $first = 0;
	for my $i (@{$arr}) {
		push @res, $i + $first;
		$first = $i;
	}
	push @res, @{$arr}[-1];
	return \@res;
}
my @res;
push @res, $level;
for (1..$count - 1) {
	$level = next_level($level);
	push @res, $level;
}

p @res;