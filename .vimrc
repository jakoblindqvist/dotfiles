set nocompatible
filetype off
set rtp+=~/.vim/
call plug#begin()
  Plug 'itchyny/lightline.vim'
  Plug 'NLKNguyen/papercolor-theme'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-eunuch'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-surround'
  Plug 'w0rp/ale'
  Plug 'rhysd/vim-clang-format'
  Plug 'leafgarland/typescript-vim'
  Plug 'preservim/nerdtree'
  Plug 'darrikonn/vim-gofmt'
call plug#end()

filetype plugin indent on

" Integrate clang-format.
let g:clang_format#command = "/usr/bin/clang-format"
autocmd FileType c ClangFormatAutoEnable
autocmd FileType h ClangFormatAutoEnable
autocmd FileType cpp ClangFormatAutoEnable
autocmd FileType hpp ClangFormatAutoEnable

" Set linters in ale.
let b:ale_linters = {
\    'cpp': ['clang-format', 'clangtidy'],
\    'tex': ['chktex'],
\    'python': ['flake8']
\   }

" Configuration for lightline.
set laststatus=2
set noshowmode

autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Reload file if it was changed outside of vim but not inside.
set autoread

" Easier movement between splits.
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Quickly press jk or Ctrl-l to exit insert mode.
imap jk <Esc>
imap <C-l> <Esc>

" Enable syntax highlight
syntax on

" Disable terminal bell (both sound and audio).
set vb t_vb=

" Insert spaces when tab is pressed.
set expandtab

" The size of a tab character.
set tabstop=4

" Number of leading spaces to delete when tab is pressed.
set softtabstop=4

" Number of spaces to insert when tab is pressed.
set shiftwidth=4

" Enable 256 colors.
set t_Co=256

" Show column at width 80 (default).
set colorcolumn=80

" Show line numbers in left margin.
set number

" PaperColor options.
let g:PaperColor_Theme_Options = {
  \   'theme': {
  \     'default.dark': {
  \       'override': {
  \       }
  \     }
  \   }
  \ }
set background=dark
colorscheme PaperColor

" Highlight trailing whitespace.
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Increase cursor visibility.
augroup CursorLine
	au!
	au VimEnter * setlocal cursorline
	au WinEnter * setlocal cursorline
	au BufWinEnter * setlocal cursorline
	au WinLeave * setlocal nocursorline
augroup END

" Automatically reload .vimrc.
augroup myvimrc
	au!
	au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

" Make vim use the system clipboard by default (requires +clipboard).
set clipboard=unnamedplus

" NERDTree bindings
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Shortcuts for tab pages
nnoremap th  :tabfirst<CR>
nnoremap tk  :tabnext<CR>
nnoremap tj  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>
" Alternatively use
" "nnoremap th :tabnext<CR>
" "nnoremap tl :tabprev<CR>
" "nnoremap tn :tabnew<CR>
