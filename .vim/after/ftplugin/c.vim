nnoremap <buffer><Leader>c :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "write"
	exec "!gcc % -o %:r"
	exec "! ./%:r"
endfunc
