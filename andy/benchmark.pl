#!/usr/bin/perl

use strict;
use warnings;
use Benchmark qw(:all);

use lib qw(lib);
use version;
use Perl::Version;

my @VERSIONS = (
    '0',              '0.000',       '0.000001',     '0.0.4',
    '0.000004',       'v0.0.4',      '0.0.8',        '0.000008',
    'v0.0.8',         '0.01',        '0.1',          '0.58',
    '0.700',          '1',           '1',            '1.0',
    '1.0.0',          '1.0.0.0',     '1.000',        '1.000000',
    '1.000000000',    'v1',          'v1.0.0',       '1.0004',
    '1.1',            '1.001_002',   '1.001002',     '1.1.999',
    '1.02',           '1.2',         '1.2',          '1.2.0',
    'v1.2',           'v1.2.0',      '1.2_1',        'v1.2_1',
    '1.2_3',          '1.002001',    '1.002003',     '1.2.3',
    '1.2.3',          '1.2.3.0',     '1.2.3_0',      'v1.2.3',
    'v1.2.3',         '1.2.3_01',    '1.2.3_1',      '1.2.3_1',
    'v1.2.3_1',       '1.2.3_002',   '1.2.3_4',      '1.2.3_4',
    'v1.2.3_4',       'v1.2.3_4',    '1.2.3.1',      '1.2.3.4',
    '1.2.3.4',        'v1.2.3.4',    '1.2.3.4_1',    'v1.2.3.4_1',
    '1.2.04',         '1.2.4',       '1.2.005',      '1.002030',
    'v1.02.34_00056', '1.003',       'v001.3',       '1.7',
    '1.23',           'v1.23',       'v1.23.0',      '1.23_01',
    '1.23_0100',      'v1.23.45.00', '1.24',         '1.230',
    '1.700',          '2',           '2',            '3',
    '3',              '4',           '4',            '5',
    '5.005',          '5.005_02',    'v5.005_02',    '5.005_03',
    '5.005_030',      '5.005030',    '5.5.30',       '5.006_002',
    '5.006.001',      '5.006001',    'v5.6.1',       'v5.6.1',
    '5.6.2',          '5.008',       '5.8.0',        '5.008_001',
    '5.8.1',          '06',          '6',            '7',
    '8',              '23',          '44',           '99',
    '99',             '99.0',        '99.000',       'v99.0.0',
    'v99.0.0',        '100',         '2002.09.30.1', '2002.9.30.1',
    '19017',          '19517',       '885915'
);

my @class = qw( version Perl::Version );

my $test = {};

for my $cl ( @class ) {
    $test->{$cl} = sub {
        for my $v ( @VERSIONS ) {
            my $vv = $cl->new( $v );
        }
    };
}

local $SIG{__WARN__} = sub { };
cmpthese(1000, $test);
