#!/usr/bin/env bash

function _docker() {
	# If NOT existed commands or aliases as like `docker-foo`,
	# pass arguments into `docker` command.
	if [[ "$#" -eq 0 ]] || ! command -v "docker-$1" > /dev/null; then
		command docker "$@"
	elif alias "docker-$1" &>/dev/null; then
		local alias_cmd
		alias_cmd="$(alias "docker-$1" | sed -E "s/^alias docker-[^=]+='(.*)'\$/\1/")"
		args=()
		for arg in "${@:2}"; {
			args+=("$(printf %q "$arg")")
		}
		eval "${alias_cmd} ${args[*]}"
	else
		"docker-$1" "${@:2}"
	fi
}

