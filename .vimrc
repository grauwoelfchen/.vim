" Last Change: Sams. 18 Aug. 2012
scriptencoding utf-8

""" basic {{{
set nocompatible
set showmode
set showcmd
set autoread
set ttyfast
"" beep
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
set grepprg=grep\ -nh
"" help
nnoremap <C-i><C-i> :<C-u>help<Space><C-r><C-w><Enter>
" }}}

""" move {{{
noremap <C-e> <END>
noremap <C-a> <HOME>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
" nnoremap j gj
" nnoremap k gk
"" matchit.vim
source $VIMRUNTIME/macros/matchit.vim
" }}}

""" view {{{
set title
set ruler
set number
"set t_Co=256
augroup apply_gui_color_scheme
  autocmd!
  runtime! bundle/vim-guicolorscheme/plugin/guicolorscheme.vim
  autocmd ColorScheme * GuiColorScheme gr_black
augroup END
colorscheme gr_black
" set list listchars=tab:^_,trail:_
set showmatch
set matchtime=2
set wrap
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set textwidth=0
set statusline=%=%y\ %n\ %f
set statusline+=\ %{(&fenc!=''?&fenc:&enc)}\ %{&ff}
set statusline+=\ %m%r%{fugitive#head()}
set statusline+=\ %03l,%02v\ %P
set laststatus=2
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

""" other {{{
"" encoding
set encoding=utf-8
set fileencodings=utf-8
set fileformats=unix
" undo
set hidden
" set autochdir
" starting message
set shortmess+=I
"" template
augroup apply_template
  autocmd!
  autocmd BufNewFile *.rb 0r ~/.vim/templates/rb.tpl
augroup END
" }}}

""" plugin {{{
"" pathhogen
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
syntax enable
filetype plugin indent on
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
" let g:neocomplcache_omni_patterns={
" \  'ruby' : ''
" \}
let g:neocomplcache_snippets_dir=$HOME.'/.vim/snippets'
let g:neocomplcache_dictionary_filetype_lists={
\  'default' : '',
\  'ruby'    : $HOME.'/.vim/dict/ruby.dict',
\  'php'     : $HOME.'/.vim/dict/php.dict'
\}
inoremap <expr><C-x><CR> neocomplcache#smart_close_popup()."\<CR>"
imap <C-x> <Plug>(neocomplcache_snippets_expand)
smap <C-x> <Plug>(neocomplcache_snippets_expand)
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
nnoremap <silent> ,Ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,Uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,Ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,Um :<C-u>Unite file_mru<CR>
nnoremap <silent> ,Uu :<C-u>Unite buffer file_mru<CR>
nnoremap <silent> ,Ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
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
noremap <f1> :bprev<CR>
noremap <f2> :bnext<CR>
"" showmarks
let g:showmarks_include="abcdefghijklmnopqlstuvwxyzABCDEFGHIJKLMNOPQLSTUVWXYZ"
"" marks_corey.vim
map md <Plug>Remove_all_signs
map mm <Plug>Place_sign
map mn <Plug>Goto_next_sign
map mp <Plug>Goto_prev_sign
map m. <Plug>Move_sign
"" yankring
noremap <silent> <F7> :YRShow<CR>
let g:yankring_history_dir=expand('$HOME/.vim/')
let g:yankring_history_file='.yankring_history'
let g:yankring_max_history=10
let g:yankring_max_element_length=1048576 "2M
let g:yankring_window_height=13
"" bundle plugin off
" let g:pathogen_disabled = [
" \ 'neocomplcache',
" \ 'unite-vim',
" \]
"" my plugins :)
"" hello-vim
let g:hello_say_words="Grüezi,Vim"
let g:hello_say_voice="Alex"
"" pinponpanpon-vim
let g:pinponpanpon_area_name="さいたま市"
" }}}

""" filer {{{
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
set smartindent
set cindent
set cinwords=if,else,while,do,for,switch,case
nnoremap ]] ]m
nnoremap [[ [m
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
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
"" omnifunc [C-x, C-o]
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

""" function {{{
"" rename current file
command! -nargs=1 -complete=file Rename f <args>|call delete(expand('#'))
"" date
inoremap <expr> ,dd strftime('%a, %d. %b. %Y')
"" encoding
function! MagicComment()
  return "# encoding: utf-8\<CR>"
endfunction
inoreabbrev <buffer> <Leader>## <C-R>=MagicComment()<CR>
" }}}

""" vim {{{
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
