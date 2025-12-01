# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"

# History
export HISTFILESIZE=1000000
export HISTSIZE=10000001
export HISTFILE=~/.zsh_history
setopt HIST_FIND_NO_DUPS
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_SPACE
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE="20"
export ZSH_AUTOSUGGEST_USE_ASYNC=1

# Sources
plug "$HOME/.config/zsh/zsh-exports.zsh"
plug "$HOME/.config/zsh/zsh-prompt.zsh"
plug "$HOME/.config/zsh/zsh-aliases.zsh"
plug "$HOME/.config/zsh/zsh-vim.zsh"
plug "$HOME/.config/zsh/secrets.zsh"

# Plugins
plug "zap-zsh/supercharge"
plug "hlissner/zsh-autopair"
plug "zsh-users/zsh-history-substring-search"
plug "zap-zsh/exa"
plug "zap-zsh/fzf"
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"

# If tmux is executable, X is running, and not inside a tmux session, then try to attach. If attachment fails, start a new session
if [ -x "$(command -v tmux)" ] && [ -n "${DISPLAY}" ]; then
	[ -z "${TMUX}" ] && { tmux || tmux; } >/dev/null 2>&1
fi

zstyle ':completion:*' special-dirs false
zstyle ':completion::complete:*' use-cache 1

# Better SSH/Rsync/SCP Autocomplete
zstyle ':completion:*:(scp|rsync):*' tag-order ' hosts:-ipaddr:ip\ address hosts:-host:host files'
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-host' ignored-patterns '*(.|:)*' loopback ip6-loopback localhost ip6-localhost broadcasthost
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-ipaddr' ignored-patterns '^(<->.<->.<->.<->|(|::)([[:xdigit:].]##:(#c,2))##(|%*))' '127.0.0.<->' '255.255.255.255' '::1' 'fe80::*'

# Digital ocean completion
source <(doctl completion zsh)

# Add zoxide
eval "$(zoxide init --cmd cd zsh)"

# Confirm ssh-agent is running
if [ -z "$SSH_AUTH_SOCK" ]; then
    eval "$(ssh-agent -s)"
fi

# Load and initialise completion system
autoload -Uz compinit; compinit
autoload bashcompinit; bashcompinit

# AWS CLI completion in zsh
complete -C "/usr/local/bin/aws_completer" aws

# Terraform CLI completion in zsh
complete -o nospace -C "/usr/bin/terraform terraform"
