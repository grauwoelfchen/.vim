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
" if executable('rls')
"   " rustup component add rls rust-analysis rust-src
"   augroup lsp_setup_rls
"     autocmd User lsp_setup call lsp#register_server({
"     \ 'name': 'rls',
"     \ 'cmd': {server_info->['rustup', 'run', 'stable', 'rls']},
"     \ 'workspace_config': {'rust': {'clippy_preference': 'on'}},
"     \ 'whitelist': ['rust'],
"     \ })
"   augroup END
" endif
" vim-lsp (rust-analyzer)
if executable('rust-analyzer')
  " see `setup-rust-analyzer` script in gitlab.com/grauwoelfchen/toolbelt
  augroup lsp_setup_rust_analyzer
    autocmd User lsp_setup call lsp#register_server({
    \ 'name': 'rust-analyzer',
    \ 'cmd': {server_info->['rust-analyzer']},
    \ 'workspace_config': {'rust': {'clippy_preference': 'on'}},
    \ 'whitelist': ['rust'],
    \ 'initialization_options': {
    \   'cargo': {
    \      'buildScripts': {
    \        'enable': v:true,
    \      },
    \   },
    \   'procMacro': {
    \      'enable': v:true,
    \    },
    \ }})
  augroup END
endif
" rust.vim
let g:autofmt_autosave = 1
" rust-doc.vim
" use rustup (this variable is not used)
let g:rust_doc#downloaded_rust_doc_dir = 'none'
" ale
let g:ale_linters = {'rust': ['analyzer']}
" }}}
