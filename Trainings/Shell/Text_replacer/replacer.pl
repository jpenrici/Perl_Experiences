#!/usr/bin/perl
# replacer.pl
# Training mixing Perl and Shell script.

use v5.40;    # Enables say, signatures, and strict/warnings
use utf8;
use File::Basename;

sub show_help () {
    say "Usage:";
    say "  perl replacer.pl <filename> <search> <replace> [output-path]";
    say "  perl replacer.pl --help";
    exit;
}

sub replacer ( $input_file, $search, $replacement, $output_file ) {

    # Safe 'grep' shell without Shell Injection
    open( my $grep_fh, "-|", "grep", "-c", "--", $search, $input_file )
      or return 0;

    my $count = <$grep_fh>;
    close($grep_fh);

    chomp($count) if $count;    # Remove newline
    $count //= 0;

    if ( $count == 0 ) {
        say "No occurrences of '$search' found in $input_file.";
        return 0;
    }

    # Open input and output files
    open( my $in,  '<', $input_file )  or die "Can't read $input_file: $!";
    open( my $out, '>', $output_file ) or die "Can't write $output_file: $!";

    # Process the text
    while ( my $line = <$in> ) {
        $line =~ s/\Q$search\E/$replacement/gi;
        print $out $line;
    }

    close($in);
    close($out);
    return $count;
}

sub main (@args) {

    # Check for help or empty args
    if ( ! @args || $args[0] eq '--help' ) {
        show_help();
    }

    # Assign arguments (requires at least 3)
    if ( @args < 3 ) {
        say "Error: Missing arguments.";
        show_help();
    }

    my ( $file_in, $search, $replace, $file_out ) = @args;
    $file_out //= "text_processed.txt";   # Default value if not provided

    my $dirname = dirname($file_out);
    if ( $dirname ne '.' ) {
        say "Ensuring directory '$dirname' exists...";
        system( 'mkdir', '-p', $dirname );
        if ( $? != 0 ) {
            die
              "Error: Could not create directory $dirname. Check permissions.";
        }
    }

    # Use Shell 'test -f' to check if file exists
    system( 'test', '-f', $file_in );
    if ( $? != 0 ) {
        say "Error: File '$file_in' not found.";
        return 1;
    }

    say "Processing: $file_in -> $file_out";

    my $total = replacer( $file_in, $search, $replace, $file_out );

    if ( $total > 0 ) {
        say "Success! Replaced $total occurrences.";

        # Use Shell 'head' to show the first few lines of the result
        say "Preview of output:";
        system( 'head', '-n', '3', $file_out );
    }

    return 0;
}

# Standard Perl boiler plate to start the script
if ( !caller ) {
    exit( main(@ARGV) );
}

1;

# Testing – Checking Weaknesses
#
# perl replacer.pl sample.txt legacy MODERN ./output/test1.txt
# perl replacer.pl sample.txt "log[0-1]" "SUCCESS" ./output/test2.txt
# perl replacer.pl sample.txt "   legacy   " "SPACED" ./output/test3.txt
# perl replacer.pl sample.txt '"; echo HACKED;"' "TEST" ./output/test4.txt
