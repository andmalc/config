"" GENERAL SETTINGS {{{1
set nocompatible
set hidden
set foldmethod=marker

syntax enable

" Use 256 color mode
" If can't find do cp ~/.vim/bundle/vim-colors-solarized/colors/solarized.vim
" ~/.vim/colors/
set t_Co=256
let g:solarized_termcolors=256  
set background=dark
colorscheme solarized

set ai
set ts=3
set sw=3
set sts=3

" Plugins & FILETYPE HANDLING {{{1
"
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/vundle'
Plugin 'chase/vim-ansible-yaml'
Plugin 'dart-lang/dart-vim-plugin'

" Outliner
Plugin 'VOom'

" Folding for MD files
Plugin 'nelstrom/vim-markdown-folding'
" Default fold syle is 'stacked' (shows all headings). 'nested' is shows h1 only
" let g:markdown_fold_style = 'nested'

Plugin 'altercation/vim-colors-solarized'

" try next:
" klen/python-mode

"Bundle 'saltstack/salt-vim'
" Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
"Bundle 'scrooloose/nerdtree'
"Bundle 'klen/python-mode'
" Bundle 'davidhalter/jedi-vim'
"Bundle 'Valloric/YouCompleteMe'

" End of Vundle Bundles
call vundle#end()

filetype plugin indent on
" Jedi (with PyFlakes)
"PyFlakes let g:jedi#popup_on_dot = 0
" highlight SpellBad term=underline gui=undercurl guisp=Orange 

"  Python-mode
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)


""" MAPPING {{{1
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

map ,H	:e $HOME/
map ,N	:e $HOME/notes/
map ,T	:set titlestring=

map <leader>x :suspend<CR>
map <leader>bn :bn<CR>
map <leader>bp :bp<CR>
map <leader>bw :bw<CR>
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

" map ## :e ~/.screen/screen_exchange<CR>


