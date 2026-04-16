#!/usr/bin/perl
# hash.pl

# Reference: https://www.perltutorial.org/

use warnings;
use strict;

my %langs = (
    England => 'English',
    France => 'French',
    Spain => 'Spanish',
    Germany => 'German',
    Brazil => 'Portuguese',
    China => 'Chinese'
);

$langs{'Italy'} = 'Italian';
$langs{'Argentina'} = 'Spanish';

for (keys %langs) {
    print("Official Language of $_ is $langs{$_}. ");
    print("Beautiful country!\n") if ($_ eq 'Brazil');
    print(" ...\n") unless ($_ eq 'Brazil');
}
