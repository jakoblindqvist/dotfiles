set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'https://github.com/tpope/vim-surround'
Plugin 'https://github.com/NLKNguyen/papercolor-theme'
Plugin 'https://github.com/w0rp/ale'
Plugin 'https://github.com/rhysd/vim-clang-format'
call vundle#end()
filetype plugin indent on

let g:clang_format#command = "/usr/bin/clang-format"

autocmd FileType c ClangFormatAutoEnable
autocmd FileType h ClangFormatAutoEnable
autocmd FileType cpp ClangFormatAutoEnable
autocmd FileType hpp ClangFormatAutoEnable

autocmd BufNewFile,BufReadPost *.md set filetype=markdown

filetype on
syntax on

set autoread
set ruler

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

imap <C-l> <Esc>
"map <F7> mzgg=G`z

syntax on
set vb t_vb=
imap jk <Esc>

set smarttab

"set tabstop=4 softtabstop=0 noexpandtab shiftwidth=4
set expandtab shiftwidth=4 softtabstop=4 tabstop=4

set colorcolumn=80
set number

set t_Co=256

set background=dark
colorscheme PaperColor

"show trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

"Cursor visibility settings
augroup CursorLine
	au!
	au VimEnter * setlocal cursorline
	au WinEnter * setlocal cursorline
	au BufWinEnter * setlocal cursorline
	au WinLeave * setlocal nocursorline
augroup END

"Automatically reload .vimrc
augroup myvimrc
	au!
	au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

