# locksway
sway lock script

Add to sway config
```
exec swayidle -w timeout 300 '~/.config/sway/scripts/locksway.sh lock' \
	timeout 600 '~/.config/sway/scripts/locksway.sh off' \
	resume '~/.config/sway/scripts/locksway.sh resume' \
	before-sleep '~/.config/sway/scripts/locksway.sh lock'
```

and

```
bindsym $mod+Escape exec '~/.config/sway/scripts/locksway.sh lock'
```
