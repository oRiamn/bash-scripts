#!/bin/bash

SCRIPT_DIR="$( cd -- "$(dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )";

for file in $SCRIPT_DIR/bash.d/*.sh
do
    source $file
done