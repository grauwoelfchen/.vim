""" dockerfile {{{
" }}}

""" plugin {{{
if executable('docker-langserver')
  " npm install -g dockerfile-language-server-nodejs
  au User lsp_setup call lsp#register_server({
  \ 'name': 'docker-langserver',
  \ 'cmd': {server_info->[&shell, &shellcmdflag, 'docker-langserver --stdio']},
  \ 'whitelist': ['dockerfile'],
  \ })
endif
" }}}
