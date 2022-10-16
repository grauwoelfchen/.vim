function! s:expand_path(fpath) abort
    let l:file = printf(a:fpath, expand('%:p:h'),
      \ tr(expand('%:p:h:t'), '-', '_'))
    if !filereadable(l:file)
      echoerr 'File does not exist: '.l:file
      return v:null
    endif
    return l:file
endfunction

function! s:run_tests() abort
  if expand('%:e') == 'vim'
    let l:target = s:expand_path('%s/%s.vader')
    if l:target != v:null
      source %
      execute 'Vader' l:target
    endif
  else
    let l:target = s:expand_path('%s/%s.vim')
    if l:target != v:null
      execute 'source' l:target
      Vader
    endif
  endif
endfunction

"autocmd BufNewFile,BufRead *.{vader,vim}
"  \ command! -buffer Test call s:run_tests()
autocmd FileType vim
  \ command! -buffer Test call s:run_tests()
