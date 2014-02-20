parse_git_branch() {
 git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /'
}
export -f parse_git_branch

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

export CLICOLOR=1
export PS1="\[\e[00;32m\]\h\[\e[0m\]\[\e[00;37m\]:\[\e[0m\]\[\e[01;36m\]\W\[\e[0m\]\[\e[00;37m\] \[\e[0m\]\[\e[00;33m\]\$(parse_git_branch)\[\e[0m\]\[\e[00;37m\]\$ \[\e[0m\]"
export LSCOLORS=ExFxCxDxBxegedabagacad
export EDITOR=mvim
export HISTCONTROL=ignoredups

alias editaliases="vim ~/.bash_profile && reload"
alias gut=git
alias ht="cd ~/workspace/hightower"
alias ll="ls -al"
alias reload=". ~/.bash_profile"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

if [ -f ~/profile ]; then
  . ~/bash_profile.local
fi

if [ -f ~/bash_profile.local ]; then
  . ~/bash_profile.local
fi
