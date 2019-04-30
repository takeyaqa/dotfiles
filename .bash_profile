if type brew 2&>/dev/null; then
  source "$(brew --prefix)/etc/bash_completion"
else
  echo "run: brew install git bash-completion"
fi
PS1='\u \W$(__git_ps1 " (%s)")\$ '

export JAVA_HOME=`/usr/libexec/java_home`
export ANDROID_HOME=$HOME/Library/Android/sdk
export GROOVY_HOME=/usr/local/opt/groovy/libexec
export GRADLE_HOME=/usr/local/opt/gradle/libexec

PATH=$HOME/.nodebrew/current/bin:$PATH
PATH=$ANDROID_HOME/platform-tools:$JAVA_HOME/bin:$PATH
PATH=/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin:$PATH
export PATH

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/usr/local/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

eval "$(rbenv init -)"