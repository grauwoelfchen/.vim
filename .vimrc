""" basic {{{
if !1 | finish | endif
set nocompatible
set showcmd
set autoread
set ttyfast
set vb t_vb=
set belloff+=ctrlg
set hidden
set writebackup
set backup
set undofile
set backupdir=$HOME/.vim/.backup
set directory=$HOME/.vim/.swap
set undodir=$HOME/.vim/.undo
set noimcmdline
set iminsert=0
" completion
set wildmode=list:longest
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.tar.gz,*.tgz,.git/*
noremap ; :
noremap : ;
" leader
let g:mapleader = ","
let g:maplocalleader = "\\"
" }}}
""" bundle {{{
filetype off
" vim-plug
call plug#begin(expand($HOME.'/.vim/plugged'))
Plug 'aliou/bats.vim', {'for': 'bats'}
Plug 'artur-shaik/vim-javacomplete2', {'for': 'java'}
Plug 'b4winckler/vim-objc', {'for': 'objc'}
Plug 'beloglazov/vim-online-thesaurus'
Plug 'cespare/vim-toml'
Plug 'dag/vim2hs', {'for': 'haskell'}
Plug 'danchoi/ri.vim', {'for': 'ruby'}
Plug 'deton/eblook.vim'
Plug 'deris/columnjump'
Plug 'digitaltoad/vim-jade', {'for': 'jade'}
Plug 'eagletmt/ghcmod-vim', {'for': 'haskell'}
Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'}
Plug 'hsanson/vim-android'
Plug 'h1mesuke/vim-alignta'
Plug 'junegunn/fzf', {'do': './install --all'}
Plug 'kana/vim-gf-diff'
Plug 'kana/vim-gf-user'
Plug 'kana/vim-smartinput'
Plug 'kana/vim-smartchr'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
  " dep: vim-textobj-user
Plug 'kana/vim-textobj-line'
  " dep: vim-textobj-user
Plug 'kana/vim-textobj-fold'
  " dep: vim-textobj-user
Plug 'kana/vim-textobj-function'
  " dep: vim-textobj-user
Plug 'keremc/asyncomplete-racer.vim', {'for': 'rust'}
Plug 'kien/ctrlp.vim'
Plug 'kovisoft/slimv', {'for': 'lisp'}
Plug 'leafgarland/typescript-vim', {'for': 'typescript'}
Plug 'lepture/vim-jinja', {'for': 'jinja2'}
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'mattn/emmet-vim', {'for': 'html'}
Plug 'myhere/vim-nodejs-complete', {'for': 'javascript'}
Plug 'OmniSharp/omnisharp-vim', {'for': 'cs'}
Plug 'ojroques/vim-scrollstatus'
Plug 'oscarh/vimerl', {'for': 'erlang'}
Plug 'pangloss/vim-javascript', {'for': 'javascript'}
Plug 'pbrisbin/vim-syntax-shakespeare'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete-tags.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'purescript-contrib/purescript-vim', {'for': 'purescript'}
Plug 'rhysd/devdocs.vim'
Plug 'rhysd/clever-f.vim'
Plug 'rhysd/committia.vim'
Plug 'rhysd/open-pdf.vim'
Plug 'rhysd/vim-gfm-syntax', {'for': 'markdown'}
Plug 'rust-lang/rust.vim', {'for': 'rust'}
Plug 'Shougo/echodoc.vim'
Plug 'Shougo/vimproc.vim', {'do': 'make'}
Plug 'Shougo/vimshell.vim', {'on': 'VimShell'}
  " dep: vimproc
Plug 'slim-template/vim-slim', {'for': 'slim'}
Plug 'sophacles/vim-bundle-mako', {'for': 'mako'}
Plug 'sheerun/vim-polyglot'
Plug 'thinca/vim-quickrun'
  " dep: vimproc
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-haml', {'for': 'haml'}
Plug 'tpope/vim-markdown', {'for': 'markdown'}
Plug 'tpope/vim-rails', {'for': 'ruby'}
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-dispatch'
Plug 'thinca/vim-guicolorscheme'
Plug 'thinca/vim-ref'
Plug 'tyru/open-browser.vim'
Plug 'vimwiki/vimwiki'
Plug 'vim-latex/vim-latex', {'for': 'latex'}
Plug 'vim-ruby/vim-ruby', {'for': 'ruby'}
Plug 'vim-scripts/buftabs'
Plug 'vim-scripts/pep8', {'for': 'python'}
Plug 'vim-scripts/sudo.vim'
Plug 'wavded/vim-stylus', {'for': 'stylus'}
Plug 'wlangstroth/vim-racket', {'for': 'racket'}
Plug 'w0rp/ale'
Plug 'yuku-t/vim-ref-ri', {'for': 'ruby'}
call plug#end()
filetype plugin indent on
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
" grep
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
set grepprg=grep\ -nH
nnoremap <Leader>g :silent execute "grep! -R " .
\ shellescape(expand("<cWORD>")) . " ."<cr>:copen<cr>
" help
set helplang=en
nnoremap <C-h> :<C-u>help<Space>
nnoremap <C-h><C-h> :<C-u>help<Space><C-r><C-w><CR>
nnoremap <C-t> <Nop>
nnoremap <C-]><C-]> <C-t>
" }}}
""" motion {{{
" esc
inoremap hl <Esc>
inoremap jk <Esc>
" arrows
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
" command
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>
cnoremap <C-d> <Del>
" quickfix
nnoremap Q q
nnoremap q <Nop>
nnoremap qj :cnext<CR>
nnoremap qk :cprevious<CR>
" matchit.vim
source $VIMRUNTIME/macros/matchit.vim
" last position
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
" starting message
set shortmess+=c
set shortmess+=I
syntax enable
augroup apply_gui_color_scheme
  autocmd!
  runtime! plugged/vim-guicolorscheme/plugin/guicolorscheme.vim
  autocmd ColorScheme * GuiColorScheme gr_black
augroup END
colorscheme gr_black
" statusline (right side)
function! LinterStatus() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:errors = l:counts.error + l:counts.style_error
  let l:warnings = l:counts.total - l:errors
  return l:counts.total == 0 ? 'OK': printf(
  \  '%dW %dE', warnings, errors
  \)
endfunction
set statusline=%=%y\ %n\ %{pathshorten(expand('%f'))}
set statusline+=\ %{(&fenc!=''?&fenc:&enc)}\ %{&ff}
set statusline+=\ %m%r%{fugitive#head()}
set statusline+=\ %03l,%02v\ %P
set statusline+=\ %{ScrollStatus()}
set statusline+=\ %{LinterStatus()}%{'\ '}
set laststatus=2
set colorcolumn=80
set cursorline
augroup highlight_over_length
  autocmd BufEnter *
  \  highlight OverLength term=NONE cterm=NONE ctermfg=gray ctermbg=black
  autocmd BufEnter * match OverLength /\%81v.\+/
augroup END
set splitbelow
set splitright
" resize
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
" }}}
""" buffer {{{
" quickfix
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
" complete
set completeopt+=menuone
set completeopt+=preview
set completeopt+=noselect
" echo area
set noshowmode
set cmdheight=2
" }}}
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
" inc/dec
set nrformats=
noremap <M-a> <C-a>
noremap <M-d> <C-x>
" surrond
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
inoremap <expr> <Leader>ds strftime('%a %d %b %Y')
inoremap <expr> <Leader>dt strftime('%Y-%m-%dT%H:%M:%S')
inoremap <expr> <Leader>dz strftime('%FT%T%z')
inoremap <expr> <Leader>ts strftime('%I:%M %p')
inoremap <expr> <Leader>tt strftime('%T')
" }}}
""" dict & thesaurus {{{
set thesaurus+=$HOME/.vim/thesaurus/mthesaur.txt
inoremap <Leader>lt <C-x><C-t>
" }}}
""" plugin {{{
" shared
let g:dotsync = $HOME . '/.atelier/opt/.sync'
let g:python_single_target = '/usr/bin/python3.6'
" columnjump
nmap <M-k> <Plug>(columnjump-backward)
nmap <M-j> <Plug>(columnjump-forward)
" surround
nmap s  <Plug>Ysurround
nmap ss <Plug>Yssurround
" lsp
let g:lsp_fold_enabled = 0
let g:lsp_highlight_references_enabled = 1
let g:lsp_signs_enabled = 1
let g:lsp_signs_error = {'text': 'e'}
let g:lsp_signs_warning = {'text': 'w'}
let g:lsp_signs_hint = {'text': 'h'}
let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_text_edit_enabled = 0
" asyncomplete.vim
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "<Tab>"
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "<CR>"
" asyncomplete-tags.vim
au User asyncomplete_setup call
\ asyncomplete#register_source(asyncomplete#sources#tags#get_source_options({
\ 'name': 'tags',
\ 'whitelist': ['c'],
\ 'completor': function('asyncomplete#sources#tags#completor'),
\ 'config': {
\    'max_file_size': 50000000,
\  },
\ }))
" echodoc
let g:echodoc_enable_at_startup = 1
" vim-online-thesaurus
let g:online_thesaurus_map_keys = 0
nnoremap <Leader>ot :OnlineThesaurusCurrentWord<CR>
" open-browser
augroup open_browser_current
  command! OpenBrowserCurrent execute 'OpenBrowser' 'file:///'.
  \ expand('%:p:gs?\\?/?')
augroup END
" buftabs
let g:buftabs_only_basename = 1
let g:buftabs_in_statusline = 0
let g:buftabs_active_highlight_group = 'Visual'
noremap <Leader>bp :bprev<CR>
noremap <Leader>bn :bnext<CR>
" yankstack
noremap <silent> <Leader>ys :Yanks<CR>
let g:yankstack_map_keys = 0
nmap <M-p> <Plug>yankstack_substitute_older_paste
nmap <M-n> <Plug>yankstack_substitute_newer_paste
" ale
let g:ale_statusline_format = ['x %d', '! %d', '♡ ok']
let g:ale_sign_error = 'E'
let g:ale_sign_warning = 'W'
" quickrun
let g:quickrun_config = {}
let g:quickrun_config['_'] = {
\  'hook/time/enable': 0,
\  'runner': 'vimproc',
\  'runner/vimproc/updatetime': 10,
\  'split': 'vertical',
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
let g:quickrun_config['asciidoc'] = {
\  'command': 'asciidoc',
\  'cmdopt': '--out-file="-" --theme="volnitsky" --backend=html5',
\  'outputter': 'browser',
\  'exec': g:python_single_target . " /usr/bin/asciidoc.py %o %s",
\}
let g:quickrun_config['markdown'] = {
\  'command': 'redcarpet',
\  'cmdopt': '--parse-fenced-code-blocks --parse-tables --parse-autolink',
\  'outputter': 'browser',
\  'exec': "%c %o %s",
\}
let g:quickrun_config['rst'] = {
\  'command': 'rst2html5.py',
\  'outputter': 'browser',
\  'exec': "%c %o %s",
\}
let g:quickrun_config['html'] = {
\  'command': 'cat',
\  'outputter': 'browser',
\  'exec': "%c %s",
\}
" committia
let g:committia_hooks = {}
function! g:committia_hooks.edit_open(info)
  setlocal spell spelllang=en_gb
  if a:info.vcs ==# 'git' && getline(1) ==# ''
    startinsert
  end
  imap <buffer><C-n> <Plug>(committia-scroll-diff-down-half)
  imap <buffer><C-p> <Plug>(committia-scroll-diff-up-half)
endfunction
" devdocs
let g:devdocs_host = 'localhost:9292'
let g:devdocs_filetype_map = {'*': ''}
" vimwiki
let g:vimwiki_list = [{
\ 'path': g:dotsync . '/share/wiki', 'syntax': 'default', 'ext': '.txt',
\ 'diary_rel_path': 'journal', 'diary_index': 'index',
\ 'diary_header': 'Journal', 'auto_diary_index': 1, 'auto_tags': 1,
\}]
"let g:vimwiki_folding = 'list' ... this make opening file slow :'(
let g:vimwiki_hl_cb_checked = 1
let g:vimwiki_global_ext = 0
let g:vimwiki_diary_months = {
\ 1: 'Jan', 2: 'Feb', 3: 'Mar', 4: 'Apr', 5: 'May', 6: 'Jun',
\ 7: 'Jul', 8: 'Aug', 9: 'Sep', 10: 'Oct', 11: 'Nov', 12: 'Dec'
\}
nnoremap <Leader>wl :<C-u>VimwikiTabnewLink<CR>
nnoremap <Leader>wp :<C-u>VimwikiDiaryPrevDay<CR>
nnoremap <Leader>wn :<C-u>VimwikiDiaryNextDay<CR>
" vim-gfm-syntax
let g:gfm_syntax_highlight_mention = 0
let g:markdown_fenced_languages = ['python', 'ruby', 'zsh']
" fugitive
nnoremap <silent> <Leader>gd :<C-u>Gdiff<CR>
nnoremap <silent> <Leader>gs :<C-u>Gstatus<CR>
nnoremap <silent> <Leader>gl :<C-u>Glog<CR>
nnoremap <silent> <Leader>gb :<C-u>Gbrowse<CR>
nnoremap <silent> <Leader>gg :<C-u>Ggrep<CR>
setlocal tags=./.git/tags
" ctrlp
let g:ctrlp_map = '<F1>'
let g:ctrlp_custom_ignore =
\ '\v[\/]('.
\ '\.(pyc|egg*)|'.
\ '\.(git|hg|svn|bundle|swap|backup|cache)|'.
\ '(build|dist|pkg|release|target)\/*|'.
\ '(env|venv*|node_modules|components|vendor)\/*|'.
\ '**\/*\/([Oo]bj|[Dd]ebug|[Bb]uild|[Rr]elease|[Pp]ackages)\/*'.
\ ')$'
let g:ctrlp_open_new_file = 't'
let g:ctrlp_open_multiple_files = 'tj'
" skk takes <C-j>
let g:ctrlp_prompt_mappings = {
\ 'PrtClear()': ['<C-c>'],
\ 'PrtSelectMove("j")': ['<C-k>'],
\ 'PrtSelectMove("k")': ['<C-u>'],
\ 'AcceptSelection("t")': ['<C-a>'],
\ 'PrtExit()': ['<Esc>', '<C-g>']
\}
" vim-ref
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
" smartinput
call smartinput#define_rule({
\ 'at': '\s\+\%#',
\ 'char': '<CR>',
\ 'input': "<C-o>:call setline(".
\   "'.', substitute(getline('.'), '\\s\\+$', '', '')".
\ ")<CR><CR>",
\ })
" }}}
""" programming {{{
set autoindent
set cindent
set cinwords=if,else,while,do,for,switch,case
nnoremap ]] ]m
nnoremap [[ [m
" white space
nnoremap <Leader>W match:%s/\v\s+$//<CR>
nnoremap <Leader>w :match Error /\v\s+$/<CR>
augroup highlight_trailing_spaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme *
  \  highlight TrailingSpaces term=underline guibg=red ctermbg=red
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END
" uppercase
inoremap <C-u> <C-o>viwU<C-o>`]<C-o>a
" }}}
""" filetype {{{
call misc#filetype#setup()
" }}}
""" dict {{{
call misc#dict#setup()
" }}}
""" vim {{{
call misc#vim#setup()
" }}}
