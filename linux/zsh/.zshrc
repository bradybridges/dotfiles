# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Variables
export ZSH="$HOME/.oh-my-zsh"

# Path
export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"
export PATH="$HOME/.tmuxifier/bin:$PATH"

# Default Editor
export EDITOR=nvim
export MANROFFOPT="-c"

# Theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Plugins
plugins=(z git zsh-autosuggestions zsh-syntax-highlighting zsh-bat)

# omz
source $ZSH/oh-my-zsh.sh

# Alias
alias scat="~/superCat.sh"
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
alias eth="curl rate.sx/eth@2w"
alias c="clear"
alias ..="cd .."
alias ../="cd .. && cd"
alias ...="cd ../.."
alias scope="echo 'SearchSpring.Catalog.elems.container.scope()' &&  echo 'SearchSpring.Catalog.elems.container.scope()' | wl-copy"
alias store="echo 'searchspring.controller.search.store' &&  echo 'searchspring.controller.search.store' | wl-copy"
alias snap="cd ~/Documents/projects/snap"

# x-clip
# alias snapscript="echo '<script src=\"bundle.js\" id=\"searchspring-context\"></script>' | xclip -selection clipboard"
# alias snaprecscript="echo '<script type=\"searchspring/personalized-recommendations\" profile=\"\"></script>' | xclip -selection clipboard"
#alias scope="echo 'SearchSpring.Catalog.elems.container.scope()' &&  echo 'SearchSpring.Catalog.elems.container.scope()' | xclip -selection clipboard"
#alias store="echo 'searchspring.controller.search.store' &&  echo 'searchspring.controller.search.store' | xclip -selection clipboard"

# wl-copy (wayland)
alias snapscript="echo '<script src=\"bundle.js\" id=\"searchspring-context\"></script>' | wl-copy"
alias snaprecscript="echo '<script type=\"searchspring/personalized-recommendations\" profile=\"\"></script>' | wl-copy"

alias nrd="npm run dev"
alias history="history | fzf | xclip -sel clip"
alias n="nvim"
alias ios="open -a simulator"
alias tmux-attach="tmux a -t"
alias tmux-new="tmux new -s"
alias tmux-kill="tmux kill-server"
alias tmux-kill-session="tmux kill-session -t"
alias no='nvim $(fzf -m --preview="cat {}")'
alias enc="openssl enc -aes-256-cbc -in"
alias dec="openssl enc -d -aes-256-cbc -in"

# Nvm
#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_ALT_C_COMMAND="fd -t directory . ~"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#source /usr/share/doc/fzf/examples/key-bindings.zsh
#source /usr/share/doc/fzf/examples/completion.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/nvm/init-nvm.sh
