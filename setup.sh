#!/bin/bash

#
# Functions;
#

function show_usage() {
	echo "Usage: $(basename $0) [-dh]"
	exit 1
}

function get_os_type() {
	local host_os
	if [[ -z $1 ]]; then
		host_os="$(uname)"
	else
		host_os="$1"
	fi

	local environment
	if echo "${host_os}" | grep -i ^mingw.* >/dev/null; then
		environment="windows"
	elif [[ "${host_os}" == "Linux" ]]; then
		environment="linux"
	elif [[ "${host_os}" == "Darwin" ]]; then
		environment="macos"
	else
		environment="unknown"
	fi

	echo "${environment}"
}

function get_hostname() {
	local platform_os="$1"
	local name

	if [[ "${DEBUG_MODE}" == "true" ]]; then
		if [[ ${platform_os} == "windows" ]]; then
			name="WinPC_00"
		elif [[ ${platform_os} == "macos" ]]; then
			name="Watashi-no-Mac"
		elif [[ ${platform_os} == "linux" ]]; then
			name="Ubuntu-PC"
		else
			name="unknown"
		fi
	else
		if [[ ${platform_os} == "windows" ]]; then
			name="$(hostname)"
		elif [[ ${platform_os} == "macos" ]]; then
			name="$(hostname)"
		elif [[ ${platform_os} == "linux" ]]; then
			name="" # Currently do nothing
		else
			name="unknown"
		fi
	fi

	echo "${name}"
}

function get_platform_env() {
	local arg=$1
	local os=$(get_os_type ${arg})
	local name="$(get_hostname ${os})"

	echo ${os} "${name}"
}

#
# main()
#

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

echo -n "### Check Environment... "
if [[ "${DEBUG_MODE}" == "true" ]]; then
	ENVIRONMENT=( $(get_platform_env ${DEBUG_HOST_OS}) )
else
	ENVIRONMENT=( $(get_platform_env) )
fi
echo "OS=${ENVIRONMENT[0]} HOSTNAME=${ENVIRONMENT[1]} ###"

DOTFILES=(\
	".vimrc" \
	".bash_profile" \
	".bashrc" \
	".gvimrc" \
	".gitconfig" \
)

if [[ ${ENVIRONMENT[0]} == "linux" ]] || [[ ${ENVIRONMENT[0]} == "macos" ]]; then
	DOTFILES+=( ".tmux.conf" )
elif [[ ${ENVIRONMENT[0]} == "windows" ]]; then
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

# tig
if [[ "${DEBUG_MODE}" == "true" ]]; then
	echo -e "\tln -sfv dotfiles/tig/tigrc ~/.tigrc"
else
	ln -sfv dotfiles/tig/tigrc ~/.tigrc
fi

# ranger
if [[ "${DEBUG_MODE}" == "true" ]]; then
	echo -e "\tmkdir -p ~/.config"
	echo -e "\tln -sfv ~/dotfiles/common/ranger/config ~/.config/ranger"
else
	mkdir -p ~/.config
	ln -sfv ~/dotfiles/common/ranger/config ~/.config/ranger
fi

# wezterm
if [[ "${DEBUG_MODE}" == "true" ]]; then
	echo -e "\tmkdir -p ~/.config"
	echo -e "\tln -sfv ~/dotfiles/common/wezterm ~/.config/wezterm"
else
	mkdir -p ~/.config
	ln -sfv ~/dotfiles/common/wezterm ~/.config/wezterm
fi

echo "### Export ENVIRONMENT vars ###"
if [[ "${DEBUG_MODE}" == "true" ]]; then
	echo -e "\techo \"DOTFILES_ENV_OS=${ENVIRONMENT[0]}\" >> ~/dotfiles/env/environment_vars"
	echo -e "\techo \"DOTFILES_ENV_HOSTNAME=${ENVIRONMENT[1]}\" >> ~/dotfiles/env/environment_vars"
else
	mkdir -p ~/dotfiles/env/
	if [[ -f ~/dotfiles/env/environment_vars ]]; then
		rm -f ~/dotfiles/env/environment_vars
	fi
	echo "DOTFILES_ENV_OS=${ENVIRONMENT[0]}" >> ~/dotfiles/env/environment_vars
	echo "DOTFILES_ENV_HOSTNAME=${ENVIRONMENT[1]}" >> ~/dotfiles/env/environment_vars
fi

echo "### Done. ###"
exit 0

