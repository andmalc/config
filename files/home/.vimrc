so ~/.vim/myvimfunctions.vim
set foldtext=CustomFoldText()
autocmd BufRead,BufNewFile /home/andmalc/notes/* setlocal foldmethod=marker
autocmd BufRead,BufNewFile /home/andmalc/config/* setlocal foldmethod=marker
autocmd BufRead,BufNewFile /home/andmalc/.* setlocal foldmethod=marker


" General {{{1

set nocompatible
set hidden
" set foldmethod=marker

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" enable automatic yanking to and pasting from the selection
set clipboard+=unnamed


" Vundle {{{1
 
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" My plugins

" Outliner
Plugin 'VOom'

" Ansible
Bundle 'chase/vim-ansible-yaml'

" Folding for MD files
Plugin 'nelstrom/vim-markdown-folding'
" Default fold syle is 'stacked' (shows all headings). 'nested' is shows h1 only
" let g:markdown_fold_style = 'nested'


" Gundo - undo graph http://sjl.bitbucket.org/gundo.vim/ 
Plugin 'https://github.com/sjl/gundo.vim.git'

" Fugitive - Git tools
" https://github.com/tpope/vim-fugitive
Plugin 'tpope/vim-fugitive.git'


" Colorschemes
Plugin 'Lokaltog/vim-distinguished'
Plugin 'altercation/vim-colors-solarized'
Plugin 'jonathanfilip/vim-lucius'
Plugin 'jnurmine/Zenburn'

" PyFlakes
" Plugin 'vim-scripts/pyflakes.vim'

" Jedi
Plugin 'davidhalter/jedi-vim'


" try next:
" klen/python-mode

"Bundle 'saltstack/salt-vim'
" Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
"Bundle 'scrooloose/nerdtree'
"Bundle 'klen/python-mode'

" SimpylFold
" https://github.com/tmhedberg/SimpylFold
" Rec for Py coding
Plugin 'tmhedberg/SimpylFold'
let g:SimpylFold_docstring_preview = 1
autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<

" YouCompleteMe options, replace jedi-vim
Plugin 'Valloric/YouCompleteMe'
" ensures that the autocomplete window goes away when done
let g:ycm_autoclose_preview_window_after_completion=1
" shortcut for goto definition
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
" switch off ycm for text markup formats
let g:ycm_filetype_blacklist = {'asciidoc': 0, 'text': 0, 'markdown': 0}


" PyFlakes  
" Jedi (with PyFlakes)
" PyFlakes let g:jedi#popup_on_dot = 0
" highlight SpellBad term=underline gui=undercurl guisp=Yellow 

" End of Vundle Bundles
call vundle#end()
filetype plugin indent on


" Colors {{{1

"if has('gui_running')
"    set background=light
"else
"    set background=dark
"endif

" Lucius
"let g:lucius_no_term_bg = 1
" colorscheme lucius
" LuciusBlackLowContrast
" For darcolors


" File format {{{1

" Tabs
set ai
set ts=4
set sw=4
set sts=4
set expandtab

" sane text files
set fileformat=unix
set encoding=utf-8

" Mapping {{{1
" To run normal or command mode commands from Insert Mode, enter: ctrl+v[Escape key]:command
" Candidates: func, Shift+func, '_' or ',' + any other char
" lhs notation:
" 	<C-A>	CTRL-A
" 	<M-A>	Alt-A
" 	<S-F2> Shift F2

" Candidate leaders: - H L space ctrl cr
let mapleader = ","
map ,f	<PageDown>
map <leader>w :wincmd 
map <leader>~ :NERDTreeToggle<CR>
map <leader>s :w<CR>
imap <leader>s <ESC>:w<CR>
noremap ; :

" ctrl-q doesnt work in console vim, so use leader-q 
" " to enter block visual mode
nnoremap <leader>q <C-Q>

map ,H	:e $HOME/
map ,N	:e $HOME/notes/
map ,T	:set titlestring=

map <leader>x :suspend<CR>
map <leader>bn :bn<CR>
map <leader>bp :bp<CR>
map <leader>bw :bw<CR>


" map cut & paste to what they bloody should be
vnoremap <C-c> "+y
vnoremap <C-x> "+x
map <C-v> "+gP

" ctrl-s to save
map <C-s> :w<CR>
map! <C-s> <Esc>:w<CR>

" move up/down by visible lines on long wrapped lines of text
nnoremap k gk
nnoremap j gj

" map sudo-write-file to w!! in command line
cmap w!! %!sudo tee > /dev/null %

"remap jj to escape in insert mode.
inoremap jj <Esc>

" make Y yank to end of line (consistent with C and D)
noremap Y y$

" make Q do somethign useful - format para
noremap Q gq}

" aliases for window switching
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
noremap <C-k> <C-w>k
noremap <C-j> <C-w>j


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

" Examples {{{1

" Harry Percival
" https://github.com/hjwp/dotfiles/tree/master/vim
