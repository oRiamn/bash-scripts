# Usage :
# test-example "my success message"
function test-usage() {
    echo "$1"
}

# @example :
# test-example "my success message"
function test-example() {
    echo "$1"
}

# Usage :
# test-example2 "message"
# test-example2 "my success 2"
function test-usage2() {
    echo "$1"
}


# @example :
# test-example "my success message"
# test-example "my success message2"
function test-example2() {
    echo "$1"
}