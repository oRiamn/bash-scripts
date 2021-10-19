# @exitcode 0 If successful.
# @exitcode 1 If an empty string passed.
function test-exitcode-1() {
    if [[ ! "$1" ]]; then
        return 1;
    fi
}

# @exitcode 0 every time
function test-exitcode-2() {
    if [[ ! "$1" ]]; then
        return 0;
    fi
}