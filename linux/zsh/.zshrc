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

# Theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Plugins
plugins=(z git zsh-autosuggestions zsh-syntax-highlighting zsh-bat)

# omz
source $ZSH/oh-my-zsh.sh

# Alias (linux-only)
alias scat="~/superCat.sh"
alias eth="curl rate.sx/eth@2w"
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

alias history="history | fzf | xclip -sel clip"
alias enc="openssl enc -aes-256-cbc -in"
alias dec="openssl enc -d -aes-256-cbc -in"

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

# Nvm
#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export FZF_ALT_C_COMMAND="fd -t directory . ~"

# Shared config (aliases, fzf, p10k, PATH) — see global/zsh
source ~/.zshrc_common

#source /usr/share/doc/fzf/examples/key-bindings.zsh
#source /usr/share/doc/fzf/examples/completion.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/nvm/init-nvm.sh
export PATH="/usr/bin:$PATH"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
