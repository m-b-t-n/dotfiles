#!/bin/bash

source ~/dotfiles/env/environment_vars

if [[ "${DOTFILES_ENV_OS}" == "windows" ]]; then
	RANGER_EXEC_CMD="ranger.py"

elif [[ "${DOTFILES_ENV_OS}" = "linux" ]] || [[ "${DOTFILES_ENV_OS}" = "macos" ]]; then
	RANGER_EXEC_CMD="ranger"
else
	RANGER_EXEC_CMD=""
fi

function _ranger() {
	if [[ -z "${RANGER_LEVEL}" ]]; then
		${RANGER_EXEC_CMD}
	else
		exit
	fi
}

