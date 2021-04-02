# oh-my-zsh installation path
export ZSH="/Users/andybyers/.oh-my-zsh"

# oh-my-zsh theme
ZSH_THEME="robbyrussell"

# automatically update without prompting
DISABLE_UPDATE_PROMPT="true"

# auto-update frequency (in days)
# export UPDATE_ZSH_DAYS=13

# enable command auto-correction
# ENABLE_CORRECTION="true"

# red dots whilst waiting for completion
COMPLETION_WAITING_DOTS="true"

#time-stamp format
HIST_STAMPS="yyyy-mm-dd"

# PLUGINS
plugins=(git iterm2 osx z extract vi-mode)

VI_MODE_SET_CURSOR=true
vi_mode_prompt_info=true

# SOURCE
source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='vi'
fi

# TK 
export PATH="/usr/local/opt/tcl-tk/bin:$PATH"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
export PATH="/usr/local/opt/tcl-tk/bin:$PATH"

# pyenv 
PATH=$(pyenv root)/shims:$PATH

# pandoc_resume
export PATH="$PATH:/Library/TeX/texbin/"

# GOPATH
export GOPATH=/Users/andybyers/go
export PATH=$PATH:$GOPATH
export PATH=$PATH:$GOPATH/bin

# ALIASES FILE
. ~/.zsh_aliases

