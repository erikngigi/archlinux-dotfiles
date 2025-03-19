#!/usr/bin/env bash

HISTSIZE=10000
SAVEHIST=10000

export PATH="$HOME/.local/bin":$PATH
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c"
export MANWIDTH=999
export PATH=~/.npm-global/bin:$PATH
export PATH=/usr/bin/go:$PATH
export PATH="$PATH:$(go env GOBIN):$(go env GOPATH)/bin"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH=/usr/bin/python:$PATH
export PATH=$HOME/.php:$PATH
export PATH=$HOME/.scripts:$PATH
export PATH=$HOME/.scripts/terraform:$PATH
export PATH=$HOME/.miniconda/bin:$PATH
export PATH=$HOME/.npm-global/bin:$PATH
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export NNN_PLUG='r:renamer'
export NNN_TRASH=1
export NNN_COLORS='#27272727'
export NNN_FCOLORS='c1e2272e006033f7c6d6abc4'
export NNN_BMS="d:/storage/Downloads;e:$HOME/Yggdrasil;t:/storage/Torrents;s:/storage/"
export EDITOR="/home/eric/.local/bin/lvim"
export BROWSER="/usr/bin/brave"
export TERM="xterm-256color"
export XDG_DATA_DIRS="/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share:/usr/share"
export PASSWORD_STORE_CLIP_TIME="120"

# infracost environmental variables
export INFRACOST_CURRENCY="USD"
export INFRACOST_LOG_LEVEL="info"
