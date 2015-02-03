" FIX: PluginUpdate => git pull: git-sh-setup: No such file or directory in MacVim (OK in non-GUI version of Vim)
if has("gui_macvim")
    set shell=/bin/bash\ -l
endif

set nobackup
set nowrap
set tabstop=4
set shiftwidth=4
set expandtab

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
""Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
""Plugin 'L9'
" Git plugin not hosted on GitHub
""Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
""Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
""Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
""Plugin 'user/L9', {'name': 'newL9'}

" My plugins:
Plugin 'flazz/vim-colorschemes'
Plugin 'bling/vim-airline'
" Install fonts from https://github.com/powerline/fonts
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'ervandew/supertab'
Plugin 'majutsushi/tagbar'
" On mac install campatible ctags
"" not working Plugin 'lukaszkorecki/CoffeeTags'
"Plugin 'vim-php/tagbar-phpctags.vim'
"let g:tagbar_phpctags_bin='/Users/borisov/tmp/phpctags/phpctags'
Plugin 'nathanaelkane/vim-indent-guides'
IndentGuidesEnable
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/vimshell.vim'
Plugin 'Align'

Plugin 'kchmck/vim-coffee-script'
Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-markdown'

"" Spaces settings for coffee
autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=4 expandtab
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

"let coffee_lint_options = '-f lint.json'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"" ctags
"" coffeesript
let g:tagbar_type_coffee = {
    \ 'ctagstype' : 'coffee',
    \ 'kinds'     : [
        \ 'c:classes',
        \ 'm:methods',
        \ 'f:functions',
        \ 'v:variables',
        \ 'f:fields',
    \ ]
\ }
"" ctags end

nmap <F8> :TagbarToggle<CR>
nmap <F3> :NERDTreeToggle<CR>
" Tab navigation
map ;] :tabnext<cr>
map ;[ :tabprevious<cr>

vnoremap < <gv
vnoremap > >gv

" Match and search
set hlsearch    " highlight search
set ignorecase  " Do case in sensitive matching with
set smartcase   " be sensitive when there's a capital letter
set incsearch   "" "}}}
nmap <F3> :set hlsearch!<CR>


" Visual "{{{
set nonumber  " Line numbers off
set showmatch  " Show matching brackets.
set matchtime=5  " Bracket blinking.
set novisualbell  " No blinking
set noerrorbells  " No noise.
set backspace=indent,eol,start
set list
set listchars=tab:\|\ 

" Status line
set statusline=%<%f%h%m%r%=%{fugitive#statusline()}\ format=%{&fileformat}\ file=%{&fileencoding}\ enc=%{&encoding}\ %b\ 0x%B\ %l,%c%V\ %P
set laststatus=2

colorscheme hybrid
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
set guifont=Droid\ Sans\ Mono\ for\ Powerline:h12
" }}}

"" Comands
" Sudo write
comm! W exec 'w !sudo tee % > /dev/null' | e!
