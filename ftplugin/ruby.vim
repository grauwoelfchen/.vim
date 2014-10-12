""" ruby {{{
setlocal dictionary=$HOME/.vim/dict/ruby.dict
"setlocal omnifunc=rubycomplete#Complete
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1
let g:ruby_fold = 1
"" ri.vim
"" split 0 => h, 1 => v
nnoremap <Leader>rh :call ri#OpenSearchPrompt(0)<CR>
nnoremap <Leader>rv :call ri#OpenSearchPrompt(1)<CR>
nnoremap <Leader>rk :call ri#LookupNameUnderCursor()<CR>
if &filetype == "ruby"
  "" syntax check
  compiler ruby
  setlocal makeprg=ruby\ -c\ %
  augroup syntax_check
    autocmd!
    autocmd BufWritePost <buffer> silent make! -c % | cwindow | redraw!
  augroup END
endif
" }}}
