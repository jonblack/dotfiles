set nocompatible
filetype off

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

Plugin 'Lokaltog/powerline-fonts'
Plugin 'aklt/plantuml-syntax'
Plugin 'bling/vim-airline'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'flazz/vim-colorschemes'
Plugin 'hallison/vim-markdown'
Plugin 'jceb/vim-orgmode'
Plugin 'kien/ctrlp.vim'
Plugin 'klen/python-mode'
Plugin 'nelstrom/vim-markdown-folding'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-scripts/kwbdi.vim'
Plugin 'vim-scripts/speeddating.vim'
Plugin 'wting/rust.vim'

call vundle#end()

"-----------------------------------------------------------------------------
" General
"-----------------------------------------------------------------------------

syntax on
filetype plugin indent on
set number
set encoding=utf-8
set list listchars=tab:→\ ,trail:·
set hlsearch
let mapleader=","
set nowrap
set cpoptions+=$
set tabstop=2
set shiftwidth=2
set expandtab
set hidden

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
    " Set the theme type depending on the time of day
    if strftime("%H") < 20
      set background=light
    else
      set background=dark
    endif
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
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ 12

" airline
let g:airline_powerline_fonts=1
let g:airline_theme='light'
let g:airline_enable_syntastic=1
let g:airline_detect_modified=1
let g:airline_enable_branch=1

" ctrlp
let g:ctrlp_custom_ignore = {
    \ 'file': '\v(\.class)$'}

" python-mode
let g:pymode_doc = 0
set completeopt=menu

" Bug -> https://github.com/klen/python-mode/issues/342
let g:pymode_rope_lookup_project = 0
