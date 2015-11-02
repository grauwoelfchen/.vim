""" latex {{{
" }}}

""" plugin {{{
"" vim-latex
let s:hooks = neobundle#get_hooks('vim-latex')
function! s:hooks.on_source(hooks)
  let g:Tex_CompileRule_dvi = 'latex $*'
  let g:Tex_ViewRule_dvi = 'xdvi'
endfunction
" }}}
