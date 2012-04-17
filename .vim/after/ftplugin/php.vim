if has('win32') || has('win64')
	set fileencoding=cp932
endif

let g:php_noShortTags=1
let g:php_asp_tags=1

" compiler php

" setlocal makeprg=php\ -l\ %
" setlocal errorformat=%m\ in\ %f\ on\ line\ %l

nnoremap <silent> <Leader>l :<C-u>make<CR>
nnoremap <silent> <Space>ref  :<C-u>Unite ref/phpmanual<CR>

" autocmd BufWrite *.php make

inoremap <C-d> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-d> :call PhpDocSingle()<CR>
vnoremap <C-d> :call PhpDocRange()<CR> 

nnoremap <silent> <Leader>t :<C-u>!phpunit %<CR>

nnoremap <silent> <Space>ur :<C-u>Unite ref/phpmanual<CR>
