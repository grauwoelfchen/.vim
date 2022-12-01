""" go {{{
set nolist
" In addition to `$HOME/.go/bin/`
set runtimepath+=$GOPATH/src/golang.org/x/lint/misc/vim
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
" vim-go
let g:go_highlight_structs = 0
let g:go_highlight_interfaces = 0
let g:go_highlight_operators = 0
let g:go_metalinter_command = 'golangci-lint'
" vim-lsp
"if executable('go-langserver')
"  augroup lsp_setup_go_langserver
"    autocmd User lsp_setup call lsp#register_server({
"    \ 'name': 'go-langserver',
"    \ 'cmd': {server_info->['go-langserver', '-gocodecompletion']},
"    \ 'whitelist': ['go'],
"    \ })
"    autocmd BufWritePre *.go LspDocumentFormatSync
"  augroup END
"endif
if executable('gopls')
	augroup lsp_setup_gopls
		autocmd User lsp_setup call lsp#register_server({
			\ 'name': 'gopls',
			\ 'cmd': {server_info->['gopls', '-mode', 'stdio']},
			\ 'whitelist': ['go'],
			\ })
		autocmd BufWritePre *.go LspDocumentFormatSync
	augroup END
endif
" ale
let g:ale_linters_explicit = 1
let g:ale_linters = {
\ 'go': ['golangci-lint'],
\ }
" }}}
