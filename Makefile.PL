use inc::Module::Install 0.67;

if( -e 'MANIFEST.SKIP' ) {
    system( 'pod2text lib/Catalyst/Authentication/Store/DBIx/Class.pm > README' );
}

name 'Catalyst-Authentication-Store-DBIx-Class';
all_from 'lib/Catalyst/Authentication/Store/DBIx/Class.pm';

perl_version '5.8.1';

requires 'Catalyst::Runtime';
requires 'Catalyst::Plugin::Authentication';

test_requires 'Test::More';

auto_install;
WriteAll;

