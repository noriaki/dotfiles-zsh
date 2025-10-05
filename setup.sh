#!/usr/bin/env bash

# ============================================================================
# setup.sh - Zsh Environment Setup Script
# ============================================================================
# Automated installation script for Zsh configuration
# Supports macOS with Homebrew
# ============================================================================

set -e  # Exit on error
set -u  # Exit on undefined variable

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# ----------------------------------------------------------------------------
# Helper Functions
# ----------------------------------------------------------------------------

print_step() {
    echo -e "${BLUE}==>${NC} ${1}"
}

print_success() {
    echo -e "${GREEN}✓${NC} ${1}"
}

print_warning() {
    echo -e "${YELLOW}⚠${NC} ${1}"
}

print_error() {
    echo -e "${RED}✗${NC} ${1}"
}

command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# ----------------------------------------------------------------------------
# Pre-flight Checks
# ----------------------------------------------------------------------------

print_step "Running pre-flight checks..."

# Check if running on macOS
if [[ "$(uname)" != "Darwin" ]]; then
    print_error "This script is designed for macOS only."
    exit 1
fi

# Check if Homebrew is installed
if ! command_exists brew; then
    print_error "Homebrew is not installed. Please install it first:"
    echo "  /bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
    exit 1
fi

print_success "Pre-flight checks passed"

# ----------------------------------------------------------------------------
# Install Required Tools
# ----------------------------------------------------------------------------

print_step "Installing required tools via Homebrew..."

REQUIRED_PACKAGES=(
    "zsh"
    "starship"
    "gh"
    "anyenv"
)

for package in "${REQUIRED_PACKAGES[@]}"; do
    if brew list "$package" &>/dev/null; then
        print_success "$package is already installed"
    else
        print_step "Installing $package..."
        brew install "$package"
        print_success "$package installed"
    fi
done

# ----------------------------------------------------------------------------
# Setup anyenv
# ----------------------------------------------------------------------------

print_step "Setting up anyenv..."

# Initialize anyenv if not already done
ANYENV_MANIFEST_DIR="${HOME}/.config/anyenv/anyenv-install"
if [[ ! -d "${ANYENV_MANIFEST_DIR}" ]]; then
    anyenv install --init
    print_success "anyenv initialized (manifest: ${ANYENV_MANIFEST_DIR})"
else
    print_success "anyenv already initialized"
fi

# Install anyenv plugins
ANYENV_ROOT="$(anyenv root 2>/dev/null || echo "${HOME}/.anyenv")"
if [[ ! -d "${ANYENV_ROOT}/plugins/anyenv-update" ]]; then
    mkdir -p "${ANYENV_ROOT}/plugins"
    git clone https://github.com/znz/anyenv-update.git "${ANYENV_ROOT}/plugins/anyenv-update"
    print_success "anyenv-update plugin installed"
else
    print_success "anyenv-update plugin already installed"
fi

# Source anyenv to use it in this script
eval "$(anyenv init -)"

# Install nodenv, pyenv, rbenv
for env in nodenv pyenv rbenv; do
    if anyenv envs | grep -q "^${env}$"; then
        print_success "$env is already installed"
    else
        print_step "Installing $env..."
        anyenv install "$env"
        eval "$(anyenv init -)"
        print_success "$env installed"
    fi
done

# ----------------------------------------------------------------------------
# Create Symlinks
# ----------------------------------------------------------------------------

print_step "Creating symlinks..."

ZSHENV_SOURCE="${HOME}/.config/zsh/.zshenv"
ZSHENV_TARGET="${HOME}/.zshenv"

if [[ -L "${ZSHENV_TARGET}" ]]; then
    print_success "~/.zshenv symlink already exists"
elif [[ -f "${ZSHENV_TARGET}" ]]; then
    print_warning "~/.zshenv already exists as a regular file"
    read -p "Backup and replace with symlink? (y/N): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        mv "${ZSHENV_TARGET}" "${ZSHENV_TARGET}.backup"
        ln -s "${ZSHENV_SOURCE}" "${ZSHENV_TARGET}"
        print_success "Created symlink and backed up old file to ~/.zshenv.backup"
    else
        print_warning "Skipping symlink creation"
    fi
