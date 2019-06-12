#!/bin/bash

BASE=TRUE
PYTHON=FALSE
CPP=FALSE

declare -A packages
packages=(
    ["BASE"]="git vim byobu"
    ["PYTHON"]="python pylint"
    ["CPP"]="make clang-format"
)

to_install=""

for package in "${!packages[@]}"; do
    if [ ${!package} == TRUE ]; then
        to_install="$to_install ${packages[$package]}"
    fi
done

apt install --assume-yes $to_install
