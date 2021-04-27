" so ~/config/dotfiles/vim/.vim/myvimfunctions.vim
"set foldtext=CustomFoldText()
autocmd BufRead,BufNewFile /home/andmalc/notes/* setlocal foldmethod=marker
autocmd BufRead,BufNewFile /home/andmalc/config/* setlocal foldmethod=marker
autocmd BufRead,BufNewFile /home/andmalc/.* setlocal foldmethod=marker


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

" sane text files
set fileformat=unix
set encoding=utf-8

" relative line numbering - see # of line from insertion point
" set rnu 


" Read lines at bottom of file for settings
" set modeline #default is on
" set modelines=5 # default

" Interface {{{1

" Mouse mode
" Allows scrolling and positioning cursor with mouse
set mouse=a

set splitbelow
set splitright

"set cursorline


" Statusline
" Bar at bottom of window
" 1 Show when more than one window open
" 2 Show always, not just when window split
set laststatus=2


set bg=dark

" Vundle {{{1
 
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" My plugins

" Folding plugins {{{2
"
" Outliner
Plugin 'vim-voom/voom'

" Folding for MD files
Plugin 'nelstrom/vim-markdown-folding'
" Default fold syle is 'stacked' (shows all headings). 'nested' is shows h1 only
" let g:markdown_fold_style = 'nested'

" https://github.com/tmhedberg/SimpylFold
Plugin 'tmhedberg/SimpylFold'
let g:SimpylFold_docstring_preview = 1


" Python plugins {{{2

" Plugin 'vim-scripts/indentpython.vim'

" PyFlakes
" Plugin 'vim-scripts/pyflakes.vim'

" YouCompleteMe, replaces jedi-vim
" Plugin 'Valloric/YouCompleteMe'
" Installation instructions:  https://github.com/Valloric/YouCompleteMe#linux-64-bit
"
" ensures that the autocomplete window goes away when done
" let g:ycm_autoclose_preview_window_after_completion=1
" shortcut for goto definition
" map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" switch off ycm for text markup formats
" let g:ycm_filetype_blacklist = {'asciidoc': 0, 'text': 0, 'markdown': 0}

"virtualenv support for YouCompleteMe
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

 Plugin 'vim-syntastic/syntastic'

" Misc plugins {{{2

" Ansible
" Bundle 'chase/vim-ansible-yaml'

" Vim Fish
" https://github.com/dag/vim-fish
"
Plugin 'dag/vim-fish.git'

" Fugitive - Git tools
" https://github.com/tpope/vim-fugitive
Plugin 'tpope/vim-fugitive.git'


" Interface plugins {{{2
"
" Statusline
" Plugin 'vim-airline/vim-airline'
" Plugin 'vim-airline/vim-airline-themes'
"
" Lightline
" https://github.com/itchyny/lightline.vim
" Plugin 'itchyny/lightline.vim'


" Colorscheme Plugins  {{{2
" Plugin 'Lokaltog/vim-distinguished'
" Plugin 'altercation/vim-colors-solarized'
" Plugin 'jnurmine/Zenburn'
" Plugin 'chriskempson/base16-vim'

" Moonfly
" dark color scheme for Vim and Neovim
" https://github.com/bluz71/vim-moonfly-colors
" Plugin 'bluz71/vim-moonfly-colors'

" Lucius
" Plugin 'jonathanfilip/vim-lucius'
" let g:lucius_no_term_bg = 1
" LuciusBlackLowContrast
" For darcolors
"
" https://github.com/flazz/vim-colorschemes
Plugin 'flazz/vim-colorschemes'

" End of Vundle Bundles
call vundle#end()
filetype plugin indent on


" Colorschemes {{{1
" Set colorscheme

" BG informs Vim of terminal bg, causing it to adjust colors
" Can be overriden by a color scheme
" https://vi.stackexchange.com/questions/12104/what-does-set-background-dark-do
set background=dark


if filereadable(expand("~/.vimrc_background"))
      let base16colorspace=256
      source ~/.vimrc_background
endif

colorscheme default


" colorscheme moonfly
" let g:moonflyCursorColor = 1
" let g:moonflyTerminalColors = 1


"colorscheme zenburn
" colorscheme solarized

" File format {{{1


" Python & other language settings {{{1

let python_highlight_all=1

"au BufNewFile,BufRead *.py  set tabstop=4 softtabstop=4  shiftwidth=4 textwidth=7  expandtab  autoindent

"au BufNewFile,BufRead *.js, *.html, *.css set tabstop=2 softtabstop=2 shiftwidth=2


" Mapping {{{1
" To run normal or command mode commands from Insert Mode, enter: ctrl+v[Escape key]:command
" Candidates: func, Shift+func, '_' or ',' + any other char
" lhs notation:
" 	<C-A>	CTRL-A
" 	<M-A>	Alt-A
" 	<S-F2> Shift F2

" Candidate leaders: - H L space ctrl cr
let mapleader = " "

map ,f	<PageDown>
map <leader>s :w<CR>
"imap <leader>s <ESC>:w<CR>
"noremap ; :

map ,H	:e $HOME/
map ,N	:e $HOME/notes/
map ,T	:set titlestring=


" Buffers {{{2
"
map <leader>x :suspend<CR>
map <leader>bn :bn<CR>
map <leader>bp :bp<CR>
map <leader>bw :bw<CR>

" ctrl-s to save
map <C-s> :w<CR>
map! <C-s> <Esc>:w<CR>

" map sudo-write-file to w!! in command line
cmap w!! %!sudo tee > /dev/null %


" Selection Copy Paste {{{2
"
" map cut & paste to what they bloody should be
vnoremap <C-c> "+y
vnoremap <C-x> "+x
" paste before cursor
"imap <C-v> "+gP


" copy/paste selection/line to X CLIPBOARD
"ap <F6> "+y
"ap <S-F6> "+p  
"requires xclip:
" vmap <F6> :!xclip -f -sel clip<CR>

" copy/paste selection/line to X Primary
"map <F7> "*y
"map <S-F7> "*p
"requires xclip:
" map <F7> :-1r !xclip -o -sel clip<CR>

" Editing {{{2
"
"remap jj to escape in insert mode.
inoremap jj <Esc>

" move up/down by visible lines on long wrapped lines of text
nnoremap k gk
nnoremap j gj

" make Y yank to end of line (consistent with C and D)
noremap Y y$

" make Q do somethign useful - format para
noremap Q gq}

" Search {{{1

" Make searches case-sensitive only if they contain upper-case characters
set ignorecase
set smartcase
" show search matches as the search pattern is typed
set incsearch
" search-next wraps back to start of file
set wrapscan
" highlight last search matches
set hlsearch
" map key to dismiss search highlightedness
map <bs> :noh<CR>
" centre search match
noremap n nzz
noremap N Nzz

