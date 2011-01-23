if has('gui_macvim')
  set showtabline=2
  set lines=80
  set columns=168
  let g:netrw_winsize=""
  set transparency=10
  set antialias
  set imdisable
  set guifont=Panic\ Sans:h11
  set guioptions-=T
  set guioptions-=r
  set guioptions-=R
  set guioptions-=l
  set guioptions-=L
  map <silent> gw :macaction selectNextWindow:<Return>
  map <silent> gW :macaction selectPreviousWindow:<Return>
  " full screen
  "set fuoptions=maxvert,maxhorz
  "autocmd GUIEnter * set fullscreen
endif
