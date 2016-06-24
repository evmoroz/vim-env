function! env#php#LoadEnv()
	call env#common#OpenEnvWindow('php')
	call env#common#MapKey('php')
endfunction

function! env#php#ExecuteEnv(buftext)
	return s:PHP(a:buftext)
endfunction

function! s:PHP(code)
	return systemlist("php -d display_errors=off",  a:code)
endfunction

