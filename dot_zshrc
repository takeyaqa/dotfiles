if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

if type starship &>/dev/null
then
  eval "$(starship init zsh)"
fi
