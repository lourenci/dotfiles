#!/usr/bin/env bash

LAST_ARG=""
OTHER_ARGS=""

if [[ $@ ]]; then
        LAST_ARG=${!#}
        OTHER_ARGS="${@:1:$(($#-1))}"
fi

DIR="$(dirname "$LAST_ARG")"
FILE="$(basename "$LAST_ARG")"

docker run --rm -it --user $(id -u):$(id -g) -v $DIR:/workdir -w /workdir lourenci/neovim:latest $OTHER_ARGS $FILE
