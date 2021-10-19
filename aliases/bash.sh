#!/bin/bash

SCRIPT_DIR="$( cd -- "$(dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )";
if ! test -f "$SCRIPT_DIR/bash.sh"; then 
    SCRIPT_DIR="$(dirname "$0")"
fi

for file in $SCRIPT_DIR/bash.d/*.sh
do
    source $file
done

export BASHSCRIPTDIR="$(dirname $SCRIPT_DIR)"
export BASHSCRIPTLIBDIR="$BASHSCRIPTDIR/lib"
export BASHSCRIPTBINDIR="$BASHSCRIPTDIR/bin"

export PATH="$BASHSCRIPTBINDIR:$PATH"