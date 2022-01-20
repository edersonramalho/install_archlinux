
export ZSH="/home/essantos/.oh-my-zsh"

ZSH_THEME="spaceship" 

plugins=(
	git
    zsh-syntax-highlighting
    archlinux
    zsh-autosuggestions
    pip
    copyfile
    python
    colorize
    common-aliases
)

source $ZSH/oh-my-zsh.sh

SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  dir           # Current directory section
  venv
  pyenv
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  hg            # Mercurial section (hg_branch  + hg_status)
  exec_time     # Execution time
  line_sep      # Line break
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

# User
SPACESHIP_USER_SHOW=always
SPACESHIP_USER_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"
SPACESHIP_USER_COLOR_ROOT="red"

# PROMPT
SPACESHIP_PROMPT_SYMBOL="➜"
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_PROMPT_SEPARATE_LINE=true
SPACESHIP_PROMPT_PREFIXES_SHOW=true
SPACESHIP_PROMPT_SUFFIXES_SHOW=true
SPACESHIP_PROMPT_DEFAULT_PREFIX="via "
SPACESHIP_PROMPT_DEFAULT_SUFFIX=" "

# Char
SPACESHIP_CHAR_SUFFIX=" "
#SPACESHIP_CHAR_SYMBOL=->
SPACESHIP_CHAR_COLOR_SUCCESS=magenta

# Virtualenv
SPACESHIP_VENV_COLOR="magenta"
SPACESHIP_VENV_PREFIX='('
SPACESHIP_VENV_SUFFIX=')'
SPACESHIP_VENV_SYMBOL="🐍 "

# PYENV
SPACESHIP_PYENV_SHOW=true
SPACESHIP_PYENV_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"
SPACESHIP_PYENV_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"
SPACESHIP_PYENV_SYMBOL="🐍 "
SPACESHIP_PYENV_COLOR="yellow"

# Directory
SPACESHIP_DIR_COLOR=cyan
SPACESHIP_DIR_TRUNC=3
SPACESHIP_DIR_PREFIX=''
#SPACESHIP_DIR_TRUNC=3
SPACESHIP_DIR_TRUNC_REPO=false

# Git
SPACESHIP_GIT_BRANCH_COLOR=magenta
SPACESHIP_GIT_SYMBOL=🌵
SPACESHIP_GIT_BRANCH_PREFIX="🌵 "

SPACESHIP_HOST_SHOW=false

# Time
SPACESHIP_TIME_SHOW=false
SPACESHIP_TIME_COLOR=green
SPACESHIP_TIME_FORMAT=%T
SPACESHIP_TIME_PREFIX="⏰ "


# EXEC_TIME
SPACESHIP_EXEC_TIME_SHOW=true
SPACESHIP_EXEC_TIME_ELAPSED=1

export PATH="/home/essantos/.pyenv/bin:$PATH"
eval "$(ssh-agent -s)"

#Ederson 09/02/2021
source ~/workspace/_conf/env.sh
