# ============================================================================
# aliases/ruby.zsh - Ruby Development Aliases
# ============================================================================
# Shortcuts for Ruby, RubyGems, Bundler, and Rails
# ============================================================================

# ----------------------------------------------------------------------------
# Ruby Executable
# ----------------------------------------------------------------------------

alias rb='ruby'
alias irb='irb'

# ----------------------------------------------------------------------------
# RubyGems
# ----------------------------------------------------------------------------

alias gem='gem'
alias gemi='gem install'
alias gemu='gem uninstall'
alias gemup='gem update'
alias gemlist='gem list'
alias gemout='gem outdated'
alias gemclean='gem cleanup'
alias gemsearch='gem search'

# ----------------------------------------------------------------------------
# Bundler - Dependency Management
# ----------------------------------------------------------------------------

alias be='bundle exec'
alias bi='bundle install'
alias bu='bundle update'
alias bo='bundle outdated'
alias bck='bundle check'
alias bconf='bundle config'
alias bopen='bundle open'
alias bshow='bundle show'
alias bclean='bundle clean'
alias bpack='bundle package'
alias blist='bundle list'

# Common bundle exec commands
alias ber='bundle exec ruby'
alias berake='bundle exec rake'
alias berails='bundle exec rails'
alias berspec='bundle exec rspec'

# ----------------------------------------------------------------------------
# Rails - Web Application Framework
# ----------------------------------------------------------------------------

alias r='rails'
alias rs='rails server'
alias rc='rails console'
alias rcs='rails console --sandbox'
alias rg='rails generate'
alias rd='rails destroy'
alias rdb='rails db'
alias rr='rails routes'
alias rt='rails test'

# Database operations
alias rdbm='rails db:migrate'
alias rdbr='rails db:rollback'
alias rdbs='rails db:seed'
alias rdbrs='rails db:reset'
alias rdbst='rails db:setup'
alias rdbdr='rails db:drop'
alias rdbcr='rails db:create'
alias rdbms='rails db:migrate:status'

# Asset operations
alias rassp='rails assets:precompile'
alias rassc='rails assets:clean'

# Routes
alias rgr='rails routes | grep'

# Testing
alias rts='rails test:system'
alias rtm='rails test:models'
alias rtc='rails test:controllers'

# ----------------------------------------------------------------------------
# Rake - Ruby Make
# ----------------------------------------------------------------------------

alias rake='rake'
alias rk='rake'
alias rkt='rake -T'
alias rkr='rake routes'

# ----------------------------------------------------------------------------
# RSpec - Testing Framework
# ----------------------------------------------------------------------------

alias rspec='rspec'
alias rsp='rspec'
alias rspf='rspec --fail-fast'
alias rspn='rspec --next-failure'

# ----------------------------------------------------------------------------
# Ruby Version Management (rbenv)
# ----------------------------------------------------------------------------

alias rbv='rbenv versions'
alias rbvl='rbenv install --list'
alias rbvi='rbenv install'
alias rbvg='rbenv global'
alias rbvlc='rbenv local'
alias rbvr='rbenv rehash'
alias rbvu='rbenv uninstall'

# ----------------------------------------------------------------------------
# Pry - Enhanced REPL
# ----------------------------------------------------------------------------

alias pry='pry'

# ----------------------------------------------------------------------------
# Sinatra - Lightweight Web Framework
# ----------------------------------------------------------------------------

alias sinatra='ruby'

# ----------------------------------------------------------------------------
# Jekyll - Static Site Generator
# ----------------------------------------------------------------------------

alias jk='jekyll'
alias jks='jekyll serve'
alias jkb='jekyll build'
alias jkn='jekyll new'

# ----------------------------------------------------------------------------
# Utilities
# ----------------------------------------------------------------------------

# Ruby version
alias rubyversion='ruby --version'

# Check Ruby syntax
alias rubysyntax='ruby -c'

# Run Ruby one-liner
alias rubyone='ruby -e'

# Ruby gem environment
alias gemenv='gem env'

# Update RubyGems itself
alias gemupdate='gem update --system'

# List local gems
alias gemlocal='gem list --local'

# Create Gemfile
alias geminit='bundle init'

# Show Ruby load path
alias rubypath='ruby -e "puts $LOAD_PATH"'

# ----------------------------------------------------------------------------
# Guard - Automatic Testing
# ----------------------------------------------------------------------------

alias guard='guard'
alias guardrun='bundle exec guard'

# ----------------------------------------------------------------------------
# Capistrano - Deployment
# ----------------------------------------------------------------------------

alias cap='cap'
alias capdeploy='cap deploy'
alias capproduction='cap production deploy'
alias capstaging='cap staging deploy'

# ----------------------------------------------------------------------------
# Rubocop - Code Linter
# ----------------------------------------------------------------------------

alias rubocop='rubocop'
alias rubocopf='rubocop -a'
alias rubocopa='rubocop -A'
