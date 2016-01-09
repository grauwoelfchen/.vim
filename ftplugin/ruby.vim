""" ruby {{{
setlocal dictionary=$HOME/.vim/dict/ruby.dict
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
