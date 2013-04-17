scriptencoding utf-8
"-----------------------------------------------------------------------------
" ユーザーランタイムパス設定 {{{
"-----------------------------------------------------------------------------
if isdirectory($HOME . '/.vim')
	let $MYVIMRUNTIME = $HOME.'/.vim'
elseif isdirectory($HOME . '\vimfiles')
	let $MYVIMRUNTIME = $HOME.'\vimfiles'
elseif isdirectory($VIM . '\vimfiles')
	let $MYVIMRUNTIME = $VIM.'\vimfiles'
endif

if has('win32')
	let $DROPBOX = $HOME . '\Dropbox'
endif
" }}}

"--------------------------------------------------------------------------------
" Shougo/neobundle {{{
"--------------------------------------------------------------------------------
set nocompatible               " be iMproved
filetype off                   " required!

if has('vim_starting')
	set runtimepath+=$MYVIMRUNTIME/bundle/neobundle.vim/
	call neobundle#rc(expand('$MYVIMRUNTIME/bundle/'))
endif

" let NeoBundle manage NeoBundle
" required!
NeoBundle 'Shougo/neobundle.vim'

" My Bundles here:
"
" original repos on github
NeoBundle 'tpope/vim-fugitive'
" NeoBundle 'choplin/unite-vim_hacks'
" NeoBundle 'godlygeek/tabular'
" NeoBundle 'mattn/learn-vimscript'
NeoBundle 'glidenote/memolist.vim'
NeoBundle 'h1mesuke/vim-alignta'
NeoBundle 'kana/vim-smartchr'
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'othree/eregex.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'echo "Sorry, cannot update vimproc binary file in Windows."',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'soh335/vim-ref-jquery'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-ref'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tyru/caw.vim'
NeoBundle 'tyru/restart.vim'
NeoBundle 'ujihisa/neco-look'
NeoBundle 'vim-jp/vimdoc-ja'
" unite.vim
NeoBundle 'pasela/unite-webcolorname'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'tsukkee/unite-help'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'ujihisa/unite-font'
NeoBundle 'h1mesuke/unite-outline'
" language
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'mattn/zencoding-vim'
NeoBundle 'msanders/cocoa.vim', {'type' : 'nosync', 'base' : '~/.vim/bundle'}
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'davidoc/taskpaper.vim'
" NeoBundle 'hallettj/jslint.vim'
" NeoBundle 'basyura/jslint.vim'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'teramako/jscomplete-vim'
NeoBundle 'tpope/vim-haml'

" vim-scripts repos
NeoBundle 'sudo.vim'
NeoBundle 'PDV--phpDocumentor-for-Vim'
NeoBundle 'vim-scripts/smarty.vim'

" ColorScheme {{{
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'chmllr/vim-colorscheme-elrodeo'
NeoBundle 'chriskempson/base16-vim'
" NeoBundle 'ChrisKempson/Vim-Tomorrow-Theme'
NeoBundle 'effkay/argonaut.vim'
NeoBundle 'gmarik/ingretu'
NeoBundle 'jelera/vim-gummybears-colorscheme'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'nelstrom/vim-mac-classic-theme'
NeoBundle 'nielsmadan/harlequin'
NeoBundle 'noahfrederick/Hemisu'
NeoBundle 'uu59/vim-herokudoc-theme'
NeoBundle 'veloce/vim-aldmeris'
NeoBundle 'vim-scripts/neverland.vim--All-colorschemes-suck'
NeoBundle 'yuroyoro/yuroyoro256.vim'
NeoBundle 'git://gist.github.com/187578.git' " gvim color scheme: h2u_black, h2u_dark and h2u_white.
" }}}

" Syntax
NeoBundle 'jQuery'

" non github repos
" Bundle 'git://git.wincent.com/command-t.git'

filetype plugin indent on     " required! 
set nocompatible               " be iMproved
" }}}

"-------------------------------------------------------------------------------
" 基本設定 Basics {{{
"-------------------------------------------------------------------------------
syntax on
let g:mapleader=","            " キーマップリーダー
set backspace=indent,eol,start " バックスペースでなんでも消せるように
set browsedir=buffer           " Exploreの初期ディレクトリ
set clipboard+=unnamed         " OSのクリップボードを使用する
set clipboard-=autoselect
set formatoptions=lmoqM        " テキスト整形オプション，マルチバイト系を追加
set mouse=a                    " ターミナルでマウスを使用できるようにする
set scrolloff=1000000          " スクロール時の余白確保
set textwidth=0                " 一行に長い文章を書いていても自動折り返しをしない
set timeoutlen=500
set ttymouse=xterm2
set viminfo='50,<1000,s100,\"50 " viminfoファイルの設定
set virtualedit=block          " Visual blockモードで仮想編集を有効にする。
set vb t_vb=                   " ビープをならさない
set whichwrap=b,s,h,l,<,>,[,]  " カーソルを行頭、行末で止まらないようにする
set wildignore=*.o,*.obj,*.bak,*.exe

" let &termencoding = &encoding
if has('win32')
	set termencoding=cp932
endif
" set autochdir                  " カレントディレクトリを現在のファイルのディレクトリに自動で設定
set autoread                   " 他で書き換えられたら自動で読み直す
set autowrite                  " 
set hidden                     " 編集中でも他のファイルを開けるようにする
set nobackup                   " バックアップ取らない
set noswapfile                 " スワップファイル作らない
set nowrap                     " 折り返さない
set timeout

" command completion
set wildmenu                   " コマンドライン補完を強化
set wildmode=list:longest,full

" Vim-users.jp - Hack #217: 横幅が長いコードをハイライトする
" http://vim-users.jp/2011/05/hack217/
if exists('&colorcolumn')
	set colorcolumn=+1
	highlight ColorColumn ctermbg=Red guibg=Red
	autocmd FileType sh,php,perl,vim,ruby,python,javascript,coffee setlocal textwidth=80
endif

" バッファを閉じる時にバッファリストから削除
autocmd BufReadPre * setlocal bufhidden=delete
" }}}

"-----------------------------------------------------------------------------
" システム設定 system {{{
"-----------------------------------------------------------------------------
set nrformats-=octal           " 8進数を無効にする。<C-a>,<C-x>に影響する
" }}}

