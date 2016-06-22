function! env#mysql#LoadEnv()
	call env#common#OpenEnvWindow('sql', "__MySQLEnv__")
	call env#common#MapKey('mysql')
endfunction

function! env#mysql#ExecuteEnv()
	return s:SQL('SELECT * FROM so.user_')
endfunction

function! s:SQL(query)
	return systemlist("mysql -tu root -p", a:query)
endfunction

