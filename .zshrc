# Path to your oh-my-zsh installation.
export ZSH=/Users/adrienhobbs/.oh-my-zsh
export PATH=~/.npm-global/bin:$PATH


# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set t:his to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="bullet-train"

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
plugins=(git ruby at lighthouse bower brew composer common-aliases git-extras git_remote_branch httpie history jsontools node sudo vagrant web-search)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/Cellar/"
# export MANPATH="/usr/local/man:$MANPATH"
PATH="/usr/local/share/python/:$PATH"

source $ZSH/oh-my-zsh.sh

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
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias vssh="~/Homestead && vagrant ssh"
alias vup="~/Code/Homestead && vagrant up"
alias vsus="~/Code/Homestead && vagrant suspend"
alias ll='ls -lh'
alias hecklerssh='ssh heckler -t "cd /var/www/html && git fetch && git status && bash --login"'
alias hecklerpull='ssh heckler -t "cd /var/www/html && git pull && git status && bash --login"'
alias heck='Code/dev/heckler-new'
alias dev='~/Code/dev'
alias glow='cd ~/Code/dev/the-glow-site'
alias glow-serve='Code/dev/the-glow-site/api-server && nodemon --exec babel-node server'
alias popt='~/Code/dev/popeye/wp-content/themes/popeye_theme_dev'
alias popssh='~/Code && ssh -i popeye.pem ec2-user@54.208.119.247'

export NVM_DIR="/Users/adrienhobbs/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
export ANDROID_HOME="/Users/adrienhobbs/Library/Android/sdk"

export PATH="/Users/adrienhobbs/Library/Android/sdk/platform-tools:/Users/adrienhobbs/Library/Android/sdk/tools:$PATH"

export PATH="$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform_tools"
export PATH="/Users/adrienhobbs/imageoptim-cli/bin:$PATH"

PROMPT_TITLE='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}\007"'
export PROMPT_COMMAND="${PROMPT_COMMAND} ${PROMPT_TITLE}; "
