#!/bin/bash

# refereces:
# https://semver.org
# https://www.linuxjournal.com/content/bash-regular-expressions
# https://gist.github.com/jlinoff/9211310b738e83c4a2bbe14876cd2e55

SEMVER_REGEX='([0-9]+)\.([0-9]+)\.([0-9]+)(-.+)?(\+.*)?'

function parse_semver() {
    local s=$1
    local major;
    local minor;
    local patch;
    local pre_release;
    local build;

    if [[ $s =~ $SEMVER_REGEX ]]; then
        local n=${#BASH_REMATCH[*]}
        major=${BASH_REMATCH[1]}
        minor=${BASH_REMATCH[2]}
        patch=${BASH_REMATCH[3]}
        pre_release=${BASH_REMATCH[4]}
        build=${BASH_REMATCH[5]}
        
        echo "${major} ${minor} ${patch} ${pre_release} ${build}"
    else
        echo "$s do not match semver.";
        # exit
    fi
}

function test() {
    local versions=(
        # valid
        '0.0.1'
        '1.15.0'
        '2.0.3'
        '3.1.5-prerelease+meta'
        '3.1.5-prerelease'
        '3.1.5+meta'
        '3.1.5+meta-valid'
        '1.0.0-alpha'
        '1.0.0-beta'
        '1.0.0-alpha.beta'
        '1.0.0-rc.1+build.1'
        '1.0.0-rc.1+build.345'
        '1.0.5-SNAPSHOT-100'
        # invalid
        '1'
        '1.2'
        '1.2.3-0123'
    )

    printf "%-32s %4d %4d %4d\n" "string" "major" "minor" "patch" "pre-release" "build"
    for version in ${versions[@]} ; do
        a=($(parse_semver "$version"))
        # major=${a[0]}
        # minor=${a[1]}
        # patch=${a[2]}
        printf "%-32s %4d %4d %4d %32s %32s\n" "$version" ${a[0]} ${a[1]} ${a[2]} "${a[3]}" "${a[4]}"
    done
}

test
