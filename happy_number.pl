#!/usr/bin/perl
use 5.016;
use DDP;
use List::Util qw/sum/;
my $num = <>;
chomp $num;

my %seen;
my $res = 1;
while () {
	if (exists $seen{$num}) {
		$res = 0;
		last;
	}
	$seen{$num}++;
	$num = sum map {$_**2} split //, $num;
	p $num;
	sleep(1);
	last if ($num == 1);
}

say $res;