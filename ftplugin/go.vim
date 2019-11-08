""" go {{{
set nolist
set rtp+=$GOPATH/src/golang.org/x/lint/misc/vim
set autowrite
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
noremap <leader>a :cclose<CR>
"augroup omni_patterns
"  autocmd!
"  autocmd Bufread *.go :call deoplete#custom#option(
"  \ 'omni_patterns', {'go': '[^. *\t]\.\w*'
"  \ })
"augroup END
" }}}

""" plugin {{{
" vim-lsp
"if executable('go-langserver')
"  au User lsp_setup call lsp#register_server({
"  \ 'name': 'go-langserver',
"  \ 'cmd': {server_info->['go-langserver', '-gocodecompletion']},
"  \ 'whitelist': ['go'],
"  \ })
"  autocmd BufWritePre *.go LspDocumentFormatSync
"endif
if executable('gopls')
	au User lsp_setup call lsp#register_server({
		\ 'name': 'gopls',
		\ 'cmd': {server_info->['gopls', '-mode', 'stdio']},
		\ 'whitelist': ['go'],
		\ })
	autocmd BufWritePre *.go LspDocumentFormatSync
endif
" }}}
