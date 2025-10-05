# ============================================================================
# aliases/git.zsh - Git Command Aliases
# ============================================================================
# Convenient shortcuts for common Git operations
# ============================================================================

# ----------------------------------------------------------------------------
# Basic Git Commands
# ----------------------------------------------------------------------------

alias g='git'
alias gs='git status'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit'
alias gcm='git commit -m'
alias gca='git commit --amend'
alias gcan='git commit --amend --no-edit'

# ----------------------------------------------------------------------------
# Branch Operations
# ----------------------------------------------------------------------------

alias gb='git branch'
alias gba='git branch -a'
alias gbd='git branch -d'
alias gbD='git branch -D'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gcm='git checkout main || git checkout master'

# ----------------------------------------------------------------------------
# Remote Operations
# ----------------------------------------------------------------------------

alias gp='git push'
alias gpf='git push --force-with-lease'
alias gpo='git push origin'
alias gpom='git push origin main || git push origin master'
alias gl='git pull'
alias glo='git pull origin'
alias glom='git pull origin main || git pull origin master'
alias gf='git fetch'
alias gfa='git fetch --all'

# ----------------------------------------------------------------------------
# Diff and Log
# ----------------------------------------------------------------------------

alias gd='git diff'
alias gds='git diff --staged'
alias gdc='git diff --cached'
alias glog='git log --oneline --graph --decorate'
alias gloga='git log --oneline --graph --decorate --all'
alias glogp='git log --pretty=format:"%h - %an, %ar : %s"'
alias glol='git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset"'

# ----------------------------------------------------------------------------
# Stash Operations
# ----------------------------------------------------------------------------

alias gst='git stash'
alias gsta='git stash apply'
alias gstp='git stash pop'
alias gstl='git stash list'
alias gstd='git stash drop'
alias gstc='git stash clear'

# ----------------------------------------------------------------------------
# Reset and Revert
# ----------------------------------------------------------------------------

alias grh='git reset HEAD'
alias grhh='git reset --hard HEAD'
alias grhu='git reset --hard @{u}'
alias grev='git revert'

# ----------------------------------------------------------------------------
# Rebase Operations
# ----------------------------------------------------------------------------

alias grb='git rebase'
alias grbi='git rebase -i'
alias grbc='git rebase --continue'
alias grba='git rebase --abort'
alias grbs='git rebase --skip'

# ----------------------------------------------------------------------------
# Tag Operations
# ----------------------------------------------------------------------------

alias gt='git tag'
alias gta='git tag -a'
alias gtd='git tag -d'
alias gtl='git tag -l'

# ----------------------------------------------------------------------------
# Remote Management
# ----------------------------------------------------------------------------

alias gr='git remote'
alias gra='git remote add'
alias grv='git remote -v'
alias grrm='git remote remove'
alias gru='git remote update'

# ----------------------------------------------------------------------------
# Merge Operations
# ----------------------------------------------------------------------------

alias gm='git merge'
alias gma='git merge --abort'
alias gmc='git merge --continue'

# ----------------------------------------------------------------------------
# Cherry-pick
# ----------------------------------------------------------------------------

alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'

# ----------------------------------------------------------------------------
# Submodule Operations
# ----------------------------------------------------------------------------

alias gsm='git submodule'
alias gsmi='git submodule init'
alias gsmu='git submodule update'
alias gsmui='git submodule update --init'
alias gsmur='git submodule update --init --recursive'

# ----------------------------------------------------------------------------
# Utilities
# ----------------------------------------------------------------------------

alias gclean='git clean -fd'
alias gignore='git update-index --assume-unchanged'
alias gunignore='git update-index --no-assume-unchanged'
alias gwch='git whatchanged -p --abbrev-commit --pretty=medium'
alias gcount='git shortlog -sn'

# Show current branch name
alias gcurrent='git branch --show-current'

# Clone with submodules
alias gclone='git clone --recurse-submodules'
