if has('gui_macvim')
  set showtabline=2
  set lines=85
  set columns=220
  let g:netrw_winsize=""
  set transparency=10
  set antialias
  set imdisable
  set guifont=Panic\ Sans:h18
  set guioptions-=T
  set guioptions-=r
  set guioptions-=R
  set guioptions-=l
  set guioptions-=L
  map <silent> gw :macaction selectNextWindow:<Return>
  map <silent> gW :macaction selectPreviousWindow:<Return>

  let g:gist_clip_command = 'pbcopy'
  "if s:os_type == 'osx'
  "  TODO
  "  NeoBundle 'msanders/cocoa.vim'
  "  NeoBundle 'b4winckler/vim-objc'
  "end

  " full screen
  set fuoptions=maxvert,maxhorz
  autocmd GUIEnter * set fullscreen
  " IME off
  inoremap <silent> <ESC> <ESC>:set iminsert=0<Return>
endif
