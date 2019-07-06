set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let colors_name = "gr_black"

"" general colors
hi Normal       guifg=#fffff0  guibg=black   gui=NONE ctermfg=NONE     ctermbg=NONE     cterm=NONE
hi NonText      guifg=#070707  guibg=black   gui=NONE ctermfg=black    ctermbg=NONE     cterm=NONE
hi Cursor       guifg=black    guibg=white   gui=NONE ctermfg=black    ctermbg=white    cterm=reverse
hi LineNr       guifg=darkgray guibg=black   gui=NONE ctermfg=darkgray ctermbg=NONE     cterm=NONE
hi CursorLineNr guifg=gray     guibg=NONE    gui=NONE ctermfg=NONE     ctermbg=NONE     cterm=NONE
hi VertSplit    guifg=#202020  guibg=#202020 gui=NONE ctermfg=darkgray ctermbg=darkgray cterm=NONE
hi StatusLine   guifg=white    guibg=#444444 gui=NONE ctermfg=gray     ctermbg=darkgray cterm=NONE
hi StatusLineNC guifg=darkgray guibg=black   gui=NONE ctermfg=gray     ctermbg=darkgray cterm=NONE
hi Folded       guifg=#a0a8b0  guibg=#384048 gui=NONE ctermfg=NONE     ctermbg=NONE     cterm=NONE
hi Title        guifg=#f6f3e8  guibg=NONE    gui=bold ctermfg=NONE     ctermbg=NONE     cterm=NONE
hi Visual       guifg=black    guibg=#FFCCCC gui=NONE ctermfg=NONE     ctermbg=darkgray cterm=NONE
hi SpecialKey   guifg=#808080  guibg=#343434 gui=NONE ctermfg=NONE     ctermbg=NONE     cterm=NONE
hi WildMenu     guifg=green    guibg=yellow  gui=NONE ctermfg=black    ctermbg=yellow   cterm=NONE
hi PmenuSbar    guifg=black    guibg=white   gui=NONE ctermfg=black    ctermbg=white    cterm=NONE
hi Ignore       guifg=gray     guibg=black   gui=NONE ctermfg=NONE     ctermbg=NONE     cterm=NONE

"" undercurl color
hi Error      guifg=NONE  guibg=NONE    gui=undercurl ctermfg=white ctermbg=red cterm=NONE guisp=#FF6C60
hi ErrorMsg   guifg=white guibg=#FF6C60 gui=bold      ctermfg=white ctermbg=red cterm=NONE
hi WarningMsg guifg=white guibg=#FF6C60 gui=bold      ctermfg=white ctermbg=red cterm=NONE

"" message displayed in lower left, such as --INSERT--
hi ModeMsg          guifg=gray      guibg=NONE     gui=bold ctermfg=gray  ctermbg=NONE     cterm=bold
hi CursorLine       guifg=NONE      guibg=NONE     gui=NONE ctermfg=NONE  ctermbg=NONE     cterm=underline
hi CursorColumn     guifg=NONE      guibg=NONE     gui=NONE ctermfg=NONE  ctermbg=NONE     cterm=bold
hi ColorColumn      guifg=red       guibg=NONE     gui=NONE ctermfg=red   ctermbg=NONE     cterm=NONE
hi MatchParen       guifg=#f6f3e8   guibg=#857b6f  gui=bold ctermfg=white ctermbg=darkgray cterm=NONE
hi Pmenu            guifg=#f6f3e8   guibg=#444444  gui=NONE ctermfg=NONE  ctermbg=NONE     cterm=NONE
hi PmenuSel         guifg=black     guibg=#cae682  gui=NONE ctermfg=NONE  ctermbg=NONE     cterm=NONE
hi Search           guifg=lightcyan guibg=#444444  gui=NONE ctermfg=NONE  ctermbg=NONE     cterm=NONE
hi IncSearch        guifg=red       guibg=#444444  gui=NONE ctermfg=NONE  ctermbg=NONE     cterm=NONE
hi TabLineNumber    guifg=red       guibg=NONE     gui=NONE ctermfg=NONE  ctermbg=NONE     cterm=NONE
hi TabLineSelNumber guifg=red       guibg=NONE     gui=NONE ctermfg=NONE  ctermbg=NONE     cterm=NONE
hi TabLine          guifg=gray      guibg=NONE     gui=NONE ctermfg=NONE  ctermbg=NONE     cterm=NONE
hi TabLineSel       guifg=white     guibg=darkgray gui=NONE ctermfg=NONE  ctermbg=NONE     cterm=NONE

