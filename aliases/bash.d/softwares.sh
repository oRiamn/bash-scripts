#!/bin/bash

if hash codium 2>/dev/null; then
  alias code=codium
fi

if hash podman 2>/dev/null; then
  alias docker=podman
  if hash docker-compose 2>/dev/null; then
    export DOCKER_HOST=unix:///run/user/$UID/podman/podman.sock
  elif hash podman-compose 2>/dev/null; then
    alias docker-compose=podman-compose
  fi
fi

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

if hash yarn 2>/dev/null; then 
  export PATH="$PATH:`yarn global bin`"
fi
