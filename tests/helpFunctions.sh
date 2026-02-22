# Prints byte values of all relevant vars
# Expects $INPUT, $ACTUAL, $EXPECTED ${failed_tests}
fail () {
    echo Failed
    echo 'INPUT:'
    printf "$INPUT" | od -Ad -N100 -w16 -to1z
    echo ACTUAL:
    printf "$ACTUAL" | od -Ad -N100 -w16 -to1z
    echo EXPECTED:
    printf "$EXPECTED" | od -Ad -N100 -w16 -to1z

    (( failed_tests++ ))

    return 1
}

pass () {
    echo Pass
}
