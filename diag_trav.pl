#!/usr/bin/perl
use 5.016;
use DDP;
use List::Util qw /min max/;
#  Given a matrix of M x N elements (M rows, N columns), return all elements
#of the matrix in diagonal order as shown in the below image.

# Example:

# Input:
# [
#  [ 1, 2, 3 ],
#  [ 4, 5, 6 ],
#  [ 7, 8, 9 ]
# ]
# Output:  [1,2,4,7,5,3,6,8,9]
#my @matrix = ([1,2,3,4],[5,6,7,8],[9,10,11,12]);
my @matrix = ([1,2,3],[4,5,6]);
# 1  2  3  4
# 5  6  7  8
# 9  10 11 12

# 13 14 15 16
my $A = $#matrix;
my $B = scalar(@{$matrix[0]}) - 1;
sub diag_down {
	my $matrix = shift;
	my ($i, $j) = @_;
	my @res;
	push @res, $matrix->[$i][$j];

	while ($i != $#matrix and $j != 0) {
		$i++;
		$j--;	
		push @res, $matrix->[$i][$j];
	}
	return \@res;
}

my @res;
my $ans;
my $flag = 1;
for my $i (0..$B) {
	$ans = diag_down(\@matrix, 0, $i);
	if ($flag) {
		$ans = [reverse @{$ans}];
		$flag = 0;
	} else {
		$flag = 1;
	}
	push @res, @{$ans};
}

for my $i (1..$A) {
	$ans = diag_down(\@matrix, $i, $B);
	if ($flag) {
		$ans = [reverse @{$ans}];
		$flag = 0;
	} else {
		$flag = 1;
	}
	push @res, @{$ans};
}
# my $ans = diag_down(\@matrix, 0,1);
# p $ans;

p @res;
# 0,0 up
# 0,1 down
# 0,2

# 1,2
# 2,2
