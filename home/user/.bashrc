# On MacOS, this file should be named .bash_profile

# Enable git command completion of branch names
# Get the script with: curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash > ~/.git-completion.bash
source ~/.git-completion.bash

export JAVA_HOME=$HOME/java/jdk1.8.0_202
export PATH=$PATH:$JAVA_HOME/bin:$HOME/apache-maven-3.6.0/bin

export TERM=xterm-256color
[ -n "$TMUX" ] && export TERM=screen-256color
