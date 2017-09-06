so ~/config/dotfiles/vim/.vim/myvimfunctions.vim
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

" Wrap at character in 'breakat' rather than at last character on screen
set linebreak


" relative line numbering - see # of line from insertion point
set rnu 


" Read lines at bottom of file for settings
" set modeline #default is on
" set modelines=5 # default

" Vundle {{{1
 
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" My plugins

" Folding plugins {{{2
"
" Outliner
Plugin 'VOom'

" Rec for Py coding
Plugin 'tmhedberg/SimpylFold'
" https://github.com/tmhedberg/SimpylFold
let g:SimpylFold_docstring_preview = 1
autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<

" Folding for MD files
Plugin 'nelstrom/vim-markdown-folding'
" Default fold syle is 'stacked' (shows all headings). 'nested' is shows h1 only
" let g:markdown_fold_style = 'nested'

" Tools plugins {{{2

" Gundo - undo graph http://sjl.bitbucket.org/gundo.vim/ 
Plugin 'https://github.com/sjl/gundo.vim.git'

" Fugitive - Git tools
" https://github.com/tpope/vim-fugitive
Plugin 'tpope/vim-fugitive.git'


" PyFlakes
" Plugin 'vim-scripts/pyflakes.vim'

" Jedi
" Plugin 'davidhalter/jedi-vim'

" Ansible
" Bundle 'chase/vim-ansible-yaml'



" YouCompleteMe options, replace jedi-vim
" Plugin 'Valloric/YouCompleteMe'
" ensures that the autocomplete window goes away when done
" let g:ycm_autoclose_preview_window_after_completion=1
" shortcut for goto definition
" map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" switch off ycm for text markup formats
" let g:ycm_filetype_blacklist = {'asciidoc': 0, 'text': 0, 'markdown': 0}


" PyFlakes  
" Jedi (with PyFlakes)
" PyFlakes let g:jedi#popup_on_dot = 0
" highlight SpellBad term=underline gui=undercurl guisp=Yellow 

" Interface plugins {{{2
"
" Statusline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'


" Colorscheme Plugins  {{{2
Plugin 'Lokaltog/vim-distinguished'
Plugin 'altercation/vim-colors-solarized'
Plugin 'jnurmine/Zenburn'

" Moonfly
" dark color scheme for Vim and Neovim
" https://github.com/bluz71/vim-moonfly-colors
Plugin 'bluz71/vim-moonfly-colors'

" Lucius
Plugin 'jonathanfilip/vim-lucius'
let g:lucius_no_term_bg = 1
" LuciusBlackLowContrast
" For darcolors


" End of Vundle Bundles
call vundle#end()
filetype plugin indent on

" Interface {{{1

" Set colorscheme

colorscheme moonfly
let g:moonflyCursorColor = 1
let g:moonflyTerminalColors = 1

if has('gui_running')
    set guifont=Hack\ Regular\ 11
    set background=light
else
    set background=dark
endif

set cursorline


" Statusline {{{1
" Show always, not just when window split
" set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='luna'


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
map <leader>s :w<CR>
imap <leader>s <ESC>:w<CR>
noremap ; :

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

" Windows Panes {{{2
"
" aliases for window switching
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
noremap <C-k> <C-w>k
noremap <C-j> <C-w>j

" splitting
nnoremap <silent> <leader>sp :split<CR>
nnoremap <silent> <leader>v :vsplit<CR>
nnoremap <silent> <leader>q :close<CR>

" create tab pane at top
nnoremap <silent> <leader>t :$tabnew<CR>

" Selection Copy Paste {{{2
"
" map cut & paste to what they bloody should be
vnoremap <C-c> "+y
vnoremap <C-x> "+x
" paste before cursor
imap <C-v> "+gP


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

" Nvim features {{{1
"

if has("nvim")
        " live substitution previews
        set inccommand=nosplit

        " Control + Q to quit all
        noremap <C-q> :confirm qall<CR>

        " new tab
        noremap <silent> <A-t> :$tabnew<CR>
endif
