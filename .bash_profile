[[ -f ~/.bashrc ]] && . ~/.bashrc

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
	echo "Starting X..."
	sleep 2 && exec startx
fi
