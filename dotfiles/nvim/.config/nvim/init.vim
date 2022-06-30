" General {{{1

set nocompatible
set hidden

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" enable automatic yanking to and pasting from the selection
set clipboard+=unnamed

" mouse support
set mouse=n

" Wrap at character in 'breakat' rather than at last character on screen
set linebreak

" Tabs
set ai
set ts=4
set sw=4
set sts=4
set noexpandtab

" Don't load netrw
let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1

"set runtimepath^=~/.vim runtimepath+=~/.vim/after
"let &packpath = &runtimepath
"source ~/.vimrc

" vim-plug {{{1
"

if has("autocmd")
  filetype plugin indent on
endif

filetype plugin on
set foldmethod=marker
#let g:markdown_folding=1

call plug#begin()

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

"Plug 'nelstrom/vim-markdown-folding'

" Buffer Tree Explorer 
" https://github.com/el-iot/buffer-tree-explorer
" Launch with 'Tree'
Plug 'el-iot/buffer-tree-explorer'

call plug#end()
