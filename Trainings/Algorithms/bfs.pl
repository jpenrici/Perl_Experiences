# bfs.pl
# Breadth First Search

use strict;
use warnings;
use feature 'say';

sub bfs {
    my ( $graph, $start_node ) = @_; # hash and string
    my @queque = ($start_node); # list
    my %visited; # hash

    $visited{$start_node} = 1;

    say "Starting BFS traversal:";

    while (@queque) {
        # shift: removes and returns the first element of an array
        my $current = shift @queque;

        print "$current -> ";
        foreach my $neighbor ( @{ $graph->{$current} } ) {
            if ( !$visited{$neighbor} ) {
                $visited{$neighbor} = 1;
                push @queque, $neighbor;
            }
        }
    }
    say "End";
}

sub main {

    my $network = {
        'A' => [ 'B', 'C' ],
        'B' => [ 'A', 'D', 'E' ],
        'C' => [ 'A', 'F' ],
        'D' => ['B'],
        'E' => [ 'B', 'F' ],
        'F' => [ 'C', 'E' ],
    };

    bfs( $network, 'D' );
}

main();
