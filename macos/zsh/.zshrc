# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if type brew &>/dev/null; then
	FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

	autoload -Uz compinit
	compinit
fi

# Default Editor
export EDITOR=nvim
export MANROFFOPT="-c"

source ~/.oh-my-zsh/oh-my-zsh.sh

export ZSH="$HOME/.oh-my-zsh"
export TERM="screen-256color"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(z git tmux)

source $ZSH/oh-my-zsh.sh

alias lg="lazygit"
alias gs="git status"
alias gc="git commit"
alias gd="git diff"
alias gm="git merge"
alias gl="git log"
alias gco="git checkout"
alias gp="git pull"
alias gpo="git push origin HEAD"
alias soft-reset="git reset --soft HEAD~1"
alias restore="git restore --staged"
alias cypress="npm run cypress"
alias lighthouse="npm run build && npm run cypress"
alias c="clear"
alias ..="cd .."
alias ../="cd .. && cd"
alias ...="cd ../.."
alias scope="echo 'SearchSpring.Catalog.elems.container.scope()' &&  echo 'SearchSpring.Catalog.elems.container.scope()' | pbcopy"
alias store="echo 'searchspring.controller.search.store' &&  echo 'searchspring.controller.search.store' | pbcopy"
alias snap="cd ~/projects/snap && clear"
alias nrd="npm run dev"
alias history="history | fzf"
alias n="nvim"
alias ios="open -a simulator"
alias tmux-attach="tmux a -t"
alias tmux-new="tmux new -s"
alias tmux-kill="tmux kill-server"
alias tmux-kill-session="tmux kill-session -t"
alias no='nvim $(fzf -m --preview="cat {}")'
alias cat="bat"

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

#export brew path
export PATH=/opt/homebrew/bin:$PATH

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_ALT_C_COMMAND="fd -t d . ~/projects/"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export PATH="$HOME/.local/bin:$PATH"

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
