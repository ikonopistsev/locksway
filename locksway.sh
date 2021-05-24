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
	PLAYER_STATUS=$(playerctl status 2>&1) 
	if [ "$PLAYER_STATUS" = "Playing" ]; then
		playerctl pause
	fi
	if ! pgrep -nx swaylock > /dev/null 2>&1; then
# standart swaylock
#		swaylock --indicator-radius 80 --ring-color '#268bd2' --color '#2c2c2c' &
# swaylock-effects
		swaylock \
			--screenshots \
			--clock \
			--indicator \
			--indicator-radius 100 \
			--indicator-thickness 7 \
			--effect-blur 7x5 \
			--effect-vignette 0.5:0.5 \
			--ring-color bb00cc \
			--key-hl-color 880033 \
			--line-color 00000000 \
			--inside-color 00000088 \
			--separator-color 00000000 \
			--grace 5 \
			--fade-in 1 &
	fi
	;;
    *)
	echo "Usage: $0 on|off|lock|resume"
	exit 1
        ;;
esac

exit $?
