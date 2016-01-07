set nocompatible
filetype off

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

Plugin 'Lokaltog/powerline-fonts'
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'flazz/vim-colorschemes'
Plugin 'hallison/vim-markdown'
Plugin 'junegunn/vim-easy-align'
Plugin 'kien/ctrlp.vim'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'mattn/emmet-vim'
Plugin 'mhinz/vim-startify'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'nelstrom/vim-markdown-folding'
Plugin 'osyo-manga/vim-over'
Plugin 'pangloss/vim-javascript'
Plugin 'rust-lang/rust.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'thinca/vim-qfreplace'
Plugin 'tpope/vim-fugitive'
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

"-----------------------------------------------------------------------------
" Formattings
"-----------------------------------------------------------------------------

" t = auto wrap using textwidth
set formatoptions+=tc
set textwidth=79

" Allow modelines
set modeline

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
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ 10

" airline
let g:airline_powerline_fonts=1
let g:airline_theme='light'
let g:airline_detect_modified=1
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#syntastic#enabled=1

" ctrlp
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/](\.(git|hg|svn)|node_modules|tmp|dist)$',
    \ 'file': '\v\.(exe|so|dll|class)$',
    \ }
let g:ctrlp_working_path_mode = 'a'

" python-mode
let g:pymode_doc = 0
set completeopt=menu

" Bug -> https://github.com/klen/python-mode/issues/342
let g:pymode_rope_lookup_project = 0
let g:pymode_rope = 0

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
