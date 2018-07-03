#!/usr/bin/perl
use 5.016;
use DDP;
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