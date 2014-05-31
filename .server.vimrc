" Last Change: 31.May.2014
scriptencoding utf-8

""" basic {{{
set nocompatible
set showmode
set showcmd
set autoread
set ttyfast
set vb t_vb= "nobeep
set hidden "buffer
set writebackup
set backup
set backupdir=$HOME/.vim/.backup
set directory=$HOME/.vim/.swap
" set nobackup
" set noswapfile
"" IME
set noimcmdline
set iminsert=0
noremap ; :
noremap : ;
" completion
set wildmode=list:longest
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.tar.gz,*.tgz
" }}}

""" bundle {{{
filetype off
"" neobundle
if &runtimepath !~ '/neobundle.vim'
  set runtimepath+=$HOME/.vim/bundle/neobundle.vim
endif
call neobundle#rc(expand($HOME.'/.vim/bundle/'))
NeoBundle 'deris/columnjump'
NeoBundle 'kana/vim-gf-user'
NeoBundle 'kana/vim-gf-diff'
NeoBundle 'kana/vim-smartinput'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kana/vim-textobj-indent'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/vimproc', {
\  'build': {
\    'unix': 'make -f make_unix.mak'
\  }
\}
NeoBundleLazy 'Shougo/vimshell', {
\  'autoload' : {
\    'commands' : [ 'VimShell' ]
\  },
\  'depends': [
\    'Shougo/vimproc',
\  ]
\}
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-surround'
NeoBundle 'thinca/vim-guicolorscheme'
"" vim-scripts
NeoBundle 'buftabs'
NeoBundle 'smartchr'
NeoBundle 'sudo.vim'
NeoBundle 'taglist.vim'
if neobundle#exists_not_installed_bundles()
  echomsg 'Not installed bundles : ' .
  \  string(neobundle#get_not_installed_bundle_names())
  echomsg 'Please execute ":NeoBundleInstall" command.'
"  finish
endif
filetype plugin indent on
" }}}

""" search {{{
set incsearch
set history=100
set hlsearch
set ignorecase
set smartcase
nnoremap <silent><M-h> :nohlsearch<Return>
nnoremap \* nzzzv
nnoremap \# Nzzzv
nnoremap n nzzzv
nnoremap N Nzzzv
"" grep
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
set grepprg=grep\ -nH
"" help
" K man
set helplang=en
nnoremap <C-h> :<C-u>help<Space>
nnoremap <C-h><C-h> :<C-u>help<Space><C-r><C-w><Return>
nnoremap <C-t> <Nop>
nnoremap <C-]><C-]> <C-t>
" }}}

""" motion {{{
"" all
noremap j gj
noremap k gk
"" normal
nnoremap <C-a> <Home>
nnoremap <C-e> <End>
"" insert
inoremap <C-a> <Nop>
"" command
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>
cnoremap <C-d> <Del>
"" quickfix
nnoremap Q q
nnoremap q <Nop>
nnoremap qj :cnext<Return>
nnoremap qk :cprevious<Return>
"" matchit.vim
source $VIMRUNTIME/macros/matchit.vim
"" last position
augroup jump_to_last_pos
  autocmd!
  autocmd BufReadPost *
  \  if line("'\"") && line("'\"") <= line('$')
  \  | execute 'normal! g`"'
  \  | endif
augroup END
" }}}

""" appearance {{{
" set title
" set ruler
"" tabline
function! s:tab_label(n)
  let bufnrs   = tabpagebuflist(a:n)
  let curbufnr = bufnrs[tabpagewinnr(a:n) - 1]
  let hl = a:n ==? tabpagenr() ? 'TabLineSel' : 'TabLine'
  let bufs = len(bufnrs)
  if bufs == 1
    let bufs = ''
  else
    let bufs = '%#'.hl.'Number#'.bufs
  end
  let updated = len(filter(copy(bufnrs), 'getbufvar(v:val, "&modified")')) ? '+' : ''
  let blank = (bufs.updated) ==? '' ? '' : ' '
  let fname = pathshorten(bufname(curbufnr))
  return '%'.a:n.'T'.bufs.updated.blank.'%#'.hl.'#'.fname.'%T%#TablineFill#'
endfunction
function! MakeTabLine()
  let labels = map(range(1, tabpagenr('$')), 's:tab_label(v:val)')
  let separator = ' | '
  let tabs = ' ' . join(labels, separator).separator.'%#TablineFill#%T'
  let host = hostname()
  let info = fnamemodify(getcwd(), ':~').' « '.host.' » '
  return tabs.'%='.info
endfunction
set showtabline=2
set tabline=%!MakeTabLine()
set number
" set t_Co=256
set listchars=tab:^_,trail:_
" set list
set showmatch
set matchtime=2
set wrap
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set textwidth=0
"" starting message
set shortmess+=I
syntax enable
augroup apply_gui_color_scheme
  autocmd!
  runtime! bundle/vim-guicolorscheme/plugin/guicolorscheme.vim
  autocmd ColorScheme * GuiColorScheme gr_black
augroup END
colorscheme gr_black
"" right side
set statusline=%=%y\ %n\ %{pathshorten(expand('%f'))}
set statusline+=\ %{(&fenc!=''?&fenc:&enc)}\ %{&ff}
set statusline+=\ %m%r%{fugitive#head()}
set statusline+=\ %03l,%02v\ %P
set laststatus=2
" set colorcolumn=80
augroup highlight_over_length
  autocmd BufEnter *
  \  highlight OverLength term=NONE cterm=NONE ctermfg=gray ctermbg=black
  autocmd BufEnter * match OverLength /\%81v.\+/
augroup END
"" split
set splitbelow
set splitright
"" resize
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
"" quickfix
augroup quickfix_open
  autocmd!
  autocmd QuickfixCmdPost make,grep,vimgrep
  \  if len(getqflist()) | copen | endif
augroup END
augroup quickfix_close
  autocmd!
  autocmd WinEnter *
  \ if (winnr('$') == 1) && (getbufvar(winbufnr(0), '&buftype')) == 'quickfix' |
  \ quit | endif
augroup END
" }}}

""" edit {{{
set wildmenu
set complete+=k
set commentstring=\ #\ %s
set foldlevel=0
" set paste
nnoremap gc `[v`]
vnoremap gc :<C-u>normal gc<Return>
onoremap gc :<C-u>normal gc<Return>
" noremap <expr> qp '`['.strpart(getregtype(), 0, 1).'`]'
set clipboard=unnamed,autoselect
set clipboard=autoselect
set backspace=indent,eol,start
set whichwrap=b,s,h,l,<,>,[,]
"" visual
set virtualedit+=block
"" inc/dec
set nrformats=
"set nrformats+=alpha
noremap <M-a> <C-a>
noremap <M-d> <C-x>
" }}}

""" encoding {{{
set encoding=utf-8
set fileencodings=utf-8
set fileformats=unix
" }}}

""" command & other keymaps {{{
"" rename current file
command! -nargs=1 -complete=file Rename f <args>|call delete(expand('#'))
"" date
inoremap <expr> ,dd strftime('%a, %d. %b. %Y')
inoremap <expr> ,dt strftime('%Y-%m-%dT%H:%M:%S')
"" me
inoremap <expr> ,mu 'grauwoelfchen'
inoremap <expr> ,me 'grauwoelfchen@gmail.com <Yasuhiro Asaka>'
"" umlaut & eszett (alternative keymaps)
""" use digraph <C-k>[a,u,o]: in vim
function! CopyChar(c)
  redir @+> | execute 'echo "'.a:c.'"' | redir END
endfunction
nnoremap <expr> ,ua CopyChar('ä')
nnoremap <expr> ,uu CopyChar('ü')
nnoremap <expr> ,uo CopyChar('ö')
nnoremap <expr> ,ss CopyChar('ß')
" }}}

""" plugin {{{
"" columnjump
nmap <C-k> <Plug>(columnjump-backward)
nmap <C-j> <Plug>(columnjump-forward)
"" surround
nmap s  <Plug>Ysurround
nmap ss <Plug>Yssurround
"" smartchr
inoremap <expr> = smartchr#loop('=', ' = ', ' == ')
"" neocomplete
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#min_keyword_legth = 3
let g:neocomplete#max_list = 25
let g:neocomplete#skip_auto_completion_time = 0.4
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
let g:neocomplete#sources#dictionary#dictionaries = {
\  'default' : '',
\  'vimshell' : $HOME.'/.vimshell/command/history',
\  'scheme' : $HOME.'/.vim/dict/scheme.dict',
\  'ruby' : $HOME.'/.vim/dict/ruby.dict'
\}
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()
inoremap <expr><C-h> neocomplete#smart_close_popup().'\<C-h>'
inoremap <expr><C-e> neocomplete#cancel_popup()
"" buftabs
let g:buftabs_only_basename = 1
let g:buftabs_in_statusline = 1
let g:buftabs_active_highlight_group = 'Visual'
noremap <Leader>bp :bprev<Return>
noremap <Leader>bn :bnext<Return>
"" fugitive
nnoremap <silent> <Leader>gd :<C-u>Gdiff<Return>
nnoremap <silent> <Leader>gs :<C-u>Gstatus<Return>
nnoremap <silent> <Leader>gl :<C-u>Glog<Return>
nnoremap <silent> <Leader>gb :<C-u>Gbrowse<Return>
nnoremap <silent> <Leader>gg :<C-u>Ggrep<Return>
"" ctrlp
let g:ctrlp_map = '<C-M-p>'
let g:ctrlp_custom_ignore =
\ '\v[\/]\.(git|hg|svn|bundle)'
\ .'|node_modules|components$'
let g:ctrlp_open_new_file = 't'
let g:ctrlp_open_multiple_files = 'tj'
let g:ctrlp_prompt_mappings = {
\  'AcceptSelection("t")': ['<c-t>', '<c-T>', '<c-a>']
\ }
" }}}

""" filesystem {{{
" set autochdir
" let g:netrw_browse_split = 2
let g:netrw_altv = 1
let g:netrw_winsize = ''
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
"" samba ;-(
" augroup on_samba
  " autocmd!
  " autocmd BufWritePost * sleep 1
  " autocmd BufWritePost * checktime
  " set autoread
" augroup END
" }}}

""" programming {{{
set autoindent
" set smartindent
set cindent
set cinwords=if,else,while,do,for,switch,case
nnoremap ]] ]m
nnoremap [[ [m
"" white space
nnoremap <Leader>ss ma:%s/  *$//<CR>`a<ESC>
" augroup replace_white_space
  " autocmd!
  " autocmd BufWritePre * :%s/\s\+$//ge
  " autocmd BufWritePre * :%s/\t/  /ge
" augroup END
augroup highlight_trailing_spaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme *
  \  highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END
" }}}

""" vim {{{
let g:vim_indent_cont = 0
nnoremap <Space>. :<C-u>edit $MYVIMRC<Return>
nnoremap <Space>.s :<C-u>source $MYVIMRC<Return>
augroup fold_vimrc
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}
