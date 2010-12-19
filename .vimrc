""" Last modified Sonn.19.Dez.2010
"""

"" basic
set nocompatible
set showmode
set showcmd
set autoread
"" beep
set vb t_vb=
"" new line
set fileformats=unix,mac

"" backup
set writebackup
set backup
set backupdir=~/Documents/.backup
set directory=~/Documents/.swap

"" search
set history=100
set hlsearch
nmap <Esc><Esc> :<C-u>nohlsearch<Return>
set ignorecase
set smartcase

"" view
set title
set ruler
set number
colorscheme ir_black
""" set list
set laststatus=2
set showmatch
set matchtime=2
"""" highlight Comment ctermfg=green
set wildmenu
set wrap
set statusline=%n\:%y%F\ \ %{(&fenc!=''?&fenc:&enc).'\ '.&ff.'\ '}%m%r%=
highlight StatusLine term=NONE cterm=NONE ctermfg=gray ctermbg=black
set autoindent
set smartindent
set cindent
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set textwidth=0

"" edit
set commentstring=\ #\ %s
set foldlevel=0
set paste
set clipboard+=unnamed
set backspace=indent,eol,start
set whichwrap=b,s,h,l,<,>,[,]
""" nnoremap j gj
""" nnoremap k gk

"" encoding
set encoding=utf-8

"" others
""" undo
set hidden
""" set autochdir
nnoremap <C-j> ;<C-w>j
nnoremap <C-k> ;<C-k>j
nnoremap <C-l> ;<C-l>j
nnoremap <C-h> ;<C-h>j
set noimdisable
set iminsert=0 imsearch=0
set noimcmdline
inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>

"" starting message
set shortmess+=I
set helplang=ja

"" plugins
"" for pathhogen
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
"" ctag
""" let Tlist_Ctags_Cmd='/usr/bin/ctags'

"" netrw
""" let g:netrw_browse_split=2
let g:netrw_altv=1
let g:netrw_winsize=""

"" coding
inoremap , ,<Space>
autocmd BufWritePre * :%s/\s\+$//ge
autocmd BufWritePre * :%s/\t/  /ge
syntax on
filetype on
filetype indent on
filetype plugin on
set omnifunc=syntaxcomplete#Complete
"" ruby
autocmd fileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd fileType ruby,eruby let g:rubycomplete_rails = 1
"" python
autocmd fileType python set omnifunc=pythoncomplete#Complete
"" php
autocmd fileType php set makeprg=php\ -l\ %
autocmd fileType php set errorformat=%m\ in\ %f\ on\ line\ %l
"""" autocmd fileType php setl dictionary=~/.vim/dict/php.dict
"" objc
autocmd fileType objc set makeprg=xcodebuild

""" mailapp
let MailApp_bundle="~/.vim/bundle/MailApp.bundle/"
let MailApp_from="Yasuhiro Asaka <y.grauwoelfchen@gmail.com>"
