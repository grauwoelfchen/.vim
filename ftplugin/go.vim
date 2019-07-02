set nolist
set rtp+=$GOPATH/src/golang.org/x/lint/misc/vim

set autowrite

map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
noremap <leader>a :cclose<CR>

let g:go_fmt_autosave = 0
let g:go_play_open_browser = 0
let g:go_highlight_types = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_calls = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:go_code_completion_enabled = 1
let g:go_info_mode = 'gocode'

let g:go_autodetect_gopath = 1
let g:go_textobj_enabled = 1
let g:go_textobj_include_variable = 1
let g:go_textobj_include_function_doc = 1

let g:go_template_autocreate = 1
let g:go_template_test_file = "hello_world_test.go"

let g:go_auto_type_info = 1

" deoplete
let g:deoplete#sources#go#package_dot = 1
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = [
\  'package',
\  'func',
\  'type',
\  'var',
\  'const'
\]
" augroup set_omni_patterns
"   autocmd!
"   autocmd Bufread *.go :call deoplete#custom#option(
"   \ 'omni_patterns', {'go': '[^. *\t]\.\w*'
"   \ })
" augroup END
