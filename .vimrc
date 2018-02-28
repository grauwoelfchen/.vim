""" basic {{{
" tiny
if !1 | finish | endif
set nocompatible
set showmode
set showcmd
set autoread
set ttyfast
set vb t_vb=
set hidden
set writebackup
set backup
set backupdir=$HOME/.vim/.backup
set directory=$HOME/.vim/.swap
set noimcmdline
set iminsert=0
"" completion
set wildmode=list:longest
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.tar.gz,*.tgz,.git/*
noremap ; :
noremap : ;
"" leader
let g:mapleader = ","
let g:maplocalleader = "\\"
" }}}
""" bundle {{{
filetype off
"" vim-plug
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', {'do': './install --all'}
Plug 'Shougo/vimproc.vim', {'do': 'make'}
Plug 'Shougo/vimshell.vim', {'on': 'VimShell'}
      " dep: vimproc
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'
Plug 'tpope/vim-sensible'
Plug 'thinca/vim-quickrun'
      " dep: vimproc
Plug 'purescript-contrib/purescript-vim'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'hsanson/vim-android'
call plug#end()
"" neobundle
if &runtimepath !~ '/neobundle.vim'
  set runtimepath+=$HOME/.vim/bundle/neobundle.vim
endif
call neobundle#begin(expand($HOME.'/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'b4winckler/vim-objc'
NeoBundle 'deris/columnjump'
NeoBundle 'rhysd/clever-f.vim'
NeoBundle 'h1mesuke/vim-alignta'
NeoBundle 'kana/vim-gf-user'
NeoBundle 'kana/vim-gf-diff'
NeoBundle 'kana/vim-smartinput'
NeoBundle 'smartchr'
NeoBundle 'Shougo/echodoc.vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'maxbrunsfeld/vim-yankstack'
NeoBundle 'Shougo/neocomplete'
NeoBundle 'buftabs'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'thinca/vim-guicolorscheme'
NeoBundle 'thinca/vim-ref'
NeoBundle 'sudo.vim'
NeoBundle 'rhysd/committia.vim'
NeoBundle 'rhysd/open-pdf.vim'
NeoBundle 'rhysd/devdocs.vim'
NeoBundle 'vimwiki/vimwiki'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'beloglazov/vim-online-thesaurus'
NeoBundle 'w0rp/ale'
NeoBundle 'deton/eblook.vim'
NeoBundleLazy 'kana/vim-textobj-indent', {
\ 'depends': 'kana/vim-textobj-user',
\ 'autoload': {'mappings': [
\   ['xo', 'ai'], ['xo', 'aI'], ['xo', 'ii'], ['xo', 'iI']]}}
NeoBundleLazy 'kana/vim-textobj-line', {
\ 'depends': 'kana/vim-textobj-user',
\ 'autoload': {'mappings': [
\   ['xo', 'al'], ['xo', 'il']]}}
NeoBundleLazy 'kana/vim-textobj-fold', {
\ 'depends': 'kana/vim-textobj-user',
\ 'autoload': {'mappings': [
\   ['xo', 'az'], ['xo', 'iz']]}}
NeoBundleLazy 'kana/vim-textobj-function', {
\ 'depends': 'kana/vim-textobj-user',
\ 'autoload': {'mappings': [
\   ['xo', 'af'], ['xo', 'if']]}}
" lang, implementation and template
NeoBundle 'pbrisbin/vim-syntax-shakespeare'
NeoBundleLazy 'oscarh/vimerl', {
\  'autoload': {'filetypes': ['erlang']}}
NeoBundleLazy 'kovisoft/slimv', {
\  'autoload': {'filetypes': ['lisp']}}
NeoBundleLazy 'wlangstroth/vim-racket', {
\  'autoload': {'filetypes': ['scheme', 'racket']}}
NeoBundleLazy 'pangloss/vim-javascript', {
\  'autoload': {'filetypes': ['javascript']}}
NeoBundleLazy 'myhere/vim-nodejs-complete', {
\  'autoload': {'filetypes': ['javascript']}}
NeoBundleLazy 'kchmck/vim-coffee-script', {
\  'autoload': {'filetypes': ['coffee']}}
NeoBundleLazy 'wavded/vim-stylus', {
\  'autoload': {'filetypes': ['stylus']}}
NeoBundleLazy 'digitaltoad/vim-jade', {
\  'autoload': {'filetypes': ['jade']}}
NeoBundleLazy 'danchoi/ri.vim', {
\  'autoload': {'filetypes': ['ruby']}}
NeoBundleLazy 'yuku-t/vim-ref-ri', {
\  'autoload': {'filetypes': ['ruby']}}
NeoBundleLazy 'vim-ruby/vim-ruby', {
\  'autoload': {'filetypes': ['ruby']}}
NeoBundleLazy 'tpope/vim-rails', {
\  'autoload': {'filetypes': ['ruby']}}
NeoBundleLazy 'slim-template/vim-slim', {
\  'autoload': {'filetypes': ['slim']}}
NeoBundleLazy 'tpope/vim-haml', {
\  'autoload': {'filetypes': ['haml']}}
NeoBundleLazy 'eagletmt/ghcmod-vim', {
\  'autoload': {'filetypes': ['haskell']}}
NeoBundleLazy 'dag/vim2hs', {
\  'autoload': {'filetypes': ['haskell']}}
NeoBundleLazy 'vim-latex/vim-latex', {
\  'autoload': {'filetypes': ['latex']}}
NeoBundleLazy 'davidhalter/jedi-vim', {
\  'autoload': {'filetypes': ['python']}}
NeoBundleLazy 'pep8', {
\  'autoload': {'filetypes': ['python']}}
NeoBundleLazy 'sophacles/vim-bundle-mako', {
\  'autoload': {'filetypes': ['mako']}}
NeoBundleLazy 'lepture/vim-jinja', {
\  'autoload': {'filetypes': ['jinja2']}}
NeoBundleLazy 'fatih/vim-go', {
\  'autoload': {'filetypes': ['go']}}
NeoBundleLazy 'mattn/emmet-vim', {
\  'autoload': {'filetypes': ['html']}}
NeoBundleLazy 'tpope/vim-markdown', {
\  'autoload': {'filetypes': ['markdown']}}
NeoBundleLazy 'rhysd/vim-gfm-syntax', {
\  'autoload': {'filetypes': ['markdown']}}
if neobundle#exists_not_installed_bundles()
  echomsg 'Not installed bundles : ' .
  \  string(neobundle#get_not_installed_bundle_names())
  echomsg 'Please execute ":NeoBundleInstall" command.'
  finish
endif
call neobundle#end()
filetype plugin indent on
NeoBundleCheck
" }}}
""" search {{{
set incsearch
set history=100
set hlsearch
set ignorecase
set smartcase
nnoremap <silent> <M-h> :<C-u>nohlsearch<CR>
nnoremap <silent> <M-l> :<C-u>nohlsearch<CR><C-l>
nnoremap \* nzzzv
nnoremap \# Nzzzv
nnoremap n nzzzv
nnoremap N Nzzzv
"" grep
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
set grepprg=grep\ -nH
nnoremap <Leader>g :silent execute "grep! -R " .
\ shellescape(expand("<cWORD>")) . " ."<cr>:copen<cr>
"" help
set helplang=en
nnoremap <C-h> :<C-u>help<Space>
nnoremap <C-h><C-h> :<C-u>help<Space><C-r><C-w><CR>
nnoremap <C-t> <Nop>
nnoremap <C-]><C-]> <C-t>
" }}}
""" motion {{{
"" esc
inoremap hl <Esc>
inoremap jk <Esc>
"" arrows
nnoremap <Up> <Nop>
nnoremap <Right> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <C-a> <Home>
nnoremap <C-e> <End>
inoremap <Up> <Nop>
inoremap <Right> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
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
nnoremap qj :cnext<CR>
nnoremap qk :cprevious<CR>
"" matchit.vim
source $VIMRUNTIME/macros/matchit.vim
"" last position
augroup jump_to_last_pos
  autocmd!
  autocmd BufReadPost * if line("'\"") && line("'\"") <= line('$')
  \  | execute 'normal! g`"' | endif
augroup END
" }}}
""" appearance {{{
set showtabline=2
set tabline=%!misc#tabline#make()
set number
set t_Co=256
set listchars=tab:^_,trail:_
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
"" statusline (right side)
set statusline=%=%y\ %n\ %{pathshorten(expand('%f'))}
set statusline+=\ %{(&fenc!=''?&fenc:&enc)}\ %{&ff}
set statusline+=\ %m%r%{fugitive#head()}
set statusline+=\ %03l,%02v\ %P
set statusline+=\ %{ALEGetStatusLine()}
set laststatus=2
set colorcolumn=80
set cursorline
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
" }}}
""" buffer {{{
"" quickfix
augroup quickfix_open
  autocmd!
  autocmd QuickfixCmdPost make,grep,vimgrep if len(getqflist()) | copen | endif
augroup END
augroup quickfix_close
  autocmd!
  autocmd WinEnter *
  \  if (winnr('$') == 1) && (getbufvar(winbufnr(0), '&buftype')) == 'quickfix'
  \  | quit | endif
augroup END
"" complete
set completeopt+=menuone
set completeopt-=preview
"" echo area
set cmdheight=2
""" }}}
""" edit {{{
set wildmenu
set complete+=k
set commentstring=\ #\ %s
set foldlevel=0
nnoremap gc `[v`]
vnoremap gc :<C-u>normal gc<CR>
onoremap gc :<C-u>normal gc<CR>
set clipboard=unnamed,autoselect
set clipboard=autoselect
set backspace=indent,eol,start
set whichwrap=b,s,h,l,<,>,[,]
set virtualedit+=block
"" inc/dec
set nrformats=
noremap <M-a> <C-a>
noremap <M-d> <C-x>
"" surrond
vnoremap ' <Esc>`>a'<Esc>`<i'<Esc>`>2l
vnoremap " <Esc>`>a"<Esc>`<i"<Esc>`>2l
" }}}
""" encoding {{{
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set termencoding=utf-8
set fileformats=unix
" }}}
""" command & other keymaps {{{
inoremap <expr> <Leader>ds strftime('%a, %d. %b. %Y')
inoremap <expr> <Leader>dt strftime('%Y-%m-%dT%H:%M:%S')
" }}}
""" dict & thesaurus {{{
set thesaurus+=$HOME/.vim/thesaurus/mthesaur.txt
inoremap <Leader>lt <C-x><C-t>
" }}}
""" plugin {{{
"" columnjump
nmap <M-k> <Plug>(columnjump-backward)
nmap <M-j> <Plug>(columnjump-forward)
"" surround
nmap s  <Plug>Ysurround
nmap ss <Plug>Yssurround
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
\  'default': '',
\  'haskell': $HOME.'/.vim/dict/haskell.dict',
\  'java': $HOME.'/.vim/dict/java.dict',
\  'php': $HOME.'/.vim/dict/php.dict',
\  'ruby': $HOME.'/.vim/dict/ruby.dict',
\  'scheme': $HOME.'/.vim/dict/scheme.dict',
\  'vimshell': $HOME.'/.vimshell/command/history',
\}
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()
inoremap <expr><C-h> neocomplete#smart_close_popup().'\<C-h>'
inoremap <expr><C-e> neocomplete#cancel_popup()
"" echodoc
let g:echodoc_enable_at_startup = 1
"" vim-online-thesaurus
let g:online_thesaurus_map_keys = 0
nnoremap <Leader>ot :OnlineThesaurusCurrentWord<CR>
"" buftabs
let g:buftabs_only_basename = 1
let g:buftabs_in_statusline = 0
let g:buftabs_active_highlight_group = 'Visual'
noremap <Leader>bp :bprev<CR>
noremap <Leader>bn :bnext<CR>
"" yankstack
noremap <silent> <Leader>ys :Yanks<CR>
let g:yankstack_map_keys = 0
nmap <M-p> <Plug>yankstack_substitute_older_paste
nmap <M-n> <Plug>yankstack_substitute_newer_paste
"" ale
let g:ale_statusline_format = ['x %d', '! %d', '♡ ok']
let g:ale_sign_error = 'E'
let g:ale_sign_warning = 'W'
"" quickrun
let g:quickrun_config = {}
let g:quickrun_config['_'] = {
\  'hook/time/enable': 0,
\  'runner': 'vimproc',
\  'runner/vimproc/updatetime': 10,
\  'split': 'vertical',
\}
let g:quickrun_config['ruby.rspec'] = {
\  'command': 'rspec',
\  'cmdopt': "--format progress --profile --line_number %{line('.')}",
\  'exec': "bundle exec %c %o",
\}
let g:quickrun_config['lisp'] = {
\  'command': 'clisp',
\  'cmdopt': '',
\  'exec': "%c %o %s",
\}
let g:quickrun_config['scheme'] = {
\  'command': 'scheme',
\  'cmdopt': '--quiet --nocore',
\  'exec': "%c %o < %s",
\}
let g:quickrun_config['racket'] = {
\  'command': 'racket',
\  'cmdopt': '-W info',
\  'exec': "%c %o %s",
\}
let g:quickrun_config['coffee'] = {
\  'command': 'coffee',
\  'cmdopt': '-cbp',
\  'exec': "%c %o %s",
\}
let g:quickrun_config['asciidoc'] = {
\  'command': 'asciidoc',
\  'cmdopt': '--out-file="-" --theme="volnitsky" --backend=html5',
\  'outputter': 'browser',
\  'exec': "/usr/bin/python2.7 /usr/bin/asciidoc.py %o %s",
\}
let g:quickrun_config['markdown'] = {
\  'command': 'redcarpet',
\  'cmdopt': '--parse-fenced-code-blocks --parse-tables --parse-autolink',
\  'outputter': 'browser',
\  'exec': "%c %o %s",
\}
let g:quickrun_config['html'] = {
\  'command': 'cat',
\  'outputter': 'browser',
\  'exec': "%c %s",
\}
"" committia
let g:committia_hooks = {}
function! g:committia_hooks.edit_open(info)
  setlocal spell
  if a:info.vcs ==# 'git' && getline(1) ==# ''
    startinsert
  end
  imap <buffer><C-n> <Plug>(committia-scroll-diff-down-half)
  imap <buffer><C-p> <Plug>(committia-scroll-diff-up-half)
endfunction
"" devdocs
let g:devdocs_host = 'localhost:9292'
let g:devdocs_filetype_map = {
\  '*': ''
\}
"" vimwiki
let g:vimwiki_list = [{'path': '~/.atelier/opt/.sync/share/wiki'}]
"" vim-gfm-syntax
let g:gfm_syntax_highlight_mention = 0
let g:markdown_fenced_languages = ['python', 'ruby', 'zsh']
"" fugitive
nnoremap <silent> <Leader>gd :<C-u>Gdiff<CR>
nnoremap <silent> <Leader>gs :<C-u>Gstatus<CR>
nnoremap <silent> <Leader>gl :<C-u>Glog<CR>
nnoremap <silent> <Leader>gb :<C-u>Gbrowse<CR>
nnoremap <silent> <Leader>gg :<C-u>Ggrep<CR>
"" ctrlp
let g:ctrlp_map = '<F1>'
let g:ctrlp_custom_ignore =
\ '\v[\/]\.(git|hg|svn|bundle|swap|backup|cache)|'.
\ '\.(pyc|egg)|*.egg-info|'.
\ 'build|dist|pkg|target|'.
\ 'tmp|*sdk*'.
\ 'env|venv*|node_modules|components|vendor$'
let g:ctrlp_open_new_file = 't'
let g:ctrlp_open_multiple_files = 'tj'
"" skk takes <C-j>
let g:ctrlp_prompt_mappings = {
\ 'PrtClear()': ['<C-c>'],
\ 'PrtSelectMove("j")': ['<C-k>'],
\ 'PrtSelectMove("k")': ['<C-u>'],
\ 'AcceptSelection("t")': ['<C-a>'],
\ 'PrtExit()': ['<Esc>', '<C-g>']
\}
"" vim-ref
let g:ref_use_vimproc = 1
let g:ref_open = 'split'
let g:ref_cache_dir = expand('/tmp/vim_ref_cache/')
nmap <Leader>k <Plug>(ref-keyword)
" }}}
""" filesystem {{{
let g:netrw_browse_split = 2
let g:netrw_altv = 1
let g:netrw_winsize = ''
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
" }}}
""" programming {{{
set autoindent
set cindent
set cinwords=if,else,while,do,for,switch,case
nnoremap ]] ]m
nnoremap [[ [m
"" white space
nnoremap <Leader>W match:%s/\v\s+$//<CR>
nnoremap <Leader>w :match Error /\v\s+$/<CR>
augroup highlight_trailing_spaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme *
  \  highlight TrailingSpaces term=underline guibg=red ctermbg=red
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END
"" uppercase
inoremap <C-u> <C-o>viwU<C-o>`]<C-o>a
" }}}
""" filetype {{{
call misc#filetype#setup()
" }}}
""" dict {{{
call misc#dict#setup()
" }}}
""" vim {{{
let g:vim_indent_cont = 0
nnoremap <Leader>.e :<C-u>edit $MYVIMRC<CR>
nnoremap <Leader>.s :<C-u>source $MYVIMRC<CR>
augroup fold_vimrc
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}
