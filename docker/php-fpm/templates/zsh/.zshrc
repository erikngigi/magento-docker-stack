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
plug "$HOME/.config/zsh/zsh-vim.zsh"

# Plugins
plug "zap-zsh/supercharge"
plug "hlissner/zsh-autopair"
plug "zsh-users/zsh-history-substring-search"
plug "zap-zsh/exa"
plug "zap-zsh/fzf"
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"

zstyle ':completion:*' special-dirs false
zstyle ':completion::complete:*' use-cache 1

# Load and initialise completion system
autoload -Uz compinit; compinit
autoload bashcompinit; bashcompinit
