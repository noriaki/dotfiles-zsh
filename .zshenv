# ============================================================================
# .zshenv - Zsh Environment Variables (Base Configuration)
# ============================================================================
# This file is sourced on all invocations of the shell.
# XDG Base Directory Specification compliant.
# ============================================================================

# XDG Base Directory Specification
# Reference: https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_STATE_HOME="${HOME}/.local/state"

# Zsh configuration directory
export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"

# History file location (XDG compliant)
export HISTFILE="${ZDOTDIR}/.zsh_history"
. "$HOME/.cargo/env"
