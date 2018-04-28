""" lisp {{{
set lisp
set nocindent

inoremap ** **<Left>
" }}

""" plugin {{{
"" slimv
let g:paredit_electric_return = 0
let g:swank_log = 0
let g:slimv_keybindings = 1
let g:slimv_indent_keylists = 0
let g:slimv_repl_simple_compl = 1
let g:slimv_repl_name = 'repl'
let g:slimv_repl_split = 1
let g:slimv_swank_cmd = '!screen -dmS lisp clisp -i '.
\  $HOME.'/.vim/bundle/slimv/slime/start-swank.lisp'
" }}}
