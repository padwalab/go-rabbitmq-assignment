#!/bin/bash

function show_usage() {
    printf "Usage: $0 [Options [parameters]]\n"
    printf "\n"
    printf "Options:\n"
    printf "[-m|--mode mode_value], set mode to given value"
}

function run() {
    docker run $mode --rm --name rabbitmq -p 5672:5672 -p 15672:15672 rabbitmq:3-management
}

while [ ! -z "$1" ]; do
    if [[ $1 == "--help" ]] || [[ $1 == "-h" ]]; then
        show_usage
    elif [[ $1 == "--mode" ]] || [[ $1 == "-m" ]]; then
        if [[ $2 == "background" ]]; then
            echo "Running in background mode"
            mode="-d"
            run
        else
            echo "Running interactive mode"
            mode="-it"
            run
        fi
    fi
    shift
done
