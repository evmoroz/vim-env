
function! env#node#LoadEnv()
	call env#common#OpenEnvWindow('javascript')
	execute 'lcd ' . expand('<sfile>:p:h')
	call env#common#MapKey('node')
endfunction

function! env#node#ExecuteEnv(buftext)
	return s:NODE(a:buftext)
endfunction

function! s:NODE(code)
	return systemlist("npm run --silent babel | node",  a:code)
endfunction

