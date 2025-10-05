# Zsh Development Environment Configuration

A comprehensive, modern Zsh configuration for macOS with XDG Base Directory compliance, intelligent plugin management, and multi-language development support.

## Features

- 🚀 **Fast Startup**: Optimized with Zinit's turbo mode (~0.2s startup time)
- 📁 **XDG Compliant**: Clean home directory with `~/.config/zsh/` structure
- 🎨 **Beautiful Prompt**: Starship prompt with Git integration
- 🔧 **Version Management**: anyenv for Node.js, Python, and Ruby
- 📦 **Plugin Management**: Zinit with syntax highlighting and auto-suggestions
- 🎯 **Smart Completion**: Context-aware, case-insensitive completions
- 📝 **Rich History**: 10,000 commands with timestamps and session sharing
- 🔀 **Git-Ready**: Extensive Git aliases and utilities
- 🌐 **Multi-Language**: Pre-configured for Node.js, Python, and Ruby development

## Directory Structure

```
~/.config/zsh/
├── .zshenv           # Environment variables (sourced first)
├── .zshrc            # Main configuration with plugin loading
├── env.zsh           # PATH and additional environment variables
├── functions.zsh     # Custom utility functions
├── completion.zsh    # Advanced completion settings
├── history.zsh       # History configuration
├── aliases/
│   ├── general.zsh   # System and file operation aliases
│   ├── git.zsh       # Git workflow aliases
│   ├── node.zsh      # Node.js and pnpm aliases
│   ├── python.zsh    # Python development aliases
│   └── ruby.zsh      # Ruby development aliases
├── .gitignore        # Git ignore rules
├── setup.sh          # Automated setup script
└── README.md         # This file

~/.config/starship.toml  # Starship prompt configuration
~/.anyenv/envs/nodenv/default-packages  # Auto-install pnpm & claude-code
```

## Prerequisites

- **macOS** (tested on Apple Silicon and Intel Macs)
- **Homebrew** installed

### Install Homebrew (if needed)

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## Installation

### Automated Setup (Recommended)

Run the automated setup script:

```bash
cd ~/.config/zsh
chmod +x setup.sh
./setup.sh
```

The script will:
1. Check for Homebrew installation
2. Install required tools (zsh, starship, gh, anyenv)
3. Setup anyenv and install nodenv, pyenv, rbenv
4. Create necessary symlinks (`~/.zshenv` → `~/.config/zsh/.zshenv`)
5. Create required directories
6. Optionally set zsh as default shell
7. Optionally install Node.js LTS
8. Optionally initialize Git repository

### Manual Setup

If you prefer to set up manually:

#### 1. Install Required Tools

```bash
brew install zsh starship gh anyenv
```

#### 2. Initialize anyenv

```bash
anyenv install --init
```

Add to your shell (temporarily):
```bash
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"
```

#### 3. Install Language Version Managers

```bash
anyenv install nodenv
anyenv install pyenv
anyenv install rbenv
```

#### 4. Create Symlink

```bash
ln -s ~/.config/zsh/.zshenv ~/.zshenv
```

#### 5. Create Required Directories

```bash
mkdir -p ~/.local/share/zsh
mkdir -p ~/.cache/zsh
mkdir -p ~/.local/state
```

#### 6. Set Zsh as Default Shell

```bash
chsh -s $(which zsh)
```

#### 7. Restart Terminal

```bash
exec zsh
```

Zinit will automatically install plugins on first run.

## Post-Installation

### Install Node.js

```bash
# List available versions
nodenv install --list

# Install latest LTS (example: 20.x.x)
nodenv install 20.11.0

# Set global version
nodenv global 20.11.0

# Verify installation
node --version
pnpm --version  # Auto-installed via default-packages
claude-code --version  # Auto-installed via default-packages
```

### Install Python

```bash
# List available versions
pyenv install --list

# Install latest Python 3
pyenv install 3.12.1

# Set global version
pyenv global 3.12.1

# Verify installation
python --version
```

### Install Ruby

```bash
# List available versions
rbenv install --list

# Install latest Ruby
rbenv install 3.3.0

# Set global version
rbenv global 3.3.0

# Verify installation
ruby --version
```

## Configuration

### Environment Variables

Edit `~/.config/zsh/env.zsh` to customize:
- PATH modifications
- Language-specific environment variables
- Editor preferences
- Custom environment variables

### Aliases

Aliases are organized by category in `~/.config/zsh/aliases/`:

**General** (`general.zsh`):
- `ll` - Detailed list
- `la` - Show hidden files
- `..` - Go up one directory
- `...` - Go up two directories

**Git** (`git.zsh`):
- `gs` - `git status`
- `ga` - `git add`
- `gc` - `git commit`
- `gp` - `git push`
- `gl` - `git pull`
- `glog` - Pretty log with graph

**Node.js/pnpm** (`node.zsh`):
- `pn` - `pnpm`
- `pni` - `pnpm install`
- `pnr` - `pnpm run`
- `pnd` - `pnpm run dev`
- `pnb` - `pnpm run build`

**Python** (`python.zsh`):
- `py` - `python`
- `pipi` - `pip install`
- `venv` - Create virtual environment
- `activate` - Activate venv

