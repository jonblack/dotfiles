scriptencoding utf-8

"-----------------------------------------------------------------------------
" Plugins
"-----------------------------------------------------------------------------

call plug#begin('~/.local/share/nvim/plugged')

" command extension
Plug 'junegunn/vim-easy-align'
Plug 'osyo-manga/vim-over'

" completion/templating
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'artur-shaik/vim-javacomplete2'
Plug 'dhruvasagar/vim-table-mode'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'sebastianmarkow/deoplete-rust'
Plug 'zchee/deoplete-jedi'

" find/search
Plug 'mileszs/ack.vim'
Plug 'thinca/vim-qfreplace'

" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" language support
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'udalov/kotlin-vim', { 'for': 'kotlin' }

" look
Plug 'Yggdroot/indentLine'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'mattn/emmet-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" navigation
Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'vim-scripts/kwbdi.vim'

" themes
Plug 'chriskempson/base16-vim'

call plug#end()

"-----------------------------------------------------------------------------
" General
"-----------------------------------------------------------------------------

set cpoptions+=$
set cursorline
set encoding=utf-8
set expandtab
set hidden
set hlsearch
set ignorecase
set incsearch
set list listchars=tab:→\ ,trail:·
set nobackup
set noswapfile
set nowrap
set number
set pastetoggle=<F3>
set scrolloff=10
set shell=bash
set shiftwidth=4
set tabstop=4

let mapleader=","

autocmd BufWritePre * :%s/\s\+$//e

"-----------------------------------------------------------------------------
" GUI
"-----------------------------------------------------------------------------

set termguicolors
set background=dark
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ 11

colorscheme base16-gruvbox-dark-pale

let &colorcolumn=join(range(100,999), ",")

"-----------------------------------------------------------------------------
" Plugin Settings
"-----------------------------------------------------------------------------

" airline
let g:airline_powerline_fonts=1
let g:airline_detect_modified=1
let g:airline#extensions#branch#enabled=1

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

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#rust#racer_binary='/home/jon/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path='/home/jon/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'

" indentLine
let g:indentLine_color_gui = '#343D46'

" javacomplete2
autocmd FileType java setlocal omnifunc=javacomplete#Complete
nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
imap <F4> <Plug>(JavaComplete-Imports-AddSmart)
nmap <F5> <Plug>(JavaComplete-Imports-Add)
imap <F5> <Plug>(JavaComplete-Imports-Add)
nmap <F6> <Plug>(JavaComplete-Imports-AddMissing)
imap <F6> <Plug>(JavaComplete-Imports-AddMissing)
nmap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
imap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)

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
