#!/usr/bin/perl
# test.pl

use strict;
use warnings;
use lib '.';    # add the current directory path

use FileLogger qw(open log close);

open("logtest.log");    # FileLogger::open
log( 1, "This is a test message" );
close();
