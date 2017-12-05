my $file = 'data.txt';
open my $fh, '<', $file or die;
$/ = undef;
my $data = <$fh>;
close $fh;

use HTML::Restrict;

my $hr = HTML::Restrict->new();
my $processed = $hr->process('<b>i am bold</b>');
