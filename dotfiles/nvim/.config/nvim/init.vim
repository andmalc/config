" General {{{1

set undodir=~/.config/nvim/undodir
set undofile

set foldmethod=marker

" relative line numbering
set rnu

set hidden

" Wrap at character in 'breakat' rather than at last character on screen
set linebreak

" Disable bell noises
set visualbell

" Tabs
set ai
set ts=4
set sw=4
set sts=4
set noexpandtab

" Don't load netrw
" let g:loaded_netrw       = 1
" let g:loaded_netrwPlugin = 1

"set runtimepath^=~/.vim runtimepath+=~/.vim/after
"let &packpath = &runtimepath
"source ~/.vimrc

" vim-plug {{{1
"
if has("autocmd")
  filetype plugin indent on
endif

filetype plugin on

call plug#begin()

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

"Plug 'nelstrom/vim-markdown-folding'

" Buffer Tree Explorer 
" https://github.com/el-iot/buffer-tree-explorer
" Launch with 'Tree'
" Plug 'el-iot/buffer-tree-explorer'

" Easy align plug-in
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


call plug#end()
