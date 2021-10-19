#!/bin/bash

# @brief A library that solves some common problems.
# My super function description
# Not thread-safe.
#
# @example: echo "test: $(say-hello World)"
#
# @arg $1 string A value to print
#
# @exitcode 0 If successful.
# @exitcode 1 If an empty string passed.
# @stdout "Hello $1"
function say-hello() {
    if [[ ! "$1" ]]; then
        return 1;
    fi

    echo "Hello $1"
}


function undeocumented() {
    echo "I'm not documented"
}


# Validate a call method
#
# @exitcode 0 If successful.
# @exitcode 1 If an empty string passed.
function validate() {

    local myvar=$1

    if [[ ! "$1" ]]; then
        return 1;
    fi

    return 0
}


# Did nothing because it's an example
#
# Usage :
# nothing "one" "two" "three"
function nothing() {
    local first=$1
    local second=$2
    local third=$3   
}