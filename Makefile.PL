use inc::Module::Install 0.67;

if( -e 'MANIFEST.SKIP' ) {
    system( 'pod2text lib/Catalyst/Authentication/Store/DBIx/Class.pm > README' );
}

## I'd love to use can_use - but I can't seem to test for success. :-/
eval { require Catalyst::Plugin::Authentication::Store::DBIx::Class or die 'footy'; };

if (!$@) {   #} can_use("Catalyst::Plugin::Authentication::Store::DBIx::Class") ) {
    print STDERR <<EOM;
*******************************************
***  WARNING:  DEPRECATED MODULE FOUND  ***
*******************************************

You have the Catalyst::Plugin::Authentication::Store::DBIx::Class installed.
The module you are installing supercedes it and it's presence has been known
to cause conflicts.   We STRONGLY recommend you remove the old module before
proceeding.  

You have 5 seconds to abort this install to remove the old module.
EOM
    sleep 5;
    print STDERR "Ok. Proceeding anyway...\n\nYou are entering a dimension not only of sight and sound, but of mind...\n\n";
}


name 'Catalyst-Authentication-Store-DBIx-Class';
all_from 'lib/Catalyst/Authentication/Store/DBIx/Class.pm';

perl_version '5.8.1';

requires (  'Catalyst::Runtime'                 => 0,
            'Catalyst::Plugin::Authentication'  => '0.10005',
            'DBIx::Class'                       => 0,
         );


test_requires 'Test::More';

auto_install;
WriteAll;
