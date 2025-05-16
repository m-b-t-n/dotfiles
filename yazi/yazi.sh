#!/usr/bin/env bash

source ~/dotfiles/env/environment_vars

if [[ ${DOTFILES_ENV_CONFIG_YAZI_ENABLE} == 'y' ]]; then
	YAZI_EXEC_CMD="yazi"
fi

function _yazi() {
	if [[ -z "${YAZI_LEVEL}" ]]; then
		${YAZI_EXEC_CMD}
	else
		exit
	fi
}

