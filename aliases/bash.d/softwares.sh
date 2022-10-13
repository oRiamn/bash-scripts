#!/bin/bash

if hash codium 2>/dev/null; then
  alias code=codium
fi

if hash podman 2>/dev/null; then
  alias docker=podman
  if hash docker-compose 2>/dev/null; then
    export DOCKER_HOST=unix:///run/user/$UID/podman/podman.sock
  fi
fi

if hash yarn 2>/dev/null; then 
  export PATH="$PATH:`yarn global bin`"
fi