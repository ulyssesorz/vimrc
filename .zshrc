export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="zhihaopan"

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

source ~/.profile_comm
alias ls=exa
export LD_LIBRARY_PATH=/usr/local/lib:/usr/lib:/usr/local/lib64:/usr/lib64
export PATH=$HOME/.local/python/bin:$HOME/.local/bin:$HOME/.go/bin:$PATH:/usr/local/go/bin/:$HOME/.cargo/bin:$HOME/.local/tools_bin/tools/patchbuild
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export RUNEWIDTH_EASTASIAN=0

alias f='files_list=$(fzf -m --layout reverse --height=80%  --border=bold --preview "bat --style=numbers --color=always --line-range :500 {}") && if command -v floaterm &> /dev/null;then floaterm $files_list;else nvim -p $files_list;fi'

alias tcc="patchbuild build -m64 -e --include-commit  --profile=debug --gcc-version=gcc7"
alias tmake="patchbuild build -m64 -e --download-genfiles --compile-command-query='--merge' --include-commit  --gcc-version=gcc7"
alias dcc="patchbuild docker -m64 -e --gcc-version=gcc7"
alias s='cat ~/.notes.txt | grep -i'
alias a='vim ~/.notes.txt +9999'

fmt_date() { date '+%Y-%m-%d %H:%M:%S' -d @"$@" }
fmt_stamp() { date  +%s --utc -d "$*" }

vim(){ if command -v floaterm &> /dev/null;then floaterm $@;else nvim -p $@; fi }

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -z "$TMUX"  ] && ! [ -z "$SSH_TTY" ] && { tmux attach || exec tmux new-session && exit;}

PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'

[[ -s "$HOME/.xmake/profile" ]] && source "$HOME/.xmake/profile" # load xmake profile
alias dev="docker exec -it dev su - zhihaopan"
export PATH="$PATH:$HOME/.ft"
alias cat='bat -pp'
