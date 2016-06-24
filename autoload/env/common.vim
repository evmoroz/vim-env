function! env#common#OpenEnvWindow(ftype)
	let winname = '__' . a:ftype . '-env-buffer__'
	let bufid = bufwinnr(winname)
	if &filetype ==# a:ftype
		" We are already in 'sql' buffer
		" No need to do anything
	elseif bufid != -1
		" An existing buffer is found
		" Let's use that one
		execute bufid . "wincmd w"
	else
		if bufname("%") != ""
			" Open a new buffer, unless this one is empty
			silent execute "split " . winname
			silent normal! ggdG
		else
			silent execute "file " . winname
		endif
		
		let &filetype = a:ftype
		setlocal buftype=nofile
	endif
endfunction

function! env#common#MapKey(envname)
	execute "nnoremap <buffer> <silent> " .
				\ "<localleader><space> " .
				\ ":call <SID>ExecuteEnv('" . a:envname . "')<cr>"
endfunction

function! s:ExecuteEnv(envname)
	let EnvFunc = function("env#" . a:envname . "#ExecuteEnv")
	let prevwin = bufname('%')
	let user_register = @"
	silent normal! maggyG`a
	let result = EnvFunc(@")
	let @" = user_register
	call env#common#OpenEnvWindow(a:envname . 'results')
	silent normal! ggdG
	setlocal nowrap nolist nospell nonumber
	setlocal colorcolumn=0
	let prevwinid = bufwinnr(prevwin)
	call append (0, result)
	silent normal! gg
	execute prevwinid . 'wincmd w'
endfunction
