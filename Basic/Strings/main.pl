#!/bin/bash/env perl
# main.pl

# Reference: https://www.perltutorial.org/

use warnings;
use strict;

# String alternative delimiters
my $s = q/"Are you learning Perl string today?" We asked./;
print($s, "\n");

my $name = 'Murrinha';
$s = qq/"Are you learning Perl string today?" $name asked./;
print("$s\n");

$s = q^A string with different delimiter.^;
print($s, "\n");

# String functions
print(length($s), "\n"); #34

print("String: " . uc("upper") . " and " . lc("LOWER") . ".\n");

$s = "Learning Perl is easy";
my $sub = "Perl";

my $p = index($s, $sub);
print(qq\The substring "$sub" found at position "$p" in string "$s"\, "\n");
$p = rindex($s, $sub);
print(qq\The substring "$sub" found at position "$p" in string "$s"\, "\n");
print(substr($s, 9, 4), "\n");

print(scalar reverse($s), "\n");

my $text = sprintf("Hi %s, the price of the cat food is R\$ %.2f", $name, 10.50);
print $text, "\n";

$s = "The chomp() operator (or function) removes the last character" .
     "in a string and returns a number of characters that were removed...\n";
my $n = chomp($s);
print("$s ($n removed)");
print("\n");
