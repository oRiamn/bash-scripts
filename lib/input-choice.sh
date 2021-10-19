# Provide input choice method
# Usage: 
# options=("one" "two" "three");
# input-choice "Choose:" 1 "${options[@]}";
# choice=$?; echo "${options[$choice]}"
function input-choice() {
    local question=$1

    echo "${quesiton}"
    shift
    echo $(tput dim)-"Change option: [up/down], Select: [ENTER]" $(tput sgr0)
    local selected="${1}"
    shift

    ESC=$(echo -e "\033")
    cursor_blink_on() { tput cnorm; }
    cursor_blink_off() { tput civis; }
    cursor_to() { tput cup $(($1 - 1)); }
    print_option() { echo $(tput sgr0) "$1" $(tput sgr0); }
    print_selected() { echo $(tput rev) "$1" $(tput sgr0); }
    get_cursor_row() {
        IFS=';' read -sdR -p $'\E[6n' ROW COL
        echo ${ROW#*[}
    }
    key_input() {
        read -s -n3 key 2>/dev/null >&2
        [[ $key = $ESC[A ]] && echo up
        [[ $key = $ESC[B ]] && echo down
        [[ $key = "" ]] && echo enter
    }

    for opt; do echo; done

    local lastrow=$(get_cursor_row)
    local startrow=$(($lastrow - $#))
    trap "cursor_blink_on; echo; echo; exit" 2
    cursor_blink_off

    : selected:=0

    while true; do
        local idx=0
        for opt; do
            cursor_to $(($startrow + $idx))
            if [ ${idx} -eq ${selected} ]; then
                print_selected "${opt}"
            else
                print_option "${opt}"
            fi
            ((idx++))
        done

        case $(key_input) in
        enter) break ;;
        up)
            ((selected--))
            [ "${selected}" -lt 0 ] && selected=$(($# - 1))
            ;;
        down)
            ((selected++))
            [ "${selected}" -ge $# ] && selected=0
            ;;
        esac
    done

    cursor_to "${lastrow}"
    cursor_blink_on
    echo

    return "${selected}"
}
