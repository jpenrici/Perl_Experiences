# FileLogger.pm
# Reference: https://www.perltutorial.org/

package FileLogger;

use strict;
use warnings;

use Exporter 'import';
our @EXPORT_OK = qw(open log close set_level);


my $LEVEL = 1; # default log level

sub open{
    my $logfile = shift;
    open(LFH, '>>', $logfile) or die "cannot open the log file $logfile: $!";
    print LFH "Time: ", scalar(localtime), "\n";
}

sub log{
    my($log_level, $log_msg) = @_;
    if ($log_level <= $LEVEL) {
        print LFH "$log_msg\n";
    }
}

sub close{
    close LFH;
}

sub set_level{
    my $log_level = shift;
    if ($log_level =~ /^\d+$/) {
        $LEVEL = $log_level;
    }
}

1; # includes a statement for backward compatibility purposes
