if type /opt/homebrew/bin/brew &>/dev/null
then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin${PATH+:$PATH}"
