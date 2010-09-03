use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
	module_name         => 'Thread::Const',
	license             => 'perl',
	dist_author         => 'Leon Timmermans <leont@cpan.org>',
	dist_version_from   => 'lib/Thread/Const.pm',
	build_requires => {
		'Test::More' => 0,
	},
	requires       => {
		perl            => 5.008,
		'File::Map'     => 0,
		'Sub::Exporter' => 0,
	},
	add_to_cleanup      => [ 'Thread-Const-*' ],
	create_makefile_pl  => 'traditional',
	meta_merge          => {
		resources      => {
			bugtracker => 'http://rt.cpan.org/NoAuth/Bugs.html?Dist=Thread-Const',
			repository => 'http://github.com/Leont/thread-const/tree',
		},
		keywords       => [ 'mmap', 'threads', 'sharing', 'read-only', 'readonly' ],
	},
	sign                => 1,
);

$builder->create_build_script();
