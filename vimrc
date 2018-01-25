set nocompatible
filetype off

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'airblade/vim-gitgutter'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'easymotion/vim-easymotion'
Plugin 'flazz/vim-colorschemes'
Plugin 'hallison/vim-markdown'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'junegunn/vim-easy-align'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'mattn/emmet-vim'
Plugin 'mileszs/ack.vim'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'nelstrom/vim-markdown-folding'
Plugin 'osyo-manga/vim-over'
Plugin 'pangloss/vim-javascript'
Plugin 'powerline/fonts'
Plugin 'rust-lang/rust.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'thinca/vim-qfreplace'
Plugin 'tpope/vim-fugitive'
Plugin 'udalov/kotlin-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-scripts/kwbdi.vim'
Plugin 'wellle/targets.vim'

call vundle#end()

"-----------------------------------------------------------------------------
" General
"-----------------------------------------------------------------------------

syntax on
filetype plugin indent on
set number
set encoding=utf-8
set list listchars=tab:→\ ,trail:·
let mapleader=","
set nowrap
set cpoptions+=$
set tabstop=4
set shiftwidth=4
set expandtab
set hidden
set pastetoggle=<F3>
set shell=bash " Let zsh know how to run things on the command line
set nobackup   " Don't constantly write backup files
set noswapfile " Ain't nobody got time for swap files
set ignorecase " Ignore case when searching
set hlsearch   " Highlight last used search pattern
set incsearch  " Do incremental searching
set foldlevel=99

" Ruby settings
:autocmd Filetype ruby set softtabstop=2
:autocmd Filetype ruby set sw=2
:autocmd Filetype ruby set ts=2

" Html settings
:autocmd Filetype html set softtabstop=2
:autocmd Filetype html set sw=2
:autocmd Filetype html set ts=2

" javascript settings
:autocmd Filetype javascript set softtabstop=2
:autocmd Filetype javascript set sw=2
:autocmd Filetype javascript set ts=2

"-----------------------------------------------------------------------------
" Formattings
"-----------------------------------------------------------------------------

" t = auto wrap using textwidth
set formatoptions+=tc
set textwidth=79

" Allow modelines
set modeline

autocmd BufWritePre *.py :%s/\s\+$//e

"-----------------------------------------------------------------------------
" GUI
"-----------------------------------------------------------------------------

" Remove gvim toolbar, scrollbars, and menu
set guioptions=ac

" Set the default theme
if has("gui_running")
    colorscheme solarized
    set background=dark
else
    colorscheme moria
endif

" Change background for column > 80 chars
let &colorcolumn=join(range(80,999), ",")

"-----------------------------------------------------------------------------
" Folding
"-----------------------------------------------------------------------------

" Use syntax folding method
set fdm=syntax

"-----------------------------------------------------------------------------
" Plugin Settings
"-----------------------------------------------------------------------------

" powerline
set laststatus=2
set t_Co=256
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ 11

" airline
let g:airline_powerline_fonts=1
let g:airline_theme='light'
let g:airline_detect_modified=1
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#syntastic#enabled=1

" ctrlp
let g:ctrlp_user_command = {
  \ 'types': {
    \ 1: ['.git', 'cd %s && git ls-files --cached --exclude-standard --others'],
    \ 2: ['.hg', 'hg --cwd %s locate -I .'],
    \ },
  \ 'fallback': 'find %s -type f'
  \ }
let g:ctrlp_working_path_mode = 'a'
let g:ctrlp_show_hidden = 1

" syntastic
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_args='--ignore=E501,E225'

" vim-ack
if executable('ag')
    let g:ackprg = 'ag --nogroup --nocolor --column'
endif

"-----------------------------------------------------------------------------
" Mappings
"-----------------------------------------------------------------------------

nnoremap <Leader>fr :call VisualFindAndReplace()<CR>
xnoremap <Leader>fr :call VisualFindAndReplaceWithSelection()<CR>

"-----------------------------------------------------------------------------
" Functions
"-----------------------------------------------------------------------------

function! VisualFindAndReplace()
    :OverCommandLine%s/
    :w
endfunction

function! VisualFindAndReplaceWithSelection() range
    :'<,'>OverCommandLine s/
    :w
endfunction
