" General {{{1

set nocompatible
set hidden
set foldmethod=marker

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" enable automatic yanking to and pasting from the selection
set clipboard+=unnamed


" Vundle {{{1
 
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'dart-lang/dart-vim-plugin'

" Outliner
Plugin 'VOom'

" Ansible
Bundle 'chase/vim-ansible-yaml'

" Folding for MD files
Plugin 'nelstrom/vim-markdown-folding'
" Default fold syle is 'stacked' (shows all headings). 'nested' is shows h1 only
" let g:markdown_fold_style = 'nested'

Plugin 'altercation/vim-colors-solarized'

" Gundo - undo graph http://sjl.bitbucket.org/gundo.vim/ 
Plugin 'https://github.com/sjl/gundo.vim.git'

" Fugitive - Git tools
" https://github.com/tpope/vim-fugitive
Plugin 'tpope/vim-fugitive.git'

" Distinguished Colorscheme
Plugin 'Lokaltog/vim-distinguished'

" Colorschemes
Plugin 'jonathanfilip/vim-lucius'

" PyFlakes
Plugin 'vim-scripts/pyflakes.vim'

" Jedi
Plugin 'davidhalter/jedi-vim'

" Plugin 'Valloric/YouCompleteMe'

" try next:
" klen/python-mode

"Bundle 'saltstack/salt-vim'
" Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
"Bundle 'scrooloose/nerdtree'
"Bundle 'klen/python-mode'

" End of Vundle Bundles
call vundle#end()

" Plugin Config {{{1

"YouCompleteMe options, replace jedi-vim
" jump to definition
nnoremap <leader>t :YcmCompleter GoToDefinitionElseDeclaration<CR>
" close stupid preview window thing
let g:ycm_autoclose_preview_window_after_completion=1
" could also do set completeopt-=preview
" to kill it completely..

" switch off ycm for text markup formats
let g:ycm_filetype_blacklist = {'asciidoc': 0, 'text': 0, 'markdown': 0}


" PyFlakes  
" Jedi (with PyFlakes)
" PyFlakes let g:jedi#popup_on_dot = 0
highlight SpellBad term=underline gui=undercurl guisp=Yellow 

" Appearance {{{1
" Colors {{{2

" Lucius
"let g:lucius_no_term_bg = 1
"colorscheme lucius
" For dark background terminals
" Elflord is also good
"LuciusBlack



"set background=light
" Use 256 color mode
" If can't find do cp ~/.vim/bundle/vim-colors-solarized/colors/solarized.vim  ~/.vim/colors/
"let g:solarized_termcolors=256  
" Prevents 'selected' appearance on transparent backgrounds
"let g:solarized_termtrans=1

if has('gui_running')
    set background=light
else
    set background=dark
endif

colorscheme solarized

" Interface {{{2

set ruler
set wildmenu
set scrolloff=3

" files to hide in directory listings
let g:netrw_list_hide='\.py[oc]$,\.svn/$,\.git/$,\.hg/$'
set wildignore+=*.pyc

" Statusline {{{2
set laststatus=2
set statusline=
" filename, relative to cwd
set statusline+=%f
" separator
set statusline+=\ 

" modified flag
set statusline+=%#wildmenu#
set statusline+=%m
set statusline+=%*

"Display a warning if file encoding isnt utf-8
set statusline+=%#question#
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
set statusline+=%*

"display a warning if fileformat isnt unix
set statusline+=%#directory#
set statusline+=%{&ff!='unix'?'['.&ff.']':''}
set statusline+=%*

"display a warning if files contains tab chars
set statusline+=%#warningmsg#
set statusline+=%{StatuslineTabWarning()}
set statusline+=%*

"display a warning for any syntastic syntax errors
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

" read-only
set statusline+=%r
set statusline+=%*

" right-align
set statusline+=%=

" filetype
set statusline+=%{strlen(&ft)?&ft:'none'}
" separator
set statusline+=\ 

" current char
set statusline+=%3b,0x%02B
" separator
set statusline+=\ 

" column,
set statusline+=%2c,
" current line / lines in file
set statusline+=%l/%L

" always show status line
set laststatus=2

" return '[tabs]' if tab chars in file, or empty string
function! StatuslineTabWarning()
    if !exists("b:statusline_tab_warning")
        let tabs = search('\t', 'nw') != 0

        if tabs
            let b:statusline_tab_warning = '[tabs]'
        else
            let b:statusline_tab_warning = ''
        endif
    endif
    return b:statusline_tab_warning
endfunction
"recalculate the tab warning flag when idle and after writing
autocmd cursorhold,bufwritepost * unlet! b:statusline_tab_warnin



" Cursor {{{2
" Cursor line off in Insert mode
set cursorline
" autocmd InsertEnter,InsertLeave * set cul!

"au InsertLeave * hi Cursor guibg=red
"au InsertEnter * hi Cursor guibg=green

" Long line handling {{{2


" display long lines as wrapped
set wrap

" wrap at word breaks
set linebreak
" show an ellipsis at the start of wrapped lines
set showbreak=+++


" discretely highlight lines which are longer than the specified width
" only long lines are highlighted (making this less intrusive than colorcolumn)
" width defaults to 80. pass 0 to turn off.
function! s:HighlightLongLines(width)
    let targetWidth = a:width != '' ? a:width : 80
    if targetWidth > 0
        exec 'match ColorColumn /\%' . (targetWidth + 1) . 'v/'
    else
        exec 'match'
    endif
endfunction


" toggle the highlighting of long lines
command! -nargs=? HighlightLongLines call s:HighlightLongLines('<args>')
let s:highlight_long_lines = 0
function! ToggleHighlightLongLines()
    if s:highlight_long_lines == 0
        HighlightLongLines
        let s:highlight_long_lines = 1
    else
        HighlightLongLines 0
        let s:highlight_long_lines = 0
    endif
endfunction
noremap <leader>L :call ToggleHighlightLongLines()<cr>


" toggle wrapped appearance of long lines
function! ToggleWrap()
    if &wrap == 0
        set wrap
    else
        set nowrap
    endif
endfunction
noremap <leader>w :call ToggleWrap()<cr>

" allow cursor keys to go right off end of one line, onto start of next
set whichwrap+=<,>,[,]

" Line Numbering {{{2

" toggle relative line numbering
let s:relative_numbering = 0
function! ToggleNumbering()
    if s:relative_numbering == 0
        exec 'set relativenumber'
        let s:relative_numbering = 1
    else
        exec 'set number'
        let s:relative_numbering = 0
    endif
endfunction
noremap <leader>r :call ToggleNumbering()<cr>



"Read local config {{{1

if filereadable(glob("~/.vimrc.chromeshell")) 
	source ~/.vimrc.chromeshell
endif

" Syntax {{{1

" Enable ft detection and enable language-dependent indenting 
filetype plugin indent on

syntax on

" allegedly faster regex engine for syntax stuff
set regexpengine=1 

"make sure highlighting works all the way down long files
autocmd BufEnter * :syntax sync fromstart

" switch on colourful brackets
let g:rainbow_active = 1




" Py Other {{{2
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

" map ## :e ~/.screen/screen_exchange<CR>


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
