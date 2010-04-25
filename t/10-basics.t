#!perl

use threads;
use threads::shared;
use Test::More tests => 4;
use Test::Exception;
use Thread::Const;

sub address_of($) {
	return '0x'. unpack 'h*', pack 'p', $_[0];
}

my $foo = join "", map { chr } (0..255) x 16;

is length $foo, 4096, 'length of $foo is 4096';

my $original_address = address_of $foo;

const $foo;

my $const_address : shared = address_of $foo;

isn::t($const_address, $original_address, 'Address must have changed due to consting');

throws_ok { $foo = 'bar' } qr/Modification of a read-only value attempted/, 'Variable is now const';

threads->create(sub { is(address_of $foo, $const_address, 'Even in another thread the address is the same') })->join();
