function! LpcFileTypeDetect1()
	let mypath = expand('%:p')
	if stridx(mypath, "newtxii") >= 0 || stridx(mypath, "logic") >= 0 
		setf lpc
	endif
endfunction
autocmd BufNewFile,BufRead *.c call LpcFileTypeDetect1()
