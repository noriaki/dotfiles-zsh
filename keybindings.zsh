# ============================================================================
# keybindings.zsh - Custom Keybindings Configuration
# ============================================================================
# This file configures keybindings for zsh plugins and built-in features.
# It must be sourced BEFORE plugins are loaded to override default settings.
# ============================================================================

# ----------------------------------------------------------------------------
# zsh-autosuggestions Keybindings
# ----------------------------------------------------------------------------
# Customize behavior of autosuggestions from command history
#
# Desired behavior:
#   When suggestion exists:
#     - Right arrow (→):  Accept suggestion character by character
#     - Ctrl+F:           Accept suggestion word by word
#     - End key / Ctrl+E: Accept entire suggestion
#   When no suggestion:
#     - Right arrow (→):  Move forward one character
#     - Ctrl+F:           Move forward one character
#     - End key / Ctrl+E: Move to end of line
#
# Implementation:
#   - Keep forward-char in PARTIAL_ACCEPT_WIDGETS (right arrow: char-by-char)
#   - Add forward-word to PARTIAL_ACCEPT_WIDGETS (for word acceptance)
#   - Create custom widget for Ctrl+F with conditional behavior

# Widgets that accept the entire suggestion
ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=(
  end-of-line
  vi-end-of-line
  vi-add-eol
)

# Widgets that accept suggestion word by word
ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS=(
  forward-char
  vi-forward-char
  forward-word
  emacs-forward-word
  vi-forward-word
  vi-forward-word-end
  vi-forward-blank-word
  vi-forward-blank-word-end
  vi-find-next-char
  vi-find-next-char-skip
)

# ----------------------------------------------------------------------------
# Custom Key Bindings
# ----------------------------------------------------------------------------
# Custom widget for Ctrl+F: word-by-word acceptance when suggestion exists
# AND cursor is at end of buffer, character movement otherwise
_autosuggest_forward_word_or_char() {
  if [[ -n $POSTDISPLAY && -z $RBUFFER ]]; then
    # Suggestion exists AND cursor is at end - accept word by word
    zle forward-word
  else
    # Cursor is within buffer OR no suggestion - move forward one character
    zle forward-char
  fi
}

# Register the custom widget
zle -N _autosuggest_forward_word_or_char

# Bind Ctrl+F to the custom widget
bindkey '^F' _autosuggest_forward_word_or_char
