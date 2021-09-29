#!/bin/bash

readonly UNAME="$(uname)"

if echo "${UNAME}" | grep -i ^mingw.* >/dev/null; then
	RANGER_EXEC_CMD="ranger.py"

elif [[ "${UNAME}" = "Linux" ]] || [[ "${UNAME}" = "Darwin" ]]; then
	RANGER_EXEC_CMD="ranger"
else
	RANGER_EXEC_CMD="ranger"
fi

function _ranger() {
	if [[ -z "${RANGER_LEVEL}" ]]; then
		${RANGER_EXEC_CMD}
	else
		exit
	fi
}

