#!/bin/bash

# this script inspired from https://github.com/raidzero/dotfiles/blob/master/.config/sway/idle/run.sh

LOCK_TIMEOUT=30
let DPMS_TIMEOUT=$LOCK_TIMEOUT+30
let SUSPEND_TIMEOUT=$DPMS_TIMEOUT+30

IDLE=~/.config/sway/idle


swayidle -w \
    timeout $LOCK_TIMEOUT   "$IDLE/lock.sh" \
    timeout $DPMS_TIMEOUT   "$IDLE/output_off.sh" \
        resume 'swaymsg "output * power on"' \
    timeout $SUSPEND_TIMEOUT "$IDLE/suspend.sh" \
    before-sleep 'swaylock -f' 
