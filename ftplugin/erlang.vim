""" erlang {{{
setlocal makeprg=escript\ %
setlocal errorformat=%f:%l:%m
augroup syntax_check
  autocmd!
  autocmd BufWritePost <buffer> silent make! -c % | redraw!
augroup END
"}}}
