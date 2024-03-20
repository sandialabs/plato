#!/bin/bash

export ASAN_OPTIONS=abort_on_error=0:fast_unwind_on_malloc=1:detect_odr_violation=1 
BLACKLIST_FILE_PATH="${1}"
export LSAN_OPTIONS=suppressions="${BLACKLIST_FILE_PATH}"
export UBSAN_OPTIONS=print_stacktrace=1

