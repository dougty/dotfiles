eval $(ssh-agent -t 10m)

export DESKTOP_SESSION=plasma
exec startplasma-x11
