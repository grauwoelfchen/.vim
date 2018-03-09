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
augroup javacomplete
  autocmd!
  autocmd FileType java setlocal omnifunc=javacomplete#Complete
augroup END
" }}}
