# Logs/main.pl

#!/usr/bin/perl

use v5.40;
use lib 'lib';
use LogGenerator;
use LogCleaner;
use Time::HiRes qw(gettimeofday tv_interval);

# Configuration
my $raw_log    = "logs/legacy_system.log";
my $clean_log  = "logs/sanitized_data.csv";
my $row_count  = 10; # 500_000; # Stress test with half a million lines

say "--- Starting Perl Pipeline ---";

# Step 1: Generate Data
say "Generating $row_count lines of messy logs...";
LogGenerator::create_legacy_log($raw_log, $row_count);

# Step 2: Clean and Measure
say "Sanitizing data...";
my $start_time = [gettimeofday];

LogCleaner::sanitize($raw_log, $clean_log);

my $elapsed = tv_interval($start_time);

# Final Report
say "--- Pipeline Complete ---";
printf("Lines Processed : %d\n", $row_count);
printf("Execution Time  : %.4f seconds\n", $elapsed);
printf("Average Speed   : %.0f lines/sec\n", $row_count / $elapsed);
say "Clean file saved at: $clean_log";
