#!/usr/bin/env bash

## Author : Aditya Shakya (adi1090x)
## Mail : adi1090x@gmail.com
## Github : @adi1090x
## Reddit : @adi1090x

rofi_command="rofi -theme themes/network.rasi"

## Get info
IFACE="$(nmcli | grep -i interface | awk '/interface/ {print $2}')"
#SSID="$(iwgetid -r)"
#LIP="$(nmcli | grep -i server | awk '/server/ {print $2}')"
#PIP="$(dig +short myip.opendns.com @resolver1.opendns.com )"
STATUS="$(nmcli radio wifi)"

active=""
urgent=""

if (ping -c 1 archlinux.org || ping -c 1 google.com || ping -c 1 bitbucket.org || ping -c 1 github.com || ping -c 1 sourceforge.net) &>/dev/null; then
	if [[ $STATUS == *"enable"* ]]; then
        if [[ $IFACE == e* ]]; then
            connected=""
        else
            connected=""
        fi
	active="-a 0"
	MSG=" Online"
	PIP="$(dig +short myip.opendns.com @resolver1.opendns.com )"
	fi
else
    urgent="-u 0"
    MSG="Offline"
    PIP="Not Available"
    connected=""
fi

## Icons
bmon=""
launch_cli=""
launch=""

options="$connected\n$bmon\n$launch_cli\n$launch"

## Main
chosen="$(echo -e "$options" | $rofi_command -p "$MSG" -dmenu $active $urgent -selected-row 1)"
case $chosen in
    $connected)
		if [[ $STATUS == *"enable"* ]]; then
			nmcli radio wifi off
		else
			nmcli radio wifi on
		fi 
        ;;
    $bmon)
        termite -e bmon
        ;;
    $launch_cli)
        termite -e nmtui
        ;;
    $launch)
        nm-connection-editor
        ;;
esac
