scriptencoding utf-8

"-----------------------------------------------------------------------------
" Plugins
"-----------------------------------------------------------------------------

call plug#begin('~/.local/share/nvim/plugged')

" completion/templating
Plug 'dhruvasagar/vim-table-mode'
Plug 'Raimondi/delimitMate'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-syntastic/syntastic'

" find/search
Plug 'osyo-manga/vim-over'
Plug 'thinca/vim-qfreplace'

" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" language support
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'racer-rust/vim-racer'

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

" vim-racer
let g:racer_cmd = "/home/jon/.cargo/bin/racer"
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

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
