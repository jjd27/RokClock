#!/usr/bin/perl
#
# Sum cumulative time per project.
#

use Time::Piece;

my %p;
my $total = 0;

while (<>) {
	chop;
	my ($from, $to, $proj) = split /,/;

	# e.g. 07/12/2020 09:25:54
	my $t_from = Time::Piece->strptime($from, '%d/%m/%Y %H:%M:%S');
	my $t_to   = Time::Piece->strptime($to,   '%d/%m/%Y %H:%M:%S');

	my $diff = $t_to - $t_from;
	$p{$proj} += $diff;

	$total += $diff;
}

foreach (keys %p) {
	my $perc = sprintf("%.1f%%", $p{$_} * 100 / $total);
	print "$_	$p{$_}	$perc\n";
}
