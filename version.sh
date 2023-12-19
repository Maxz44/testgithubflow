#!/bin/bash

function is_ver_gt() {
    # test v1 > v2
    v1="$1"
    v2="$2"
    if [[ "${v1}" == "${v2}" ]]; then
        return 1
    fi
    printf '%s\n' "$1" "$2"|sort -rVC
}

function get_updated_patch() {
    # Given a ubuntu like ver, update the ver
    curr="$1"
    i=0
    next=$(date +%Y.%m.$i)
    while ! is_ver_gt ${next} ${curr}; do
        i=$(($i+1))
        next=$(date +%Y.%m.$i)
    done

    echo -n $next
}

curr=$(cat version.txt)

get_updated_patch $curr