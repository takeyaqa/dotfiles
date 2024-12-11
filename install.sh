#!/bin/sh

# -e: exit on error
# -u: exit on unset variables
set -eu

# Install starship
if ! starship="$(command -v starship)"; then
	bin_dir="${HOME}/.local/bin"
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

# Install chezmoi
if ! chezmoi="$(command -v chezmoi)"; then
	bin_dir="${HOME}/.local/bin"
	chezmoi="${bin_dir}/chezmoi"
	echo "Installing chezmoi to '${chezmoi}'" >&2
	if command -v curl >/dev/null; then
		chezmoi_install_script="$(curl -fsSL get.chezmoi.io)"
	elif command -v wget >/dev/null; then
		chezmoi_install_script="$(wget -qO- get.chezmoi.io)"
	else
		echo "To install chezmoi, you must have curl or wget installed." >&2
		exit 1
	fi
	sh -c "${chezmoi_install_script}" -- -b "${bin_dir}"
	unset chezmoi_install_script bin_dir
fi

# POSIX way to get script's dir: https://stackoverflow.com/a/29834779/12156188
script_dir="$(cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P)"

set -- init --apply --source="${script_dir}"

echo "Running 'chezmoi $*'" >&2
# exec: replace current process with chezmoi
exec "$chezmoi" "$@"
