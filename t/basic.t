#!/usr/bin/perl

use strict;
use warnings;

use Data::Dumper;

use LWP::Simple::REST qw/http_get/;
use Test::More;
use Test::Exception;

use_ok "HTTP::Server::Simple::Test";

my $expected_answer = "Hello World";

HTTP::Server::Simple::Test->answer( $expected_answer );
my $server = HTTP::Server::Simple::Test->new(3024)->background();

my $string = http_get( "http://localhost:3024", { argument1 => "one" } );

print Dumper $string;

ok( $expected_answer eq $string, "Answer should be a string" );

done_testing();

my $cnt = kill 9, $server;

