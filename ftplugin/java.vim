""" java {{{
set tags=$HOME/.ctags/java
setlocal foldmethod=syntax
" }}}
""" plugin {{{
let g:gradle_set_classpath = 0
let g:gradle_path = $GRADLE_PATH
let g:android_sdk_path = '/usr/local/share/android'
" javacomplete2
let g:JavaComplete_GradleExecutable = './bin/gradlew'
nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
nmap <F5> <Plug>(JavaComplete-Imports-Add)
nmap <F6> <Plug>(JavaComplete-Imports-AddMissing)
nmap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
augroup javacomplete
  autocmd!
  autocmd FileType java setlocal omnifunc=javacomplete#Complete
augroup END
" vim-lsp
if executable('java') && filereadable(expand(
\ '~/lsp/eclipse.jdt.ls/' .
\ 'plugins/org.eclipse.equinox.launcher_1.5.300.v20190213-1655.jar'))
  " mkdir -p ~/lsp/eclipse.jdt.ls
  " cd ~/lsp/eclipse.jdt.ls
  " curl -L https://download.eclipse.org/jdtls/milestones/0.35.0/ \
  "   jdt-language-server-0.35.0-201903142358.tar.gz -O
  " tar xf jdt-language-server-0.35.0-201903142358.tar.gz
	au User lsp_setup call lsp#register_server({
		\ 'name': 'eclipse.jdt.ls',
		\ 'cmd': {server_info->[
		\     'java',
		\     '-Declipse.application=org.eclipse.jdt.ls.core.id1',
		\     '-Dosgi.bundles.defaultStartLevel=4',
		\     '-Declipse.product=org.eclipse.jdt.ls.core.product',
		\     '-Dlog.level=ALL',
		\     '-noverify',
		\     '-Dfile.encoding=UTF-8',
		\     '-Xmx1G',
		\     '-jar',
		\     expand(
    \       '~/lsp/eclipse.jdt.ls/plugins/' . \
    \       'org.eclipse.equinox.launcher_1.5.300.v20190213-1655.jar'),
		\     '-configuration',
		\     expand('~/lsp/eclipse.jdt.ls/config_win'),
		\     '-data',
		\     getcwd()
		\ ]},
		\ 'whitelist': ['java'],
		\ })
endif
" }}}
