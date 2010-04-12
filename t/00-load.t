#!perl -T

use Test::More tests => 1;

BEGIN {
	use_ok( 'Thread::Const' );
}

diag( "Testing Thread::Const $Thread::Const::VERSION, Perl $], $^X" );
