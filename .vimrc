""" Last modified Sonn.19.Dez.2010
"""

""" basic
set nocompatible
set showmode
set showcmd
set autoread
"" beep
set vb t_vb=
"" new line
set fileformats=unix,mac
set writebackup
set backup
set backupdir=~/Documents/.backup
set directory=~/Documents/.swap


""" search
set history=100
set hlsearch
nmap <Esc><Esc> :<C-u>nohlsearch<Return>
set ignorecase
set smartcase


""" view
set title
set ruler
set number
colorscheme ir_black
"set list
set laststatus=2
set showmatch
set matchtime=2
"highlight Comment ctermfg=green
set wrap
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set textwidth=0
set statusline=%n\:%y%F\ \ %{(&fenc!=''?&fenc:&enc).'\ '.&ff.'\ '}%m%r%=
highlight Comment term=NONE cterm=NONE ctermfg=green
highlight StatusLine term=NONE cterm=NONE ctermfg=gray ctermbg=black
"" line length
augroup vimrc_autocmds
  autocmd BufEnter * highlight OverLength term=NONE cterm=NONE ctermfg=gray ctermbg=black
  autocmd BufEnter * match OverLength /\%81v.\+/
augroup END


""" edit
set wildmenu
set commentstring=\ #\ %s
set foldlevel=0
"set paste
set clipboard+=unnamed
set backspace=indent,eol,start
set whichwrap=b,s,h,l,<,>,[,]
"nnoremap j gj
"nnoremap k gk


""" others
set encoding=utf-8
"undo
set hidden
"set autochdir
"starting message
set shortmess+=I


""" plugins
"" pathhogen
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype on
"" ctag
"let Tlist_Ctags_Cmd='/usr/bin/ctags'
"" netrw
"let g:netrw_browse_split=2
let g:netrw_altv=1
let g:netrw_winsize=""
"" mailapp
let MailApp_bundle="~/.vim/bundle/MailApp.bundle/"
let MailApp_from="Yasuhiro Asaka <y.grauwoelfchen@gmail.com>"


""" programming
set autoindent
set smartindent
set cindent
set cinwords=if,else,while,do,for,switch,case
syntax on
filetype plugin indent on
"" white space
autocmd BufWritePre * :%s/\s\+$//ge
autocmd BufWritePre * :%s/\t/  /ge

"" dict [C-x, C-k]
autocmd fileType ruby,eruby setl dictionary=~/.vim/dict/ruby.dict
autocmd fileType php setl dictionary=~/.vim/dict/php.dict

"" omnifunc [C-x, C-o]
set omnifunc=syntaxcomplete#Complete
autocmd fileType * let g:AutoComplPop_CompleteOption='.,w,b,u,t,i'
autocmd fileType ruby let g:AutoComplPop_CompleteOption='.,w,b,u,t,i,k~/.vim/dict/ruby.dict'
autocmd fileType php let g:AutoComplPop_CompleteOption='.,w,b,u,t,k~/.vim/dict/php.dict'

"" ruby
let g:rubycomplete_buffer_loading=1
let g:rubycomplete_classes_in_global=1
let g:rubycomplete_rails=1
autocmd fileType ruby,eruby setl omnifunc=rubycomplete#Complete
autocmd fileType ruby,eruby let g:rubycomplete_rails = 1
autocmd filetype ruby.eruby setl makeprg=ruby\ -c\ %
au BufRead,BufNewFile *.rb setfiletype ruby

"" python
autocmd fileType python setl omnifunc=pythoncomplete#Complete

"" php
autocmd fileType php imap <C-P> <ESC> :call PhpDocSingle()<CR>i
autocmd fileType php nmap <C-P> :call PhpDocSingle()<CR>
autocmd fileType php vmap <C-P> :call PhpDocRange()<CR>
autocmd fileType php setl makeprg=php\ -l\ %
autocmd fileType php setl errorformat=%m\ in\ %f\ on\ line\ %l
autocmd filetype php setl errorformat=%m\ in\ %f\ on\ line\ %l
"" syntax
let php_sql_query=1
let php_htmlInStrings=1
let php_noShortTags=1
let php_folding=1
autocmd syntax php setl fdm=syntax

"" objc
autocmd fileType objc setl makeprg=xcodebuild

"set filetype=ignored


""" command
""" rename current file
command! -nargs=1 -complete=file Rename f <args>|call delete(expand('#'))
