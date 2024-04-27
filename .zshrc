export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(
    git
    docker
    zsh-autosuggestions
    autojump
    zsh-syntax-highlighting
    golang
    rust
)

source $ZSH/oh-my-zsh.sh

export LD_LIBRARY_PATH=/usr/local/lib:/usr/lib:/usr/local/lib64:/usr/lib64
export PATH=$HOME/.local/python/bin:$HOME/.local/bin:$HOME/.go/bin:/usr/local/go/bin/:$HOME/.cargo/bin:$HOME/.local/tools_bin/patchbuild:$HOME/.local/node/bin:$PATH:$HOME/.ft
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export RUNEWIDTH_EASTASIAN=0

fmt_date() { date '+%Y-%m-%d %H:%M:%S' -d @"$@" }
fmt_stamp() { date  +%s --utc -d "$*" }

vim(){ if command -v floaterm &> /dev/null;then floaterm $@;else nvim $@; fi }

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[ -z "$TMUX"  ] && [ -z "$DISTROBOX_ENTER_PATH" ] && ! [ -z "$SSH_TTY" ] && { tmux attach || exec tmux new-session && exit; }

PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'

alias v='nvim'
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
