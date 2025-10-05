# ============================================================================
# functions.zsh - Custom Shell Functions
# ============================================================================
# Utility functions for enhanced shell productivity
# ============================================================================

# ----------------------------------------------------------------------------
# Directory Navigation
# ----------------------------------------------------------------------------

# mkcd - Create directory and cd into it
# Usage: mkcd new-directory
mkcd() {
  if [[ -z "$1" ]]; then
    echo "Usage: mkcd <directory>"
    return 1
  fi
  mkdir -p "$1" && cd "$1"
}

# up - Go up N directories
# Usage: up 3 (goes up 3 directories)
up() {
  local levels=${1:-1}
  local path=""
  for ((i=0; i<levels; i++)); do
    path="../$path"
  done
  cd "$path" || return 1
}

# ----------------------------------------------------------------------------
# File Operations
# ----------------------------------------------------------------------------

# extract - Extract various archive formats
# Usage: extract archive.tar.gz
extract() {
  if [[ -z "$1" ]]; then
    echo "Usage: extract <archive-file>"
    return 1
  fi

  if [[ ! -f "$1" ]]; then
    echo "Error: File '$1' not found"
    return 1
  fi

  case "$1" in
    *.tar.bz2)   tar xjf "$1"     ;;
    *.tar.gz)    tar xzf "$1"     ;;
    *.tar.xz)    tar xJf "$1"     ;;
    *.bz2)       bunzip2 "$1"     ;;
    *.rar)       unrar x "$1"     ;;
    *.gz)        gunzip "$1"      ;;
    *.tar)       tar xf "$1"      ;;
    *.tbz2)      tar xjf "$1"     ;;
    *.tgz)       tar xzf "$1"     ;;
    *.zip)       unzip "$1"       ;;
    *.Z)         uncompress "$1"  ;;
    *.7z)        7z x "$1"        ;;
    *)           echo "Error: Unknown archive format '$1'" ;;
  esac
}

# ----------------------------------------------------------------------------
# Development Utilities
# ----------------------------------------------------------------------------

# gignore - Generate .gitignore from gitignore.io
# Usage: gignore node macos > .gitignore
gignore() {
  if [[ -z "$1" ]]; then
    echo "Usage: gignore <language1> [language2] ..."
    echo "Example: gignore node macos > .gitignore"
    return 1
  fi

  local IFS=","
  curl -sL "https://www.toptal.com/developers/gitignore/api/$*"
}

# port-kill - Kill process running on specified port
# Usage: port-kill 3000
port-kill() {
  if [[ -z "$1" ]]; then
    echo "Usage: port-kill <port-number>"
    return 1
  fi

  local pid=$(lsof -ti:"$1")
  if [[ -n "$pid" ]]; then
    echo "Killing process $pid on port $1"
    kill -9 "$pid"
  else
    echo "No process found on port $1"
  fi
}

# find-in-files - Search for text in files
# Usage: find-in-files "search text" "*.js"
find-in-files() {
  if [[ -z "$1" ]]; then
    echo "Usage: find-in-files <search-text> [file-pattern]"
    return 1
  fi

  local pattern="${2:-*}"
  grep -rn "$1" --include="$pattern" .
}

# ----------------------------------------------------------------------------
# Git Utilities
# ----------------------------------------------------------------------------

# git-cleanup - Remove merged local branches
# Usage: git-cleanup
git-cleanup() {
  echo "Removing merged local branches..."
  git branch --merged | grep -v "\*" | grep -v "main\|master\|develop" | xargs -n 1 git branch -d
}

# git-main - Checkout and update main/master branch
# Usage: git-main
git-main() {
  if git show-ref --verify --quiet refs/heads/main; then
    git checkout main && git pull
  elif git show-ref --verify --quiet refs/heads/master; then
    git checkout master && git pull
  else
    echo "Error: Neither 'main' nor 'master' branch found"
    return 1
  fi
}

# ----------------------------------------------------------------------------
# Network Utilities
# ----------------------------------------------------------------------------

# myip - Show external IP address
# Usage: myip
myip() {
  curl -s https://api.ipify.org
  echo ""
}

# localip - Show local IP address
# Usage: localip
localip() {
  ipconfig getifaddr en0 || ipconfig getifaddr en1
}

# ----------------------------------------------------------------------------
# System Information
# ----------------------------------------------------------------------------

# sysinfo - Display system information
# Usage: sysinfo
sysinfo() {
  echo "System Information:"
  echo "===================="
  echo "OS: $(uname -s)"
  echo "Hostname: $(hostname)"
  echo "Kernel: $(uname -r)"
  echo "Architecture: $(uname -m)"
  if command -v sw_vers &> /dev/null; then
    echo "macOS Version: $(sw_vers -productVersion)"
  fi
}
