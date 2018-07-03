#!/usr/bin/perl
use 5.016;
use DDP;

my @matrix = ([]);

my $A = $#matrix;
my $B = scalar @{$matrix[0]} - 1;
p $A;
p $B;
my @res;
if ($A > 0) {
	push @res, @{$matrix[0]};
	my @second_row;
	for (1..$A) {
		push @second_row, $matrix[$_][$B];
	}
	push @res, @second_row;
} else {
	@res = @{$matrix[0]};
}

sub left {
	my ($i, $j, $B) = @_;
	my @ans;
	for (my $k = $j - 1; $k >= $j - $B; $k--) {
		push @ans, $matrix[$i][$k];
	}
	return \@ans;
}

sub right {
	my ($i, $j, $B) = @_;
	my @ans;
	push @ans, $matrix[$i][$_] for $j + 1 .. $j + $B;
	return \@ans;
}

sub down {
	my ($i, $j, $A) = @_;
	my @ans;
	push @ans, $matrix[$_][$j] for $i + 1 .. $i + $A;
	return \@ans;
}

sub up {
	my ($i, $j, $A) = @_;
	my @ans;
	for (my $k = $i - 1; $k >= $i - $A; $k--) {
		push @ans, $matrix[$k][$j];
	}
	return \@ans;
}


my $i = $A;
my $j = $B;
my $state = "left";
if ($A > 0 and $B > 0) {
	while ($A != 0 or $B != 0) {
		if ($state eq "right") {
			last if $B == 0;
			push @res, @{right($i, $j, $B)};
			$j += $B;
			$A--;
			$state = "down";
			next;
		}
		if ($state eq "down") {
			last if $A == 0;
			push @res, @{down($i, $j, $A)};
			$i += $A;
			$B--;
			$state = "left";
			next;
		}
		if ($state eq "left") {
			last if $B == 0;
			push @res, @{left($i, $j, $B)};
			$j -= $B;
			$A--;
			$state = "up";
			next;
		}
		if ($state eq "up") {
			last if $A == 0;
			push @res, @{up($i, $j, $A)};
			$i -= $A;
			$B--;
			$state = "right";
			next;
		}
	}
}
p @res;
