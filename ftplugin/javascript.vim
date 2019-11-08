""" javascript {{{
nnoremap <buffer> <LocalLeader>c I// <Esc>
" }}}

""" plugin {{{
" vim-lsp
if executable('typescript-language-server')
  " npm install -g typescript typescript-language-server
	au User lsp_setup call lsp#register_server({
	\ 'name': 'javascript support using typescript-language-server',
	\ 'cmd': { server_info->[
  \    &shell,
  \    &shellcmdflag,
  \    'typescript-language-server --stdio'
  \  ]},
	\ 'root_uri': { server_info->lsp#utils#path_to_uri(
  \    lsp#utils#find_nearest_parent_directory(
  \      lsp#utils#get_buffer_path(),
  \      '.git/..'
  \    )
  \  )},
	\ 'whitelist': ['javascript', 'javascript.jsx', 'javascriptreact']
	\ })
endif
" ale
let g:ale_linters = {
\ 'javascript': ['eslint']
\}
"""" }}}
