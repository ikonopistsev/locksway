#!/bin/sh

case "$1" in
    off)
	swaymsg "output * dpms off";
	;;

    on)
	swaymsg "output * dpms on";
	;;

    resume)
	$0 on
	$0 lock
	;;

    lock)
	if ! pgrep -nx swaylock > /dev/null 2>&1; then
		swaylock --indicator-radius 80 --ring-color '#268bd2' --color '#2c2c2c' &
	fi
	;;

    *)
	echo "Usage: $0 on|off|lock|resume"
	exit 1
        ;;
esac

exit $?
