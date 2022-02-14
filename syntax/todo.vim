if exists("b:current_syntax")
  finish
endif

syn match TodoDone '^[xX]\s.\+$'
" markdown like
syn match TodoDone '^\[x\]\s.\+$'

syn match TodoDate '\d\{4\}-\d\{2\}-\d\{2\}' contains=NONE
" like: Mon 14 Feb 2022
syn match TodoDate '\(Mon\|Tue\|Wed\|Thu\|Fri\|Sat\|Sun\)\s\d\{2\}\s\(Jan\|Feb\|Mar\|Apr\|May\|Jun\|Jul\|Aug\|Sep\|Nov\|Dec\)\s\d\{4\}' contains=NONE

syn match TodoContext '\(^\|\W\)@[^[:blank:]]\+' contains=NONE
syn match TodoProject '\(^\|\W\)+[^[:blank:]]\+' contains=NONE

syn match TodoPriorityA '(A)\s.\+$' contains=TodoDate,TodoProject,TodoContext
syn match TodoPriorityB '(B)\s.\+$' contains=TodoDate,TodoProject,TodoContext
syn match TodoPriorityC '(C)\s.\+$' contains=TodoDate,TodoProject,TodoContext
syn match TodoPriorityD '(D)\s.\+$' contains=TodoDate,TodoProject,TodoContext

let b:current_syntax = "todo.txt"
