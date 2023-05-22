""" complete {{{
if exists('g:loaded_complete') && g:loaded_complete
  finish
endif

let g:loaded_complete = 1

function! misc#complete#setup()
  " asyncomplete.vim
  inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "<Tab>"
  inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "<CR>"
  let g:asyncomplete_auto_popup = 1
  let g:asyncomplete_auto_completeopt = 0
  let g:asyncomplete_popup_delay = 120
  augroup asyncomplete_done
  	autocmd!
    autocmd CompleteDone * if pumvisible() == 0 | pclose | endif
  augroup END
  " asyncomplete-buffer.vim
  augroup asyncomplete_buffer_setup
  	autocmd!
  	autocmd User asyncomplete_setup call asyncomplete#register_source(
		  \ asyncomplete#sources#buffer#get_source_options({
      \ 'name': 'buffer',
      \ 'allowlist': ['*'],
      \ 'blocklist': ['go'],
      \ 'completor': function('asyncomplete#sources#buffer#completor'),
      \ 'config': {
      \    'max_buffer_size': 5000000,
      \  },
      \ }))
  augroup END
  " asyncomplete-file.vim
  augroup asyncomplete_file_setup
  	autocmd!
  	autocmd User asyncomplete_setup call asyncomplete#register_source(
		  \ asyncomplete#sources#file#get_source_options({
      \ 'name': 'file',
      \ 'allowlist': ['*'],
      \ 'blocklist': [],
      \ 'completor': function('asyncomplete#sources#file#completor'),
      \ 'config': {
      \    'max_buffer_size': 5000000,
      \  },
      \ }))
  augroup END
  " asyncomplete-tags.vim
  augroup asyncomplete_tags_setup
  	autocmd!
    autocmd User asyncomplete_setup call asyncomplete#register_source(
			\ asyncomplete#sources#tags#get_source_options({
			\ 'name': 'tags',
			\ 'allowlist': ['c'],
			\ 'blocklist': [],
			\ 'completor': function('asyncomplete#sources#tags#completor'),
			\ 'config': {
			\    'max_file_size': 50000000,
			\  },
			\ }))
  augroup END
endfunction
" }}}
