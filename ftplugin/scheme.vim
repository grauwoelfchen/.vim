""" scheme,racket {{{
set lisp
set nocindent
set lispwords+=public-method,override-method,private-method
set lispwords+=syntax-case,syntax-rules
" with 'gvy
noremap <Leader><Leader>r :call vimproc#system(
\ 'screen -S racket -p server -X stuff "'. escape(@@, '\"') . '"')'"')<Return>
" }}}
