""" vim {{{
if exists('g:loaded_vim') && g:loaded_vim
  finish
endif

let g:loaded_vim = 1

function! misc#vim#setup()
  let g:vim_indent_cont = 0

  nnoremap <Leader>.e :<C-u>edit $MYVIMRC<CR>
  nnoremap <Leader>.s :<C-u>source $MYVIMRC<CR>

  augroup fold_vimrc
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
  augroup END
endfunction
" }}}
