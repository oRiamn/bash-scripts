

function message() {
    local msg=$1
    echo
    echo "$msg"
    echo
}

function success() {
    local msg=$1
    local g=`tput setaf 2`
    local reset=`tput sgr0`
    echo "${g}✓${reset} $msg"
}

function fail() {
    local msg=$1
    local r=`tput setaf 1`
    local reset=`tput sgr0`
    echo "${r}✗${reset} $msg"
}