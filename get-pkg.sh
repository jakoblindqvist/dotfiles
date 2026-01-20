#!/usr/bin/env bash

BASE=TRUE
PYTHON=TRUE
CPP=TRUE

declare -A packages
packages=(
    ["BASE"]="git vim-gnome byobu"
    ["PYTHON"]="python pylint"
    ["CPP"]="make clang-format"
)

to_install=""

for package in "${!packages[@]}"; do
    if [ ${!package} == TRUE ]; then
        to_install="$to_install ${packages[$package]}"
    fi
done

apt update && apt install --assume-yes $to_install
