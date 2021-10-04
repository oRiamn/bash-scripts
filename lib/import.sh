function import() {
    local basepath="$( cd -- "$(dirname $(dirname -- "${BASH_SOURCE[0]}" ))" &> /dev/null && pwd )"
    local file="$basepath/lib/${1}.sh"
    if [ -f "${file}" ]; then
        source "${file}"
    else
        echo "Error: Cannot find library at: ${file}"
        exit 1
    fi
}