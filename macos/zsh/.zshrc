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

export ZSH="/Users/bradybridges/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(z git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

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

# Install or update a treesitter parser and its query files
ts-install() {
  local lang=$1
  local repo=$2
  local src_dir=$3  # optional subdir if grammar isn't at repo root

  local tmp="/tmp/ts-$lang"
  git clone --depth=1 "$repo" "$tmp"

  local src="$tmp/${src_dir:-.}/src"
  local args=(-o ~/.local/share/nvim/site/parser/$lang.so -shared -fPIC -Os -I"$src" "$src/parser.c")
  [ -f "$src/scanner.c" ] && args+=("$src/scanner.c")
  cc "${args[@]}"

  local queries="$tmp/${src_dir:-.}/queries"
  [ -d "$queries" ] || queries="$tmp/queries"
  mkdir -p ~/.config/nvim/queries/$lang
  cp "$queries"/*.scm ~/.config/nvim/queries/$lang/ 2>/dev/null

  rm -rf "$tmp"
  echo "Installed $lang parser and queries"
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#export brew path
export PATH=/opt/homebrew/bin:$PATH

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_ALT_C_COMMAND="fd -t d . ~/projects/"

export PATH=~/flutter/bin:$PATH

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/develop/flutter/bin:$PATH"
