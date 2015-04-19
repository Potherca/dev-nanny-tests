#!/usr/bin/env bash

function seperator() {
    printf '-%.0s' {1..80}
}

function ruler() {
    printf '=%.0s' {1..80}
}

function topic() {
    echo
    echo "=====> $*"
}

function status() {
    echo "-----> $*"
}

function debug() {
    echo "[DEBUG] $*" >&1
}

function notice() {
    echo
    echo "NOTICE: $*" | indent
    echo
}

function indent() {
    c='s/^/       /'
    case $(uname) in
        Darwin) sed -l "$c";;
        *)      sed -u "$c";;
    esac
}

function sourceIfExists() {
    sSourceFile="$1"
    if [ -f "$sSourceFile" ]; then
        source "${sSourceFile}"
    fi
}

#EOF
