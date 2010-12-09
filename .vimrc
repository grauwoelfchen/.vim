" Last modified Mon.22.Nov.2010
"

"" basic
set nocompatible
set number
set showmode
set showcmd
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
"""" nmap :nohlsearch
set ignorecase
set smartcase

"" view
set title
set ruler

"" color
colorscheme ir_black

"" invisible mark tab,line end
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
set tabstop=2
set softtabstop=2
set expandtab
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
"" starting message
set shortmess+=I
set helplang=ja

"" plugins
"" pathhogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
"" ctag
""" let Tlist_Ctags_Cmd='/usr/bin/ctags'

"" netrw
let g:netrw_altv=1

"" coding
syntax on
filetype on
filetype indent on
filetype plugin on
"" ruby
autocmd fileType ruby,eruby,haml,sass set omnifunc=rubycomplete#Complete
autocmd fileType ruby,eruby,haml,sass let g:rubycomplete_rails = 1
"" python
autocmd fileType python set omnifunc=pythoncomplete#Complete
"" php
autocmd fileType php :set makeprg=php\ -l\ %
autocmd fileType php :set errorformat=%m\ in\ %f\ on\ line\ %l
"""" autocmd fileType php setlocal dictionary=~/.vim/dict/php.dict
"" objc
autocmd fileType objc set makeprg=xcodebuild


