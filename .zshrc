# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# pyenv config
export PATH="/Users/username/.pyenv/shims:${PATH}"
eval "$(pyenv init --path)"
  
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 7

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# My Custom Stuff
  export GREEN='\033[1;32m'
  export ORANGE='\033[0;33m'
  export PLAIN='\033[0m'
  export PATH="/usr/bin:/opt/homebrew/opt/python@3.12/libexec/bin:$PATH"

  # Re-map my SSH Key
  export SSH_FILE=~/.ssh/id_ed25519

# Mac dock
  alias macdockspace="defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'; killall Dock"

# ZSH config
  alias zshconfig="code ~/.zshrc"
  alias zshsource="source ~/.zshrc"

# git
  alias ginit="git init ."
  alias gadd="git add ."
  alias gcom="git commit -m"
  alias gpo="git push origin"
  alias gcb="git checkout -b"
  alias gco="git checkout"
  alias gcam="gitAddAllMessage"
  alias gcap="gitAddCommitPush"
  alias gprune="gitPrune"
  alias vsclone="gitCloneThenCode"
  # Shallow clone
  alias gclone="git clone --filter=blob:none"

  function gitPrune() {
    git fetch -p && \
    git branch -v | grep "gone" | awk '{print $1}' | xargs git branch -D
  }

  function gitAddAllMessage() {
    git add . && \
    git commit -m "$1"
  }

  function gitAddCommitPush() {
    git add . && \
    git commit -m "$1" && \
    git push origin
  }

  function gitCloneThenCode() {
    git clone --filter=blob:none "$1" && \
    echo "$1" | awk -F"/" '{print $NF}' | awk -F"." '{print $1}' | read NEWREPO && \
    code $NEWREPO
  }

# navigation
  alias cdgit="cd ~/GIT"

# folder management
  alias mkcd="makeAndChangeDir"

  function makeAndChangeDir() {
    mkdir $1 && \
    cd $1
  }

# docker
  alias dockerprune="docker system prune -af"

# Bazel
 alias bazelclean="bazel clean --expunge"

# Log in to everything
  function sendit() {
      awsSSO && \
      awsECR && \
      echo -e "${GREEN}Point 'em and GO!${PLAIN}"
  }

# Authenticate  #allTheThings
function awsSSO() {
    aws sso login
    echo -e "${ORANGE}AWS SSO Complete - Check Above for Status${PLAIN}"
}

# Change region and account ID below as appropriate
function awsECR() {
    aws ecr get-login-password --region us-east-1 | \
    docker login --username AWS --password-stdin 1234567890.dkr.ecr.us-east-1.amazonaws.com
    echo -e "${ORANGE}AWS ECR Complete - Check Above for Status${PLAIN}"
}

# Keys DO NOT COMMIT
  export GITHUB_PAT=''
  export GITLAB_PAT=''
  export NIST_API_KEY=''
