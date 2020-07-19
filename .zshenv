setopt no_global_rcs

export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0

export PATH="/sbin"
export PATH="/bin:$PATH"
export PATH="/usr/sbin:$PATH"
export PATH="/usr/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/home/kotazuck/.local/bin:$PATH"
export PATH="/home/kotazuck/dev/git/kotazuck/wsl-util/bin:$PATH"
export PATH="$PATH:/mnt/c/Program Files/Docker/Docker/resources/bin"

