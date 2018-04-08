if [ -f $(brew --prefix)/etc/bash_completion ]; then
    source $(brew --prefix)/etc/bash_completion
fi
PS1='\u \W$(__git_ps1 " (%s)")\$ '

export JAVA_HOME=`/usr/libexec/java_home`
export ANDROID_HOME=$HOME/Library/Android/sdk
export GROOVY_HOME=/usr/local/opt/groovy/libexec
export PATH=$ANDROID_HOME/platform-tools:$JAVA_HOME/bin:$HOME/anaconda3/bin:$PATH
