package Thread::Const;

use 5.008;
use strict;
use warnings;

our $VERSION = 0.001;

use bytes;
use File::Map qw/map_anonymous/;
use Data::Swap;
use Readonly;

sub const {    ## no critic (Subroutines::RequireArgUnpacking)
	my $tmp;
	swap($_[0], $tmp);
	my $utf = utf8::is_utf8($tmp);
	map_anonymous $_[0], length $tmp;
	substr $_[0], 0, length $tmp, $tmp;
	utf8::decode($_[0]) if $utf;
	Readonly $_[0];
	return;
}

1; # End of Thread::Const

__END__

=head1 NAME

Thread::Const - The great new Thread::Const!

=head1 VERSION

Version 0.01

=head1 SYNOPSIS

Quick summary of what the module does.

Perhaps a little code snippet.

    use Thread::Const;

    my $foo = Thread::Const->new();
    ...

=head1 EXPORT

A list of functions that can be exported.  You can delete this section
if you don't export anything, such as for a purely object-oriented module.

=head1 FUNCTIONS

=head2 const

=head1 AUTHOR

Leon Timmermans, C<< <leont at cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-thread-const at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Thread-Const>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.

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
