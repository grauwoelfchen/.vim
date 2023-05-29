""" lsp {{{
if exists('g:loaded_lsp') && g:loaded_lsp
  finish
endif

let g:loaded_lsp = 1

function! s:on_lsp_buffer_enabled() abort
  let g:lsp_fold_enabled = 0
  " set foldmethod=expr
  " \ foldexpr=lsp#ui#vim#folding#foldexpr()
  " \ foldtext=lsp#ui#vim#folding#foldtext()
  let g:lsp_highlight_references_enabled = 1
  let g:lsp_document_highlight_enabled = 1
  let g:lsp_text_edit_enabled = 0
  let g:lsp_signs_enabled = 1
  let g:lsp_signs_error = {'text': 'e'}
  let g:lsp_signs_warning = {'text': 'w'}
  let g:lsp_signs_hint = {'text': 'h'}
  let g:lsp_signcolumn = 1
  let g:lsp_diagnostics_enabled = 1
  let g:lsp_diagnostics_echo_cursor = 1
  let g:lsp_diagnostics_signs_enabled = 0
  let g:lsp_diagnostics_virtual_text_enabled = 0
  let g:lsp_diagnostics_highlights_insert_mode_enabled = 0
  let g:lsp_diagnostics_virtual_text_insert_mode_enabled = 0
  let g:lsp_format_sync_timeout = 900
  augroup lsp_documet_format_sync
    autocmd!
    autocmd BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
  augroup END
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
  nmap <buffer> <Leader>gd <Plug>(lsp-definition)
  nmap <buffer> <Leader>gi <Plug>(lsp-implementation)
  nmap <buffer> <Leader>gr <Plug>(lsp-references)
  nmap <buffer> <Leader>gs <Plug>(lsp-workspace-symbol-search)
  inoremap <buffer> <expr><C-d> lsp#scroll(+3)
  inoremap <buffer> <expr><C-f> lsp#scroll(-3)
endfunction

function! misc#lsp#setup()
  augroup lsp_install
    autocmd!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
  augroup END
endfunction
" }}}
