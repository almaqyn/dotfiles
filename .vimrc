" autoload ~/.vimrc on change
autocmd BufWritePost ~/.vimrc source %

" enter the current millenium
set nocompatible

" enable syntax and plugins
syntax on
filetype plugin on

" enable auto indent
set autoindent
" convert tab to spaces
set expandtab
" tab size
set tabstop=4
set shiftwidth=4

" load local .vimrc files if exists
set exrc
" restrict usage of some commands in non-default .vimrc files
set secure

" highlight column 80
set colorcolumn=80
highlight ColorColumn ctermbg=darkgray

" show command in the statusline
set showcmd

" show ruler
set ruler

" automatic toggling between line number modes
:set number
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
:  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
:augroup END

