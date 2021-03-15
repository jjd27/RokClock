#!/usr/bin/perl
#
# Sum cumulative time per project.
#

use Time::Piece;

my %p;

while (<>) {
	chop;
	my ($from, $to, $proj) = split /,/;

	# e.g. 07/12/2020 09:25:54
	my $t_from = Time::Piece->strptime($from, '%d/%m/%Y %H:%M:%S');
	my $t_to   = Time::Piece->strptime($to,   '%d/%m/%Y %H:%M:%S');

	my $diff = $t_to - $t_from;
	$p{$proj} += $diff;
}

foreach (keys %p) {
	print "$_	$p{$_}\n";
}
