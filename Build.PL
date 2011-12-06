use strict;
use Module::Build;

my $builder = Module::Build->new(
    module_name => 'Test::Mock::LWP::Conditional',
    dist_name => 'Test-Mock-LWP-Conditional',
    dist_version_from => 'lib/Test/Mock/LWP/Conditional.pm',
    license => 'perl',

    configure_requires => {
        'Module::Build' => '0.38',
    },

    requires => {
        'perl' => 5.008_001,
    },

    build_requires => {
        'Test::More' => '0.98',
        'Test::UseAllModules' => '0',
    },

    test_files => 't/',
    recursive_test_files => 1,

    create_readme => 1,
    create_license => 1,
    create_makefile_pl => 'small',

    no_index => { directory => ['inc'] },
);

$builder->create_build_script;
