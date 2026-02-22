#!/bin/sh

# General prerequisites
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SUT="$SCRIPT_DIR/../bin/date-validator"
testCounter=1
failed_tests=0
SUITE="date-validator"

if [[ ! -f $SUT ]]; then
	echo Cannot find Script Under Test. Looked in:
    echo "$SUT"
	exit 1
fi

source "${SCRIPT_DIR}/testFunctions.sh"
source "${SCRIPT_DIR}/helpFunctions.sh"


printf -v NAME "Trading days 2025 - contiguous" 
printf "Test %0.3d \"%s\" " $testCounter "$NAME"

printf -v INPUT "2025-01-02\n2025-01-03"
"$SUT" <<< "$INPUT" && pass || fail


(( testCounter++ ))

printf -v NAME "Trading days 2025 - contiguous with holiday" 
printf "Test %0.3d \"%s\" " $testCounter "$NAME"

printf -v INPUT "2025-01-01\n2025-01-02"
"$SUT" <<< "$INPUT" 2>/dev/null && fail || pass 


(( testCounter++ ))

printf -v NAME "Trading days 2025 - non-contiguous" 
printf "Test %0.3d \"%s\" " $testCounter "$NAME"

printf -v INPUT "2025-01-06\n2025-01-08"
"$SUT" <<< "$INPUT" 2>/dev/null && fail || pass 



[[ $failed_tests -gt 0 ]] && printf "Failed tests: %d\n" ${failed_tests} && exit 1 

echo Finished suite $SUITE
