""" python {{{
setlocal expandtab
setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal textwidth=80
setlocal omnifunc=pythoncomplete#Complete

nnoremap <buffer> <LocalLeader>c I# <Esc>
iabbrev  <buffer> iff if:hli
" }}}

""" plugin {{{
"" pep8
let s:hooks = neobundle#get_hooks('pep8')
function! s:hooks.on_source(hooks)
  let g:pep8_map = '<F8>'
endfunction
" }}}
