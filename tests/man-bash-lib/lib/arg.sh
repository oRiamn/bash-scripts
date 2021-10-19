# @arg $1 first argument of one argument function
function one-arg() {
    echo "$1"
}

# @arg $1 first argument of two arguments function
# @arg $2 second argument of two arguments function
function two-arg() {
    echo "$1 $2"
}

# documented method without @arg documentation
function detected-one-arg() {
    local message=$1
    echo "$message"
}

# documented method without @arg documentation
function detected-two-args() {
    local firstmessage=$1
    local secondmessage=$2
    echo "$firstmessage $secondmessage"
}