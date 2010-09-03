package Thread::Const;

use 5.008;
use strict;
use warnings;

our $VERSION = 0.002;

use bytes;
use File::Map qw/map_anonymous/;
use Sub::Exporter -setup => { exports => [qw/const/], groups => { default => [qw/const/] } };

## no critic (Subroutines::RequireArgUnpacking)
sub const {
	map_anonymous $_[0], length $_[1];
	substr $_[0], 0, length $_[1], $_[1];
	utf8::decode($_[0]) if utf8::is_utf8($_[1]);
	Internals::SvREADONLY($_[0], 1);
	return;
}

1;    # End of Thread::Const

__END__

=head1 NAME

Thread::Const - Constant strings efficiently shared between threads

=head1 VERSION

Version 0.002

=head1 SYNOPSIS

 use Thread::Const;
 
 const my $bar => 'some other very large string';

=head1 DESCRIPTION

This module generates constant strings that will be shared among threads. This may reduce memory usage because the variable won't be copied.

=head1 FUNCTIONS

This module defined one function, which it exports by default.

=head2 const($string, $value)

Make $string a constant that will be shared between threads. $value will be assigned to $string.

=head1 AUTHOR

Leon Timmermans, C<< <leont at cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-thread-const at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Thread-Const>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.

=head1 SEE ALSO

L<Const::Fast>, A more generalized const facility. Unless your strings are big you probably want to use that.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Thread::Const

You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Thread-Const>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Thread-Const>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Thread-Const>

=item * Search CPAN

L<http://search.cpan.org/dist/Thread-Const>

=back

=head1 COPYRIGHT & LICENSE

Copyright 2010 Leon Timmermans, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut
