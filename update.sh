#!/bin/bash

source ./lib/import.sh

import input-choice
import messages


function postponeUpdate() {
    message "No problem!"
}

function doUpdate() {
    message "ok let's go"
}

function showChangelog(){
    message "Ok get menu"
    git log master...origin/master --color=always --date=short -10 --pretty=" - %C(auto,green)%ad%C(auto,reset) %s" | less -F
    askForUpdate
}

function askForUpdate() {
    options=(
        "Yeah! Update please!"
        "No... i don't need update"
        "Can i see the changelog?"
    );
    message "New version of bash-script is avaible!"
    input-choice "Do you want an update?" 0 "${options[@]}";
    choice=$?;

    case $choice in

    0)
        doUpdate
        ;;

    1)
        postponeUpdate
        ;;

    2)
        showChangelog
        ;;
    esac
}

git remote update  >/dev/null 2>&1

UPSTREAM=${1:-'@{u}'}
LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse "$UPSTREAM")
BASE=$(git merge-base @ "$UPSTREAM")

if [ $LOCAL = $REMOTE ]; then
    # message "Up-to-date"
elif [ $LOCAL = $BASE ]; then
    # echo "Need to pull"
    askForUpdate
elif [ $REMOTE = $BASE ]; then
    # message "Need to push"
else
    # message "Diverged"
fi
