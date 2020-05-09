export ZSH=$HOME/.oh-my-zsh
export PATH=$PATH:/usr/java/bin #:$HOME/miniconda2/bin
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
plugins=(git zsh-autosuggestions zsh-syntax-highlighting
         zsh-completions sudo)

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
    relpath=$(pwd | sed "s#$HOME#\$HOME#g")
    parentdir=$(dirname $(pwd) | sed "s#$HOME#\$HOME#g")

    echo "rsync $relpath to $dsthost:$relpath ..."
    if [ -e "$(pwd)/exclude.txt" ] ; then
        rsync -avzP --exclude-from="$(pwd)/exclude.txt" $(pwd) $dsthost:$parentdir
    elif [ -e "$(pwd)/.gitignore" ] ; then
        rsync -avzP --exclude-from="$(pwd)/.gitignore" $(pwd) $dsthost:$parentdir
    else
        rsync -avzP $(pwd) $dsthost:$parentdir
    fi
}
# rsync from source host
rfrom () {
  dsthost=$1
  relpath=$(pwd | sed "s#$HOME#\$HOME#g")
  parentdir=$(dirname $(pwd))

  _log_status "rsync $relpath from $dsthost:$relpath ..."
  if [ -e "$(pwd)/exclude.txt" ] ; then
    rsync -avzP --exclude-from="$(pwd)/exclude.txt" ${dsthost}:${relpath} ${parentdir}
  elif [ -e "$(pwd)/.gitignore" ] ; then
    rsync -avzP --filter=":- $(pwd)/.gitignore" ${dsthost}:${relpath} ${parentdir}
  else
    rsync -avzP ${dsthost}:${relpath} ${parentdir}
  fi
}

# rsync from source host
rfrom () {
  dsthost=$1
  relpath=$(pwd | sed "s#$HOME#\$HOME#g")
  parentdir=$(dirname $(pwd))

  echo "rsync $relpath from $dsthost:$relpath ..."
  if [ -e "$(pwd)/exclude.txt" ] ; then
    rsync -avzP --exclude-from="$(pwd)/exclude.txt" ${dsthost}:${relpath} ${parentdir}
  elif [ -e "$(pwd)/.gitignore" ] ; then
    rsync -avzP --filter=":- $(pwd)/.gitignore" ${dsthost}:${relpath} ${parentdir}
  else
    rsync -avzP ${dsthost}:${relpath} ${parentdir}
  fi
}

list_depends() {
    debname=$1
    apt-cache depends --recurse --no-recommends --no-suggests --no-conflicts --no-breaks --no-replaces --no-enhances ${debname} | grep "^\w" | sort -u
}

dl_depends() {
    debname=$1
    # apt-get download $(list_depends(${debname}))
    apt-get download $(apt-cache depends --recurse --no-recommends --no-suggests --no-conflicts --no-breaks --no-replaces --no-enhances ${debname} | grep "^\w" | sort -u)
    dpkg-scanpackages . | gzip -9c > Packages.gz
}

#ROS
# source /opt/ros/kinetic/setup.zsh
export ZJUDANCER_ROBOTID=2
export ZJUDANCER_GUI=1
export ZJUDANCER_GPU=1

# Set proper editor
if [ -x "$(command -v nvim)" ] ; then
    export EDITOR='nvim'
elif [ -x "$(command -v vim)" ] ; then
    export EDITOR='vim'
else
    export EDOTOR='vi'
fi

export TERM=xterm-256color

# ROS
export ROS_VER='melodic'
if [[ ${ROS_VER} = 'kinetic' || ${ROS_VER} = 'melodic' ]]; then
    alias sr='source /opt/ros/${ROS_VER}/setup.zsh'
    alias rcd='roscd'
    alias e='rosed'
    alias rmk='catkin_make -j4'
    alias rt="catkin_make run_tests"
    alias rpkg='catkin_create_pkg'
    alias rcore='roscore &'
    alias rl='roslaunch'
    alias rr='rosrun'
else
    alias sr='source /opt/ros/${ROS_VER}/setup.zsh'
    alias rcd='roscd'
    alias e='rosed'
    alias rmk='colcon build --symlink-install'
    # alias rt="catkin_make run_tests"
    alias rpkg='ros2 pkg create'
    # alias rcore='roscore &'
    alias rl='roslaunch'
    alias rr='ros2 run'
fi
alias ssr='source ./devel/setup.zsh'
if [ -f "$HOME/dancer-workspace/.zshrc.dancer" ] ; then
    alias sd='source $HOME/dancer-workspace/.zshrc.dancer'
else
    alias sd='source /opt/ros/${ROS_VER}/setup.zsh'
fi
alias hl-kid='cd ~/GameController/build/jar && java -jar GameController.jar'

alias sc='source ~/.zshrc'
alias tks='tmux kill-server'
if [ -x "$(command -v nvim)" ] ; then
    alias v='nvim'
else
    alias v='vim'
fi
alias zc='v ~/.zshrc'
alias t='tmux'
alias ta='tmux attach -t'
alias ssh='ssh -X'
# Conda
alias cona='conda activate'
alias cond='conda deactivate'
if [ -e "$HOME/miniconda3/etc/profile.d/conda.sh" ] ; then
    . $HOME/miniconda3/etc/profile.d/conda.sh
fi

# apt
alias acs='apt-cache search'
alias agi='sudo apt-get install'
alias agu='sudo apt-get update'
alias see-temp='cat /sys/devices/virtual/thermal/thermal_zone*/temp'
alias py='python'
alias py3='python3'
alias cursor='echo -en "\e[?25h'

# Proxy
alias setproxy="export http_proxy=http://127.0.0.1:21170/ && export https_proxy=http://127.0.0.1:21170/ "
alias unsetproxy="unset http_proxy && unset https_proxy"
alias ssh-socks5='export GIT_SSH="$HOME/.ssh/socks5.sh"'
alias ssh-direct='unset GIT_SSH'
alias usv='cd ~/Repo/usv_ws && ssr && rl usv_path usv.launch'

# Cuda path
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:/usr/local/lib:$LD_LIBRARY_PATH
export PATH=/usr/local/cuda/bin:$PATH
# Latex path
export PATH=/usr/local/texlive/2019/bin/x86_64-linux:$PATH
export QT_QPA_PLATFORMTHEME=gtk2

gldir() {
    for dirlist in $(ls) ; do
        if [ -d ${dirlist} ] ; then
            cd ${dirlist}
            echo "\033[36mPulling in ${dirlist}\033[0m"
            git pull
            cd ..
        fi
    done
}
gstdir() {
    for dirlist in $(ls) ; do
        if [ -d ${dirlist} ] ; then
            cd ${dirlist}
            echo "\033[36mStatus in ${dirlist}\033[0m"
            git status
            cd ..
        fi
    done
}
