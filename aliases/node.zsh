# ============================================================================
# aliases/node.zsh - Node.js and pnpm Aliases
# ============================================================================
# Shortcuts for Node.js, npm, pnpm, and related tools
# ============================================================================

# ----------------------------------------------------------------------------
# pnpm - Fast, disk space efficient package manager
# ----------------------------------------------------------------------------

alias pn='pnpm'
alias pni='pnpm install'
alias pna='pnpm add'
alias pnad='pnpm add -D'
alias pnag='pnpm add -g'
alias pnr='pnpm remove'
alias pnrg='pnpm remove -g'

# pnpm scripts
alias pnrun='pnpm run'
alias pnd='pnpm run dev'
alias pnb='pnpm run build'
alias pnt='pnpm run test'
alias pnl='pnpm run lint'
alias pnf='pnpm run format'
alias pns='pnpm start'

# pnpm utilities
alias pnup='pnpm update'
alias pnupi='pnpm update --interactive'
alias pnls='pnpm list'
alias pnlsg='pnpm list -g'
alias pnout='pnpm outdated'
alias pncc='pnpm store prune'

# ----------------------------------------------------------------------------
# npm - For when npm is still needed
# ----------------------------------------------------------------------------

alias ni='npm install'
alias nia='npm install --save'
alias nid='npm install --save-dev'
alias nig='npm install -g'
alias nun='npm uninstall'
alias nup='npm update'
alias nrun='npm run'
alias nst='npm start'
alias nt='npm test'
alias nls='npm list'
alias nlsg='npm list -g --depth=0'

# ----------------------------------------------------------------------------
# Node.js
# ----------------------------------------------------------------------------

alias node-version='node --version'
alias npm-version='npm --version'
alias pnpm-version='pnpm --version'

# ----------------------------------------------------------------------------
# npx - Package runner
# ----------------------------------------------------------------------------

alias nx='npx'
alias nxc='npx --yes'

# ----------------------------------------------------------------------------
# Package.json utilities
# ----------------------------------------------------------------------------

# Quickly view package.json
alias pkg='cat package.json'
alias pkgv='cat package.json | grep version'

# Open package.json in editor
alias pkge='${EDITOR:-vim} package.json'

# ----------------------------------------------------------------------------
# Node version management (nodenv)
# ----------------------------------------------------------------------------

alias nv='nodenv versions'
alias nvl='nodenv install --list'
alias nvi='nodenv install'
alias nvg='nodenv global'
alias nvlc='nodenv local'
alias nvr='nodenv rehash'

# ----------------------------------------------------------------------------
# Yarn (for projects still using it)
# ----------------------------------------------------------------------------

alias y='yarn'
alias ya='yarn add'
alias yad='yarn add --dev'
alias yag='yarn global add'
alias yr='yarn remove'
alias yrg='yarn global remove'
alias yup='yarn upgrade'
alias yui='yarn upgrade-interactive'
alias yout='yarn outdated'
alias yi='yarn install'
alias ys='yarn start'
alias yb='yarn build'
alias yt='yarn test'
alias yrun='yarn run'

# ----------------------------------------------------------------------------
# Development servers and tools
# ----------------------------------------------------------------------------

# Kill process on port (useful for stuck dev servers)
alias kill3000='lsof -ti:3000 | xargs kill -9'
alias kill8080='lsof -ti:8080 | xargs kill -9'
alias kill5173='lsof -ti:5173 | xargs kill -9'

# ----------------------------------------------------------------------------
# TypeScript
# ----------------------------------------------------------------------------

alias tsc='npx tsc'
alias tscheck='npx tsc --noEmit'

# ----------------------------------------------------------------------------
# Common development commands
# ----------------------------------------------------------------------------

# Create new projects
alias create-vite='pnpm create vite'
alias create-next='pnpm create next-app'
alias create-react='pnpm create react-app'

# Linting and formatting
alias eslint='npx eslint'
alias prettier='npx prettier'
