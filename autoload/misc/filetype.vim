""" filetypes {{{
if exists('g:loaded_filetype') && g:loaded_filetype
  finish
endif

let g:loaded_filetype = 1

function! misc#filetype#setup()
  augroup treat_as_lisp
    autocmd!
    autocmd BufNewFile,BufRead .stumpwmrc,.clisprc setlocal filetype=lisp
  augroup END
  augroup treat_as_erlang
    autocmd!
    autocmd BufNewFile,BufRead .rebar.config,*.app.src setlocal filetype=erlang
  augroup END
  augroup treat_as_rspec
    autocmd!
    autocmd BufNewFile,BufRead *_spec.rb setlocal filetype=ruby.rspec
  augroup END
  augroup treat_as_js
    autocmd!
    autocmd BufNewFile,BufRead *.js.erb,.conkerorrc setlocal filetype=javascript
  augroup END
  augroup treat_as_changelog
    autocmd!
    autocmd BufNewFile,BufRead CHANGELOG setlocal filetype=changelog
  augroup END
  augroup treat_as_jinja
    autocmd!
    autocmd BufNewFile,BufRead *.tera setlocal filetype=jinja
  augroup END
  augroup treat_as_xml
    autocmd!
    autocmd BufNewFile,BufRead *.xaml setlocal filetype=xml
  augroup END
endfunction
"}}}
