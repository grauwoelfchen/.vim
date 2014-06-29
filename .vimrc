" Last Change: 14.Jun.2014

""" basic {{{
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
"" ime
set noimcmdline
set iminsert=0
noremap ; :
noremap : ;
"" completion
set wildmode=list:longest
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.tar.gz,*.tgz,.git/*
"" leader
let g:mapleader = ","
let g:maplocalleader = "\\"
" }}}

""" bundle {{{
filetype off
"" neobundle
if &runtimepath !~ '/neobundle.vim'
  set runtimepath+=$HOME/.vim/bundle/neobundle.vim
endif
call neobundle#rc(expand($HOME.'/.vim/bundle/'))
NeoBundle 'deris/columnjump'
NeoBundle 'rhysd/clever-f.vim'
NeoBundle 'h1mesuke/vim-alignta'
NeoBundle 'kana/vim-gf-user'
NeoBundle 'kana/vim-gf-diff'
NeoBundle 'kana/vim-smartinput'
NeoBundle 'smartchr'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kana/vim-textobj-indent'
NeoBundle 'tpope/vim-surround'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'maxbrunsfeld/vim-yankstack'
NeoBundle 'Shougo/neocomplete'
NeoBundle 'buftabs'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'thinca/vim-guicolorscheme'
NeoBundle 'danchoi/ri.vim'
NeoBundle 'thinca/vim-ref'
NeoBundle 'vim-jp/vimdoc-ja'
NeoBundle 'taglist.vim'
NeoBundle 'sudo.vim'
NeoBundle 'rhysd/open-pdf.vim'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'rhysd/committia.vim'
NeoBundle 'Shougo/vimproc', {
\  'build': {'unix': 'make -f make_unix.mak'}
\}
NeoBundle 'thinca/vim-quickrun', {
\  'depends': ['Shougo/vimproc']
\}
NeoBundleLazy 'Shougo/vimshell', {
\  'depends': ['Shougo/vimproc'],
\  'autoload': {'commands': ['VimShell']}
\}
NeoBundleLazy 'kovisoft/slimv', {
\  'autoload': {'filetypes': ['lisp', 'scheme', 'racket']}
\}
NeoBundleLazy 'wlangstroth/vim-racket', {
\  'autoload': {'filetypes': ['scheme', 'racket']}
\}
NeoBundleLazy 'kchmck/vim-coffee-script', {
\  'autoload': {'filetypes': ['coffee']}
\}
NeoBundleLazy 'wavded/vim-stylus', {
\  'autoload': {'filetypes': ['stylus']}
\}
NeoBundleLazy 'digitaltoad/vim-jade', {
\  'autoload': {'filetypes': ['jade']}
\}
NeoBundleLazy 'vim-ruby/vim-ruby', {
\  'autoload': {'filetypes': ['ruby']}
\}
NeoBundleLazy 'tpope/vim-rails', {
\  'autoload': {'filetypes': ['ruby']}
\}
NeoBundleLazy 'slim-template/vim-slim', {
\  'autoload': {'filetypes': ['slim']}
\}
NeoBundleLazy 'tpope/vim-haml', {
\  'autoload': {'filetypes': ['haml']}
\}
NeoBundleLazy 'git://git.code.sf.net/p/vim-latex/vim-latex', {
\  'autoload': {'filetypes': ['latex']}
\}
NeoBundleLazy 'pep8', {
\  'autoload': {'filetypes': ['python']}
\}
NeoBundleLazy 'mattn/emmet-vim', {
\  'autoload': {'filetypes': ['html','eruby']}
\}
NeoBundleLazy 'tpope/vim-markdown', {
\  'autoload': {'filetypes': ['markdown']}
\}
if neobundle#exists_not_installed_bundles()
  echomsg 'Not installed bundles : ' .
  \  string(neobundle#get_not_installed_bundle_names())
  echomsg 'Please execute ":NeoBundleInstall" command.'
  finish
endif
filetype plugin indent on
" }}}

""" search {{{
set incsearch
set history=100
set hlsearch
set ignorecase
set smartcase
nnoremap <silent> <M-h> :<C-u>nohlsearch<Return>
nnoremap <silent> <M-l> :<C-u>nohlsearch<Return><C-l>
nnoremap \* nzzzv
nnoremap \# Nzzzv
nnoremap n nzzzv
nnoremap N Nzzzv
"" grep
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
set grepprg=grep\ -nH
"" help
set helplang=en
nnoremap <C-h> :<C-u>help<Space>
nnoremap <C-h><C-h> :<C-u>help<Space><C-r><C-w><Return>
nnoremap <C-t> <Nop>
nnoremap <C-]><C-]> <C-t>
" }}}

""" motion {{{
noremap j gj
noremap k gk
nnoremap <C-a> <Home>
nnoremap <C-e> <End>
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
  autocmd BufReadPost * if line("'\"") && line("'\"") <= line('$')
  \  | execute 'normal! g`"' | endif
augroup END
" }}}

""" appearance {{{
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
  let updated = len(filter(copy(bufnrs), 'getbufvar(v:val, "&modified")')) ?
    \ '+' : ''
  let blank = (bufs.updated) ==? '' ? '' : ' '
  let fname = pathshorten(bufname(curbufnr))
  return '%'.a:n.'T'.bufs.updated.blank.'%#'.hl.'#'.fname.'%T%#TablineFill#'
endfunction
function! MakeTabLine()
  let labels = map(range(1, tabpagenr('$')), 's:tab_label(v:val)')
  let separator = ' | '
  let tabs = ' ' . join(labels, separator).separator.'%#TablineFill#%T'
  let info = fnamemodify(getcwd(), ':~').' « '.hostname().' » '
  return tabs.'%='.info
endfunction
set showtabline=2
set tabline=%!MakeTabLine()
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
" }}}

""" edit {{{
set wildmenu
set complete+=k
set commentstring=\ #\ %s
set foldlevel=0
nnoremap gc `[v`]
vnoremap gc :<C-u>normal gc<Return>
onoremap gc :<C-u>normal gc<Return>
set clipboard=unnamed,autoselect
set clipboard=autoselect
set backspace=indent,eol,start
set whichwrap=b,s,h,l,<,>,[,]
set virtualedit+=block
"" inc/dec
set nrformats=
noremap <M-a> <C-a>
noremap <M-d> <C-x>
" }}}

""" encoding {{{
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set termencoding=utf-8
set fileformats=unix
" }}}

""" command & other keymaps {{{
inoremap <expr> <Leader>ids strftime('%a, %d. %b. %Y')
inoremap <expr> <Leader>idt strftime('%Y-%m-%dT%H:%M:%S')
"" umlaut & eszett (alternative keymaps), use digraph <C-k>[a,u,o]: in vim
function! CopyChar(c)
  redir @+> | execute 'echo "'.a:c.'"' | redir END
endfunction
nnoremap <expr> <Leader>a: CopyChar('ä')
nnoremap <expr> <Leader>u: CopyChar('ü')
nnoremap <expr> <Leader>o: CopyChar('ö')
nnoremap <expr> <Leader>ss CopyChar('ß')
" }}}

""" plugin {{{
"" columnjump
nmap <C-k> <Plug>(columnjump-backward)
nmap <C-j> <Plug>(columnjump-forward)
"" surround
nmap s  <Plug>Ysurround
nmap ss <Plug>Yssurround
"" smartchr
inoremap <expr> = smartchr#loop('=', ' = ', ' == ', ' === ')
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
\  'vimshell': $HOME.'/.vimshell/command/history',
\  'scheme': $HOME.'/.vim/dict/scheme.dict',
\  'ruby': $HOME.'/.vim/dict/ruby.dict',
\  'java': $HOME.'/.vim/dict/java.dict',
\  'php': $HOME.'/.vim/dict/php.dict'
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
"" yankstack
noremap <silent> <Leader>ys :Yanks<Return>
let g:yankstack_map_keys = 0
nmap <M-p> <plug>yankstack_substitute_older_paste
nmap <M-n> <plug>yankstack_substitute_newer_paste
"" quickrun
let g:quickrun_config = {}
let g:quickrun_config['_'] = {
\  'hook/time/enable': 1,
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
\  'cmdopt': "",
\  'exec': "%c %o %s",
\}
let g:quickrun_config['racket'] = {
\  'command': 'racket',
\  'cmdopt': "-W info",
\  'exec': "%c %o %s",
\}
let g:quickrun_config['python'] = {
\  'command': 'pep8',
\  'cmdopt': '--first',
\  'outputter': 'quickfix',
\  'exec': "%c %o %s",
\}
let g:quickrun_config['coffee'] = {
\  'command': 'coffee',
\  'cmdopt': '-cbp',
\  'exec': "%c %o %s",
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
function! g:committia_hooks.edit_open()
  setlocal spell
endfunction
"" ri.vim
"" split 0 => h, 1 => v
nnoremap <Leader>rh :call ri#OpenSearchPrompt(0)<Return>
nnoremap <Leader>rv :call ri#OpenSearchPrompt(1)<Return>
nnoremap <Leader>rk :call ri#LookupNameUnderCursor()<Return>
"" fugitive
nnoremap <silent> <Leader>gd :<C-u>Gdiff<Return>
nnoremap <silent> <Leader>gs :<C-u>Gstatus<Return>
nnoremap <silent> <Leader>gl :<C-u>Glog<Return>
nnoremap <silent> <Leader>gb :<C-u>Gbrowse<Return>
nnoremap <silent> <Leader>gg :<C-u>Ggrep<Return>
"" ctrlp
let g:ctrlp_map = '<F1>'
let g:ctrlp_custom_ignore =
\ '\v[\/]\.(git|hg|svn|bundle|swap|backup)|node_modules|components|vendor$'
let g:ctrlp_open_new_file = 't'
let g:ctrlp_open_multiple_files = 'tj'
let g:ctrlp_prompt_mappings = {
\  'AcceptSelection("t")': ['<C-a>']
\ }
"" slimv
let s:hooks = neobundle#get_hooks('slimv')
function! s:hooks.on_source(hooks)
  let g:paredit_electric_return = 0
  let g:swank_log = 0
  let g:slimv_keybindings = 1
  let g:slimv_indent_keylists = 0
  let g:slimv_repl_simple_compl = 1
  let g:slimv_repl_name = 'repl'
  let g:slimv_repl_split = 1
  let g:slimv_swank_cmd =
  \  '!screen -dmS lisp clisp -i '.
  \  $HOME.'/.vim/bundle/slimv/slime/start-swank.lisp'
  "\  '!screen -dmS scheme mit-scheme --load '.
  "\  $HOME.'/.vim/bundle/slimv/slime/contrib/swank-mit-scheme.scm'
endfunction
"" vim-latex
let s:hooks = neobundle#get_hooks('vim-latex')
function! s:hooks.on_source(hooks)
  let g:Tex_CompileRule_dvi = 'latex $*'
  let g:Tex_ViewRule_dvi = 'xdvi'
endfunction
"" pep8
let s:hooks = neobundle#get_hooks('pep8')
function! s:hooks.on_source(hooks)
  let g:pep8_map = '<F8>'
endfunction
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

""" filesystem {{{
"set autochdir
let g:netrw_browse_split = 2
let g:netrw_altv = 1
let g:netrw_winsize = ''
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
" }}}

""" programming {{{
set autoindent
"set smartindent
set cindent
set cinwords=if,else,while,do,for,switch,case
nnoremap ]] ]m
nnoremap [[ [m
"" ctags
let g:Tlist_Ctags_Cmd = '/usr/bin/ctags'
let g:Tlist_Show_One_File = 1
let g:Tlist_Use_Horiz_Window = 1
let g:Tlist_Exit_OnlyWindow = 1
"" white space
nnoremap <Leader>ws ma:%s/  *$//<Return>`a<ESC>
"augroup replace_white_space
"  autocmd!
"  autocmd BufWritePre * :%s/\s\+$//ge
"  autocmd BufWritePre * :%s/\t/  /ge
"augroup END
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
augroup treat_as_lisp
  autocmd!
  autocmd BufNewFile,BufRead .stumpwmrc,.clisprc setlocal filetype=lisp
augroup END
augroup treat_as_spec
  autocmd!
  autocmd BufNewFile,BufRead *_spec.rb setlocal filetype=ruby.rspec
augroup END
" }}}

""" vim {{{
let g:vim_indent_cont = 0
nnoremap <Leader>.e :<C-u>edit $MYVIMRC<Return>
nnoremap <Leader>.s :<C-u>source $MYVIMRC<Return>
augroup fold_vimrc
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}
