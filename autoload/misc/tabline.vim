""" tabline {{{
if exists('g:loaded_tabline') && g:loaded_tabline
  finish
endif

let g:loaded_tabline = 1

function! s:tab_label(n)
  let bufnrs   = tabpagebuflist(a:n)
  let curbufnr = bufnrs[tabpagewinnr(a:n) - 1]
  let hl = a:n ==? tabpagenr() ? 'TabLineSel' : 'TabLine'
  let bufc = len(bufnrs)
  let bufs = bufc == 1 ? '' : '%#'.hl.'Number#'.bufc
  let updated = len(filter(copy(bufnrs), 'getbufvar(v:val, "&modified")')) ?
    \ '+' : ''
  let blank = (bufs.updated) ==? '' ? '' : ' '
  let fname = pathshorten(bufname(curbufnr))
  return '%'.a:n.'T'.bufs.updated.blank.'%#'.hl.'#'.fname.'%T%#TablineFill#'
endfunction

" `set tabline=%!misc#tabline#make()` in vimrc
function! misc#tabline#make()
  let labels = map(range(1, tabpagenr('$')), 's:tab_label(v:val)')
  let separator = ' | '
  let tabs = ' ' . join(labels, separator).separator.'%#TablineFill#%T'
  let info = fnamemodify(getcwd(), ':~').' « '.hostname().' » '
  return tabs.'%='.info
endfunction
" }}}
