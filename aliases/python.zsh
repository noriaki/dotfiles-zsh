# ============================================================================
# aliases/python.zsh - Python Development Aliases
# ============================================================================
# Shortcuts for Python, pip, virtual environments, and related tools
# ============================================================================

# ----------------------------------------------------------------------------
# Python Executable
# ----------------------------------------------------------------------------

alias py='python'
alias py3='python3'
alias python='python3'
alias pip='pip3'

# ----------------------------------------------------------------------------
# pip - Package Manager
# ----------------------------------------------------------------------------

alias pipi='pip install'
alias pipu='pip uninstall'
alias pipup='pip install --upgrade'
alias pipupall='pip list --outdated --format=freeze | grep -v "^\-e" | cut -d = -f 1 | xargs -n1 pip install -U'
alias piplist='pip list'
alias pipout='pip list --outdated'
alias pipshow='pip show'
alias pipsearch='pip search'
alias pipfreeze='pip freeze'
alias pipreq='pip freeze > requirements.txt'

# ----------------------------------------------------------------------------
# Virtual Environments
# ----------------------------------------------------------------------------

# Create virtual environment
alias venv='python -m venv'
alias venvhere='python -m venv venv'

# Activate/deactivate virtual environment
alias activate='source venv/bin/activate'
alias deactivate='deactivate'

# Alternative venv names
alias va='source venv/bin/activate'
alias vact='source venv/bin/activate'
alias vdeact='deactivate'

# Activate .venv (common alternative name)
alias activate-env='source .venv/bin/activate'
alias vaenv='source .venv/bin/activate'

# ----------------------------------------------------------------------------
# Poetry - Modern Python dependency management
# ----------------------------------------------------------------------------

alias po='poetry'
alias poi='poetry install'
alias poa='poetry add'
alias poad='poetry add --group dev'
alias por='poetry remove'
alias poup='poetry update'
alias pos='poetry shell'
alias porun='poetry run'
alias popy='poetry run python'
alias potest='poetry run pytest'
alias pobuild='poetry build'
alias popub='poetry publish'
alias poshow='poetry show'
alias poout='poetry show --outdated'

# ----------------------------------------------------------------------------
# pytest - Testing Framework
# ----------------------------------------------------------------------------

alias pytest='pytest'
alias pyt='pytest'
alias pytv='pytest -v'
alias pytvs='pytest -vs'
alias pytcov='pytest --cov'
alias pytwatch='pytest-watch'

# ----------------------------------------------------------------------------
# Python Version Management (pyenv)
# ----------------------------------------------------------------------------

alias pyv='pyenv versions'
alias pyvl='pyenv install --list'
alias pyvi='pyenv install'
alias pyvg='pyenv global'
alias pyvlc='pyenv local'
alias pyvr='pyenv rehash'
alias pyvu='pyenv uninstall'

# ----------------------------------------------------------------------------
# Development Tools
# ----------------------------------------------------------------------------

# Black - Code formatter
alias black='black'
alias blackcheck='black --check'

# isort - Import sorter
alias isort='isort'

# flake8 - Linter
alias flake='flake8'

# mypy - Type checker
alias mypy='mypy'

# pylint - Linter
alias pylint='pylint'

# ----------------------------------------------------------------------------
# Django
# ----------------------------------------------------------------------------

alias dj='python manage.py'
alias djrun='python manage.py runserver'
alias djmig='python manage.py migrate'
alias djmake='python manage.py makemigrations'
alias djshell='python manage.py shell'
alias djtest='python manage.py test'
alias djcreate='python manage.py createsuperuser'
alias djcollect='python manage.py collectstatic'

# ----------------------------------------------------------------------------
# Flask
# ----------------------------------------------------------------------------

alias flaskrun='flask run'
alias flaskshell='flask shell'

# ----------------------------------------------------------------------------
# Jupyter
# ----------------------------------------------------------------------------

alias jn='jupyter notebook'
alias jl='jupyter lab'
alias jnlist='jupyter notebook list'

# ----------------------------------------------------------------------------
# Python REPL Enhancements
# ----------------------------------------------------------------------------

# IPython
alias ipy='ipython'

# bpython
alias bpy='bpython'

# ----------------------------------------------------------------------------
# Utilities
# ----------------------------------------------------------------------------

# Run Python HTTP server
alias pyserver='python -m http.server'
alias pyserver8000='python -m http.server 8000'

# JSON formatting
alias pyjson='python -m json.tool'

# Python path
alias pypath='python -c "import sys; print(\"\n\".join(sys.path))"'

# Show Python version
alias pyversion='python --version'

# Check Python syntax without executing
alias pysyntax='python -m py_compile'

# Profile Python code
alias pyprofile='python -m cProfile'

# ----------------------------------------------------------------------------
# Conda (if using Anaconda/Miniconda)
# ----------------------------------------------------------------------------

alias ca='conda activate'
alias cda='conda deactivate'
alias ci='conda install'
alias cenv='conda env list'
alias ccreate='conda create'
alias cremove='conda remove'
alias clist='conda list'
alias cupdate='conda update'
