[[ $- != *i* ]] && return

alias copy='rsync -ah --progress'
alias ls='ls --group-directories-first --color=auto'
alias ll='ls -laF'
alias grep='grep --color=auto'
alias chnum="stat --format '%a'"

COLOUR="31m"
PS1='\[\e[$COLOUR\]\u\[\e[34m\]@\[\e[35m\]\h \[\e[36m\]\w\[\e[32m\]$\[\e[0m\] '


alias steam='steam > /dev/null 2>&1 &'

export DISPLAY=:0
export PULSE_SERVER=tcp:127.0.0.1

NUMDBUS=$(ps --no-headers -u ${UID} | grep dbus | wc -l)
if [ $NUMDBUS -eq 0 ]; then
	echo "launching dbus..."
	export $(dbus-launch)
	echo $DBUS_SESSION_BUS_PID > .dbus_pid
	echo $DBUS_SESSION_BUS_ADDRESS > .dbus_addr
else
	echo "dbus already running"
	export DBUS_SESSION_BUS_PID=$(cat .dbus_pid)
	export DBUS_SESSION_BUS_ADDRESS=$(cat .dbus_addr)
fi