"-------------------------------------------------------------------------------
" 検索 Search {{{
"-------------------------------------------------------------------------------
set ignorecase " 検索の時に大文字小文字を区別しない
set smartcase  " ただし大文字小文字の両方が含まれている場合は大文字小文字を区別する
set wrapscan   " 検索時にファイルの最後まで行ったら最初に戻らない
set incsearch  " インクリメンタルサーチ
set hlsearch   " 検索文字の強調表示
" }}}

"-------------------------------------------------------------------------------
" 表示 Apperance {{{
"-------------------------------------------------------------------------------
colorscheme aldmeris
set ambiwidth=double                              " □や○の文字があってもカーソル位置がずれないようにする
set background=dark
set cinoptions+=:0                                " Cインデントの設定
set cmdheight=1                                   " コマンドラインの高さ (gvimはgvimrcで指定)
set display+=lastline                              " 画面最後の行をできる限り表示する
set display+=uhex                                  " 印字不可能文字を16進数で表示
set shortmess+=I                                  " スプラッシュ(起動時のメッセージ)を表示しない
set t_Co=256

set showmatch matchtime=5                        " 括弧の対応表示時間

set autoindent                                    " 自動的にインデントする
set smartindent
set list                                          " 不可視文字表示
if (has('mac'))
	set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
" 	set listchars=tab:▸-,eol:↲,extends:»,precedes:«,nbsp:%
" 	set listchars=tab:▸-,eol:¬,extends:»,precedes:«,nbsp:%
els
	set listchars=tab:>-,trail:-,eol:<,nbsp:%,extends:>,precedes:<                            " 不可視文字の表示形式
endif
set lazyredraw                                    " コマンド実行中は再描画しない
set noerrorbells                                  " エラー時の音とビジュアルベルの抑制(gvimは.gvimrcで設定)
set novisualbell
set number                                        " 行番号表示
set shellslash                                    " Windowsでディレクトリパスの区切り文字表示に / を使えるようにする
set showmode                                      " 現在のモードを表示
set showcmd                                       " コマンドをステータス行に表示
set showmatch                                     " 括弧の対応をハイライト
set splitbelow                                    " :split で下に開く
set splitright                                    " :vsplit で右に開く
set title                                         " タイトルを表示
set ttyfast                                       " 高速ターミナル接続を行う

" set expandtab
" set smarttab
set tabstop=2
set shiftwidth=2
set softtabstop=2

set cursorline                                    " カーソル行をハイライト
" カレントウィンドウにのみ罫線を引く
augroup cch
	autocmd! cch
	autocmd WinLeave * set nocursorline
	autocmd WinEnter,BufRead * set cursorline
augroup END

:hi clear CursorLine
:hi CursorLine gui=underline
highlight CursorLine ctermbg=black guibg=black
" }}}

"-------------------------------------------------------------------------------
" ステータスライン StatusLine {{{
"-------------------------------------------------------------------------------
set laststatus=2   " 常にステータスラインを表示
set ruler          " カーソルが何行目の何列目に置かれているかを表示する

" set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\ %F%=%{Generate()}\ [%{GetB()}]\ %l,%c%V%8P
set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\ %F%=\ [%{GetB()}]\ %l,%c%V%8P
"ステータスラインに文字コードと改行文字を表示する
" if winwidth(0) >= 120
	" set statusline=%{strftime('%H:%M')}%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\ %F%=%{Generate()}\ [%{GetB()}]\ %l,%c%V%8P
" else
	" set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\ %f%=[%{GetB()}]\ %l,%c%V%8P
" endif

"入力モード時、ステータスラインのカラーを変更
augroup InsertHook
	autocmd!
	autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
	autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
augroup END

function! GetB()
	let c = matchstr(getline('.'), '.', col('.') - 1)
	let c = iconv(c, &enc, &fenc)
	return String2Hex(c)
endfunction
" help eval-examples
" The function Nr2Hex() returns the Hex string of a number.
func! Nr2Hex(nr)
	let n = a:nr
	let r = ""
	while n
		let r = '0123456789ABCDEF'[n % 16] . r
		let n = n / 16
	endwhile
	return r
endfunc
" The function String2Hex() converts each character in a string to a two
" character Hex string.
func! String2Hex(str)
	let out = ''
	let ix = 0
	while ix < strlen(a:str)
		let out = out . Nr2Hex(char2nr(a:str[ix]))
		let ix = ix + 1
	endwhile
	return out
endfunc
" }}}

"-------------------------------------------------------------------------------
" エンコーディング関連 Encoding {{{
"-------------------------------------------------------------------------------
set encoding=utf-8           " デフォルトエンコーディング
set fileformats=unix,dos,mac " 改行文字
set fileencodings=utf-8,ucs-bom,euc-jp,iso-2022-jp,cp932,utf-16,utf-16le
if has('win32')
	set termencoding = 'Shift-JIS'
endif
" }}}

