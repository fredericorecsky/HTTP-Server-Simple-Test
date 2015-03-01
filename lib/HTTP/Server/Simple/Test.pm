package HTTP::Server::Simple::Test;

use base qw/HTTP::Server::Simple::CGI/;

use strict;
use warnings;

# SIG ALRM

my $answer;

sub answer{
    $_[0]->{ answer } = $_[1];
}

sub handle_request{
    my ( $self, $cgi ) = @_;

    # RESET ALRM TIME

    print "HTTP/1.0 200 OK\r\n";
    print $cgi->header, $self->{ answer } || "";
}


sub setup { }

1;

=head1 NAME

HTTP::Server::Simple::Test - A simple webserver to help test HTTP clients

=head VERSION

Version 0.001

=head1 SYNOPSIS

This module is a HTTP server designed to help developers of HTTP clients
write tests for their applications. It is on namespace Simple because it
is only to be a stub that gives an http answer that satisfy the client.
The default port is 8080.

This is an example, to send the information to http client.

    use HTTP::Server::Simple::Test;

    my $server = HTTP::Server::Simple::Test->new();
    $server->answer( "Hello World" );
    $server->background();

    $any_http_client->post( "http://localhost:8080" );

    ok( $any_http_client->response, "Hello World", "Basic test");

=head1 SUBROUTINES/METHODS

The HTTP::Server::Simple::Test is a simple wrapper around the
HTTP::Server::Simple, and the available methods are class methods to
help the basic setup of test server.

Actually the first version of this module only sends information so
the only method available is the answer. As new versions cames the
plan is also set a method to receive the parameters and check it
before the answer.

=head2 answer

Set the answer that the server will deliver to the client.

=head1 AUTHOR

RECSKY, C<< <recsky at cpan.org> >>

=head1 SUPPORT

Usually the author of the module is on irc at irc.perl.org on

    #sao-paulo.pm

=head1 LICENSE AND COPYRIGHT

This program is free software; you can redistribute it and/or modify it
under the terms of the the Artistic License (2.0). You may obtain a
copy of the full license at:

L<http://www.perlfoundation.org/artistic_license_2_0>

=cut

1; #End of HTTP::Server::Simple::Test
