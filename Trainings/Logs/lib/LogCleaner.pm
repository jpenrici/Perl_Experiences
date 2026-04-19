# Logs/lib/LogCleaner.pm

package LogCleaner;

use v5.40;

# Sanitizes the legacy log into a clean CSV-like format
sub sanitize ($input_file, $output_file) {
    open(my $in,  '<', $input_file)  or die "Cannot open input: $!";
    open(my $out, '>', $output_file) or die "Cannot open output: $!";

    while (my $line = <$in>) {
        # REGEX: Capture ID, Status, and Message while stripping noise
        if ($line =~ /LEGACY_ID_(\d+).*?\|\s*(\w+)\s*\|\s*(.*)/) {
            my ($id, $level, $msg) = ($1, $2, $3);
            $msg =~ s/\s+$//; # Trim trailing whitespace

            # Writing clean, structured data
            print $out "ID:$id,LEVEL:$level,MSG:$msg\n";
        }
    }

    close($in);
    close($out);
}

1; # Modules must return true
