export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE="$XDG_STATE_HOME/zsh/history"
export HISTSIZE=32768
export SAVEHIST=32768

export PYTHON_HISTORY="$XDG_STATE_HOME/python_history"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export CODEX_HOME="$XDG_CONFIG_HOME/codex"

export VISUAL="code --wait"
export EDITOR="pico"
export SUDO_EDITOR="$EDITOR"
export BAT_THEME=ansi

# fzf configuration - match fish
export FZF_DEFAULT_OPTS='--cycle --layout=default --height=90% --preview-window=wrap --marker="*"'
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window up:3:wrap"
