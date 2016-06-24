if exists("b:current_syntax")
	finish
endif

syntax keyword mysqlVar NULL

syntax match mysqlError '\v^ERROR \d+.{-}:'
syntax match mysqlNumber "\v\s-?\d+(\.\d+)?\s"
syntax match mysqlDate "\v\s\d{4}-\d{2}-\d{2}\s"
syntax match mysqlDelim "\v^[+-]+$"
syntax match mysqlDelim '\v\|'



highlight link mysqlError Error
highlight link mysqlVar Identifier
highlight link mysqlDate String
highlight link mysqlNumber Number
highlight link mysqlKeyword Keyword
highlight link mysqlDelim Delimiter

let b:current_syntax = "mysqlresults"
