#!/usr/bin/perl
#
# Show working time per week.
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

	# We assume $t_from is in the same week as $t_to.
	my $week = $t_to->year . "-" . sprintf("%02d", $t_to->week);

	my $diff = $t_to - $t_from;
	$p{$week} += $diff;
}

foreach (sort keys %p) {
	my $hours = sprintf("%.1f", $p{$_} / 3600);
	print "Week $_	$hours\n";
}
