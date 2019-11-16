if type brew 2&>/dev/null; then
  source "$(brew --prefix)/etc/bash_completion"
else
  echo "run: brew install git bash-completion"
fi
PS1='\u \W$(__git_ps1 " (%s)")\$ '

export JAVA_HOME=`/usr/libexec/java_home`
export ANDROID_HOME=$HOME/Library/Android/sdk

PATH=$HOME/bin:/usr/local/sbin:$PATH
PATH=$HOME/.nodebrew/current/bin:$PATH
PATH=$ANDROID_HOME/platform-tools:$JAVA_HOME/bin:$PATH
PATH=/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin:$PATH
export PATH

eval "$(rbenv init -)"