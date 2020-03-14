#!/usr/bin/env perl

use HTML::Restrict;

my $data = do { local $/; <STDIN> };
my $hr = HTML::Restrict->new();
my $processed = $hr->process($data);

print $processed;
