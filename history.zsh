# ============================================================================
# history.zsh - Zsh History Configuration
# ============================================================================
# Advanced history settings for command tracking and retrieval
# ============================================================================

# ----------------------------------------------------------------------------
# History File Configuration
# ----------------------------------------------------------------------------
# History file location is set in .zshenv as HISTFILE
# Default: ${ZDOTDIR}/.zsh_history

# History size settings
HISTSIZE=10000              # Number of commands loaded into memory
SAVEHIST=10000              # Number of commands saved to history file

# ----------------------------------------------------------------------------
# History Options
# ----------------------------------------------------------------------------

# Basic history behavior
setopt APPEND_HISTORY          # Append to history file, don't overwrite
setopt EXTENDED_HISTORY        # Save timestamp and duration with each command
setopt HIST_VERIFY             # Show command with history expansion before running
setopt SHARE_HISTORY           # Share history between all sessions

# History writing behavior
setopt INC_APPEND_HISTORY      # Write to history file immediately, not on exit
setopt HIST_SAVE_NO_DUPS       # Don't write duplicate entries to history file
setopt HIST_REDUCE_BLANKS      # Remove extra blanks from commands before adding to history

# History retrieval behavior
setopt HIST_FIND_NO_DUPS       # Don't display duplicates when searching history
setopt HIST_IGNORE_ALL_DUPS    # Delete old recorded entry if new entry is a duplicate

# Command filtering
setopt HIST_IGNORE_SPACE       # Don't record commands starting with a space
setopt HIST_NO_STORE           # Don't store history or fc commands

# Expansion behavior
setopt HIST_EXPAND             # Perform history expansion on completion
setopt BANG_HIST               # Enable ! history expansion

# ----------------------------------------------------------------------------
# History Search Key Bindings
# ----------------------------------------------------------------------------

# Bind Up and Down arrow keys to history search
# Type a partial command and press Up/Down to search history
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Bind keys for vi and emacs modes
bindkey "^[[A" up-line-or-beginning-search      # Up arrow
bindkey "^[[B" down-line-or-beginning-search    # Down arrow
bindkey -M vicmd "k" up-line-or-beginning-search
bindkey -M vicmd "j" down-line-or-beginning-search

# Ctrl+R for incremental history search (reverse)
bindkey "^R" history-incremental-search-backward

# Ctrl+S for forward incremental history search
bindkey "^S" history-incremental-search-forward

# ----------------------------------------------------------------------------
# History Aliases
# ----------------------------------------------------------------------------

# Show history with timestamps
alias history='fc -li 1'

# Show top 20 most used commands
alias histop='history 0 | awk "{print \$4}" | sort | uniq -c | sort -nr | head -20'

# ----------------------------------------------------------------------------
# History Performance
# ----------------------------------------------------------------------------

# Lock file for history to prevent corruption
setopt HIST_FCNTL_LOCK

# Immediately append to history file
setopt INC_APPEND_HISTORY_TIME
