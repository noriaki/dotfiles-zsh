# ============================================================================
# completion.zsh - Zsh Completion Configuration
# ============================================================================
# Advanced completion settings for enhanced command-line productivity
# ============================================================================

# ----------------------------------------------------------------------------
# Completion System Initialization
# ----------------------------------------------------------------------------
# Load and initialize the completion system
autoload -Uz compinit

# Initialize completion system
# Check cache once a day for performance
if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
  compinit -d "${ZDOTDIR}/.zcompdump"
else
  compinit -C -d "${ZDOTDIR}/.zcompdump"
fi

# ----------------------------------------------------------------------------
# Completion Options
# ----------------------------------------------------------------------------

# Enable completion menu
setopt AUTO_MENU           # Show completion menu on successive tab press
setopt COMPLETE_IN_WORD    # Complete from both ends of a word
setopt ALWAYS_TO_END       # Move cursor to end of word after completion

# Case insensitive completion
setopt NO_CASE_GLOB        # Case insensitive globbing
setopt CASE_GLOB           # But respect case when pattern has uppercase

# Completion behavior
setopt LIST_PACKED         # Compact completion lists
setopt AUTO_LIST           # Automatically list choices on ambiguous completion
setopt AUTO_PARAM_SLASH    # Add trailing slash to directory completions
setopt AUTO_PARAM_KEYS     # Intelligent parameter completion

# ----------------------------------------------------------------------------
# Completion Styles
# ----------------------------------------------------------------------------

# Use cache for faster completions
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompcache"

# Case-insensitive (all), partial-word, and substring completion
zstyle ':completion:*' matcher-list \
  'm:{a-zA-Z}={A-Za-z}' \
  'r:|[._-]=* r:|=*' \
  'l:|=* r:|=*'

# Menu selection style
zstyle ':completion:*' menu select
zstyle ':completion:*:*:*:*:*' menu select

# Colorful completion listings
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Group matches and describe groups
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f'
zstyle ':completion:*:warnings' format '%F{red}-- 一致する項目が見つかりません --%f'
zstyle ':completion:*:messages' format '%F{purple}-- %d --%f'
zstyle ':completion:*:corrections' format '%F{yellow}-- %d (エラー数: %e) --%f'

# Completion sorting and matching
zstyle ':completion:*' sort true
zstyle ':completion:*' squeeze-slashes true

# Process completion
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:*:kill:*' force-list always

# Man pages completion
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.*' insert-sections true

# SSH/SCP/RSYNC hostname completion
zstyle ':completion:*:(ssh|scp|rsync):*' tag-order 'hosts:-host:host hosts:-domain:domain hosts:-ipaddr:ip\ address *'
zstyle ':completion:*:(scp|rsync):*' group-order users files all-files hosts-domain hosts-host hosts-ipaddr
zstyle ':completion:*:ssh:*' group-order users hosts-domain hosts-host users hosts-ipaddr

# Directory completion
zstyle ':completion:*' special-dirs true
zstyle ':completion:*:cd:*' ignore-parents parent pwd

# ----------------------------------------------------------------------------
# Custom Completions
# ----------------------------------------------------------------------------

# Enable completion for aliases
setopt COMPLETE_ALIASES

# Don't complete unavailable commands
zstyle ':completion:*:functions' ignored-patterns '_*'

# Array completion element sorting
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# Expand partial paths
# Example: /u/s/l -> /usr/share/local
zstyle ':completion:*' expand 'yes'
zstyle ':completion:*' path-completion 'yes'

# Ignore completion functions for commands you don't have
zstyle ':completion:*:commands' rehash 1

# ----------------------------------------------------------------------------
# Performance Optimization
# ----------------------------------------------------------------------------

# Limit the number of matches shown
zstyle ':completion:*' max-errors 2

# Speed up completion by avoiding stat calls when possible
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' accept-exact-dirs true

# Use approximate matching for corrections
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3))numeric)'
