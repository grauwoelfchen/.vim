if exists('g:loaded_vimwiki_link_handler') && g:loaded_vimwiki_link_handler
  finish
endif

let g:loaded_vimwiki_link_handler = 1

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
