set tags=$HOME/.ctags/java
let s:java_version = '1.7.0.51'
let g:JavaImpPaths = '/opt/oracle-jdk-bin-'.s:java_version.'/src'
let g:JavaImpDataDir = $HOME.'/.vim/.java'
let g:JavaImpClassList = g:JavaImpDataDir.'/list.txt'
let g:JavaImpJarCache = g:JavaImpDataDir.'/cache'
let g:JavaImpSortPkgSep = 0
let g:JavaImpDocPaths = '/usr/share/doc/java-sdk-docs-'.s:java_version.'/html/api'
let g:JavaImpDocViewer = 'elinks'

noremap <buffer> <M-f> :JIF<Return>
noremap <buffer> <M-i> :JI<Return>
noremap <buffer> <M-k> :JID<Return>
