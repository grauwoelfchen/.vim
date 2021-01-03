""" rust {{{
" display 4 spaces as 2 spaces
" see also after/filetype/rust.vim
" NOTE: this doesn't work well for completions for now :'(
" augroup fix_rust_indents
"   autocmd!
"   autocmd BufEnter * syntax match spaces /  / conceal cchar=˙
"   hi! conceal ctermfg=darkgray ctermbg=none cterm=none
" augroup END
set concealcursor=nvi
set conceallevel=1
" }}}

""" plugin {{{
" vim-lsp (rls)
if executable('rls')
	" rustup component add rls rust-analysis rust-src
  au User lsp_setup call lsp#register_server({
  \ 'name': 'rls',
  \ 'cmd': {server_info->['rustup', 'run', 'stable', 'rls']},
  \ 'workspace_config': {'rust': {'clippy_preference': 'on'}},
  \ 'whitelist': ['rust'],
  \ })
endif
" vim-lsp (rust-analyzer)
if executable('rust-analyzer')
	" rustup component add rls rust-analysis rust-src
  au User lsp_setup call lsp#register_server({
  \ 'name': 'rust-analyzer',
  \ 'cmd': {server_info->['rust-analyzer']},
  \ 'workspace_config': {'rust': {'clippy_preference': 'on'}},
  \ 'whitelist': ['rust'],
  \ })
endif
" asyncomplete-racer.vim
autocmd User asyncomplete_setup call asyncomplete#register_source(
  \ asyncomplete#sources#racer#get_source_options())
" vim-racer
let g:racer_cmd = $HOME."/.cargo/bin/racer"
let g:racer_experimental_completer = 0
let g:racer_insert_paren = 0
augroup vim_racer_mappings
  autocmd!
  "nmap gf <Plug>(rust-def)
  nmap gs <Plug>(rust-def-split)
  nmap gv <Plug>(rust-def-vertical)
  nmap gd <Plug>(rust-doc)
augroup END
" rust.vim
let g:autofmt_autosave = 1
" }}}