**Ruby** (`ruby.zsh`):
- `be` - `bundle exec`
- `bi` - `bundle install`
- `rs` - `rails server`
- `rc` - `rails console`

### Custom Functions

Available utility functions in `functions.zsh`:

- `mkcd <dir>` - Create and cd into directory
- `up <n>` - Go up N directories
- `extract <file>` - Extract various archive formats
- `gignore <lang>` - Generate .gitignore from gitignore.io
- `port-kill <port>` - Kill process on specified port
- `git-cleanup` - Remove merged local branches
- `myip` - Show external IP address
- `localip` - Show local IP address

### Starship Prompt

Customize the prompt by editing `~/.config/starship.toml`.

Current prompt shows:
- Current directory (truncated)
- Git branch and status
- Language versions (Node.js, Python, Ruby)
- Command duration (for slow commands)
- Time (optional, currently enabled)

Documentation: https://starship.rs/config/

## Plugin Management

Plugins are managed by [Zinit](https://github.com/zdharma-continuum/zinit).

### Installed Plugins

- **zsh-syntax-highlighting** - Colors commands as you type
- **zsh-autosuggestions** - Fish-like autosuggestions from history
- **zsh-completions** - Additional completion definitions

### Adding New Plugins

Edit `~/.config/zsh/.zshrc` and add:

```bash
zinit ice wait lucid
zinit light <username>/<plugin-name>
```

Then reload:
```bash
source ~/.config/zsh/.zshrc
```

## Usage Tips

### Quick Edits

```bash
zshrc     # Edit main config
zshenv    # Edit environment variables
reload    # Reload configuration
```

### History Search

- **Ctrl+R** - Reverse search
- **Up/Down** - Search with current line prefix
- Type partial command + Up arrow to find matching history

### Completions

- **Tab** - Trigger completion
- **Tab Tab** - Show all options
- Completions are case-insensitive
- Supports partial matching

### Git Workflow

```bash
gs          # Check status
ga .        # Add all files
gc -m "msg" # Commit
gp          # Push
glog        # View history
```

## Updating

### Update Homebrew Packages

```bash
brewup  # Alias for: brew update && brew upgrade && brew cleanup
```

### Update anyenv and Language Versions

```bash
anyenv update  # If anyenv-update plugin is installed
```

### Update Zinit Plugins

```bash
zinit update --all
```

### Update Starship

```bash
brew upgrade starship
```

## Version Control with Git

### Initialize Repository

```bash
cd ~/.config/zsh
git init
git add .
git commit -m "Initial commit: Zsh configuration"
```

### Push to Remote

```bash
git remote add origin <your-repo-url>
git push -u origin main
```

### Clone on Another Machine

```bash
git clone <your-repo-url> ~/.config/zsh
cd ~/.config/zsh
./setup.sh
```

## Troubleshooting

### Slow Startup

Run Zsh profiling:
```bash
time zsh -i -c exit
```

Disable plugins one by one in `.zshrc` to identify the culprit.

### Completions Not Working

Rebuild completion cache:
```bash
rm -f ~/.config/zsh/.zcompdump*
exec zsh
```

### Zinit Issues

Reinstall Zinit:
```bash
rm -rf ~/.local/share/zinit
exec zsh
```

### anyenv Issues

Reinitialize anyenv:
```bash
anyenv install --init
exec zsh
```

### Starship Not Showing

Verify installation:
```bash
which starship
starship --version
```

If not installed:
```bash
brew install starship
```

## Customization

### Add Personal Aliases

Create `~/.config/zsh/aliases/personal.zsh`:
```bash
# Personal aliases
alias myalias='command'
```

Then add to `.zshrc`:
```bash
[[ -f "${ZDOTDIR}/aliases/personal.zsh" ]] && source "${ZDOTDIR}/aliases/personal.zsh"
```

### Add Private Configuration

Create `~/.config/zsh/private.zsh` (gitignored):
```bash
# Private environment variables
export SECRET_KEY="xxx"
```

Add to `.zshrc`:
```bash
[[ -f "${ZDOTDIR}/private.zsh" ]] && source "${ZDOTDIR}/private.zsh"
```

## Performance Benchmarks

Expected startup times:
- **Cold start**: ~0.3-0.4s (first shell after boot)
- **Warm start**: ~0.15-0.25s (subsequent shells)

Tested on:
- MacBook Pro M1 (2021)
- macOS Sonoma 14.x

## Contributing

Feel free to customize and share your improvements!

### File an Issue

Found a bug or have a suggestion? Please document it.

### Share Your Config

Fork this configuration and customize it to your needs.

## Resources

- [Zsh Documentation](https://zsh.sourceforge.io/Doc/)
- [Zinit Documentation](https://github.com/zdharma-continuum/zinit)
- [Starship Documentation](https://starship.rs/)
- [anyenv Documentation](https://github.com/anyenv/anyenv)
- [XDG Base Directory Specification](https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html)

## License

This configuration is provided as-is for personal use. Customize freely!

## Author

Created for modern macOS development environments.

---

**Happy Coding!** 🚀
