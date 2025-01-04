source ~/zsh-defer/zsh-defer.plugin.zsh
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# source ~/.oh-my-zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Path to your oh-my-zsh installation.
export ZSH="/Users/kikuchi/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="refined"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

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
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(zsh-autosuggestions zsh-vi-mode)

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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias vim='nvim'
alias vi='nvim'
alias ls='ls -aG'
alias mongod='mongod --config /opt/homebrew/etc/mongod.conf --fork'

lgrep() {
  grep -n -r -i $1 $2 | awk '{if(length($0) < 1000) print $0}'
}

export TERM=xterm-256color
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:`npm bin -g`
export PATH="$PATH:$HOME/.composer/vendor/bin"
export PATH="/usr/local/opt/mysql-client/bin:$PATH"
export PATH="$PATH:/Users/kikuchi/Library/Android/sdk/platform-tools"
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH="$PATH:$HOME/development/flutter/bin"
export PATH=$PATH:/Applications/"Android Studio.app"/Contents/jbr/Contents/Home/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/Users/kikuchi/go/bin
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border --ansi --cycle"
export PMY_TRIGGER_KEY="^I"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
alias dockerrmall='docker rm -v $(docker ps -aq -f status=exited)'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/kikuchi/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/kikuchi/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/kikuchi/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/kikuchi/google-cloud-sdk/completion.zsh.inc'; fi

alias sim="open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app/"
alias dlbr="git branch --merged | grep -E -v '(master|develop|main)' | xargs git branch -d"

export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"

export PATH=/Users/kikuchi/Desktop/projects/studying/solana/solana/bin:$PATH

export PATH=/Users/kikuchi/.local/share/bob/nvim-bin:$PATH

alias expo="expo whoami && expo"
source /Users/kikuchi/.config/op/plugins.sh

# zsh-defer -c "eval $(pmy init)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
export PATH="$HOME/.phpenv/bin:$PATH"
eval "$(phpenv init -)"
export PHP_RPATHS="$(brew --prefix bzip2)"
export PHP_BUILD_CONFIGURE_OPTS="--with-bz2=$(brew --prefix bzip2) --with-iconv=$(brew --prefix libiconv) --with-tidy=$(brew --prefix tidy-html5) --with-external-pcre=$(brew --prefix pcre2) --with-zip --enable-intl --with-pear --with-sodium"
export PKG_CONFIG_PATH="/usr/local/opt/krb5/lib/pkgconfig:/usr/local/opt/icu4c/lib/pkgconfig:/usr/local/opt/libedit/lib/pkgconfig:/usr/local/opt/libjpeg/lib/pkgconfig:/usr/local/opt/libpng/lib/pkgconfig:/usr/local/opt/libxml2/lib/pkgconfig:/usr/local/opt/libzip/lib/pkgconfig:/usr/local/opt/oniguruma/lib/pkgconfig:/usr/local/opt/openssl@1.1/lib/pkgconfig:/usr/local/opt/tidy-html5/lib/pkgconfig"

. "/opt/homebrew/opt/asdf/libexec/asdf.sh"

. "/opt/homebrew/opt/asdf/etc/bash_completion.d/asdf.bash"

export DENO_INSTALL="/Users/kikuchi/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
export PATH=$PATH:$HOME/.maestro/bin
