#!/bin/bash

plantuml -tpng $@

if [[ "$(uname)" = "Linux" ]]; then
	ristretto ${@%%.*}.png
elif [[ "$(uname)" = "Darwin" ]]; then
	open ${@%%.*}.png
fi

