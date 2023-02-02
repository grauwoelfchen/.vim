""" java {{{
set tags=$HOME/.ctags/java
setlocal foldmethod=syntax
" }}}

""" plugin {{{
let g:gradle_set_classpath = 1
let g:gradle_path = $GRADLE_PATH
" let g:android_sdk_path = '/usr/local/share/android'
let g:android_sdk_path = '~/.android'
" vim-lsp
let s:jar_path = '~/.lsp/eclipse.jdt.ls/plugins/' .
\ 'org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar'

if executable('java') && filereadable(expand(s:jar_path))
  " mkdir -p ~/.lsp/eclipse.jdt.ls
  " cd ~/.lsp/eclipse.jdt.ls
  " curl -sLO https://download.eclipse.org/jdtls/milestones/0.35.0/ \
  "   jdt-language-server-0.35.0-201903142358.tar.gz -O
  " tar xf jdt-language-server-0.35.0-201903142358.tar.gz
  augroup lsp_setup_java
    autocmd!
    autocmd User lsp_setup call lsp#register_server({
    \ 'name': 'eclipse.jdt.ls',
    \ 'cmd': {server_info->[
    \   'java',
    \   '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    \   '-Dosgi.bundles.defaultStartLevel=4',
    \   '-Declipse.product=org.eclipse.jdt.ls.core.product',
    \   '-Dlog.level=ALL',
    \   '-noverify',
    \   '-Dfile.encoding=UTF-8',
    \   '-Xmx1G',
    \   '-jar',
    \     expand(s:jar_path),
    \   '-configuration',
    \     expand('~/.lsp/eclipse.jdt.ls/config_linux'),
    \   '-data',
    \     getcwd()
    \ ]},
    \ 'whitelist': ['java'],
    \ })
  augroup END
endif
" }}}
