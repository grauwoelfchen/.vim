" Last Change: Sun. 12 Aug. 2012

""" basic
set nocompatible
set showmode
set showcmd
set autoread
set ttyfast
"" beep
set vb t_vb=
"" new line
set writebackup
set backup
set backupdir=$HOME/.vim/.backup
set directory=$HOME/.vim/.swap
"" IME
set noimcmdline
set iminsert=0
"" date
inoremap <expr> ,dd strftime('%a, %d. %b. %Y')


""" search
set incsearch
set history=100
set hlsearch
set ignorecase
set smartcase
nnoremap <Esc><Esc> :nohlsearch<CR><Esc>
nnoremap n nzz
nnoremap N Nzz
"" grep
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
set grepprg=grep\ -nh
"" help
nnoremap <C-i><C-i> :<C-u>help<Space><C-r><C-w><Enter>


""" move
noremap <C-e> <END>
noremap <C-a> <HOME>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
"" matchit.vim
source $VIMRUNTIME/macros/matchit.vim
"" showmarks
let g:showmarks_include="abcdefghijklmnopqlstuvwxyzABCDEFGHIJKLMNOPQLSTUVWXYZ"
"" marks_corey.vim
map md <Plug>Remove_all_signs
map mm <Plug>Place_sign
map mn <Plug>Goto_next_sign
map mp <Plug>Goto_prev_sign
map m. <Plug>Move_sign


""" view
set title
set ruler
set number
set t_Co=256
augroup GuiColorScheme
  autocmd!
  runtime! bundle/vim-guicolorscheme/plugin/guicolorscheme.vim
  autocmd ColorScheme * GuiColorScheme gr_black
augroup END
colorscheme gr_black
"set list listchars=tab:^_,trail:_
set laststatus=2
set showmatch
set matchtime=2
set wrap
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set textwidth=0
set statusline=%n\:%y%F\ \ %{(&fenc!=''?&fenc:&enc).'\ '.&ff.'\ '}%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
highlight Comment term=NONE cterm=NONE ctermfg=green
highlight StatusLine term=NONE cterm=NONE ctermfg=gray ctermbg=black
"" line length
augroup HighlightOverLength
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
noremap qp `[v`]
"noremap <expr> qp '`['.strpart(getregtype(), 0, 1).'`]'
set clipboard=unnamed,autoselect
set backspace=indent,eol,start
set whichwrap=b,s,h,l,<,>,[,]
"nnoremap j gj
"nnoremap k gk
function! MagicComment()
  return "# encoding: utf-8\<CR>"
endfunction
inoreabbrev <buffer> <Leader>## <C-R>=MagicComment()<CR>


""" templates
autocmd BufNewFile *.rb 0r ~/.vim/templates/rb.tpl


""" others
"set encoding=utf-8
"set fileencodings=utf-8
set fileformats=unix
"undo
set hidden
"set autochdir
"starting message
set shortmess+=I
"" netrw
"let g:netrw_browse_split=2
let g:netrw_altv=1
let g:netrw_winsize=""
let g:netrw_bufsettings="noma nomod nu nobl nowrap ro"


