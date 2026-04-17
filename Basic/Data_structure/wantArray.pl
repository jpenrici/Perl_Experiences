#!/usr/bin/perl
# wantArray.pl

# Reference: https://www.perl.org/

use feature 'say';
use strict;
use warnings;

sub languages{
    my @langs = ("PHP", "Python", "Perl");

    if (wantarray) {
        return @langs;
    } elsif (defined wantarray) {
        return scalar @langs;
    } else {
        say "Warning: You called the function but don't save the result!";
        return;
    }
}

my @list_langs = languages();
my $total = languages();
say "$total programming languages available: [@list_langs]";

my @names = ("Ana", "Pedro", "Lucas");
say "Total: " . @names . " elements";
say "List: ", join("; ", @names);
say "Quantity: ", scalar @names;