"" syntax highlighting
hi Comment     guifg=#7C7C7C guibg=NONE gui=NONE ctermfg=darkgray  ctermbg=NONE cterm=NONE
hi String      guifg=#A8FF60 guibg=NONE gui=NONE ctermfg=green     ctermbg=NONE cterm=NONE
hi Number      guifg=#FF73FD guibg=NONE gui=NONE ctermfg=magenta   ctermbg=NONE cterm=NONE
hi Keyword     guifg=#96CBFE guibg=NONE gui=NONE ctermfg=blue      ctermbg=NONE cterm=NONE
hi PreProc     guifg=#96CBFE guibg=NONE gui=NONE ctermfg=blue      ctermbg=NONE cterm=NONE
hi Conditional guifg=#6699CC guibg=NONE gui=NONE ctermfg=blue      ctermbg=NONE cterm=NONE
hi Todo        guifg=#8f8f8f guibg=NONE gui=NONE ctermfg=red       ctermbg=NONE cterm=NONE
hi Constant    guifg=#99CC99 guibg=NONE gui=NONE ctermfg=cyan      ctermbg=NONE cterm=NONE
hi Identifier  guifg=#C6C5FE guibg=NONE gui=NONE ctermfg=cyan      ctermbg=NONE cterm=NONE
hi Function    guifg=#FFD2A7 guibg=NONE gui=NONE ctermfg=brown     ctermbg=NONE cterm=NONE
hi Type        guifg=#FFFFB6 guibg=NONE gui=NONE ctermfg=yellow    ctermbg=NONE cterm=NONE
hi Statement   guifg=#6699CC guibg=NONE gui=NONE ctermfg=lightblue ctermbg=NONE cterm=NONE
hi Special     guifg=#E18964 guibg=NONE gui=NONE ctermfg=white     ctermbg=NONE cterm=NONE
hi Delimiter   guifg=#00A0A0 guibg=NONE gui=NONE ctermfg=cyan      ctermbg=NONE cterm=NONE
hi Operator    guifg=white   guibg=NONE gui=NONE ctermfg=white     ctermbg=NONE cterm=NONE
hi SpellBad    guifg=#9932CC guibg=NONE gui=NONE ctermfg=red       ctermbg=NONE cterm=NONE

"" link
hi link Character      Constant
hi link Boolean        Constant
hi link Float          Number
hi link Repeat         Statement
hi link Label          Statement
hi link Exception      Statement
hi link Include        PreProc
hi link Define         PreProc
hi link Macro          PreProc
hi link PreCondit      PreProc
hi link StorageClass   Type
hi link Structure      Type
hi link Typedef        Type
hi link Tag            Special
hi link SpecialChar    Special
hi link SpecialComment Special
hi link Debug          Special

"" ruby
hi rubyRegexp                 guifg=#B18A3D guibg=NONE gui=NONE ctermfg=brown      ctermbg=NONE cterm=NONE
hi rubyRegexpDelimiter        guifg=#FF8000 guibg=NONE gui=NONE ctermfg=brown      ctermbg=NONE cterm=NONE
hi rubyEscape                 guifg=white   guibg=NONE gui=NONE ctermfg=cyan       ctermbg=NONE cterm=NONE
hi rubyInterpolationDelimiter guifg=#00A0A0 guibg=NONE gui=NONE ctermfg=blue       ctermbg=NONE cterm=NONE
hi rubyControl                guifg=#6699CC guibg=NONE gui=NONE ctermfg=blue       ctermbg=NONE cterm=NONE
hi rubyGlobalVariable         guifg=#FFCCFF guibg=NONE gui=NONE ctermfg=lightblue  ctermbg=NONE cterm=NONE
hi rubyStringDelimiter        guifg=#336633 guibg=NONE gui=NONE ctermfg=lightgreen ctermbg=NONE cterm=NONE
hi rubySymbol                 guifg=#8FBC8F guibg=NONE gui=NONE ctermfg=lightgreen ctermbg=NONE cterm=NONE
hi rubyBoolean                guifg=#6699CC guibg=NONE gui=NONE ctermfg=blue       ctermbg=NONE cterm=NONE
hi rubyBeginEnd               guifg=#6699CC guibg=NONE gui=NONE ctermfg=blue       ctermbg=NONE cterm=NONE
hi rubyConditional            guifg=#6699CC guibg=NONE gui=NONE ctermfg=blue       ctermbg=NONE cterm=NONE

"" ruby:link
hi link rubyClass            Keyword
hi link rubyModule           Keyword
hi link rubyKeyword          Keyword
hi link rubyOperator         Operator
hi link rubyIdentifier       Identifier
hi link rubyInstanceVariable Identifier
hi link rubyGlobalVariable   Identifier
hi link rubyClassVariable    Identifier
hi link rubyConstant         Type

"" java
hi javaDocSeeTag guifg=#CCCCCC guibg=NONE gui=NONE ctermfg=darkgray ctermbg=NONE cterm=NONE
hi javaDocSeeTag guifg=#CCCCCC guibg=NONE gui=NONE ctermfg=darkgray ctermbg=NONE cterm=NONE
hi javaClassDecl guifg=#CCFFCC guibg=NONE gui=NONE ctermfg=white    ctermbg=NONE cterm=NONE

"" java:link
hi link javaClassDecl      Type
hi link javaScopeDecl      Identifier
hi link javaCommentTitle   javaDocSeeTag
hi link javaDocTags        javaDocSeeTag
hi link javaDocParam       javaDocSeeTag
hi link javaDocSeeTagParam javaDocSeeTag

"" xml:link
hi link xmlTag     Keyword
hi link xmlTagName Conditional
hi link xmlEndTag  Identifier

"" html:link
hi link htmlTag     Keyword
hi link htmlTagName Conditional
hi link htmlEndTag  Identifier

"" javascript:link
hi link javaScriptNumber Number

"" python:link
hi link pythonEscape Keyword

"" csharp:link
hi link csXmlTag Keyword