"-------------------------------------------------------------------------------
" その他 misc {{{
"-------------------------------------------------------------------------------
" Hack #202: 自動的にディレクトリを作成する
augroup vimrc-auto-mkdir  " {{{
  autocmd!
  autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
  function! s:auto_mkdir(dir, force)  " {{{
    if !isdirectory(a:dir) && (a:force ||
    \    input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
      call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
  endfunction  " }}}
augroup END  " }}}
" }}}

"-------------------------------------------------------------------------------
" テンプレートファイルの読み込み Template {{{
"-------------------------------------------------------------------------------
augroup SkeletonAu
	autocmd!
	autocmd BufNewFile *.c 1r $MYVIMRUNTIME/template/skeleton.c |1 delete _
	autocmd BufNewFile *.html 1r $MYVIMRUNTIME/template/skeleton.html |1 delete _
	autocmd BufNewFile *.java 1r $MYVIMRUNTIME/template/skeleton.java |1 delete _
	autocmd BufNewFile *.php 1r $MYVIMRUNTIME/template/skeleton.php |1 delete _
				\|call search('^$')
	autocmd BufNewFile *.pl 1r $MYVIMRUNTIME/template/skeleton.pl |1 delete _
	autocmd BufNewFile *.py 1r $MYVIMRUNTIME/template/skeleton.py |1 delete _
	autocmd BufNewFile *.rb 1r $MYVIMRUNTIME/template/skeleton.rb |1 delete _
				\|call search('^$')
	autocmd BufNewFile *.sh 1r $MYVIMRUNTIME/template/skeleton.sh |1 delete _
	autocmd BufNewFile *.shd 1r $MYVIMRUNTIME/template/skeleton.shd |1 delete _
	autocmd BufNewFile *.taskpaper 1r $MYVIMRUNTIME/template/skeleton.taskpaper |1 delete _
	autocmd BufNewFile *.user.coffee 1r $MYVIMRUNTIME/template/skeleton.user.coffee |1 delete _
	autocmd BufNewFile *.user.js 1r $MYVIMRUNTIME/template/skeleton.user.js |1 delete _
augroup END
" }}}

"-------------------------------------------------------------------------------
" キーマップ Keymap {{{
"-------------------------------------------------------------------------------
nnoremap : ;
nnoremap ; :
vnoremap : ;
vnoremap ; :
map <silent> <ESC> <ESC>:set iminsert=0<CR>

if has('kaoriya')
	nnoremap / g/
endif
" 基本コマンドのリマップ
imap jj <Esc>
imap <C-@> <C-[>

nnoremap <silent><Space>w  :<C-u>write<CR>
nnoremap <silent><Space>q  :<C-u>quit<CR>
nnoremap <silent><Space>Q  :<C-u>quit!<CR>

nnoremap <silent><Space>sp :<C-u>split<CR>
nnoremap <silent><Space>vs :<C-u>vsplit<CR>
nnoremap <silent><Space>x  :<C-u>close!<CR>
nnoremap <silent><Space>d  :<C-u>bdelete!<CR>
nnoremap <silent><Space>i  gg=G
nnoremap <silent><Space>h  :<C-u>Unite help<CR>
nnoremap <silent><Space>H  :<C-u>help<Space><C-r><C-w><CR>
nnoremap <silent><C-i> :<C-u>help<Space><C-r><C-w><CR>

nnoremap <Esc><Esc> :<C-u>set nohlsearch<CR><Esc>
nnoremap / :<C-u>set hlsearch<CR>/
nnoremap ? :<C-u>set hlsearch<CR>?
nnoremap * :<C-u>set hlsearch<CR>*
nnoremap # :<C-u>set hlsearch<CR>#

nnoremap vv <C-v>
" nnoremap -- :<C-u>VimFilerBufferDir<CR>
" nnoremap - :<C-u>e %:h/
nnoremap <C-l> :<C-u>e %<CR>

nnoremap J gJ
nnoremap gJ J

inoremap <C-t> 「」<left>
inoremap <C-t><C-t> 【】<left>
nnoremap <Space>s :set filetype=

nnoremap Y y$

" 0, 9で行頭、行末へ
nmap 1 0
nmap 0 ^
nmap 9 $
" y9で行末までヤンク
nmap y9 y$
" y0で行頭までヤンク
nmap y0 y^

"window操作
nnoremap sh <C-w>h
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sc <C-w>c
nnoremap sr <C-w>r
nnoremap s0 <C-w>=

"Tab操作
nnoremap tn :<C-u>tabnew<CR>:cd ~/<CR>
nnoremap th :<C-u>tabprev<CR>
nnoremap tl :<C-u>tabnext<CR>
nnoremap tw :<C-u>tabclose<CR>
nnoremap te :<C-u>tabedit<CR>

" encoding
nnoremap <silent> eu :setlocal fileencoding=utf-8<CR>
nnoremap <silent> ee :setlocal fileencoding=euc-jp<CR>
nnoremap <silent> es :setlocal fileencoding=cp932<CR>

" format
nnoremap <silent> fu :setlocal fileformat=unix<CR>
nnoremap <silent> fd :setlocal fileformat=dos<CR>
nnoremap <silent> fm :setlocal fileformat=mac<CR>

" encode reopen encoding
nnoremap <silent> ru :e ++enc=utf-8 %<CR>
nnoremap <silent> re :e ++enc=euc-jp %<CR>
nnoremap <silent> rs :e ++enc=cp932 %<CR>
nnoremap <silent> rr :e %<CR>

" 検索などで飛んだらそこを真ん中に
nnoremap <silent> n nzzzv
nnoremap <silent> N Nzzzv
nnoremap <silent> * *zzzv
nnoremap <silent> # #zzzv
nnoremap <silent> g* g*zzzv
nnoremap <silent> g# g#zzzv
nnoremap <silent> G Gzzzv
nnoremap <silent> j jzzzv
nnoremap <silent> k kzzzv


"表示行単位で行移動するようにする
noremap j gj
noremap k gk
noremap gj j
noremap gk k

inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-o> <Esc>o

"カーソル一文字単位移動
inoremap <silent> <C-s> <Left>
inoremap <silent> <C-d> <Right>
inoremap <silent> <C-e> <Esc>A
inoremap <silent> <C-a> <Esc>I

" 連結後のスペース削除
"nmap J J<C-[>x

" 改行してペースト
nnoremap m o<ESC>p
" 行末までヤンク
nnoremap Y y$

" 置換 Replace
" replace the user input in the current line
nnoremap ,s :<C-u>S///g<Left><Left><Left>
vnoremap ,s :<C-u>'<,'>S///g<Left><Left><Left>
" replace the cword in the current line
nnoremap ,ls :<C-u>S/\<<C-r>=expand('<cword>')<CR>\>//g "<Left><Left><Left><Left>
nnoremap ,lS :<C-u>S/<C-r>=expand('<cword>')<CR>//g "<Left><Left><Left><Left>

" ページ送り
noremap <Space>j <C-f>
noremap <Space>k <C-b>

" 直前のコマンドを実行
nnoremap c. q:k<Cr> 

" .vimrc、.gvimrcを開く
nnoremap <silent><Space>,  :<C-u>edit $MYVIMRC<CR>
nnoremap <silent><Space>.  :<C-u>edit $MYGVIMRC<CR>
"nnoremap <silent><Space>v  :<C-u>source $MYVIMRC
"\| if has('gui_running') 
"\| source $MYGVIMRC 
"\| endif <CR>
nnoremap <silent><Space>ev :<C-u>new $MYVIMRC<CR>
nnoremap <silent><Space>eg :<C-u>new $MYGVIMRC<CR>
nnoremap <silent><Space>tv :<C-u>tabedit $MYVIMRC<CR>
nnoremap <silent><Space>tg :<C-u>tabedit $MYGVIMRC<CR>

" date/time
inoremap <expr> <Leader>df strftime('%Y/%m/%d %H:%M:%S')
inoremap <expr> <Leader>dd strftime('%Y/%m/%d')
inoremap <expr> <Leader>d- strftime('%Y-%m-%d')
inoremap <expr> <Leader>dt strftime('%H:%M:%S')
inoremap <expr> <Leader>dw strftime('%Y-%m-%dT%H:%M:%S+09:00')

"" (),[],{},<>,””,’’,“入力+()の中にカーソル戻す
" inoremap {} {}<Left>
" inoremap [] []<Left>
" inoremap () ()<Left>
" inoremap <> <><Left>
" inoremap ** **<Left>
" inoremap "" ""<Left>
" inoremap '' ''<Left>
" inoremap `` ``<Left>
" inoremap <Bar><Bar> <Bar><Bar><Left>

inoremap { {}<Left>
inoremap {* {*  *}<Left><Left><Left>
inoremap [ []<Left>
inoremap ( ()<Left>
inoremap < <><Left>
inoremap " ""<Left>
inoremap ' ''<Left>
inoremap ` ``<Left>
inoremap <Bar> <Bar><Bar><Left>

"tags-and-searchesを使い易くする
nnoremap t  <Nop>
nnoremap tt  <C-]>
nnoremap tj  :<C-u>tag<CR>
nnoremap tk  :<C-u>pop<CR>
"nnoremap tl  :<C-u>tags<CR>

" Visual mode blockwise indent
vnoremap > >gv
vnoremap < <gv

" Diff
nnoremap <Space>dt :diffthis
nnoremap <Space>do :diffoff!

" quickfix
nnoremap Q q

nnoremap qj  :cnext<Return>
nnoremap qk  :cprevious<Return>
nnoremap qr  :crewind<Return>
nnoremap qK  :cfirst<Return>
nnoremap qJ  :clast<Return>
nnoremap qf  :cnfile<Return>
nnoremap qF  :cpfile<Return>
nnoremap ql  :clist<Return>
nnoremap qq  :cc<Return>
nnoremap qo  :copen<Return>
nnoremap qc  :cclose<Return>
nnoremap qw  :cwindow<Return>
nnoremap qp  :colder<Return>
nnoremap qn  :cnewer<Return>
nnoremap qm  :make<Return>
nnoremap qM  :make<Space>
nnoremap qg  :grep<Space>
nnoremap q   <Nop>

" nnoremap <silent> <Leader>l :<C-u>make<CR>

nnoremap <S-Right> :<C-u>bnext<CR>
nnoremap <S-Left>  :<C-u>bprevious<CR>

nnoremap <silent><Space>cd :<C-u>CdCurrent<CR>

iabbrev widht width
iabbrev arary array
iabbrev cim vim

" ;で改行
function! IsEndSemicolon()
  let c = getline(".")[col("$")-2]
  if c != ';'
    return 1
  else
    return 0
  endif
endfunction
inoremap <expr>;; IsEndSemicolon() ? "<C-O>$;<CR>" : "<C-O>$<CR>"

" # Hack #214: 括弧までを消したり置き換えたりする
" http://vim-users.jp/2011/04/hack214/
onoremap ) t)
onoremap ( t(
vnoremap ) t)
vnoremap ( t(

cnoremap <C-v> <C-r>*
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>
cnoremap <expr> /  getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ?  getcmdtype() == '?' ? '\?' : '?'
" }}}

"-------------------------------------------------------------------------------
" オプションの切り替え option {{{
"-------------------------------------------------------------------------------
" wrap
nnoremap <Space>ow :<C-u>setlocal wrap! wrap?<CR>
" }}}

"-------------------------------------------------------------------------------
" Plugins
"-------------------------------------------------------------------------------

"-------------------------------------------------------------------------------
" glidenote/memolist.vim {{{
"-------------------------------------------------------------------------------
let g:memolist_memo_suffix = "markdown"
let g:memolist_memo_date = "%Y-%m-%d %H:%M"
let g:memolist_prompt_tags = 1
let g:memolist_prompt_categories = 1
let g:memolist_qfixgrep = 1
let g:memolist_vimfiler = 1
let g:memolist_path = $HOME.'/Dropbox/Documents/memolist'
" let g:memolist_template_dir_path = $HOME.'/Dropbox/Documents/memolist'

nnoremap <Space>mm :<C-u>MemoNew<CR>
nnoremap <Space>ml :<C-u>Unite -buffer-name=memolist file:<C-r>=g:memolist_path<CR><CR>
" }}}

"-------------------------------------------------------------------------------
" nathanaelkane/vim-indent-guides {{{
"-------------------------------------------------------------------------------
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_color_change_percent = 20
let g:indent_guides_guide_size = 2
" }}}

"-------------------------------------------------------------------------------
" scrooloose/syntastic {{{
"-------------------------------------------------------------------------------
" let g:syntastic_mode_map = {'mode': 'active',
" " 			\'active_filetypes': ['javascript'],
"     \'passive_filetypes': ['html']
" }
" let g:syntastic_auto_jump = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_javascript_jslint_conf = "--white --undef --nomen --regexp --plusplus --bitwise --newcap --sloppy --vars"
" let g:syntastic_javascript_jslint_conf = "--undef --nomen --regexp --plusplus --bitwise --newcap --sloppy --vars"
"}}}

"-------------------------------------------------------------------------------
" tpope/vim-fugitive {{{
"-------------------------------------------------------------------------------
nnoremap <Space>gd :<C-u>Gdiff<Enter>
nnoremap <Space>gs :<C-u>Gstatus<Enter>
nnoremap <Space>gl :<C-u>Glog<Enter>
nnoremap <Space>ga :<C-u>Gwrite<Enter>
nnoremap <Space>gc :<C-u>Gcommit<Enter>
nnoremap <Space>gC :<C-u>Git commit --amend<Enter>
nnoremap <Space>gb :<C-u>Gblame<Enter>
" }}}

"-------------------------------------------------------------------------------
" h1mesuke/vim-alignta {{{
"-------------------------------------------------------------------------------
vnoremap <silent> => :Align @1 =><CR>
vnoremap <silent> = :Align @1 =<CR>
vnoremap <silent> == =
" }}}

"-------------------------------------------------------------------------------
" hallettj/jslint.vim {{{
"-------------------------------------------------------------------------------
" #13: Vim(echoerr): could not invoke JSLint - Issues - hallettj/jslint.vim - GitHub
" https://github.com/hallettj/jslint.vim/issues/13
let $JS_CMD='node'
" }}}

"-------------------------------------------------------------------------------
" Shougo/neocomplcache {{{
"-------------------------------------------------------------------------------
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_ignore_case = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_max_list = 200
let g:neocomplcache_max_keyword_width = 70
let g:neocomplcache_snippets_dir = $MYVIMRUNTIME.'/snippets'

" TAB でスニペットを展開する
" imap <silent><Tab> <Plug>(neocomplcache_snippets_expand)
" smap <silent><Tab> <Plug>(neocomplcache_snippets_expand)

"スニペットを展開する。スニペットが関係しないところでは行末まで削除
imap <expr><C-k> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : "\<C-o>D"
smap <expr><C-k> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : "\<C-o>D"

"オムニ補完の手動呼び出し
" imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"
" smap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
" inoremap <expr><C-e>  neocomplcache#cancel_popup()
" vim標準のキーワード補完を置き換える
inoremap <expr><C-n> neocomplcache#manual_keyword_complete()

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
	let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'

" dictionary completion
let g:neocomplcache_dictionary_filetype_lists = {
			\'coffee'     : $MYVIMRUNTIME.'/dict/javascript.dict',
			\'javascript' : $MYVIMRUNTIME.'/dict/javascript.dict',
			\'vim'        : $MYVIMRUNTIME.'/dict/vim.dict',
			\'php'        : $MYVIMRUNTIME.'/dict/php.dict'
			\}
nnoremap <Leader>es :<C-u>NeoComplCacheEditSnippets<CR>
"Nesでスニペットを編集
command! -nargs=* Nes NeoComplCacheEditSnippets
" }}}

"-------------------------------------------------------------------------------
" thinca/vim-quickrun {{{
"-------------------------------------------------------------------------------
let g:quickrun_config = {}
" let g:quickrun_config = {
" 			\'*': {'runner': 'vimproc:100'},
" 			\}
let g:quickrun_config.javascript = {'command': 'node', 'exec': ['%c %s']}
" 
augroup QuickRunPHPUnit
  autocmd!
  autocmd BufWinEnter,BufNewFile *Test.php set filetype=php.phpunit
augroup END

" nnoremap <Leader>r :<C-u>QuickRun<CR>
let g:quickrun_config['php.phpunit'] = {}
let g:quickrun_config['php.phpunit']['command'] = 'phpunit'
let g:quickrun_config['php.phpunit']['exec'] = '%c %o %s'
" }}}


"------------------------------------
" surround.vim {{{
"------------------------------------
" s, ssで選択範囲を指定文字でくくる
nmap s <Plug>Ysurround
nmap ss <Plug>Yssurround
" }}}

"-------------------------------------------------------------------------------
" Shougo/unite.vim {{{
"-------------------------------------------------------------------------------
" 入力モードで開始する
let g:unite_enable_start_insert = 1
let g:unite_source_file_mru_time_format = ''
let g:unite_source_file_mru_limit = 200
" let g:unite_enable_split_vertically = 1
" let g:unite_source_file_mru_ignore_pattern='.*\/$\|.*Application\ Data.*'
"grep"に与えるデフォルトのオプションを指定する。
" let g:unite_source_grep_default_opts = '-iRHn'

let g:unite_source_menu_menus = {}
let g:unite_source_menu_menus.shortcut = {
			\     'description' : 'Shortcut menu',
			\ }
let g:unite_source_menu_menus.shortcut.candidates = {
			\       'Bundle':     'Unite neobundle/install:!',
			\       'Font':       'Unite -auto-preview font',
			\       'ghci':       'VimShellInteractive ghci',
			\       'python':     'VimShellInteractive python',
			\       'earthquake': 'VimShellInteractive earthquake',
			\       'Unite Beautiful Attack' : 'Unite -auto-preview colorscheme',
			\     }
function g:unite_source_menu_menus.shortcut.map(key, value)
	return {
				\       'word' : a:key, 'kind' : 'command',
				\       'action__command' : a:value,
				\     }
endfunction

" デフォルトでは ignorecase と smartcase を使う
call unite#set_buffer_name_option('default', 'ignorecase', 1)
call unite#set_buffer_name_option('default', 'smartcase', 1)

nnoremap <silent> <Space>ua :<C-u>Unite -buffer-name=files bookmark buffer file_mru directory_mru file file/new<CR>
nnoremap <silent> <Space>ub :<C-u>Unite -buffer-name=files buffer<CR>
nnoremap <silent> <Space>uf :<C-u>UniteWithBufferDir -buffer-name=files file file/new<CR>
nnoremap <silent> <Space>uk :<C-u>Unite -buffer-name=files bookmark file file/new<CR>
nnoremap <silent> <Space>um :<C-u>Unite -buffer-name=files file_mru directory_mru file file/new<CR>
nnoremap <silent> <Space>uu :<C-u>Unite -buffer-name=files buffer tab file_mru bookmark file file/new<CR>
nnoremap <silent> -- :<C-u>UniteWithBufferDir -buffer-name=files file file/new<CR>

nnoremap <silent> <Space>uc :<C-u>Unite -buffer-name=colorscheme -auto-preview colorscheme<Cr>
nnoremap <silent> <Space>ug :<C-u>Unite -no-quit -auto-preview grep<CR>
nnoremap <silent> <Space>uh :<C-u>Unite help<CR>
nnoremap <silent> <Space>uo :<C-u>Unite -buffer-name=outline outline<CR>
nnoremap <silent> <Space>uq :<C-u>Unite -auto-preview qf<CR>
" nnoremap <silent> <Space>ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> <Space>ut :<C-u>Unite tab<CR>
nnoremap <silent> <Space>us :<C-u>Unite source<CR>
nnoremap <silent> <Space>uv :<C-u>Unite vimeshell/history<CR>
nnoremap <silent> <Space>ll :<C-u>Unite menu:shortcut<CR>

" nnoremap <silent> /  :<C-u>Unite -buffer-name=search line -start-insert -no-quit<CR>
nnoremap <silent> <Space>ud :<C-u>Unite -no-quit -auto-preview grep:**:-RHn:TODO<CR>

nnoremap <silent> <C-u> :<C-u>Unite -buffer-name=files buffer file_mru bookmark file<CR>
nnoremap <silent> <C-h> :<C-u>Unite -start-insert help<CR>

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
	nmap <buffer> <ESC>      <Plug>(unite_exit)
	imap <buffer> <ESC><ESC> <Plug>(unite_exit)
	" imap <buffer> jj         <Plug>(unite_insert_leave)
	imap <buffer> <C-w>      <Plug>(unite_delete_backward_path)
endfunction
" }}}

"-------------------------------------------------------------------------------
" Shougo/vimfiler {{{
"-------------------------------------------------------------------------------
call vimfiler#set_execute_file('vim', 'vim')
call vimfiler#set_execute_file('_', 'vim')
let g:vimfiler_as_default_explorer=1
let g:vimfiler_directory_display_top=1
let g:vimfiler_edit_action="vsplit"
let g:vimfiler_enable_auto_cd=1
let g:vimfiler_safe_mode_by_default=0
let g:vimfiler_sort_type='extension'

" Like Textmate icons.
let g:vimfiler_file_icon = '-'
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_marked_file_icon = '*'

" nnoremap <Space>vf :<C-u>VimFilerDouble<CR>
nnoremap <Space>vf :<C-u>VimFilerBufferDir<CR>
nnoremap <Space>ff :<C-u>VimFiler -buffer-name=explorer -split -simple -winwidth=35 -toggle<CR>
" nnoremap <C-e> :<C-u>VimFiler<CR>
" inoremap <C-e> :<C-u>VimFiler<CR>

autocmd FileType vimfiler call s:vimfiler_my_settings()
function! s:vimfiler_my_settings()
" 	nnoremap <buffer><silent>/ :<C-u>Unite file -default-action=vimfiler<CR>
	setlocal nonumber
endfunction
" }}}

nnoremap <F2> :VimFiler -buffer-name=explorer -split -winwidth=45 -toggle -no-quit<Cr>
autocmd! FileType vimfiler call g:my_vimfiler_settings()
function! g:my_vimfiler_settings()
  nmap     <buffer><expr><Cr> vimfiler#smart_cursor_map("\<Plug>(vimfiler_expand_tree)", "\<Plug>(vimfiler_edit_file)")
  nnoremap <buffer>s          :call vimfiler#mappings#do_action('my_split')<Cr>
  nnoremap <buffer>v          :call vimfiler#mappings#do_action('my_vsplit')<Cr>
endfunction

let s:my_action = { 'is_selectable' : 1 }
function! s:my_action.func(candidates)
  wincmd p
  exec 'split '. a:candidates[0].action__path
endfunction
call unite#custom_action('file', 'my_split', s:my_action)

let s:my_action = { 'is_selectable' : 1 }                     
function! s:my_action.func(candidates)
  wincmd p
  exec 'vsplit '. a:candidates[0].action__path
endfunction
call unite#custom_action('file', 'my_vsplit', s:my_action)

"-------------------------------------------------------------------------------
" smartchr.vim {{{
"-------------------------------------------------------------------------------
"inoremap <expr> _ smartchr#one_of('_', '->', '__')

" smartchr.vim入れた - 物置き
" http://d.hatena.ne.jp/ampmmn/20080925/1222338972

" 演算子の間に空白を入れる
inoremap <expr> + smartchr#one_of(' + ', '+', '++')
inoremap <expr> - smartchr#one_of(' - ', '-', '--')
inoremap <expr> / smartchr#one_of('/', ' / ', '// ', '//')
" inoremap <expr> * smartchr#one_of(' * ', '*', '** ', '**')
inoremap <expr> % smartchr#one_of('%', ' % ')
inoremap <expr> & smartchr#one_of('&', ' & ', ' && ')
" inoremap <expr> <Bar> smartchr#one_of(' <Bar> ', ' <Bar><Bar> ', '<Bar>')
inoremap <expr> , smartchr#one_of(',', ', ', ' => ')
inoremap <expr> < smartchr#one_of('<', ' < ', '<<', '<<<')
inoremap <expr> > smartchr#one_of('>', ' > ', ' >> ')
" inoremap <expr> < search('^#include\%#', 'bcn')? ' <': smartchr#one_of(' < ', '<', '<<', '<<<')
" inoremap <expr> > search('^#include <.*\%#', 'bcn')? '>': smartchr#one_of(' > ', '>', ' >> ')
" 3項演算子の場合は、後ろのみ空白を入れる
inoremap <expr> ? smartchr#one_of('?', '? ')
inoremap <expr> : smartchr#one_of(':', ': ', '::')

" =の場合、単純な代入や比較演算子として入力する場合は前後にスペースをいれる。
" 複合演算代入としての入力の場合は、直前のスペースを削除して=を入力
inoremap <expr> = search('\(&\<bar><bar>\<bar>+\<bar>-\<bar>/\<bar>>\<bar><\) \%#', 'bcn')? '<bs>= '
			\ : search('\(*\<bar>!\)\%#', 'bcn') ? '= '
			\ : smartchr#one_of(' = ', '=', ' == ', ' === ')
inoremap <expr> ! smartchr#one_of('!', ' != ', ' !== ')
inoremap <expr> ~ smartchr#one_of('~', ' =~ ')
" 下記の文字は連続して現れることがまれなので、二回続けて入力したら改行する
inoremap <expr> } smartchr#one_of('}', '}<cr>')
inoremap <expr> ; smartchr#one_of(';', ';<cr>')
" 「->」は入力しづらいので、..で置換え
inoremap <expr> . smartchr#loop('.', '->', '..', '...')
" 行先頭での@入力で、プリプロセス命令文を入力
" inoremap <expr> @ search('^\(#.\+\)\?\%#','bcn')? smartchr#one_of('#define', '#include', '#ifdef', '#endif', '@'): '@'

inoremap <expr> " search('^#include\%#', 'bcn')? ' "': '"'
" if文直後の(は自動で間に空白を入れる
" inoremap <expr> ( search('\<\if\%#', 'bcn')? ' (': '('
" inoremap <expr> ( search('\<\while\%#', 'bcn')? ' (': '('
" inoremap <expr> ( search('\<\for\%#', 'bcn')? ' (': '('
" inoremap <expr> () search('\<\if\%#', 'bcn')? ' ()': '()'
" inoremap <expr> () search('\<\while\%#', 'bcn')? ' ()': '()'
" inoremap <expr> () search('\<\for\%#', 'bcn')? ' ()': '()'
"}}}

"-------------------------------------------------------------------------------
" thinca/vim-ref {{{
"-------------------------------------------------------------------------------
" nnoremap <silent><Space>ra :<C-u>Ref alc<Space>
nnoremap <silent><Space>rp :<C-u>Unite ref/phpmanual<CR>
" nnoremap <silent> <Space>rl :<C-u>Unite ref/perldoc<CR>
nnoremap <silent><Space>rj :<C-u>Unite ref/jquery<CR>
nnoremap <silent><Space>rr :<C-u>Unite ref/refe<CR>
let g:ref_source_webdict_sites = {
\   'alc': {
\     'url': 'http://eow.alc.co.jp/%s',
\     'keyword_encoding': 'utf-8',
\     'cache': 1,
\   },
\   'weblio': {
\     'url': 'http://ejje.weblio.jp/content/%s',
\     'keyword_encoding': 'utf-8',
\     'cache': 1,
\   },
\ }
let g:ref_source_webdict_sites.default = 'alc'
function! g:ref_source_webdict_sites.alc.filter(output)
  return join(split(a:output, "\n")[29 :], "\n")
endfunction
function! g:ref_source_webdict_sites.weblio.filter(output)
  return join(split(a:output, "\n")[53 :], "\n")
endfunction
" let g:ref_alc_start_linenumber = 41
let g:ref_phpmanual_path = $HOME.'/Dropbox/Documents/References/php_manual_ja/php-chunked-xhtml/'
let g:ref_jquery_path = $HOME.'/Dropbox/Documents/References/jqapi-latest/docs'
" }}}

"-------------------------------------------------------------------------------
" Shougo/vimshell {{{
"-------------------------------------------------------------------------------
nnoremap <silent> <Space>sh : <C-u>VimShell<CR>

" vimproc
" if has('mac')
    " let g:vimproc_dll_path = $HOME."/.vim/bundle/vimproc/autoload/procmac.so"
" elseif has('unix')
    " let g:vimproc_dll_path = $HOME."/.vim/bundle/vimproc/autoload/procunix.so"
" endif

" let g:vimshell_prompt = '$ '
" let g:vimshell_user_prompt = 'sytem("aa") . "[" . $USER . " @ " . hostname() . "] " . '
let g:vimshell_user_prompt = '"[" . $USER . "@" . hostname() . "] " . getcwd()'
" let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
" let g:vimshell_right_prompt = 'vcs#info("(%s)-[%b]", "(%s)-[%b|%a]")'
let g:vimshell_enable_smart_case = 1
let g:vimshell_ignore_case = 1
" let g:vimshell_escape_colors= [
" \'#3c3c3c', '#ff6666', '#66ff66', '#ffd30a', '#1e95fd', '#ff13ff', '#1bc8c8', '#C0C0C0',
" \'#686868', '#ff6666', '#66ff66', '#ffd30a', '#6699ff', '#f820ff', '#4ae2e2', '#ffffff'
" \]
"}}}

"-------------------------------------------------------------------------------
" tyru/restert
"-------------------------------------------------------------------------------
"-------------------------------------------------------------------------------
" tyru/caw.vim
"-------------------------------------------------------------------------------
nmap <Space>cc <Plug>(caw:I:toggle)
vmap <Space>cc <Plug>(caw:I:toggle)
"-------------------------------------------------------------------------------
" Nerd_Commenter
"-------------------------------------------------------------------------------
" let g:NERDCreateDefaultMappings = 0
" let NERDSpaceDelims = 1

" nmap <Space>cc <Plug>NERDCommenterToggle
" vmap <Space>cc <Plug>NERDCommenterToggle
" nmap <Space>ca <Plug>NERDCommenterAppend
" vmap <Space>cs <Plug>NERDCommenterSexy
" map <Leader>x, c<space>
" map <Leader>x <Plug>NERDCommenterToggle

" -------------------------------------------------------------------------------
" NERDTree
" -------------------------------------------------------------------------------
" nnoremap <silent><Space>tt :NERDTreeToggle<CR>
" nnoremap <silent><Space>nt :NERDTree <C-R>=expand("%:p:h")<CR><CR>
" let NERDTreeShowHidden =1
" let NERDTreeHijackNetrw =0
" let NERDTreeWinSize=20
" let NERDTreeWinPos="left"

"-------------------------------------------------------------------------------
" godlygeek/tabular
"-------------------------------------------------------------------------------
" if exists(":Tabularize")
" 	nmap <Leader>a-  :Tabularize /=<CR>
" 	vmap <Leader>a-  :Tabularize /=<CR>
" 	nmap <Leader>a-- :Tabularize /=><CR>
" 	vmap <Leader>a-- :Tabularize /=><CR>
" 	nmap <Leader>a:  :Tabularize /:\zs<CR>
" 	vmap <Leader>a:  :Tabularize /:\zs<CR>
" endif
" 
" nnoremap <Leader>T :<C-u>Tabularize /
" vnoremap <Leader>T :<C-u>Tabularize /

"-------------------------------------------------------------------------------
" mattn/zencoding.vim {{{
"-------------------------------------------------------------------------------
" 入力補完を有効にする
let g:use_zen_complete_tag = 1
let g:user_zen_settings = {
\	'lang': 'ja',
\	'html': {
\		'snippets': {
\			'jq': '<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>',
\			'jq9': '<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>',
\			'jq8': '<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>',
\			'jq7': '<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>',
\			'jq6': '<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>',
\			'jq5': '<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js"></script>',
\			'coffee': '<script type="text/javascript" src="http://jashkenas.github.com/coffee-script/extras/coffee-script.js" type="text/javascript"></script>',
\			'meta:script': '<meta http-equiv="Content-Script-Type" content="text/javascript" />',
\			'meta:norobots': '<meta name="robots" content="noindex, nofollow, noarchive" />'
\		},
\	 },
\	'css': {
\		'filters': 'fc',
\	},
\	'javascript': {
\		'snippets': {
\			'jq': "$(function() {\n\t${cursor}${child}\n});",
\			'fn': "(function() {\n\t${cursor}\n});",
\			'tm': "setTimeout(function() {\n\t${cursor}\n}, 100);",
\		},
\	},
\	'coffee': {
\		'snippets': {
\			'jq': "$ -> \n\t${cursor}${child}",
\		}
\	},
\	'php': {
\		'extends': 'html',
\		'filters': 'html,c',
\	},
\}
"}}}

"-------------------------------------------------------------------------------
" Lokaltog/vim-powerline {{{
"-------------------------------------------------------------------------------
let g:Powerline_symbols = 'fancy'
let g:Powerline_theme       ='solarized256'
let g:Powerline_colorscheme ='solarized256'

let s:prev_seg = 'paste_indicator'
for seg in ['fileformat', 'fileencoding', 'filetype', 'lineinfo']
  call Pl#Theme#InsertSegment(seg, 'after', s:prev_seg)
  let s:prev_seg = seg
endfor
unlet s:prev_seg
" }}}

"-------------------------------------------------------------------------------
" veloce/vim-aldmeris {{{
"-------------------------------------------------------------------------------
" let g:aldmeris_termcolors = "tango"
" let g:aldmeris_transparent = 1
"}}}

"-------------------------------------------------------------------------------
" teramako/jscomplete-vim {{{
"-------------------------------------------------------------------------------
autocmd FileType javascript
  \ :setl omnifunc=jscomplete#CompleteJS
let g:jscomplete_use = ['dom', 'moz']
" => autoload/js/dom.vim と autoload/js/moz.vim が読まれる
"}}}

"-------------------------------------------------------------------------------
" test
"-------------------------------------------------------------------------------
augroup taskpaper
	autocmd! BufRead,BufNewFile *.taskpaper   setfiletype taskpaper
	autocmd FileType taskpaper setlocal shiftwidth=2 tabstop=2 softtabstop=2
	autocmd filetype taskpaper :nnoremap <buffer> <C-m> - 
	autocmd filetype taskpaper :inoremap <buffer> <C-m> <ESC>- 
augroup END

autocmd FileType javascript nnoremap <buffer> <C-c> :<C-u>call WriteJSDocComment()<CR>
" Windowsでも.vimをRumtimeディレクトリにする
" set runtimepath+=$HOME/.vim

" たった一行で人生が変わった.vimrcでの設定とその意味
" http://hail2u.net/blog/software/only-one-line-life-changing-vimrc-setting.html
autocmd FileType html setlocal includeexpr=substitute(v:fname,'^\\/','','') | setlocal path+=;/

autocmd FileType qf setlocal wrap
autocmd FileType coffee setlocal expandtab

"
"-------------------------------------------------------------------------------
" after/ftplugin
"-------------------------------------------------------------------------------
" c.vim
" java.vim
" perl.vim
" php.vim
" ruby.vim
" unite.vim
" vimperator.vim
" vimshell.vim
"
if has('win32')
	nnoremap <Space>hh :! start "C:\Program Files\Hidemaru\Hidemaru.exe" "%"<CR>
endif

" vimperator
au! BufNewFile,BufRead *.vimp setl ft=vimperator

augroup php
	autocmd! php
	" autocmd FileType php let php_sql_query=1
	autocmd FileType php let php_noShortTags=1
	autocmd FileType php let php_asp_tags=1
	" autocmd FileType php let php_folding=1
	autocmd FileType php let php_htmlInStrings=1
	autocmd FileType php inoremap <C-d> <ESC>:call PhpDocSingle()<CR>i 
	autocmd FileType php nnoremap <C-d> :call PhpDocSingle()<CR> 
	autocmd FileType php vnoremap <C-d> :call PhpDocRange()<CR> 
	" autocmd Syntax php set foldmethod=syntax
augroup END

augroup smarty
	autocmd! smarty
	autocmd FileType smarty setlocal expandtab
augroup END
" *.coffee を保存するとコンパイル
" autocmd BufWritePost *.coffee silent CoffeeMake! -cb | cwindow
"

augroup markdown
	autocmd BufNewFile,BufRead *.md set filetype=markdown
augroup END

augroup ruby
	autocmd FileType php setlocal expandtab
augroup END

" autocmd BufRead * call Backup()
" function! Backup()
"   echo expand("%:p")
"   echo expand('%:r')
"   echo expand('%:e')
" endfunction

" autocmd CursorMovedI * :call vimproc#system_bg($HOME . "/bin/vim-key-sound.rb '" . getline('.')[col('.') - 2] . "'")

"-------------------------------------------------------------------------------
nmap : <sid>(command-line-enter)
xmap : <sid>(command-line-enter)

autocmd CmdwinEnter * call s:init_cmdwin()
function! s:init_cmdwin()
  nnoremap <buffer> q :<C-u>quit<CR>
  nnoremap <buffer> <TAB> :<C-u>quit<CR>
  inoremap <buffer><expr><CR> pumvisible() ? "\<C-y>\<CR>" : "\<CR>"
  inoremap <buffer><expr><C-h> pumvisible() ? "\<C-y>\<C-h>" : "\<C-h>"
  inoremap <buffer><expr><BS> pumvisible() ? "\<C-y>\<C-h>" : "\<C-h>"

  " Completion.
  inoremap <buffer><expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

  startinsert!
endfunction
