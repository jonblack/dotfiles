scriptencoding utf-8

"-----------------------------------------------------------------------------
" Plugins
"-----------------------------------------------------------------------------
call plug#begin('~/.local/share/nvim/plugged')

" completion/templating
Plug 'dhruvasagar/vim-table-mode'
Plug 'Raimondi/delimitMate'
Plug 'scrooloose/nerdcommenter'
Plug 'w0rp/ale'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" find/search
Plug 'osyo-manga/vim-over'
Plug 'thinca/vim-qfreplace'

" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" language support
Plug 'rust-lang/rust.vim', { 'for': 'rust' }

" look
Plug 'Yggdroot/indentLine'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
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

colorscheme base16-gruvbox-dark-soft

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

" indentLine
let g:indentLine_color_gui = '#343D46'

" deoplete
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('sources', {
      \ '_': ['ale', 'buffer', 'around'],
      \})

" ale
let g:ale_linters = {'rust': ['rls']}
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_column_always = 1
let g:ale_open_list = 1
let g:ale_completion_enabled = 0
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

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
