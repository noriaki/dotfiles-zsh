# ============================================================================
# env.zsh - Environment Variables and PATH Configuration
# ============================================================================
# Additional environment variables and PATH modifications
# ============================================================================

# ----------------------------------------------------------------------------
# Homebrew Configuration (Apple Silicon & Intel Mac)
# ----------------------------------------------------------------------------
# Apple Silicon (M1/M2/M3) - /opt/homebrew
if [[ -d "/opt/homebrew" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
# Intel Mac - /usr/local
elif [[ -d "/usr/local/Homebrew" ]]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

# ----------------------------------------------------------------------------
# anyenv - Unified Version Manager
# ----------------------------------------------------------------------------
# Manages nodenv, pyenv, rbenv, and other *env tools
if command -v anyenv &> /dev/null; then
  eval "$(anyenv init -)"
fi

# ----------------------------------------------------------------------------
# Language-Specific Environment Variables
# ----------------------------------------------------------------------------

# Node.js / pnpm
export PNPM_HOME="${HOME}/.local/share/pnpm"
export PATH="${PNPM_HOME}:${PATH}"

# Python
# Prevent Python from creating __pycache__ directories
export PYTHONDONTWRITEBYTECODE=1
# Use UTF-8 encoding for Python
export PYTHONIOENCODING='UTF-8'

# Ruby
# Disable Ruby documentation installation (faster gem installs)
export BUNDLE_SILENCE_ROOT_WARNING=1

# ----------------------------------------------------------------------------
# Editor Configuration
# ----------------------------------------------------------------------------
# Set default editor with fallback chain: code > nvim > vim > vi
if command -v code &> /dev/null; then
  export EDITOR='code --wait'
  export VISUAL='code --wait'
elif command -v nvim &> /dev/null; then
  export EDITOR='nvim'
  export VISUAL='nvim'
elif command -v vim &> /dev/null; then
  export EDITOR='vim'
  export VISUAL='vim'
else
  export EDITOR='vi'
  export VISUAL='vi'
fi

# ----------------------------------------------------------------------------
# General Environment Variables
# ----------------------------------------------------------------------------

# Language
export LANG='ja_JP.UTF-8'
export LC_ALL='ja_JP.UTF-8'

# Less pager configuration
export LESS='-R -F -X'
export LESSCHARSET='utf-8'

# Colorized man pages
export MANPAGER="less -R --use-color -Dd+r -Du+b"
export MANROFFOPT="-P -c"

# ----------------------------------------------------------------------------
# ls Color Configuration
# ----------------------------------------------------------------------------
# Optimized for dark backgrounds / iTerm2
# LSCOLORS format (BSD ls): directory, symlink, socket, pipe, executable,
#                          block special, char special, setuid, setgid,
#                          sticky dir, non-sticky writable dir
# Ex=Directory (bright blue), Gx=Symlink (bright cyan), Cx=Socket (green),
# Dx=Pipe (yellow), Bx=Executable (bright green)
export LSCOLORS="ExGxCxDxBxegedabagacad"
export CLICOLOR=1

# LS_COLORS for completions and GNU tools (if present)
# di=directory, ln=symlink, so=socket, pi=pipe, ex=executable
export LS_COLORS="di=1;34:ln=1;36:so=32:pi=33:ex=1;32:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"

# ----------------------------------------------------------------------------
# Custom PATH Additions
# ----------------------------------------------------------------------------
# Add local bin directories to PATH
export PATH="${HOME}/.local/bin:${PATH}"
export PATH="${HOME}/bin:${PATH}"
