#!/bin/bash

function _ranger() {
	if [[ -z "${RANGER_LEVEL}" ]]; then
		ranger
	else
		exit
	fi
}

