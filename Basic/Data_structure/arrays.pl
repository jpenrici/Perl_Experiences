#!/usr/bin/perl
# arrays.pl

# Reference: https://www.perltutorial.org/

use warnings;
use strict;
use utf8;

# List
print((1, 2, 3, 4, 5)[3], "\n");
print((1, 2, 3, 4, 5)[0, 2, 3], "\n");

# Array
my @list = (10, 20, 30, "string", (1..3));
print(@list, "\n");

my @colors = qw(black white blue red green);
print(@colors[2], "\n");

my @a = qw(3 2 1 4 8 9);
print("unsorted: ", "@a", "\n");

@a = sort {$a <=> $b} @a;
print("sorted: ", "@a", "\n");

# Ranges
print((1..10), "\n");
print(('a'..'z'), "\n");

my @sequence = (-10..0);
for (@sequence) { print("$_ "); }
print(": ", $#sequence, " values\n");

my $j = 10;
for my $i (@sequence) { print("$i + $j = ", calc($i, $j) , "\n"); }

for (my $i = $#sequence; $i >= 0; $i--) { print("$sequence[$i] "); }
print(": Sum = ", &sum(@sequence), "\n");

sub sum{
 my $total = 0;
 for my $i(@_) {
    $total += $i;
 }
 $total; # return $total;
}

sub calc{
    $_[0] + $_[1];
}
