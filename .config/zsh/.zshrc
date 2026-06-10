# options

# Use emacs key bindings
bindkey -e

# Meta/UTF-8 settings
setopt COMBINING_CHARS

# History configuration
# Use XDG dirs for completion and history files
[ -d "$XDG_STATE_HOME/zsh" ] || mkdir -p "$XDG_STATE_HOME/zsh"
HISTFILE="$XDG_STATE_HOME/zsh/history"
HISTSIZE=32768
SAVEHIST=32768
setopt APPEND_HISTORY           # Append to history file
setopt SHARE_HISTORY            # Share history across sessions
setopt HIST_IGNORE_DUPS         # Ignore duplicate commands
setopt HIST_IGNORE_ALL_DUPS     # Remove older duplicate from history
setopt HIST_IGNORE_SPACE        # Ignore commands starting with space
setopt HIST_REDUCE_BLANKS       # Remove unnecessary blanks
setopt HIST_VERIFY              # Don't execute immediately upon history expansion

# Completion configuration
setopt COMPLETE_IN_WORD         # Complete from both ends of word
setopt ALWAYS_TO_END            # Move cursor to end after completion
setopt AUTO_MENU                # Show completion menu on tab

# Directory navigation
setopt AUTO_CD                  # cd by typing directory name
setopt CHASE_LINKS              # Mark symlinked directories

# Case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=* l:|=*'

# Colored completion listings
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Show extra file information when completing (like ls -F)
zstyle ':completion:*' file-list all

# Show all completions at once (no paging)
zstyle ':completion:*' list-prompt ''
zstyle ':completion:*' select-prompt ''

# Don't complete hidden files unless explicitly starting with dot
zstyle ':completion:*' match-hidden-files off

# Cache completion results for faster performance
[ -d "$XDG_CACHE_HOME/zsh" ] || mkdir -p "$XDG_CACHE_HOME/zsh"
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/zcompcache"

# Use a custom compdump file to avoid conflicts with non-XDG setups
autoload -Uz compinit
compinit -d "$XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION"

# Arrow keys: history search matching current input
bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward
bindkey "^[[C" forward-char
bindkey "^[[D" backward-char

# Extended globbing
setopt EXTENDED_GLOB

# Don't beep on errors
unsetopt BEEP

# Allow comments in interactive shells
setopt INTERACTIVE_COMMENTS

# Ensure mise works (disable command hashing)
setopt NO_HASH_CMDS
setopt NO_HASH_DIRS

# aliases

# Eza (https://eza.rocks/)
if command -v eza >/dev/null 2>&1; then
  alias ls='eza -lh --group-directories-first --icons=auto'
  alias lsa='ls -a'
  alias lt='eza --tree --level=2 --long --icons --git'
  alias lta='lt -a'
fi

# Fuzzy find (https://junegunn.github.io/fzf/)
alias ff="fzf --preview 'bat --style=numbers --color=always {}'"
alias eff='$EDITOR "$(ff)"'

# Smart cd (https://github.com/ajeetdsouza/zoxide)
if command -v zoxide >/dev/null 2>&1; then
  alias cd="zd"
  zd() {
    if (( $# == 0 )); then
      builtin cd ~ || return
    elif [[ -d $1 ]]; then
      builtin cd "$1" || return
    else
      if ! z "$@"; then
        echo "Error: Directory not found"
        return 1
      fi

      printf "\U000F17A9 "
      pwd
    fi
  }
fi

# Directories
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Git
alias g='git'
alias gcm='git commit -m'
alias gcam='git commit -a -m'
alias gcad='git commit -a --amend'

# functions

# Create a new worktree and branch from within current git directory.
ga() {
  if [[ -z "$1" ]]; then
    echo "Usage: ga [branch name]"
    return 1
  fi

  local branch="$1"
  local base="$(basename "$PWD")"
  local path="../${base}--${branch}"

  git worktree add -b "$branch" "$path"
  mise trust "$path"
  cd "$path"
}

# Remove worktree and branch from within active worktree directory.
gd() {
  if gum confirm "Remove worktree and branch?"; then
    local cwd base branch root worktree

    cwd="$(pwd)"
    worktree="$(basename "$cwd")"

    # split on first `--`
    root="${worktree%%--*}"
    branch="${worktree#*--}"

    # Protect against accidentally nuking a non-worktree directory
    if [[ "$root" != "$worktree" ]]; then
      cd "../$root"
      git worktree remove "$cwd" --force || return 1
      git branch -D "$branch"
    fi
  fi
}

# Inits

if command -v mise >/dev/null 2>&1; then
  eval "$(mise activate zsh)"
fi

if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi

if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
fi

if command -v fzf >/dev/null 2>&1; then
  source <(fzf --zsh)
fi
