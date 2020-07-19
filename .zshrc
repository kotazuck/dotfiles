PROMPT="%F{yellow}%c $ %f"

stty stop undef

# sudo command
SUDO=''
if [ ${EUID:-${UID}} -ne 0 ];then
  SUDO='sudo'
  PROMPT="%F{cyan}%c $ %f"
fi


# main user
MAIN_USER='kotazuck'
MAIN_USER_HOME="/home/$MAIN_USER"


alias ..='cd ..'

alias ls='ls -alF'
alias rm='rm -r'
alias cp='cp -r'
alias scp='scp -r'
alias mkdir='mkdir -p'

# ip
alias ipaddr='ip addr | grep -o -E "inet.*eth0" | sed -e "s/inet\s\+\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\).\+eth0/\1/"'

# win hosts
alias winhosts='vim  /mnt/c/Windows/System32/drivers/etc/hosts'

alias zshrc="export ZSHRC_LOADED=0; vim $HOME/dotfiles/.zshrc; source $HOME/dotfiles/.zshrc"
alias zshenv="vim $HOME/dotfiles/.zshenv; source $HOME/dotfiles/.zshenv"
alias bashrc="zshrc"
alias bashenv="zshenv"

# vim
NVIM_CONFIG_FILE="$MAIN_USER_HOME/.config/nvim/init.vim"
alias vi="/usr/bin/vim -u $NVIM_CONFIG_FILE"
alias vicf="vi $(dirname $NVIM_CONFIG_FILE)"

alias vim="/usr/bin/vim -u $NVIM_CONFIG_FILE"
alias vimcf="vim $(dirname $NVIM_CONFIG_FILE)"

which nvim >/dev/null 2>&1
if [ $? -eq 0 ]; then
  alias vim="nvim -u $NVIM_CONFIG_FILE"
  alias vimcf="vim $(dirname $NVIM_CONFIG_FILE)"
fi

# ssh
alias sshcf='vim ~/.ssh/config'

# docker
alias d='docker'
alias dc='docker-compose'

# mysql container
MYSQL_DOCKER_COMPOSE="$MAIN_USER_HOME/dev/docker/mysql/docker-compose.yml"
alias mysql1="dc -f $MYSQL_DOCKER_COMPOSE up -d"
alias mysql0="dc -f $MYSQL_DOCKER_COMPOSE down"

# apache2
alias a2="$SUDO apache2ctl"
alias a21='a2 start'
alias a20='a2 stop'
alias a2re='a2 restart'
alias a2cf="$SUDO vim /etc/apache2"

# tmux
alias tmux-default='tmux new-session -t default'
alias tmuxcf='vim ~/.tmux.conf'

if [ -z "$TMUX" ]; then
  tmux new-session -t default
fi

# start some daemon
startd() {
  echo "start mysql"
  mysql1
  echo "start win-hosts-setup"
  win-hosts-setup >/dev/null
  echo "start apache2"
  a21
}

# stop some daemon
stopd() {
  echo "stop mysql"
  mysql0
  echo "stop apache2"
  a20
}

export DOWNLOADS='/mnt/c/Users/mailo/Downloads'

