#!/usr/bin/perl

# https://github.com/briandfoy/perl-version/issues/7

use strict;
use warnings;
use Perl::Version;
use Test::More;

my $class = 'Perl::Version';

subtest sanity => sub {
	use_ok $class;
	};

subtest "roundtrip" => sub {
	my $v1 = '5.011';
	my $v2 = '5.11';

	foreach my $v ( $v1, $v2 ) {
		my $perl_version = Perl::Version->new( $v );
		isa_ok $perl_version, $class;
		is "$perl_version", $v, "version $v round trips";
		}

	cmp_ok( Perl::Version->new($v1), '==', Perl::Version->new($v2) );
	};

done_testing;
