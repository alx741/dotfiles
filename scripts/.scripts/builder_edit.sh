#! /bin/sh

# Edit the configuration files of the build automation tool in the current
# directory


function die
{
    echo
    echo "[!] No build automation tool found in the current directory"
    echo
    exit 1
}


function edit_autotools
{
    makefiles=$(cat configure.ac | grep AC_CONFIG_FILES \
        | sed 's/.*\[\(.*\)\].*/\1/' | sed 's/ /.am /g;s/$/.am/g')

    $EDITOR configure.ac $makefiles
}



if [[ -f "configure.ac" ]];
then
    edit_autotools

elif [[ -f "Makefile" ]] && [[ ! -f "Makefile.am" ]];
then
    $EDITOR Makefile

elif [[ -f "composer.json" ]];
then
    $EDITOR composer.json

elif [[ -f "build.gradle" ]];
then
    $EDITOR build.gradle

elif [[ -f "pom.xml" ]];
then
    $EDITOR pom.xml

elif [[ -f "build.xml" ]];
then
    $EDITOR build.xml

elif [[ -f "gulpfile.js" ]];
then
    $EDITOR gulpfile.js

elif [[ -f "Gruntfile.js" ]];
then
    $EDITOR Gruntfile.js

elif [[ -f "Rakefile" ]];
then
    $EDITOR Rakefile

elif [[ -f "CMakeLists*" ]];
then
    $EDITOR CMakeLists

else
    die
fi
