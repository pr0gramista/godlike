# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Flutter
export PATH="$PATH":"$HOME/tools/flutter/bin"
export PATH="$PATH":"$HOME/tools/flutter/.pub-cache/bin"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

# Grab this theme from https://github.com/benniemosher/the-one-theme/blob/master/zsh/TheOne.zsh-theme
# cd ~/.oh-my-zsh/themes   
# wget https://github.com/benniemosher/the-one-theme/blob/master/zsh/TheOne.zsh-theme
# mv TheOne.zsh-theme one.zsh-theme
ZSH_THEME="one"

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
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

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

# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/NAME_HERE
# macos:
# - rmdsstore - remove .DS_Store files recursively in a directory
# - pfd - Return the path of the frontmost Finder window
# - cdf - cd to the current Finder directory
plugins=(
  git
  macos
  gcloud
  docker
  docker-compose
  fzf
  npm # Adds npmR
  yarn # Adds alias y, yd (dev), yb (build)
  git-prompt
  encode64 # Adds e64, d64
  z
  jsontools # Adds pp_json, urlencode_json, is_json
)

# To install:
# git clone https://github.com/MichaelAquilina/zsh-you-should-use.git $ZSH_CUSTOM/plugins/you-should-use
plugins=(you-should-use $plugins)

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

# Alias for checking which process is using specific port in macOS
# Example use:
# port 8080
port() {
  lsof -nP -iTCP:$1 | grep LISTEN
}

# Open Chrome without security so we can ignore missing CORS headers
nocorschrome() {
  open -n -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --args --user-data-dir="/tmp/chrome_dev_test" --disable-web-security
}

# Aliases for setting local Git email to work one
gitwork() {
  git config user.email "bartosz.wisniewski@arcsoftware.it"
}

gitsetup() {
  git config --global user.email "kontakt@pr0gramista.pl"
  git config --global user.name "Bartosz Wiśniewski"
  git config --global core.editor micro
}

gitworkamend() {
  git commit --amend --author="Bartosz Wiśniewski <bartosz.wisniewski@arcsoftware.it>"
}

# Undo last commit
gitundo() {
  git reset --soft HEAD~1
}

gitsup() {
  git push --set-upstream origin `git symbolic-ref --short HEAD`
}

buildrunner() {
  flutter pub run build_runner build
}

buildrunnerforce() {
  flutter pub run build_runner build --delete-conflicting-outputs
}

# https://superuser.com/a/1154859
video2gif() {
  ffmpeg -y -i "${1}" -vf fps=${3:-10},scale=${2:-320}:-1:flags=lanczos,palettegen "${1}.png"
  ffmpeg -i "${1}" -i "${1}.png" -filter_complex "fps=${3:-10},scale=${2:-320}:-1:flags=lanczos[x];[x][1:v]paletteuse" "${1}".gif
  rm "${1}.png"
}

edit() {
  code $(fzf)
}

editm() {
  micro $(fzf)
}

cdd() {
  cd $(find . -type d -print | fzf)
}

pro() {
  cd ~/Projekty
}
