""" rust {{{
" display 4 spaces as 2 spaces
" see also after/filetype/rust.vim
augroup fix_rust_indents
  autocmd!
  autocmd BufEnter * syntax match spaces /  / conceal cchar= 
augroup END
set concealcursor=nvi
set conceallevel=1
" }}}

""" plugin {{{
" vim-racer
let g:racer_cmd = $HOME."/.cargo/bin/racer"
let g:racer_experimental_completer = 1
augroup vim_racer_mappings
  autocmd!
  nnoremap rf <Plug>(rust-def)
  nnoremap rs <Plug>(rust-def-split)
  nnoremap rv <Plug>(rust-def-vertical)
  nnoremap <leader>rd <Plug>(rust-doc)
augroup END

" rust.vim
let g:autofmt_autosave = 1
" }}}
