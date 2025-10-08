# ============================================================================
# aliases/general.zsh - General System Aliases
# ============================================================================
# Common shortcuts for everyday command-line tasks
# ============================================================================

# ----------------------------------------------------------------------------
# Directory Listing
# ----------------------------------------------------------------------------

# ls with colors and formatting
alias ls='ls -G'                    # Colorized output (macOS)
alias ll='ls -lh'                   # Long format, human-readable sizes
alias la='ls -lAh'                  # All files except . and ..
alias laa='ls -lah'                 # All files
alias l='ls -CF'                    # Compact format with indicators
alias lh='ls -lh'                   # Long format, human-readable sizes
alias lt='ls -lht'                  # Long format, sorted by time
alias ltr='ls -lhtr'                # Long format, reverse time order (oldest first)
alias lsize='ls -lhS'               # Long format, sorted by size
alias ldot='ls -ld .*'              # List hidden files only

# Tree view (if tree is installed)
alias tree='tree -C'                # Colorized tree
alias tree1='tree -L 1'             # 1 level deep
alias tree2='tree -L 2'             # 2 levels deep
alias tree3='tree -L 3'             # 3 levels deep

# ----------------------------------------------------------------------------
# Directory Navigation
# ----------------------------------------------------------------------------

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# Quick navigation
alias ~='cd ~'
alias -- -='cd -'                   # Go to previous directory

# Create parent directories as needed
alias mkdir='mkdir -p'

# ----------------------------------------------------------------------------
# File Operations
# ----------------------------------------------------------------------------

# Safe file operations (prompt before overwrite/delete)
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# Verbose file operations
alias cpv='cp -v'
alias mvv='mv -v'
alias rmv='rm -v'

# Recursive operations
alias rmr='rm -r'
alias rmrf='rm -rf'
alias cpr='cp -r'

# ----------------------------------------------------------------------------
# File Viewing and Editing
# ----------------------------------------------------------------------------

# Cat alternatives with syntax highlighting
alias cat='cat'
alias ccat='cat'

# Head and tail
alias h='head'
alias t='tail'
alias tf='tail -f'                  # Follow log files

# Less with colors
alias less='less -R'

# ----------------------------------------------------------------------------
# Search and Find
# ----------------------------------------------------------------------------

# grep with colors
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Case-insensitive grep
alias grepi='grep -i'

# Find files
alias fd='find . -type f -name'
alias fdir='find . -type d -name'

# ----------------------------------------------------------------------------
# Disk Usage
# ----------------------------------------------------------------------------

# Human-readable disk usage
alias df='df -h'
alias du='du -h'

# Disk usage of current directory
alias dud='du -d 1 -h'
alias duf='du -sh *'

# Sort by size
alias dusize='du -sh * | sort -h'

# ----------------------------------------------------------------------------
# Process Management
# ----------------------------------------------------------------------------

# ps aliases
alias psa='ps aux'
alias psgrep='ps aux | grep -v grep | grep -i -e VSZ -e'

# Top alternatives
alias topcpu='top -o cpu'
alias topmem='top -o mem'

# Kill all processes matching a name
alias killall='killall'

# ----------------------------------------------------------------------------
# Network
# ----------------------------------------------------------------------------

# Ping
alias ping='ping -c 5'

# Get external IP
alias myip='curl -s https://api.ipify.org && echo'

# Get local IP
alias localip='ipconfig getifaddr en0 || ipconfig getifaddr en1'

# List open ports
alias ports='lsof -i -P | grep LISTEN'

# ----------------------------------------------------------------------------
# System Information
# ----------------------------------------------------------------------------

# macOS specific
alias showfiles='defaults write com.apple.finder AppleShowAllFiles YES && killall Finder'
alias hidefiles='defaults write com.apple.finder AppleShowAllFiles NO && killall Finder'

# Clear DNS cache (macOS)
alias flushdns='sudo dscacheutil -flushcache && sudo killall -HUP mDNSResponder'

# System update (macOS)
alias update='sudo softwareupdate -i -a'

# ----------------------------------------------------------------------------
# Shortcuts
# ----------------------------------------------------------------------------

# Quick edit
alias zshrc='${EDITOR:-vim} ${ZDOTDIR}/.zshrc'
alias zshenv='${EDITOR:-vim} ${ZDOTDIR}/.zshenv'
alias reload='source ${ZDOTDIR}/.zshrc'

# Clear screen
alias cls='clear'
alias c='clear'

# Exit
alias x='exit'

# ----------------------------------------------------------------------------
# Archives
# ----------------------------------------------------------------------------

# Create tar.gz archive
alias targz='tar -czf'

# Extract tar.gz archive
alias untargz='tar -xzf'

# Create zip archive
alias zip='zip -r'

# ----------------------------------------------------------------------------
# Calendar and Date
# ----------------------------------------------------------------------------

# Show calendar
alias cal='cal'

# Show date in ISO format
alias isodate='date -u +"%Y-%m-%dT%H:%M:%SZ"'

# Show timestamp
alias timestamp='date +%s'

# ----------------------------------------------------------------------------
# Clipboard (macOS)
# ----------------------------------------------------------------------------

# Copy to clipboard
alias copy='pbcopy'

# Paste from clipboard
alias paste='pbpaste'

# Copy current path to clipboard
alias pwdcp='pwd | pbcopy'

# ----------------------------------------------------------------------------
# Homebrew
# ----------------------------------------------------------------------------

alias brewup='brew update && brew upgrade && brew cleanup'
alias brewlist='brew list'
alias brewinfo='brew info'
alias brewsearch='brew search'
alias brewdeps='brew deps --tree'

# ----------------------------------------------------------------------------
# Utilities
# ----------------------------------------------------------------------------

# Watch command (run command repeatedly)
alias watch='watch -n 1'

# Calculator
alias calc='bc -l'

# Weather
alias weather='curl wttr.in'

# Generate random password
alias genpass='openssl rand -base64 20'

# Get file size
alias filesize='du -sh'

# Count files in directory
alias countfiles='find . -type f | wc -l'

# ----------------------------------------------------------------------------
# Safety Nets
# ----------------------------------------------------------------------------

# Prevent accidental overwrites
alias chmod='chmod --preserve-root'
alias chown='chown --preserve-root'

# ----------------------------------------------------------------------------
# Suffix Aliases (open files with default applications)
# ----------------------------------------------------------------------------

# These allow you to run files directly and they'll open in the appropriate app
alias -s txt=vim
alias -s md=vim
alias -s json=vim
alias -s html=open
alias -s pdf=open
