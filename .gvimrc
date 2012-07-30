scriptencoding utf-8
" colorscheme yuroyoro256
colorscheme aldmeris
autocmd ColorScheme * highlight SpecialKey term=underline ctermfg=Gray guifg=Gray

set number             " 行番号表示
set go-=m  go-=T       " ツールバー、メニューを非表示
set go-=r  go-=R       " スクロールバーを非表示
set go-=l  go-=L go-=b " (マイナス指定は複数を一度に設定できない)
set go-=a              " システム共通のクリップボードを使う

" set autochdir
set noerrorbells      " エラー時の音の抑制
set novisualbell      " エラー時のビジュアルベルの抑制
set visualbell t_vb=
set cmdheight=1       " コマンドラインの高さ (gvimはgvimrcで指定)
set cursorcolumn      " カーソル位置縦ライン表示
set clipboard=unnamed " クリップボードをWindowsと連携
set laststatus=2      " ステータスラインを常に表示
set linespace=4       " 行間の幅のピクセル数
set scrolloff=1000000 " スクロール時の余白確保
set showtabline=2     " タブを常に表示

" 全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
if has('win32') && !has('gui_running')
	autocmd BufNewFile,BufRead * match ZenkakuSpace /\%u8140/
else
	autocmd BufNewFile,BufRead * match ZenkakuSpace /　/
endif
highlight Notes cterm=underline ctermfg=lightblue guibg=DarkMagenta
autocmd BufNewFile,BufRead * match Notes /NOTE:/

if has('gui_macvim')
	nnoremap <Space>fu :<C-u>setlocal fu! fu?<CR>
	set antialias
	set columns=90                " 幅
	set lines=60                  " 行数
	set fuoptions=maxvert,maxhorz
	set imdisableactivate         " 自動的に日本語入力(IM)をオンにする機能のみ禁止
	" set imdisable                 " IMを無効化

	"フォントの設定 スペースが含まれる場合は直前にバックスラッシュ
	" set guifont=Andale_Mono:h16
" 	set guifont=Consolas:h14
" 	set guifont=Consolas\ for\ Powerline:h14
	set guifont=Menlo\ for\ Powerline:h14
	" set guifont=DroidSansMonoSlashed:h12
" 	set guifont=Envy\ Code\ R\ for\ Powerline:h14
	" set guifont=Inconsolata:h14
	" set guifont=Menlo_bold:h13
	" set guifont=MigMix_2m_bold:h13
	" set guifont=Ricty-Regular:h15

	" set guifontwide=meiryoKeConsole
	set guifontwide=Ricty-Regular:h14
	" set guifontwide=TakaoExGothic:h12

	" Vim-users.jp - Hack #234: Vim外にいるときはVimを透けさせる
	" http://vim-users.jp/2011/10/hack234/
" 	augroup hack234
" 		autocmd!
" 		autocmd VimEnter,FocusGained * set transparency=10
" 		autocmd FocusLost * set transparency=50
" 	augroup END
elseif has('win32') || has('win64')
	set linespace=3       " 行間の幅のピクセル数
	set columns=88
	set lines=50

	" set guifont=Inconsolata:h10
	" set guifont=Consolas:h10
	set guifont=Envy\ Code\ R\ for\ Powerline:h10
	" set guifont=Dejavu_Sans_Mono_for_Powerline:h9
	set guifontwide=Migu\ 2M:h9
	nnoremap <Space>fu :call ToggleFullScreen()<CR>
	function! ToggleFullScreen()
		if &guioptions =~# 'C'
			set guioptions-=C
			if exists('s:go_temp')
				if s:go_temp =~# 'm'
					set guioptions+=m
				endif
				if s:go_temp =~# 'T'
					set guioptions+=T
				endif
			endif
			simalt ~r
		else
			let s:go_temp = &guioptions
			set guioptions+=C
			simalt ~x
		endif
	endfunction
else 
" 	set guifont=MigMix\ 2M\ 10
	set guifont=Envy\ Code\ R\ for\ Powerline\ 12
	set columns=90
	set lines=45
endif
