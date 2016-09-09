
function! env#bash#LoadEnv()
	call env#common#OpenEnvWindow('sh')
	call env#common#MapKey('bash')
endfunction

function! env#bash#ExecuteEnv(buftext)
	return s:BASH(a:buftext)
endfunction

function! s:BASH(code)
	return systemlist("bash",  a:code)
endfunction

