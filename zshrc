# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

# Load powerlevel10k theme
zinit ice depth"1" # git clone depth
zinit light romkatv/powerlevel10k

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export VISUAL="vim"
export EDITOR="vim"

alias ls=exa
alias l="ls -lgh"
alias l.="ls -d .*"
alias ll="ls -lgah"
alias dfh="df -Th"
alias gps="git push"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias -g G="| grep -i"
alias -g L="| less"

alias sc=systemctl

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

s () {
  rg --files -g "*$1*"
}

# Plugin history-search-multi-word loaded with investigating.
zinit load zdharma-continuum/history-search-multi-word

# Two regular plugins loaded without investigating.
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma-continuum/fast-syntax-highlighting

zinit ice lucid wait atload='_zsh_autosuggest_start'; zinit light zsh-users/zsh-autosuggestions

zinit ice blockf; zinit light zsh-users/zsh-completions

zinit snippet OMZ::lib/clipboard.zsh
zinit snippet OMZ::lib/git.zsh
zinit snippet OMZ::lib/key-bindings.zsh
zinit snippet OMZ::lib/completion.zsh
zinit snippet OMZ::lib/history.zsh

zinit snippet OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh
zinit snippet OMZ::plugins/archlinux/archlinux.plugin.zsh
zinit snippet OMZ::plugins/dirpersist/dirpersist.plugin.zsh

zinit ice bindkeys'^R'; zinit snippet OMZ::plugins/percol/percol.plugin.zsh
zinit ice svn; zinit snippet OMZ::plugins/gitfast
zinit ice svn; zinit snippet OMZ::plugins/yarn

# Yaourt
if (( $+commands[yaourt] )); then
  alias yaconf='yaourt -C'
  alias yaupg='yaourt -Syua'
  alias yasu='yaourt -Syua --noconfirm'
  alias yain='yaourt -S'
  alias yains='yaourt -U'
  alias yare='yaourt -R'
  alias yarem='yaourt -Rns'
  alias yarep='yaourt -Si'
  alias yareps='yaourt -Ss'
  alias yaloc='yaourt -Qi'
  alias yalocs='yaourt -Qs'
  alias yalst='yaourt -Qe'
  alias yaorph='yaourt -Qtd'
  alias yainsd='yaourt -S --asdeps'
  alias yamir='yaourt -Syy'

  if (( $+commands[abs] && $+commands[aur] )); then
    alias yaupd='yaourt -Sy && sudo abs && sudo aur'
  elif (( $+commands[abs] )); then
    alias yaupd='yaourt -Sy && sudo abs'
  elif (( $+commands[aur] )); then
    alias yaupd='yaourt -Sy && sudo aur'
  else
    alias yaupd='yaourt -Sy'
  fi
fi
