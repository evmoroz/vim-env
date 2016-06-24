if exists("b:current_syntax")
	finish
endif

syntax keyword phpVar NULL

syntax match phpError "\v^PHP Warning: .+"
syntax match phpError "\v^PHP Notice: .+"
syntax match phpError "\v^PHP Fatal error: .+"
syntax match phpError "\v^PHP Catchable fatal error: .+"
syntax match phpError "\v^PHP Parse error: .+"

highlight link phpError Error
highlight link phpVar Identifier
highlight link phpDate String
highlight link phpNumber Number
highlight link phpKeyword Keyword
highlight link phpDelim Delimiter

let b:current_syntax = "phpresults"
