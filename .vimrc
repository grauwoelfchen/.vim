" Last Change: 06.Sep.2013
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
if has('unix') && system('uname')=~'Darwin'
  let s:os_type='osx'
else
  let s:os_type='linux'
endif
" }}}

""" bundle {{{
filetype off
"" neobundle
if &runtimepath !~ '/neobundle.vim'
  set runtimepath+=$HOME/.vim/bundle/neobundle.vim
endif
call neobundle#rc(expand("$HOME/.vim/bundle/"))
NeoBundle 'basyura/unite-rails', {
\  'depends': [
\   'Shougo/unite.vim',
\  ]
\}
NeoBundle 'choplin/unite-vim_hacks', {
\  'depends': [
\    'mattn/webapi-vim',
\    'mattn/wwwrenderer-vim',
\    'thinca/vim-openbuf'
\  ]
\}
NeoBundle 'danchoi/ri.vim'
NeoBundle 'deris/columnjump'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'ervandew/supertab'
NeoBundleLazy 'grauwoelfchen/hello-vim', {
\  'autoload' : {
\    'commands' : [ 'Say' ]
\  },
\}
NeoBundleLazy 'grauwoelfchen/pinponpanpon-vim', {
\  'autoload' : {
\    'commands' : [ 'PinponPanpon' ]
\  },
\  'depends': [
\    'mattn/webapi-vim'
\  ]
\}
NeoBundle 'h1mesuke/vim-alignta'
NeoBundle 'kana/vim-gf-user'
NeoBundle 'kana/vim-gf-diff'
NeoBundle 'kana/vim-smartinput'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kana/vim-textobj-indent'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'kmnk/vim-unite-giti'
NeoBundleLazy 'mattn/emmet-vim'
augroup emmet-vim
  autocmd!
  autocmd FileType html NeoBundleSource emmet-vim
augroup END
NeoBundleLazy 'mattn/togetter-vim', {
\  'autoload' : {
\    'commands' : [ 'TogetterRecent', 'TogetterHot' ]
\  },
\  'depends': [
\    'mattn/webapi-vim'
\  ]
\}
NeoBundle 'mattn/webapi-vim'
NeoBundleLazy 'mattn/ctrlp-gist', {
\  'autoload' : {
\    'commands' : [ 'CtrlPGist' ]
\  },
\  'depends': [
\    'kien/ctrlp.vim',
\    'mattn/webapi-vim',
\    'mattn/gist-vim'
\  ]
\}
NeoBundleLazy 'mattn/ctrlp-launcher', {
\  'autoload' : {
\    'commands' : [ 'CtrlPLauncher' ]
\  },
\  'depends': [
\    'kien/ctrlp.vim',
\  ]
\}
NeoBundleLazy 'mattn/gist-vim', {
\  'autoload' : {
\    'commands' : [ 'Gist' ]
\  },
\  'depends': [
\    'mattn/webapi-vim'
\  ]
\}
NeoBundle 'mattn/unite-advent_calendar', {
\  'depends': [
\    'mattn/webapi-vim',
\    'tyru/open-browser.vim',
\  ]
\}
"NeoBundle 'motemen/git-vim'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'Shougo/neocomplcache', {
\ 'depends': [
\   'Shougo/vimproc',
\ ]
\}
NeoBundle 'Shougo/neosnippet', {
\  'depends': [
\    'Shougo/neocomplcache',
\  ]
\}
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-outline', {
\  'depends': [
\   'Shougo/unite.vim',
\  ]
\}
NeoBundle 'Shougo/vimproc', {
\  'build': {
\    'unix': 'make -f make_unix.mak',
\    'mac' : 'make -f make_mac.mak'
\  }
\}
NeoBundleLazy 'Shougo/vimfiler', {
\  'autoload' : {
\    'commands' : [ 'VimFilerBufferDir' ]
\  },
\  'depends': [
\    'Shougo/unite.vim'
\  ],
\ }
NeoBundleLazy 'Shougo/vimshell', {
\  'autoload' : {
\    'commands' : [ 'VimShell' ]
\  },
\  'depends': [
\    'Shougo/vimproc',
\  ]
\}
NeoBundleLazy 'slim-template/vim-slim'
augroup vim-slim
  autocmd!
  autocmd FileType slim NeoBundleSource vim-slim
augroup END
NeoBundle 'tacroe/unite-mark', {
\  'depends': [
\    'Shougo/unite.vim',
\  ]
\}
NeoBundle 'tpope/vim-fugitive'
NeoBundleLazy 'tpope/vim-haml'
augroup vim-haml
  autocmd!
  autocmd FileType haml NeoBundleSource vim-haml
augroup END
NeoBundleLazy 'tpope/vim-rails'
augroup vim-rails
  autocmd!
  autocmd FileType ruby NeoBundleSource vim-rails
augroup END
NeoBundle 'tpope/vim-surround'
NeoBundleLazy 'tpope/vim-markdown'
augroup vim-markdown
  autocmd!
  autocmd FileType markdown NeoBundleSource vim-markdown
augroup END
NeoBundle 'thinca/vim-guicolorscheme'
NeoBundle 'thinca/vim-quickrun', {
\  'depends': [
\    'Shougo/vimproc',
\  ]
\}
NeoBundle 'thinca/vim-ref'
NeoBundle 'tsukkee/unite-help', {
\  'depends': [
\    'Shougo/unite.vim',
\    'tyru/open-browser.vim',
\  ]
\}
NeoBundle 'rhysd/open-pdf.vim'
NeoBundle 'tyru/open-browser.vim'
NeoBundleLazy 'vim-ruby/vim-ruby'
augroup vim-ruby
  autocmd!
  autocmd FileType ruby NeoBundleSource vim-ruby
augroup END
NeoBundle 'vim-jp/vimdoc-ja'
NeoBundle 'wlangstroth/vim-racket'
NeoBundleLazy 'wavded/vim-stylus'
augroup vim-stylus
  autocmd!
  autocmd FileType stylus NeoBundleSource vim-stylus
augroup END
"" vim-scripts
NeoBundle 'buftabs'
NeoBundle 'smartchr'
NeoBundle 'pep8'
NeoBundle 'sudo.vim'
NeoBundle 'YankRing.vim'
NeoBundle 'PDV--phpDocumentor-for-Vim'
NeoBundle 'taglist.vim'
NeoBundle 'MultipleSearch'
if s:os_type == 'osx'
  NeoBundle 'msanders/cocoa.vim'
end
"" source forge
NeoBundleLazy 'git://git.code.sf.net/p/vim-latex/vim-latex'
"" mercurial
NeoBundleLazy 'https://bitbucket.org/kovisoft/slimv'
let g:paredit_electric_return=0
let g:slimv_indent_keylists=0
augroup slimv
  autocmd!
  autocmd FileType lisp NeoBundleSource slimv
augroup END
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
  let separator = " | "
  let tabs = ' ' . join(labels, separator).separator."%#TablineFill#%T"
  let info = fnamemodify(getcwd(), ':~').' « '.hostname().' » '
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

""" template {{{
augroup apply_template
  autocmd!
  autocmd BufNewFile *.erl 0r $HOME/.vim/templates/erl.tpl
  autocmd BufNewFile *.rb  0r $HOME/.vim/templates/rb.tpl
augroup END
" }}}

""" command & other keymaps {{{
"" rename current file
command! -nargs=1 -complete=file Rename f <args>|call delete(expand('#'))
"" encoding
function! PutMagicComment()
  return "# encoding: utf-8"
endfunction
inoremap <Leader>## <C-r>=PutMagicComment()<Return>
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
inoremap <expr> = smartchr#loop('=', ' = ', ' == ', ' === ')
"" neocomplcache
let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_skip_completion_time=0.3
let g:neocomplcache_auto_completion_start_length=3
let g:neocomplcache_keyword_completion_start_length=3
let g:neocomplcache_enable_camel_case_completion=1
let g:neocomplcache_enable_underbar_completion=1
let g:neocomplcache_min_keyword_length=3
let g:neocomplcache_min_syntax_length=3
let g:neocomplcache_enable_smart_case=1
let g:neocomplcache_max_list=20
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns={}
endif
" let g:neocomplcache_omni_patterns={
" \  'ruby' : '[^.*\t]\.\w*\|\h\w*::'
" \}
if !exists('g:neocomplcache_dictionary_filetype_lists')
  let g:neocomplcache_dictionary_filetype_lists={}
endif
let g:neocomplcache_dictionary_filetype_lists={
\  'default'  : '',
\  'vimshell' : $HOME.'/.vimshell/command/history',
\  'ruby'     : $HOME.'/.vim/dict/ruby.dict',
\  'php'      : $HOME.'/.vim/dict/php.dict'
\}
inoremap <expr><C-x><Return> neocomplcache#smart_close_popup()."\<Return>"
inoremap <expr><C-g> neocomplcache#undo_completion()
inoremap <expr><C-l> neocomplcache#complete_common_string()
"" neosnippet
let g:neosnippet#snippets_directory=$HOME.'/.vim/snippets'
smap <C-k> <plug>(neosnippet_expand_or_jump)
imap <C-x> <plug>(neosnippet_expand_or_jump)
nmap <C-x> <plug>(neosnippet_expand_or_jump)
"" pep8
let g:pep8_map='<F8>'
"" unite
" let g:unite_enable_start_insert=1
let g:unite_split_rule="botright"
nnoremap <silent> ,b :<C-u>Unite buffer<Return>
nnoremap <silent> ,r :<C-u>Unite -buffer-name=register register<Return>
nnoremap <silent> ,f :<C-u>Unite file_mru<Return>
nnoremap <silent> ,d :<C-u>UniteWithBufferDir -buffer-name=files file<Return>
nnoremap <silent> ,a :<C-u>UniteWithBufferDir
\  -buffer-name=files buffer file_mru bookmark file<Return>
nnoremap <silent> ,h :<C-u>Unite -start-insert help<Return>
nnoremap <silent> ,g :<C-u>UniteWithCursorWord help<Return>
nnoremap <silent> ,m :<C-u>Unite mark<Return>
augroup setup_unite_spilt
  autocmd!
  autocmd FileType unite nnoremap <silent> <buffer> <expr> <C-k> unite#do_action('split')
  autocmd FileType unite inoremap <silent> <buffer> <expr> <C-k> unite#do_action('split')
  autocmd FileType unite nnoremap <silent> <buffer> <expr> <C-h> unite#do_action('vsplit')
  autocmd FileType unite inoremap <silent> <buffer> <expr> <C-h> unite#do_action('vsplit')
augroup END
augroup setup_unite_close
  autocmd!
  autocmd FileType unite nnoremap <silent> <buffer> <Esc><Esc> :q<Return>
  autocmd FileType unite inoremap <silent> <buffer> <Esc><Esc> <Esc>:q<Return>
augroup END
"" unite-rails
noremap ;rm :<C-u>Unite rails/model<Return>
noremap ;rv :<C-u>Unite rails/view<Return>
noremap ;rc :<C-u>Unite rails/controller<Return>
noremap ;rh :<C-u>Unite rails/helper<Return>
noremap ;rs :<C-u>Unite rails/stylesheet<Return>
noremap ;rj :<C-u>Unite rails/javascript<Return>
noremap ;rr :<C-u>Unite rails/route<Return>
noremap ;rg :<C-u>Unite rails/gemfile<Return>
noremap ;rt :<C-u>Unite rails/spec<Return>
noremap ;ra :<C-u>Unite rails/rake<Return>
"" nerdcommenter
let g:NERDCreateDefaultMappings=0
let g:NERDSpaceDelims=1
map  <Leader>cc <plug>NERDCommenterToggle
nmap <Leader>ca <plug>NERDCommenterAppend
nmap <leader>c$ <plug>NERDCommenterToEOL
vmap <Leader>cs <plug>NERDCommenterSexy
vmap <Leader>cb <plug>NERDCommenterMinimal
"" buftabs
let g:buftabs_only_basename=1
let g:buftabs_in_statusline=1
let g:buftabs_active_highlight_group="Visual"
noremap <Leader>bp :bprev<Return>
noremap <Leader>bn :bnext<Return>
"" yankring
noremap <silent> <F7> :YRShow<Return>
let g:yankring_history_dir=expand('$HOME/.vim/')
let g:yankring_history_file='.yankring_history'
let g:yankring_replace_n_pkey='<M-p>'
let g:yankring_replace_n_nkey='<M-n>'
let g:yankring_max_history=10
"" 2M
let g:yankring_max_element_length=1048576
let g:yankring_window_height=13
"" vim-latex
let g:Tex_CompileRule_dvi = 'latex $*'
let g:Tex_ViewRule_dvi = 'xdvi'
"" quickrun
let g:quickrun_config={}
let g:quickrun_config['_']={
\  'hook/time/enable'          : 1,
\  'runner'                    : 'vimproc',
\  'runner/vimproc/updatetime' : 10,
\  'split'                     : 'vertical',
\}
let g:quickrun_config['coffee']={
\  'command' : 'coffee',
\  'cmdopt'  : '-cbp',
\  'exec'    : "%c %o %s",
\}
let g:quickrun_config['markdown']={
\  'command'   : 'redcarpet',
\  'cmdopt'    : '--parse-fenced-code-blocks --parse-tables --parse-autolink',
\  'outputter' : 'browser',
\  'exec'      : "%c %o %s",
\}
let g:quickrun_config['ruby.rspec']={
\  'command' : 'rspec',
\  'cmdopt'  : "--format progress --profile --line_number %{line('.')}",
\  'exec'    : "bundle exec %c %o",
\}
let g:quickrun_config['lisp']={
\  'command' : 'clisp',
\  'cmdopt'  : "--silent",
\  'exec'    : "%c %o %s",
\}
let g:quickrun_config['racket']={
\  'command' : 'racket',
\  'cmdopt'  : "-W info",
\  'exec'    : "%c %o %s",
\}
let g:quickrun_config['python']={
\  'command'   : 'pep8',
\  'cmdopt'    : '--first',
\  'outputter' : 'quickfix',
\  'exec'      : "%c %o %s",
\}
let g:quickrun_config['html']={
\  'command'   : 'cat',
\  'outputter' : 'browser',
\  'exec'      : "%c %s",
\}
"" vimfiler
nnoremap <silent> <leader>fd :<C-u>VimFilerBufferDir -quit<Return>
"" ri.vim
"" split 0 => h, 1 => v
nnoremap ,i :call ri#OpenSearchPrompt(0)<Return>
nnoremap ,I :call ri#OpenSearchPrompt(1)<Return>
nnoremap ,K :call ri#LookupNameUnderCursor()<Return>
"" fugitive
nnoremap <silent> <Leader>gd :<C-u>Gdiff<Return>
nnoremap <silent> <Leader>gs :<C-u>Gstatus<Return>
nnoremap <silent> <Leader>gl :<C-u>Glog<Return>
nnoremap <silent> <Leader>gb :<C-u>Gbrowse<Return>
nnoremap <silent> <Leader>gg :<C-u>Ggrep<Return>
"" gist-vim
let s:hooks = neobundle#get_hooks('gist-vim')
function! s:hooks.on_source(hooks)
  if s:os_type == 'osx'
    let g:gist_clip_command='pbcopy'
  else
    let g:gist_clip_command='xclip -selection clipboard'
  endif
  let g:gist_detect_filetype=1
  let g:gist_open_browser_after_post=1
  let g:gist_open_browser_command='w3m %URL%'
  "" show embed tag of current gist
  function! s:gist_show_embed_tag()
    if exists('b:gist')
      let info = b:gist
      if len(info) != 0
        return '<script src="https://gist.github.com/'.info['id'].'.js?file='.info['filename'].'"></script>'
      endif
    endif
  endfunction
  function! s:gist_show(sbj)
    let obj = function('s:gist_show_'.a:sbj)()
    if len(obj) != 0
      copen
      setlocal buftype=nofile bufhidden=hide noswapfile
      setlocal modifiable
      silent %d _
      call setline(1, obj)
      setlocal nomodifiable
    endif
  endfunction
  command! -nargs=0 -range=% GistShowEmbedTag :call s:gist_show('embed_tag')
endfunction
""ctrlp
let g:ctrlp_custom_ignore=
\ '\v[\/]\.(git|hg|svn|bundle)'
\ .'|node_modules|components$'
let g:ctrlp_open_new_file='t'
let g:ctrlp_open_multiple_files='tj'
"" ctrlp-gist
nnoremap <C-g> :<C-u>CtrlPGist<Return>
"" ctrlp-launcher
nnoremap <C-e> :<C-u>CtrlPLauncher<Return>
"" emmet-vim
let s:hooks = neobundle#get_hooks('emmet-vim')
function! s:hooks.on_source(hooks)
  let g:user_emmet_expandabbr_key='<C-y>,'
  let g:user_emmet_complete_tag=1
  let g:user_emmet_settings={
  \  'lang': 'utf-8',
  \  'haml': {
  \    'extends': 'html',
  \  }
  \}
endfunction
"" slimv
let s:hooks = neobundle#get_hooks('slimv')
function! s:hooks.on_source(hooks)
  let g:slimv_swank_cmd =
  \  '!screen -dmS eval clisp -i $HOME/.vim/bundle/slimv/slime/start-swank.lisp'
  "\  '!xterm -e clisp -i $HOME/.vim/bundle/slimv/slime/start-swank.lisp &'
endfunction
"" my plugins :)
"" hello-vim
let s:hooks = neobundle#get_hooks('hello-vim')
function! s:hooks.on_source(hooks)
  let g:hello_say_words="Grüezi,Vim"
  let g:hello_say_voice="Alex"
endfunction
"" pinponpanpon-vim
let s:hooks = neobundle#get_hooks('pinponpanpon-vim')
function! s:hooks.on_source(hooks)
  let g:pinponpanpon_area_name="さいたま市"
endfunction
" }}}

""" filesystem {{{
" set autochdir
" let g:netrw_browse_split=2
let g:netrw_altv=1
let g:netrw_winsize=""
let g:netrw_bufsettings="noma nomod nu nobl nowrap ro"
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
"" ctags
if s:os_type == 'osx'
  "" via brew
  let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
else
  let Tlist_Ctags_Cmd='/usr/bin/ctags'
end
let Tlist_Show_One_File=1
let Tlist_Use_Horiz_Window=1
let Tlist_Exit_OnlyWindow=1
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

""" filetype {{{
augroup handle_as_markdown
  autocmd!
  autocmd BufNewFile,BufRead *.md,*.markdown,*.mkd setlocal filetype=markdown
augroup END
augroup handle_as_lisp
  autocmd!
  autocmd BufNewFile,BufRead .stumpwmrc,.clisprc setlocal filetype=lisp
augroup END
augroup handle_as_spec
  autocmd!
  autocmd BufNewFile,BufRead *_spec.rb setlocal filetype=ruby.rspec
augroup END
augroup handle_as_arduino
  autocmd!
  autocmd BufNewFile,BufRead *.pde setlocal filetype=arduino
augroup END
"" coffee
"" ruby
"" python
"" php
"" objc
"" arduino
"" svn
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
