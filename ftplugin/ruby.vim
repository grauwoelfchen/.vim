""" ruby {{{
setlocal dictionary=$HOME/.vim/dict/ruby.dict
"setlocal omnifunc=rubycomplete#Complete
let g:rubycomplete_buffer_loading=1
let g:rubycomplete_classes_in_global=1
let g:rubycomplete_rails=1
let g:ruby_fold=1
augroup syntax_check
  autocmd!
  autocmd Filetype ruby setlocal makeprg=ruby\ -c\ %
  autocmd BufWrite *.rb w !ruby -c
augroup END
" }}}
