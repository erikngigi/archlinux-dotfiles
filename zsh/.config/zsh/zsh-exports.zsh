#!/usr/bin/env bash

# ------------------------
# History
# ------------------------
HISTSIZE=10000
SAVEHIST=10000

# ------------------------
# PATHs
# ------------------------
# Local bin
export PATH="$HOME/.local/bin:$PATH"
# NodeJS global packages
export PATH="$HOME/.npm-global/bin:$PATH"
# Go
export PATH="/usr/local/go:$PATH"
export PATH="$PATH:$(go env GOBIN):$(go env GOPATH)/bin"
# Rust/Cargo
export PATH="$HOME/.cargo/bin:$PATH"
# Python
export PATH="/usr/bin/python:$PATH"
# PHP
export PATH="$HOME/.php:$PATH"
# Custom scripts
export PATH="$HOME/.scripts:$HOME/.scripts/terraform:$PATH"

# ------------------------
# Pager & Man
# ------------------------
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c"
export MANWIDTH=999

# ------------------------
# FZF & NNN (CLI Tools)
# ------------------------
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export NNN_PLUG='r:renamer'
export NNN_TRASH=1
export NNN_COLORS='#27272727'
export NNN_FCOLORS='c1e2272e006033f7c6d6abc4'
export NNN_BMS="d:/storage/Downloads;e:/storage/Tv-Shows;h:$HOME/;m:/storage/Movies;t:/storage/Torrents;s:/storage/;y:$HOME/Yggdrasil"

# ------------------------
# Editor & Browser
# ------------------------
export EDITOR="/usr/bin/nvim"
export BROWSER="/usr/bin/brave"

# ------------------------
# Terminal
# ------------------------
export TERM="xterm-256color"

# ------------------------
# XDG & System
# ------------------------
export XDG_DATA_DIRS="/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share:/usr/local/share:/usr/share"
export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"
export _JAVA_AWT_WM_NONREPARENTING=1

# ------------------------
# Password manager
# ------------------------
export PASSWORD_STORE_CLIP_TIME="120"

# ------------------------
# AWS
# ------------------------
export AWS_PROFILE=ericngigi

# ------------------------
# Infracost
# ------------------------
export INFRACOST_CURRENCY="USD"
export INFRACOST_CURRENCY_FORMAT="USD: $ 1,234.56"
export INFRACOST_LOG_LEVEL="info"

# ------------------------
# Terraform
# ------------------------
# export TF_CLI_CONFIG_FILE="$HOME/.terraformrc"
export TF_PLUGIN_CACHE_DIR="$HOME/.terraform.d/plugin-cache"
