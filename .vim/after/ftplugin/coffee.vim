setlocal expandtab       " <Tab> を挿入するとき、代わりに適切な数の空白を使う
setlocal shiftwidth=2  " 自動インデントやコマンド "<<", ">>" でずれる幅
setlocal tabstop=2     " 画面上でタブ文字が占める幅
setlocal softtabstop=2 " <Tab> や <BS> を打ち込んだときにカーソルが動く幅

" -c jsファイルとして出力
" -p 出力結果を標準出力にプリント
" -b セーフティー関数で囲わない
nnoremap <Leader>p :<C-u>QuickRun -exec 'coffee -bp %s'<CR>
nnoremap <Leader>c :<C-u>QuickRun -exec 'coffee -cb %s'<CR>
nnoremap <Leader>l :<C-u>QuickRun -exec 'coffee -lint %s'<CR>

