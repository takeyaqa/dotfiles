#!/bin/sh

# -e: exit on error
# -u: exit on unset variables
set -eu

# Install starship
if ! command -v starship >/dev/null 2>&1; then
	if command -v curl >/dev/null 2>&1; then
		starship_install_script="$(curl -fsSL https://starship.rs/install.sh)"
	else
		echo "To install starship, you must have curl installed." >&2
		exit 1
	fi
	sh -c "${starship_install_script}" -- --yes
	unset starship_install_script
fi

# Create symlinks
mkdir -p "${HOME}/.codex"
ln -snf "${PWD}/.codex/config.toml" "${HOME}/.codex/config.toml"
ln -snf "${PWD}/.config" "${HOME}/.config"
ln -snf "${PWD}/.zshenv" "${HOME}/.zshenv"
