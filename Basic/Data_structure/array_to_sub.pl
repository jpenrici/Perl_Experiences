#!/usr/bin/perl
# array_to_sub.pl

use warnings;
use strict;

my @a = (1, 3, 2, 6, 8, 4, 9);
my @b = (8, 0, 10);

my $m = &max(\@a);
print("\@a : [@a] : max = ", &max(\@a), "\n");
print("\@b : [@b] : max = ", &max(\@b), "\n");

my @c = pops(\@a, \@b);
print("\@c : [@c] : max = ", &max(\@c), "\n");

sub max{
 my $aref = $_[0];
 my $k = $aref->[0];
 for (@$aref) { $k = $_ if ($k < $_); }
 return $k;
}

sub pops{
 my @ret = ();
 for my $aref(@_) { push(@ret, pop @$aref); }
 return @ret;
}