else
    ln -s "${ZSHENV_SOURCE}" "${ZSHENV_TARGET}"
    print_success "Created ~/.zshenv symlink"
fi

# ----------------------------------------------------------------------------
# Create Required Directories
# ----------------------------------------------------------------------------

print_step "Creating required directories..."

mkdir -p "${HOME}/.local/share/zsh"
mkdir -p "${HOME}/.cache/zsh"
mkdir -p "${HOME}/.local/state"

print_success "Directories created"

# ----------------------------------------------------------------------------
# Set Zsh as Default Shell
# ----------------------------------------------------------------------------

print_step "Checking default shell..."

CURRENT_SHELL="$(basename "$SHELL")"

if [[ "$CURRENT_SHELL" != "zsh" ]]; then
    print_warning "Current shell is $CURRENT_SHELL, not zsh"
    read -p "Set zsh as default shell? (y/N): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        ZSH_PATH="$(command -v zsh)"

        # Add zsh to allowed shells if not present
        if ! grep -q "$ZSH_PATH" /etc/shells; then
            echo "$ZSH_PATH" | sudo tee -a /etc/shells >/dev/null
        fi

        # Change default shell
        chsh -s "$ZSH_PATH"
        print_success "Default shell changed to zsh (restart terminal to apply)"
    else
        print_warning "Keeping current shell"
    fi
else
    print_success "zsh is already the default shell"
fi

# ----------------------------------------------------------------------------
# Install Zinit (if not already installed)
# ----------------------------------------------------------------------------

print_step "Zinit will be automatically installed on first zsh startup"
print_success "Zinit installation deferred to first run"

# ----------------------------------------------------------------------------
# Install Node.js (optional)
# ----------------------------------------------------------------------------

print_step "Checking Node.js installation..."

if command_exists node; then
    print_success "Node.js $(node --version) is already installed"
else
    read -p "Install latest LTS version of Node.js? (y/N): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        print_step "Installing Node.js LTS..."

        # Get latest LTS version
        LATEST_LTS=$(nodenv install -l | grep -E '^\s*[0-9]+\.[0-9]+\.[0-9]+$' | tail -1 | xargs)

        if [[ -n "$LATEST_LTS" ]]; then
            nodenv install "$LATEST_LTS"
            nodenv global "$LATEST_LTS"
            eval "$(anyenv init -)"
            print_success "Node.js $LATEST_LTS installed and set as global"
            print_success "pnpm and claude-code will be automatically installed"
        else
            print_error "Could not determine latest LTS version"
        fi
    else
        print_warning "Skipping Node.js installation"
    fi
fi

# ----------------------------------------------------------------------------
# Git Repository Initialization (optional)
# ----------------------------------------------------------------------------

print_step "Checking Git repository..."

if [[ -d "${HOME}/.config/zsh/.git" ]]; then
    print_success "Git repository already initialized"
else
    read -p "Initialize Git repository for version control? (y/N): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        cd "${HOME}/.config/zsh"
        git init
        git add .
        git commit -m "Initial commit: Zsh configuration"
        print_success "Git repository initialized"
        echo ""
        print_step "To push to a remote repository:"
        echo "  cd ~/.config/zsh"
        echo "  git remote add origin <your-repo-url>"
        echo "  git push -u origin main"
    else
        print_warning "Skipping Git initialization"
    fi
fi

# ----------------------------------------------------------------------------
# Completion
# ----------------------------------------------------------------------------

echo ""
echo "============================================================================"
print_success "Setup completed successfully!"
echo "============================================================================"
echo ""
echo "Next steps:"
echo "  1. Restart your terminal or run: exec zsh"
echo "  2. Zinit will automatically install plugins on first run"
echo "  3. Verify Starship prompt is working"
echo ""
echo "Useful commands:"
echo "  - Edit main config: zshrc"
echo "  - Reload config: reload"
echo "  - Update all tools: brewup && anyenv update"
echo ""
echo "Configuration location: ~/.config/zsh/"
echo ""
print_success "Happy coding!"
echo ""
