#!/usr/bin/env bash

#
# Functions;
#

function show_usage() {
	echo "Usage: $(basename "$0") [-dh]"
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
	if echo "${host_os}" | grep -i "^mingw.*" >/dev/null; then
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
	local os
	os=$(get_os_type "${arg}")
	local name
	name="$(get_hostname "${os}")"

	echo "${os}" "${name}"
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
	# shellcheck disable=SC2207
	# FIXME: adopt for SC2207
	ENVIRONMENT=( $(get_platform_env "${DEBUG_HOST_OS}") )
else
	# shellcheck disable=SC2207
	# FIXME: adopt for SC2207
	ENVIRONMENT=( $(get_platform_env) )
fi
echo "OS=${ENVIRONMENT[0]} HOSTNAME=${ENVIRONMENT[1]} ###"

if [[ "${ENVIRONMENT[0]}" != "windows" ]] \
	&& [[ "${ENVIRONMENT[0]}" != "macos" ]] \
	&& [[ "${ENVIRONMENT[0]}" != "linux" ]]
then
	echo "Unexpected environment: ${ENVIRONMENT[0]}"
	echo "Abort."
	exit 1
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

echo "### Make symlinks..."

# tig
if [[ "${DEBUG_MODE}" == "true" ]]; then
	echo -e "\tln -sfv dotfiles/tig/tigrc ~/.tigrc"
else
	ln -sfv dotfiles/tig/tigrc ~/.tigrc
fi

# bash
if [[ "${DEBUG_MODE}" == "true" ]]; then
	echo -e "\tln -sfv dotfiles/bash/bash_profile ~/.bash_profile"
	echo -e "\tln -sfv dotfiles/bash/bashrc ~/.bashrc"
else
	ln -sfv dotfiles/bash/bash_profile ~/.bash_profile
	ln -sfv dotfiles/bash/bashrc ~/.bashrc
fi

mkdir -p ~/.config

# gitconfig
if [[ "${DEBUG_MODE}" == "true" ]]; then
	echo -e "\tln -sfv ~/dotfiles/git ~/.config/git"
else
	ln -sfv ~/dotfiles/git ~/.config/git
fi

# wezterm
if [[ "${DEBUG_MODE}" == "true" ]]; then
	echo -e "\tln -sfv ~/dotfiles/wezterm ~/.config/wezterm"
else
	ln -sfv ~/dotfiles/wezterm ~/.config/wezterm
fi

# gh
if [[ "${DEBUG_MODE}" == "true" ]]; then
	echo -e "\tmkdir -p ~/.config/gh"
	echo -e "\tln -sfv ~/dotfiles/gh/config.yml ~/.config/gh/config.yml"
else
	mkdir -p ~/.config/gh
	ln -sfv ~/dotfiles/gh/config.yml ~/.config/gh/config.yml
fi

# editorconfig
if [[ "${DEBUG_MODE}" == "true" ]]; then
	echo -e "\tln -sfv ~/dotfiles/editorconfig/editorconfig ~/.editorconfig"
else
	ln -sfv ~/dotfiles/editorconfig/editorconfig ~/.editorconfig
fi

# neovim
if [[ "${DEBUG_MODE}" == "true" ]]; then
	echo -e "\tln -sfv ~/dotfiles/neovim ~/.config/nvim"
else
	ln -sfv ~/dotfiles/neovim ~/.config/nvim
fi

# yazi
if [[ "${DEBUG_MODE}" == "true" ]]; then
	echo -e "\tln -sfv ~/dotfiles/yazi ~/.config/yazi"
else
	ln -sfv ~/dotfiles/yazi ~/.config/yazi
fi

# gitui
if [[ "${DEBUG_MODE}" == "true" ]]; then
	echo -e "\tln -sfv ~/dotfiles/gitui ~/.config/gitui"
else
	ln -sfv ~/dotfiles/gitui ~/.config/gitui
fi

echo "### Done. ###"
exit 0

