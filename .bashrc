#===============================================================================
# 環境変数
#===============================================================================
export MANPATH=/opt/local/man:$MANPATH
export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim

export HISTIGNORE="ls:cd:[bf]g:exit"

#===============================================================================
# シェル変数
#===============================================================================
HISTTIMEFORMAT='%F %T '

# PS1="\n\[\033[36m\]\$(export LANG=C; date)\n\[\033[m\][\[\033[32m\]\u\[\033[m\] @ \[\033[32m\]\h\033[m\]] \! \# \[\033[33;1m\]\w\[\033[m\]\n\[\033[35m\]\$(aamaker.rb)\[\033[m\] $ "
#PS1="\n \e[0;36m\$(export LANG=C; date)\n \e[m[\e[0;32m\u \e[m@ \e[0;32m\h\e[m] \! \# \e[0;33;1m\w\n \e[0;35m\$(aamaker.rb) \e[m\$ "
K='\[\e[0;30m\]' # Black - Regular
R='\[\e[0;31m\]' # Red
G='\[\e[0;32m\]' # Green
Y='\[\e[0;33m\]' # Yellow
B='\[\e[0;34m\]' # Blue
M='\[\e[0;35m\]' # Purple
C='\[\e[0;36m\]' # Cyan
W='\[\e[0;37m\]' # White
EMK='\[\e[1;30m\]' # Black - Bold
EMR='\[\e[1;31m\]' # Red
EMG='\[\e[1;32m\]' # Green
EMY='\[\e[1;33m\]' # Yellow
EMB='\[\e[1;34m\]' # Blue
EMM='\[\e[1;35m\]' # Purple
EMC='\[\e[1;36m\]' # Cyan
EMW='\[\e[1;37m\]' # White
UNK='\[\e[4;30m\]' # Black - Underline
UNR='\[\e[4;31m\]' # Red
UNG='\[\e[4;32m\]' # Green
UNY='\[\e[4;33m\]' # Yellow
UNB='\[\e[4;34m\]' # Blue
UNM='\[\e[4;35m\]' # Purple
UNC='\[\e[4;36m\]' # Cyan
UNW='\[\e[4;37m\]' # White
BGB='\[\e[40m\]'   # Black - Background
BGR='\[\e[41m\]'   # Red
BGG='\[\e[42m\]'   # Green
BGY='\[\e[43m\]'   # Yellow
BGB='\[\e[44m\]'   # Blue
BGP='\[\e[45m\]'   # Purple
BGC='\[\e[46m\]'   # Cyan
BGW='\[\e[47m\]'   # White
RST='\[\e[0m\]'    # Text Reset

PS1="
${C}$(export LANG=C; date)
${RST}[${G}\u ${RST}@ ${G}\h${RST}] \! \# ${Y}\w
${M}\$(aamaker.rb) ${RST}\$ "

source ~/perl5/perlbrew/etc/bashrc

#===============================================================================
# The 'ls' family (this assumes you use a recent GNU ls)
#===============================================================================
alias ls='ls -hF'          # add colors for filetype recognition
alias la='ls -Al'          # show hidden files
alias lx='ls -lXB'         # sort by extension
alias lk='ls -lSr'         # sort by size, biggest last
alias lc='ls -ltcr'        # sort by and show change time, most recent last
alias lu='ls -ltur'        # sort by and show access time, most recent last
alias lt='ls -ltr'         # sort by date, most recent last
alias lm='ls -al |more'    # pipe through 'more'
alias lr='ls -lR'          # recursive ls

alias cp='cp -iRv'
alias mv='mv -iv'
alias rm='rm -iv'
alias mkdir='mkdir -p'
# alias ..='cd ..'
# alias ...='cd -'
# alias cd="pushd"
# alias bd="popd"

alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias javac='javac -encoding UTF-8'
alias brews='brew search'
alias brewu='brew update'
alias macvim='mvim --remote-tab-silent'

#===============================================================================
# Archive handler
function unpack () {
    case $1 in
        *.tar.bz2)   tar xvjf $1 ;;
        *.tar.gz)    tar xvzf $1 ;;
        *.bz2)       bunzip2 $1  ;;
        *.rar)       unrar x $1  ;;
        *.gz)        gunzip $1   ;;
        *.tar)       tar xvf $1  ;;
        *.tbz2)      tar xvjf $1 ;;
        *.tgz)       tar xvzf $1 ;;
        *.zip)       unzip $1    ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1     ;;
        *)           echo "'$1' cannot be extracted via >unpack<" ;;
    esac
}
