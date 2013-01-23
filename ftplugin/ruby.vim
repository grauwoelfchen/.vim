""" ruby {{{
setlocal dictionary=$HOME/.vim/dict/ruby.dict
"setlocal omnifunc=rubycomplete#Complete
let g:rubycomplete_buffer_loading=1
let g:rubycomplete_classes_in_global=1
let g:rubycomplete_rails=1
let g:ruby_fold=1
if &filetype == "ruby"
  "" syntax check
  compiler ruby
  setlocal makeprg=ruby\ -c\ %
  augroup syntax_check
    autocmd!
    autocmd BufWritePost <buffer> silent make! -c % | redraw!
  augroup END
endif
" }}}
