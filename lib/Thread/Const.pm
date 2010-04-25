package Thread::Const;

use 5.008;
use strict;
use warnings;

our $VERSION = 0.002;

use bytes;
use File::Map qw/map_anonymous/;
use Data::Swap qw/swap/;
use Readonly;
use Exporter 5.57 qw/import/;

our @EXPORT = qw/const/;

## no critic (Subroutines::RequireArgUnpacking)
sub _get_value {
	if (@_ > 1) {
		return $_[1];
	}
	else {
		my $tmp;
		swap(\$_[0], \$tmp);
		return $tmp;
	}
}

sub const {
	for my $value (_get_value(@_)) {
		map_anonymous $_[0], length $value;
		substr $_[0], 0, length $value, $value;
		utf8::decode($_[0]) if utf8::is_utf8($value);
		Readonly $_[0];
	}
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

    const(my $foo = 'some very large string');
    const my $bar, 'some other very large string';

=head1 DESCRIPTION

This module generates constant values that can be shared among threads. This may reduce memory usage because the variable won't be copied.

=head1 FUNCTIONS

This module defined one function, which it exports by default.

=head2 const($string [, $value ])

Make $string a constant that will be shared between threads. If $value is defined it will be assigned to $string.

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
