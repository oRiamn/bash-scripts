# Deal with plurialisation of sentence
#
# Usage :
# echo "fail of " $(plural $nbfails "# test"  "# tests")
function plural() {
    local count=$1
    local singular=$2
    local plural=$3
    if [ "$nbfails" -gt 1 ]; then
        echo ${plural//#/$count}
    else
        echo ${singular//#/$count}
    fi
}

# Print a message
# Usage :
# message "my message"
function message() {
    local msg=$1
    echo
    echo "$msg"
    echo
}

# Print a success message
# Usage :
# success "my success message"
function success() {
    local msg=$1
    local g=$(tput setaf 2)
    local reset=$(tput sgr0)
    echo "${g}✓${reset} $msg"
}

# Print a fail message
# Usage :
# fail "my fail message"
function fail() {
    local msg=$1
    local r=$(tput setaf 1)
    local reset=$(tput sgr0)
    echo "${r}✗${reset} $msg"
}
