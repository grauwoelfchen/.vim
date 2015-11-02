""" html {{{
" }}}

""" plugin {{{
"" emmet-vim
let s:hooks = neobundle#get_hooks('emmet-vim')
function! s:hooks.on_source(hooks)
  let g:user_emmet_mode = 'in'
  let g:user_emmet_leader_key = '<C-y>'
  let g:user_emmet_complete_tag = 1
  let g:user_emmet_settings = {
  \  'lang': 'utf-8',
  \  'haml': {'extends': 'html'}
  \}
endfunction
" }}}
