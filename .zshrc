# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/dean/.oh-my-zsh

ZSH_THEME="random"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
ZSH_THEME_RANDOM_CANDIDATES=( "superjarin" "minimal" )

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
DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

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
  git
  rails
  lighthouse
)

source $ZSH/oh-my-zsh.sh

# User configuration
alias vim="sudo -E vim"    
alias cl="clear"

clear

compile () { gcc -ggdb -Wall -Werror -O -std=c99 -o "$1" "$2"; }
xcompile() { x86_64-w64-mingw32-gcc -Wall -Werror -O -std=c99 -o "$1" "$2"; }

w       () { cse; cd $COMP/labs/week$1; }
ass     () { cse; cd $COMP/assignments; }

lg      () { exit; logout; }

conf    () {
    if      [ $1 = bash ];      then vim ~/.bashrc; source ~/.bashrc;
    elif    [ $1 = vim ];       then vim ~/.vimrc
    elif    [ $1 = i3 ];        then vim ~/.config/i3/config
    elif    [ $1 = i3status ];  then vim /etc/i3status.conf
    elif    [ $1 = compton ];   then vim /etc/xdg/compton.conf
    elif    [ $1 = pacman ];    then vim /etc/pacman.conf
    elif    [ $1 = zsh ];       then vim ~/.zshrc
    elif    [ $1 = rslsync ];   then vim ~/.config/rslsync/rslsync.conf
    else    echo -e $EERROR"Please enter the name of a valid service"$ECLEAR
    fi
}

shell   () { ssh -X $CSEADD  && clear; }

# $CSEDIR is defined with an argument at the end for use with ssh
COMP="/cse/COMP1521"
CSEDIR="z5122508@cse.unsw.edu.au:/import/kamen/2/z5122508 /cse"
CSEADD="z5122508@login.cse.unsw.edu.au"

cse     () { 
    # probe /cse/* directory for existing instances of a mount 
    # if failed, sshfs not mounted, so mount $CSEDIR drive from server to /cse
    # if failed, recursively unmount incorrectly mounted sshfs & reconnect
    # once finally successful in mounting, change to the mounted directory
    { cd $COMP 2> /dev/null \
        || { sudo sshfs -o allow_other,reconnect $CSEDIR; } \
            || { umount -l /cse; cse; } \
    } && cd /cse;   
}

g2  ()  {
    if      [ $1 = gh ];    then cd ~/GitHub/configs; 
    elif    [ $1 = dl ];    then cd ~/Downloads;
    elif    [ $1 = pg ];    then cd ~/Programs;
    elif    [ $1 = vm ];    then cd ~/.vim/;
    else    echo -e $EERROR"Please enter a valid directory shortcut"$ECLEAR
    fi
}

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
