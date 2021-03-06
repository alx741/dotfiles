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


function get_autotools_files
{
    makefiles=$(cat configure.ac | grep AC_CONFIG_FILES \
        | sed 's/.*\[\(.*\)\].*/\1/' | sed 's/ /.am /g;s/$/.am/g')

    echo "configure.ac $makefiles "
}


builder_files=""

if [[ -f "configure.ac" ]];
then
    builder_files+="$(get_autotools_files)"
fi

if [[ -f "Makefile" ]] && [[ ! -f "Makefile.am" ]];
then
    builder_files+="Makefile "
fi

if [[ -f "composer.json" ]];
then
    builder_files+="composer.json "
fi

if [[ -f "build.gradle" ]];
then
    builder_files+="build.gradle "
fi

if [[ -f "pom.xml" ]];
then
    builder_files+="pom.xml "
fi

if [[ -f "build.xml" ]];
then
    builder_files+="build.xml "
fi

if [[ -f "gulpfile.js" ]];
then
    builder_files+="gulpfile.js "
fi

if [[ -f "package.json" ]];
then
    builder_files+="package.json "
fi

if [[ -f "Gruntfile.js" ]];
then
    builder_files+="Gruntfile.js "
fi

if [[ -f "bower.json" ]];
then
    builder_files+="bower.json "
fi

if [[ -f "Rakefile" ]];
then
    builder_files+="Rakefile "
fi

if [[ -f "CMakeLists*" ]];
then
    builder_files+="CMakeLists "
fi

if [[ -f "Cargo.toml" ]];
then
    builder_files+="Cargo.toml"
fi

if [[ -f "stack.yaml" ]];
then
    builder_files+="stack.yaml "
fi

if [[ -f "package.yaml" ]];
then
    builder_files+="package.yaml "
fi

if [[ -f "Shakefile.hs" ]];
then
    builder_files+="Shakefile.hs"
fi

if [[ -f "Vagrantfile" ]];
then
    builder_files+="Vagrantfile"
fi

if [[ -f "Dockerfile" ]];
then
    builder_files+="Dockerfile"
fi

if [[ -f "cabal.project" ]];
then
    builder_files+="cabal.project"
fi

if [[ -f "cabal.project.local" ]];
then
    builder_files+="cabal.project.local"
fi

if [[ $(command ls *.cabal 2> /dev/null) != "" ]];
then
    builder_files+=" *.cabal"
fi



if [[ "$builder_files" == "" ]];
then
    die
else
    $EDITOR $builder_files
fi
