""" python {{{
setlocal expandtab
setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal textwidth=80
nnoremap <buffer> <LocalLeader>c I# <Esc>
iabbrev  <buffer> iff if:hli
" }}}
""" plugin {{{
"" pep8
let s:hooks = neobundle#get_hooks('pep8')
function! s:hooks.on_source(hooks)
  let g:pep8_map = '<F8>'
endfunction
"" jedi-vim
let s:hooks = neobundle#get_hooks('jedi-vim')
function! s:hooks.on_source(hooks)
  let g:jedi#usages_command = '<leader>U'
  let g:jedi#rename_command = '<leader>R'
  let g:jedi#use_tabs_not_buffers = 1
  setlocal completeopt-=preview
endfunction
"" ale
let g:ale_linters = {
\ 'python': ['pylint']
\}
" }}}
