""" php {{{
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=80
setlocal errorformat=%m\ in\ %f\ on\ line\ %l
let g:php_sql_query = 0
let g:php_htmlInStrings = 0
let g:php_noShortTags = 0
let g:php_folding = 1
inoremap ,pp<ESC> :call PhpDocSingle()<CR>i
nnoremap ,pp :call PhpDocSingle()<CR>
vnoremap ,pp :call PhpDocRange()<CR>
"augroup syntax_check
"  autocmd!
"  autocmd Syntax php setlocal fdm=syntax
"  autocmd FileType php setlocal makeprg=php\ -l\ %
"  autocmd BufWrite *.php w !php -l
"augroup END
" }}}

""" plugin {{{
" vim-lsp
if executable('intelephense')
  " # update `PATH_TO_GLOBAL_NODE_MODULES` and `PATH_TO_TEMP_FOLDER`
	" npm root -g (
  au User lsp_setup call lsp#register_server({
  \ 'name': 'intelephense',
  \ 'cmd': {server_info->[
  \    'node',
  \     expand('PATH_TO_GLOBAL_NODE_MODULES/intelephense/lib/intelephense.js'),
  \    '--stdio'
  \ ]},
  \ 'initialization_options': {
  \    "storagePath": "PATH_TO_TEMP_FOLDER/intelephense"
  \ },
  \ 'whitelist': ['php'],
  \ })
endif
" }}}
