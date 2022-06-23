""" csharp {{{
setlocal expandtab
setlocal textwidth=80
setlocal tabstop=2
setlocal shiftwidth=2
setlocal softtabstop=2
" }}}

""" plugin {{{
"" omnisharp-vim
"" dev-lang/mono or use embedded mono into server (set use_mono as 0)
"" https://github.com/OmniSharp/omnisharp-roslyn
let g:OmniSharp_server_use_mono = 1
let g:OmniSharp_server_use_net6 = 1
"" must be `http` variant
let g:OmniSharp_server_studio = 0
let g:OmniSharp_server_path = ""
let g:OmniSharp_server_use_net6 = 1
" let g:OmniSharp_server_path = $HOME.'/.cache/omnisharp-vim/'.
" \ 'omnisharp-roslyn/OmniSharp.exe'
let g:OmniSharp_server_path = $HOME.'/.atelier/usr/local/lib/'.
\ 'omnisharp.http-linux-x64/omnisharp/OmniSharp.exe'

let g:OmniSharp_selector_ui = 'ctrlp'
let g:OmniSharp_diagnostic_showid = 1

setlocal completeopt-=preview
augroup omnisharp_commands
  autocmd!
  autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

  nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
  nnoremap <buffer> <Leader>fs :OmniSharpFindImplementations<CR>
  nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>

  nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
  nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>

  nnoremap <Leader>cf :OmniSharpCodeFormat<CR>

  noremap <Leader>st :OmniSharpStartServer<CR>
  noremap <Leader>sp :OmniSharpStopServer<CR>

  noremap <Leader><Space> :OmniSharpGetCodeActions<CR>
  xnoremap <Leader><space> :call OmniSharp#GetCodeACtions('visual')<CR>
augroup END
" }}}
