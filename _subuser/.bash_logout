NUMPROC=$(ps --no-headers -u ${UID} | grep -v ps | grep -v grep | grep -v dbus | grep -v gvfs | grep -v at-spi-bus | grep -v bas | wc -l)
if [ $NUMPROC -le 1 ]; then
	echo "killing session..."
	pgrep -u ${UID} dbus | xargs kill
	pgrep -u ${UID} gvfs | xargs kill
	pgrep -u ${UID} at-spi-bus | xargs kill
else
	echo "processes still running, leaving session alive"
fi
