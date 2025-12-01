# ============================================================================
# .zshrc - Zsh Main Configuration
# ============================================================================
# This file is sourced in interactive shells.
# ============================================================================

# ----------------------------------------------------------------------------
# Zinit Plugin Manager
# ----------------------------------------------------------------------------
# Zinit initialization - High-performance plugin manager
# Installation: The setup script will install Zinit automatically
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit if not present
if [[ ! -f ${ZINIT_HOME}/zinit.zsh ]]; then
  print -P "%F{33}▓▒░ Installing Zinit (zdharma-continuum/zinit)…%f"
  command mkdir -p "$(dirname $ZINIT_HOME)"
  command git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME" && \
    print -P "%F{34}▓▒░ Installation successful.%f" || \
    print -P "%F{160}▓▒░ Installation failed.%f"
fi

# Load Zinit
source "${ZINIT_HOME}/zinit.zsh"

# ----------------------------------------------------------------------------
# Zinit Plugins
# ----------------------------------------------------------------------------
# Turbo mode (wait) - Delays loading for faster startup
# lucid - Suppresses under-prompt messages

# Syntax highlighting - Colors commands as you type
zinit ice wait lucid
zinit light zsh-users/zsh-syntax-highlighting

# Keybindings - Must be loaded before plugins to override defaults
[[ -f "${ZDOTDIR}/keybindings.zsh" ]] && source "${ZDOTDIR}/keybindings.zsh"

# Auto-suggestions - Fish-like autosuggestions from history
zinit ice wait lucid atload"_zsh_autosuggest_start"
zinit light zsh-users/zsh-autosuggestions

# Additional completions
zinit ice wait lucid blockf atpull'zinit creinstall -q .'
zinit light zsh-users/zsh-completions

# ni.zsh - Unified package manager wrapper (npm/yarn/pnpm/bun/deno)
zinit ice wait lucid
zinit light azu/ni.zsh

# ----------------------------------------------------------------------------
# Load Configuration Files
# ----------------------------------------------------------------------------
# Source additional configuration files in logical order

# Environment variables and PATH
[[ -f "${ZDOTDIR}/env.zsh" ]] && source "${ZDOTDIR}/env.zsh"

# Custom functions
[[ -f "${ZDOTDIR}/functions.zsh" ]] && source "${ZDOTDIR}/functions.zsh"

# Completion settings
[[ -f "${ZDOTDIR}/completion.zsh" ]] && source "${ZDOTDIR}/completion.zsh"

# History settings
[[ -f "${ZDOTDIR}/history.zsh" ]] && source "${ZDOTDIR}/history.zsh"

# Aliases
[[ -f "${ZDOTDIR}/aliases/general.zsh" ]] && source "${ZDOTDIR}/aliases/general.zsh"
[[ -f "${ZDOTDIR}/aliases/git.zsh" ]] && source "${ZDOTDIR}/aliases/git.zsh"
[[ -f "${ZDOTDIR}/aliases/node.zsh" ]] && source "${ZDOTDIR}/aliases/node.zsh"
[[ -f "${ZDOTDIR}/aliases/python.zsh" ]] && source "${ZDOTDIR}/aliases/python.zsh"
[[ -f "${ZDOTDIR}/aliases/ruby.zsh" ]] && source "${ZDOTDIR}/aliases/ruby.zsh"

# ----------------------------------------------------------------------------
# Starship Prompt
# ----------------------------------------------------------------------------
# Initialize Starship prompt (must be at the end)
if command -v starship &> /dev/null; then
  eval "$(starship init zsh)"
fi

# ----------------------------------------------------------------------------
# Additional Tool Integrations
# ----------------------------------------------------------------------------

# GitHub CLI completion
if command -v gh &> /dev/null; then
  eval "$(gh completion -s zsh)"
fi

# pnpm completion
if command -v pnpm &> /dev/null; then
  [[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && source ~/.config/tabtab/zsh/__tabtab.zsh || true
fi
