# �ҥ��ȥ������
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000

export LESSCHARSET=utf-8

# ���Ϥ��䴰��ͭ���ˤ���
autoload -Uz compinit
compinit

## �ץ��ץȤ�����
autoload colors
colors

limit coredumpsize 102400 # ��������ץ�����������

# �䴰����ο��Ť�
# eval `dircolors`
export ZLS_COLORS=$LS_COLORS
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
# �䴰����Υ������������ͭ����
zstyle ':completion:*:default' menu select=1
# �䴰������ʸ���Ⱦ�ʸ������̤��ʤ�
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

#-------------------------------------------------------------------------------
# setopt
#-------------------------------------------------------------------------------
setopt auto_cd              # �ǥ��쥯�ȥ�̾������ cd
setopt auto_list            # �䴰��������ɽ��
setopt auto_menu            # TAB �ǽ���䴰������ڤ��ؤ���
setopt auto_param_keys      # ���å����б��ʤɤ�ưŪ���䴰
setopt auto_param_slash     # �ǥ��쥯�ȥ�̾���䴰�������� / ��ưŪ���ղä��������䴰��������
setopt auto_pushd           # cd ���˼�ư�� push
setopt auto_resume          # �����ڥ����Υץ�����Ʊ�����ޥ��̾��¹Ԥ������ϥꥸ�塼��
setopt brace_ccl            # {a-c} �� a b c ��Ÿ�����뵡ǽ��Ȥ���褦�ˤ���
setopt correct              # ���ڥ�����å�
setopt complete_aliases
setopt extended_glob        # �ե�����̾��# , ~, ^ �� 3 ʸ��������ɽ���Ȥ��ư���
setopt extended_history     # zsh �γ���, ��λ�����ҥ��ȥ�ե�����˽񤭹���
setopt equals               # =command �� command �Υѥ�̾��Ÿ������
setopt hist_ignore_dups     # ľ����Ʊ�����ޥ�ɤ�ҥ��ȥ���ɲä��ʤ�
setopt hist_ignore_space    # ���ޥ�ɥ饤�����Ƭ�����ڡ����ǻϤޤ���ҥ��ȥ���ɲä��ʤ�
setopt hist_no_store        # history (fc -l) ���ޥ�ɤ�ҥ��ȥ�ꥹ�Ȥ����������
setopt hist_verify          # �ҥ��ȥ��ƤӽФ��Ƥ���¹Ԥ���֤˰�ö�Խ�
setopt interactive_comments # ���ޥ�ɥ饤��Ǥ�# �ʹߤ򥳥��Ȥȸ��ʤ�
setopt long_list_jobs       # �������ޥ�� jobs �ν��Ϥ�ǥե���Ȥ� jobs -l �ˤ���
setopt list_types           # �䴰��������ǥե�����μ��̤�ޡ���ɽ��
setopt list_packed          # �䴰�����ͤ��ɽ��
setopt mark_dirs            # �ե�����̾��Ÿ���ǥǥ��쥯�ȥ�˥ޥå�������������� / ���ղä���
setopt magic_equal_subst    # --prefix=/usr �ʤɤ� = �ʹߤ��䴰
setopt noautoremoveslash    # �Ǹ�Υ���å����ưŪ�˺�����ʤ�
setopt nobeep               # �ӡ��פ��Ĥ餵�ʤ�
setopt no_flow_control      # �ե�����ȥ����̵���ˤ���
setopt numeric_glob_sort    # �ե�����̾��Ÿ���Ǽ����ǤϤʤ�����Ū�˥�����
setopt print_eight_bit      # ���ܸ�ե�����̾��ɽ����ǽ�ˤ���
setopt prompt_subst         # ����Ȥ�
setopt pushd_ignore_dups    # Ʊ���ǥ��쥯�ȥ�� pushd ���ʤ�
setopt share_history        # �ҥ��ȥ��ͭ

unsetopt promptcr           # ���Ϥ�ʸ���������˲��ԥ����ɤ�̵�����Ǥ�ɽ��


#-------------------------------------------------------------------------------
# prompt
#-------------------------------------------------------------------------------
autoload -Uz vcs_info
precmd () {
  psvar=()
  LANG=en_US.UTF-8 vcs_info
  psvar[1]=$vcs_info_msg_0_
}

# ��¦��ɽ���������̾�Υץ��ץ�
PROMPT="
[%{${fg[green]}%}%n%{${reset_color}%} @ %{${fg[green]}%}%m%{${reset_color}%}] %{${fg[magenta]}%}\$(aa)%{${reset_color}%}
%{${fg[blue]}%}[%d]%{${reset_color}%} %1(v|%F{green}%1v%f|)
%(!.#.$) "

# 2�԰ʾ�Υ��ޥ�ɤ����Ϥ���ݤ�ɽ�������ץ��ץ�
PROMPT2="%{${fg[blue]}%}%_> %{${reset_color}%}"

# ���ޥ�ɤ��Ǥ��ְ㤨���Ȥ��Ρ֤⤷�����ơץץ��ץ�
SPROMPT="%{${fg[red]}%}correct: %R -> %r [nyae]? %{${reset_color}%}"

#��¦��ɽ�������ץ��ץȡ����Ϥ����ȼ�ưŪ�˾ä���
RPROMPT="%{${fg[cyan]}%}%D{%F %a} %T%{${reset_color}%}"


#-------------------------------------------------------------------------------
# bindkey
#-------------------------------------------------------------------------------
# emacs �������Х���ɤˤ���
bindkey -e
bindkey '^p' history-beginning-search-backward
bindkey '^n' history-beginning-search-forward


#-------------------------------------------------------------------------------
# The 'ls' family (this assumes you use a recent GNU ls)
#-------------------------------------------------------------------------------
alias ls='ls -G'           # add colors for filetype recognition
alias la='ls -Al'          # show hidden files
alias ll='ls -l'
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

#-------------------------------------------------------------------------------
#
#-------------------------------------------------------------------------------
case "${OSTYPE}" in
  darwin*)
    [-f ~/dotfiles/.zshrx.mac] && source ~/dotfiles/.zshrc.mac
    ;;
esac
