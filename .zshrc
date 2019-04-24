export ZSH=$HOME/.oh-my-zsh
export PATH=$PATH:~/.local/bin:/usr/java/bin #:$HOME/miniconda2/bin
export PYTHONPATH=$PYTHONPATH:$HOME/caffe/python
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH


# Set name of the theme to load. Optionally, If you set this to "random"
ZSH_THEME="cxx"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="avit"
#ZSH_THEME="steeef"
#ZSH_THEME="ys"

# Uncomment the following line to use case_sensitive completion.
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

# Uncomment the following line to display red dots whilst waiting for_ completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if_ you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for_ large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if_ you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

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
rto () {
    dsthost=$1
    port=$2
    relpath=$(pwd | sed "s#$HOME#\$HOME#g")
    parentdir=$(dirname $(pwd) | sed "s#$HOME#\$HOME#g")

    echo "rsync $relpath to $dsthost:$relpath ..."
    if [ -e "$(pwd)/exclude.txt" ] ; then
        rsync -avzP --exclude-from="$(pwd)/exclude.txt" -e "ssh -p $port" $(pwd) $dsthost:$parentdir
    else
        rsync -avzP -e "ssh -p $port" $(pwd) $dsthost:$parentdir
    fi
}

#ROS
# source /opt/ros/kinetic/setup.zsh
export ZJUDANCER_ROBOTID=2
export ZJUDANCER_GUI=1
export ZJUDANCER_GPU=0

# Set proper editor
if [ -x "$(command -v nvim)" ] ; then
    export EDITOR='nvim'
elif [ -x "$(command -v vim)" ] ; then
    export EDITOR='vim'
else
    export EDOTOR='vi'
fi

export TERM=xterm-256color
# source $HOME/humanoid/devel/setup.zsh
# source $HOME/humanoid-lib/devel/setup.zsh
# source $HOME/dancer-workspace/workspaces/core/devel/setup.zsh
# source $HOME/dancer-workspace/.zshrc.dancer
alias rcd='roscd'
alias e='rosed'
alias rmk='catkin_make -j4'
alias rt="catkin_make run_tests"
alias rpkg='catkin_create_pkg'
alias rcore='roscore &'
alias rl='roslaunch'
alias rr='rosrun'
alias sc='source ~/.zshrc'
alias sr='source /opt/ros/kinetic/setup.zsh'
if [ -f "$(command -v nvim)" ] ; then
    alias sd='source $HOME/dancer-workspace/.zshrc.dancer'
else
    alias sd='source /opt/ros/kinetic/setup.zsh'
fi
alias tks='tmux kill-server'
alias v='nvim'
alias zc='v ~/.zshrc'
alias setproxy="export ALL_PROXY=socks5://127.0.0.1:2170"
alias unsetproxy="unset ALL_PROXY"
alias t='tmux'
alias ta='tmux attach -t'
alias ssh='ssh -X'
alias cona='conda activate'
alias cond='conda deactivate'
alias hl_kid='cd ~/GameController/build/jar && java -jar GameController.jar'
alias see_temp='cat /sys/devices/virtual/thermal/thermal_zone*/temp'

if [ -e "$HOME/miniconda2/etc/profile.d/conda.sh" ] ; then
    . $HOME/miniconda2/etc/profile.d/conda.sh
fi

# Cuda path
export LD_LIBRARY_PATH=/usr/local/cuda-8.0/lib64:/usr/local/cuda/lib64:$LD_LIBRARY_PATH
export PATH=/usr/local/cuda/bin:$PATH
