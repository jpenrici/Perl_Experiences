# Logs/lib/LogGenerator.pm

package LogGenerator;

use v5.40;
use utf8;

# Generates a dummy legacy log file with "noisy" data
sub create_legacy_log ($filename, $lines = 100_000) {
    open(my $fh, '>', $filename) or die "Could not open file: $!";

    for (1..$lines) {
        # Simulating inconsistent timestamps and legacy formats
        my $timestamp = "[LEGACY_ID_" . int(rand(999)) . " @ " . localtime() . "]";
        my $status = (rand() > 0.8) ? " ERROR " : " INFO ";
        my $message = "User_Action_" . int(rand(50)) . " performed with raw_hex: 0x" . sprintf("%x", rand(1000));

        # Adding some "noise" like trailing spaces and weird separators
        print $fh "$timestamp |$status| $message   \n";
    }
    close($fh);
}

1; # Modules must return true
