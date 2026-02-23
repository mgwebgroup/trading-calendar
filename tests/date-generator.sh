#!/bin/sh

# General prerequisites
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SUT="$SCRIPT_DIR/../bin/date-generator"
testCounter=1
failed_tests=0
SUITE="date-generator"

if [[ ! -f $SUT ]]; then
	echo Cannot find Script Under Test. Looked in:
    echo "$SUT"
	exit 1
fi

source "${SCRIPT_DIR}/testFunctions.sh"
source "${SCRIPT_DIR}/helpFunctions.sh"


printf -v NAME "Trading days 2026 - output 1 T" 
printf "Test %0.3d \"%s\" " $testCounter "$NAME"

EXPECTED=2026-01-23
ACTUAL="$("$SUT" 2026-01-23 2026-01-25)"

isSameString "$EXPECTED" "$ACTUAL" && pass || fail


(( testCounter++ ))

printf -v NAME "Trading days 2026 - weekend in middle - output 2 T"
printf "Test %0.3d \"%s\" " $testCounter "$NAME"

printf -v EXPECTED "2026-01-23\n2026-01-26" # using printf -v ... turns \n into 012 
ACTUAL="$("$SUT" 2026-01-23 2026-01-26)"

isSameString "$EXPECTED" "$ACTUAL" && pass || fail

