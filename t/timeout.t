#!/usr/bin/perl

use strict;
use warnings;

use Data::Dumper;

use LWP::Simple::REST qw/http_get/;
use Test::More;
use Test::Exception;

use_ok "HTTP::Server::Simple::Test";

my $server = HTTP::Server::Simple::Test->new(3024)->background();

sleep 5;

my $string = http_get( "http://localhost:3024", { argument1 => "one" } );

sleep 6;

my $alive = kill 0 , $server;

ok( $alive, "Server still alive");

# default lifespan of the server without request is 10 seconds
sleep 10;

my $dead = kill 0 , $server;

ok ( !$dead, "Server killed itself");

done_testing();
