if [ -f ~/.bashrc ] ; then
. ~/.bashrc
fi

export PATH=$PATH:./:~/bin:~/.cabal/bin:/usr/local/bin:/usr/local/sbin
export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTCONTROL=ignoreboth
export LANG=ja_JP.UTF-8
export LESSCHARSET=utf-8
export CLICOLOR=yes

export PERL_CPANM_OPT="--local-lib=~/extlib"
export PERL5LIB="$HOME/extlib/lib/perl5:$HOME/extlib/lib/perl5/i386-freebsd-64int:$PERL5LIB"

eval "$(rbenv init -)"
