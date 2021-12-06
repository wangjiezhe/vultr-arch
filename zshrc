# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk

zinit ice depth=1; zinit light romkatv/powerlevel10k

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export VISUAL="vim"
export EDITOR="vim"

alias ls=exa
alias l="ls -lgh"
alias l.="ls -d .*"
alias ll="ls -lgah"
#alias duh="du -d 1 -h"
alias dfh="df -Th"
alias gps="git push"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias -g G="| grep -i"
alias -g L="| less"

alias sc=systemctl

#export GO111MODULE=on

setopt ksh_option_print
setopt no_share_history
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_ignore_all_dups

psg () {
  ps -eaf | grep -i "$@" | grep -v -e "grep .* -i"
}

psgw () {
  ps auxww | grep -i "$@" | grep -v -e "grep .* -i"
}

duh() {
  du -d1 -h -a $* | sort -h
}

t2s() {
  opencc -i "$1" -o "$1" -c t2s
}

s2t() {
  opencc -i "$1" -o "$1" -c s2t
}

rename-t2s() {
  mv "$1" $(echo "$1" | opencc -c t2s --)
}

echo-t2s() {
  echo "$1" | opencc -c t2s --
}

copy-t2s() {
  t=$(echo "$1" | opencc -c t2s --)
  if [[ "$t" == "$1" ]]; then
    t=$(echo "$1" | sed 's#\.\([^.]*\)$#_chs.\1#')
  fi
  echo "Translate $1 to $t ..."
  opencc -i "$1" -o "$t" -c t2s
}

s () {
  rg --files -g "*$1*"
}

zinit ice lucid wait; zinit light MichaelAquilina/zsh-you-should-use
# zinit ice lucid wait; zinit light hlissner/zsh-autopair
# zinit ice lucid wait; zinit light skywind3000/z.lua
zinit ice lucid wait; zinit light zdharma/fast-syntax-highlighting
zinit ice lucid wait atload='_zsh_autosuggest_start'; zinit light zsh-users/zsh-autosuggestions

zinit ice blockf; zinit light zsh-users/zsh-completions

zinit snippet OMZ::lib/clipboard.zsh
zinit snippet OMZ::lib/git.zsh
zinit snippet OMZ::lib/key-bindings.zsh
zplg snippet OMZ::lib/completion.zsh
zplg snippet OMZ::lib/history.zsh

zinit snippet OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh
zinit snippet OMZ::plugins/archlinux/archlinux.plugin.zsh
zinit snippet OMZ::plugins/dirpersist/dirpersist.plugin.zsh

zinit ice bindkeys'^R'; zinit snippet OMZ::plugins/percol/percol.plugin.zsh

zinit ice lucid wait atload="zpcompinit; zpcdreplay; unalias gp gap"; zinit snippet OMZ::plugins/git/git.plugin.zsh

zinit ice svn; zinit snippet OMZ::plugins/gitfast

zinit ice svn; zinit snippet OMZ::plugins/yarn
