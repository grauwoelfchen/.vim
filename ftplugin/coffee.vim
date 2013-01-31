""" coffee {{{
let g:coffee_make_options = '--bare'
let g:coffee_lint_options = '-f lint.json'
let g:coffee_compile_vert = 1
augroup handle_as_coffee
  autocmd!
  autocmd BufNewFile,BufReadPost *.coffee setlocal shiftwidth=2 expandtab
augroup END
" comfile
nnoremap <silent> <C-C> :CoffeeCompile vert <CR><C-w>h
" }}}
