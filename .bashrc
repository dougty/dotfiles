export EDITOR=nano
export MAKEFLAGS='-j16'
export GOPATH=$HOME/.go
export GPG_TTY=$(tty)

[[ $- != *i* ]] && return

function calc() {
	echo "$*" | bc -l
}

alias copy='rsync -ah --progress'
alias watchdirty='watch -d grep -e Dirty: -e Writeback: /proc/meminfo'

alias ls='ls --group-directories-first --color=auto'
alias ll='ls -laF'

alias grep='grep --color=auto'
alias chnum="stat --format '%a'"

alias gs='git status -su'
alias glo='git log --oneline'
alias gpom='git push -u origin master'

alias explicitpkgs='diff <(pacman -Qqg base-devel) <(pacman -Qqe) | grep -E "^> "'

alias createsink='pactl load-module module-null-sink sink_name=games sink_properties=device.description=Games'
alias loopback='pactl load-module module-loopback source=games.monitor latency_msec=100'
alias stoploopback='pactl unload-module module-loopback && pactl unload-module module-null-sink'


alias kde-logout='qdbus org.kde.ksmserver /KSMServer logout 0 0 0'

function quitfirefox() {
	xdotool search "Mozilla Firefox" windowactivate --sync key --clearmodifiers ctrl+q
	while pgrep firefox; do sleep 0.1; done
}

function dshutdown() {
	quitfirefox
	systemctl poweroff
}

function dreboot() {
	quitfirefox
	systemctl reboot
}

function dlogout() {
	quitfirefox
	kde-logout
}


function fanmax() {
	echo 0 | sudo tee /sys/devices/platform/asus-nb-wmi/hwmon/hwmon5/pwm1_enable
}

function fanauto() {
	echo 2 | sudo tee /sys/devices/platform/asus-nb-wmi/hwmon/hwmon5/pwm1_enable
}

function maxpower() {
	echo "performance" | sudo tee /sys/firmware/acpi/platform_profile
	echo "performance" | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
	nvidia-settings -a [gpu:0]/GPUPowerMizerMode=1
}

function lowpower() {
	echo "balanced" | sudo tee /sys/firmware/acpi/platform_profile
	echo "schedutil" | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
	nvidia-settings -a [gpu:0]/GPUPowerMizerMode=2
}


alias bthon='echo "power on" | bluetoothctl'
alias bthoff='echo "power off" | bluetoothctl'

function bthcon() {
	ADDR=$(echo "devices" | bluetoothctl | sed -n 's/Device \(.*\) .*/\1/p')
	echo "connect $ADDR" | bluetoothctl
}

function bthdis() {
	ADDR=$(echo "devices" | bluetoothctl | sed -n 's/Device \(.*\) .*/\1/p')
	echo "disconnect $ADDR" | bluetoothctl
}


alias steam='echo "wrong account!"'
alias su='echo "use user command instead"'
alias wine='echo "not on this account"'
alias winetricks='echo "not on this account"'

alias gamer='/usr/bin/su - gamer'
alias hero='/usr/bin/su - hero'

function prepusers() {
	xhost +SI:localuser:gamer
	xhost +SI:localuser:hero
	pactl load-module module-native-protocol-tcp listen=127.0.0.1
	nvidia-settings -a [gpu:0]/GPUPowerMizerMode=1
	echo "ready!"
}

function vibrance() {
	nvidia-settings -c :0 -a [gpu:0]/DigitalVibrance[DP-2]=$1
}


PS1='\[\e[93m\]\u\[\e[34m\]@\[\e[35m\]\h \[\e[36m\]\w\[\e[32m\]$\[\e[0m\] '
