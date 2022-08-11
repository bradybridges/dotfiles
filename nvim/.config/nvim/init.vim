let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

""" Vim-Plug
call plug#begin()

" Aesthetics
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

" Aesthetics - Themes
Plug 'ayu-theme/ayu-vim'
Plug 'pineapplegiant/spaceduck', { 'branch': 'dev' }
Plug 'NLKNguyen/papercolor-theme'

" Functionalities
Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'sheerun/vim-polyglot'
Plug 'chrisbra/Colorizer'
Plug 'dkarter/bullets.vim'
Plug 'justinmk/vim-sneak'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'frazrepo/vim-rainbow'

" Load devicons last(per docs)
Plug 'ryanoasis/vim-devicons'

call plug#end()

""" Theme
set termguicolors
set guifont=DroidSansMono\ Nerd\ Font:h11
"let ayucolor="dark"
set background=dark
colorscheme PaperColor

""" Spaceduck!!!
"if exists('+termguicolors')
"  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"  set termguicolors
"endif

""" Coloring
syntax on
highlight Pmenu guibg=white guifg=black gui=bold
highlight Comment gui=bold
highlight Normal gui=none
highlight NonText guibg=none
highlight LineNr guibg=NONE guifg=Gray ctermbg=NONE
highlight CursorLineNr term=bold ctermfg=Yellow gui=bold guifg=Yellow
highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
let g:rainbow_active = 1

set cursorline

""" Other Configurations
filetype plugin indent on
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent
set incsearch ignorecase smartcase hlsearch
set ruler laststatus=2 showcmd showmode
set list listchars=trail:»,tab:»-
set fillchars+=vert:\ 
set wrap breakindent
set encoding=utf-8
set number
set title
set relativenumber
set scrolloff=8
set listchars=tab:‣\ ,trail:·

""" Plugin Configurations
" VIM Sneak
let g:sneak#label = 1

" NERDTree
let NERDTreeShowHidden=1
let g:NERDTreeDirArrowExpandable = '↠'
let g:NERDTreeDirArrowCollapsible = '↡'

" Airline
let g:airline_powerline_fonts = 1
let g:airline_section_z = ' %{strftime("%-I:%M %p")}'
let g:airline_section_warning = ''
"let g:airline#extensions#tabline#enabled = 1

" Neovim :Terminal
tmap <Esc> <Esc>:q<CR>"
"autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave term://* stopinsert
autocmd TermOpen * setlocal nonumber norelativenumber

" indentLine
let g:indentLine_char = '▏'
let g:indentLine_color_gui = '#363949'

" fzf-vim
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'Type'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Character'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" coc
let g:coc_global_extensions = [
  \ 'coc-tsserver'
  \ ]

""" Filetype-Specific Configurations

" HTML, XML, Jinja
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType xml setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango inoremap {{ {{  }}<left><left><left>
autocmd FileType htmldjango inoremap {% {%  %}<left><left><left>
autocmd FileType htmldjango inoremap {# {#  #}<left><left><left>

" Markdown and Journal
autocmd FileType markdown setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType journal setlocal shiftwidth=2 tabstop=2 softtabstop=2

""" Custom Functions

" Trim Whitespaces
function! TrimWhitespace()
    let l:save = winsaveview()
    %s/\\\@<!\s\+$//e
    call winrestview(l:save)
endfunction

function! TabFile() abort
    set expandtab!
    %retab!
endfunction

""" Custom Mappings

let mapleader=" "
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap \ <leader>q
nnoremap <leader>w :TagbarToggle<CR>
nnoremap <leader>ee :Colors<CR>
nnoremap <leader>ea :AirlineTheme
nnoremap <leader>e1 :call ColorDracula()<CR>
nnoremap <leader>r :so ~/.config/nvim/init.vim<CR>
nnoremap <leader>R :edit!<CR>
nnoremap <leader>t :call TrimWhitespace()<CR>
nnoremap <leader>s <C-w>s<C-w>j:terminal<CR>
nnoremap <leader>vs <C-w>v<C-w>l:terminal<CR>
nnoremap <leader>d <Plug>(pydocstring)
nnoremap <leader>f <cmd>Telescope find_files<cr>
nnoremap <leader>h :RainbowParentheses!!<CR>
nnoremap <leader>j :set filetype=journal<CR>
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <leader>` :terminal<CR>
autocmd FileType python nmap <leader>x :0,$!~/.config/nvim/env/bin/python -m yapf<CR>
nnoremap <silent> <leader><leader> :noh<CR>
nnoremap <Tab> :bnext<R
nnoremap <S-Tab> :bprevious<CR>
nnoremap <leader>y "+y
nnoremap <leader>Y gg""
nnoremap f <Plug>Sneak_s
nnoremap F <Plug>Sneak_S
noremap <up> <C-w><up>
noremap <down> <C-w><down>
noremap <left> <C-w><left>
noremap <right> <C-w><right>
noremap <F9> :call TabFile()<CR>
inoremap jj <Esc>
vnoremap <leader>y "+y
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
tnoremap <Esc> <C-\><C-n>
