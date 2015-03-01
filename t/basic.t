#!/usr/bin/perl

use strict;
use warnings;

use Data::Dumper;

use LWP::Simple::REST qw/http_get/;
use Test::More;
use Test::Exception;

use_ok "HTTP::Server::Simple::Test";

my $expected_answer = "Hello World";

my $server = HTTP::Server::Simple::Test->new();
$server->answer( $expected_answer );
$server->background();

my $string = http_get( "http://localhost:8080", { argument1 => "one" } );

ok( $expected_answer eq $string, "Answer should be a string" );

done_testing();

my $cnt = kill 9, $server;

