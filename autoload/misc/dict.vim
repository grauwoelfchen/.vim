""" eblook {{{
if exists('g:loaded_dict') && g:loaded_dict
  finish
endif

let g:loaded_dict = 1

function! misc#dict#setup()
  "" eblook
  let g:eblook_update_entrywin_by_contentwin_link = 1
  let g:eblook_dictlist1 = [{
  \  'book': $HOME.'/.atelier/var/bookshelf/dict/dat/',
  \  'name': 'demorph',
  \  'title': 'demorph',
  \  'skip': 1,
  \},{
  \  'book': $HOME.'/.atelier/var/bookshelf/dict/dat/',
  \  'name': 'wadoku',
  \  'title': 'wadoku',
  \  'skip': 1,
  \},{
  \  'book': $HOME.'/.atelier/var/bookshelf/dict/dat/',
  \  'name': 'openthesaurus',
  \  'title': 'openthde',
  \  'skip': 1,
  \},{
  \  'book': $HOME.'/.atelier/var/bookshelf/dict/dat/',
  \  'name': 'eijiro',
  \  'title': 'eijiro',
  \  'skip': 0,
  \}]
endfunction
" }}}
