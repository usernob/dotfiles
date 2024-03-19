#!/bin/bash

# inhibited?
~/.config/sway/idle/inhibitors/pulse.sh || exit 1

swaylock -f
