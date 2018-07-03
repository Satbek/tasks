#!/usr/bin/perl
#Suppose Andy and Doris want to choose a restaurant for dinner, and
#they both have a list of favorite restaurants represented by strings.
#You need to help them find out their common interest with the
#least list index sum. If there is a choice tie between answers, 
#output all of them with no order requirement. You could assume there always exists an answer.

# Input:
# ["Shogun", "Tapioca Express", "Burger King", "KFC"]
# ["Piatti", "The Grill at Torrey Pines", "Hungry Hunter Steakhouse", "Shogun"]
# Output: ["Shogun"]
# Explanation: The only restaurant they both like is "Shogun".

# Input:
# ["Shogun", "Tapioca Express", "Burger King", "KFC"]
# ["KFC", "Shogun", "Burger King"]
# Output: ["Shogun"]
# Explanation: The restaurant they both like and have the least index sum is "Shogun" with index sum 1 (0+1).
use 5.016;
use DDP;
use List::Util qw/min/;
use Test::More;

#строим 2 ассоциативных массива, по исходному.
#$arr1{"Shogun"} == "1", $arr1{"Tapioca Express"}
#$arr2{"KFC"} == "1", $arr2{"Shogun"} == 1
#строим пересечение и в значении ставим сумму индексов.

# my @arr1 = ("Shogun", "Tapioca Express", "Burger King", "KFC", "1");
# my @arr2 = ("Burger King", "The Grill at Torrey Pines", "Tapioca Express", "Shogun", "1");

my (%arr1, %arr2);
for (1..10) {
	$arr1{int rand 20} = 1;
	$arr2{int rand 20} = 1;
}

my @arr1 = keys %arr1;
my @arr2 = keys %arr2;
say '@arr1:';
p @arr1;
say '@arr2:';
p @arr2;
sub func {
	my ($arr1, $arr2) = @_;
	my @hash1 = map {$arr1->[$_] => $_} (0..$#$arr1); #O(N)
	my @hash2 = map {$arr2->[$_] => $_} (0..$#$arr2); #O(N)
	my %hash1 = @hash1; #O(1)
	my %hash2 = @hash2; #O(1)
	say '%hash1:';
	p %hash1;
	say '%hash2:';
	p %hash2;

	my %interest = map {$_ => $hash1{$_} + $hash2{$_}} grep {exists $hash2{$_}} keys %hash1; #O(N log N)
	say 'interest';
	p %interest;

	my %answer;
	my $min = $#arr1 + $#arr2; #O(1)
	for (keys %interest) { #O (N log N)
		$answer{$interest{$_}} //= []; 
		push @{$answer{$interest{$_}}}, $_;
		$min = $interest{$_} if $interest{$_} < $min;
	}
	say '%answer';
	p %answer;
	say '$res:';
	my $res = $answer{$min}; #O(1)
	p $res;
}

func(\@arr1, \@arr2);