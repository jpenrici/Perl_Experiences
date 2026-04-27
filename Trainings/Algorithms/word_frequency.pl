# word_frequency.pl

use strict;
use warnings;

sub count_word_frequency {

    my ($text) = @_;    # list
    $text //= "";

    my %freq;           # hash

    $text =~ s/[[:punct:]]//g;    # remove ponctuaction

    foreach my $word (
        split(
            /\s+/,       # words
            lc($text)    # lower case
        )
      )
    {
        next if $word eq "";
        $freq{$word}++;
    }

    return \%freq;    # passing hash by Reference
}

sub show {
    my ($freq_ref) = @_;    # hash

    for
      my $word ( sort { $freq_ref->{$b} <=> $freq_ref->{$a} } keys %$freq_ref )
    {
        printf( "%-10s : %d\n", $word, $freq_ref->{$word} );
    }
}

sub main {
    my $sample     = "Perl is powerful. Perl es fast. Learning Perl is fun!";
    my $result_ref = count_word_frequency($sample);
    show($result_ref);
}

main();