""" programming & plugins
set autoindent
set smartindent
set cindent
set cinwords=if,else,while,do,for,switch,case

"" pathhogen
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

syntax on
filetype plugin indent on

"" ctags
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'

"" white space
"autocmd BufWritePre * :%s/\s\+$//ge
"autocmd BufWritePre * :%s/\t/  /ge
augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END

"" dict [C-x, C-k]
"autocmd fileType ruby,eruby setl dictionary=~/.vim/dict/ruby.dict
"autocmd fileType php setl dictionary=~/.vim/dict/php.dict

"" omnifunc [C-x, C-o]
"set omnifunc=syntaxcomplete#Complete
"autocmd fileType * let g:AutoComplPop_CompleteOption='.,w,b,u,t,i'
"autocmd fileType ruby let g:AutoComplPop_CompleteOption='.,w,b,u,t,i,k~/.vim/dict/ruby.dict'
"autocmd fileType php let g:AutoComplPop_CompleteOption='.,w,b,u,t,k~/.vim/dict/php.dict'

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
"let g:neocomplcache_omni_patterns={
"\  'ruby' : ''
"\}
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

"" unite.vim
"let g:unite_enable_start_insert=1
let g:unite_split_rule="botright"
nnoremap <silent> ,Ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,Uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,Ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,Um :<C-u>Unite file_mru<CR>
nnoremap <silent> ,Uu :<C-u>Unite buffer file_mru<CR>
nnoremap <silent> ,Ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
"" window
autocmd FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
autocmd FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
autocmd FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
autocmd FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
"" quit
autocmd FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
autocmd FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q

"" nerdcommenter
let g:NERDCreateDefaultMappings=0
let NERDSpaceDelims=1
map  <Leader>cc <Plug>NERDCommenterToggle
nmap <Leader>ca <Plug>NERDCommenterAppend
nmap <leader>c$ <Plug>NERDCommenterToEOL
vmap <Leader>cs <Plug>NERDCommenterSexy
vmap <Leader>cb <Plug>NERDCommenterMinimal

"" buftabs
let buftabs_only_basename=1
let buftabs_in_statusline=1
noremap <f1> :bprev<CR>
noremap <f2> :bnext<CR>

"" yankring
noremap <silent> <F7> :YRShow<CR>
let g:yankring_history_dir=expand('$HOME/.vim/')
let g:yankring_history_file='.yankring_history'
let g:yankring_max_history=10
let g:yankring_max_element_length=1048576 "2M
let g:yankring_window_height=13

"" ruby
let g:rubycomplete_buffer_loading=1
let g:rubycomplete_classes_in_global=1
let g:rubycomplete_rails=1
let ruby_fold=1
nnoremap ]] ]m
nnoremap [[ [m
"autocmd FileType ruby,eruby setl omnifunc=rubycomplete#Complete
"autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd Filetype ruby.eruby setl makeprg=ruby\ -c\ %
autocmd BufRead,BufNewFile *.rb setfiletype ruby
augroup rbsyntaxcheck
  autocmd!
  autocmd BufWrite *.rb w !ruby -c
augroup END

"" python
autocmd FileType python setl omnifunc=pythoncomplete#Complete

"" php
autocmd BufNewFile,BufRead *.ctp, *.html set filetype=php
autocmd FileType php imap ,pp<ESC> :call PhpDocSingle()<CR>i
autocmd FileType php nmap ,pp :call PhpDocSingle()<CR>
autocmd FileType php vmap ,pp :call PhpDocRange()<CR>
autocmd FileType php setl makeprg=php\ -l\ %
autocmd FileType php setl errorformat=%m\ in\ %f\ on\ line\ %l
let php_sql_query=1
let php_htmlInStrings=1
let php_noShortTags=1
let php_folding=1
autocmd Syntax php setl fdm=syntax
augroup phpsyntaxcheck
  autocmd!
  autocmd BufWrite *.php w !php -l
augroup END

"" objc
autocmd FileType objc setl makeprg=xcodebuild
"set filetype=ignored

"" arduino
autocmd! BufNewFile,BufRead *.pde setlocal ft=arduino

"" bundle plugin off
"let g:pathogen_disabled = [
"\ 'neocomplcache',
"\ 'nerdcommenter',
"\ 'unite-vim',
"\]

"" for samba bug ;-(
"autocmd BufWritePost * sleep 1
"autocmd BufWritePost * checktime
"set autoread

"" command
"" rename current file
command! -nargs=1 -complete=file Rename f <args>|call delete(expand('#'))

"" no swap and backup
"set nobackup
"set noswapfile


"" dev
noremap <Space>s. :<C-u>source $MYVIMRC<CR>
"" Load settings for each location.
let g:loaded_vimrc = 0
augroup vimrc-local
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
