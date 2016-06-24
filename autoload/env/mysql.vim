function! env#mysql#LoadEnv()
	call env#common#OpenEnvWindow('sql')
	call env#common#MapKey('mysql')
endfunction

function! env#mysql#ExecuteEnv(buftext)
	return s:SQL(a:buftext)
endfunction

let s:mysql_password = -1

function! s:SQL(query)
	if s:mysql_password == -1
		let s:mysql_password = inputsecret('Enter password for root: ')
	endif

	return systemlist("mysql -tu root -p".s:mysql_password, a:query)
endfunction

