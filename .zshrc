# ヒストリの設定
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000

export LESSCHARSET=utf-8

# 強力な補完を有効にする
autoload -Uz compinit
compinit

## プロンプトの設定
autoload colors
colors

limit coredumpsize 102400 # コアダンプサイズを制限

# 補完候補の色づけ
# eval `dircolors`
export ZLS_COLORS=$LS_COLORS
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
# 補完候補のカーソル選択を有効に
zstyle ':completion:*:default' menu select=1
# 補完時に大文字と小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

#-------------------------------------------------------------------------------
# setopt
#-------------------------------------------------------------------------------
setopt auto_cd              # ディレクトリ名だけで cd
setopt auto_list            # 補完候補を一覧表示
setopt auto_menu            # TAB で順に補完候補を切り替える
setopt auto_param_keys      # カッコの対応などを自動的に補完
setopt auto_param_slash     # ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt auto_pushd           # cd 時に自動で push
setopt auto_resume          # サスペンド中のプロセスと同じコマンド名を実行した場合はリジューム
setopt brace_ccl            # {a-c} を a b c に展開する機能を使えるようにする
setopt correct              # スペルチェック
setopt complete_aliases
setopt extended_glob        # ファイル名で# , ~, ^ の 3 文字を正規表現として扱う
setopt extended_history     # zsh の開始, 終了時刻をヒストリファイルに書き込む
setopt equals               # =command を command のパス名に展開する
setopt hist_ignore_dups     # 直前と同じコマンドをヒストリに追加しない
setopt hist_ignore_space    # コマンドラインの先頭がスペースで始まる場合ヒストリに追加しない
setopt hist_no_store        # history (fc -l) コマンドをヒストリリストから取り除く。
setopt hist_verify          # ヒストリを呼び出してから実行する間に一旦編集
setopt interactive_comments # コマンドラインでも# 以降をコメントと見なす
setopt long_list_jobs       # 内部コマンド jobs の出力をデフォルトで jobs -l にする
setopt list_types           # 補完候補一覧でファイルの種別をマーク表示
setopt list_packed          # 補完候補を詰めて表示
setopt mark_dirs            # ファイル名の展開でディレクトリにマッチした場合末尾に / を付加する
setopt magic_equal_subst    # --prefix=/usr などの = 以降も補完
setopt noautoremoveslash    # 最後のスラッシュを自動的に削除しない
setopt nobeep               # ビープを鳴らさない
setopt no_flow_control      # フローコントロールを無効にする
setopt numeric_glob_sort    # ファイル名の展開で辞書順ではなく数値的にソート
setopt print_eight_bit      # 日本語ファイル名を表示可能にする
setopt prompt_subst         # 色を使う
setopt pushd_ignore_dups    # 同じディレクトリを pushd しない
setopt share_history        # ヒストリを共有

unsetopt promptcr           # 出力の文字列末尾に改行コードが無い場合でも表示


#-------------------------------------------------------------------------------
# prompt
#-------------------------------------------------------------------------------
autoload -Uz vcs_info
precmd () {
  psvar=()
  LANG=en_US.UTF-8 vcs_info
  psvar[1]=$vcs_info_msg_0_
}

# 左側に表示されるの通常のプロンプト
PROMPT="
[%{${fg[green]}%}%n%{${reset_color}%} @ %{${fg[green]}%}%m%{${reset_color}%}] %{${fg[magenta]}%}\$(aa)%{${reset_color}%}
%{${fg[blue]}%}[%d]%{${reset_color}%} %1(v|%F{green}%1v%f|)
%(!.#.$) "

# 2行以上のコマンドを入力する際に表示されるプロンプト
PROMPT2="%{${fg[blue]}%}%_> %{${reset_color}%}"

# コマンドを打ち間違えたときの「もしかして」プロンプト
SPROMPT="%{${fg[red]}%}correct: %R -> %r [nyae]? %{${reset_color}%}"

#右側に表示されるプロンプト。入力が被ると自動的に消える
RPROMPT="%{${fg[cyan]}%}%D{%F %a} %T%{${reset_color}%}"


#-------------------------------------------------------------------------------
# bindkey
#-------------------------------------------------------------------------------
# emacs 風キーバインドにする
bindkey -e
bindkey '^p' history-beginning-search-backward
bindkey '^n' history-beginning-search-forward


#-------------------------------------------------------------------------------
# The 'ls' family (this assumes you use a recent GNU ls)
#-------------------------------------------------------------------------------
#
alias ls='ls -G'               # add colors for filetype recognition
alias la='ls -Al'              # show hidden files
alias ll='ls -la'
alias lx='ls -lXB'             # sort by extension
alias lk='ls -lSr'             # sort by size, biggest last
alias lc='ls -ltcr'            # sort by and show change time, most recent last
alias lu='ls -ltur'            # sort by and show access time, most recent last
alias lt='ls -ltr'             # sort by date, most recent last
alias lm='ls -al |more'        # pipe through 'more'
alias lr='ls -lR'              # recursive ls

alias cp='cp -iRv'
alias mv='mv -iv'
alias rm='rm -iv'
alias mkdir='mkdir -p'

#-------------------------------------------------------------------------------
#
#-------------------------------------------------------------------------------
case "${OSTYPE}" in
  darwin*)
    [ -f ~/dotfiles/.zshrx.mac ] && source ~/dotfiles/.zshrc.mac
    ;;
esac
