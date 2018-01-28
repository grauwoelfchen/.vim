""" java {{{
set tags=$HOME/.ctags/java
" }}}
""" plugin {{{
let g:gradle_path = './bin/gradlew'
let g:android_sdk_path = '/usr/local/share/android'
" javacomplete2
let g:JavaComplete_GradleExecutable = './bin/gradlew'
augroup javacomplete
  autocmd!
  autocmd FileType java setlocal omnifunc=javacomplete#Complete
augroup END
" }}}
