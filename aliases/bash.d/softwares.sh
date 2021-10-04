#!/bin/bash

if hash codium 2>/dev/null; then
  alias code=codium
fi

if hash yarn 2>/dev/null; then 
  export PATH="$PATH:`yarn global bin`"
fi

