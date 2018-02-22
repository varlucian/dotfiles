# append the history
shopt -s histappend

export HISTCONTROL=ignoreboth
export HISTIGNORE="ls:bg:fg:history"
export HISTSIZE=15000
export HISTFILESIZE=2000000
#export HISTTIMEFORMAT='%F %T '
# record command immediately (do not wait until terminal closes. 
# Prevents commands being lost 
export PROMPT_COMMAND='history -a'

# git branch name in the terminal
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

GREEN="\[\033[01;32m\]"
BLACK='\[\033[00m\]'
BLUE='\[\033[01;34m\]'

export PS1="$GREEN\u@\h$BLACK:$BLUE\w $GREEN\$(parse_git_branch)$BLACK\n$ "

export EDITOR=vim

# git completion script from 
# https://raw.github.com/git/git/master/contrib/completion/git-completion.bash
if [ -f ~/bin/.git-completion.bash ]; then
  . ~/bin/.git-completion.bash
fi


##
# Your previous /Users/lucian/.bash_profile file was backed up as /Users/lucian/.bash_profile.macports-saved_2014-06-04_at_21:01:50
##

# MacPorts Installer addition on 2014-06-04_at_21:01:50: adding an appropriate PATH variable for use with MacPorts.
export PATH=/usr/local/git/bin:/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.


# Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
#export COCOS_CONSOLE_ROOT=/Users/lucian/opt/cocos2d-x-3.3/tools/cocos2d-console/bin
#export PATH=$COCOS_CONSOLE_ROOT:$PATH

# Add environment variable COCOS_X_ROOT for cocos2d-x
#export COCOS_X_ROOT=/Users/lucian/opt/cocos2d-x-3.3
#export PATH=$COCOS_X_ROOT:$PATH

# Add environment variable COCOS_TEMPLATES_ROOT for cocos2d-x
#export COCOS_TEMPLATES_ROOT=/Users/lucian/opt/cocos2d-x-3.3/templates
#export PATH=$COCOS_TEMPLATES_ROOT:$PATH

# Add environment variable NDK_ROOT for cocos2d-x
#export NDK_ROOT=/Users/lucian/opt/Android/android-ndk
#export PATH=$NDK_ROOT:$PATH

# Add environment variable ANDROID_SDK_ROOT for cocos2d-x
export ANDROID_SDK_ROOT=/Users/lucian/opt/Android/android-sdk
export PATH=$ANDROID_SDK_ROOT:$PATH
#export PATH=$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/platform-tools:$PATH

# Add environment variable ANT_ROOT for cocos2d-x
#export ANT_ROOT=/Users/lucian/opt/ant/bin
#export PATH=$ANT_ROOT:$PATH

##
# Your previous /Users/lucian/.bash_profile file was backed up as /Users/lucian/.bash_profile.macports-saved_2015-08-02_at_13:04:07
##

# MacPorts Installer addition on 2015-08-02_at_13:04:07: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.


# Setting PATH for Python 3.5
# The orginal version is saved in .bash_profile.pysave
export PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"

# LV: Emacs path
export PATH=/Applications/Emacs.app/Contents/MacOS:$PATH
