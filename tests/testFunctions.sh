# Compares strings EXPECTED to ACTUAL
# isSameString $EXPECTED $ACTUAL
# Returns 0 on success 1 on failure.
isSameString () {
    [[ "$1" == "$2" ]] && return 0 || return 1
}

