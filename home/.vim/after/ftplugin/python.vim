setlocal autoindent
setlocal tabstop=4
setlocal shiftwidth=4
setlocal smarttab
setlocal expandtab
setlocal formatoptions=croql " c:auto-wrap comments, r:auto insert comment leader after Enter, o:insert comment leader after o/O in Normal mode, q:format comments with gq, l: long lines not broken with textwidth


"let g:pymode = 1
"let g:pymode_rope = 1
"
"" Documentation
"let g:pymode_doc = 1
"let g:pymode_doc_key = 'K'
"
""Linting
"let g:pymode_lint = 1
"let g:pymode_lint_checker = "pyflakes,pep8"
"" Auto check on save
"let g:pymode_lint_write = 1
"
"" Support virtualenv
"let g:pymode_virtualenv = 0
"
"" Enable breakpoints plugin
"let g:pymode_breakpoint = 1
"let g:pymode_breakpoint_key = '<leader>b'
"
"" syntax highlighting
"let g:pymode_syntax = 1
"let g:pymode_syntax_all = 1
"let g:pymode_syntax_indent_errors = g:pymode_syntax_all
"let g:pymode_syntax_space_errors = g:pymode_syntax_all
"
"" Don't autofold code
"let g:pymode_folding = 1
"
" END of PYMODE

" Jedi 
"let g:jedi#auto_initialization=1
"" let g:jedi#auto_vim_configuration = 0
"let g:jedi#autocompletion_command = "<C n>"
"let g:jedi#popup_on_dot = 1
"
