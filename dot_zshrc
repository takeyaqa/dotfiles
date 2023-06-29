if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

if type nodenv &>/dev/null
then
  eval "$(nodenv init - zsh)"
fi

if type pyenv &>/dev/null
then
  eval "$(pyenv init - zsh)"
fi

if type rbenv &>/dev/null
then
  eval "$(rbenv init - zsh)"
fi

if type github-copilot-cli &>/dev/null
then
  eval "$(github-copilot-cli alias -- "$0")"
fi

if type starship &>/dev/null
then
  eval "$(starship init zsh)"
fi
