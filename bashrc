# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
alias ..="cd .."
alias ...="cd ../.."
alias ls="ls --color=always"
alias l="ls -lAh"
alias la="ls -A"
alias ll="ls -Al"
alias duh="du -h -d 1|sort -h"
alias cman="man -L zh_CN.utf8"
alias sc="systemctl"

export PATH=$HOME/go/bin:$PATH

#source /usr/share/bash-completion/bash_completion
#source ~/.git-completion.bash
# source /etc/profile.d/autojump.bash
# Enable autojump

function mkcd {
	dir="$*";
	mkdir -p "$dir" && cd "$dir";
}

# export GTK_IM_MODULE=fcitx
# export QT_IM_MODULE=fcitx
# export XMODIFIERS="@im=fcitx"

export EDITOR=vim

man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;74m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[38;5;246m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
    man "$@"
}

cdnext() {
	oldIFS=IFS
	IFS=,
	count=0
	for file in $(ls -F ..|grep /|tr '\n' ,)
	do
		alldirs[count]="$file"
		let count+=1
	done
	IFS=$oldIFS

	currentdir=$(pwd|sed "s,^.*/\([^/]*\)$,\1/,")
	for (( num=0; num<count; num++ ))
	do
		[ ${alldirs[$num]} = $currentdir ] && break
	done
	next=$[ ($num + 1) % $count]
	[ $next -eq 0 ] && echo "All directories have been circulated. Restart from the first"
	nextdir="../${alldirs[$next]}"

	cd "$nextdir"
}

# pip bash completion start
_pip_completion()
{
    COMPREPLY=( $( COMP_WORDS="${COMP_WORDS[*]}" \
                   COMP_CWORD=$COMP_CWORD \
                   PIP_AUTO_COMPLETE=1 $1 ) )
}
complete -o default -F _pip_completion pip pip3
# pip bash completion end

export HISTTIMEFORMAT="%d/%m/%y %T "
