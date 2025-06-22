#!/bin/sh

# -e: exit on error
# -u: exit on unset variables
set -eu

# Install starship
if ! command -v starship >/dev/null 2>&1; then
	if command -v curl >/dev/null 2>&1; then
		starship_install_script="$(curl -fsSL https://starship.rs/install.sh)"
	elif command -v wget >/dev/null 2>&1; then
		starship_install_script="$(wget -qO- https://starship.rs/install.sh)"
	else
		echo "To install starship, you must have curl or wget installed." >&2
		exit 1
	fi
	sh -c "${starship_install_script}" -- --yes
	unset starship_install_script
fi

# Create symlinks
mkdir -p "${HOME}/.config"
mkdir -p "${HOME}/.config/git"
ln -snf "${PWD}/.config/git/config" "${HOME}/.config/git/config"
ln -snf "${PWD}/.config/starship.toml" "${HOME}/.config/starship.toml"
ln -snf "${PWD}/.zprofile" "${HOME}/.zprofile"
ln -snf "${PWD}/.zshenv" "${HOME}/.zshenv"
ln -snf "${PWD}/.zshrc" "${HOME}/.zshrc"
