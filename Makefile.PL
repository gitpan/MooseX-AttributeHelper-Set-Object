# Load the Module::Install bundled in ./inc/
use inc::Module::Install;

# Define metadata
name           'MooseX-AttributeHelper-Set-Object';
all_from       'lib/MooseX/AttributeHelper/Set/Object.pm';

requires       'Moose';
requires       'MooseX::AttributeHelpers';

requires       'Set::Object';

build_requires 'Test::More';
build_requires 'Test::Deep';

WriteAll;

