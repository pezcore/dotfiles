# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="powerlevel10k/powerlevel10k"

SPACESHIP_PROMPT_ORDER=(
  time          # Time stamps section
  user          # Username section
  host          # Hostname section
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
  exec_time     # Execution time
  line_sep      # Line break
  battery       # Battery level and status
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

SPACESHIP_CHAR_SYMBOL=λ
SPACESHIP_CHAR_SUFFIX=" "
SPACESHIP_TIME_SHOW=true
SPACESHIP_TIME_COLOR=white
SPACESHIP_USER_SHOW=always
SPACESHIP_USER_SUFFIX=""
SPACESHIP_USER_PREFIX=""
SPACESHIP_HOST_PREFIX=%{$fg[yellow]%}@
SPACESHIP_HOST_SHOW=always
SPACESHIP_HOST_COLOR=yellow
SPACESHIP_DIR_TRUNC_REPO=false
SPACESHIP_DIR_PREFIX=""
SPACESHIP_DIR_COLOR=green
SPACESHIP_GIT_BRANCH_COLOR=blue
SPACESHIP_VI_MODE_SHOW=false

export LESS="-RFXS"
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
plugins=(colored-man-pages git archlinux colorize fasd vi-mode fzf zsh-syntax-highlighting pass)
autoload -U compinit && compinit

# User configuration

# echo "Pre source Path is" $PATH
export PATH=~/software/anaconda3/bin:~/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"
cdpath=(. ~ ~/src)

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

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


# some more ls aliases
alias l='lsd -l --group-dirs first'
alias lx='l -X'
alias lt='exa -lbhgFsold --git --time-style=long-iso'
alias ltree='exa -lbhgFT --git --color=always --time-style=long-iso'
alias trc=transmission-remote-cli
alias jnew='dt=$(date +%Y%m%d_%H%M); echo $dt > $dt && gvim $dt'
alias pylab='ipython --pylab'
alias cfn="printf '\e]710;%s\007'"
alias gch="git rev-parse --short HEAD"
alias hd="xxd -a -u"

alias -g :L='| less -S'
alias -g :H='| head'
alias -g :T='| tail'
alias -g :G='| grep'
alias lsext='find . -type f | perl -ne '"'"'print $1 if m/\.([^.\/]+)$/'"'"' | sort -u'

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

note () {
    dt=$(date +%Y%m%d_%H%M)
    echo ${dt}_$1
    nvim ${dt}_$1.md
}

alias glo='git log --format="%C(Yellow)%m%h %Cblue%ad %Cred%<(15,ltrunc)%an %C(auto)%d %s" --date=format:"%a %Y%m%d %H%M%S"'
alias tprint='enscript -b "%D{%Y%m%d %H:%M:%S}|\$n|\$%/\$="'
alias today='date +%Y%m%d'

bindkey -a k up-line-or-beginning-search
bindkey -a j down-line-or-beginning-search

alias todo=todo.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
