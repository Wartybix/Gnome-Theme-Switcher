#!/bin/bash
echo export DBUS_SESSION_BUS_ADDRESS=$DBUS_SESSION_BUS_ADDRESS > .themeSwitcher/lightscript.sh
echo export DBUS_SESSION_BUS_ADDRESS=$DBUS_SESSION_BUS_ADDRESS > .themeSwitcher/darkscript.sh
echo "gsettings set org.gnome.desktop.interface gtk-theme Yaru-light" >> .themeSwitcher/lightscript.sh
echo "gsettings set org.gnome.desktop.interface gtk-theme Yaru-dark" >> .themeSwitcher/darkscript.sh
chmod 755 .themeSwitcher/lightscript.sh
chmod 755 .themeSwitcher/darkscript.sh

currenttime=$(date +%H:%M)
if [[ "$currenttime" > "21:00" ]] || [[ "$currenttime" < "06:00" ]]; then
  ./.themeSwitcher/darkscript.sh
else
  ./.themeSwitcher/lightscript.sh
fi
