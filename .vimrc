""" Last modified Sun, 23. Jan. 2011
"""

""" basic
set nocompatible
set showmode
set showcmd
set autoread
set ttyfast
"" beep
set vb t_vb=
"" new line
set fileformats=unix,mac
set writebackup
set backup
set backupdir=~/Documents/.backup
set directory=~/Documents/.swap
"" IME
set noimcmdline
"" date
inoremap <expr> ,dd strftime('%a, %d. %b. %Y')


""" search
set incsearch
set history=100
set hlsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>
set ignorecase
set smartcase
"" help
nnoremap <C-i><C-i> :<C-u>help<Space><C-r><C-w><Enter>


""" move
map <C-e> <END>
map <C-a> <HOME>
"" at insert mode
imap <C-j> <Down>
imap <C-k> <Up>
imap <C-h> <Left>
imap <C-l> <Right>


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
"" visual
set virtualedit+=block


""" edit
set wildmenu
set complete+=k
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
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
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

"" autocomlpop
"inoremap ,s <ESC>:AutoComplPopDisable<CR>a
"inoremap ,q <ESC>:AutoComplPopEnable<CR>a
"nnoremap ,s :AutoComplPopDisable<CR>
"nnoremap ,q :AutoComplPopEnable<CR>

"" neocomplcache
let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_auto_completion_start_length=2
let g:neocomplcache_enable_smart_case=1
let g:neocomplcache_enable_auto_select=1
let g:neocomplcache_max_list=30
inoremap <expr><C-x> neocomplcache#complete_common_string()
inoremap <expr><C-x><CR> neocomplcache#smart_close_popup()

"" zencoding
let g:user_zen_expandabbr_key='<C-y>,'
let g:user_zen_complete_tag=1
let g:user_zen_settings={
\  'lang': 'utf-8',
\  'haml': {
\    'extends': 'html',
\  }
\}

""" unite.vim
" let g:unite_enable_start_insert=1
" buffers
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" files
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" registers
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" recent files
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" buffers and files
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
" all
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
" window
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q


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
autocmd fileType php imap <Leader><C-s><ESC> :call PhpDocSingle()<CR>i
autocmd fileType php nmap <Leader><C-s> :call PhpDocSingle()<CR>
autocmd fileType php vmap <Leader><C-s> :call PhpDocRange()<CR>
autocmd fileType php setl makeprg=php\ -l\ %
autocmd fileType php setl errorformat=%m\ in\ %f\ on\ line\ %l
autocmd filetype php setl errorformat=%m\ in\ %f\ on\ line\ %l
let php_sql_query=1
let php_htmlInStrings=1
let php_noShortTags=1
let php_folding=1
autocmd syntax php setl fdm=syntax

"" objc
autocmd fileType objc setl makeprg=xcodebuild

set filetype=ignored

"" arduino
"au BufRead,BufNewFile *.pde setfiletype arduino
autocmd! BufNewFile,BufRead *.pde setlocal ft=arduino


""" apps
"" twitvim
let twitvim_login = "grauwoelfchen:leonmame0718"


""" command
"" rename current file
command! -nargs=1 -complete=file Rename f <args>|call delete(expand('#'))

