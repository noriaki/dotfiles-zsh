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
export ANYENV_ROOT="${HOME}/.anyenv"
if [[ -d "${ANYENV_ROOT}" ]]; then
  export PATH="${ANYENV_ROOT}/bin:${PATH}"
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
# Set default editor (choose your preference)
if command -v nvim &> /dev/null; then
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
export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'

# Less pager configuration
export LESS='-R -F -X'
export LESSCHARSET='utf-8'

# Colorized man pages
export MANPAGER="less -R --use-color -Dd+r -Du+b"
export MANROFFOPT="-P -c"

# ----------------------------------------------------------------------------
# Custom PATH Additions
# ----------------------------------------------------------------------------
# Add local bin directories to PATH
export PATH="${HOME}/.local/bin:${PATH}"
export PATH="${HOME}/bin:${PATH}"
