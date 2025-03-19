# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"

fpath+=(~/.config/hcloud/completion/zsh)
# fpath=( /home/eric/.miniconda/lib/python3.12/site-packages/argcomplete/bash_completion.d "${fpath[@]}" )

# Load and initialise completion system
autoload -Uz compinit; compinit
autoload bashcompinit; bashcompinit

# History
export HISTFILESIZE=1000000
export HISTSIZE=10000001
export HISTFILE=~/.zsh_history
setopt HIST_FIND_NO_DUPS
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_SPACE

# Sources
plug "$HOME/.config/zsh/secrets.zsh"
plug "$HOME/.config/zsh/zsh-aliases.zsh"
plug "$HOME/.config/zsh/zsh-prompt.zsh"
plug "$HOME/.config/zsh/zsh-exports.zsh"
plug "$HOME/.config/zsh/zsh-vim.zsh"

# Plugins
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "hlissner/zsh-autopair"
plug "zap-zsh/fzf"
plug "zap-zsh/exa"
plug "zsh-users/zsh-history-substring-search"
plug "zsh-users/zsh-syntax-highlighting"
plug "conda-incubator/conda-zsh-completion"

# If tmux is executable, X is running, and not inside a tmux session, then try to attach. If attachment fails, start a new session
if [ -x "$(command -v tmux)" ] && [ -n "${DISPLAY}" ]; then
	[ -z "${TMUX}" ] && { tmux || tmux; } >/dev/null 2>&1
fi

# Load aws zsh complete
# complete -C "/usr/local/bin/aws_completer" aws

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/home/eric/.miniconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/home/eric/.miniconda/etc/profile.d/conda.sh" ]; then
#         . "/home/eric/.miniconda/etc/profile.d/conda.sh"
#     else
#         export PATH="/home/eric/.miniconda/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# eval "$(/home/eric/.miniconda3/bin/conda shell.zsh hook)"
# <<< conda initialize <<<

zstyle ':completion:*' special-dirs false
zstyle ':completion::complete:*' use-cache 1
zstyle ":conda_zsh_completion:*" use-groups true
zstyle ":conda_zsh_completion:*" show-unnamed true
zstyle ":conda_zsh_completion:*" sort-envs-by-time true
zstyle ":conda_zsh_completion:*" show-global-envs-first true

# Better SSH/Rsync/SCP Autocomplete
zstyle ':completion:*:(scp|rsync):*' tag-order ' hosts:-ipaddr:ip\ address hosts:-host:host files'
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-host' ignored-patterns '*(.|:)*' loopback ip6-loopback localhost ip6-localhost broadcasthost
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-ipaddr' ignored-patterns '^(<->.<->.<->.<->|(|::)([[:xdigit:].]##:(#c,2))##(|%*))' '127.0.0.<->' '255.255.255.255' '::1' 'fe80::*'

# Digital ocean completion
source <(doctl completion zsh)

# Add zoxide
eval "$(zoxide init --cmd cd zsh)"
