""" quickfix {{{
if exists('g:loaded_quickfix') && g:loaded_quickfix
  finish
endif

let g:loaded_quickfix = 1

function! misc#quickfix#setup()
  nnoremap Q q
  nnoremap q <Nop>
  nnoremap qj :cnext<CR>
  nnoremap qk :cprevious<CR>

  augroup quickfix_open
    autocmd!
    autocmd QuickfixCmdPost make,grep,vimgrep if len(getqflist()) | copen | endif
  augroup END
  augroup quickfix_close
    autocmd!
    autocmd WinEnter *
    \  if (winnr('$') == 1) && (getbufvar(winbufnr(0), '&buftype')) == 'quickfix'
    \  | quit | endif
  augroup END
endfunction
""" }}}
