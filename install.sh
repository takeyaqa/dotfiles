#!/bin/sh

# -e: exit on error
# -u: exit on unset variables
set -eu


# Install starship
if ! starship="$(command -v starship)"; then
	bin_dir="${HOME}/.local/bin"
	mkdir -p "${bin_dir}"
	starship="${bin_dir}/starship"
	echo "Installing starship to '${starship}'" >&2
	if command -v curl >/dev/null; then
		starship_install_script="$(curl -fsSL starship.rs/install.sh)"
	elif command -v wget >/dev/null; then
		starship_install_script="$(wget -qO- starship.rs/install.sh)"
	else
		echo "To install starship, you must have curl or wget installed." >&2
		exit 1
	fi
	sh -c "${starship_install_script}" -- -b "${bin_dir}" --yes
	unset starship_install_script bin_dir
fi

# Create symlinks
mkdir -p "${HOME}/.config/git"
mkdir -p "${HOME}/.config/mise"

ln -snf "${PWD}/.config/git/config" "${HOME}/.config/git/config"
ln -snf "${PWD}/.config/mise/config.toml" "${HOME}/.config/mise/config.toml"
ln -snf "${PWD}/.config/starship.toml" "${HOME}/.config/starship.toml"
ln -snf "${PWD}/.zprofile" "${HOME}/.zprofile"
ln -snf "${PWD}/.zshenv" "${HOME}/.zshenv"
ln -snf "${PWD}/.zshrc" "${HOME}/.zshrc"
