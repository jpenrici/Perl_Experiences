#!/usr/bin/perl
# helloWorld.pl

# Reference: https://www.perltutorial.org/

use strict;
use warnings;
use utf8;
use feature 'say'; # print + newline

sub main {

    my $name = "World";
    say "Hello, " . $name . "!";

    {
        # block
        my $name = "user";
        print("Hello, " . $name . "!\n");
    }

    $name = "guest";
    print "Hello, $name !\n";

    my @args = @_; # capture command line arguments
    if (@args) {
        say "Arguments received: ". join(", ", @args);
    }

    return 0;
}

if ( !caller ){
    exit(main(@ARGV));
}

1;
