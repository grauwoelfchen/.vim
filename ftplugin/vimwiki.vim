if exists('g:loaded_vimwiki_link_handler') && g:loaded_vimwiki_link_handler
  finish
endif

let g:loaded_vimwiki_link_handler = 1

setlocal foldlevel=1
setlocal foldenable

"let g:vimwiki_folding = 'list' ... this make opening file slow :'(
let g:vimwiki_hl_cb_checked = 1
let g:vimwiki_global_ext = 0
let g:vimwiki_diary_months = {
\ 1: 'Jan', 2: 'Feb', 3: 'Mar', 4: 'Apr', 5: 'May', 6: 'Jun',
\ 7: 'Jul', 8: 'Aug', 9: 'Sep', 10: 'Oct', 11: 'Nov', 12: 'Dec'
\}
nnoremap <Leader>wl :<C-u>VimwikiTabnewLink<CR>
nnoremap <Leader>wp :<C-u>VimwikiDiaryPrevDay<CR>
nnoremap <Leader>wn :<C-u>VimwikiDiaryNextDay<CR>

" `vim:` opens the file same as `file:` but in the vim as a new tab.
function! VimwikiLinkHandler(link)
  let link = a:link
  if link =~# '^vim:'
    let link = 'file' . link[3:]
  else
    return 0
  endif
  let link_info = vimwiki#base#resolve_link(link)
  if link_info.filename ==# ''
    echomsg 'Vimwiki Error: Unable to resolve the link'
    return 0
  else
    exe 'tabnew ' . fnameescape(link_info.filename)
    return 1
  endif
endfunction
