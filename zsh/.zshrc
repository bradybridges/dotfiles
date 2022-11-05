if type brew &>/dev/null; then
	FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

	autoload -Uz compinit
	compinit
fi

export ZSH="/Users/bradybridges/.oh-my-zsh"
export TERM="xterm-256color"
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

alias cat="~/superCat.sh"
alias lg="lazygit"
alias gs="git status"
alias gc="git commit"
alias gd="git diff"
alias gm="git merge"
alias gl="git log"
alias gco="git checkout"
alias gp="git pull"
alias soft-reset="git reset --soft HEAD~1"
alias restore="git restore --staged"
alias gpo="git push origin HEAD"
alias eth="curl rate.sx/eth@2w"
alias c="clear"
alias ..="cd .."
alias ../="cd .. && cd"
alias ...="cd ../.."
alias history="history | fzf"
alias vim="nvim"
alias n="nvim"

# Add a space in the first prompt
local user_symbol="$"
if [[ $(print -P "%#") =~ "#" ]]; then
	user_symbol = "#"
fi

POWERLEVEL9K_MODE="nerdfont-complete"
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir_writable dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status command_execution_time root_indicator background_jobs time battery)
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_USER_ICON="\uF415" # 
POWERLEVEL9K_ROOT_ICON="\uF09C"
POWERLEVEL9K_SUDO_ICON=$'\uF09C' # 
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M}"
POWERLEVEL9K_VCS_GIT_ICON='\uF408 '
POWERLEVEL9K_VCS_GIT_GITHUB_ICON='\uF408 '

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"	# This loads nvm bash_completion

eval $(thefuck --alias)

export PATH=/opt/homebrew/bin:$PATH
