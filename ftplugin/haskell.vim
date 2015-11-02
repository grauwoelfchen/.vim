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
let s:hooks = neobundle#get_hooks('ghcmod-vim')
function! s:hooks.on_source(hooks)
  let g:haskell_jmacro = 0
  let g:haskell_conceal = 0
  let g:haskell_multiline_strings = 1
endfunction
" }}}
