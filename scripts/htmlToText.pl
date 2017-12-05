#!/usr/bin/env perl

my $file = $ARGV[0];
open my $fh, '<', $file or die;
$/ = undef;
my $data = <$fh>;
close $fh;

use HTML::Restrict;

my $hr = HTML::Restrict->new();
my $processed = $hr->process($data);

print $processed;
