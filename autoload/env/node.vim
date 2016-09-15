let s:plugindir = expand('<sfile>:p:h')

function! env#node#LoadEnv()
	call env#common#OpenEnvWindow('javascript')
	call env#common#MapKey('node')
endfunction

function! env#node#ExecuteEnv(buftext)
	execute 'lcd ' . s:plugindir
	return s:NODE(a:buftext)
endfunction

function! s:NODE(code)
	return systemlist("npm run --silent babel | node",  a:code)
endfunction

