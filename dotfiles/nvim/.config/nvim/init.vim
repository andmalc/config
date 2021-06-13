" General {{{1

set nocompatible
set hidden
set foldmethod=marker

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" enable automatic yanking to and pasting from the selection
set clipboard+=unnamed

" Wrap at character in 'breakat' rather than at last character on screen
set linebreak

" Tabs
set ai
set ts=4
set sw=4
set sts=4
set expandtab


"set runtimepath^=~/.vim runtimepath+=~/.vim/after
"let &packpath = &runtimepath
"source ~/.vimrc

" vim-plug {{{1
"
call plug#begin()


" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'


call plug#end()
