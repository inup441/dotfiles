compiler ruby

setlocal makeprg=ruby\ -c\ %
setlocal errorformat=%m\ in\ %f\ on\ line\ %l

nnoremap <silent> <Leader>l :<C-u>make<CR>

" augroup rubysyntaxcheck
	" autocmd!
	" autocmd BufWrite *.rb w !ruby -c
" augroup END

""
" RubyLint
"
" function! RubyLint()
  " let result = system( &ft . ' -c ' . bufname(""))
  " echo result
" endfunction

" autocmd BufWrite *.rb w !ruby -c
