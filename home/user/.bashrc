# On MacOS, this file should be named .bash_profile

# Alias vim to neovim
alias vim="nvim"
alias vi="nvim"

# Node manager (n)
export N_PREFIX=$HOME/n
export PREFIX=$N_PREFIX

# Enable git command completion of branch names
# Get the script with: curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash > ~/.git-completion.bash
source ~/.git-completion.bash

# Source fuzzy finder
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export JAVA_HOME=$HOME/java/jdk1.8.0_202
export PATH=$PATH:$JAVA_HOME/bin:$HOME/apache-maven-3.6.0/bin:$HOME/nvim/bin:$N_PREFIX/bin

export TERM=xterm-256color
[ -n "$TMUX" ] && export TERM=screen-256color
