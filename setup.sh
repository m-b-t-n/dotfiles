#!/bin/bash

function show_usage() {
	echo "Usage: $(basename $0) [-dh]"
	exit 1
}

function check_os() {
	local environment
	local host_os="$1"

	if echo "${host_os}" | grep -i ^mingw.* >/dev/null; then
		environment="windows"
	elif [[ "${host_os}" == "Linux" ]]; then
		environment="linux"
	elif [ "${host_os}" == "Darwin" ]; then
		environment="mac"
	else
		environment="unknown"
	fi

	echo "${environment}"
}

while getopts d:h OPT; do
	case ${OPT} in
	d)
		DEBUG_MODE="true"
		DEBUG_HOST_OS="${OPTARG}"
		;;
	h)
		show_usage
		;;
	\?)
		show_usage
		;;
	esac
done
shift $((OPTIND - 1))

echo "### Setup dotfiles ###"

echo -n "### Check OS... "
if [[ "${DEBUG_MODE}" == "true" ]]; then
	ENVIRONMENT="$(check_os ${DEBUG_HOST_OS})"
else
	ENVIRONMENT="$(check_os $(uname))"
fi
echo "${ENVIRONMENT} ###"

DOTFILES=(\
	".vimrc" \
	".bash_profile" \
	".bashrc" \
	".tigrc" \
	".gvimrc" \
	".gitconfig" \
)

if [[ ${ENVIRONMENT} == "linux" ]] || [[ ${ENVIRONMENT} == "mac" ]]; then
	DOTFILES+=( ".tmux.conf" )
elif [[ ${ENVIRONMENT} == "windows" ]]; then
	echo "" > /dev/null; # Do nothing
else
	echo -e "Unexpected OS. \nabort"
	exit 1
fi

echo "### Make symlinks..."
for ((i=0; i<${#DOTFILES[@]}; ++i)); {
	if [[ "${DEBUG_MODE}" == true ]]; then
		echo -e "\tln -sfv dotfiles/common/${DOTFILES[${i}]#.} ~/${DOTFILES[${i}]}"
	else
		ln -sfv dotfiles/common/${DOTFILES[${i}]#.} ~/${DOTFILES[${i}]}
	fi
}

echo "### Done. ###"
exit 0

