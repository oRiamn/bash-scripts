# executes a list of commands and displays the status of each of them 
# Usage: 
# listOfTests=(
#     'list files' 'ls -a'
#     'exit with error' '$(exit 1)'
#     'exit without error' '$(exit 0)'
# );
# checklist "${listOfTests[@]}"
# nbfails=$?
# if [ "$nbfails" -gt 0 ]; then
#     echo "fail of $nbfails test(s)"
# fi
function checklist() {
    import messages

    local commands=("$@")
    local s=0 # nb succes
    local t=0 # nb test

    function silentrun() {
        local command="$1"
        shift
        eval "${command}" >/dev/null 2>&1
    }

    local arraylength=${#commands[@]}
    local i
    for ((i=0; i<${arraylength}; i+=2));
    do
        local command=${commands[$i+1]}
        local label=${commands[$i]}
        silentrun "$command" 2>&1 && ((s=s+1)) && success "success ${label}" || fail "fail ${label}" && ((t=t+1))
    done

    unset -f silentrun

    return $(($t-$s))
}