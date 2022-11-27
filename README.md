KDE screen unlock notification:  
 - `/usr/bin/bash /home/dogu/.screenunlockrc`

KDE screen lock notification:  
 - `/usr/bin/bash /home/dogu/.screenlockrc`

Meta key overview:  
 1. `kwriteconfig5 --file kwinrc --group ModifierOnlyShortcuts --key Meta "org.kde.kglobalaccel,/component/kwin,,invokeShortcut,Overview"`
 2. `qdbus org.kde.KWin /KWin reconfigure`

Enable pipewire:  
 - `systemctl --user enable --now pipewire`

Disable recent:  
```
rm -rf ~/.local/share/recently-used.xbel
mkdir -p ~/.local/share/recently-used.xbel
chmod 0444 ~/.local/share/recently-used.xbel

rm -rf ~/.local/share/RecentDocuments
mkdir -p ~/.local/share/RecentDocuments
chmod 0444 ~/.local/share/RecentDocuments
```
