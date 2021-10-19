#!/bin/bash

source $BASHSCRIPTLIBDIR/import.sh
import checklist

(
    cd $BASHSCRIPTDIR/tests/man-bash-lib

    declare -a tests=()

    for f in ./lib/*.sh; do
        filename=$(basename -- "$f")        
        tests+=("$filename")
        tests+=("./sha1test.sh ${filename%.*}")
    done

    checklist "${tests[@]}"
)
