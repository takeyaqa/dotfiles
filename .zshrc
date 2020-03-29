if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

fpath=(/usr/local/share/zsh-completions $fpath)

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"

eval "$(rbenv init -)"

autoload -U compinit
compinit

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh