# only for rustup
fpath+=~/.zfunc

# export TERM="xterm-256color"
export TERM="rxvt-unicode-256color"


# powerlevel9K settings

POWERLEVEL9K_CUSTOM_DISTRIB_ICON="echo -n \"\uF17C\""
  POWERLEVEL9K_CUSTOM_DISTRIB_ICON_FOREGROUND="black"
  POWERLEVEL9K_CUSTOM_DISTRIB_ICON_BACKGROUND="white"

  POWERLEVEL9K_MODE='nerdfont-complete'
  POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(virtualenv os_icon custom_distrib_icon custom_internet_signal context dir vcs)
  POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status background_jobs custom_music ram battery time)
  POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
  POWERLEVEL9K_OS_ICON_BACKGROUND="green"
  # POWERLEVEL9K_OS_ICON_FOREGROUND="#6E56AF"
  POWERLEVEL9K_RAM_ELEMENTS=(ram_free)


# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/emilien/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    asdf
    aws
    cargo
    cask
    catimg
    colorize
    docker
    docker-compose
    emacs
    extract
    git
    git-auto-fetch
    git-extras
    git-prompt
    gitfast
    github
    golang
    gradle
    helm
    kops
    kubectl
    lein
    minikube
    mix
    mvn
    npm
    pip
    pyenv
    python
    rbenv
    rebar
    rust
    sdk
    solarized-man
    ssh-agent
    sudo
    terraform
    transfer
    wakatime
    z
    zsh-autosuggestions
    zsh-completions
    zsh-syntax-highlighting
)

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

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# source ~/.zshenv

# autosugestion (match used)
ZSH_AUTOSUGGEST_STRATEGY=match_prev_cmd

export PATH=$PATH

typeset -U path

alias sudo='sudo '

eval $(thefuck --alias)

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/emilien/google-cloud-sdk/path.zsh.inc' ]; then . '/home/emilien/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/emilien/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/emilien/google-cloud-sdk/completion.zsh.inc'; fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/emilien/.sdkman"
[[ -s "/home/emilien/.sdkman/bin/sdkman-init.sh" ]] && source "/home/emilien/.sdkman/bin/sdkman-init.sh"

alias ls=lsd
