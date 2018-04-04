""" rust {{{
" see also after/filetype/rust.vim
" }}}
""" plugin {{{
" vim-racer
let g:racer_cmd = "/home/yasuhiro/.cargo/bin/racer"
let g:racer_experimental_completer = 1
augroup vim_racer_mappings
  autocmd!
  autocmd FileType rust nmap rf <Plug>(rust-def)
  autocmd FileType rust nmap rs <Plug>(rust-def-split)
  autocmd FileType rust nmap rv <Plug>(rust-def-vertical)
  autocmd FileType rust nmap <leader>rd <Plug>(rust-doc)
augroup END

" rust.vim
let g:autofmt_autosave = 1
" }}}
