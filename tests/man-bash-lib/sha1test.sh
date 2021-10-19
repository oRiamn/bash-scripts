#!/bin/bash

expected="$BASHSCRIPTDIR/tests/man-bash-lib/docs/$1.md"
received=$(mktemp)
man-bash-lib "$BASHSCRIPTDIR/tests/man-bash-lib/lib/$1.sh" >> "$received"

shasum1=$(sha1sum $expected | awk '{print $1}')
shasum2=$(sha1sum $received | awk '{print $1}')

if [ "$shasum1" = "$shasum2" ]; then
    exit 0
else
    diff -y <(echo "expected($(basename $expected))"; cat "$expected") <(echo "received($received)"; cat "$received")
    exit 1
fi