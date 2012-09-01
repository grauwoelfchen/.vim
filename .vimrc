" Last Change: Sun, 26. Aug. 2012
scriptencoding utf-8

""" basic {{{
set nocompatible
set showmode
set showcmd
set autoread
set ttyfast
"" nobeep
set vb t_vb=
set writebackup
set backup
set backupdir=$HOME/.vim/.backup
set directory=$HOME/.vim/.swap
" set nobackup
" set noswapfile
"" IME
set noimcmdline
set iminsert=0
if has('unix') && system('uname')=~'Darwin'
  let s:os_type='mac'
else
  let s:os_type='linux'
endif
" }}}

""" bundle {{{
filetype off
"" neobundle
if &runtimepath !~ '/neobundle.vim'
  set runtimepath+=$HOME/.vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand("$HOME/.vim/bundle/"))
NeoBundle 'danchoi/ri.vim'
NeoBundle 'ervandew/supertab'
NeoBundle 'grauwoelfchen/hello-vim'
NeoBundle 'grauwoelfchen/pinponpanpon-vim', {
\  'depends': [
\    'mattn/webapi-vim'
\  ]
\}
NeoBundle 'h1mesuke/vim-alignta'
NeoBundle 'kana/vim-gf-user'
NeoBundle 'kana/vim-gf-diff'
NeoBundle 'mattn/zencoding-vim'
NeoBundle 'mattn/togetter-vim', {
\  'depends': [
\    'mattn/webapi-vim'
\  ]
\}
NeoBundle 'mattn/webapi-vim'
NeoBundle 'motemen/git-vim'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'sudo.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neocomplcache-snippets-complete'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimshell', {
\  'depends': [
\    'Shougo/vimproc'
\  ]
\}
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-haml'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'thinca/vim-ref'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-guicolorscheme'
NeoBundle 'ujihisa/quickrun'
NeoBundle 'vim-ruby/vim-ruby'
"" vim-scripts
NeoBundle 'AutoClose'
NeoBundle 'buftabs'
NeoBundle 'ShowMarks'
NeoBundle 'YankRing.vim'
NeoBundle 'PDV--phpDocumentor-for-Vim'
NeoBundle 'taglist.vim'
if s:os_type == 'mac'
  NeoBundle 'msanders/cocoa.vim'
end
""
NeoBundle 'https://bitbucket.org/ns9tks/vim-l9/'
NeoBundle 'https://bitbucket.org/ns9tks/vim-fuzzyfinder', {
\  'depends': [
\    'https://bitbucket.org/ns9tks/vim-l9/'
\  ]
\}
if neobundle#exists_not_installed_bundles()
  echomsg 'Not installed bundles : ' .
        \ string(neobundle#get_not_installed_bundle_names())
  echomsg 'Please execute ":NeoBundleInstall" command.'
" finish
endif
filetype plugin indent on
syntax enable
" }}}

""" search {{{
set incsearch
set history=100
set hlsearch
set ignorecase
set smartcase
nnoremap <Esc><Esc> :nohlsearch<CR><Esc>
nnoremap \* nzzzv
nnoremap \# Nzzzv
nnoremap n nzzzv
nnoremap N Nzzzv
"" grep
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
set grepprg=grep\ -nH
augroup quickfix_open
  autocmd!
  autocmd QuickfixCmdPost make,grep,vimgrep if len(getqflist()) | copen | endif
augroup END
"" help
nnoremap <C-i><C-i> :<C-u>help<Space><C-r><C-w><Enter>
" }}}

""" move {{{
"" normal
noremap <C-a> <Home>
noremap <C-e> <End>
nnoremap j gj
nnoremap k gk
"" command
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>
cnoremap <C-d> <Del>
"" matchit.vim
source $VIMRUNTIME/macros/matchit.vim
"" buffer
set hidden
" }}}

""" view {{{
" set title
" set ruler
set number
" set t_Co=256
" set list
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
augroup apply_gui_color_scheme
  autocmd!
  runtime! bundle/vim-guicolorscheme/plugin/guicolorscheme.vim
  autocmd ColorScheme * GuiColorScheme gr_black
augroup END
colorscheme gr_black
"" right side
set statusline=%=%y\ %n\ %f
set statusline+=\ %{(&fenc!=''?&fenc:&enc)}\ %{&ff}
set statusline+=\ %m%r%{fugitive#head()}
set statusline+=\ %03l,%02v\ %P
set laststatus=2
" set colorcolumn=80
augroup highlight_over_length
  autocmd BufEnter * highlight OverLength term=NONE cterm=NONE ctermfg=gray ctermbg=black
  autocmd BufEnter * match OverLength /\%81v.\+/
augroup END
" }}}

""" edit {{{
set wildmenu
set complete+=k
set commentstring=\ #\ %s
set foldlevel=0
" set paste
noremap qp `[v`]
" noremap <expr> qp '`['.strpart(getregtype(), 0, 1).'`]'
set clipboard=unnamed,autoselect
set backspace=indent,eol,start
set whichwrap=b,s,h,l,<,>,[,]
"" visual
set virtualedit+=block
" }}}

""" encoding {{{
set encoding=utf-8
set fileencodings=utf-8
set fileformats=unix
" }}}

""" template {{{
augroup apply_template
  autocmd!
  autocmd BufNewFile *.rb 0r $HOME/.vim/templates/rb.tpl
augroup END
" }}}

""" command {{{
"" rename current file
command! -nargs=1 -complete=file Rename f <args>|call delete(expand('#'))
"" date
inoremap <expr> ,dd strftime('%a, %d. %b. %Y')
"" me
inoremap <expr> ,mu 'grauwoelfchen'
inoremap <expr> ,me 'y.grauwoelfchen@gmail.com <Yasuhiro Asaka>'
"" encoding
function! PutMagicComment()
  return "# encoding: utf-8\<CR><CR>"
endfunction
inoremap <buffer> <Leader>## <C-R>=PutMagicComment()<CR>
" }}}

""" plugin {{{
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
let g:neocomplcache_snippets_dir=$HOME.'/.vim/snippets'
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
\  'default' : '',
\  'ruby'    : $HOME.'/.vim/dict/ruby.dict',
\  'php'     : $HOME.'/.vim/dict/php.dict'
\}
imap <C-k> <Plug>(neocomplcache_snippets_expand)
"" for selected default
smap <C-k> <Plug>(neocomplcache_snippets_expand)
imap <C-x> <Plug>(neocomplcache_snippets_force_jump)
nmap <C-x> <Plug>(neocomplcache_snippets_force_expand)
inoremap <expr><C-x><CR> neocomplcache#smart_close_popup()."\<CR>"
inoremap <expr><C-g> neocomplcache#undo_completion()
inoremap <expr><C-l> neocomplcache#complete_common_string()
"" zencoding
let g:user_zen_expandabbr_key='<C-y>,'
let g:user_zen_complete_tag=1
let g:user_zen_settings={
\  'lang': 'utf-8',
\  'haml': {
\    'extends': 'html',
\  }
\}
"" unite
" let g:unite_enable_start_insert=1
let g:unite_split_rule="botright"
nnoremap <silent> ,b :<C-u>Unite buffer<CR>
nnoremap <silent> ,r :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,m :<C-u>Unite file_mru<CR>
nnoremap <silent> ,f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,a :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
augroup setup_unite_window
  autocmd!
  autocmd FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
  autocmd FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
  autocmd FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
  autocmd FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
augroup END
augroup setup_unite_close
  autocmd!
  autocmd FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
  autocmd FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q
augroup END
"" nerdcommenter
let g:NERDCreateDefaultMappings=0
let g:NERDSpaceDelims=1
map  <Leader>cc <Plug>NERDCommenterToggle
nmap <Leader>ca <Plug>NERDCommenterAppend
nmap <leader>c$ <Plug>NERDCommenterToEOL
vmap <Leader>cs <Plug>NERDCommenterSexy
vmap <Leader>cb <Plug>NERDCommenterMinimal
"" buftabs
let g:buftabs_only_basename=1
let g:buftabs_in_statusline=1
let g:buftabs_active_highlight_group="Visual"
noremap <Leader>bp :bprev<CR>
noremap <Leader>bn :bnext<CR>
"" showmarks
let g:showmarks_include="abcdefghijklmnopqlstuvwxyzABCDEFGHIJKLMNOPQLZTUVWXYZ"
let g:showmarks_textlower="*"
highlight SignColumn ctermfg=white ctermbg=black cterm=none
highlight default ShowMarksHLl ctermfg=red ctermbg=black cterm=none
highlight default ShowMarksHLu ctermfg=red ctermbg=black cterm=none
highlight default ShowMarksHLo ctermfg=red ctermbg=black cterm=none
highlight default ShowMarksHLm ctermfg=red ctermbg=black cterm=none
"" yankring
noremap <silent> <F7> :YRShow<CR>
let g:yankring_history_dir=expand('$HOME/.vim/')
let g:yankring_history_file='.yankring_history'
let g:yankring_max_history=10
"" 2M
let g:yankring_max_element_length=1048576
let g:yankring_window_height=13
"" vimfiler
nnoremap <silent> ,fd :<C-u>VimFilerBufferDir -quit<CR>
"" ri.vim
"" split 0 => h, 1 => v
nnoremap ,r :call ri#OpenSearchPrompt(0)<CR>
nnoremap ,R :call ri#OpenSearchPrompt(1)<CR>
nnoremap ,K :call ri#LookupNameUnderCursor()<CR>
"" my plugins :)
"" hello-vim
let g:hello_say_words="Grüezi,Vim"
let g:hello_say_voice="Alex"
"" pinponpanpon-vim
let g:pinponpanpon_area_name="さいたま市"
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
if s:os_type == 'linux'
  let Tlist_Ctags_Cmd='/usr/bin/ctags'
else
  "" emacs on mac via brew
  let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
end
let Tlist_Show_One_File=1
let Tlist_Use_Horiz_Window=1
let Tlist_Exit_OnlyWindow=1
"" white space
" augroup replace_white_space
  " autocmd!
  " autocmd BufWritePre * :%s/\s\+$//ge
  " autocmd BufWritePre * :%s/\t/  /ge
" augroup END
augroup highlight_trailing_spaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END
"" omnifunc
" set omnifunc=syntaxcomplete#Complete
" }}}

""" filetype {{{
augroup handle_ruby
  autocmd!
  autocmd BufNewFile,BufRead *.eruby setlocal filetype=ruby
augroup END
augroup handle_php
  autocmd!
  autocmd BufNewFile,BufRead *.ctp, *.html setlocal filetype=php
augroup END
augroup handle_arduino
  autocmd!
  autocmd BufNewFile,BufRead *.pde setlocal filetype=arduino
augroup END
"" ruby
"" python
"" php
"" objc
"" arduino
"" svn
" }}}

""" vim {{{
let g:vim_indent_cont = 0
noremap <Space>s. :<C-u>source $MYVIMRC<CR>
augroup fold_vimrc
  autocmd!
  autocmd FileType vim setl foldmethod=marker
augroup END
"" load settings for each location.
let g:loaded_vimrc = 0
augroup load_vimrc_local
  autocmd!
  autocmd BufNewFile,BufReadPost * call s:vimrc_local(expand('<afile>:p:h'))
augroup END
function! s:vimrc_local(loc)
  let files = findfile('.vimrc.local', escape(a:loc, ' ') . ';', -1)
  for i in reverse(filter(files, 'filereadable(v:val)'))
    source `=i`
  endfor
endfunction
if g:loaded_vimrc == 0
  call s:vimrc_local(getcwd())
endif
" }}}
