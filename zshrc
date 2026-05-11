# ------------------------------------------------------------------
# OH MY ZSH CONFIGURATION
# This must come BEFORE sourcing Oh My Zsh
# ------------------------------------------------------------------
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="miloshadzic"
ZSH_DISABLE_COMPFIX=true

plugins=(
  git
  zsh-history-substring-search
)

source $ZSH/oh-my-zsh.sh

# ------------------------------------------------------------------
# HISTORY SETTINGS
# ------------------------------------------------------------------
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS

# ------------------------------------------------------------------
# KEY BINDINGS
# Bind keys AFTER plugins are loaded.
# Up/Down: plain history when line empty; prefix search when typed
# ------------------------------------------------------------------
bindkey -M emacs '^[[A' up-line-or-beginning-search
bindkey -M emacs '^[[B' down-line-or-beginning-search
bindkey -M viins '^[[A' up-line-or-beginning-search
bindkey -M viins '^[[B' down-line-or-beginning-search

# ------------------------------------------------------------------
# ALIASES
# ------------------------------------------------------------------
alias myzsh="vi ~/.zshrc"
alias myvim="vi ~/dotfiles/vimrc"
alias alia="vi ~/.bash_aliases"
alias vis="source ~/.vimrc"
alias zshs="source ~/.zshrc"
alias bas="source ~/.bash_aliases"

# ------------------------------------------------------------------
# ENVIRONMENT VARIABLES & PATH
# Cleaner way to manage your PATH by prepending.
# ------------------------------------------------------------------
export EDITOR=nvim

# Homebrew
export PATH="/opt/homebrew/bin:$PATH"

# Java (from Homebrew)
export JAVA_HOME="/opt/homebrew/opt/openjdk@21"
export PATH="$JAVA_HOME/bin:$PATH"

# User binaries
export PATH="$HOME/.local/bin:$PATH"


# fzf: use ripgrep for :Files / Ctrl-P (fast, respects .gitignore, shows untracked)
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_DEFAULT_OPTS=" \
  --color=bg+:#073642,bg:#002b36,spinner:#2aa198 \
  --color=hl:#d33682,fg:#839496,header:#d33682 \
  --color=info:#268bd2,pointer:#2aa198,marker:#859900 \
  --color=fg+:#eee8d5,prompt:#268bd2,hl+:#d33682 \
  --color=border:#073642 \
  --layout=reverse --border=rounded --height=50%"

# fzf shell integration: Ctrl+R = fuzzy history picker, Ctrl+T = fuzzy file, Alt+C = fuzzy cd
source /opt/homebrew/opt/fzf/shell/key-bindings.zsh
source /opt/homebrew/opt/fzf/shell/completion.zsh
export FZF_COMPLETION_TRIGGER='**'

# ------------------------------------------------------------------
# GPG & YUBIKEY SSH SUPPORT
# Use GPG agent for SSH authentication with Yubikey
# ------------------------------------------------------------------
export GPG_TTY=$(tty)
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpg-connect-agent --quiet /bye &>/dev/null || gpgconf --launch gpg-agent

# ------------------------------------------------------------------
# OTHER SOURCES & COMPLETIONS
# ------------------------------------------------------------------
source $HOME/.bash_aliases

export TMPDIR="$HOME/tmp"

[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# ------------------------------------------------------------------
# ZOXIDE — smarter cd. Use `z <partial>` to jump, `zi` for interactive.
# ------------------------------------------------------------------
eval "$(zoxide init zsh)"

# ------------------------------------------------------------------
# EZA — modern ls. Aliases only; leave raw `ls` untouched for scripts.
# ------------------------------------------------------------------
alias ll='eza -l --git --group-directories-first'
alias la='eza -la --git --group-directories-first'
alias lt='eza --tree --level=2 --git-ignore'

# ------------------------------------------------------------------
# BAT — cat with syntax highlighting. Used via `bat`; don't alias cat.
# ------------------------------------------------------------------
export BAT_THEME="TwoDark"

