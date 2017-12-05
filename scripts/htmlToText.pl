use HTML::Restrict;

my $hr = HTML::Restrict->new();
my $processed = $hr->process('<b>i am bold</b>');
