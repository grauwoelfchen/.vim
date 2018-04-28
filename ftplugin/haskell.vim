""" haskell {{{
set tabstop=8
set softtabstop=4
set shiftwidth=4
set shiftround
"set nocindent
nnoremap <Leader>o i{-# OPTIONS_GHC -Wall -Werror #-}<Esc>
" }}

""" plugin {{{
"" ghcmod
let g:haskell_jmacro = 0
let g:haskell_conceal = 0
let g:haskell_multiline_strings = 1
" }}}
