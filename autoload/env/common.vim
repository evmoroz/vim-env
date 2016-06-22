function! env#common#OpenEnvWindow(ftype, winname)
	let bufid = bufwinnr(a:winname)
	if &filetype ==# a:ftype
		" We are already in 'sql' buffer
		" No need to do anything
	elseif bufid != -1
		" An existing buffer is found
		" Let's use that one
		execute bufid . "wincmd w"
	else
		" Open a new buffer if previous two failed
		silent execute "split " . a:winname
		let &filetype = a:ftype
		setlocal buftype=nofile
		silent normal! ggdG
	endif
endfunction

function! env#common#MapKey(envname)
	execute "nnoremap <buffer> <silent> " .
				\ "<localleader><space> " .
				\ ":call <SID>ExecuteEnv('" . a:envname . "')<cr>"
endfunction

function! s:ExecuteEnv(envname)
	let EnvFunc = function("env#" . a:envname . "#ExecuteEnv")
	call append (0, EnvFunc())
endfunction
