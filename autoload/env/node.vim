
function! env#node#LoadEnv()
	call env#common#OpenEnvWindow('javascript')
	call env#common#MapKey('node')
endfunction

function! env#node#ExecuteEnv(buftext)
	return s:NODE(a:buftext)
endfunction

function! s:NODE(code)
	return systemlist("node",  a:code)
endfunction

