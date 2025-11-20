#!/usr/bin/env bash

HISTSIZE=10000
SAVEHIST=10000

export PATH="$HOME/.local/bin":$PATH
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c"
export MANWIDTH=999
export PATH=~/.npm-global/bin:$PATH
export PATH=/usr/local/go:$PATH
export PATH="$PATH:$(go env GOBIN):$(go env GOPATH)/bin"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH=/usr/bin/python:$PATH
export PATH=$HOME/.php:$PATH
export PATH=$HOME/.scripts:$PATH
export PATH=$HOME/.scripts/terraform:$PATH
export PATH=$HOME/.npm-global/bin:$PATH
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export NNN_PLUG='r:renamer'
export NNN_TRASH=1
export NNN_COLORS='#27272727'
export NNN_FCOLORS='c1e2272e006033f7c6d6abc4'
export NNN_BMS="d:/storage/Downloads;e:/storage/Tv-Shows;h:$HOME/;m:/storage/Movies;t:/storage/Torrents;s:/storage/;y:$HOME/Yggdrasil"
export EDITOR="/home/eric/.local/bin/lvim"
export BROWSER="/usr/bin/brave"
export TERM="xterm-256color"
export XDG_DATA_DIRS="/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share:/usr/local/share:/usr/share"
export PASSWORD_STORE_CLIP_TIME="120"
export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"
export _JAVA_AWT_WM_NONREPARENTING=1

# Set Environmental Variable for AWS
export AWS_PROFILE=ericngigi

# infracost environmental variables
export INFRACOST_CURRENCY="USD"
export INFRACOST_CURRENCY_FORMAT="USD: $ 1,234.56"
export INFRACOST_LOG_LEVEL="info"

# Terraform environmental variables
# export TF_CLI_CONFIG_FILE="$HOME/.terraformrc"
export TF_PLUGIN_CACHE_DIR="$HOME/.terraform.d/plugin-cache"
# export TF_LOG=trace
# export TF_LOG_PATH="$PWD/.terraform.log"
