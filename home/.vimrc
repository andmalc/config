
"" GENERAL SETTINGS {{{1
set nocompatible
set hidden
set foldmethod=marker
set sw=4
set ts=4
set smarttab


"" Plugins & FILETYPE HANDLING {{{1
filetype plugin indent on


filetype off
set rtp+=~/.vim/bundle/vundle/
set rtp+=~/.vim/bundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
"Bundle 'scrooloose/nerdtree'
"Bundle 'klen/python-mode'
Bundle 'davidhalter/jedi-vim'
"Bundle 'Valloric/YouCompleteMe'


filetype plugin indent on

" Jedi (with PyFlakes)
let g:jedi#popup_on_dot = 0
highlight SpellBad term=underline gui=undercurl guisp=Orange 

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

map <leader>~ :NERDTreeToggle<CR>
map <leader>s :w<CR>
"map <leader>s :w<CR>
noremap ; :
imap <leader>s <ESC>:w<CR>
map ss :w<CR> \| :!python %<CR>

map ,H	:e $HOME/
map ,N	:e $HOME/notes/
map ,T	:set titlestring=

map <F2> :w<CR>
imap <F2> :w<CR>
imap <S-F2> :wall<CR>
map <F3> :b #<CR>
map <F4> :bn<CR>
map <S-F4> :bp<CR>
map <F5> :bw<CR>
" copy/paste selection/line to X CLIPBOARD
"ap <F6> "+y
"ap <S-F6> "+p  
"requires xclip:
vmap <F6> :!xclip -f -sel clip<CR>

" copy/paste selection/line to X Primary
"map <F7> "*y
"map <S-F7> "*p
"requires xclip:
map <F7> :-1r !xclip -o -sel clip<CR>

" map ## :e ~/.screen/screen_exchange<CR>


